# pip install --user virtualenv
# python -m venv virtualEnv
# .\virtualEnv\Scripts\activate


#pip install -qqq greykite
#pip install dash   // if plotly not showing graph


# Package               Version
# --------------------- -----------
# atomicwrites          1.4.0
# attrs                 21.2.0
# certifi               2021.10.8
# charset-normalizer    2.0.7
# colorama              0.4.4
# convertdate           2.3.2
# cvxpy                 1.1.15
# cycler                0.10.0
# Cython                0.29.24
# decorator             5.1.0
# dill                  0.3.4
# ecos                  2.0.7.post1
# ephem                 4.1
# future                0.18.2
# greykite              0.2.0
# hijri-converter       2.2.2
# holidays              0.11.3.1
# holidays-ext          0.0.7
# idna                  3.3
# iniconfig             1.1.1
# ipython-genutils      0.2.0
# joblib                1.1.0
# jsonschema            4.1.2
# jupyter-core          4.8.1
# kiwisolver            1.3.2
# korean-lunar-calendar 0.2.1
# LunarCalendar-ext     0.0.1
# matplotlib            3.4.3
# nbformat              5.1.3
# numpy                 1.21.3
# osqp                  0.6.1
# overrides             6.1.0
# packaging             21.0
# pandas                1.3.4
# patsy                 0.5.2
# Pillow                8.4.0
# pip                   20.2.3
# plotly                3.10.0
# pluggy                1.0.0
# pmdarima              1.8.3
# py                    1.10.0
# PyMeeus               0.5.11
# pyparsing             3.0.1
# pyrsistent            0.18.0
# pytest                6.2.5
# pytest-runner         5.3.1
# python-dateutil       2.8.2
# pytz                  2021.3
# pywin32               302
# requests              2.26.0
# retrying              1.3.3
# scikit-learn          1.0
# scipy                 1.7.1
# scs                   2.1.4
# setuptools            49.2.1
# six                   1.16.0
# statsmodels           0.13.0
# testfixtures          6.18.3
# threadpoolctl         3.0.0
# toml                  0.10.2
# tqdm                  4.62.3
# traitlets             5.1.0
# typing-utils          0.1.0
# urllib3               1.26.7

# !pip install -qqq pandas
import pandas as pd
import matplotlib.pyplot as plt
from treat_missing_date_and_values import fill_missing_date_value

def print_full(x):
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', 2000)
    pd.set_option('display.float_format', '{:20,.2f}'.format)
    pd.set_option('display.max_colwidth', None)
    print(x)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')
    pd.reset_option('display.width')
    pd.reset_option('display.float_format')
    pd.reset_option('display.max_colwidth')

#dataset importing
df = pd.read_csv('C:\\Users\\User\\Documents\\forecast\\dataset1.csv', parse_dates=['date'])

#df['date'] = df['date'].astype('datetime64')
df['price'] = df['price'].astype('float')
df.rename(columns = {'date': 'date', 'price': 'value'}, inplace = True)
df = df.head(1000)
df = fill_missing_date_value(df)
df.rename(columns = {'date': 'ts', 'value': 'y'}, inplace = True)
# df = df.ffill()
print_full(df)


#greykite imports
from collections import defaultdict
import warnings

warnings.filterwarnings("ignore")

import pandas as pd
import plotly

from greykite.framework.templates.autogen.forecast_config import ForecastConfig
from greykite.framework.templates.autogen.forecast_config import MetadataParam
from greykite.framework.templates.forecaster import Forecaster 
from greykite.framework.templates.model_templates import ModelTemplateEnum
from greykite.framework.utils.result_summary import summarize_grid_search_results



# Create a forecast
# Specifies dataset information
metadata = MetadataParam(
     time_col="ts",  # name of the time column
     value_col="y",  # name of the value column
     freq="D"  #"MS" for Montly at start date, "H" for hourly, "D" for daily, "W" for weekly, etc.
)

forecaster = Forecaster()
result = forecaster.run_forecast_config(
     df=df,
     config=ForecastConfig(
         model_template=ModelTemplateEnum.SILVERKITE.name,
         forecast_horizon=100,  # forecasts 100 steps ahead
         coverage=0.95,  # 95% prediction intervals
         metadata_param=metadata
    )
)

ts = result.timeseries
fig = ts.plot()
plotly.io.show(fig)



# Cross-validation
grid_search = result.grid_search
cv_results = summarize_grid_search_results(
    grid_search=grid_search,
    decimals=2,
    # The below saves space in the printed output. Remove to show all available metrics and columns.
    cv_report_metrics=None,
    column_order=["rank", "mean_test", "split_test", "mean_train", "split_train", "mean_fit_time", "mean_score_time", "params"])
# Transposes to save space in the printed output
cv_results["params"] = cv_results["params"].astype(str)
cv_results.set_index("params", drop=True, inplace=True)
cv_results.transpose()


# Backtest
backtest = result.backtest
fig = backtest.plot()
plotly.io.show(fig)


# backtest evaluation
backtest_eval = defaultdict(list)
for metric, value in backtest.train_evaluation.items():
    backtest_eval[metric].append(value)
    backtest_eval[metric].append(backtest.test_evaluation[metric])
metrics = pd.DataFrame(backtest_eval, index=["train", "test"]).T
print(metrics)



# Forecast
forecast = result.forecast
fig = forecast.plot()
plotly.io.show(fig)

print(forecast.df.head().round(2))



# Model Diagnostics
fig = forecast.plot_components()
plotly.io.show(fig)     # fig.show() if you are using "PROPHET" template

summary = result.model[-1].summary()  # -1 retrieves the estimator from the pipeline
# print(summary)
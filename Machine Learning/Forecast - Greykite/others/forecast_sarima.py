import pandas as pd
import numpy as np

############################################################################
# Import Data
data = pd.read_csv('C:\\Users\\User\\Documents\\forecast\\a10.csv',
                    parse_dates=['date'], index_col='date')
# print(data.columns)
# # df = df.drop(['Open', 'High', 'Low', 'Close', 'Volume'], axis=1)
# # data.columns = ['unnecessary', 'value']
# # data = data.drop(['unnecessary'], axis=1)
# data = data['price']
# data.columns = ['price']
print(data.head())
# print(data)
print(data.shape)


# ############################################################################
# # Compute Seasonal Index
# from statsmodels.tsa.seasonal import seasonal_decompose
# from dateutil.parser import parse

# # multiplicative seasonal component
# result_mul = seasonal_decompose(data['value'][-36:],   # 3 years
#                                 model='multiplicative', 
#                                 extrapolate_trend='freq')

# seasonal_index = result_mul.seasonal[-12:].to_frame()
# seasonal_index['month'] = pd.to_datetime(seasonal_index.index).month

# print(seasonal_index.columns)

# # merge with the base data
# data['month'] = data.index.month
# df = pd.merge(data, seasonal_index, how='left', on='month')
# df.columns = ['value', 'month', 'seasonal_index']
# df.index = data.index  # reassign the index.



############################################################################
#pip install pmdarima
# !pip3 install pyramid-arima
import pmdarima as pm

# Seasonal - fit stepwise auto-ARIMA
smodel = pm.auto_arima(data, start_p=1, start_q=1,
                         test='adf',
                         max_p=3, max_q=3, m=12,
                         start_P=0, seasonal=True,
                         d=None, D=1, trace=True,
                         error_action='ignore',  
                         suppress_warnings=True, 
                         stepwise=True)

smodel.summary()




############################################################################
# Forecast
import matplotlib.pyplot as plt
n_periods = 96
fitted, confint = smodel.predict(n_periods=n_periods, return_conf_int=True)
index_of_fc = pd.date_range(data.index[-1], periods = n_periods, freq='MS')

# make series for plotting purpose
fitted_series = pd.Series(fitted, index=index_of_fc)
lower_series = pd.Series(confint[:, 0], index=index_of_fc)
upper_series = pd.Series(confint[:, 1], index=index_of_fc)

# Plot
plt.plot(data) 
plt.plot(fitted_series, color='darkgreen')
plt.fill_between(lower_series.index, 
                 lower_series, 
                 upper_series, 
                 color='k', alpha=.15)

plt.title("SARIMA - Final Forecast of a10 - Drug Sales")
plt.show()
# Anaconda
# Use conda install gcc to set up gcc. 
# The easiest way to install Prophet is through conda-forge: 
#   conda install -c conda-forge prophet.

# bash
# Install pystan with pip before using pip to install prophet
# pystan>=3.0 is currently not supported
# pip install pystan==2.19.1.1

# pip install prophet


from matplotlib import pyplot
# pip install fbprophet
import fbprophet
from fbprophet import Prophet
import pandas as pd

# print version number
print('Prophet %s' % fbprophet.__version__)

from pandas import read_csv
# load and plot the car sales dataset
path = 'C:\\Users\\User\\Documents\\forecast\\monthly-car-sales.csv'
df = read_csv(path, header=0)
# summarize shape
print(df.shape)
# show first few rows
print(df.head())

# df['Month'] = pd.to_datetime(df['Month'], format='%Y-%m-%d')
# df['Sales'] = df['Sales'].astype("float")

print(df['Month'].dtype)
print(df['Sales'].dtype)

df.plot()
# pyplot.show()

# define the period for which we want a prediction
future = list()
for i in range(1, 30):
	date = '2021-10-%02d' % i
	future.append([date])
future = pd.DataFrame(future)
future.columns = ['ds']
future['ds']= pd.to_datetime(future['ds'])
print(future.head())


# prepare expected column names
df.columns = ['ds', 'y']
df['ds'] = pd.to_datetime(df['ds'], format='%Y-%m-%d')
df['y'] = df['y'].astype("float")

print(df.head())
# df.info()

# define the model
# model = Prophet()
# # fit the model
# model.fit(df)

model = Prophet()
model.fit(df)

forecast = model.predict(future)
forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail()
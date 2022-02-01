import pandas as pd
import numpy as np

############################################################################
# Import Data
df = pd.read_csv('C:\\Users\\User\\Documents\\forecast\\Google_Stock_Price_Train.csv', 
                    parse_dates=['Date'])
# print(df.columns)
df['price'] = (df['High'] + df['Low'])/2
df = df.drop(['Open', 'High', 'Low', 'Close', 'Volume'], axis=1)
df.columns = ['date', 'price']

print(df.columns)
print(df.head())
print(df.tail())
print(df.shape)
df.to_csv('C:\\Users\\User\\Documents\\forecast\\dataset.csv')
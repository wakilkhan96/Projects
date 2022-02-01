import pandas as pd
import numpy as np

############################################################################
# Import Data
df = pd.read_csv('C:\\Users\\User\\Documents\\forecast\\GOOG.csv')
print(df.columns)
df = df.drop(['Open', 'Close', 'Adj Close', 'Volume'], axis=1)
df['price'] = (df['High'] + df['Low'])/2
df.columns = ['date', 'high', 'low', 'price']

print(df.columns)
print(df.head())
print(df.shape)
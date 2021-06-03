# -*- coding: utf-8 -*-
"""
Created on Fri Apr 16 19:40:47 2021

@author: Wakil
"""
import numpy as np
import matplotlib.pyplot as plt


# X = np.arange(0, 30, 1)
# Y  = np.array([2, 2.5, 2.7, 2.9, 3, 2.9, 2.7, 2.5, 2, 1, 0, -1, -2, -2.5, -2.7, -2.9, -3, -2.9, -2.7, -2.5, -2, -1, 0, 1, 2, 2.5, 2.7, 2.9, 3, 2.9])
X = np.arange(0, 23, 1)
Y  = np.array([2.5, 2, 1, 0, -1, -2, -2.5, -2.7, -2.9, -3, -2.9, -2.7, -2.5, -2, -1, 0, 1, 2, 2.5, 2.7, 2.9, 3, 2.9])



print(X, "\n", Y)
print(len(X))
print(len(Y))

plt.plot(X, Y)


###################################### curve_fit ###########################################
import numpy as np
from lmfit import Model

import matplotlib.pyplot as plt

# def sinefunction(x, a, b, c):
#     return a + b * np.sin(x*np.pi/180.0 + c)
def sinefunction(x, freq, amplitude, phase, offset):
    return np.sin(x * freq + phase) * amplitude + offset

smodel = Model(sinefunction)
result = smodel.fit(Y, x=X, amplitude=0, freq=6, phase=0, offset=0)

print(result.fit_report())

plt.plot(X, Y, 'o', label='data')
plt.plot(X, result.best_fit, '*', label='fit')
plt.legend()
plt.show()

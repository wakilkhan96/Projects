# -*- coding: utf-8 -*-



''' author: Jubaida Saima'''
import numpy as np
import matplotlib.pyplot as plt

def standardize_data(y):
    import statistics as stat
    data_mean = stat.mean(y)
    data_stdev = stat.stdev(y)
    y_to_z_data = (y-data_mean)/data_stdev
    
    return y_to_z_data

def condense_data(data):
    new_data = np.zeros( 2*data.size-1, dtype='f')
    print(new_data)
    
    new_data[0] = data[0]
    
    for i in range (1, new_data.size):
        index = int(i/2)
        # print(index)
        if(i%2==1):
            new_data[i] = (data[index] + data[index+1])/2
        else:
            new_data[i] = data[index]

    return new_data

y = np.array([1, 3, 5, 7, 9, 11, 13, 15, 17, 19])
plt.plot(standardize_data(y))
plt.show()
xx = condense_data( y )

print(y)
print(xx)
plt.plot(standardize_data(xx))
plt.show()

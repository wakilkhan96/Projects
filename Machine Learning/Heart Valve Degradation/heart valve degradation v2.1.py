
''' author: Jubaida Saima'''

import numpy as np
import pandas as pd
import os
import pylab as plt


np.set_printoptions(formatter={'float': lambda x: "{0:0.18f}".format(x)})

#cwd = os.getcwd()  # Get the current working directory (cwd)
#files = os.listdir(cwd)  # Get all the files in that directory
#print("Files in %r: %s" % (cwd, files))
#df.count()
#print(df['NFC Sensor Tag Measurement']) 
#print(splited)
#float(string)  
#temp_time = float(splited[0])
#temp_data = float(splited[1]) 
#ds = ndf.iloc[0, 0]#selecting value of row 3 and column 0 (index is started from 0) 
#splited = ds.split()
#print(temp_time," ",temp_data) 

df = pd.read_csv('C:\\Users\\Wakil\\Downloads\\Training_data\\Data_20180731_150635.csv')
print("\n\n -> Initial Dataset\n", df)
ndf = df.loc[2:]#selecting rows from 2nd row to very end

rows = ndf.size
# print("--prev--->",rows)

time = np.zeros(rows, dtype=float)
data = np.zeros(rows, dtype=int)  

for r in range(0, rows):
  ds = ndf.iloc[r, 0]#selecting value of row 3 and column 0 (index is started from 0) 
  splited = ds.split() #list contains data as string
  temp_time = float(splited[0]) #float variable
  temp_data = int(splited[1]) #int variable
  # global time
  # global data
  time[r] = temp_time
  data[r] = temp_data
  #print(time[r]," ",data[r]) 


dataset = pd.DataFrame({'Time': time[:], 'Data': data[:]})
print("\n\n -> New Dataset\n", dataset)

dataset.to_csv('new_dataset.csv')

#dataset.plot()



############## sensor data && standardization ploting######################
from pylab import *

# N = 1000 # number of data points
N = len(dataset)
# print("--new--->",N)
x = dataset['Time'].values
y = dataset['Data'].values




def standardize_data(y):
    import statistics as stat
    data_mean = stat.mean(y)
    data_stdev = stat.stdev(y)
    y_to_z_data = (y-data_mean)/data_stdev
    
    return y_to_z_data

y_to_z_data = standardize_data(y)
#print(z_data)
#plt.plot(x, z_data)

plt.figure(figsize=(10, 10))

plt.subplot(211)
plt.title('Sensor data')
plt.plot(x, y)
plt.subplot(212)
plt.title('Standardized data')
plt.plot(x, y_to_z_data)
plt.suptitle('rescaling original data to new variable Z ')
plt.show()





###################################### curve_fit ###########################################
import numpy as np
from scipy.optimize import curve_fit
import pylab as plt

N = 1000 # number of data points
t = dataset['Time'].values
data = dataset['Data'].values

guess_freq = 6
guess_amplitude = 3*np.std(data)/(2**0.5)
guess_phase = -170
guess_offset = np.mean(data)

p0=[guess_freq, guess_amplitude,
    guess_phase, guess_offset]

# create the function we want to fit
def my_sin(x, freq, amplitude, phase, offset):
    return np.sin(x * freq + phase) * amplitude + offset
    # return  amplitude * np.sin(x * freq + phase)  + offset

# now do the fit
fit = curve_fit(my_sin, t, data, p0=p0)

# we'll use this to plot our first estimate. This might already be good enough for you
data_first_guess = my_sin(t, *p0)

# recreate the fitted curve using the optimized parameters
data_fit = my_sin(t, *fit[0])

plt.figure(figsize=(15, 8))

plt.plot(data)
plt.plot(data_fit, label='after fitting')
# plt.plot(data_first_guess, label='first guess')
plt.legend()
# plt.show()




################## R-square to identify the goodness of fit ################################
from sklearn.metrics import r2_score

R2 = r2_score(y, data_fit)

# Identification of best fit
if R2 > .50:
    print('\nThe curve fit is good with a fit value of ',R2)

################## R-square to identify the goodness of fit ################################
N = len(x) # number of data points
R_2 = 0
def R_square(x, y, data_fit):
    for i in range(0, N):
        Mean = mean(y)
        SSR = np.sum(pow((data_fit[i]-Mean),2))
        SSE = np.sum(pow((y[i]-data_fit[i]),2))
        SST = SSR+SSE
        global R_2
        R_2 += SSR/SST
    return R_2/N

R2 = R_square(x, y, data_fit)

# Identification of best fit
if R2 > .5:
    print('\nThe curve fit is good with a fit value of ',R2)
    
    
    
########################### slicing dataset using sinosoidal extrema ######################################
#################### 29-3-2021 ##############################################

# pyplot.vlines(x, ymin, ymax, colors='k', linestyles='solid', label='', *, data=None, **kwargs)
#  linestyles can be defined using the strings "solid", "dotted", "dashed" or "dashdot".
# data = np.array([-1, 0, 1, 2, 1, 0, -1, -2, -1, 0, 1, 2, 1 ])

############################## find minimas###############################

#######find minimas, way 1 ####################################
# plt.scatter(x, data_fit)
# plt.show()

import matplotlib.pyplot as plt
from scipy.signal import find_peaks

# peaks, _ = find_peaks(data_fit, height=0)
#Local minima of x=dataset are just the local maxima of -x (minus x)
    
lowest_peaks, _ = find_peaks(-data_fit)

######### showing on plot ################
# plt.plot(data_fit)
# plt.plot(lowest_peaks, data_fit[lowest_peaks], ".")

# plt.vlines(x=lowest_peaks, ymin=400, ymax=1000, color="#666666", linestyles='dashed')
for i in range(0, lowest_peaks.size):
    plt.axvline(lowest_peaks[i], color="#666666", linestyle='--')

isArea = 1
for i in range(1, lowest_peaks.size):
    if( isArea%2 == 1 ):
        plt.axvspan(lowest_peaks[i-1], lowest_peaks[i], facecolor="#ECECEC", alpha=0.5)
    isArea = isArea + 1
# plt.plot(np.zeros_like(x), "--", color="gray")
plt.show()



#######find minimas, way 2 #####################################
# from scipy.signal import argrelextrema
# # argrelextrema() returns array as tuples
# #so use only first tuple element at index '0' 
# #like maximums[0] or minimums[0]

# maximums = argrelextrema(data_fit, np.greater)
# # print(maximums)
# minimums = np.array(argrelextrema(data_fit, np.less))
# # print(minimums)

# plt.plot(data_fit)
# # plt.plot(maximums[0], data_fit[maximums[0]], "x")
# # plt.plot(minimums[0], data_fit[minimums[0]], ".")
# plt.vlines(x=minimums[0], ymin=500, ymax=800, color="#666666", linestyles='dashed')
# plt.show()


# lowest_peaks = minimums[0]



############################## slicing ###############################

# We pass slice instead of index like this: array_name[start:end].
# We can also define the step, like this: array_name[start:end:step].


data = dataset['Data'].values
sliced_data = []

print("\n --> Data Size before Slicing = ", data.size)


for i in range(1, lowest_peaks.size):
    # print(lowest_peaks[i-1]," ", lowest_peaks[i], " diff = ", abs(lowest_peaks[i-1]-lowest_peaks[i]) )
    sliced_data.append( data[ lowest_peaks[i-1] : lowest_peaks[i] ] )

# print("Sliced Data = ", sliced_data)
print("    Total Slices = ", len(sliced_data))
print("    Length of First Slice = ", len(sliced_data[0]))



for i in range(0, len(sliced_data)):
    plt.title('Data Slice '+str(i) )
    plt.plot(sliced_data[i])
    plt.show()
    




########## linking and condensing

# def standardize_data(y):
#     import statistics as stat
#     data_mean = stat.mean(y)
#     data_stdev = stat.stdev(y)
#     y_to_z_data = (y-data_mean)/data_stdev
    
#     return y_to_z_data


condensed_data = []
condensed_X_axis_values = []

for i in range(0, len(sliced_data)):
    #
    sd = sliced_data[i] ## sd represents, sliced data
    standardized_sliced_data = standardize_data( sd )
    X_axis_values = np.arange(0, sd.size, 1)
    standardized_X_axis_values = standardize_data(X_axis_values)
    
    for j in range(0, len(sd)):
        condensed_X_axis_values.append(standardized_X_axis_values[j])
        condensed_data.append(standardized_sliced_data[j])
         

print("\n\n --> Condensed Data\n", condensed_data)
plt.title('Condensed Data')
plt.plot(condensed_X_axis_values, condensed_data)
plt.show()





############### calculating phase average using sliced dataset  ##############
def average(sliced_data):
    N = len(sliced_data)
    sum = 0
    avg = 0
    min_array_len = 10000
    for i in range(0, len(sliced_data)):
        min_array_len = min(min_array_len, sliced_data[i].size)
    print("\nmin_array_len = ", min_array_len)
    
    arr = np.zeros(min_array_len, dtype=float)
    
    for i in range(0, min_array_len):
        sum = 0
        for j in range(0, N):
            sum += sliced_data[j][i]
        arr[i] = sum/N
    
    return arr
         
        

phase_average = average(sliced_data)

print("\n\n --> Phase Average values\n", phase_average)
plt.title('Phase average')
plt.plot(phase_average)
plt.show()


############## data standardization of phaseaverage ##########################

def standardize_data(y):
    import statistics as stat
    data_mean = stat.mean(y)
    data_stdev = stat.stdev(y)
    y_to_z_data = (y-data_mean)/data_stdev
    
    return y_to_z_data


standardized_phase_average = standardize_data(phase_average)
# print(standardized_phase_average.size)

X_axis_values = np.arange(0, standardized_phase_average.size, 1)
standardized_X_axis_values = standardize_data(X_axis_values)
# print(standardized_X_axis_values.size)


plt.title('Phase average and data standardization')
plt.plot(standardized_X_axis_values, standardized_phase_average)
plt.show()

print(standardized_X_axis_values, "\n", standardized_phase_average)









############ SVM Classifier ##################
import matplotlib.font_manager
from sklearn import svm



xx, yy = np.meshgrid(np.linspace(-2, 2, 500), np.linspace(-2, 3, 500))

# X_train = standardized_X_axis_values
# Y_train = standardized_phase_average
X_train = condensed_X_axis_values
Y_train = condensed_data

X_test = X_train
Y_test = Y_train

# X_outliers = [4, 6]
# Y_outliers = [6, 5]

XY = []

clf = svm.OneClassSVM(nu=.05, kernel="rbf", gamma=13)

def merged_XY(X, Y):
    arr = []
    for i in range(0, len(X)):
        arr.append([X[i], Y[i]])
    return arr
    
clf.fit(merged_XY(X_train, Y_train))
y_pred_train = clf.predict(merged_XY(X_train, Y_train))
y_pred_test = clf.predict(merged_XY(X_test, Y_test))
# y_pred_outliers = clf.predict(merged_XY(X_outliers, Y_outliers))



# plot the line, the points, and the nearest vectors to the plane
Z = clf.decision_function(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

plt.figure(figsize=(12,7))
plt.title("Novelty Detection")
plt.contourf(xx, yy, Z, levels=np.linspace(Z.min(), 0, 7), cmap=plt.cm.PuBu)
a = plt.contour(xx, yy, Z, levels=[0], linewidths=2, colors='darkred')
plt.contourf(xx, yy, Z, levels=[0, Z.max()], colors='palevioletred')

s = 40
b1 = plt.scatter(X_train, Y_train, c='#6EC235', s=s, edgecolors='k')
# b2 = plt.scatter(X_test, Y_test, c='blueviolet', s=s, edgecolors='k')
# c = plt.scatter(X_outliers, Y_outliers, c='gold', s=s, edgecolors='k')

plt.axis('tight')
plt.xlim((-2, 2))
plt.ylim((-2, 3))
plt.legend([a.collections[0], b1],
            ["learned frontier", "training observations"],
            loc="upper left",
            prop=matplotlib.font_manager.FontProperties(size=11))
# plt.xlabel(
#     "error train: %d/200 ; errors novel regular: %d/40 ; "
#     "errors novel abnormal: %d/40"
#     % (n_error_train, n_error_test, n_error_outliers))
# plt.show()










































































































############################## rough ###############################################
# data = np.array([9, 10, 11, 12, 11, 10, 9, 8, 9, 10, 11, 12, 11, 10, 9, 8 ])

# import matplotlib.pyplot as plt
# from scipy.signal import find_peaks

# peaks, _ = find_peaks(-data)

# plt.plot(data)
# plt.plot(peaks, data[peaks], ".")
# plt.vlines(x=peaks, ymin=0, ymax=20, color="#666666", linestyles='dashed')
# # plt.plot(np.zeros_like(x), "--", color="gray")
# plt.show()


# from scipy.signal import argrelextrema

# maximums = argrelextrema(data, np.greater)
# # print(maximums)
# minimums = np.array(argrelextrema(data, np.less))
# # print(minimums)

# plt.plot(data)
# # plt.plot(maximums[0], data[maximums[0]], "x")
# plt.plot(minimums[0], data[minimums[0]], ".")
# plt.vlines(x=minimums[0], ymin=0, ymax=20, color="#666666", linestyles='dashed')
# plt.show()
############################## rough ###############################################

# diff_sum = 0
# N = lowest_peaks.size-1
# minimums_mean = 0
# for i in range(1, lowest_peaks.size):
#     diff_sum = diff_sum + int(abs(lowest_peaks[i-1]-lowest_peaks[i]))
    
# import math
# minimums_mean = math.ceil(diff_sum/N)
                       


# for i in range(1, lowest_peaks.size):
#     lowest_peaks[i] = lowest_peaks[i-1] + minimums_mean
    
# plt.plot(data)
# plt.plot(data_fit, label='after fitting')
# # plt.plot(data_first_guess, label='first guess')
# plt.vlines(x=lowest_peaks, ymin=400, ymax=1000, color="#666666", linestyles='dashed')
# plt.show()
############################## rough ###############################################








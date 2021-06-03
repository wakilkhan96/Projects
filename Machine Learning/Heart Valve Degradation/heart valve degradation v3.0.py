# -*- coding: utf-8 -*-



''' author: Jubaida Saima'''

import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

np.set_printoptions(formatter={'float': lambda x: "{0:0.18f}".format(x)})


cur_path = os.getcwd()
#This method returns current working directory
print(cur_path)
#Retrieving the images and their labels 

path = os.path.join(cur_path,'Training_data')
print(path)
#output_ex. C:\Users\Jubaida\.spyder-py3\Heart Valve Degradation\Training_data
files = os.listdir(path)
print(files)
#os.listdir(path)
#Return a list containing the names of the entries in the directory given by path.
 # ['Data_20180731_150635.csv', 
 #  'Data_20180731_150911.csv',
 #  'Data_20180731_150935.csv',
 #  'Data_20180731_151000.csv',
 #  'Data_20180731_151119.csv',
 #  'Data_20180731_151142.csv',
 #  'Data_20180731_151206.csv',
 #  'Data_20180731_151408.csv']




global_sliced_data = []

############################# acquiring datasets #############################
Dataset_Num = 0

for csv_files in files:
    #
    fname = csv_files
    # print(fname)
    
    df = pd.DataFrame()
    try:
        df = pd.read_csv( path+'\\'+fname )
        
    except:
        print("Error loading image")
        continue
    
    Dataset_Num = Dataset_Num + 1
    print("--------------------------------------------------------------------")
    print("Dataset ",Dataset_Num, " (", fname, ")")
    print("--------------------------------------------------------------------")
    print("\n\n -> Initial Dataset (", fname, ")\n", df)
    ndf = df.loc[2:] #selecting rows from 2nd row to very end
    
    rows = ndf.size
    # print("--ndf rows--->",ndf.size)
    
    time = np.zeros(rows, dtype=float)
    data = np.zeros(rows, dtype=int)  
    
    for r in range(0, rows):
        ds = ndf.iloc[r, 0]#selecting value of row r and column 0 (index is started from 0) 
        splited = ds.split() #list contains data as string
        temp_time = float(splited[0]) #float variable
        temp_data = int(splited[1]) #int variable
        # global time
        # global data
        time[r] = temp_time
        data[r] = temp_data
        #print(time[r]," ",data[r]) 
    
    
    dataset = pd.DataFrame({'Time': time[:], 'Data': data[:]})
    print("\n\n -> New Dataset (", fname, ")\n", dataset)
    
    
    
    
    ##############  sinusoidal curve fitting & data slicing ###################
    
    X = dataset['Time'].values
    Y = dataset['Data'].values
    
    
    from lmfit import Model
    
    def sinefunction(x, freq, amplitude, phase, offset):
        return np.sin(x * freq + phase) * amplitude + offset
    
    smodel = Model(sinefunction)
    result = smodel.fit(Y, x=X, amplitude=0, freq=0, phase=30, offset=0)
    f_obs = result.best_fit
    f_exp = Y
    chiSquare = sum( (f_obs-f_exp)**2/f_exp )
    
    phase_value = 0
    for phase_value in range(0, 45, 1):
        #
        temp_result = smodel.fit(Y, x=X, amplitude=0, freq=6, phase=phase_value, offset=0)
        f_obs = temp_result.best_fit
        f_exp = Y
        new_chiSquare = sum( (f_obs-f_exp)**2/f_exp )
        
        if(new_chiSquare < chiSquare):
            result = temp_result
            chiSquare = new_chiSquare
    
    
    print(result.fit_report())
    
    
    ##################### Calculating chi-square value ########################
    # this portion is not necessary
    f_obs = result.best_fit
    f_exp = Y
    
    chiSquare = sum( (f_obs-f_exp)**2/f_exp )
    print("\n reduced chi-square value = " + str(chiSquare) )
    print("\n\n\n\n")
    # print(result.best_fit)
    # this portion is not necessary
    ###########################################################################
    
    
    ############### find minimas from best fit to slice data  #################
    from scipy.signal import find_peaks
    
    # peaks, _ = find_peaks(data_fit, height=0)
    #Local minima of x=dataset are just the local maxima of -x (minus x)
    data_fit = result.best_fit
    lowest_peaks, _ = find_peaks(-data_fit)
    
    
    
    plt.figure(figsize=(15, 15))
    
    plt.subplot(211)
    plt.title('Sensor data : Dataset ' + str(Dataset_Num)  + ' (' + fname + ')')
    plt.plot(X, Y)
    plt.subplot(212)
    plt.title('Sinusoidal Fit')
    plt.plot(Y)
    plt.plot(result.best_fit, label='sinusoidal curve fitting')
    
    
    ############### plotting vertical lines and color filling #################
    for i in range(0, lowest_peaks.size):
        plt.axvline(lowest_peaks[i], color="#666666", linestyle='--')
    
    isArea = 1
    for i in range(1, lowest_peaks.size):
        if( isArea%2 == 1 ):
            plt.axvspan(lowest_peaks[i-1], lowest_peaks[i], facecolor="#ECECEC", alpha=0.5)
        isArea = isArea + 1


    #now showing plot(subplot 1 + subplot 2)
    plt.legend()
    plt.show()
    
    
    
    
    
    
    ############################## slicing ###############################
    # We pass slice instead of index like this: array_name[start:end].
    # We can also define the step, like this: array_name[start:end:step].
    
    
    data = dataset['Data'].values
    sliced_data = []
    
    
    for i in range(1, lowest_peaks.size):
        # print(lowest_peaks[i-1]," ", lowest_peaks[i], " diff = ", abs(lowest_peaks[i-1]-lowest_peaks[i]) )
        sliced_data.append( data[ lowest_peaks[i-1] : lowest_peaks[i] ] )
        global_sliced_data.append( data[ lowest_peaks[i-1] : lowest_peaks[i] ] )
    
    # print("Sliced Data = ", sliced_data)
    print("In Dataset ", Dataset_Num, ":")
    print("    Total Slices = ", len(sliced_data))
    print("    Length of First Slice = ", len(sliced_data[0]))
    
    
    
    # for i in range(0, len(sliced_data)):
    #     plt.figure(figsize=(15, 10))
    #     plt.title('Data Slice '+str(i) )
    #     plt.plot(sliced_data[i])
    #     plt.show()
    
    
    


    
    
print("Global Data Slices = ", len(global_sliced_data))    
    

########################## data standardization function ######################
def standardize_data(y):
    print(y)
    import statistics as stat
    data_mean = stat.mean(y)
    data_stdev = stat.stdev(y)
    y_to_z_data = (y-data_mean)/data_stdev
    
    return y_to_z_data
###############################################################################




################################# condensing data #############################

condensed_data = []
condensed_X_axis_values = []

for i in range(0, len(global_sliced_data)):
    #
    sd = global_sliced_data[i] ## sd represents, sliced data
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




#############calculation & data standardization of phaseaverage  ##############

def average(global_sliced_data):
    N = len(global_sliced_data)
    sum = 0
    avg = 0
    min_array_len = 10000
    for i in range(0, len(global_sliced_data)):
        min_array_len = min(min_array_len, global_sliced_data[i].size)
    print("\nmin_array_len = ", min_array_len)
    
    arr = np.zeros(min_array_len, dtype=float)
    
    for i in range(0, min_array_len):
        sum = 0
        for j in range(0, N):
            sum += global_sliced_data[j][i]
        arr[i] = sum/N
    
    return arr
         
        

phase_average = average(global_sliced_data)

standardized_phase_average = standardize_data(phase_average)
# print(standardized_phase_average.size)
X_axis_values = np.arange(0, standardized_phase_average.size, 1)
standardized_X_axis_values = standardize_data(X_axis_values)
# print(standardized_X_axis_values.size)


plt.title('Phase average [standardized data]')
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

clf = svm.OneClassSVM(nu=.05, kernel="rbf", gamma=7)

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

plt.figure(figsize=(15,8))
plt.title("Novelty Detection")
plt.contourf(xx, yy, Z, levels=np.linspace(Z.min(), 0, 7), cmap=plt.cm.PuBu)
a = plt.contour(xx, yy, Z, levels=[0], linewidths=2, colors='darkred')
plt.contourf(xx, yy, Z, levels=[0, Z.max()], colors='palevioletred')

s = 50 #obsevation size
b1 = plt.scatter(X_train, Y_train, c='#6EC235', s=s, edgecolors='k')
# b2 = plt.scatter(X_test, Y_test, c='blueviolet', s=s, edgecolors='k')
# c = plt.scatter(X_outliers, Y_outliers, c='gold', s=s, edgecolors='k')

plt.axis('tight')
plt.xlim((-2, 2))
plt.ylim((-2, 3))
# plt.legend([a.collections[0], b1],
#             ["learned frontier", "training observations"],
#             loc="upper left",
#             prop=matplotlib.font_manager.FontProperties(size=11))
# plt.xlabel(
#     "error train: %d/200 ; errors novel regular: %d/40 ; "
#     "errors novel abnormal: %d/40"
#     % (n_error_train, n_error_test, n_error_outliers))
# plt.show()

  
    
    
    
    
    
    
    
    
    
    
    
    
    
    # #for phase_value in range(-50, 0, 1):
    # reduced chi-square = 5738.43111
    # reduced chi-square = 5474.60565
    # reduced chi-square = 5583.22670
    # reduced chi-square = 5445.25426
    # reduced chi-square = 5508.88715
    # reduced chi-square = 5446.70984
    # reduced chi-square = 5402.23118
    # reduced chi-square = 5480.25451
    
    
    
    
    
    
    
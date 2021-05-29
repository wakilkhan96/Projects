# -*- coding: utf-8 -*-
"""
Created on Thu Feb  4 10:46:28 2021

@author: Wakil
"""

import numpy as np 
import pandas as pd 
import scipy
import matplotlib.pyplot as plt
import cv2
import tensorflow as tf
from PIL import Image
import os
from sklearn.model_selection import train_test_split
from keras.utils import to_categorical
from keras.models import Sequential, load_model
from keras.layers import Conv2D, MaxPool2D, Dense, Flatten, Dropout

data = []
labels = []
classes = 43
cur_path = os.getcwd()
#This method returns current working directory

#Retrieving the images and their labels 
for i in range(classes):
    path = os.path.join(cur_path,'train',str(i))
#output_ex. C:\Users\Wakil\.spyder-py3\Traffic Signs Recognition\train\0
    images = os.listdir(path)
#os.listdir(path)
#Return a list containing the names of the entries in the directory given by path.
#   ['00000_00000_00000.png',
#    '00000_00000_00001.png', 
#   '00000_00000_00002.png', 
#   ... ... ... ... ... ...
#   '00000_00006_00029.png']
    
    for a in images:
        try:
            image = Image.open(path + '\\'+ a)
#The compiler in C, C++, Java, Python and other languages treats 
#the backslash as a special character, called the escape character.
#The backslash itself can be escaped with another backslash.'\\'
            image = image.resize((30,30))
            image = np.array(image)
            #sim = Image.fromarray(image)
#    arr = np.array([[3, 5, 2, 4],
#                   [7, 6, 8, 8],
#                   [1, 6, 7, 7]])
            data.append(image)
            labels.append(i)
        except:
            print("Error loading image")

#Converting lists into numpy arrays
data = np.array(data)
labels = np.array(labels)

print(data.shape, labels.shape)









#Splitting training and testing dataset
X_train, X_test, y_train, y_test = train_test_split(data, labels, test_size=0.2, random_state=42)

print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

#Converting the labels into one hot encoding
y_train = to_categorical(y_train, 43)
y_test = to_categorical(y_test, 43)

print(y_test)
# #Building the model
# model = Sequential()
# model.add(Conv2D(filters=32, kernel_size=(5,5), activation='relu', input_shape=X_train.shape[1:]))
# model.add(Conv2D(filters=32, kernel_size=(5,5), activation='relu'))
# model.add(MaxPool2D(pool_size=(2, 2)))
# model.add(Dropout(rate=0.25))
# model.add(Conv2D(filters=64, kernel_size=(3, 3), activation='relu'))
# model.add(Conv2D(filters=64, kernel_size=(3, 3), activation='relu'))
# model.add(MaxPool2D(pool_size=(2, 2)))
# model.add(Dropout(rate=0.25))
# model.add(Flatten())
# model.add(Dense(256, activation='relu'))
# model.add(Dropout(rate=0.5))
# model.add(Dense(43, activation='softmax'))

# #Compilation of the model
# model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

# epochs = 15
# history = model.fit(X_train, y_train, batch_size=32, epochs=epochs, validation_data=(X_test, y_test))
# model.save("my_model.h5")

# #plotting graphs for accuracy 
# plt.figure(0)
# plt.plot(history.history['accuracy'], label='training accuracy')
# plt.plot(history.history['val_accuracy'], label='val accuracy')
# plt.title('Accuracy')
# plt.xlabel('epochs')
# plt.ylabel('accuracy')
# plt.legend()
# plt.show()

# plt.figure(1)
# plt.plot(history.history['loss'], label='training loss')
# plt.plot(history.history['val_loss'], label='val loss')
# plt.title('Loss')
# plt.xlabel('epochs')
# plt.ylabel('loss')
# plt.legend()
# plt.show()

# #testing accuracy on test dataset
# from sklearn.metrics import accuracy_score

# y_test = pd.read_csv('Test.csv')

# labels = y_test["ClassId"].values
# imgs = y_test["Path"].values

# data=[]

# for img in imgs:
#     image = Image.open(img)
#     image = image.resize((30,30))
#     data.append(np.array(image))

# X_test=np.array(data)

# pred = model.predict_classes(X_test)

# #Accuracy with the test data
# from sklearn.metrics import accuracy_score
# print(accuracy_score(labels, pred))

# model.save("traffic_classifier.h5")
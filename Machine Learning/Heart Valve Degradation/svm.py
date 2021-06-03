# -*- coding: utf-8 -*-
"""
Created on Thu Apr 15 12:01:07 2021

@author: Wakil
"""
"""
==========================================
One-class SVM with non-linear kernel (RBF)
==========================================

An example using a one-class SVM for novelty detection.

:ref:`One-class SVM <svm_outlier_detection>` is an unsupervised
algorithm that learns a decision function for novelty detection:
classifying new data as similar or different to the training set.
"""
print(__doc__)

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager
from sklearn import svm

xx, yy = np.meshgrid(np.linspace(-5, 5, 500), np.linspace(-5, 5, 500))
# plt.plot(xx,yy)
# plt.show()
# Generate train data
# np.random.randn(2, 4)
# array([[-4.49401501,  4.00950034, -1.81814867,  7.29718677],   # random
#        [ 0.39924804,  4.68456316,  4.99394529,  4.84057254]])  # random
# X = 0.3 * np.random.randn(100, 2)
# X_train = np.r_[X + 2, X - 2]
X_train = [[-3, 1], [-2, 0], [-1, -1], [0, 0], [1, 1], [2, 0], [3, -1]]
X_train = np.array(X_train)
print(X_train)
# Generate some regular novel observations
# X = 0.3 * np.random.randn(20, 2)
# X_test = np.r_[X + 2, X - 2]
X_test = [[-1, 1], [-2, 4]]
X_test = np.array(X_test)
# Generate some abnormal novel observations
# X_outliers = np.random.uniform(low=-4, high=4, size=(20, 2))
# print(X_outliers)
X_outliers = [[-3, 5], [-2, -6], [-1, 7], [0, 3], [1, -4], [2, 6], [3, -7]]
X_outliers = np.array(X_outliers)
# fit the model
clf = svm.OneClassSVM(nu=.15, kernel="rbf", gamma=1)
clf.fit(X_train)
y_pred_train = clf.predict(X_train)
y_pred_test = clf.predict(X_test)
y_pred_outliers = clf.predict(X_outliers)
# n_error_train = y_pred_train[y_pred_train == -1].size
# n_error_test = y_pred_test[y_pred_test == -1].size
# n_error_outliers = y_pred_outliers[y_pred_outliers == 1].size

# plot the line, the points, and the nearest vectors to the plane
Z = clf.decision_function(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

plt.figure(figsize=(12,7))
plt.title("Novelty Detection")
plt.contourf(xx, yy, Z, levels=np.linspace(Z.min(), 0, 7), cmap=plt.cm.PuBu)
a = plt.contour(xx, yy, Z, levels=[0], linewidths=2, colors='darkred')
plt.contourf(xx, yy, Z, levels=[0, Z.max()], colors='palevioletred')

s = 40
b1 = plt.scatter(X_train[:, 0], X_train[:, 1], c='white', s=s, edgecolors='k')
b2 = plt.scatter(X_test[:, 0], X_test[:, 1], c='blueviolet', s=s,
                  edgecolors='k')
c = plt.scatter(X_outliers[:, 0], X_outliers[:, 1], c='gold', s=s,
                edgecolors='k')
plt.axis('tight')
plt.xlim((-5, 5))
plt.ylim((-5, 5))
plt.legend([a.collections[0], b1, b2, c],
            ["learned frontier", "training observations",
            "new regular observations", "new abnormal observations"],
            loc="upper left",
            prop=matplotlib.font_manager.FontProperties(size=11))
# plt.xlabel(
#     "error train: %d/200 ; errors novel regular: %d/40 ; "
#     "errors novel abnormal: %d/40"
#     % (n_error_train, n_error_test, n_error_outliers))
# plt.show()


print( clf.predict([[0, .02]]) )







xx, yy = np.meshgrid(np.linspace(0, 14, 500), np.linspace(-4, 9, 500))

X_train = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
Y_train = [1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1]

X_test = [4, 5, 6, 7, 8, 9, 10]
Y_test = [4, 5, 6, 7, 6, 5, 4]

X_outliers = [4, 6]
Y_outliers = [6, 5]

XY = []

clf = svm.OneClassSVM(nu=.15, kernel="rbf", gamma=0.5)

def merged_XY(X, Y):
    arr = []
    for i in range(0, len(X)):
        arr.append([X[i], Y[i]])
    return arr
    
clf.fit(merged_XY(X_train, Y_train))
y_pred_train = clf.predict(merged_XY(X_train, Y_train))
y_pred_test = clf.predict(merged_XY(X_test, Y_test))
y_pred_outliers = clf.predict(merged_XY(X_outliers, Y_outliers))



# plot the line, the points, and the nearest vectors to the plane
Z = clf.decision_function(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

plt.figure(figsize=(12,7))
plt.title("Novelty Detection")
plt.contourf(xx, yy, Z, levels=np.linspace(Z.min(), 0, 7), cmap=plt.cm.PuBu)
a = plt.contour(xx, yy, Z, levels=[0], linewidths=2, colors='darkred')
plt.contourf(xx, yy, Z, levels=[0, Z.max()], colors='palevioletred')

s = 40
b1 = plt.scatter(X_train, Y_train, c='white', s=s, edgecolors='k')
b2 = plt.scatter(X_test, Y_test, c='blueviolet', s=s, edgecolors='k')
c = plt.scatter(X_outliers, Y_outliers, c='gold', s=s, edgecolors='k')

plt.axis('tight')
plt.xlim((0, 14))
plt.ylim((-5, 10))
plt.legend([a.collections[0], b1, b2, c],
            ["learned frontier", "training observations",
            "new regular observations", "new abnormal observations"],
            loc="upper left",
            prop=matplotlib.font_manager.FontProperties(size=11))
# plt.xlabel(
#     "error train: %d/200 ; errors novel regular: %d/40 ; "
#     "errors novel abnormal: %d/40"
#     % (n_error_train, n_error_test, n_error_outliers))
# plt.show()































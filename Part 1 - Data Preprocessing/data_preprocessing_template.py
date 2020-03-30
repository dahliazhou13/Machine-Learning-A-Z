# -*- coding: utf-8 -*-
"""
Created on Sat Mar 28 18:08:57 2020

@author: zhoud
"""

#Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
# importing the dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,3].values

# Taking care of missing data
# Taking care of missing data
# Updated Imputer
from sklearn.impute import SimpleImputer
missingvalues = SimpleImputer(missing_values = np.nan, strategy = 'mean', verbose = 0)
missingvalues = missingvalues.fit(X[:, 1:3])
X[:, 1:3]=missingvalues.transform(X[:, 1:3])

#encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

from sklearn.compose import ColumnTransformer
ct = ColumnTransformer([('encoder', OneHotEncoder(), [0])], remainder='passthrough')
X = np.array(ct.fit_transform(X), dtype=np.float)

labelencoder_Y=LabelEncoder()
y = labelencoder_Y.fit_transform(y)

# Splitting the dataset into the training set and test set
from sklearn.model_selection import train_test_split 
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size = 0.2,random_state = 0)

#Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
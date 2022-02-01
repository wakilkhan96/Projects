import pandas as pd
import numpy as np

############################################################################
def fill_missing_date_value(dataframe):
    ############## fill mising dates->['date] and set values->['value] to -1 ##############
    #pandas dataframe
    df = dataframe

    # Change data types
    df['date'] = pd.to_datetime(df['date'])
    df['date'] = df['date'].astype('datetime64[ns]')
    df['value'] = df['value'].astype('float')

    # set date column as index
    df = df.set_index(df['date'])
    # df = df.head(2)
    # print(df.head())

    # generate all dates between first and last date (inclusive)
    new_date_range = pd.date_range(df.first_valid_index(), df.last_valid_index())
    #drop date column to avoid conflict during reindexing
    df = df.drop(['date'], axis=1)

    # reindexing with all generated dates
    df = df.reindex(new_date_range, fill_value=-1)   #value column will be set
                                                        #to -1 if it did not exist

    # creating a column with all dates
    df['date'] = df.index
    # reseting index
    df.index = [i for i in range(0, len(df))]
    # Now the dataframe is ready to return





    ############## fill mising values->['value] using algorithm ##############
    all_values = df['value'].to_list()
    list_length = len(all_values)
    # print(all_values)

    # zigZag_i = []
    # for i, j in zip(range(0, list_length, +1), range(list_length-1, 0, -1)):
    #     if(i<j): zigZag_i.append(i), zigZag_i.append(j)
    #     elif(i==j): zigZag_i.append(i)
    #     else: break
    # print(zigZag_i)
    #closest 2 neighbour mean method
    if(list_length >= 2): # must be equal or larger than size 2
        for i in range(0, list_length):
            left_pointer = i
            right_pointer = i
            # left_pointer = zigZag_i[i]
            # right_pointer = zigZag_i[i]
            left_value = 0
            right_value = 0

            # while( not reachedBreakingCondition ):
            #     if(all_values[left_pointer]<0.0 and left_pointer-1>=0): left_pointer = left_pointer-1
            #     if(all_values[right_pointer]<0.0 and right_pointer+1<list_length): right_pointer = right_pointer+1
                
            #     if(all_values[left_pointer]>0.0 and all_values[right_pointer]>0.0): break
            #     elif(left_pointer == 0 and right_pointer==list_length-1): break
            #     print(left_pointer, " in loop ", right_pointer)
            #     print(all_values[left_pointer], " in loop ", all_values[right_pointer])
            #     # print(all_values[left_pointer], " in loop ", all_values[right_pointer])
            
            while(all_values[left_pointer]<0.0 and left_pointer-1>=0):
                left_pointer = left_pointer-1
            while(all_values[right_pointer]<0.0 and right_pointer+1<list_length): 
                right_pointer = right_pointer+1
            
            left_value = all_values[left_pointer]
            right_value = all_values[right_pointer]
            if(left_value<0.0): left_value = right_value
            if(right_value<0.0): right_value = left_value
            all_values[i] = (left_value+right_value)/2.00
            # all_values[zigZag_i[i]] = (left_value+right_value)/2.00
            # print(left_value, " - ", right_value)
            # print(all_values)

    # print(all_values)
    # print(len(all_values))


    # Now convert list values->['value'] to value column
    df['value'] = pd.DataFrame({'value': all_values})

    # print(df)
    # print(df.shape)
    # print(df.dtypes)
    return df





# # Import Data
# data = pd.read_csv('C:\\Users\\User\\Documents\\forecast\\a10.csv')
# data = data.head(2)

# a = fill_missing_date_value(data)
















# Package               Version
# --------------------- -----------
# atomicwrites          1.4.0
# attrs                 21.2.0
# backcall              0.2.0
# Brotli                1.0.9
# certifi               2021.10.8
# charset-normalizer    2.0.7
# click                 8.0.3
# colorama              0.4.4
# convertdate           2.3.2
# cvxpy                 1.1.15
# cycler                0.10.0
# Cython                0.29.24
# dash                  2.0.0
# dash-core-components  2.0.0
# dash-html-components  2.0.0
# dash-table            5.0.0
# decorator             5.1.0
# dill                  0.3.4
# ecos                  2.0.7.post1
# ephem                 4.1
# Flask                 2.0.2
# Flask-Compress        1.10.1
# future                0.18.2
# greykite              0.2.0
# hijri-converter       2.2.2
# holidays              0.11.3.1
# holidays-ext          0.0.7
# idna                  3.3
# iniconfig             1.1.1
# ipython               7.28.0
# ipython-genutils      0.2.0
# itsdangerous          2.0.1
# jedi                  0.18.0
# Jinja2                3.0.2
# joblib                1.1.0
# jsonschema            4.1.2
# jupyter-core          4.8.1
# kiwisolver            1.3.2
# korean-lunar-calendar 0.2.1
# LunarCalendar-ext     0.0.1
# MarkupSafe            2.0.1
# matplotlib            3.4.3
# matplotlib-inline     0.1.3
# nbformat              5.1.3
# numpy                 1.21.3
# osqp                  0.6.1
# overrides             6.1.0
# packaging             21.0
# pandas                1.3.4
# parso                 0.8.2
# patsy                 0.5.2
# pickleshare           0.7.5
# Pillow                8.4.0
# pip                   20.2.3
# plotly                5.3.1
# pluggy                1.0.0
# pmdarima              1.8.3
# prompt-toolkit        3.0.21
# psutil                5.8.0
# py                    1.10.0
# Pygments              2.10.0
# PyMeeus               0.5.11
# pyparsing             3.0.1
# pyrsistent            0.18.0
# pytest                6.2.5
# pytest-runner         5.3.1
# python-dateutil       2.8.2
# pytz                  2021.3
# pywin32               302
# requests              2.26.0
# retrying              1.3.3
# scikit-learn          1.0
# scipy                 1.7.1
# scs                   2.1.4
# setuptools            49.2.1
# six                   1.16.0
# statsmodels           0.13.0
# tenacity              8.0.1
# testfixtures          6.18.3
# threadpoolctl         3.0.0
# toml                  0.10.2
# tqdm                  4.62.3
# traitlets             5.1.0
# typing-utils          0.1.0
# urllib3               1.26.7
# wcwidth               0.2.5
# Werkzeug              2.0.2
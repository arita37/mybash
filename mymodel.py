"""
 LightGBm + Logistic regression
  
 pip install fire utilmy


"""
# -*- coding: utf-8 -*-

import os
import pandas as pd
import numpy as np
import sklearn
import scipy
import fire

from lightgbm import LGBMModel, LGBMRegressor, LGBMClassifier
from sklearn.linear_model import LogisticRegression

####################################################################################################
from utilmy import log, log2



def example_lightgbm_lr():
    #!/usr/bin/env python
    # coding: utf-8


    # 链接：[XGBoost和LightGBM的参数以及调参](https://www.jianshu.com/p/1100e333fcab)

    from sklearn.datasets import load_breast_cancer  # breast cancer wisconsin dataset(classification)
    from sklearn.model_selection import train_test_split
    import lightgbm as lgb
    import numpy as np
    from sklearn.linear_model import LogisticRegression


    print('Load data...')
    df = load_breast_cancer()
    X = df.data  # (569, 30)
    y = df.target  # (569,)

    X_train, X_test, y_train, y_test = train_test_split(df.data, df.target, test_size=0.3)


    '''***************************************** GBDT ****************************************'''
    lgb_train = lgb.Dataset(X_train, y_train)
    lgb_eval = lgb.Dataset(X_test, y_test, reference=lgb_train)

    # 参数 —— GBDT
    params = {
        'task': 'train', 
        'boosting_type': 'gbdt', 
        'objective': 'binary', 
        'metric': {'binary_logloss'}, 
        'num_leaves': 63, 
        'num_trees': 100, 
        'learning_rate': 0.01, 
        'feature_fraction': 0.9, 
        'bagging_fraction': 0.8, 
        'bagging_freq': 5, 
        'verbose': 0
    }

    # 模型训练 —— GBDT
    print('Start training —— GBDT...')

    # train
    gbm = lgb.train(params, lgb_train, num_boost_round=100, valid_sets=lgb_train)

    print('Save model —— GBDT...')
    gbm.save_model('model.txt')

    
    # 模型预测 —— GBDT（生成特征向量 —— 训练集/测试集）
    # number of leaves, will be used in feature transformation
    num_leaf = 63
    print('Start predicting —— GBDT（generating feature vectors —— training data）...')

    # predict with leaf index of all trees
    y_train_pred = gbm.predict(X_train,pred_leaf=True)  # (398, 100)

    # feature transformation and write result
    print('Writing transformed training data...')
    transformed_training_matrix = np.zeros([len(y_train_pred),len(y_train_pred[0]) * num_leaf], 
                                        dtype=np.int64)  # (398, 6300)

    for i in range(0,len(y_train_pred)):
        temp_train = np.arange(len(y_train_pred[0])) * num_leaf - 1 + np.array(y_train_pred[i])
        transformed_training_matrix[i][temp_train] += 1

    # for i in range(0,len(y_train_pred)):
    #     for j in range(0,len(y_train_pred[i])):
    #         transformed_training_matrix[i][j * num_leaf + y_train_pred[i][j]-1] = 1



    print('Start predicting —— GBDT（generating feature vectors —— testing data）...')
    # predict with leaf index of all trees
    y_test_pred = gbm.predict(X_test,pred_leaf=True)

    # feature transformation and write result
    print('Writing transformed testing data...')
    transformed_testing_matrix = np.zeros([len(y_test_pred),len(y_test_pred[0]) * num_leaf], 
                                        dtype=np.int64)
    for i in range(0,len(y_test_pred)):
        temp_test = np.arange(len(y_test_pred[0])) * num_leaf - 1 + np.array(y_test_pred[i])
        transformed_testing_matrix[i][temp_test] += 1


        
        
    '''********************************** Logistic Regression ********************************'''
    print("LogIstic Regression Start...")

    lm = LogisticRegression(penalty='l2',C=0.1) # logestic model construction
    lm.fit(transformed_training_matrix,y_train)  # fitting the data

    # training data
    y_pred_label_train = lm.predict(transformed_training_matrix )
    y_pred_est_train = lm.predict_proba(transformed_training_matrix)   # Give the probabilty on each label
    print('number of training data is ' + str(len(y_pred_label_train)))
    print(y_pred_est_train)

    # testing data
    y_pred_label_test = lm.predict(transformed_testing_matrix)
    y_pred_est_test = lm.predict_proba(transformed_testing_matrix)   # Give the probabilty on each label
    print('number of testing data is ' + str(len(y_pred_label_test)))
    print(y_pred_est_test)


###########################################################################################################



####################################################################################################
global model, session


def init(*kw, **kwargs):
    global model, session
    model = Model(*kw, **kwargs)
    session = None

    
   
global num_leaf
num_leaf = 64
    
################################################################################################
def test():
    from sklearn.datasets import load_breast_cancer  # breast cancer wisconsin dataset(classification)
    from sklearn.model_selection import train_test_split
    from sklearn.metrics import roc_auc_score
    
    print('Load data...')
    df = load_breast_cancer()
    X = df.data  # (569, 30)
    y = df.target  # (569,)

    X_train, X_test, y_train, y_test = train_test_split(df.data, df.target, test_size=0.3)
  
    global model
    model = Model()
    fit(X_train, y_train)
    ypred, yproba =     predict(X_test)    
  
    #### Calciualte AUC 
    return roc_auc_score(y_test, np.max(yproba, axis=1))
  
  
  
  
  
  
  
  
  
  
  
class Model(object):
    def __init__(self, model_pars=None, data_pars=None, compute_pars=None):
        self.model_pars, self.compute_pars, self.data_pars = model_pars, compute_pars, data_pars

        self.model_lightgbm = LGBMClassifier()
        self.model_lr  = LogisticRegression(penalty='l2',C=0.1)

        global num_leaf
        num_leaf = 64

          
def data_create_sparse_csr(yleaf_pred,  mode='sparse'):          
    global num_leaf
    
    # feature transformation and write result
    nsample = len(yleaf_pred)
    mdim    = len(yleaf_pred.shape[0]

   if mode == 'dense' :
 
       matrix = np.zeros([nsample, mdim * num_leaf], dtype=np.int32)
       for i in range(0, nsample):
          temp_test = np.arange(len(yleaf_pred[0])) * num_leaf - 1 + np.array(yleaf_pred[i])
           matrix[i][temp_test] += 1

        return matrix

    else:
       matrix = np.zeros([nsample, mdim * num_leaf], dtype=np.int32)
       for i in range(0, nsample):
          temp_test = np.arange(len(yleaf_pred[0])) * num_leaf - 1 + np.array(yleaf_pred[i])
           matrix[i][temp_test] += 1

       return scipy.sparse.coo_matrix(matrix)
        
        
def fit(Xtrain, ytrain, **kw):
    """
    """
    global model, session

    model.model_lightgbm.fit(Xtrain, ytrain)
    yleaf = model.model_lightgbm.predict(Xtrain, pred_leaf=True) 
    
    Xleaf_sparse  = data_create_sparse_csr(yleaf)
    model.model_lr.fit(Xleaf_sparse, ytrain)
    


def predict(Xpred=None, data_pars={}, compute_pars={}, out_pars={}, ):
    global model, session

    yleaf         = model.model_lightgbm.predict(Xpred, pred_leaf=True, )
    Xleaf_sparse  = data_create_sparse_csr(yleaf)
    
    ypred       = model.model_lr.predict(Xleaf_sparse, )
    ypred_proba = model.model_lr.predict_proba(Xleaf_sparse, )    
    return ypred, ypred_proba
  

def reset():
    global model, session
    model, session = None, None

    

def save(path=None, info=None):
    global model, session
    import cloudpickle as pickle
    os.makedirs(path, exist_ok=True)

    filename = "model.pkl"
    pickle.dump(model, open(f"{path}/{filename}", mode='wb'))  # , protocol=pickle.HIGHEST_PROTOCOL )

    filename = "info.pkl"
    pickle.dump(info, open(f"{path}/{filename}", mode='wb'))  # ,protocol=pickle.HIGHEST_PROTOCOL )

    

def load_model(path=""):
    global model, session
    import cloudpickle as pickle
    model0 = pickle.load(open(f"{path}/model.pkl", mode='rb'))

    model = Model()  # Empty model
    model.model = model0.model
    model.model_pars = model0.model_pars
    model.compute_pars = model0.compute_pars
    session = None
    return model, session


        
        
                                     
if __name__ == "__main__":
    print(test())
                                     

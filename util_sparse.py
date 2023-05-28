# -*- coding: utf-8 -*-
"""
pip install fire utilmy 

"""
import os, sys, time, datetime,inspect, json, yaml, gc, glob, pandas as pd, numpy as np
from box import Box

from utilmy.parallel import pd_read_file, pd_read_file2


#### Sparse utilities
from scipy.sparse import coo_matrix, csr_matrix, lil_matrix

###################################################################################
from utilmy import log, log2

def help():
    from utilmy import help_create
    ss = help_create(MNAME)
    print(ss)



###################################################################################
def test_all():
    test1()
 

def test1():
    xdf, nExpectedOnes, genreColNames = test_create_fake_df()
    X = pd_historylist_to_csr(xdf, colslist=genreColNames)
    print('Sparse matrix verified')    


def test_create_fake_df():
    """ Creates a fake dataframe:
        :return: xdf: pd.DataFrame
            userid: int
            genreCol: string: "4343/4343/4545, 4343/4343/4545, 4343/4343/4545, 4343/4343/4545, 4343/4343/4545"
        :return:nExpectedOnes = numUsers * numSubGenre * nlist * nGenreCols
    """
    numUsers = 5
    numSubGenre = 3
    nlist = 4
    nGenreCols = 2
    nExpectedOnes = numUsers * numSubGenre * nlist * nGenreCols

    # Create fake user ids
    userid = [i for i in range(numUsers)]
    
    # Create a fake list of genres (one person)
    genreList = '/'.join([str(x) for x in np.random.randint(10000,9999999,numSubGenre)])
    for i in range(nlist-1):
        genreList += ', ' + '/'.join([str(x) for x in np.random.randint(10000,9999999,numSubGenre)])
    
    # Populate a dataframe with fake data
    df = pd.DataFrame()
    df['userid']  = userid
    df['genreCol1'] = genreList
    df['genreCol2'] = genreList
    
    return (df, nExpectedOnes, ['genreCol1', 'genreCol2'])


###################################################################################################
def pd_historylist_to_csr(df:pd.DataFrame, colslist:list=None, hashSize:int=5000, dtype=np.float32, max_rec_perlist:int=5,
                            min_rec_perlist:int=0, sep_genre=",", sep_subgenre="/"):
    """ Creates Sparse matrix of dimensions:

            Single value  max=i+1, min=i

            ncol: hashsize * (nlist1 + nlist2 + ....)    X    nrows: nUserID
            xdf:  pd.DataFrame
                genreCol: string: "4343/4343/4545, 4343/4343/4545, 4343/4343/4545, 4343/4343/4545, 4343/4343/4545"

            colist:   list of column names containing history list
            hashSize: size of hash space
            return X: scipy.sparse.coo_matrix
    """
    import mmh3
    from scipy.sparse import coo_matrix, csr_matrix, lil_matrix

    ### Ncols = nb of col
    Xcols = hashSize * len(colslist) * (max_rec_perlist-min_rec_perlist)  # top 5 genre for each reclist

    # No. rows for sparse matrix X, N_userid
    Xrows = len(df)

    # Create zeros sparse matrix
    X = lil_matrix((Xrows, Xcols), dtype=dtype)

    bucket = 0 ; ntot=0
    for coli in colslist:
        bucket0 = bucket  ### Store
        recList = df[coli].values
        for idx, genre_list in enumerate(recList):
            if isinstance(genre_list, str): genre_list = genre_list.split(sep_genre)  ### 353/34534,  5435/4345, 

            ### Iterate for each genre in the reclist and reset to base bucket0
            bucket =  bucket0
            for genre in genre_list[min_rec_perlist:max_rec_perlist] :
                for subgenre in genre.split(sep_subgenre):  #### 35345/5435/345345
                    ntot  = ntot + 1
                    colid = mmh3.hash(subgenre.strip(), 42, signed=False) % hashSize
                    X[ (idx, bucket+ colid)] = 1
                bucket += hashSize

    X = csr_matrix( X )
    print('Sparse matrix shape:', X.shape)
    print('Expected no. of Ones: ', ntot )
    print('No. of Ones in the Matrix: ', X.count_nonzero() )
    return X



def pd_to_scipy_sparse_matrix(df):
    """Converts a sparse pandas data frame to sparse scipy csr_matrix.
        df: pandas data frame
        :return: csr_matrix
    """
    import numpy as np
    from scipy.sparse import lil_matrix
    arr = lil_matrix(df.shape, dtype=np.float32)
    for i, col in enumerate(df.columns):
        ix = df[col] != 0
        arr[np.where(ix), i] = 1

    return arr.tocsr()


def np_to_scipy_sparse_matrix(mm, nleaf=64):
    """ list of list with mm[i][j] is index list.


    """
    import numpy as np
    from scipy.sparse import lil_matrix

    mm  = np.array(mm)
    (nsample, mdim) = mm.shape
    mm2 = lil_matrix( (nsample, nleaf * mdim ), dtype=np.float32)    

    for i in range(nsample) :
        for j in range(mdim) :
            idx = mm[ i ][ j ] #### Position of leaf
            mm2[ i, idx] = 1  

    return mm2









#####################################################################################################
def to_float(x):
    try :
        return float(x)
    except :
        return float("NaN")


def to_int(x):
    try :
        return int(x)
    except :
        return float("NaN")


def is_int(x):
    try :
        int(x)
        return True
    except :
        return False    


def is_float(x):
    try :
        float(x)
        return True
    except :
        return False   




###################################################################################################
if __name__ == "__main__":
    import fire
    fire.Fire()






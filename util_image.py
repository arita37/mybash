# -*- coding: utf-8 -*-
"""#
Doc::

   Utils image processing
   ## CLI Command Line

      image h
      image image_remove_background --dirin   --dirout

   ## From python
   form utilmy.images.util_image import image_remove_background



"""
MNAME='images'
import os,io, numpy as np, sys, glob, time, copy, json, functools, pandas as pd
from typing import Union,Tuple,Sequence,List,Any
from box import Box

import io, cv2,  matplotlib, tempfile, skimage
# import  tifffile.tifffile
from PIL import Image
import math
os.environ['MPLCONFIGDIR'] = "/tmp/"

try :
   import diskcache as dc    
   from albumentations.core.transforms_interface import ImageOnlyTransform
except : pass


npArrayLike = Any


#############################################################################################
from utilmy import Dict_none, Int_none,List_none, Path_type
from utilmy import pd_read_file
from utilmy import log, log2




#################################################################################################
##### TESTS  ####################################################################################
def test_all():
    """function test_all        """
    
    log(MNAME)
    test1()
    test2()
    test_diskcache()


def test1():
    """function test"""
    pass


def test2():
    """function test"""
    dirimg = os.getcwd() + "/ztmp/images/"
    image_create_fake(dirout=dirimg, nimages=1, imsize=(60,60), rgb_color = (255, 0, 0) )
    flist = glob.glob(dirimg +"/*")

    ##################################
    for fi in flist:
        log(fi)
        img_np = image_read(fi)
        image_save(img_np, dirfile=  fi.replace(".jpg", "_b.jpg"))
    log('\n\nimage_read, image_save',  glob.glob(dirimg +"/*")[:5])

    #################################
    img_list = image_prep(flist[0], xdim=30, ydim=30, mean=0.5, std=0.5,verbose=True )
    log('\n\nimage_prep', str(img_list)[:100])

       
    img_list = image_prep_many(flist[:3], image_prep_fun= image_prep,  xdim=30, ydim=30, mean=0.5, std=0.5,)
    log('\n\nimage_pre_many', str(img_list)[:100])


    image_prep_multiproc(dirimage_list=flist[:5], image_prep_fun= image_prep,  npool=2,)
    log('\n\nimage_prep_multiproc',)


def test_diskcache():
    import tempfile
    import skimage
    import numpy as np
    # dump some skimage images to a directory to create a cache from
    import skimage.data
    import os
    import glob
    
    images = ('astronaut',
          'binary_blobs',
          'brick',
          'colorwheel',
          'camera',
          'cat',
          'checkerboard',
          'clock',
          'coffee',
          'coins',
          'grass',
          'gravel',
          'horse',
          'logo',
          'page',
          'text',
          'rocket',
          )
    with  tempfile.TemporaryDirectory() as dirin:              
        # print(dirin)
        subdirs = ['1','2','3']
        for d_ in subdirs:
            os.mkdir(os.path.join(dirin,d_))
        with  tempfile.TemporaryDirectory() as dirout:              
            # print(dirout)
            n_images = len(images)
            
            for i,imname in enumerate(images):
                im = getattr(skimage.data,imname)()
                d_ = subdirs[i//int(np.ceil(n_images / len(subdirs)))]
                impath_i = os.path.join(dirin,d_,imname+'.png')
                skimage.io.imsave(impath_i,im)
                
                # break
            
            tag0 = 'dc_tag'
            xdim0 = 256
            ydim0 = 256
            nmax = 10000000
            cache = diskcache_image_createcache(dirin, dirout=dirout, xdim0=xdim0, ydim0=ydim0, tag0= "dc_tag", nmax=nmax, file_exclude="" )
            assert len(cache) == n_images, 'size of the cache is not the same as n_images'
            with  tempfile.TemporaryDirectory() as dircheck:              
                tag = f"{tag0}_{xdim0}_{ydim0}-{nmax}"
                cache2 = diskcache_image_loadcache(db_dir = os.path.join(dirout,f"img_{tag}.cache"))
                assert len(cache2) == len(cache),'loaded cache is not same length as saved cache'
                for k in cache2:
                    assert (cache2[k] == cache[k]).all(),f'caches differ on {k} value'
            #===================================================================================
            # diskcache_image_insert
            # impaths = []
            with  tempfile.TemporaryDirectory() as next_dirin:              
                for i,imname in enumerate(images):
                    im = getattr(skimage.data,imname)()
                    impath_i = os.path.join(next_dirin,imname+'.png')
                    skimage.io.imsave(impath_i,1 - im)
                    # impaths.append(impath_i)
                old_cache_len = len(cache)
                diskcache_image_insert(glob.glob(os.path.join(next_dirin,'*')), db_dir=os.path.join(dirout,f"img_{tag}.cache"))
                new_cache_len = len(cache)
                assert new_cache_len == old_cache_len + len(images),f'cache len after diskcache_image_insert should reflect # of images inserted. expected {old_cache_len + len(images)} got {new_cache_len}'
            #===================================================================================
            # diskcache_image_dumpsample
            # import pdb;pdb.set_trace()
            for j in range(3):
                with  tempfile.TemporaryDirectory() as dirdumpsample:              
                    if j == 0:
                        n_images = 10
                        diskcache_image_dumpsample(db_dir=os.path.join(dirout,f"img_{tag}.cache"), dirout=dirdumpsample, tag=tag, n_images=n_images)        
                        fnames = os.listdir(dirdumpsample)
                        assert len(fnames) <= n_images,f'more than {n_images} dumped'
                        # assert all([f in cache for f in fnames]), f'filenames {fnames} not found cache'
                        #TODO: any better test to verify one of the dumped files matches the cache contents?
                    elif j == 1:
                        img_list = list(cache.iterkeys())[:5]
                        diskcache_image_dumpsample(db_dir=os.path.join(dirout,f"img_{tag}.cache"), dirout=dirdumpsample, tag=tag , img_list=img_list)        
                    elif j == 2:
                        img_list = ['**not_in_cache**']                       
                        try:
                            diskcache_image_dumpsample(db_dir=os.path.join(dirout,f"img_{tag}.cache"), dirout=dirdumpsample, tag=tag , img_list=img_list)                                
                        except KeyError:
                            pass
                        else:
                            assert False,'diskcache_image_dumpsample:key error should have been raised for non existant key'


#################################################################################################
def run_cli():
    import fire
    fire.Fire()



#################################################################################################
#### images storage ###############################################################################
#TODO alternate names/explanation of tag0,xdim0,ydim0 ( why"0" suffix for xdim0 ydim0)
def diskcache_image_createcache(dirin:Path_type="", dirout:Path_type="", xdim0=256, ydim0=256, tag0= "", nmax=10000000, file_exclude="" ):
    """function image_cache_create diskcache backend to Store and Read images very very fast/
    Doc::

        python  $utilmy/images/util_image.py   image_cache_create  --dirin myydir  --dirout   --xdim0 256   --ydim0256  --tag0  "train_a_1000k"

        ### Not used, Only python?3.7  #####################################
        import asyncio
        #TODO: if awaiting, is async helpful?
        async def set_async(key, val):
            loop = asyncio.get_running_loop()
            future = loop.run_in_executor(None, cache.set, key, val)
            result = await future
            return result
        # asyncio.run(set_async('test-key', 'test-value'))

    """
    import cv2, gc, diskcache
    from utilmy.images import util_image

    # globals  for  multprocessed function
    global xdim, ydim
    xdim, ydim = xdim0, ydim0

    log("#### paths  ####################################################################")
    dirin = dirin
    tag      = f"{tag0}_{xdim}_{ydim}-{nmax}"
    db_dir  = dirout + f"/img_{tag}.cache"
    log(dirin, db_dir)


    log("#### Image list  ################################################################")
    image_list = sorted(list(glob.glob(  f'{dirin}/**/*')))
    fexclude   = sorted(list(glob.glob(  f'{file_exclude}')))
    image_list = [  fi  for fi in image_list if fi not in fexclude   ] #TODO: some folders to exclude?
    image_list = image_list[:nmax]
    log('N images', len(image_list))


    ### Multi processoer function Helpfer
    def prepro_image2b(image_path):
        try :
            fname      = str(image_path).split("/")[-1]
            id1        = fname.split(".")[0]
            # print(image_path)

            #TODO: might want to reuse imread in this module?
            image = cv2.imread(image_path)
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            # image = util_image.image_resize_pad(image, (xdim,ydim), padColor=255)
            image = util_image.image_prep_centercrop(image, (245, 245))
            # image = image.astype('float32')
            return image, image_path
            #return [1], "1"

        except :
            ### Nested because of multpriocessing bugs.....
            try :
               # image = image.astype('float32')
               # cache[ fname ] =  image        ### not uulti thread write
               time.sleep(2)  ### Concurrency thread
               return image, image_path
               # return [1], "1"
            except :
               return [],""

    log("#### Converrt to diskcache storage  #############################################")
    #  from diskcache import FanoutCache  ### too much space
    # che = FanoutCache( db_dir, shards=4, size_limit=int(60e9), timeout=9999999 )
    cache = diskcache.Cache(db_dir, size_limit=int(100e9), timeout=9999999 )


    log("#### Load and Covnert  ##########################################################")
    log('Size Before', len(image_list))
    images, labels = image_prep_multiproc(image_list, image_prep_fun= prepro_image2b, npool=32 )


    log(str(images)[:500],  str(labels)[:500],  )
    log("#### Saving disk  ##############################################################")
    for path, img in zip(labels, images) :
       key = os.path.abspath(path)
       key = key.split("/")[-1]
       cache[ key ] =  img
       # asyncio.run(set_async( key , img ))   ##only python 3.7 multi-threading

    log("#### Validate the cache ########################################################")
    #TODO: this is probably done in diskcache_image_check
    # log('size cache', len(cache), db_dir)
    # for i,key in enumerate(cache):
    #    if i > 3 : break
    #    x0 = cache[key]
    #    cv2.imwrite( data_train + f"/check_{i}.png", x0 )
    #    log(key, x0.shape, str(x0)[:50]  )
    return cache


def diskcache_image_loadcache(db_dir:str="db_images.cache"):
    """function image_cache_check
    Args:
        db_dir ( str ) :
    Returns: dictionnary like
    """
    import diskcache as dc
    cache   = dc.Cache(db_dir, size_limit= 100 * 10**9, timeout= 5 )
    log('Nimages', len(cache) )
    return cache


def diskcache_image_insert(dirin_image:str="myimages/", db_dir:str="tmp/", tag="cache1"):
    """function image_cache_save
    Args:
        dirin_image ( str ) :
        db_dir ( str ) :
        tag:
    Returns:

    """
    ##### Write some sample images  from cache #############################
    import diskcache as dc
    cache   = dc.Cache(db_dir, size_limit= 100 * 10**9, timeout= 5 )
    log('Nimages', len(cache) )


    log('### Check writing on disk  ###########################')
    for img_path in dirin_image:
        img = image_read(img_path)
        cache[img_path] = img


def diskcache_image_dumpsample(db_dir:Path_type="db_images.cache", dirout:Path_type="tmp/", tag=None,n_images:int=None, img_list:list =[]):
    """ dump some sample of diskcache images on disk 
    """
    ##### Write some sample images  from cache #############################
    # db_dir = "_70k_clean_nobg_256_256-100000.cache"
    import diskcache as dc
    # cache   = dc.Cache(db_dir, size_limit= 100 * 10**9, timeout= 5 )
    cache   = dc.Cache(db_dir)
    log('Nimages', len(cache) )

    log('### writing on disk  ######################################')
    dir_check = dirout + (f'/{tag}/' if tag else '')
    os.makedirs(dir_check, exist_ok=True)
    if not n_images:
        # if limit on number of images not provided, use inf
        n_images = math.inf
    if not img_list:
        # if list of images not provided, just iterate through the cache
        img_list = cache 
    for i, key in enumerate(img_list) :

        if i > n_images: break
        img = cache[key]
        img = img[:, :, ::-1]
        key2 = key.split("/")[-1]
        cv2.imwrite( dir_check + f"/{i}_{key2}"  , img)
    log( dir_check )




def npz_image_dumpsample(path_npz,  keys=['train'], path="", tag="", n_sample=3, renorm=True):
    """function image_check_npz
    Args:
        path_npz:
        keys:
        path:
        tag:
        n_sample:
        renorm:
    Returns:

    """
    import cv2
    os.makedirs(path, exist_ok=True)
    data_npz = np.load( path_npz  )
    keys     =  data_npz.keys() if keys is None else keys
    print('check', keys, "\n" )
    for key in keys :
      print(key, str(data_npz[key])[:100], "\n")
      for i in range(0, n_sample) :
         try :
           img = data_npz[key][i]
           if renorm :
              img = ( img * 0.5 + 0.5)  * 255
           cv2.imwrite( f"{path}/img_{tag}_{key}_{i}.png", img )
         except :
           pass



###################################################################################################
#### Images readers ###############################################################################
def image_read_iter(dirin_filelist:Union[str, list], **kw):
    """  Read a file into an image object.
    Doc::

        dirin: The path to the file, a URL, or any object
            with a `read` method (such as `io.BytesIO`)
    """
    import tifffile
    image_list = [] 

    def image_single(filepath_or_buffer):
        if filepath_or_buffer.endswith(".tif") or filepath_or_buffer.endswith(".tiff"):
            image = tifffile.imread(filepath_or_buffer)
        else:
            image = cv2.imread(filepath_or_buffer)
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        return image 

    if isinstance(dirin_filelist, np.ndarray):
        return dirin_filelist

    if hasattr(dirin_filelist, "read"):
        image = np.asarray(bytearray(dirin_filelist.read()), dtype=np.uint8)
        image = cv2.imdecode(image, cv2.IMREAD_UNCHANGED)
        return image

    elif isinstance(dirin_filelist, list):       
        flist = dirin_filelist

    elif isinstance(dirin_filelist, str):
        flist = sorted( glob.glob(dirin_filelist) )

    for fi in flist :
        yield image_single(fi)



def image_read2(dirin_filelist:Union[str, list], **kw):
    """  Read a file into an image object
    Args:
        dirin: The path to the file, a URL, or any object
            with a `read` method (such as `io.BytesIO`)
    """
    import tifffile
    image = None
    image_list = [] 

    def image_single(filepath_or_buffer):
        if filepath_or_buffer.endswith(".tif") or filepath_or_buffer.endswith(".tiff"):
            image = tifffile.imread(filepath_or_buffer)
        else:
            image = cv2.imread(filepath_or_buffer)
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        return image 

    if isinstance(dirin_filelist, np.ndarray):
        return [dirin_filelist]

    if hasattr(dirin_filelist, "read"):
        image = np.asarray(bytearray(dirin_filelist.read()), dtype=np.uint8)
        image = cv2.imdecode(image, cv2.IMREAD_UNCHANGED)
        return [image]

    elif isinstance(dirin_filelist, list):        
        for fi in dirin_filelist :
            image_list.append(image_single(fi))

    elif isinstance(dirin_filelist, str):
        flist = sorted( glob.glob(dirin_filelist) )
        for fi in flist :
            image_list.append(image_single(fi))

    return image_list



def image_read(filepath_or_buffer: Union[str, io.BytesIO]):
    """Read a file into an numpy object
    Doc::
    
        filepath_or_buffer: path to file, a URL, or any object
                             with a `read` method (such as `io.BytesIO`)
    """
    import tifffile
    image = None
    if isinstance(filepath_or_buffer, np.ndarray):
        return filepath_or_buffer

    if hasattr(filepath_or_buffer, "read"):
        image = np.asarray(bytearray(filepath_or_buffer.read()), dtype=np.uint8)
        image = cv2.imdecode(image, cv2.IMREAD_UNCHANGED)

    elif isinstance(filepath_or_buffer, str):
        assert os.path.isfile(filepath_or_buffer), (
            "Could not find image at path: " + filepath_or_buffer
        )
        if filepath_or_buffer.endswith(".tif") or filepath_or_buffer.endswith(".tiff"):
            image = tifffile.imread(filepath_or_buffer)
        else:
            image = cv2.imread(filepath_or_buffer)
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    return image

image_load = image_read  ## alias


def image_save(img:npArrayLike, dirfile:str="/myimage.jpeg"):
    """image_save 
    Args:
        img: _description_
        fileout: 
    """
    os.makedirs(  os.path.dirname( os.path.abspath( dirfile    )),  exist_ok=True)
    cv2.imwrite(dirfile, img)    


#################################################################################################
#### Images utils ###############################################################################
def image_show_in_row(image_list:Union[dict,list, None]=None):
    """ helper function for data visualization
    Plot images in one row.
    """
    assert image_list is not None, 'image_list must be a list or dict'
    import matplotlib.pyplot as plt

    if isinstance(image_list, list):
         image_dict = {i:x for (i,x) in enumerate(image_list) }
    else :
         image_dict = image_list

    n = len(image_dict)
    plt.figure(figsize=(16, 5))
    for i, (name, image) in enumerate(image_dict.items()):
        plt.subplot(1, n, i + 1)
        plt.xticks([])
        plt.yticks([])
        plt.title(' '.join(name.split('_')).title())
        plt.imshow(image)
    plt.show()


def image_create_fake(
    dirout=os.getcwd() + "/ztmp/images/",
    nimages=1,
    imsize=(300,300),
    rgb_color = (255, 0, 0)):
    """ create fake image for testing
    """
    import cv2, numpy as np

    width, height = imsize
    os.makedirs(dirout, exist_ok=True)
    ii = 0 ; img_list =[]
    for ii in range(nimages):

        image = np.zeros((height, width, 3), np.uint8)
        color = tuple(reversed(rgb_color))
        image[:] = color

        if dirout is not None :
            cv2.imwrite( dirout + f'img_{ii}.jpg', image)
        else:
            img_list.append(image)
    # will return empty list if a dirout was provided
    return img_list


def image_create_fake2(dirin:Path_type=None):
    """ Fake images on disk /0/ img

    """
    import tempfile, skimage
    images = ('astronaut','binary_blobs', 'brick', 'colorwheel', 'camera', 'cat', 'checkerboard', 'clock', 'coffee', 'coins', 
            #   'eagle', 'grass', 'gravel', 'horse', 'logo', 'page', 'text', 'rocket',
          )

    dirin = tempfile.TemporaryDirectory() if dirin is None else dirin
    os.makedirs(dirin, exist_ok=True)
    subdirs = ['1','2','3']
    for d_ in subdirs:
        os.mkdir(os.path.join(dirin,d_))
        n_images = len(images)
        for i,imname in enumerate(images):
            im = getattr(skimage.data,imname)()
            d_ = subdirs[i//int(np.ceil(n_images / len(subdirs)))]
            dirouti = os.path.join(dirin,d_,imname+'.png')
            log(dirouti)
            skimage.io.imsave( dirouti,im)
            # break





#################################################################################################
#### Transform custom ###########################################################################
def image_custom_resize_mp(dirin:Path_type="", dirout :str =""):
    """   image white color padded
    """
    import cv2, gc, diskcache
    from utilmy.images import util_image

    dirin = dirin
  
    nmax = 500000000
    global xdim, ydim
    xdim = 256
    ydim = 256
    padcolor = 0  ## 0 : black

    os.makedirs(dirout, exist_ok=True)
    log('target folder', dirout)
    time.sleep(5)

    def prepro_image3b(img_path):
        try:
            fname = str(img_path).split("/")[-1]
            id1 = fname.split(".")[0]
            img_path_new = dirout + "/" + fname

            img = cv2.cvtColor(cv2.imread(img_path), cv2.COLOR_BGR2RGB)

            ### for MP needs to reference to file-base images
            img = util_image.image_resize_pad(img, (xdim, ydim), padColor=padcolor)  ### 255 white, 0 for black
            img = img[:, :, ::-1]
            cv2.imwrite(img_path_new, img)
            # print(img_path_new)
            return [1], "1"
        except Exception as e:
            # print(image_path, e)
            return [], ""

    log("#### Process  ######################################################################")
    image_list = sorted(list(glob.glob(f'/{dirin}/*.*')))
    image_list = image_list[:nmax]
    log('Size Before', len(image_list))

    log("#### Saving disk  #################################################################")
    images, labels = image_prep_multiproc(image_list, image_prep_fun=prepro_image3b)
    os_path_check(dirout, n=5)







#################################################################################################
#### Transform in batches #######################################################################
def image_prep_many(image_paths:Sequence[str], image_prep_fun,
    nmax:int=10000000,
    xdim :int=1, ydim :int=1, mean :float = 0.5,std :float    = 0.5)->List[ npArrayLike ]:
    """ run image_prep_fun on multiple images

    """
    images = []
    for i in range(len(image_paths)):
        if i > nmax : break
        image =  image_prep_fun(image_paths[i],  xdim =xdim, ydim =ydim, mean  = mean,std  = std )
        images.append(image)
    return images


def image_prep_multiproc(dirimage_list:list, image_prep_fun=None, npool=1):
    """ Parallel processing for image preparation
    """
    from multiprocessing.dummy import Pool    #### use threads for I/O bound tasks

    pool = Pool(npool)
    res  = pool.map(image_prep_fun, dirimage_list)
    pool.close() ;     pool.join()  ; pool = None

    print('len res', len(res))
    images, labels = [], []
    for (x,y) in res :
        if len(y)> 0 and len(x)> 0 :
            images.append(x)
            labels.append(y)

    print('len images', len(images))
    print(str(labels)[:60])
    return images, labels


def image_merge(image_list :Sequence[npArrayLike], n_dim :int, padding_size, max_height, total_width):
    """
    Args:
        image_list:  list of image
        n_dim:
        padding_size: padding size max
        max_height:   max height
        total_width:  total width
    Returns:
    """
    # create an empty array with a size large enough to contain all the images + padding between images
    if n_dim == 2:
        final_image = np.zeros((max_height, total_width), dtype=np.uint8)
    else:
        final_image = np.zeros((max_height, total_width, 3), dtype=np.uint8)

    current_x = 0  # keep track of where your current image was last placed in the x coordinate
    idx_len = len(image_list) - 1
    for idx, image in enumerate(image_list):
        # add an image to the final array and increment the x coordinate
        height = image.shape[0]
        width = image.shape[1]
        if n_dim == 2:
            final_image[:height, current_x : width + current_x] = image
        else:
            final_image[:height, current_x : width + current_x, :] = image
        # add the padding between the images
        if idx == idx_len:
            current_x += width
        else:
            #TODO @aniket: is padding_size "per image". also is it an int or tuple
            current_x += width + padding_size[idx]

    return final_image, padding_size




#################################################################################################
#### Transform individual #######################################################################
def image_prep(image_path:str, xdim :int=1, ydim :int=1,
    mean :float = 0.5,std :float    = 0.5, verbose=False) -> Tuple[ npArrayLike ,str] :
    """ resizes, crops and centers an image according to provided mean and std
    Args:
        image_path ( str ) :
        xdim:
        ydim:
    Returns:

    """
    try :
        # fname      = str(image_path).split("/")[-1]
        # id1        = fname.split(".")[0]
        # print(image_path)
        image = image_read(image_path)
        image = image_resize_pad(image, (xdim,ydim), padColor=0)
        image = image_prep_centercrop(image, (xdim, ydim))
        assert np.max(image) > 1, "image should be uint8, 0-255"
        image = (image / 255)
        image = (image-mean) /std  # Normalize the image to mean and std
        image = image.astype('float32')
        return image, image_path
    except Exception as e :
        if verbose: log(e)
        return [], ""


def image_prep_centercrop(img:npArrayLike, dim:Tuple[int, int]):
    """Returns center cropped image
    Args:
    img: image to be center cropped
    dim: dimensions (width, height) to be cropped
    Returns:
    crop_img: center cropped image
    """
    width, height = img.shape[1], img.shape[0]

    # process crop width and height for max available dimension
    crop_width = dim[0] if dim[0]<img.shape[1] else img.shape[1]
    crop_height = dim[1] if dim[1]<img.shape[0] else img.shape[0]
    mid_x, mid_y = int(width/2), int(height/2)
    cw2, ch2 = int(crop_width/2), int(crop_height/2)
    crop_img = img[mid_y-ch2:mid_y+ch2, mid_x-cw2:mid_x+cw2]
    return crop_img


def image_prep_addpadding(paddings_number: int = 1, min_padding: int = 1, max_padding: int = 1) -> np.array:
    """
    Args:
        paddings_number:  4
        min_padding:      1
        max_padding:    100
    Returns: padding list
    """
    return np.random.randint(low=min_padding, high=max_padding + 1, size=paddings_number)





###################################################
def image_resize_ratio(img : npArrayLike, width :Int_none =None, height :Int_none =None, inter :int =cv2.INTER_AREA):
    """function image_resize_ratio

    """
    # Resizes a image and maintains aspect ratio
    # Grab the image size and initialize dimensions
    import cv2
    dim = None
    (h, w) = img.shape[:2]

    # Return original image if no need to resize
    if width is None and height is None:
        return img

    # We are resizing height if width is none
    if width is None:
        # Calculate the ratio of the height and construct the dimensions
        r = height / float(h)
        dim = (int(w * r), height)
    # We are resizing width if height is none
    else:
        # Calculate the ratio of the width and construct the dimensions
        r = width / float(w)
        dim = (width, int(h * r))

    # Return the resized image
    return cv2.resize(img, dim, interpolation=inter)


def image_resize(img : npArrayLike, width :Int_none =None, height :Int_none = None, inter=cv2.INTER_AREA):
    """Resizes a image and maintains aspect ratio.
    inter: interpolation method (choose from INTER_NEAREST, INTER_LINEAR, INTER_AREA, INTER_CUBIC,INTER_LANCZOS4)
    """
    # Grab the image size and initialize dimensions
    dim = None
    (h, w) = img.shape[:2]

    # Return original image if no need to resize
    if width is None and height is None:
        return img

    # We are resizing height if width is none
    if width is None:
        # Calculate the ratio of the height and construct the dimensions
        r = height / float(h)
        dim = (int(w * r), height)
    # We are resizing width if height is none
    else:
        # Calculate the ratio of the width and construct the dimensions
        r = width / float(w)
        dim = (width, int(h * r))

    # Return the resized image
    return cv2.resize(img, dim, interpolation=inter)


def image_resize_pad(img :npArrayLike, size : Tuple[Int_none, Int_none]=(None, None), padColor=0, pad :bool =True):
     """resize image while preserving aspect ratio.
     longer side resized to shape, excess space padded

     """
     h, w = img.shape[:2]
     sh, sw = size
     if not pad:
         return image_resize(img, width=sw, height=sh, inter=cv2.INTER_AREA)
     assert (sh is not None)  and (sw is not None) , 'if using padding, the target size must be provided'
     # interpolation method
     if h > sh or w > sw: # shrinking image
         interp = cv2.INTER_AREA

     else: # stretching image
         interp = cv2.INTER_CUBIC

     # aspect ratio of image
     aspect  = float(w)/h
     saspect = float(sw)/sh

     if (saspect > aspect) or ((saspect == 1) and (aspect <= 1)):  # new horizontal image
         new_h = sh
         new_w = np.round(new_h * aspect).astype(int)
         pad_horz = float(sw - new_w) / 2
         pad_left, pad_right = np.floor(pad_horz).astype(int), np.ceil(pad_horz).astype(int)
         pad_top, pad_bot = 0, 0

     elif (saspect < aspect) or ((saspect == 1) and (aspect >= 1)):  # new vertical image
         new_w = sw
         new_h = np.round(float(new_w) / aspect).astype(int)
         pad_vert = float(sh - new_h) / 2
         pad_top, pad_bot = np.floor(pad_vert).astype(int), np.ceil(pad_vert).astype(int)
         pad_left, pad_right = 0, 0

     # set pad color
     if len(img.shape) == 3 and not isinstance(padColor, (list, tuple, np.ndarray)): # color image but only one color provided
         padColor = [padColor]*3

     # scale and pad
     scaled_img = cv2.resize(img, (new_w, new_h), interpolation=interp)
     scaled_img = cv2.copyMakeBorder(scaled_img, pad_top, pad_bot, pad_left, pad_right,
                                     borderType=cv2.BORDER_CONSTANT, value=padColor)

     return scaled_img





##################################################
def image_remove_extra_padding(img :npArrayLike, inverse : bool=False, removedot :bool =True):
    """TODO: Issue with small dot noise points : noise or not ?
              Padding calc has also issues with small blobs.
    Args:
        img: image
    Returns: image cropped of extra padding
    """
    from skimage import morphology
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    if removedot:
        ## TODO : renove hard-coding of filtering params
        min_size = max(1, int(img.shape[1] * 1.1))
        graybin = np.where(gray > 0.1, 1, 0)
        processed = morphology.remove_small_objects(
            graybin.astype(bool), min_size=min_size, connectivity=1
        ).astype(int)
        mask_x, mask_y = np.where(processed == 0)
        gray[mask_x, mask_y] = 0

    if inverse:
        gray = 255 * (gray < 128).astype(np.uint8)  # To invert to white

    coords = cv2.findNonZero(gray)  # Find all non-zero points
    x, y, w, h = cv2.boundingRect(coords)  # Find minimum spanning bounding box
    crop = img[y : y + h, x : x + w]  # Crop the image
    return crop


def image_remove_background(dirin:Path_type= "", dirout:Path_type= "", level:int=1):
    """ Remove background
    Doc::

        pip install rembg
        rembg  -ae 15 -p  img/data/fashion/test2/  img/data/fashion/test_nobg/


    """
    fpaths = glob.glob(dirin + "/*")
    log( str(fpaths)[:10] )

    for fp in fpaths :
        if "." not in fp.split("/")[-1] :  ### only directory
            fp_out = fp.replace(dirin, dirout)
            os.makedirs(fp_out, exist_ok=True)
            cmd = f"rembg   -p {fp}  {fp_out} "    #### no adjustment -ae 15
            log(cmd)
            try :
               os.system( cmd )
            except : pass


def image_remove_humanface(dirin:Path_type= "", level ="/*", dirout:Path_type=f"", npool=30):
    """  Remove face
    Doc::

        python $utilmy/images/util_image.py  image_face_blank

        python $utilmy/images/util_image.py  image_face_blank  --dirin img/data/fashion/test_nobg   --dirout img/data/fashion/test_nobg_noface

        python $utilmy/images/util_image.py  image_face_blank  --dirin img/data/fashion/train_nobg   --dirout img/data/fashion/train_nobg_noface


        five elements are [xmin, ymin, xmax, ymax, detection_confidence]

    """
    import cv2, glob
    import face_detection

    fpaths   = glob.glob(os.path.join(dirin, level))

    detector = face_detection.build_detector( "RetinaNetMobileNetV1",
                            confidence_threshold=.5, nms_iou_threshold=.3)

    log(str(fpaths)[:60])

    def worker(fp):
      try :
          log(fp)
          img   = cv2.imread(fp)
          im    = img[:, :, ::-1]
          areas = detector.detect(im)

          ### list of areas where face is detected.
          for (x0, y0, x1, y1, proba) in areas:
             x0,y0, x1, y1     = int(x0), int(y0), int(x1), int(y1)
             img[y0:y1, x0:x1] = 0

          fout = fp.replace(dirin, dirout)
          os.makedirs( os.path.dirname(fout), exist_ok=True)
          cv2.imwrite( fout, img )
      except : pass


    from multiprocessing.dummy import Pool    #### use threads for I/O bound tasks
    pool = Pool(npool)
    res  = pool.map(worker, fpaths)
    pool.close()
    pool.join()


def image_remove_text(dirin :Path_type, dirout :Path_type, level="*"):
    """ Remove text from background image
    Parameters
    ----------




    """
    import cv2, glob
    from ztext_detector import detect_text_regions


    fpaths  = glob.glob(os.path.join(dirin, level))
    log(str(fpaths)[:60])
    for fp in fpaths :
      try :
          log(fp)
          img   = cv2.imread(fp)
          im    = img[:, :, ::-1]

          areas = detect_text_regions(img)

          ### list of areas where is detected.
          for (x0, y0, x1, y1) in areas:
             x0,y0, x1, y1     = int(x0), int(y0), int(x1), int(y1)
             img[y0:y1, x0:x1] = 0

          fout = fp.replace(dirin, dirout)
          os.makedirs( os.path.dirname(fout), exist_ok=True)
          cv2.imwrite( fout, img )
      except : pass #TODO: code smell:better to handle specific exceptions,



remove_background = image_remove_background




#################################################################################################
#### Donwload images ############################################################################
def download_page_image(query, dirout="query1", genre_en='', id0="", cat="", npage=1) :
    """
        python util_image.py download_page  '    --dirout men_fs_blue
    Parameters
    ----------

    """
    import time, os, json, csv, requests, sys, urllib
    from bs4 import BeautifulSoup as bs
    from urllib.request import Request, urlopen
    import urllib.parse


    path = dirout
    os.makedirs(path, exist_ok=True)
    # os.chdir(path)

    query2     = urllib.parse.quote(query, encoding='utf-8')
    url_prefix = 'httpl/' + query2
    ### https://search.amazon.com/search/mall/%E3%83%A1%E3%8384+blue+/?p=2
    print(url_prefix)
    print(path)

    csv_file   = open( path + 'ameta.csv','w',encoding="utf-8")
    csv_writer = csv.writer(csv_file, delimiter='\t')
    csv_writer.writerow(['path', 'id0', 'cat', 'genre_en', 'image_name', 'price','shop','item_url','page_url',  ])

    page  = 1
    count = 0
    while page < npage+1 :
        try:
            urli = url_prefix  + f"/?p=+{page}"
            req    = Request(url=urli)
            source = urlopen(req).read()
            soup   = bs(source,'lxml')

            print('page', page, str(soup)[:5], str(urli)[-20:],  )

            for individual_item in soup.find_all('div',class_='searchresultitem'):
                count += 1
                save = 0
                shopname     = 'nan'
                count_review = 'nan'

                for names in individual_item.find_all('div',class_='title'):
                    product_name = names.h2.a.text
                    break

                for price in individual_item.find_all('div',class_='price'):
                    product_price = price.span.text
                    product_price = product_price .replace("円", "").replace(",", "")
                    break

                for url in individual_item.find_all('div',class_='image'):
                    product_url = url.a.get('href')
                    break

                for images in individual_item.find_all('div',class_='image'):
                    try:
                        product_image = images.a.img.get('src')
                        urllib.request.urlretrieve(product_image, path + str(count)+".jpg")
                        # upload_to_drive(str(count)+'.jpg')
                        count += 1
                        break
                    except:
                        save = 1
                        print(product_url + " Error Detected")

                for simpleshop in individual_item.find_all('div',class_='merchant'):
                    shopname = simpleshop.a.text
                    break

                for review in individual_item.find_all('a',class_='dui-rating-f ilter'):
                    count_review = review.text

                if save == 0:
                    csv_writer.writerow([str(count)+'.jpg', id0, cat, genre_en,  product_name, product_price, shopname, product_url, urli, ])

        except Exception as e :
            print(e)
            time.sleep(2)
            continue

        page += 1
    print("Success", page-1, count)








##############################################################################################
if 'utils':
    def os_path_check(path, n=5):
        """function os_path_check
        Args:
            path:
            n:
        Returns:

        """
        from utilmy import os_system
        print('top files', os_system( f"ls -U   '{path}' | head -{n}") )
        print('nfiles', os_system( f"ls -1q  '{path}' | wc -l") )


    def run_multiprocess(myfun, list_args, npool=10, **kwargs):
        """ Run multiprocessing for myfun
        res = run_multiprocess(prepro, image_paths, npool=10, )
        """
        from functools import partial
        from multiprocessing.dummy import Pool    #### use threads for I/O bound tasks
        pool = Pool(npool)
        res  = pool.map( partial(myfun, **kwargs), list_args)
        pool.close()
        pool.join()
        return res




###################################################################################################
if __name__ == "__main__":
    import fire
    # fire.Fire()
    test2()









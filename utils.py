# -*- coding: utf-8 -*-
"""
   ### Run in local or colab
      git clone  https://github.com/arita37/mybash.git imgapp
      cd imgapp
      git checkout zbike

   ## Install
       pip install fire utilmy python-box
       pip install reqs.txt

   ### Example:
       python utils.py test10



   Image of bike
   https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fblue-mountain-bike-simple-flat-600w-779290111.jpg&tbnid=GYBAUwP0Mspp7M&vet=10CAoQMyhsahcKEwjAzMWyxcH-AhUAAAAAHQAAAAAQAw..i&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fblue-mountain-bike-simple-flat-design-779290111&docid=hyaAJpgQQ8Xd1M&w=600&h=474&itg=1&q=simple%20bike%20vector%20art&ved=0CAoQMyhsahcKEwjAzMWyxcH-AhUAAAAAHQAAAAAQAw


   https://www.google.com/search?q=simple+bike+vector+art+black+and+white&tbm=isch&chips=q:simple+bike+vector+art+black+and+white,online_chips:clipart:IkZQhZE3-NI%3D&hl=en&sa=X&ved=2ahUKEwjcw9C1xsH-AhWugFYBHf7rCIYQ4lYoAHoECAEQJg&biw=1398&bih=943


"""
import os
import sys

import cv2
import fire
import matplotlib.pyplot as plt
import numpy as np
import webcolors
from box import Box
from PIL import Image
from utilmy import log, os_makedirs

from util_image import image_read, image_save


####################################################################################
def test10():
    log("""### Display the points and labels of the wheels""")
    input_points = np.array([[117, 771], [879, 738], [473, 320]])
    input_labels = np.array([1, 1, 0])

    image = image_read("imgs/bk5.png")

    plt.figure(figsize=(10,10))
    plt.imshow(image)
    mask_show_points(input_points, input_labels, plt.gca())
    plt.axis('on')
    plt.show()


def test11():
    log("""### Read the image and display it""")
    image = cv2.imread('imgs/bik5.png')
    # (optional) resize the image if it is too big
    image = cv2.resize(image, None, fx=0.2, fy=0.2, interpolation=cv2.INTER_AREA)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    plt.figure(figsize=(10,10))
    plt.imshow(image)
    plt.axis('on')
    plt.show()


def test3(dirimg="imgs/", name=""):
    """


    """

    #### Find one image
    from utilmy import glob_glob
    flist = glob_glob(dirimg + "/**/*")
    flist = [fi.replace("\\", "/") for fi in flist]
    flist = [ fi for fi in flist if name in fi.split("/")[-1] ]
    dirimg1 = flist[0]


    image = cv2.imread( dirimg1 )
    image = cv2.resize(image, None, fx=0.2, fy=0.2, interpolation=cv2.INTER_AREA)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


    log("### All   ")
    ddict = bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')
    # ddict['input_points']  ddict['input_labels_id']  ddict['input_labels']
    masks = bike_get_mask_bike(points=ddict['input_points'], labels=ddict['input_labels_id'],
                                     img_dir= dirimg1, dirout="ztmp/out/", method="sam01")

    mask_show_all(image, masks, ddict)



    log("### Left Wheel   ")
    ddict = bike_get_input_points(image, part='right-wheel')
    masks = bike_get_mask_bike(points=ddict['input_points'], labels=ddict['input_labels_id'],
                                     img_dir= dirimg1, dirout="ztmp/out/", method="sam01")

    mask_show_all(image, masks, ddict)




#####################################################################################################
def img_pipe_v0(dirimg="imgs/**/*.png", nmax=5, dry=1, tag="_v0"):
    """

    python utils.py  imp_pipe_v0  ---dirimg imgs/img-black_bike_white_background/*.*  --nmax 500   --tag "_v0"  --dry 1


    iamge are locatd in
          imgs/img-black_bike_white_background/*.*


    """
    from utilmy import date_now, glob_glob, os_makedirs

    from util_image import image_read, image_resize_ratio

    imgfiles = glob_glob(dirimg)
    log('N files', len(imgfiles))
    # log(imgfiles)
    t0 = date_now(fmt="%Y%m%d_%H%M%S")

    for ii, imgfilek in enumerate(imgfiles) :
            img  = image_read(imgfilek)

            img2 = image_invert_colors(img)
            img  = img2 if img2 is not None  else img  ### Inverted from Black background to white one

            img = image_remove_background(img , bgcolor=(255,255,255, 255)) ## white background

            # img = image_resize_ratio(img,       width=64, height= 64)


            #### Save New file
            dirp, dirparent, fname = os_path_split(imgfilek)
            imgfile2 = dirp + f"/{dirparent}{tag}/{fname}"
            os_makedirs(imgfile2)
            if dry != 0 : image_save(img, dirfile=imgfile2)
            log(imgfile2)


def img_pipe_v1(dirimg="imgs/**/*.png", nmax=5, dry=1, tag="_v1"):
    """

    git clone
    pip install -r py38img.txt


    python utils.py  imp_pipe_v1  ---dirimg imgs/img-black_bike_white_background/*.*  --nmax 5


    iamge are locatd in
          imgs/img-black_bike_white_background/*.*


    """
    from utilmy import date_now, glob_glob, os_makedirs

    from util_image import image_read, image_resize_ratio
    from img_check import  classify_image_v2,  classify_image_v1


    imgfiles = glob_glob(dirimg)
    log('N files: ', len(imgfiles))
    t0 = date_now(fmt="%Y%m%d_%H%M%S")


    for ii, imgfilek in enumerate(imgfiles) :
        try :
            img = image_read(imgfilek)

            isok =  classify_image_v2(img)
            if isok ==0 :
                log('bad image, skip', imgfilek)
                continue

            img = image_resize_ratio(img, width=64, height= 64)
            # img = image_png_to_svg4(  png_file_path="",  png_output_file_path="",  xmax=64 , ymax= 64)

            img = image_add_border(img, colorname=color_random_rgb(), bordersize=1)

            img = bike_add_color(img, color_wheels="black", color_bike=color_random_rgb(), )



            #### Save New file
            dirp, dirparent, fname = os_path_split(imgfilek)
            imgfile2 = dirp + f"./{dirparent}_{tag}/{fname}"
            os_makedirs(imgfile2)
            if dry != 0 : image_save(img, dirfile=imgfile2)
            log(imgfile2)


        except Exception as e :
             log(e)
             log(imgfilek)


def img_pipe_v2(dirimg="imgs/**/*.png", dirout="ztmp/img_v1/", 
                nmax=5, dry=0, tag="_v1"):
    """
    git clone
    pip install -r py38img.txt


    python utils.py  img_pipe_v1  ---dirimg "ztmp/img_v0/*"  --nmax 500


    iamge are locatd in
          imgs/img-black_bike_white_background/*.*


    """
    from utilmy import date_now, glob_glob, os_makedirs

    from util_image import image_read, image_resize_ratio
    from img_check import  classify_image_v2,  classify_image_v1, classify_voters


    imgfiles = glob_glob(dirimg)
    log('N files: ', len(imgfiles))
    t0 = date_now(fmt="%Y%m%d_%H%M%S")


    for ii, imgfilek in enumerate(imgfiles) :
        try :
            if ii > nmax: continue
            img = image_read(imgfilek)

            isok =  classify_voters(img, modellist=None)
            if isok ==0 :
                log('bad image, skip', imgfilek)
                continue

            # img = image_resize_ratio(img, width=64, height= 64)
            # img = image_png_to_svg4(  png_file_path="",  png_output_file_path="",  xmax=64 , ymax= 64)
            mask = BikeExtractor(img)
            # img2 = image_invert_colors(img)
            # img  = img2 if img2 is not None  else img  ### Inverted from Black background to white one            
 
            #img = cv2.cvtColor(img, cv2.COLOR_GRAY2RGB)
            #img[:,:,0] = img[:,:,0] * 25

            # Create a red background image
            red_background = np.zeros_like(img)
            red_background[:, :, 0] = np.random.randint(40, 100)

            # Merge the image with the mask and red background
            result = cv2.bitwise_and(img, img, mask=mask)
            img = cv2.add(result, cv2.bitwise_and(red_background, red_background, mask=cv2.bitwise_not(mask)))



            img = image_add_border(img, colorname=color_random_rgb(), bordersize=30)

            # img = bike_add_color(img, color_wheels="black", color_bike="black", )



            #### Save New file
            dirp, dirparent, fname = os_path_split(imgfilek)
            # imgfile2 = dirout + f"./{dirparent}_{tag}/{fname}"
            imgfile2 = dirout + f"/{fname}"

            os_makedirs(imgfile2)
            if dry != 1 : image_save(img, dirfile=imgfile2)
            log(imgfile2)


        except Exception as e :
             log(e)
             log(imgfilek)


def BikeExtractor(frame):
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    img = frame
    # Histogram Analysis------------------------------------------
    bins = np.zeros(256, np.int32)
    L1 = round(img.shape[0]/4)
    L2 = round(img.shape[0]-img.shape[0]/4)
    L3 = round(img.shape[1]/4)
    L4 = round(img.shape[1]-img.shape[1]/4)
    for i in range(L1,L2): # use loop for extracting the histogram data
        for j in range(L3,L4):
            intensity = img[i,j,2]
            bins[intensity] += 1

    # Analysis of Corner of Image---------------------------------
    L = len(hsv[0])
    L_10p = round(L/10) # 10% of the actual length from corner
    four_v = [np.sum(hsv[L_10p:L_10p+5,L_10p:L_10p+5,2])/25,
              np.sum(hsv[L_10p:L_10p+5,L-L_10p:L-L_10p-5,2])/25,
              np.sum(hsv[L-L_10p:L-L_10p-5,L_10p:L_10p+5,2])/25,
              np.sum(hsv[L-L_10p:L-L_10p-5,L-L_10p:L-L_10p-5,2])/25]
    
    vmax_corner = round(np.max(four_v))
    vmid_corner = round(np.mean(four_v))

    
    # Use 3 Strategies for dark/ light/ mid-graybackground--------
    hmin = 0
    hmax = 180
    smin = 0
    smax = 255
    vmin = 0
    vmax = 255
    
    InverseFlag = False
    if(vmax_corner<100):
        #dark
        vmin = vmax_corner*2 - round(vmid_corner*1.7)
        vmax = 255
    elif(vmax_corner>200):
        #light
        vmin = 0
        vmax = vmax_corner - vmid_corner
    else:
        #mid
        vmin = vmid_corner*2
        vmax = vmax_corner + vmid_corner
        InverseFlag = True

    A1 =  round(np.sum(bins[0:45]) / ((img.shape[0]*img.shape[1]/2)/5),2)
    A2 =  round(np.sum(bins[-45:]) / ((img.shape[0]*img.shape[1]/2)/5),2)
    
    if (A1 + A2) > 1 and vmax_corner<220 and vmax_corner> 80:
        vmin = vmid_corner*2
        vmax = vmax_corner + vmid_corner
        InverseFlag = True

    
    # Extract the Bike with HSV-------------------------------------
    lower_hsv = np.array([hmin, smin, vmin])
    upper_hsv = np.array([hmax, smax, vmax])
    
    mask = cv2.inRange(hsv, lower_hsv, upper_hsv) # extract mask

    if not InverseFlag:
        mask2 = mask.copy()
        for i in range(len(mask)):
            for j in range(len(mask[0])):
                mask2[i,j] = 255 if mask[i,j]==0 else 0
        mask = mask2.copy()
        
    # res = cv2.bitwise_and(frame, frame, mask = mask)# Extract bike from image - turn background black
    return mask




def BikeExtractor2(frame):
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    img = frame
    # Histogram Analysis------------------------------------------
    bins = np.zeros(256, np.int32)
    L1 = round(img.shape[0]/4)
    L2 = round(img.shape[0]-img.shape[0]/4)
    L3 = round(img.shape[1]/4)
    L4 = round(img.shape[1]-img.shape[1]/4)
    for i in range(L1,L2): # use loop for extracting the histogram data
        for j in range(L3,L4):
            intensity = img[i,j,2]
            bins[intensity] += 1

    # Analysis of Corner of Image---------------------------------
    L = len(hsv[0])
    L_10p = round(L/10) # 10% of the actual length from corner
    four_v = [np.sum(hsv[L_10p:L_10p+5,L_10p:L_10p+5,2])/25,
              np.sum(hsv[L_10p:L_10p+5,L-L_10p:L-L_10p-5,2])/25,
              np.sum(hsv[L-L_10p:L-L_10p-5,L_10p:L_10p+5,2])/25,
              np.sum(hsv[L-L_10p:L-L_10p-5,L-L_10p:L-L_10p-5,2])/25]
    
    vmax_corner = round(np.max(four_v))
    vmid_corner = round(np.mean(four_v))

    
    # Use 3 Strategies for dark/ light/ mid-graybackground--------
    hmin = 0
    hmax = 180
    smin = 0
    smax = 255
    vmin = 0
    vmax = 255
    
    InverseFlag = False
    if(vmax_corner<100):
        #dark
        vmin = vmax_corner*2 - round(vmid_corner*1.7)
        vmax = 255
    elif(vmax_corner>200):
        #light
        vmin = 0
        vmax = vmax_corner - vmid_corner
    else:
        #mid
        vmin = vmid_corner*2
        vmax = vmax_corner + vmid_corner
        InverseFlag = True

    A1 =  round(np.sum(bins[0:45]) / ((img.shape[0]*img.shape[1]/2)/5),2)
    A2 =  round(np.sum(bins[-45:]) / ((img.shape[0]*img.shape[1]/2)/5),2)
    
    if (A1 + A2) > 1 and vmax_corner<220 and vmax_corner> 80:
        vmin = vmid_corner*2
        vmax = vmax_corner + vmid_corner
        InverseFlag = True
        # InverseFlag = False        

    
    # Extract the Bike with HSV-------------------------------------
    lower_hsv = np.array([hmin, smin, vmin])
    upper_hsv = np.array([hmax, smax, vmax])
    
    mask = cv2.inRange(hsv, lower_hsv, upper_hsv) # extract mask

    if InverseFlag:
        mask2 = mask.copy()
        for i in range(len(mask)):
            for j in range(len(mask[0])):
                mask2[i,j] = 255 if mask[i,j]==0 else 0
                # mask2[i,j] = 0 if mask[i,j]==0 else 255

        mask = mask2.copy()
     
    return mask    
    #res = cv2.bitwise_and(frame, frame, mask = mask)# Extract bike from image - turn background black
    #return res






def os_path_split(path):
    path = path.replace("\\", "/")
    dirp      = "/".join(path.split("/")[:-2])
    dirparent = path.split("/")[-2]
    fname     = path.split("/")[-1]

    return dirp, dirparent, fname





########################################################################################################
def test1():
    wheel = bike_get_mask_wheel_v1()

    plt.imshow(wheel)
    plt.title('Wheels')

    img_dir = 'imgs/bik5.png'
    bike_get_mask_wheel_v1(img_path=img_dir, verbose=1)

    dirimg1 = 'imgs/bik5.png'
    img = cv2.imread(dirimg1, cv2.IMREAD_COLOR)

    ret, img2 = cv2.threshold(img, 150, 255, cv2.THRESH_BINARY_INV)
    gray = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)
    plt.imshow(gray)



def bike_add_color(img, color_wheels=(0,0,0), color_bike=(255,0,0), ):
    """

    'right-wheel,left-wheel,bike,frame')

    """
    img = image_read(img)
    maskdict = bike_get_mask_bike(img_dir= img, method="sam01")

    for labeli, maski in maskdict.items():

         if labeli == 'bike' :
            img2 = cv2.bitwise_xor(img, img, np.array(maski, dtype=np.uint8))
            ## set color to img2 to red
            img  =cv2.merge(img, img2)

         if 'wheel' in labeli :
            img2 = cv2.bitwise_xor(img, img, np.array(maski, dtype=np.uint8))
            ## set color to img2 to black
            img  =cv2.merge(img, img2)
    plt.imshow(img)
    plt.show()
    return img


def bike_get_mask_wheel_v1(img_dir='imgs/bik5.png', verbose=0):
    image = cv2.imread(img_dir, cv2.IMREAD_COLOR)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    blur = cv2.GaussianBlur(gray, (9, 9), 0)

    # Detect circles using Hough Circle Transform with a wider range of parameters
    circles = cv2.HoughCircles(blur, cv2.HOUGH_GRADIENT, dp=1, minDist=30, param1=70, param2=25, minRadius=int(min(gray.shape)/10), maxRadius=int(min(gray.shape)/5))

    # Check if circles were found
    if circles is not None:
        # Convert the (x, y) coordinates and radius of the circles to integers
        circles = np.round(circles[0, :]).astype("int")

        # Loop through the detected circles and draw them on the image
        for (x, y, radius) in circles:
            cv2.circle(image, (x, y), radius, (255, 0, 0), 2)
    
    if verbose>0: 
        plt.imshow(image)
        plt.show()
    return circles


def bike_get_mask_wheel_v2(img_path='imgs/bik5.png', verbose=1):

    # Load input image
    img = cv2.imread(img_path, cv2.IMREAD_COLOR)
    print(img.shape) # VectorPortal-Bicycle-Illustration

    # Display the image loaded using Cv2.imread
    if verbose>0: plt.imshow(img)


    # Convert image to grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    if verbose>0: plt.imshow(gray, cmap="gray")

    # Apply thresholding to isolate black and white regions
    _, thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)
    if verbose>0: plt.imshow(thresh, cmap="gray")

    # Blur image
    img = cv2.GaussianBlur(gray, (5, 5), 0)
    if verbose>0: plt.imshow(img, cmap='gray')

    # Apply Hough Circle Transform
    H,W = img.shape[:2]
    circles = cv2.HoughCircles(img, cv2.HOUGH_GRADIENT, 1, 20, param1=50, param2=30,\
                               minRadius=int(0.2*H), maxRadius=int(0.24*H))

    # Convert the (x, y) coordinates and radius of the circles to integers
    circles = np.round(circles[0, :]).astype("int")

    # Draw circles on the original image
    mask = np.zeros(img.shape[:2], np.uint8)
    for (x, y, r) in circles:
        cv2.circle(mask, (x, y), r, (255, 255, 255), 18)
        print(x,y, r)

    seg_wheels = cv2.bitwise_and(thresh, thresh, mask=mask)
    if verbose>0: plt.imshow(seg_wheels)

    red = np.zeros(img.shape[:2], np.uint8)
    res = cv2.merge([seg_wheels, red, thresh])
    plt.imshow(res)
    plt.title('Annotated image')
    if verbose > 0:
        plt.show()
    return seg_wheels


def bike_get_mask_bike(img_dir='imgs/bik5.png', points=None, labels=None, dirout="", method="sam01", multimask_output=False,


    ):
    """ Segmentation using SegmentAnything Model (SAM)



    """
    image = image_read(img_dir)
    # (optional) resize the image if it is too big
    # image = cv2.resize(image, None, fx=0.2, fy=0.2, interpolation=cv2.INTER_AREA)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    if points is None:
        ddict = bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')
        points  = np.array(ddict['input_points'])
        labels  = np.array(ddict['input_labels_id'])

    log(points, labels, multimask_output)
    # log(type(points), type(labels))
    if method == "sam01":
        global predictor ### 1 Single Global model
        if "predictor" not in globals() :  #### Not yet initialized
            sam_checkpoint= os.environ.get("sam_checkpoint", "sam_vit_h_4b8939.pth" )
            predictor = mask_model_load(sam_checkpoint=sam_checkpoint, model_type="vit_h", device="cuda")
        predictor.set_image(image)

        masks, scores, logits = predictor.predict(
            point_coords=points,
            point_labels=labels,
            multimask_output=True, # default True which returns 3 masks with scores
        )
        return dict(zip(ddict['input_labels'], masks))




def bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')->dict:
    """ tricks to get pints

    """
    h, w = image.shape[:2]
    print(h, w)
    partlist = part.split(",")
    ddict = {}
    for part in partlist :
        if part == "right-wheel":
            y = h - 10
            x = int(w / 2)

            for i in range(int(w / 2)):
                # if we find a black pixel, break the loop, otherwise, keep looping until we reach the
                # end of the image (image is supposed to have 3 channels with black and white pixels)
                if image[y, min(x, w-1)][0] == 0:
                    break
                x += int(w / 32)

        elif part == "left-wheel":
            y = h - 10
            x = 0

            for i in range(int(w / 2)):
                if image[y, min(x, w-1)][0] == 0:
                    break
                x += int(w / 32)

        elif part == "bike":
            y = 0
            x = int(w / 2)

            for i in range(h):
                if image[y, min(x, w-1)][0] == 0:
                    break
                y += 1

        elif part == "frame":
            x, y = 50, 50

        else:
            log("part must be one of 'right-wheel', 'left-wheel', 'bike', 'frame'")
            x=-1; y=-1

        if x>0:
            ddict[part] = (x,y)

    dd= Box({ 'input_points':   [],
              'input_labels_id': [],
              'input_labels':   [],
    })
    for ii, (label, xy) in enumerate(ddict.items()):
       dd['input_points'].append( xy ) #= np.array([[xr, yr], [xl, yl], [xb, yb]])
       dd['input_labels_id'].append( ii ) #= np.array([1, 1, 1])
       dd['input_labels'].append( label ) #= np.array([1, 1, 1])
       log(ii, label, xy)

    return dd



def bike_clean_v1(img0):
    ### One way to clean image

    img = image_read((img0))
    # Convert the image to grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Apply thresholding to obtain a binary image
    _, binary = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)

    # Use morphological operations to fill holes and remove noise
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5,5))
    binary = cv2.morphologyEx(binary, cv2.MORPH_CLOSE, kernel)

    # Find the contours of the connected components in the binary image
    contours, _ = cv2.findContours(binary, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Identify the contour with the largest area, which corresponds to the background
    max_contour = max(contours, key=cv2.contourArea)

    # Create a new image with the same size as the original image and fill it with white color
    new_img = np.full_like(img, (255, 255, 255))

    # Draw the identified background contour on the new image
    cv2.drawContours(new_img, [max_contour], -1, (0, 0, 0), -1)

    # Create a mask of the background contour
    mask = np.zeros(gray.shape, dtype=np.uint8)
    cv2.drawContours(mask, [max_contour], -1, 255, -1)

    # Apply the mask to the original image
    masked_img = cv2.bitwise_and(img, img, mask=mask)

    # Invert the mask
    mask_inv = cv2.bitwise_not(mask)

    # Create a white background image
    white_bg = np.full_like(img, (255, 255, 255))

    # Apply the inverted mask to the white background image
    white_bg_masked = cv2.bitwise_and(white_bg, white_bg, mask=mask_inv)

    # Merge the masked original image and the masked white background image
    result = cv2.add(masked_img, white_bg_masked)

    return result

    # Show the result
    #cv2_imshow(result)



#####################################################################################################
def image_add_border(img, colorname='navy', bordersize=1):

    img0 = image_read(img) ## nd array or filestring


    colborder  = webcolors.name_to_rgb(colorname) if isinstance(colorname, str) else colorname

    img2 = cv2.copyMakeBorder(img0, bordersize, bordersize, bordersize, bordersize, cv2.BORDER_CONSTANT, None, colborder)

    if os.environ.get('image_show', '0') == '1' :
       plt.imshow(img2)
       plt.axis('off')
       plt.show()

    return img2


def image_remove_background(img= "", model_name="isnet-general-use", only_mask=False, bgcolor=(255, 255, 255, 255),
                            **kwargs  ):
    """
    https://github.com/danielgatis/rembg/blob/main/rembg/bg.py

    https://github.com/danielgatis/rembg/blob/main/USAGE.md

        model_name = "isnet-general-use"
        session = new_session(model_name)
        output = remove(input, session=session)

        output = remove(input, alpha_matting=True, alpha_matting_foreground_threshold=270,alpha_matting_background_threshold=20, alpha_matting_erode_size=11)

        output = remove(input, only_mask=True)

        isnet-general-use

        def remove(
            data: Union[bytes, PILImage, np.ndarray],
            alpha_matting: bool = False,
            alpha_matting_foreground_threshold: int = 240,
            alpha_matting_background_threshold: int = 10,
            alpha_matting_erode_size: int = 10,
            session: Optional[BaseSession] = None,
            only_mask: bool = False,
            post_process_mask: bool = False,
            bgcolor: Optional[Tuple[int, int, int, int]] = None,
            *args: Optional[Any],
            **kwargs: Optional[Any]
        ) -> Union[bytes, PILImage, np.ndarray]:

    """
    import rembg

    from util_image import image_read
    global session_rembg
    try :
        session_rembg
    except :
        session_rembg = rembg.new_session(model_name)

    img = image_read(img) ## file or img
    img = rembg.remove(img, session=session_rembg, only_mask=only_mask, bgcolor= bgcolor, **kwargs )
    return img



def image_get_mask(img="", model_name="isnet-general-use", bgcolor=(255, 255, 255),  **kwargs):
    """ Return Mask only
    https://github.com/danielgatis/rembg/blob/main/rembg/bg.py

    https://github.com/danielgatis/rembg/blob/main/USAGE.md

        model_name = "isnet-general-use"
        session = new_session(model_name)
        output = remove(input, session=session)

        output = remove(input, alpha_matting=True, alpha_matting_foreground_threshold=270,alpha_matting_background_threshold=20, alpha_matting_erode_size=11)

        output = remove(input, only_mask=True)

        isnet-general-use

        def remove(
            data: Union[bytes, PILImage, np.ndarray],
            alpha_matting: bool = False,
            alpha_matting_foreground_threshold: int = 240,
            alpha_matting_background_threshold: int = 10,
            alpha_matting_erode_size: int = 10,
            session: Optional[BaseSession] = None,
            only_mask: bool = False,
            post_process_mask: bool = False,
            bgcolor: Optional[Tuple[int, int, int, int]] = None,
            *args: Optional[Any],
            **kwargs: Optional[Any]
        ) -> Union[bytes, PILImage, np.ndarray]:

    """
    import rembg

    from util_image import image_read
    global session_rembg_mask
    try :
        session_rembg_mask
    except :
        session_rembg_mask = rembg.new_session(model_name)

    img = image_read(img) ## file or img
    img = rembg.remove(img, session=session_rembg_mask, only_mask=True, bgcolor= bgcolor, **kwargs )
    return img


def image_invert_colors(img, invert_only_dark_bg=1):
    ### Dark background --> white background
    import cv2
    import numpy as np
    from PIL import Image

    from util_image import image_read
    image = image_read(img)
    image = cv2.cvtColor(image, cv2.COLOR_RGB2RGBA)
    # Split the image into its 4 channels (R, G, B, and A)
    b, g, r, a = cv2.split(image)

    # Merge the B, G, and R channels into a BGR image
    bgr = cv2.merge((b, g, r))

    # Create a white background image with the same size as the BGR image
    white_bg = np.ones_like(bgr) * 255

    # Mask the white background image using the alpha channel
    masked_white_bg = cv2.bitwise_and(white_bg, white_bg, mask=cv2.bitwise_not(a))

    # Combine the masked white background with the BGR image
    bgr_with_white_bg = cv2.bitwise_or(bgr, masked_white_bg)

    # Convert the BGR image to grayscale
    gray = cv2.cvtColor(bgr_with_white_bg, cv2.COLOR_BGR2GRAY)

    mean = np.mean(gray)
    if mean < 127:  ### dark
        inverted_bgr = cv2.bitwise_not(bgr)         # Invert the colors of the BGR image

        # Merge the inverted BGR image with the alpha channel
        inverted_image = cv2.merge((inverted_bgr, a))

        return inverted_image
    else:
        return None






##########################################################################################
def global_index_create(name="list_invertcolor"):
  """ Global VAR from disk to prevent duplicate processing

  """
  try :
      # len(removebg_list)
      from utilmy import load
      globals()[name] = load( f"ztmp/{name}")
      if globals()[name] is None :
         globals()[name] = set()   ### This is a dict

  except :
      globals()[name] = set()

  return  globals()[name]


def imgdir_invertcolor(dirin="ztmp/dirout_img/**/*.png", nmax=1, dry=1):
  """ Ok, good to use for images


  """
  from rembg import remove
  from utilmy import glob_glob, load, log, save

  from util_image import image_read, image_save


  global list_invertcolor
  list_invertcolor = global_index_create(name="list_invertcolor")

  ii = 0
  flist = glob_glob( dirin  )
  flist = flist[:nmax]
  # log(flist)
  for  fi in flist:
      if ii > nmax : return
      if fi in list_invertcolor: continue

      img = image_invert_colors(fi)
      if img is None : continue

      ii = ii +1
      if dry ==0 :
         image_save(img, fi)
         log(fi)
         list_invertcolor.add(fi)
      else :
         log("dry: ", fi)

  save(list_invertcolor, "ztmp/list_invertcolor")



def imgdir_removebg(dirin="ztmp/dirout_img/**/*.png", nmax=1, dry=1):
  """ Ok, not good creates some issues on ivnerted image

  """
  from rembg import remove
  from utilmy import glob_glob, load, log, save

  from util_image import image_read, image_save


  global list_removebg
  list_removebg = global_index_create(name="list_removebg")

  ii = 0
  flist = glob_glob( dirin  )
  flist = flist[:nmax]
  # log(flist)
  for  fi in flist:
      if ii > nmax : return
      if fi in list_removebg: continue

      img = image_read(fi)
      img = remove(img)
      if img is None : continue

      ii = ii +1
      if dry ==0 :
         image_save(img, fi)
         log(fi)
         list_removebg.add(fi)
      else :
         log("dry: ", fi)

  save(list_removebg, "ztmp/list_removebg")



def imgdir_remove_badfiles(dirin="imgs/**/*.png", dry=1):
  import os

  from PIL import Image
  from utilmy import glob_glob

  imglist = glob_glob(dirin)
  log('Nfiles', len(imglist))


  for filename in imglist:
    try :
        with Image.open( filename) as im:
             a = 1
    except :
        if dry == 0 : os.remove(filename)
        print("img corrupeted, del ", filename)




def imgdir_delete_empty(dirin="ztmp/dirout_img/*", dry=1):
  from utilmy import glob_glob
  f2 = glob_glob( dirin  )
  for fi in f2:
    fcheck = glob_glob(fi  +"/**/*.*")
    if len(fcheck)  < 3  :
        log(fcheck)
        fi2 =  fi.replace("/img/png", "/").replace("/img/", "/")
        log(fi2)
        if dry == 0 : os.system(f" rm -rf {fi2}")





####################################################################################
def mask_model_load(sam_checkpoint="sam_vit_h_4b8939.pth", model_type="vit_h", device="cuda"):
    """ SAM
    segment-anything-py
    opencv-python
    pycocotools
    matplotlib
    onnxruntime; python_version < '3.11'
    onnx
    rasterio
    tqdm
    gdown
    # https://pypi.org/project/segment-anything-py/1.0/

    wget  'https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth'

    https://blog.roboflow.com/how-to-use-segment-anything-model-sam/

        o generate masks automatically, use the SamAutomaticMaskGenerator. This utility generates a list of dictionaries describing individual segmentations. Each dict in the result list has the following format:
        segmentation - [np.ndarray] - the mask with (W, H) shape, and bool type, where W and H are the width and height of the original image, respectively
        area - [int] - the area of the mask in pixels
        bbox - [List[int]] - the boundary box detection in xywh format
        predicted_iou - [float] - the model's own prediction for the quality of the mask
        point_coords - [List[List[float]]] - the sampled input point that generated this mask
        stability_score - [float] - an additional measure of mask quality
        crop_box - List[int] - the crop of the image used to generate this mask in xywh format

    """
    import torch
    from segment_anything import SamPredictor, sam_model_registry
    sam_checkpoint = sam_checkpoint
    model_type = model_type
    device = "cuda" if torch.cuda.is_available() else "cpu"

    try :
       sam = sam_model_registry[model_type](checkpoint=sam_checkpoint)
       sam.to(device=device)
    except Exception as e:
       log(e)
       log("download model from here")
       log("wget -q 'https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth")
    

    predictor = SamPredictor(sam)
    return predictor


def mask_show_mask(mask, ax, rgba=[0, 0, 1.0, 1]):
    color = np.array([rgba]) # default color blue
    h, w = mask.shape[-2:]
    mask_image = mask.reshape(h, w, 1) * color.reshape(1, 1, -1)
    ax.imshow(mask_image)


def mask_show_points(coords, labels, ax, marker_size=375):
    pos_points = coords[labels==1]
    neg_points = coords[labels==0]
    ax.scatter(pos_points[:, 0], pos_points[:, 1], color='green', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)
    ax.scatter(neg_points[:, 0], neg_points[:, 1], color='red', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)


def mask_show_all(image, masks, ddict):
    plt.figure(figsize=(5,5))
    plt.imshow(image)
    mask_show_mask(masks, plt.gca())
    mask_show_points(ddict['input_points'], ddict['input_labels_id'], plt.gca())
    plt.axis('off')
    plt.show()




#########################################################################################
def test_color():
   requested_colour = (119, 172, 152)
   actual_name, closest_name = color_getname_fromrgb(requested_colour)
   print("Actual colour name:", actual_name, ", closest colour name:", closest_name)


def color_random_rgb():
    import random
    r = random.randint(0, 255)
    g = random.randint(0, 255)
    b = random.randint(0, 255)
    return (r, g, b)


def color_getname_closest_fromrgb(requested_colour=(255, 0, 0)):
    import webcolors
    min_colours = {}
    for key, name in webcolors.CSS3_HEX_TO_NAMES.items():
        r_c, g_c, b_c = webcolors.hex_to_rgb(key)
        rd = (r_c - requested_colour[0]) ** 2
        gd = (g_c - requested_colour[1]) ** 2
        bd = (b_c - requested_colour[2]) ** 2
        min_colours[(rd + gd + bd)] = name
    return min_colours[min(min_colours.keys())]


def color_getname_fromrgb(requested_colour=(255, 0, 0)):
    import webcolors
    try:
        closest_name = actual_name = webcolors.rgb_to_name(requested_colour)
    except ValueError:
        closest_name = color_getname_closest_fromrgb(requested_colour)
        actual_name = None
    return actual_name, closest_name


########################################################################################
def img_rescale(dirimg, scale=1):
    #image_name2 =   dirout2 + "/svg/"+str(int(time.time())) +".png"
    #image_png_to_svg3(image_name, svg_file_path=image_name2, scale_factor= resolution)


    # ppm_path=image_name.replace("png","ppm")
    # svg_path=ppm_path.replace("ppm","svg")
    # svg_scaled =svg_path.replace(".svg","_20.svg")
    
    #subprocess.call(["convert","-flatten",image_name,ppm_path])
    #subprocess.call(["potrace","-s",ppm_path,"-o",svg_path])
    #svg_scale(svg_path,svg_scaled,resolution)
    
    #os.remove(svg_path)
    #os.remove(ppm_path)
    # image.show()
    pass



def image_png_to_svg2a(
    png_file_path: str,
    png_output_file_path: str,
    xmax= 128,
    ymax=128,
    color_interior="white",
    color_shape="blue"):
    """
    https://pypi.org/project/pypotrace/
    https://anaconda.org/bioconda/potrace
    https://anaconda.org/conda-forge/cairosvg

    conda install -c conda-forge cairosvg
    conda install -c bioconda potrace


    img_paths = glob.glob("./test/*")

    for img_path in img_paths:
        image_png_to_svg2(img_path, img_path.replace(".png", "_converted.png"), 64, 64)


    """
    import potrace
    import glob
    import numpy as np
    from PIL import Image
    import cairosvg
    from io import StringIO


    # Open the PNG file
    png_image = Image.open(png_file_path).convert("L")  # Convert to grayscale
    # Threshold the image and convert it to a numpy array
    bitmap = np.array(png_image) > 128

    # Create a potrace bitmap from the numpy array
    potrace_bitmap = potrace.Bitmap(bitmap)

    # Create a potrace path from the bitmap
    path = potrace_bitmap.trace()

    # Calculate the scaling factors
    scale_x = float(xmax) / png_image.width
    scale_y = float(ymax) / png_image.height

    # Create the SVG content in a string
    svg_string_io = StringIO()
    svg_string_io.write('<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n')
    svg_string_io.write(
        f'<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="{xmax}" height="{ymax}">\n'
    )
    for curve in path:
        svg_string_io.write(
            f'<path d="M{curve.start_point.x * scale_x},{curve.start_point.y * scale_y}'
        )
        for segment in curve:
            if segment.is_corner:
                svg_string_io.write(f"L{segment.c.x * scale_x},{segment.c.y * scale_y}")
            else:
                svg_string_io.write(
                    f"C{segment.c1.x * scale_x},{segment.c1.y * scale_y} {segment.c2.x * scale_x},{segment.c2.y * scale_y} {segment.end_point.x * scale_x},{segment.end_point.y * scale_y}"
                )
        svg_string_io.write(f'" fill="{color_interior}" stroke="{color_shape}" stroke-width="{1}"/>\n')
    svg_string_io.write("</svg>\n")
    svg_content = svg_string_io.getvalue()

    # Convert the SVG file to PNG
    cairosvg.svg2png(bytestring=svg_content, write_to=png_output_file_path)



def image_png_to_svg2b(
    png_file_path: str,
    svg_file_path: str,
    png_output_file_path: str,
    xmax: int,
    ymax: int,
):
    # Open the PNG file
    png_image = Image.open(png_file_path).convert("L")  # Convert to grayscale
    # Threshold the image and convert it to a numpy array
    bitmap = np.array(png_image) > 128

    # Create a potrace bitmap from the numpy array
    potrace_bitmap = potrace.Bitmap(bitmap)

    # Create a potrace path from the bitmap
    path = potrace_bitmap.trace()

    # Calculate the scaling factors
    scale_x = float(xmax) / png_image.width
    scale_y = float(ymax) / png_image.height

    # Create the SVG file
    with open(svg_file_path, "w") as f:
        f.write('<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n')
        f.write(
            f'<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="{xmax}" height="{ymax}">\n'
        )
        for curve in path:
            f.write(
                f'<path d="M{curve.start_point.x * scale_x},{curve.start_point.y * scale_y}'
            )
            for segment in curve:
                if segment.is_corner:
                    f.write(f"L{segment.c.x * scale_x},{segment.c.y * scale_y}")
                else:
                    f.write(
                        f"C{segment.c1.x * scale_x},{segment.c1.y * scale_y} {segment.c2.x * scale_x},{segment.c2.y * scale_y} {segment.end_point.x * scale_x},{segment.end_point.y * scale_y}"
                    )
            f.write(f'" fill="none" stroke="black" stroke-width="{10}"/>\n')

        f.write("</svg>\n")



def image_png_to_svg0( png_file_path: str,    png_output_file_path: str,    xmax: int,    ymax: int,):
    import potrace
    import numpy as np
    from PIL import Image
    import cairosvg
    from io import StringIO

    # Open the PNG file
    png_image = Image.open(png_file_path).convert("L")  # Convert to grayscale
    # Threshold the image and convert it to a numpy array
    bitmap = np.array(png_image) > 128

    # Create a potrace bitmap from the numpy array
    potrace_bitmap = potrace.Bitmap(bitmap)

    # Create a potrace path from the bitmap
    path = potrace_bitmap.trace()

    # Calculate the scaling factors
    scale_x = float(xmax) / png_image.width
    scale_y = float(ymax) / png_image.height

    # Create the SVG content in a string
    svg_string_io = StringIO()
    svg_string_io.write('<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n')
    svg_string_io.write(
        f'<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="{xmax}" height="{ymax}">\n'
    )
    for curve in path:
        svg_string_io.write(
            f'<path d="M{curve.start_point.x * scale_x},{curve.start_point.y * scale_y}'
        )
        for segment in curve:
            if segment.is_corner:
                svg_string_io.write(f"L{segment.c.x * scale_x},{segment.c.y * scale_y}")
            else:
                svg_string_io.write(
                    f"C{segment.c1.x * scale_x},{segment.c1.y * scale_y} {segment.c2.x * scale_x},{segment.c2.y * scale_y} {segment.end_point.x * scale_x},{segment.end_point.y * scale_y}"
                )
        svg_string_io.write(f'" fill="none" stroke="black" stroke-width="{10}"/>\n')
    svg_string_io.write("</svg>\n")
    svg_content = svg_string_io.getvalue()

    # Convert the SVG file to PNG
    cairosvg.svg2png(bytestring=svg_content, write_to=png_output_file_path)


def image_png_to_svg4(  png_file_path: str,  png_output_file_path: str,  xmax: int, ymax: int,):
    import potrace
    import numpy as np
    from PIL import Image
    import cairosvg

    # Open the PNG file
    png_image = Image.open(png_file_path).convert("L")  # Convert to grayscale
    # Threshold the image and convert it to a numpy array
    bitmap = np.array(png_image) > 128

    # Create a potrace bitmap from the numpy array
    potrace_bitmap = potrace.Bitmap(bitmap)

    # Create a potrace path from the bitmap
    path = potrace_bitmap.trace()

    # Calculate the scaling factors
    scale_x = float(xmax) / png_image.width
    scale_y = float(ymax) / png_image.height

    # Create the SVG file
    svg_file_path="ztmp/tmp.svg"
    with open(svg_file_path, "w") as f:
        f.write('<?xml version="1.0" encoding="UTF-8" standalone="no"?>\n')
        f.write(
            f'<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="{xmax}" height="{ymax}">\n'
        )
        for curve in path:
            f.write(
                f'<path d="M{curve.start_point.x * scale_x},{curve.start_point.y * scale_y}'
            )
            for segment in curve:
                if segment.is_corner:
                    f.write(f"L{segment.c.x * scale_x},{segment.c.y * scale_y}")
                else:
                    f.write(
                        f"C{segment.c1.x * scale_x},{segment.c1.y * scale_y} {segment.c2.x * scale_x},{segment.c2.y * scale_y} {segment.end_point.x * scale_x},{segment.end_point.y * scale_y}"
                    )
            f.write(f'" fill="none" stroke="black" stroke-width="{10}"/>\n')

        f.write("</svg>\n")

    # Convert the SVG file to PNG
    cairosvg.svg2png(url=svg_file_path, write_to=png_output_file_path)


def image_png_to_svg1(png_file_path: str, svg_file_path: str):
    from cairosvg import svg2png
    from PIL import Image

    # Open the PNG file
    png_image = Image.open(png_file_path)

    # Convert the PNG image to SVG format
    svg_image = svg2png(bytestring=png_image.tobytes(), write_to=svg_file_path)


    # Save the SVG image to disk
    with open(svg_file_path, 'wb') as f:
        f.write(svg_image)


def image_png_to_svg3(png_file_path: str, svg_file_path: str, scale_factor=0.25):
    """

     brew install cairo
     brew install py3cairo
     pip install pycairo

     conda install -c conda-forge pygobject
     png_file_path="imgs/img-black_bike_white_background/bik5.png"
     svg_file_path="ztmp/bik.png"
     scale_factor=10

     image_png_to_svg3(png_file_path, svg_file_path, scale_factor=0.25)

    """
    import cairo

    surface = cairo.ImageSurface.create_from_png(png_file_path)
    ctx = cairo.Context(surface)

    ctx.scale(scale_factor, scale_factor)
    surface.write_to_png(svg_file_path)



def image_png_to_svg2(png_file_path: str, svg_file_path: str, xmax: int, ymax: int):

    from svglib.svglib import svg2rlg
    from reportlab.graphics import renderPDF, renderPM
    from PIL import Image


    # Open the PNG file
    png_image = Image.open(png_file_path)

    # Convert the PNG image to SVG format
    drawing = svg2rlg(png_file_path)
    scale_x = float(xmax) / drawing.width
    scale_y = float(ymax) / drawing.height
    drawing.width, drawing.height = xmax, ymax
    drawing.scale(scale_x, scale_y)
    renderPM.drawToFile(drawing, svg_file_path, fmt='SVG')


def image_svg_scale(input1,output,resolution):
  fig = sg.fromfile(input1)
  fig.set_size((str(resolution),str(resolution)))
  fig.save(output)


########################################################################################
def setup_colab():
    import torch
    import torchvision
    print("PyTorch version:", torch.__version__)
    print("Torchvision version:", torchvision.__version__)
    print("CUDA is available:", torch.cuda.is_available())
    import sys

    #!{sys.executable} -m pip install opencv-python matplotlib
    #!{sys.executable} -m pip install 'git+https://github.com/facebookresearch/segment-anything.git'
    # download some images
    # !mkdir images
    #!wget -P images http://clipart-library.com/images/BTgKexLec.png
    #!wget -P images http://clipart-library.com/newimages/bicycle-clip-art-15.png
    #!wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth






###################################################################################################
if __name__ == "__main__":
    import fire
    fire.Fire()












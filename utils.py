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
       python utils.py test3  --dirimg imgs/    --name ""

       python utils.py test10




   ### SAM
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


   Image of bicket
   https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fblue-mountain-bike-simple-flat-600w-779290111.jpg&tbnid=GYBAUwP0Mspp7M&vet=10CAoQMyhsahcKEwjAzMWyxcH-AhUAAAAAHQAAAAAQAw..i&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fblue-mountain-bike-simple-flat-design-779290111&docid=hyaAJpgQQ8Xd1M&w=600&h=474&itg=1&q=simple%20bike%20vector%20art&ved=0CAoQMyhsahcKEwjAzMWyxcH-AhUAAAAAHQAAAAAQAw


   https://www.google.com/search?q=simple+bike+vector+art+black+and+white&tbm=isch&chips=q:simple+bike+vector+art+black+and+white,online_chips:clipart:IkZQhZE3-NI%3D&hl=en&sa=X&ved=2ahUKEwjcw9C1xsH-AhWugFYBHf7rCIYQ4lYoAHoECAEQJg&biw=1398&bih=943


"""
import fire, os, sys, cv2
from box import Box
import numpy as np, webcolors
import matplotlib.pyplot as plt
from PIL import Image


from utilmy import (log, os_makedirs)
from util_image import image_read 


####################################################################################
###""" # 04) Segmentation using SegmentAnything Model (SAM) 
def test10():
    log("""### Display the points and labels of the wheels""")
    input_points = np.array([[117, 771], [879, 738], [473, 320]])
    input_labels = np.array([1, 1, 0])

    plt.figure(figsize=(10,10))
    plt.imshow(image)
    show_points(input_points, input_labels, plt.gca())
    plt.axis('on')
    plt.show()

    log("""### Get the mask of the wheels and display it""")
    masks = img_get_mask_wheel(points=input_points, labels=input_labels, img_dir='images/BTgKexLec.png', dirout="", method="sam01")

    plt.figure(figsize=(10,10))
    # plt.imshow(image)
    show_mask(masks, plt.gca())
    # show_points(input_points, input_labels, plt.gca())
    plt.axis('off')
    plt.show()

    log("""### Display the points and labels of the bike""")
    input_points = np.array([[117, 771], [879, 738], [473, 320]])
    input_labels = np.array([1, 1, 1])

    plt.figure(figsize=(10,10))
    plt.imshow(image)
    show_points(input_points, input_labels, plt.gca())
    plt.axis('on')
    plt.show()

    log("""### Get the mask of the bike and display it""")
    masks = img_get_mask_frame(points=input_points, labels=input_labels, img_dir='images/BTgKexLec.png', dirout="", method="one")

    plt.figure(figsize=(10,10))
    # plt.imshow(image)
    show_mask(masks, plt.gca())
    # show_points(input_points, input_labels, plt.gca())
    plt.axis('off')
    plt.show()


def test11():
    log("""### Read the image and display it""")
    image = cv2.imread('images/BTgKexLec.png')
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
    flist = [fi.replace("\\", "/") for fir in flist]
    flist = [ fi for fi in flist if name in fi.split("/")[-1] ]
    dirimg1 = flist[0]


    image = cv2.imread( dirimg1 )
    # (optional) resize the image if it is too big
    image = cv2.resize(image, None, fx=0.2, fy=0.2, interpolation=cv2.INTER_AREA)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


    log("### All   ")
    ddict = bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')
    # ddict['input_points']  ddict['input_labels_id']  ddict['input_labels']
    masks = img_get_mask(points=ddict['input_points'], labels=ddict['input_labels_id'], 
                         img_dir= dirimg1,    dirout="ztmp/out/", method="sam01")

    show_all(image, masks, ddict)



    log("### Left Wheel   ")
    ddict = bike_get_input_points(image, part='right-wheel')
    masks = img_get_mask(points=ddict['input_points'], labels=ddict['input_labels_id'], 
                         img_dir= dirimg1,    dirout="ztmp/out/", method="sam01")
 
    show_all(image, masks, ddict)




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


def model_load(same_checkpoint="sam_vit_h_4b8939.pth", model_type="vit_h", device="cuda"):
    import torch 
    from segment_anything import sam_model_registry, SamPredictor
    sam_checkpoint = same_checkpoint
    model_type = model_type
    device = device

    sam = sam_model_registry[model_type](checkpoint=sam_checkpoint)
    sam.to(device=device)

    predictor = SamPredictor(sam)
    return predictor


def img_get_mask_bike(img_dir='imgs/bik5.png', points=None, labels=None,  dirout="", method="sam01", multimask_output=False):
    ####. get wheel mask

    image = cv2.imread(img_dir)
    # (optional) resize the image if it is too big
    image = cv2.resize(image, None, fx=0.2, fy=0.2, interpolation=cv2.INTER_AREA)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    if points is None:
        ddict = bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')
        points  = ddict['input_points']
        labels  = ddict['input_labels_id']


    if method == "sam01":
        global predictor ### 1 Single Global model
        if "predictor" not in globals() :  #### Not yet initialized
            predictor = model_load(same_checkpoint="sam_vit_h_4b8939.pth", model_type="vit_h", device="cuda")
        predictor.set_image(image)

        masks, scores, logits = predictor.predict(
            point_coords=points,
            point_labels=labels,
            multimask_output=multimask_output, # default True which returns 3 masks with scores
        )

    return masks





def bike_get_input_points(image, part='right-wheel,left-wheel,bike,frame')->dict:
    """ tricks to get pints 

    """
    h, w = image.shape[:2]

    partlist = part.split(",")
    ddict = {}
    for part in partlist :
        if part == "right-wheel":
            y = h - 10
            x = int(w / 2)

            for i in range(int(w / 2)):
                # if we find a black pixel, break the loop, otherwise, keep looping until we reach the 
                # end of the image (image is supposed to have 3 channels with black and white pixels)
                if image[y, x][0] == 0:
                    break
                x += int(w / 32)

        elif part == "left-wheel":
            y = h - 10
            x = 0

            for i in range(int(w / 2)):
                if image[y, x][0] == 0:
                    break
                x += int(w / 32)

        elif part == "bike":
            y = 0
            x = int(w / 2)

            for i in range(h):
                if image[y, x][0] == 0:
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
              'input_label_id': [], 
              'input_labels':   [],
    })
    for ii, label, xy in enumerate(ddict.items()):
       dd['input_points'].append( xy ) #= np.array([[xr, yr], [xl, yl], [xb, yb]])
       dd['input_labels_id'].append( ii ) #= np.array([1, 1, 1])
       dd['input_labels'].append( label ) #= np.array([1, 1, 1])
       log(ii, label, xy)            
    
    return dd



def show_mask(mask, ax, rgba=[0, 0, 1.0, 1]):
    color = np.array([rgba]) # default color blue
    h, w = mask.shape[-2:]
    mask_image = mask.reshape(h, w, 1) * color.reshape(1, 1, -1)
    ax.imshow(mask_image)


def show_points(coords, labels, ax, marker_size=375):
    pos_points = coords[labels==1]
    neg_points = coords[labels==0]
    ax.scatter(pos_points[:, 0], pos_points[:, 1], color='green', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)
    ax.scatter(neg_points[:, 0], neg_points[:, 1], color='red', marker='*', s=marker_size, edgecolor='white', linewidth=1.25)


def show_all(image, masks, ddict):
    plt.figure(figsize=(5,5))
    plt.imshow(image)
    show_mask(masks, plt.gca())
    show_points(ddict['input_points'], ddict['input_labels_id'], plt.gca())
    plt.axis('off')
    plt.show() 




####################################################################################
def img_files_badfile(img_paths):
  import os 
  from PIL import Image
  for filename in img_paths:
    try :
        with Image.open( filename) as im:
             a = 1
    except :
        print("img corrupted, del ", filename)
        os.remove(filename)




#########################################################################################
# 01) OpenCV 1 Segmentation"""
def test1():
    wheel = img_get_mask_wheel()

    plt.imshow(wheel)
    plt.title('Wheels')

    img_dir = 'sample_data/images.png'
    img_get_mask_wheel(img_path=img_dir, verbose=1)


def test2():
    img = cv2.imread('/content/drive/MyDrive/image_bicycle.png', cv2.IMREAD_COLOR)

    ret, img2 = cv2.threshold(img, 150, 255, cv2.THRESH_BINARY_INV)
    cv2.imwrite('Image1.jpg', img2)
    plt.imshow(img2)
    plt.title('Image1');

    plt.figure(figsize = (8, 8))
    plt.imshow(img[:, :, ::-1]);

    img3 =img[50:280, 55:415]
    plt.imshow(img3[:, :, ::-1]);

    plt.imshow(image)

    img = cv2.imread('/content/drive/MyDrive/image_bicycle.png', cv2.IMREAD_COLOR)

    image = img
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    plt.imshow(gray)

    min(gray.shape)


def img_get_mask_wheel_v1(img_dir='/content/drive/MyDrive/image_bicycle.png'):
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
    
    return circles



def img_get_mask_wheel_v2(img_path='sample_data/images.png', verbose=1):

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

    return seg_wheels





def img_add_border(img, colorname='navy'):

    img0 = image_read(img) ## nd array or filestring 

    colborder  = webcolors.name_to_rgb(colorname)
    image = cv2.copyMakeBorder(img0, 10, 10, 10, 10, cv2.BORDER_CONSTANT, None, colborder)
    image = image[:, :, ::-1]
    img_arr = np.array(image)
    img_arr[10: 50, 300 :370] = (255, 255, 255)
    img_arr[10: 50, 10 :60] = (255, 255, 255)
    img12 = Image.fromarray(img_arr)

    if os.environ.get('img_show', '0') = '1' :
       plt.imshow(img12)
       plt.axis('off')
       plt.show()

    return img12



#####################################################################################################
def test_color():
   requested_colour = (119, 172, 152)
   actual_name, closest_name = get_colour_name(requested_colour)
   print("Actual colour name:", actual_name, ", closest colour name:", closest_name)


def color_closest_color(requested_colour):
    import webcolors    
    min_colours = {}
    for key, name in webcolors.CSS3_HEX_TO_NAMES.items():
        r_c, g_c, b_c = webcolors.hex_to_rgb(key)
        rd = (r_c - requested_colour[0]) ** 2
        gd = (g_c - requested_colour[1]) ** 2
        bd = (b_c - requested_colour[2]) ** 2
        min_colours[(rd + gd + bd)] = name
    return min_colours[min(min_colours.keys())]


def color_getname(requested_colour=(255,0,0)):
    import webcolors    
    try:
        closest_name = actual_name = webcolors.rgb_to_name(requested_colour)
    except ValueError:
        closest_name = color_closest_color(requested_colour)
        actual_name = None
    return actual_name, closest_name







###################################################################################################
if __name__ == "__main__":
    fire.Fire()












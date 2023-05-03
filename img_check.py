"""
#### How to start:

    git clone https://github.com/arita37/mybash.git
    cd mybash
    git checkout zbike
    ls.

    pip install utilmy fire opencv-python  python-box matplotlib 

    ### CMD line
    python img_check.py run_classifier  --dirin "img_bad/;imgs/"  --dirout "ztmp/classfier/



"""
import cv2
import numpy as np, pandas as pd
import urllib.request
from io import BytesIO
import requests
from bs4 import BeautifulSoup

from utilmy import log,glob_glob, os_makedirs, pd_to_file, date_now
from utilmy.images.util_image import image_read



####################################################################################
def run_classifier(dirin="", dirout="ztmp/classifier/", mode="v2")
    t0 = date_now(fmt="%Y%m%d_%H%M%S")
    dirout2 = dirout + f"/{t0}/"
    os_makedirs(dirout2)

    dirin2 = [ fi +"/**/.*" for fi in dirin.split(";")  ]
    flist = []
    for dirink in dirin2 :
       flist = flist + glob_glob(dirink )
    log('N images:', len(flist))

    if mode =="v1":
       image_classifier = classify_image_v1
    else :
       image_classifier = classify_image_v2

    res = []
    for fi in flist :
       img   = image_read(fi)
       ypred = image_classifier(img)
       res.append([fi, ypred, modelname])

    res = pd.DateFrame(res, columns=['img_uri', 'ypred', 'modelname'])
    res['ytrue'] = res['img_uri'].apply(lambda x : 0 if "bad" in x else 1)

    dfbad = res[res.ytrue == 0 ]
    log('Accuracy bad', dfbad['ypred' ].sum() / len(dfbad)  )


    dfgood = res[res.ytrue == 1 ]
    log('Accuracy good', dfgood['ypred' ].sum() / len(dfgood)  )

    pd_to_file(res, dirout2 + "/df_img_isok.csv", index=False)


####################################################################################
def classify_image_v1(img):
    _, binary_img = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)
    black_pixels_count = np.sum(binary_img == 0)
    black_pixels_threshold = img.shape[0] * img.shape[1] * 0.3
    if black_pixels_count > black_pixels_threshold:
        return 0 ### bad
    else:
        return 1


def classify_image_v2(img):
    # Apply a Gaussian blur to reduce noise
    blurred_img = cv2.GaussianBlur(img, (5, 5), 0)

    # Apply Canny edge detection
    edges = cv2.Canny(blurred_img, 100, 200)

    # Find contours
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Calculate the total contour area
    total_contour_area = sum([cv2.contourArea(c) for c in contours])

    # Calculate the ratio of the total contour area to the image area
    image_area = img.shape[0] * img.shape[1]
    contour_area_ratio = total_contour_area / image_area

    # Set thresholds for the contour area ratio
    min_contour_area_ratio = 0.01
    max_contour_area_ratio = 0.15

    if contour_area_ratio >= min_contour_area_ratio and contour_area_ratio <= max_contour_area_ratio:
        return 1 ### good
    else:
        return 0
  # Default to "good" if no clear decision can be made based on the current rules



def url_to_image(url):
    with urllib.request.urlopen(url) as response:
        image_data = response.read()
    image_data = np.asarray(bytearray(image_data), dtype="uint8")
    img = cv2.imdecode(image_data, cv2.IMREAD_GRAYSCALE)
    return img



def get_image_urls(repo_url):
    base_url = "https://raw.githubusercontent.com"
    response = requests.get(repo_url)
    soup = BeautifulSoup(response.text, "html.parser")
    images = soup.find_all("a", class_="Link--primary", href=True)
    image_urls = [base_url + image["href"].replace("/blob", "") for image in images]
    return image_urls



def test():
    # Example usage
    repo_url_bad = "https://github.com/arita37/mybash/tree/zbike/img_bad"
    repo_url_good = "https://github.com/arita37/mybash/tree/zbike/imgs"  # Replace this with the correct repository URL containing good images

    image_urls_bad = get_image_urls(repo_url_bad)
    image_urls_good = get_image_urls(repo_url_good)
    image_urls = image_urls_bad + image_urls_good

    total_bad = 0
    correct_bad = 0
    total_good = 0
    correct_good = 0
    predicted_good = 0

    for url in image_urls:
        try:
            img = url_to_image(url)
            classification = classify_image(img)
            
            if classification == "good":
                predicted_good += 1
            
            if url in image_urls_bad:
                total_bad += 1
                if classification == "bad":
                    correct_bad += 1
            elif url in image_urls_good:
                total_good += 1
                if classification == "good":
                    correct_good += 1
                    
            print(f"Classification result for {url}: {classification}")
        except Exception as e:
            print(f"Error processing {url}: {e}")

    accuracy_bad = (correct_bad / total_bad) * 100
    if total_good > 0:
        accuracy_good = (correct_good / total_good) * 100
    else:
        accuracy_good = None

    print(f"\nAccuracy for bad images: {accuracy_bad:.2f}%")
    if accuracy_good is not None:
        print(f"Accuracy for good images: {accuracy_good:.2f}%")
    else:
        print("No good images found.")

    print(f"Number of predicted good images: {predicted_good}")


    for url in image_urls:
        try:
            img = url_to_image(url)
            classification = classify_image(img)
            print(f"Classification result for {url}: {classification}")
        except Exception as e:
            print(f"Error processing {url}: {e}")


if __name__ == "__main__":
    fire.Fire()




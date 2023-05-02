import cv2
import numpy as np
import urllib.request
from io import BytesIO
import requests
from bs4 import BeautifulSoup

def url_to_image(url):
    with urllib.request.urlopen(url) as response:
        image_data = response.read()
    image_data = np.asarray(bytearray(image_data), dtype="uint8")
    img = cv2.imdecode(image_data, cv2.IMREAD_GRAYSCALE)
    return img

def classify_image(img):
    _, binary_img = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)
    black_pixels_count = np.sum(binary_img == 0)
    black_pixels_threshold = img.shape[0] * img.shape[1] * 0.3
    if black_pixels_count > black_pixels_threshold:
        return "bad"
    else:
        return "good"

def get_image_urls(repo_url):
    base_url = "https://raw.githubusercontent.com"
    response = requests.get(repo_url)
    soup = BeautifulSoup(response.text, "html.parser")
    images = soup.find_all("a", class_="Link--primary", href=True)
    image_urls = [base_url + image["href"].replace("/blob", "") for image in images]
    return image_urls

# Example usage
# ... (previous code)


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

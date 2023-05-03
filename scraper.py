'''
pip install utilmy fire rembg


python scraper.py  fetch  --query "simple logo bicycle in black and white" --limit 1  --dirout ztmp/fetch/bing/


'''
import fire, os, sys,re, urllib
from pathlib import Path
import urllib.request
import imghdr
import posixpath

from rembg import remove
from utilmy import log, os_makedirs, glob_glob

try :
  from google_images_download import google_images_download
except: pass


#import helper libraries
import time
import urllib.request
from urllib.parse import urlparse
import os
import requests
import io
from PIL import Image
import re

class GoogleImageScraper():
    def __init__(self, search_key, image_path="downloads", limit=1, headless=True, min_resolution=(0, 0), max_resolution=(1920, 1080), max_missed=10):
        #check parameter types
        image_path = os.path.join(image_path, search_key)
        if (type(limit)!=int):
            print("[Error] Number of images must be integer value.")
            return
        if not os.path.exists(image_path):
            print("[INFO] Image path not found. Creating a new folder.")
            os.makedirs(image_path)

        for i in range(1):
            try:
                #try going to www.google.com
                options = Options()
                if(headless):
                    options.add_argument('--headless')
                driver = webdriver.Chrome(options=options)
                driver.set_window_size(1400,1050)
                driver.get("https://www.google.com")
                try:
                    WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "W0wltc"))).click()
                except Exception as e:
                    continue
            except Exception as e:
                exit("[ERR] Please update the chromedriver.exe in the webdriver folder according to your chrome version:https://chromedriver.chromium.org/downloads")

        self.driver = driver
        self.search_key = search_key
        self.number_of_images = limit
        self.image_path = image_path
        self.url = "https://www.google.com/search?q=%s&source=lnms&tbm=isch&sa=X&ved=2ahUKEwie44_AnqLpAhUhBWMBHUFGD90Q_AUoAXoECBUQAw&biw=1920&bih=947"%(search_key)
        self.headless=headless
        self.min_resolution = min_resolution
        self.max_resolution = max_resolution
        self.max_missed = max_missed
    
    def download(self, keep_filenames=False):
        image_urls = self.find_image_urls()
        self.save_images(image_urls, keep_filenames)
        del image_urls

    def find_image_urls(self):
        """
            This function search and return a list of image urls based on the search key.
            Example:
                google_image_scraper = GoogleImageScraper("webdriver_path","image_path","search_key",number_of_photos)
                image_urls = google_image_scraper.find_image_urls()

        """
        print("[INFO] Gathering image links")
        self.driver.get(self.url)
        image_urls=[]
        count = 0
        missed_count = 0
        indx_1 = 0
        indx_2 = 0
        search_string = '//*[@id="islrg"]/div[1]/div[%s]/a[1]/div[1]/img'
        time.sleep(3)
        while self.number_of_images > count and missed_count < self.max_missed:
            if indx_2 > 0:
                try:
                    imgurl = self.driver.find_element(By.XPATH, search_string%(indx_1,indx_2+1))
                    imgurl.click()
                    indx_2 = indx_2 + 1
                    missed_count = 0
                except Exception:
                    try:
                        imgurl = self.driver.find_element(By.XPATH, search_string%(indx_1+1,1))
                        imgurl.click()
                        indx_2 = 1
                        indx_1 = indx_1 + 1
                    except:
                        indx_2 = indx_2 + 1
                        missed_count = missed_count + 1
            else:
                try:
                    imgurl = self.driver.find_element(By.XPATH, search_string%(indx_1+1))
                    imgurl.click()
                    missed_count = 0
                    indx_1 = indx_1 + 1    
                except Exception:
                    try:
                        imgurl = self.driver.find_element(By.XPATH, '//*[@id="islrg"]/div[1]/div[%s]/div[%s]/a[1]/div[1]/img'%(indx_1,indx_2+1))
                        imgurl.click()
                        missed_count = 0
                        indx_2 = indx_2 + 1
                        search_string = '//*[@id="islrg"]/div[1]/div[%s]/div[%s]/a[1]/div[1]/img'
                    except Exception:
                        indx_1 = indx_1 + 1
                        missed_count = missed_count + 1
                    
            try:
                #select image from the popup
                time.sleep(1)
                class_names = ["n3VNCb","iPVvYb","r48jcc","pT0Scc"]
                images = [self.driver.find_elements(By.CLASS_NAME, class_name) for class_name in class_names if len(self.driver.find_elements(By.CLASS_NAME, class_name)) != 0 ][0]
                for image in images:
                    #only download images that starts with http
                    src_link = image.get_attribute("src")
                    if(("http" in src_link) and (not "encrypted" in src_link)):
                        #print(
                        #    f"[INFO] {self.search_key} \t #{count} \t {src_link}")
                        image_urls.append(src_link)
                        count +=1
                        break
            except Exception:
                print("[INFO] Unable to get link")

            try:
                #scroll page to load next image
                if(count%3==0):
                    self.driver.execute_script("window.scrollTo(0, "+str(indx_1*60)+");")
                element = self.driver.find_element(By.CLASS_NAME,"mye4qd")
                element.click()
                print("[INFO] Loading next page")
                time.sleep(3)
            except Exception:
                time.sleep(1)



        self.driver.quit()
        print("[INFO] Google search ended")
        return image_urls

    def save_images(self,image_urls, keep_filenames):
        print(keep_filenames)
        #save images into file directory
        """
            This function takes in an array of image urls and save it into the given image path/directory.
            Example:
                google_image_scraper = GoogleImageScraper("webdriver_path","image_path","search_key",number_of_photos)
                image_urls=["https://example_1.jpg","https://example_2.jpg"]
                google_image_scraper.save_images(image_urls)

        """
        print("[INFO] Saving image, please wait...")
        for indx,image_url in enumerate(image_urls):
            try:
                #print("[INFO] Image url:%s"%(image_url))
                search_string = ''.join(e for e in self.search_key if e.isalnum())
                image = requests.get(image_url,timeout=5)
                if image.status_code == 200:
                    with Image.open(io.BytesIO(image.content)) as image_from_web:
                        try:
                            if (keep_filenames):
                                #extact filename without extension from URL
                                o = urlparse(image_url)
                                image_url = o.scheme + "://" + o.netloc + o.path
                                name = os.path.splitext(os.path.basename(image_url))[0]
                                #join filename and extension
                                filename = "%s.%s"%(name,image_from_web.format.lower())
                            else:
                                filename = "%s%s.%s"%(search_string,str(indx),image_from_web.format.lower())

                            image_path = os.path.join(self.image_path, filename)
                            print(
                                f"[INFO] {self.search_key} \t {indx} \t Image saved at: {image_path}")
                            image_from_web.save(image_path)
                        except OSError:
                            rgb_im = image_from_web.convert('RGB')
                            rgb_im.save(image_path)
                        image_resolution = image_from_web.size
                        if image_resolution != None:
                            if image_resolution[0]<self.min_resolution[0] or image_resolution[1]<self.min_resolution[1] or image_resolution[0]>self.max_resolution[0] or image_resolution[1]>self.max_resolution[1]:
                                image_from_web.close()
                                os.remove(image_path)

                        image_from_web.close()
            except Exception as e:
                print("[ERROR] Download failed: ",e)
                pass
        print("--------------------------------------------------")
        print("[INFO] Downloads completed. Please note that some photos were not downloaded as they were not in the correct format (e.g. jpg, jpeg, png)")


def fetch_google(query, image_path="downloads", limit=10, headless=True, min_resolution=(0, 0), 
                 max_resolution=(512, 512), max_missed=10):

    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options
    from selenium.webdriver.common.by import By
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC
    from selenium.common.exceptions import NoSuchElementException 

    googleI = GoogleImageScraper(query, image_path, limit, headless, min_resolution, max_resolution, max_missed)
    googleI.download()
    del googleI


def fetch(query, limit=1, dirout='dl', adult_filter='on', 
          force_replace=False, timeout=60, filter="", verbose=0, png_conv=1):

    # engine = 'bing'
    
    image_dir = Path(dirout).joinpath(query).absolute()
    os_makedirs(str(image_dir))

    png_conv = True if png_conv == 1 else False 
    verbose  = True if verbose  == 1 else False 

        
    print("[%] Downloading Images to {}".format(str(image_dir.absolute())))
    bing = Bing(query, limit, image_dir, adult_filter, timeout, filter, verbose, png_conv)
    bing.run()



################################################################################################
class Bing:
    def __init__(self, query, limit, dirout="dl", adult="on", timeout=60,  filter='', verbose=True, png_conv=False):
        self.download_count = 0
        self.query = query
        self.dirout = dirout
        self.adult = adult
        self.filter = filter
        self.verbose = verbose
        self.seen = set()
        self.png_conv = png_conv
        assert type(limit) == int, "limit must be integer"
        self.limit = limit
        assert type(timeout) == int, "timeout must be integer"
        self.timeout = timeout

        # self.headers = {'User-Agent': 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0'}
        self.page_counter = 0
        self.headers = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) ' 
      'AppleWebKit/537.11 (KHTML, like Gecko) '
      'Chrome/23.0.1271.64 Safari/537.11',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
      'Accept-Encoding': 'none',
      'Accept-Language': 'en-US,en;q=0.8',
      'Connection': 'keep-alive'}


    def get_filter(self, shorthand):
            if shorthand == "line" or shorthand == "linedrawing":
                return "+filterui:photo-linedrawing"
            elif shorthand == "photo":
                return "+filterui:photo-photo"
            elif shorthand == "clipart":
                return "+filterui:photo-clipart"
            elif shorthand == "gif" or shorthand == "animatedgif":
                return "+filterui:photo-animatedgif"
            elif shorthand == "transparent":
                return "+filterui:photo-transparent"
            else:
                return ""




    def save_image(self, link, file_path, conv=False):

        if os.path.isfile(file_path):
            log('file exist skipping')
            return 

        request = urllib.request.Request(link, None, self.headers)
        image   = urllib.request.urlopen(request, timeout=self.timeout).read()
        
        if not imghdr.what(None, image):
            print('[Error]Invalid image, not saving {}\n'.format(link))
            # raise ValueError('Invalid image, not saving {}\n'.format(link))

        if conv:
            image = remove(image)
        with open(str(file_path), 'wb') as f:
            f.write(image)

    
    def download_image(self, link):
        self.download_count += 1
        # Get the image link
        try:
            path      = urllib.parse.urlsplit(link).path
            filename  = posixpath.basename(path).split('?')[0]
            file_type = filename.split(".")[-1]
            
            if file_type.lower() not in ["jpe", "jpeg", "jfif", "exif", "tiff", "gif", "bmp", "png", "webp", "jpg"]:
                file_type = "jpg"
            
            conv = False
            if self.png_conv:
                if file_type != "png":
                    conv = True
                    file_type = "png"
            
            if self.verbose:
                print("[%] Downloading Image #{} from {}".format(self.download_count, link))
                
            self.save_image(link, self.dirout.joinpath(f"img_{self.download_count}.{file_type}"), conv)


        except Exception as e:
            self.download_count -= 1
            print("[!] Issue getting: {}\n[!] Error:: {}".format(link, e))

    
    def run(self):
        while self.download_count < self.limit:
            if self.verbose:
                print('\n\n[!!]Indexing page: {}\n'.format(self.page_counter + 1))
            # Parse the page source and download pics
            request_url = 'https://www.bing.com/images/async?q=' + urllib.parse.quote_plus(self.query) \
                          + '&first=' + str(self.page_counter) + '&count=' + str(self.limit) \
                          + '&adlt=' + self.adult + '&qft=' + ('' if self.filter is None else self.get_filter(self.filter)) \
                          + "&sc=10-35" + "&cvid=95DD13A3E5D043939BBC3117C416C74B&cc=US&setlang=en-US&form=QBIR"
            #request_url = f"https://www.bing.com/images/search?q={urllib.parse.quote_plus(self.query)}&qs=n&form=QBIR&sp=-1&lq=0&pq=logo%20bicycle%20in%20svg%20black%20and%20white&sc=10-35&cvid=95DD13A3E5D043939BBC3117C416C74B&ghsh=0&ghacc=0&first=1&cw=1349&ch=661"
            request  = urllib.request.Request(request_url, None, headers=self.headers)
            response = urllib.request.urlopen(request)
            html = response.read().decode('utf8')
            if html ==  "":
                print("[%] No more images are available")
                break
            links = re.findall('murl&quot;:&quot;(.*?)&quot;', html)
            if self.verbose:
                print("[%] Indexed {} Images on Page {}.".format(len(links), self.page_counter + 1))


            for link in links:
                if self.download_count < self.limit and link not in self.seen:
                    self.seen.add(link)
                    self.download_image(link)

            self.page_counter += 1
        print("\n\n[%] Done. Downloaded {} images.".format(self.download_count))




################################################################################################
def google_get_images2(keywords="black and white bicyle vector art ", nmax=10):
   gimage = google_images_download.googleimagesdownload()
   arguments = {"keywords": keywords, "limit": nmax, "print_urls": True}
   img_paths = gimage.download(arguments)
   img_clean_files(img_paths)
   return img_paths


def google_get_images(keywords="black and white bicyle vector art ", nmax=10, prefix="bicycle_vector_art",
                      google_api_key="",
                      google_search_id=""                      
                      ):
    from google_images_search import GoogleImagesSearch
    import requests

    # Replace 'your_api_key' and 'your_cx_id' with your actual API key and search engine ID
    api_key  = os.environ.get("google_api_key", google_api_key) 
    search_id= os.environ.get("google_search_id", google_search_id)
    
    gis = GoogleImagesSearch(api_key, search_id)

    # Define search parameters
    _search_params = {
        'q': keyword,
        'imgSize': 'medium',
        'num': nmax
    }

    gis.search(search_params=_search_params)
    results = gis.results()

    # Download the images
    flist = []
    for i, image in enumerate(results):
        response = requests.get(image.url)
        fi = f'{prefix}_{i + 1}.jpg'
        with open(fi, 'wb') as f:
            f.write(response.content)
            flist.append( fi) 

    img_clean_files(img_paths=flist):]


def test_google():
   os.environ.get["google_api_key"]   = ""
   os.environ.get["google_search_id"] = ""
   google_get_images(keywords="black and white bicyle vector art ", nmax=10)




################################################################################################
if __name__ == "__main__":
    fire.Fire()






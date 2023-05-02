'''
pip install utilmy fire

python scraper.py  fetch --query "simple bike in black and white"  --dirout ztmp/fetch/bing/simple_bike_black/




'''
import fire
from pathlib import Path
import urllib.request
import urllib
import imghdr
import posixpath

try:
    from rembg import remove
except:
    os.system("pip install rembg")
    from rembg import remove


def fetch(query, limit=100, dirout='dl', adult_filter_off=True, 
    force_replace=False, timeout=60, filter="", verbose=True, png_conv=False):

    # engine = 'bing'
    if adult_filter_off:
        adult = 'off'
    else:
        adult = 'on'

    
    image_dir = Path(dirout).joinpath(query).absolute()

    if force_replace:
        if Path.is_dir(image_dir):
            shutil.rmtree(image_dir)

    # check directory and create if necessary
    try:
        if not Path.is_dir(image_dir):
            Path.mkdir(image_dir, parents=True)

    except Exception as e:
        print('[Error]Failed to create directory.', e)
        sys.exit(1)
        
    print("[%] Downloading Images to {}".format(str(image_dir.absolute())))
    bing = Bing(query, limit, image_dir, adult, timeout, filter, verbose, png_conv)
    bing.run()

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
        request = urllib.request.Request(link, None, self.headers)
        image = urllib.request.urlopen(request, timeout=self.timeout).read()
        if not imghdr.what(None, image):
            print('[Error]Invalid image, not saving {}\n'.format(link))
            raise ValueError('Invalid image, not saving {}\n'.format(link))
        if conv:
            image = remove(image)
        with open(str(file_path), 'wb') as f:
            f.write(image)

    
    def download_image(self, link):
        self.download_count += 1
        # Get the image link
        try:
            path = urllib.parse.urlsplit(link).path
            filename = posixpath.basename(path).split('?')[0]
            file_type = filename.split(".")[-1]
            if file_type.lower() not in ["jpe", "jpeg", "jfif", "exif", "tiff", "gif", "bmp", "png", "webp", "jpg"]:
                file_type = "jpg"
            if self.png_conv:
                if file_type != "png":
                    conv = True
                    file_type = "png"
            else:
                conv = False
            if self.verbose:
                # Download the image
                print("[%] Downloading Image #{} from {}".format(self.download_count, link))
                
            self.save_image(link, self.dirout.joinpath("Image_{}.{}".format(
                str(self.download_count), file_type)), conv)
            if self.verbose:
                print("[%] File Downloaded !\n")

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
            request = urllib.request.Request(request_url, None, headers=self.headers)
            response = urllib.request.urlopen(request)
            html = response.read().decode('utf8')
            if html ==  "":
                print("[%] No more images are available")
                break
            links = re.findall('murl&quot;:&quot;(.*?)&quot;', html)
            if self.verbose:
                print("[%] Indexed {} Images on Page {}.".format(len(links), self.page_counter + 1))
                print("\n===============================================\n")

            for link in links:
                if self.download_count < self.limit and link not in self.seen:
                    self.seen.add(link)
                    self.download_image(link)

            self.page_counter += 1
        print("\n\n[%] Done. Downloaded {} images.".format(self.download_count))





if __name__ == "__main__":
    fire.Fire()






def zz_notuser():
        query = input("Enter your query: ")
        limit = input("Enter number of images: ")
        try:
            limit = int(limit)
        except:
            print("Limit should be integer value, using 100 as default")
            limit = 100
        out_dir = input("Enter OutPut Dir (Default 'dl'): ")
        if out_dir == "":
            out_dir = "dl"
        png_conv = input("AutoConvert to png (Y or N)")
        if png_conv in ["y", "Y"]:
            png_conv = True
        else:
            png_conv = False





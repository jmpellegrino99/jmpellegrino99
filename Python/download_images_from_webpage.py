import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

# Function to create a directory if it doesn't exist
def create_directory(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

# Function to download all JPG images from a webpage
def download_images(url, directory):
    # Send a GET request to the URL
    response = requests.get(url)
    
    # Parse the HTML content of the page
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Find all image tags (img) with src attribute containing '.jpg'
    image_tags = soup.find_all('img', src=lambda x: x and x.endswith('.jpg'))
    
    # Create directory to store downloaded images
    create_directory(directory)
    
    # Download each image
    for img in image_tags:
        img_url = urljoin(url, img['src'])  # Construct absolute image URL
        img_name = img_url.split('/')[-1]   # Extract image file name
        img_path = os.path.join(directory, img_name)  # Create path for saving image
        
        # Download image
        with open(img_path, 'wb') as f:
            f.write(requests.get(img_url).content)
            print(f"Downloaded: {img_path}")

# Example usage:
url = "https://example.com"  # Replace with the URL of the webpage containing JPG images
directory = "downloaded_images"  # Directory to save downloaded images
download_images(url, directory)


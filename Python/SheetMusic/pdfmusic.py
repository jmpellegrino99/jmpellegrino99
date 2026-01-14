from bs4 import BeautifulSoup
import requests
import pandas as pd


def get_html_content(url):
    """Fetches the HTML content of a given URL, handling 406 errors."""
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching URL: {e}")
        return None

    return response.content  # Return the content directly for BeautifulSoup


def get_element_by_id(html_content, target_id):
    """Finds the element with the specified ID from HTML content."""
    soup = BeautifulSoup(html_content, "html.parser")
    return soup.find(id=target_id)


def get_all_a_elements(target_element):
    """Gets all <a> elements within a target element."""
    return target_element.find_all("a")


def get_mid_links(url):
    """Fetches the HTML content of a URL and extracts the first .mid link."""
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching URL: {e}")
        return None  # Return None to signal that no link was found

    soup = BeautifulSoup(response.text, "html.parser")
    for link in soup.find_all("a", href=True):
        if ".pdf" in link["href"]:
            return link["href"]  # Return the first .mid link found


# Main Script
target_url = "https://www.sheetmusicsinger.com/"
html_content = get_html_content(target_url)

target_id = "pages-4"
target_element = get_element_by_id(html_content, target_id)
all_a_elements = get_all_a_elements(target_element)
links_for_download = [a.get('href') for a in all_a_elements if a.get('href')]

final_results = []
for i, link in enumerate(links_for_download[1000:], start=1): 
    result = get_mid_links(link)
    if result:
        final_results.append(result)
        if i % 25 == 0:  # Save every 25 results
            df = pd.DataFrame(data={"link": final_results})
            df.to_csv(f"midi_links{i}.csv", index=False)

# Save any remaining results
if final_results:
    df = pd.DataFrame(data={"link": final_results})
    df.to_csv(f"midi_links_final.csv", index=False)


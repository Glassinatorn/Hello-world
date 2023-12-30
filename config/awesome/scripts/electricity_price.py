import requests
from lxml import html

# get and parse website
response = requests.get("https://www.elbruk.se/")
html_content = response.content
tree = html.fromstring(html_content)

# Extract se1, se2, se3, se4 electricity price
result = tree.xpath('//span[@class = "info-box-number"]')

# Extract se4
result = result[3].text

# Print the result
print(f'results: {result}')
file = open("../data/electricity_price.txt", "w+")
file.write(result)
file.close()

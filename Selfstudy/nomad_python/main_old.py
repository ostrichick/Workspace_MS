import requests
from bs4 import BeautifulSoup
# import requests
# from bs4 import BeautifulSoup

# indeed_result = requests.get("https://www.indeed.com/jobs?q=korean%20teacher&limit=50") # print(indeed_result.text) # 해당 페이지에서 html소스를 통째로 긁어옴

# indeed_soup = BeautifulSoup(indeed_result.txt, "html.parser")

# print(indeed_soup)
indeed_result = requests.get("https://www.coupang.com/np/categories/186764?page=1")

indeed_soup = BeautifulSoup(indeed_result.text,"html.parser")

# print(indeed_result.text),"html.parser"

pagination = indeed_soup.find("div",{"class":"pagination"})

print(pagination)
# ?
# !
# todo
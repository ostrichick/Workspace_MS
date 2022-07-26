import requests
from bs4 import BeautifulSoup

# indeed_result = requests.get("https://www.indeed.com/jobs?q=python&limit=50")
indeed_result = requests.get("https://job.alio.go.kr/recruit.do?pageNo=1&idx=&recruitYear=&recruitMonth=&location=R3009&location=R3024&career=R2010&career=R2030&education=R7010&eduType=multi&s_date=2022.05.03&e_date=2022.07.03&org_type=&org_name=&ing=2&title=&order=REG_DATE")

# print(indeed_result.text)

indeed_soup = BeautifulSoup(indeed_result.text, "html.parser")
# print(indeed_soup)

pagination = indeed_soup.find("div", {"class":"page"})

# print(pagination)
links = pagination.find_all('a')
pages = []
# print(links)

for link in links[2:-2]:
    # print(link.find("span"))
    # pages.append(link.find("span").string)
    pages.append(int(link.string))
# pages = pages[0:-1]
max_page = print(pages[-1])



## 스크레이핑(scraping)
웹사이트에서 특정 데이터를 수집하는 것.
## 크롤링(crawling)
크롤러 또는 스파이더라는 프로그램으로 웹 사이트에서 데이터를 추출하는 것
보통 스크레이핑과 크롤링을 구분하지 않고 웹에서 데이터를 수집하는 작업을 크롤링이라 한다.
- HTTP통신 : 웹은 일반적으로 HTTP통신을 사용한다. 사용자가 데이터를 가지고 있는 서버(웹사이트)의 url에 접속하여 수집할 데이터에 HTTP요청을 하면 서버가 그에대한 응답을 JSON 또는 XML형식으로 보내는 방식이다. 이때 사용하는 것이 웹 API이다. 
- 웹 API : 지도, 검색, 주가 , 환율 등 다양한 정보를 가지고 있는 웹 사이트의 기능을 외부에서 쉽게 하용할 수 있도록 사용 절차와 규약을 정의한 것.
- API가 없는 웹페이지에서 크롤링을 하려면 웹 페이지의 HTML 구조를 분석한 뒤 필요한 데이터를 직접 크롤링 해야한다. 웹 페이지의 HTML 구조를 분석하는 작업을 HTML 파싱이라고 하는데 파이썬에서는 HTML 파싱을 위해 BeautifulSoup 라이브러리를 사용한다.

## BeautifulSoup 
1. 설치 : pip install beautifulsoup4
2. 임포트 : from bs4 import BeautifulSoup
3. html 작성 : 태그와 태그사이에 띄어쓰기 하지 않아야함. 띄어쓰기가 있으면 string 명령이 잘못 처리되어 NONE으로 출력되기 때문
4. BeautifulSoup 객체 생성 : soup=BeautifulSoup(html, 'html.parser') =>HTML을 저장한 문자열 객체인 html 지정, 사용할 분석기로 html.parser
5. 객체에 저장된 html 내용 확인 : print(soup.prettify()) 

## BeautifulSoup 연습
1. soup.h1 : soup에 저장된 태그중에서 첫 번째 h1 태그 한개만 파싱하여 반환
2. soup.find_all("ul") : soup에 저장된 태그 중에서 ul 태그를 모두 찾아 리스트로 반환하기

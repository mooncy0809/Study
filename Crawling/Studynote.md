## Web에서의 데이터 수집

1. http://www.data.go.kr등에서의 정리된 데이터 파일의 다운로드, CSV, Excel등의 형태가 주로 이용됨.
   - 데이터 구조(메타 정보)를 제공함

2. Kaggle등에서의 전세계적으로 공개된 다양한 분야의 데이터 다운로드, CSV등의 형태
   - 데이터 구조(메타 정보)를 제공함
   
3. Rest Web URL 기반, JSON 형태가 주로 이용됨
   - 접근 할 수 있는 Access Key를 발급하여 자료 제공하는 경우가 많음.
   - 사전에 JSON 처리에 대한 사전 지식이 있어야함.
   - 대부분의 기업들이 자신의 Contents를 제공하는 방식임.
   - 데이터 구조(메타 정보)를 제공함
   - Rest 기반의 Access Key를 제공하고 일정 이용 빈도 이상은 요금을 청구함.

4. Crawling
   - Crawling: 파일, 이미지등 resource를 수집하는 기능을 주로 함.
   - Scraping: 웹페이지의 소스를 읽어서 특정 태그의 문자열 및 숫자등 데이터 수집
   - 일반적으로 Crawling, Scraping을 동일한 의미로 사용하는 경우도 많음.
   - 데이터 구조(메타 정보)를 제공하지 않음으로 개발자가 웹페이지의 내용을 분석하여 구조를 파악해야함
   - HTML, CSS에 대한 사전 지식이 있어야함.
   - 크롤링은 웹페이지의 구조가 변경(년간, 계절, 이벤트등)되면 변경된 구조를 인식 할 수 있도록
     파이썬 코드를 변경해야하나 Rest API 방식은 데이터를 제공하는 형식이 거의 변경이 없음.
 
 
## BeautifulSoup
- HTML 문서를 Python 객체로 자동변환하여 편리한 태그 검색을 지원
- HTML 소스를 다운받고 연결을 해제함.
- Web 페이지의 내용을 네트웍에 접속하여 HTML 태그를 메모리로 다운로드한 후 분석
- 태그를 쉽게 검색하기위한 함수들이 제공됨으로 편리함.
- 복잡한 데이터는 정규표현식을 사용 할 수 있음.
- 정규표현식만을 이용하여 검색을 할 수 있으나 HTML의 복잡한 구조 때문에,
  Regular Expression(정규 표현식)과 BeautifulSoup을 같이 사용할 수 있음.
- 데이터 수집시 사용자가 웹페이지를 이용하는 것처럼 상호 작용을 처리하기는 어려움.
- https://www.crummy.com/software/BeautifulSoup/
<div><span style="font-size:20px">1) BeautifulSoup 객체 구조</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; html &rarr; &lt;html&gt; .... &lt;/html&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; head &rarr; &lt;head&gt; .... &lt;/head&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; title &rarr; &lt;title&gt;A Useful Page&lt;/title&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; body &rarr; &lt;body&gt; ..... &lt;/body&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; h1 &rarr;&lt;h1&gt;An Interesting Title&lt;/h1&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; div &rarr; &lt;div&gt; .... &lt;/div&gt;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .....<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .....<br />
&nbsp;&nbsp;<br />
2)&nbsp;get_text()<br />
- 태그를 없애고 순수 문자열을 산출합니다.<br />
&nbsp;&nbsp;</span>

<div><span style="font-size:20px">3)&nbsp;find(),&nbsp;findAll()&nbsp;함수</span></div>

<div><span style="font-size:20px">- 하나의 태그 검색</span></div>

<div><span style="font-size:20px">- find(&quot;table&quot;,{&quot;id&quot;:&quot;giftList&quot;}): &lt;TABLE&gt; 태그중에 id 속성의 값이 &#39;giftList&#39;인 태그<br />
- findAll(id=&quot;firstHeading&quot;): 여러개의 태그 검색, children 속성 지원안함.</span></div>

<div><span style="font-size:20px">- children: 후손 태그의 list_iterator, list 값을 순차적으로 추출 가능</span><br />
&nbsp;
<div><span style="font-size:20px">4)&nbsp;형제 태그 다루기</span></div>

<div><span style="font-size:20px">- find(&quot;table&quot;,{&quot;id&quot;:&quot;giftList&quot;}).tr.next_siblings: &lt;table&gt; 태그중에 id 속성의 값이 &#39;giftList&#39; 태그를 검색 한 후</span></div>

<div><span style="font-size:20px">&nbsp;두번째 &lt;tr&gt;태그부터 산출함.</span></div>
<span style="font-size:20px"> &nbsp;</span>

<div><span style="font-size:20px">5)&nbsp;부모 태그 다루기</span></div>

<div><span style="font-size:20px">- print(bsObj.find(&quot;img&quot;,{&quot;src&quot;:&quot;../img/gifts/img1.jpg&quot;}).parent.previous_sibling.get_text()):</span></div>

<div><span style="font-size:20px">&nbsp; . img 태그중에 src 속성의 값이 &nbsp;&#39;../img/gifts/img1.jpg&#39;인 태그를 검색</span></div>

<div><span style="font-size:20px">&nbsp; . 부모 태그 검색</span></div>

<div><span style="font-size:20px">&nbsp; . 부모 태그의 이전 형제 검색</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &lt;td&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; $15.00</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &lt;/td&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp;&lt;td&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &lt;img src=&quot;../img/gifts/img1.jpg&quot;&gt;</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &lt;/td&gt;</span></div>
</div>
<span style="font-size:20px"> &nbsp;</span>

<div><span style="font-size:20px">6)&nbsp;정규 표현식<br />
- 문자열 검색과 변경을 지원하는 문법</span></div>

<div><span style="font-size:20px">- images = bsObj.findAll(&quot;img&quot;, {&quot;src&quot;:re.compile(&quot;\.\.\/img\/gifts/img.*\.jpg&quot;)})</span></div>

<div><span style="font-size:20px">- re.compile(&quot;&quot;): 정규 표현식을 사용하기전에 파싱하여 메모리상에 최적화 함.&nbsp;<br />
- .는 &#39;\&#39;를 이용하여 기능이 없는 단순 문자로 사용 가능</span></div>

<div><span style="font-size:20px">- &quot;\.\.\/img\/gifts/img.*\.jpg&quot;: ../img/gifts/img로 시작하며 .*는 한문자와 대응하는 모든 문자열이며</span></div>

<div><span style="font-size:20px">&nbsp; \.jpg는 .jpg로 끝나는 모든 문자열</span></div>

<div><span style="font-size:20px">- .*: 모든 문자와 대응, 앞에 나오는 문자가 없거나 한번 이상 대응, 가장 긴 문자열 최대 일치,</span></div>

<div><span style="font-size:20px">&nbsp; &nbsp; &nbsp;줄바꿈을 제외한 모든문자</span></div>
</div>

<div><br />
&nbsp;</div>

## Selenium
- Web 페이지(HTML, Javascript...)의 내용을 네트웍에 접속하여 필요한 부분만 메모리로 다운로드한 후
  데이터를 수집하고 연결을 유지함.
- https://www.instagram.com의 경우는 로그인을해야 데이터 수집이 가능함.
- 데이터 수집시 마치 사용자가 웹페이지를 이용하는 것처럼 상호 작용을 가능하게 함. 
- 데이터 수집에 필요한 로그인, 문장 입력 및 마우스 클릭등의 기능 지원
- 매크로 제작을 지원하는 패키지
- https://www.selenium.dev
## robots.txt
- 데이터 수집을 허락 또는 거부한다는 목록
- 프로그램적인 기능은 없는 text 파일
- 많은 Crawling은 크롤링되는 사이트에 트래픽 유발등 부하가 발생함으로 허가하지 않음.
- 크롤링은 현재 페이지의 컨텐츠를 수집하는 것이고 접속 기록이 모두 Log에 남으로 주의가 필요함.
- Crawling 기능을 거부하고 Rest 기반의 Access Key를 제공하고 일정 이용 빈도 이상은 요금을 청구함.

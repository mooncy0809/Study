## 모바일앱 개발의 종류



1. HTML5 기반 Mobile Web
   - 컨텐츠를 모두 web 기술로 제작합니다.
   - 개발이 쉽고 기존 개발자를 그대로 이용할 수 있습니다.
   - 개발을 위해 새로운 기술을 습득할 필요가 거의 없다. 
   - 안드로이드, iPhone 구분없이 개발이 가능합니다. 한번 개발로 대부분의 
     환경에서 이용가능하다.
   - 현재 기업에서 전산화하여 제작된 웹사이트를 적은 수정으로 그대로 이용할 수 
     있습니다.
   - 컨텐츠를 Web 기반으로 제작 후 스마트폰 개발 환경에서 특정 웹사이트로
     연동 설정을 합니다.
   - 웹 환경상에 보안 관련 기능을 그대로 사용가능합니다.
   - 스마트폰의 OS(하드웨어) 영역에 접근이 어려워 성능을 최적화가 어렵다.
   - 스마트폰의 센서등 하드웨어 정보 사용이 매우 어렵다.
   - 마켓 배포가 불가능함으로 크롬이나 Safari를 이용하여 접속 
   예) Desktop, Mobile 동시 지원: 기상청...  
        Desktop, Mobile 분리 개발: Naver, Daum...



2. Hybrid App
   - 사이트는 HTML5 기반 모바일웹으로 만들고 Android, IPhone 개발 환경을 구성하여
     WebView등 브러우저 콘트롤 기능만 20~30줄 내외로 사용하여 마켓 배포가 가능한 앱의 형태.
   - 컨텐츠를 모두 web 기술로 제작합니다.
   - 개발이 쉽고 기존 개발자를 그대로 이용할 수 있습니다.
   - Javascript를 이용하여 스마트폰의 센서등 하드웨어 정보를 사용할 수 있다.
   - 안드로이드, iPhone 구분없이 개발이 가능합니다. 한번 개발로 대부분의 
     개발환경에서 이용가능하다.
   - 스마트폰의 OS(하드웨어) 영역에 일부만 접근이되어 일부의 성능만 최적화가 가능하다.
   - 컨텐츠를 Web 기반으로 제작 후 스마트폰 개발 환경에서 특정 웹사이트로
     연동 설정을 합니다.
   - 현재 기업에서 전산화하여 제작된 웹사이트를 적은 수정으로 그대로 이용할 수 
     있습니다.
   - 마켓 배포시에 기업에서 가장 많은 개발 패턴으로 이용하고 있습니다.
   - 개발을 위해 Phonegap(Codova)등의 기술을 습득할 필요가 있으나 사용하지 않아도
     구현이 가능하다. 
   - Phonegap은 하이브리드 기능 구현이 우수하나 외부 JSP/Spring Server와 통신이 불가능하여
     개발자는 JSONP라는 기술을 추가로 습득해야하며, 소스가 폰에 내장되어
     보안성이 없어 기업에서 적용시 단점으로 작용합니다.
     이러한 문제는 역컴파일(소스 복원)의 대상이 되기도 합니다.
   - Phonegap의 대안으로 브러우저에 내장된 Webview등을 이용한 Hybridapp 구성이
     많이 구현되고 있습니다.
     예) 마켓으로 배포가되는 대부분의 앱, 교보문고, 영풍문고, 금융, 기업 관련등 90%이상

     * RFID, NFC관련 팀프로젝트 진행시 RFID/NFC 발생 데이터 수집을 위하여
       WebView 기반의 Hybrid App 수업을 진행함으로 프로젝트 주제 결정시 참고할것.    

     * Hybrid App을 전문적으로 개발하는 환경이 Phonegap -> Reactive Native등으로 변화되고 있음.
 
 
3. Native App
   - 순수 안드로이드/아이폰 개발툴로 개발한 형태로 스마트폰 고유의 코드를 
     이용합니다.
   - 안드로이드는 JAVA 이용, iPhone은 Object C 를 사용합니다.
   - 개발자는 개발을 위해 추가적인 교육이 필요할 정도의 난이도를 가지고 있습니다.
   - 주요 개발 분야는 3D Game, 센서 데이터 수집 분야, Embeded분야등에서 사용.
   - 폰의 하드웨어 접근 분야
   - 3D game분야는 Unitity 3D, Cocos2D 등을 이용하여 개발환경이 만들어지고
     있으며, 한번의 개발로 Android, iPhone, Window Mobile 환경의 게임이
     생성됩니다.(카카오같은 경우는 게임 등록시 Android, iPhone을 필수로 등록해야합니다.)
   - Game 개발은 스마트폰 기술을 습하는데 많은 도움이됩니다.
   - HTML5의 Canvas, Javascript는 3D구현이 가능한 기본 태그로 향후 게임 시장에서 많은 
     비중을 차지할 것으로 예상됩니다. 이유는 Canvas 기반의 게임은 Smartphone,
     SmartTV, Tablet등 거의 모든 기기에서 아무런 설정 없이 그냥 실행이 가능합니다.
   - 현재 기업에서 전산화하여 제작된 웹사이트를 이용할 수 없어 중복 투자가 
     발생합니다.
   - 데이터 처리가 많은 기업의 App 개발시 데이터처리 부분에 웹관련 기술이 연동이
     이루어져야함으로 개발에 많은 비용과 시간이 소요됩니다.
     
      Android <---> DBMS: 보안상 개발 어려움, 접속 처리 불편
  
      Android <---> JSP/Spring <---> MyBATIS3 <---> DBMS: 개발 절차가 복잡함.
                          ------------------------------
                                    Middleware

      Android(WebView: CSS, HTML5) <--> JSP/Spring <--> MyBATIS3 <--> DBMS: 권장 모델
     
       
  
## View Port의 개념과 기능
    - Desktop 기준의 큰 화면이 모바일 기기로 출력될 경우 화면이 축소되어 출력되는
      현상을 제거하는 기능을 제공합니다.
 
1. 화면의 종류
   - 560dpi(QHD): 1440 X 2560
   - xxhdpi: 1080 X 1920
   - xhdpi(HD): 768 X 1280, 720 X 1280
   - hdpi: 480 X 800
   - mdpi: 480 X 854, 480 X 800, 320 X 480
   - ldpi: 240 X 432, 240 X 400, 230 X 320
   <br>
   ![image](https://user-images.githubusercontent.com/84116509/174610875-933b763b-94b2-48aa-bb76-b5c3bd2b010e.png)

 
          
 
  
2. View port 사용법
    <meta name="viewport" content="user-scalable=no, width=device-width" />     
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0
                                                  maximum-scale=1.0; user-scalable=yes;">
    - width=device-width; 가로 화면 전환시 화면에 맞게 페이지 폭이 넓어지게 된다.
                                 쓰지 않을 경우 화면이 폭에 맞추어 확대됨. 
      device-width 옵션은 iPhone OS 1.1.1 이후 적용.
    - initial-scale=1.0: 초기화면을 해당 비율로 확대하여 보여주는 옵션
    - minimum-scale=1.0: 최소 축소 비율
    - maximum-scale=1.0: 확대할 수 있는 최대값 (범위 0~10.0) 디폴트값은 1.6
    - user-scalable=yes: 사용자가 화면을 확대할 수 있도록 허용
 
    - 자동 축소 지원 안함 
      <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                                    maximum-scale=3.0, width=device-width" /> 

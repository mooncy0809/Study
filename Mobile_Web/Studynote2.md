## 미디어쿼리(Media Query)를 이용한 모바일 장비의 인식

1. userAgent의 실습 
- 최근에는 스마트폰의 해상도가 좋아져서 해상도로 디바이스를 구분하는 것이 
  어려워져 userAgent 객체를 사용하여 장치를 구분하는 것이 좋다. 
- 모바일 브러우저는 userAgent 객체를 지원하여 모바일 브러우저인지 확인이 가능하다. 
- Android userAgent 값
Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36 
 
  
* 고전적인 방법
  - 화면 사이즈를 통한 고전적인 스마트폰의 구분
    1) 화면 좌측 상단의 좌표값은 0, 0으로 시작함.
    2) media="screen and (max-width:799px)"
       화면을 대상으로 화면의 최대크기가 800px 미만인 디스플레이를 대상으로 함.
       일반적으로 스마트폰 장치
    3) media="screen and (min-width:800px)"
       화면을 대상으로 화면의 최소크기가 800px 이상인 디스플레이를 대상으로 함.
       일반적으로 데스크탑 장치
 

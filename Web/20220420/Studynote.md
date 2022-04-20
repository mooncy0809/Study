## DOM(Document Object Model)을 이용한 태그 조작

1. 처리 모델(방법)의 분류

1] Javascript core
   - 데이터 타입, 배열, 제어문등 기본 문법

2] Browser BOM(Browser Object Model)
   - browser 의 기능을 처리하는 문법

3] HTML DOM(Document Object Model)
   - DOM 모델은 태그의 생성 및 변경, 삭제, 속성의 지정, 스타일의 지정등을
     처리할 수 있다.
   - 브러우저가 HTML 태그를 객체지향적인 방법으로 다루는 처리 모델
   - 태그 및 객체는 요소노드(Element Node)와 값을 저장하고 있는
     텍스트노드(Text Node)로 구분

4] HTML Objects
   - 자바스크립트가 객체지향적인 방법으로 HTML Tag 사용 지원

5] JavaScript가 HTML 관련 기능을 지원하는 DOM 계층도<br>![image](https://user-images.githubusercontent.com/84116509/164229310-cd90800f-dcf3-425c-92bc-2118a2cce544.png)
1. 태그의 검색 및 태그의 생성
   - element는 태그를 나타냅니다.
   - element.getElementById(id): id를 이용하여 태그를 검색  
   - element.innerHTML: 태그를 생성하여 값을 할당 
   - element.createElement(tagName): 요소 노드(태그)를 생성 
   - element.createTextNode(text): 텍스트 노드(값)를 생성 
   - element.appendChild(code): 객체에 노드(태그)를 연결
 

2. 속성의 지정
   - Attribute는 속성을 나타냅니다.
   - element.setAttribute(name,value): 태그(객체)의 속성을 지정 
   - element.getAttribute(name): 태그(객체)의 속성을 가져옴 


3. 스타일(CSS)의 지정
   - CSS를 지정할수 있습니다.
   - font-family->fontFamily 처럼 '-'을 제거후 마디를 대문자로 변환합니다.
   - element.style.border = 'solid 1px #FF0000';
   - element.style.color = '#FFFFFF';
   - element.style.fontFamily = '맑은 고딕';


4. 태그의 삭제
   - element.removeChild(): 태그 삭제


5. Javascript 코드의 위치
   - <HEAD> 태그안에는 함수가 선언됩니다.
   - <BODY> 값을 출력하는 코드가 위치합니다.
   - 함수는 순서와 상관없이 인식되며, 호출하지 않으면 실행되지 않습니다.


6. 함수선언을 분리 할 수 있습니다.
   - 함수명을 변수명처럼 사용가능합니다.
  ```
   function sum(){
   }

   var sum = function(){
   }

   function sum(kor, eng){
     alert(kor + eng);
   }

   var sum = function(kor, eng){
     alert(kor + eng);
   }

   vat tot = sum;
  ```
 
7. 페이지 로딩시 자동 호출
  - <BODY> 태그의 자식 태그들이 브러우저의 메모리에 상주되고나서 호출됨.
    HTML 메모리에 저장 --> window.onload 실행 
  ```
    <script type="text/javascript">
      window.onload = function(){
        alert('javascript 호출됨.');
      }
    </script>
  ```
  
## Event의 처리(BUTTON, SUBMIT) 
```

1) <A href="javascript:sendit();">에서 javascript 키워드 생략 불가능.

2) 자바 스크립트 함수로 <FORM> 태그 전달, Form 객체의 접근
    - onclick 이벤트는 javascript 키워드 생략 가능.
    - onclick="check(document.frm);": <FORM> 태그 전달
    - onclick="check(this.form);": <FORM> 태그 전달
    - onclick="check(frm);": <FORM> 태그 전달
    - onclick="check(this);": 현재 태그 전달
 
3) 태그의 검색과 값 추출
     - name으로 찾는 경우
       var price = document.frm.price.value; 
       console.log(price);

     - id 로 찾는 경우
       var price = document.getElementById('price').value;
       console.log(price);

4)  NaN(Not a Number): 문자열 - true, 숫자 - false,
                                숫자가 필요한 곳에 숫자가 없으면 NaN이 출력됨.
    예)
     console.log('--> isNaN(123): ' + isNaN(123));   // false
     console.log("--> isNaN('ABC'): " + isNaN('ABC')); // true
     console.log('--> ' + isNaN(frm.cnt.value)); // true, 태그의 값은 기본적으로 문자로 처리됨
     console.log('--> frm.cnt.value: ' + frm.cnt.value);  

     // 폼의 입력은 문자열 타입임으로 숫자 타입으로 변환하여 사용
     console.log('--> ' + parseInt(frm.cnt.value)); 

5) 문자열의 길이
    예)
     var str = frm.cnt.value;
     console.log('--> str.length: ' + str.length);  // 0

 
6) trim() 문자열의 공백을 제거합니다.
   - API: http://www.w3schools.com/jsref/jsref_trim_string.asp


7)  location.href를 통한 폼 데이터 전송
   - onClick='check(this.form)': this.form은 폼 태그를 말합니다.
     예)  location.href='./input_proc.jsp?rname=' + rname + '&py=' + py; 

8) 버튼의 사용
   - HTML4:
     <input type='reset' value='기본값'>
     <input type='submit' value='등록'>

   - HTML5:
     <button type='reset'>기본값</button>
     <button type='submit'>등록</button>
 
   - reset: 태그의 기본 값으로 돌아감, 입력 취소.
   - submit: 서버로 폼의 내용을 전송함.
   - image태그는 submit 태그와 같은 기능을하며 버튼 이미지를
     사용할 수 있음.

9) Anchor 태그에서 click 이벤트를 받는 소스
   예) <A href="javascript:send3();">신청3</A>

10) Anchor 태그에서의  submit 처리
   - <A> 태그는 <Form>태그와 관련이 없어서 this.form 객체를 사용 할
     수 없습니다.
     예) <A href="javascript:send(frm);">신청</A>

11) JAVA처럼 Method Overloading은 지원하지 않습니다.
     따라서 함수명은 모두 고유해야합니다.

12) comma 출력
  function comma(su) {
    return su.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

 
1. INPUT 태그의 자바스크립트 접근
    - button 태그는 submit, reset 태그외에는 버튼 자체에
      등록된 이벤트가 없음으로 항상 onclick() 이벤트를 선언할 필요가
      있음으로 자바스크립트 함수와 같이 사용됩니다.

    - document: 현재 문서를 나타내는 객체입니다. 문서안에 선언된 태그를
      계층적(tree)으로 접근합니다.
      예) document.frm.dev.value='아로미';
           문서.form의 name 속성.input 태그 이름.속성 = 값;

    - <input> 태그에 할당된 숫자는 문자열로 처리됨으로 parseInt()등 함수로
      형변환을하여 사용해야함.
      <input type='number' name='cnt' value='' step='1' min='1' max='10'>: 문자열로 인식됨.

    - document.getElementById("no") 이용
      var no = document.getElementById("no");            // id='no'인 태그 객체
      var age = document.getElementById("age").value;  // id='age'인 태그 객체의 값
      var option = no.options[no.selectedIndex].text;      // 선택된 <SELECT> 태그의 값
      document.getElementById("result").value = txt;      // id='result'인 태그에 값을 할당

    - <button type='button' onclick="price(this.form);">금액 계산</button>
      . this: button 태그를 나타내는 객체
      . this.form: button 태그가 속한 form 태그

    - [<A href='javascript:price(frm2)'>계산1</A>]
      . href 속성의 값으로 함수 선언시 'javascript'를 선언해야함.

    - API: http://www.w3schools.com/jsref/jsref_obj_global.asp
```

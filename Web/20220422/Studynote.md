## Javascript framework jQuery  
   - 브러우저에 내장된 자바스크립트 처리엔진이 달라 발생하는
     브러우저(Chrome, IE, Safari, Firefox, Opera...)간 부족한 호환성을 해결하는
     기능 제공. 
     * MS 엣지에서는 크롬과 같은 브러우전 엔진을 사용하여 IE에서 발생했던 문제점들이 없어짐.
     (Edge부터는 Chrome과 엔진이 같아져 개발자가 같은 코드 적용 가능) 

   - Framework: 자동화된 코드의 집합, 자동화된 코드를 개발자에게 제공함으로
     개발과정에서 일어나는 반복적인 작업을 줄이는 효과가 있음,
     하지만 개발 방법이 지정되어 있어 개발자가 새로운 문법을 학습해야하는 단점이 있음. 
 
   - Aajx를 구현할 경우 순수 Javascript를 이용한 구현보다 간결한 문법 구조를 가지고 있음. 

   - 복잡한 Core Javascript의 구현시 DOM 문법(document.getElementById(''))을
     매우 간결하게 해주어 개발 속도를 향상 할 수 있음 

   - jQuery의 기능을 확장할 수 있는 plugin 구조를 지원함 
     . 파일을 전송할 수 있는 Form plugin, Bootstrap등. 

   - 다른 Javascript Framework과의 충돌을 간단히 jQuery.noConflict() 함수로 해결함. 

   - Form의 값을 자동으로 수집하여 serialize(변수와 값을 직렬화) 함수를 통해 전송가능함. 

[참고] 개발시 많이 사용되는 jQuery 문법 모음 ★
```
[01] selector를 이용한 DOM Element(태그)의 검색 
   - CSS 문법을 확장해서 태그를 찾는 셀렉터를 제공. 
   - 특정 브러우저에 의존적인 스크립팅을 벗어 날 수 있음. 
 
1. Selector 기본 문법 
   - 사용법: $("") 
   - 용어: 태그 = Element, 속성 = Attribute 
   - foo:not(bar:has(baz))는 허용하나 여러단계의 foo:not(bar:has(baz:eq(2))) 과 
     같은 중첩은 허용 안됨 
 
 
2. 기본 Selector 
   1) a           : 모든 링크 <a> 셀렉터 
   2) #fname   : fname을 아이디로 가지는 셀렉터, document.getElementById('fname') 
   3) .style01   : style01을 클래스로 가지는 셀렉터 
   4) A#fname.style01: 아이디가 fname인 <A> 태그중에서 style01 클래스를
                             가지는 셀렉터 
   5) DIV A.style01: DIV태그안에 있는 <A> 태그중에서 style01을 클래스로 가지는
                        셀렉터 
   6) *: 모든 엘리먼트 
 
 
3. 자식, 컨테이너, 어트리뷰트 Selector 
   1) div > a             : div 엘리먼트의 첫번째 a 태그 
   2) form[method]   : form태그중에서 method속성을 가지는 태그 
   3) input[type=text]: 이 셀렉터는 type이 text인 모든 input 엘리먼트 
   4) div[title^=homepage]: title attribute의 값이 homepage로 시작하는 모든 태그 
   5) a[href$=.pdf]: pdf 파일을 참조하는 모든 링크 태그를 찾아오는 셀렉터 
   6) a[href*=jquery.com]:  
      jquery.com링크를가지고 있는 모든 <a>태그를 가져오는 셀렉터 
   7) li:has(a): <a> 엘리먼트를 포함하는 모든<li> 엘리먼트 
   8) $('#parent img'): id가 parent인 img 태그
   9) $('#parent').children().eq(0): 첫번째 자식 태그
 
 
4. 위치로 태그 선택 Selector 
   1) a:first  - 첫번째 a 태그 
   2) div:odd  - 홀수 번째 div 태그 
   3) div:even - 짝수 번째 div 태그 
   4) li:first-child - li 태그의 첫번째 자식 태그 
   5) li:last  - div li:last div 태그의 마지막 li 태그 
   6) :eq(n)   - n번째로 일치하는 엘리먼트 
   7) :gt(n)   - n번째 엘리먼트(포함되지 않음)이후의 엘리먼트와 일치 
   8) :lt(n)   - n번째 엘리먼트(포함되지 않음)이전의 엘리먼트와 일치 
 
 
5. jQuery 정의 필터 Selector 
   1) :animated  - 현재 애니메이션이 적용되고 있는 엘리먼트  
   2) :button    - 모든 버튼 선택 
                input[type=submit], input[type=reset], input[type=button], button 
   3) :checkbox  - checkbox 엘리먼트 선택(input[type=checkbox]) 
   4) :checked   - 선택된 체크박스나 라디오 버튼만 선택 
   5) :contains(foo)- 텍스트 foo를 포함하는 엘리먼트만 선택 
   6) :disabled  - 비활성화 상태인 모든 FORM 엘리먼트 선택 
   7) :enabled   -  비활성화 상태인 모든 FORM 엘리먼트 선택 
   8) :file      - 모든 파일 엘리먼트를 선택(input[type=file]) 
   9) :header    - 헤더 엘리먼트 선택 
   10) :hidden   - 감춰진 엘리먼트 선택 
   11) :image    - 폼 이미지 엘리먼트 선택(input[type=image]) 
   12) :input    - 폼 엘리먼트만 선택(input, select, textarea, button) 
   13) :not(filter)- 필터값을 반대로 설정, input:not(:checkbox) 
   14) :password  - 패스워드 엘리먼트 선택(input[type=password]) 
   15) :radio    - 라디오 버튼 엘리먼트만 선택(input[type=radio]) 
   16) :reset    - button[type=reset], input[type=reset] 
   17) :selected - 선택된 엘리먼트만 선택 
   18) :submit   - button[type=submit], input[type=submit] 
   19) :text     - input[type=text] 
   20) :visible  - 보이는 엘리먼트만 선택 
 
 
6. Element, Attribute, CSS 조작 
   1) $("div").addClass("wrappedElement"): CSS class 속성의 추가 
   2) $("div").removeClass("wrappedElement"): CSS class 속성의 제거 
   3) class 추가: $(this).addClass("class_name");
   4) class 삭제: $(this).removeClass("class_name");
   5) attr 함수로 class 추가: $(this).attr('class','class_name');
   6) $("#fname").attr("value")    : fname id 값을 가지는 태그의 값 
   7) $("#fname").attr("value", "data.txt"): value 속성에 "data.txt"저장 
   8) $("#fname").css("color", "white"): color에 white 적용  
      $('#layer').css({"position": "absolute"});
      $('#layer').css({"left": x + "px"});
      $('#layer').css({"top": y + "px"});
        CSS 속성값 확인: $("변경하려는 대상").css("속성");
        CSS 속성값 변경: $("변경하려는 대상").css("속성","속성값"); 
   9) CSS 속성값 확인
      $("태그").css("속성");

      CSS 속성값 변경
      $("태그").css("속성","속성값"); 

      $(".div1").css("display","");
      $(".div1").css("display","none");
 10) A 태그
      $('#id').attr('href', '../list.do');
  
 
 7. 사용 예  
   1) $("div")             : 모든 DIV 태그    
   2) $("li a")             : li 태그의 모든 a 태그 
   3) $("#someDiv")    : id가 someDiv인 태그 
   4) $(".myList")        : CSS class가 myList인 태그 
   5) $("form[method]")   : form 태그  
   6) $("input[type=text]"): input[type=text] 
   7) $("a:first")              : 첫번째 a 태그 
   8) $(":checkbox")        : 모든 Checkbox 
   9) $(":checked")          : 모든 선택된 Checkbox 
  
  

[02] 기초 사용 코드 
  $(function(){

  });
 
1) li태그의 글자색을 빨간색으로 지정 

    $("li").css("color","red"); 
 
2) id가 fall인 태그 검색 
    $("#fall").css("color","red"); 
 
3) 태그에 지정된 클래스가 winter 인 태그 검색 
   예) <li id="winter" class="winter"> 겨울 빙어 잡이 </li> 

    $(".winter").css("color","blue"); 
 
4) 태그에 지정된 CSS class 속성이 spring이며 <B> 태그 검색 
    $(".spring b").css("color","green"); 
 
5) li태그안에 있는 모든 태그 
    $("li *").css("color","red"); 
 
6) id가 winter, spring 인 태그 
    $("#winter , #spring").css("color","red"); 
 
7) li 태그의 모든 자식 태그 
   $("li > strong").css("color","red"); 
 
8) id가 summer태그인 다음의 li 태그 

    $("#summer + li").css("color","red"); 
 
9) li태그중 첫번째 태그 

    $("li:first-child").css("color","red"); 
 
10) summer 태그 후의 모든 태그 

    $("#summer ~ li").css("color","red"); 
 
11) 첫번째 li태그후의 모든 태그 

    $("li:not(:first-child)").css("color","red"); 
 
12) 자식이나 텍스트가 없는 유사 클래스 

    $("li:empty").css("color","red"); 
 
13) 3번째 li 태그 
    $("li:nth-child(3)").css("color","red"); 
 
14) 마지막 li 태그 
    $("li:last-child").css("color","red"); 
 
15) 속성중에 id가 있는 태그 
    $("[id]").css("color","red"); 
 
16) comment 속성이 '1박2일'인 태그 
    $("[comment='1박2일']").css("color","red"); 
 
17) 폼의 값 추출 
    var name = $("#name").val(); // 태그의 value 속성의 값 
    var kuk = $("#kuk").val(); 
    var eng = $("#eng").val(); 
 
18) 태그 감추기 
    $("#panel_createForm").hide(); 
 
19) 태그 출력 
    $("#panel_createForm").show(); 

20) DIV 태그에 HTML 형식 값 할당 
    $("#panel_form").val('초기값');    
 
21) DIV 태그에 HTML 형식 값 할당 
    $("#panel_form").html(data);    
 
22) DIV 태그에 일반 문자 형식 값 할당 
    $("#panel_form").text(data);    
 
23) 태그 이름으로 태그 검색 
    var id_msg = $('#'+id_msg); // 전달받은 태그명으로 태그 검색 
 
24) 이미지 크기 구하기
- jquery 3.1.1 에러 에러 발생함.
 
  $(function(){
    $('#file2').load(function(){ // 태그 메모리 상주후 작동
      var width = $('#file2').width();
      alert('file2: ' + width); 
    });
  });

 또는 
 
  var src = "<%=root %>/pdsv3/storage/" + data.file1;
  var img = "<IMG id='layer_img' src='" + src + "'>"; // 문자열
  $('#layer_content').html(img); // 태그로 작동
 
  $('#layer_img').load(function(){ // 태그 메모리 상주후 작동
    width = this.width;  // this: img 자신, $(this): jquery가 변경 
    
    if (width > 800){
      this.width = 800; // px
    }
    show_layer(); // 레이어 출력
  });
 
  또는

  $('#layer_img').load(function(){ // 태그 메모리 상주후 작동
    // var width = $('#layer_img').width();
    // console.log("--> width: " + width);
    // console.log("--> screen.width * 0.6: " + screen.width * 0.6);
 
    if ($('#layer_img').width() > screen.width * 0.6){
      $('#layer_img').width('60%');      
    }
  });
 
25) Ajax 기반 이미지의 할당
<script type="text/javascript">
$(function() {
  // Layer click시 닫기
  $("#layer_pds4").on("click", function(){ $(this).hide(); });
});
 
// 읽어온 하나의 이미지를 Layer에 출력, 이미지 크기를 화면에 비례하여 자동 조절 
function read_fstor1_req(pdsno){
  var params = 'pdsno=' + pdsno;
  $.post('<%=root %>/pds4/read_fstor1.jsp', params, read_fstor1_res, 'json');
 
}
 
function read_fstor1_res(data) {
  var layer_img = '';
  var src = "<%=root %>/pds4/storage/" + data.fstor1;
  if (data.width > screen.width * 0.6) {
    layer_img = "<img src='"+src+"' width='"+screen.width*0.6+"'>";
  } else{
    layer_img = "<img src='"+src+"'>";
  }
  $("#layer_pds4").html(layer_img);
  $("#layer_pds4").show(); // 레이어 이미지 출력
    
}
</script>
.....
<!-- 이미지 출력 Layer -->
<div id="layer_pds4" style='margin: 0px auto; display:none; padding: 0px; text-align: center;'>
</div>
 
26) <SELECT> 태그의 index 구하기
  var index = $('#col option:selected').index();
  // alert("wordReset호출됨: " + index);
  
  if (index == 0) {
    $('#word').val('');
  }
  
  
    
[03] 폼관련 Selector

1. 사용 선언
<script type="text/JavaScript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 

 
2. 페이지 로딩시 자동 실행

1) 태그가 메모리에 로딩된후 실행, 페이지 로딩시 자동 실행
    $(function() {
      alert('1');
    });

    $(document).ready(function() {
      alert('2');
    });

    window.onload = function()  {
      alert('3');
      copyToClipboard($('#content').val());
    }
 

3. 폼태그의 입출력 
   :폼태그명 식으로 특정 종류의 폼태그를 지정합니다. 

   $(":button[id='btn3']"): 
   type="button" 인 input 태그들 중에서 id 가 'btn3'인 태그를 지정. 

   $(":checkbox[id$='hk5']"): 
   전체 체크박스 항목들 중에서 id 속성값이 'hk5'로 끝나는 항목을 지정. 

   - 버튼 태그 레이블 변경
     $('#btn').html(), $('#btn').html('등록')


4. 폼의 접근 
   - 폼이 지정된 경우
     var frmCreate = $("#frmCreate");  // frmCreate 폼 검색 

     var name = $("#name", frmCreate); // frmCreate 폼에서 id 가 name인 태그 검색 
     $("#name", frmCreate).val('홍길동');    <--- 값의 지정 
     // alert($("#name", frmCreate).val());  <--- 값의 추출 
     $("#content", frmCreate).val('홍길동전 남자 주인공');
     frmCreate.submit(); 

   - 특정 폼이 지정되지 않은 경우 
     $("#name").val('홍길동');    <--- 값의 지정 
     alert($("#name").val());     <--- 값의 추출 
 
 5. DIV는 폼태그가 아님으로 일반 검색. 
   // text(): 지정된 값을 문자열로 출력 
   // html(): 지정된 문자열을 HTML 처리 
   // html() --> DOM: document.getElementById("div1").innerHTML = str; 

   // DIV는 폼태그가 아님으로 일반 검색 
   $("#panel").text('<h1>홍길순</h1>');  <--- 일반 문자열로 태그 그대로 출력  

   // document.getElementById("read_content").innerHTML = '<h1>홍길순</h1>'; 
   $("#panel").html('<h1>홍길순</h1>'); <--- HTML 형식의 값 추가

   $("#panel").append('<h1>홍길순</h1>');  <--- 자식 태그로 추가
   $("#panel").append($('<h1>');  <--- 자식 태그로 이동
 
   var panel = $('#panel' + no).html();
  
6. 태그의 출력 및 감추기
     if($("#id").css("display") == "none"){   
        $("#id").show();  
     } else {  
        $("#id").hide();  
     }  
  
7. ajax 요청 패턴
   - json
   - jsonp: 다른 도메인의 json의 호출
   - text
   - html
   - xml
  - script

1) 단순한 형태
function checkId(){
  var params ='id=' + $('#id').val();
  $.post('./checkId.do', params, checkId_response, 'json'); // 'xml', 'text'...
}
 
function checkId_response(data){
  alert(data.msg);
}

2) 다양한 옵션을 명시하는 형태
    $.ajax({
      url: "./pay_proc.jsp",
      type: "POST",
      cache: false,
      dataType: "html", // or json
      data: $("#frm").serialize(),
      success: function(data){
        $('#content').html(data);
        $('#content').show();
      },
      // 통신 에러, 요청 실패, 200 아닌 경우, dataType이 다른경우
      error: function (request, status, error){  
        var msg = "ERROR<br><br>"
        msg += request.status + "<br>" + request.responseText + "<br>" + error;
        
        $('#content').html(msg);      
        $('#content').show();
      }
    });
  
8. <form>속성의 변경
    - $('#codeno').val(codeno): 기능은 작동하나 크롬이나 IE의 Elements에 출력이 안됨 
    - DIV 태그는 $('#layer_img').attr('width', 500): 작동안됨으로  '$('#layer_pds4').width(500);' 사용할것.
 
    $('#panel_frm').show();
    $('#frm').attr('action', './update.do');
    // $('#codeno').val(codeno); // Chrome Elements에 변경이 안됨
    $('#codeno').attr('value', codeno);
    // $('#sort').val(sort);          // Chrome Elements에 변경이 안됨
    $('#sort').attr('value', sort);
    // $('#content').val(content); // Chrome Elements에 변경이 안됨
    $('#content').attr('value', content);
    $('#submit').html('저장');
    $('#sort').focus();
  
9. serialize() 함수를 이용한 parameter 자동 추출
     var param = $("#frmSungjuk").serialize();
 
     . <TEXTAREA>는 값 추출이 안됩니다.
     . 태그의 name 속성으로 값을 추출합니다.
  
10. submit
    $('#frm').submit();
  
11. trim()
     if ($.trim($('#data').val()).length == 0) {
 
 

[04] 태그의 생성 및 추가
1. 태그 생성
var $div = $('<div>Hello</div>');
var div = document.createElement('div');
var text = document.createTextNode('Hello');
div.appendChild(text);
 
 
2. 태그의 마지막에 추가: 부모.append(자식) 또는 자식.appendTo(부모),
   기존의 태그는 이동이됨.
$('#zero').append($div);
$div.appendTo($('#zero'));
document.getElementById('zero').appendChild(div);
 
 
 
3. 첫 요소로 태그의 추가: 부모.prepend(자식) 또는 자식.prependTo(부모)
$('#zero').prepend($div);
$div.prependTo($('#zero'));
document.getElementById('zero').insertBefore(div, document.getElementById('zero').firstChild);
 
 
4. 특정 태그 다음에 추가: 부모.after(자식) 또는 자식.insertAfter(부모)
$('#zero').after($div);
$div.insertAfter($('#zero'));
document.getElementById('zero').parentElement.insertBefore(div, document.getElementById('zero').nextElementSibling);
 
 
5. 특정 태그 이전에 추가: 부모.before(자식) 또는 자식.insertBefore(부모)
$('#zero').before($div);
$div.insertBefore($('#zero')); document.getElementById('zero').parentElement.insertBefore(div, document.getElementById('zero'));
 
 
6. 특정 태그를 복사, 태그 안의 내용까지 전부 다 복사
var $zero = $('#zero').clone(); // $zero에 복사된 태그가 담김
var zero = document.getElementById('zero').cloneNode(true);

예) 태그의 재사용
   var panel_close = $('#panel_close').clone(); // 태그 복제
   $('#panel').append(panel_close); // 마지막 자식 태그로 붙임.
   .....
   <DIV id='panel_close'>
     <br>[<A href="javascript: $('#panel').hide();">CLOSE</A>]  
   </DIV>
   .....
 
 
7. 특정 태그를 제거: 
- remove는 완전히 제거, detach는 잠시 제거, 변수에 저장해두었다가 나중에 appendTo로 다시 붙일수있음.
var $zero = $('#zero').detach();
$('#zero').remove();
document.getElementById('zero').parentNode.removeChild(document.getElementById('zero'));
  
 
8. 태그 안의 내용을 비움.
$('#zero').empty();
document.getElementById('zero').innerHTML = '';
 
 
  
[05] Event

1. bind()
- 단일 요소를 각 이벤트처리기에 연결한다.
-  1.7버전이상에서 사용되지 않음
예) $(select).bind(‘click’,function(){});

 
2. live()
- 아직 생성되지 않은 엘리먼트에도 추후에 생성될 때 이용할수 있는 이벤트를 미리 걸어둘 수 있다.
-  1.7버전이상에서 사용되지 않음
예) $(select).live(‘click’,function(){});
 
3. delegate()
- 하나의 이벤트로 하위 이벤트처리를 좀더 쉽게 가능
- 이벤트의 this가 이벤트를 발생시킨 항목을 가리킴 - target생략 가능
- 루트 요소의 특정 집합에 따라 선택 일치하는 모든 요소를,
   현재 또는 미래에 대한 하나 이상의 이벤트 핸들러를 연결합니다.
예) $(select).delegate(‘click’,function(){});

 
4. on()
- jQuery 1.7부터 지원한다.
- 단일 요소를 각 이벤트처리기에 연결한다.
- 선택된 요소에 하나 이상의 이벤트에 대한 이벤트 핸들러 함수를 연결합니다.
- 아직 생성되지 않은 엘리먼트에도 추후에 생성될 때 이용할수 있는 이벤트를 미리 걸어둘 수 있다.
-  bind() , live() , delegate() 메소드의 기능이 한번에 통합되었다.
- 반복해서 on() 함수를 호출하면 여러개의 함수가 연결됨.
예) $(select).on(‘click’,function(){});
 
 
5. 이미 생성된 태그에 이벤트 등록
   $('#check6').on("click", function(){ $('#check7').show(); });
   or
   $("#id").bind("click", function(){
   });
6. 이미 생성된 태그의 이벤트 해제
   $("#check6").off("click");
   or
   $("#id").unbind("click");

 
7. 동적으로 생성된 태그에 이벤트 등록
   $(document).on('click', '#check6', function() {
     alert('Clicking!');
    });

8. 동적으로 생성된 태그에서 이벤트 해제
    $(document).off('click', '#check6');

9. 모든 이벤트의 해제
   $("#check6").off();
 
10. id가 'img-'로 시작하는 태그들에 이벤트 등록
$(function() {
  // A 태그중에 id 가 'img-'로 시작하는 태그 선택
  $("A[id*=img-]").on("click", function() {
    // alert( $(this).text()); // this: 이벤트가 발생된 태그, A 문자열 추출
    // alert($(this).attr('id'));  // 태그 아이디 추출, img-1
    var id = $(this).attr('id').substring(4);
    var params = 'pdsno=' + pdsno;
    $.post('./read_file1.jsp', params, file1_res, 'json');
  });
});
  
11. 동적 이미지 조절
$(function(){
  var file1 = $('#file1');
  var width = file1.width();
  // alert(width);
  
  if (file1 != null) {
    if (width > screen.width-(screen.width * 0.3)) {
      // file1.width(600); // 이미지 축소
      file1.css('width', '100%');
    } else {
      // 작은 이미지는 그대로 출력
    }
  }
});
  
12. 키이벤트 처리
  $('#title').on('keydown', function(key) {
    if (key.keyCode == 13) { // Enter
      $('#rname').focus();
    }  
  });  
  
13. 일정 시간이 지나면 함수 실행, 1000은 1초
  setTimeout(function() { $('#title').focus(); }, 100); // 0.1 초   

14. form
    $('#btn_price2').on('click', function() { price(this.form); }); 

15. 변수의 선언
  $(function() {
    var contentsno = 0;
    $('#btn_cart').on('click', function() { cart_ajax(contentsno)});
    $('#btn_login').on('click', login_ajax);
    $('#btn_loadDefault').on('click', loadDefault);
  });




[06] SELECT 태그 Event
1. 현재 선택된(selected) 값(value) 구하기.
  $("#selBox option:selected").val();
 
2. 현재 선택된(selected) 내용 구하기.
  $("#selBox option:selected").text();
 
3. selectBox에 옵션 추가하기
  - SelectBox 옵션 아래에 추가
  $("#selBox").append("<option value='keyboard'>키보드</option>");
 
  - SelectBox 옵션 최상단에 추가
  $("#selBox").prepend("<option value='mouse'>마우스</option>");
 
  - 특정 위치 아래에 옵션 추가하기
  $("#selBox option:eq(1)").after("<option value='mouse'>키보드</option>");
 
  - 특정 위치 위에 옵션 추가하기
  $("#selBox option:eq(2)").before("<option value='mouse'>키보드</option>");
 
4. slectBox에 옵션 삭제하기
  - 첫번째 옵션 삭제하기
  $("#selBox option:first").remove();
 
  - 마지막 옵션 삭제하기
  $("#selBox option:last").remove();
 
  - 특정위치 옵션 삭제하기
  $("#selBox option:eq(2)").remove();
 
  - 모든 옵션 삭제하기
  $("#selBox").find("option").remove();
 
5. 특정 값으로 selected 이벤트 주기
  - index 값으로 주기
  $("#selBox option:eq(0)").attr("selected", "selected");
 
  - value 값으로 주기
  $("#selBox").var("desk").attr("selected", "selected");
 
6. 선택된 옵션의 index 구하기
  $("#selBox option").index($("#selBox option:selected"));
 
 
7. 선택된 옵션의 갯수 구하기
  $("#selBox option").size();
 
 
 
[07] RADIO button

1. radio button 체크 설정
   $("#radio_id").prop("checked", true)
   $("input:radio[name='visible']:radio[value='Y']").prop('checked', true); 
   $("input:radio[name='life']:radio[value='1']").prop('checked', true);


2. radio button 값 가져오기
   var st = $(":input:radio[name=search_type]:checked").val();

3. 선택여부 파악
   $('#step1').prop('checked');

 

[08] Checkbox button
 
1. 체크여부 확인
 
   - id가 동일한 체크박스에 대하여 선택되어 있는지 확인 : true / false 반환
   $("#chkBox").is(":checked") ;
   $("input:checkbox[id='chkBox']").is(":checked") ;
 
   * 1.6이상일때 권장 사용법
   $("#chkBox").prop("checked") ;
  
2. 체크박스 갯수 가져오기
 
  - 선택된 체크박스 갯수 구하기
  $("#chkBox:checked").length ;
 
  - 전체 체크박스 갯수 구하기
  $("#chkBox").length ;
  
3. 체크박스 전체 선택하기 / 해제하기
 
  - 전체 선택하기
  $("#chkBox").prop('checked', true) ;
  $("#chkBox").attr('checked', true) ;
 
 
  - 전체 해제하기
  $("#chkBox").prop('checked', false) ;
  $("#chkBox").attr('checked', false) ;
  
4. 체크된 체크박스 value 가져오기
 
   $('#chkBox:checked').each(function() { 
        alert($(this).val());
   });
  
5. 체크박스 클릭시 이벤트 주기
 
   function msgAlert(){
        alert('1');
   }
 
   $("#chkBox" ).on( "click", msgAlert());
 
  
    
[09] JSON 데이터의 객체화(eval() 함수 기능)

      var obj = jQuery.parseJSON(data);

      var obj = $.parseJSON(data);



[10] radio 선택/해제
<label><input type="radio" name="fruits" value="사과">사과</label>
<label><input type="radio" name="fruits" value="복숭아">복숭아</label>

$("input:radio[name='fruits']:radio[value='사과']").prop('checked', true); // 선택하기
$("input:radio[name='fruits']:radio[value='사과']").prop('checked', false); // 해제하기



[11] 체크박스 선택/해제
<label><input type="checkbox" name="fruits" value="사과">사과</label>
<label><input type="checkbox" name="fruits" value="복숭아">복숭아</label>
<label><input type="checkbox" name="fruits" value="포도">포도</label>
<label><input type="checkbox" name="fruits" value="참외">참외</label>

$("checkbox[name='fruits']").prop('checked', true); // 전체선택하기
$("checkbox[name='fruits']").prop('checked', false); // 전체해제하기


[12] Ajax + JSON + button 처리
  $(function(){
    $('#btn_recom').on("click", function() { update_recom_ajax(${contentsno}); });
  });

  function update_recom_ajax(contentsno) {
    // console.log('-> contentsno:' + contentsno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'contentsno=' + contentsno; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/contents/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          // console.log('-> rdata: '+ rdata);
          var str = '';
          if (rdata.cnt == 1) {
            // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
            // console.log('-> btn_recom: ' + $('#btn_recom').html());
            $('#btn_recom').html('♥('+rdata.recom+')');
            $('#span_animation').hide();
          } else {
            $('#span_animation').html("지금은 추천을 할 수 없습니다.");
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
  }


[13] 태그의 삭제

1. 계속 p 태그가 추가되도 자동으로 앞쪽 p태그 2개가 지워지면서 10개가 유지됨, layout이 깨지는 것을 방지하는 기법.
    var tags = $('p') // 모든 p 태그 검색
    console.log('tags:' + tags);
    console.log('tags[0]:' + tags[0]);
    console.log('tags.length:' + tags.length);
    if (tags.length >= 10) {
      tags[0].remove();
      tags[1].remove();
    }


[14] 텍스트를 클립보드로 복사하는 방법
  function copyToClipboard(val) {
    var t = document.createElement("textarea");
    document.body.appendChild(t);
    t.value = val;
    t.select();
    document.execCommand('copy');
    document.body.removeChild(t);
  }

  $('#copybtn1').click(function() {
    copyToClipboard('복사할 내용');
    alert('주소를 복사하였습니다');
  });



[15] 값 검사
  function check_null(str) {
    var sw = false;
    if (str == "" || str.trim().length == 0 || str == null || str == undefined || typeof str == "object") {
      sw = true;  // 값이 없는 경우  
    }
    return sw;
  }
```

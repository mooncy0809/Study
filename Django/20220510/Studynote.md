[01] Anaconda 가상환경을 이용하는 Django project의 설정
- MVC(Model, View, Controller) 기반으로 대규모 프로젝트를 개발 가능한 구조를 가지고 있음.
  . Model: Python file
  . View: HTML, CSS, Javascript
  . Controller: urls.py + views.py + Model execute.
 
1. 구성
- Model: 데이터베이스 정의, 처리 로직
- urls.py: 접속 URL 정의
- views.py: 함수 또는 클래스의 메소드로 정의되며, 웹 요청을 받고 응답을 반환해줌.
- Template: HTML, CSS, Javascript등 화면 UI 구성 정의 
  
2. 개발 순서
1) 프로젝트 뼈대 만들기: 프로젝트 및 앱 개발 에 필요한 디렉토리와 파일 생성 ·
2) 모델 개발: 테이블 관련 사항을 개발(modelspy, admin.py 파일)
3) urls.py 개발: URL 및 뷰 매핑 관계 를 정의 (urls.py 파일)
4) 뷰 개발: 애플리케이션 로직 개발 (views.py 파일)
5) 템플릿 개발: 화면 UI 개발(templates/디렉토리 하위의 *.html 파일들)

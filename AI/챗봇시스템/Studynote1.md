[01] 토크나이징(Tokenizing)
   - 자연어는 수치 연산을 처리하는 컴퓨터는 이해 할 수 없음.
   - 문장을 이해 할 수 없음으로 최소 의미를 갖는 단어의 형태인 형태소로 분할해야하며 이렇게 분할된 단어를 토큰이라고함.
   - 토큰으로 분리하는 토크나이징은 언어의 문법을 알아야하며 이런 과정은 어렵기 때문에 각 언어를 지원하는 토크나이징 package를 이용함.
   - 한국어 토크나이징을 위해서 KoNLPy가 존재함.

1. 한국어 품사의 분류<br>![image](https://user-images.githubusercontent.com/84116509/177171256-d394a56c-9774-4165-ace1-5a854cc900b3.png)

[02] 자연어 처리 관련 패키지 설정

1. Java를 설치(Colab 설치됨)
   - KoNLpy는 자바를 사용함.
   - JDK를 1.7 버전 이상으로 설치 필요.

1) JAVA 설치

2) 환경 변수 추가
    - JAVA_HOME: C:\jdk1.8.0
    - Path: C:\jdk1.8.0\bin 맨 앞 부분에 등록 


2. nltk 설치(Colab 설치됨)
   - 자연어 처리 지원
1) nltk 설치
   (base) C:\WINDOWS\system32>activate ai
   (ai) C:\Windows\system32>pip install nltk

2) nltk 데이터 설치(Jupyter에서 설치 필요)
   import nltk
   nltk.download('punkt')

3. KoNLPy 파이썬 패키지 설치(Colab 설치 필요)
   - 파이썬 기반 자연어 처리 패키지
   - https://konlpy-ko.readthedocs.io/ko/v0.4.3/

4. jpype1 파이썬 패키지 설치(Colab 설치됨)


[03] KoNLPy 실습
   - 형태소(의미를 갖는 최소 단위) 분석기 <br>![image](https://user-images.githubusercontent.com/84116509/177171637-030a132c-6deb-46d2-beb8-098fd82dce4e.png)
1. Kkma 품사 태그
   - http://kkma.snu.ac.kr
   - NNG: 일반 명사
   - JKS: 주격 조사
   - JKM: 부사격 조사
   - VV: 동사
   - EFN: 평서형 종결 어미
   - SF: 마치표, 물음표, 느낌표


2. Komoran 형태소 분석기 품사 태그표
   - https://docs.komoran.kr/index.html
   - NNG: 일반 명사
   - JKS: 주격 조사
   - JKB: 부사격 조사
   - VV: 동사
   - EF: 종결 어미
   - SF: 마치표, 물음표, 느낌표


3. Okt 형태소 분석기 품사 태그표
   - Noun: 명사
   - Verb: 동사
   - Adjective: 형용사
   - Josa: 조사
   - Punctuation: 구두점



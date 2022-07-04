[01] 숫자 분류 DNN 모델 구현 <br>![image](https://user-images.githubusercontent.com/84116509/177172616-cfaec138-14e9-4fc6-b001-acbb01f79dad.png)

[02] 자연어 처리를위한 1D 합성곱(CNN) 신경망, 챗봇 문답 데이터 감정 분류 CNN 모델 구현, fit_on_texts(), texts_to_sequences(), intent의 파악
   - 자연어 처리를위해서는 일반적으로 1D CNN 네트워크를 사용함
   - 이미지 처리를위해서는 일반적으로 2D CNN 네트워크를 사용함

1. 1D CNN 합성곱신경망
1) 'wait for the video and don't rent it'이라는 문장이 있을 때,
   이 문장이 토큰화, 패딩, 임베딩 층(Embedding layer)을 거친다면 다음과 같은 문장 형태의 행렬로 변환될 것임
   아래 그림에서 n은 문장의 길이, k는 임베딩 벡터의 차원(단어를 표현하는 숫자(scalar)의 개수)입니다.<br>![image](https://user-images.githubusercontent.com/84116509/177172678-5be66535-71e1-49f4-b6fb-a6c21399c06f.png)
2) 커널의 차원은 이미 결정이되어 있음으로 커널의 높이만으로 커널의 크기를 설정,
   커널의 크기가 2인경우, 너비는 임베딩 벡터의 차원(k)이 사용됨. <br>![image](https://user-images.githubusercontent.com/84116509/177172715-5f677e78-e910-4a9b-a2aa-112c1177de01.png)
  - 2D와는 다르게 오른쪽으로 이동할 공간이 없음으로 아래쪽으로만 움직임<bR>![image](https://user-images.githubusercontent.com/84116509/177172782-bfb9d4a2-9aec-47bb-a40d-51567f148fa7.png)
  - 커널의 크기가 3인 경우 <br>![image](https://user-images.githubusercontent.com/84116509/177172855-e94e7faf-8194-414c-bf3f-1ccd5942cd05.png)
3) Max-pooling <Br>![image](https://user-images.githubusercontent.com/84116509/177172906-57599df9-3df8-4877-9acb-9d376d4134c0.png)
4) 일반적인 설계 형태 <br>![image](https://user-images.githubusercontent.com/84116509/177172935-cf11a4f1-bd93-49aa-b323-595131351a60.png)

[03] 챗봇 문답 데이터 감정 분류 CNN 모델 구현
   - 대화의 의도(intent)를 파악하는 모델 제작

1. 데이터
1) 데이터 파일 <br>![image](https://user-images.githubusercontent.com/84116509/177173002-6f30bf90-77bd-4602-8056-e860cbffa4de.png)
2) 레이블
   0: 일상 다반사
   1: 이별(부정)
   2: 사랑(긍정)
  
2. 모델 제작

1) 문장의 읽기 -> 문장을 토큰화하여 말뭉치에 추가(토큰화) -> 문장의 토큰을 sequence(수치화) <br>![image](https://user-images.githubusercontent.com/84116509/177173053-a38e3943-4c11-435b-9fb8-d8a1ab09f668.png)
2) 수치화된 토큰을 입력 차원에 일치하도록 pad_sequences() 함수로 padding 처리
   - 문장의 길이에 비하여 입력층의 차원이 너무 작으면 데이터가 손실되며, 너무 크면 자원이 낭비됨.
   - 문장을 구성하는 토큰수의 평균이나 중앙값을 이용하여 최적의 토큰 수 결정 <br>![image](https://user-images.githubusercontent.com/84116509/177173087-0bb93d7d-da34-44ad-8ce7-24e921b56866.png)
3) 감정 클래스 분류 CNN 모델 블록도 <br>![image](https://user-images.githubusercontent.com/84116509/177173131-9a96611d-48c8-45ec-bd7f-108e2204b830.png)
4) 토큰을 빈도수 기준으로 단어 집합 생성
   tokenizer = preprocessing.text.Tokenizer()
   tokenizer.fit_on_texts(corpus) # 토큰을 빈도수 기준으로 단어 집합 생성

5) 전처리 순서
   - text_to_word_sequence: 문장을 형태소로 분리한후 토큰(단어)을 list에 추가
   - fit_on_texts(corpus): 토큰을 빈도수 기준으로 단어 집합 생성
   - texts_to_sequences(corpus): 토큰에 할당된 번호를 기준으로 문장을 시퀀스 번호로 변환
   - 진행 순서: text_to_word_sequence -> fit_on_texts(corpus) -> texts_to_sequences(corpus)

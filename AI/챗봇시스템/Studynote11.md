[01] 순환신경망(RNN: Recurrent Neural Network), 시계열 자료의 처리
- 일정한 시간 간격으로 배치된 시계열 데이터의 처리
- NLP(자연어 처리), 텍스트등의 순차 데이터의 처리
- 완전 연결 신경망(DNN)이나 CNN은 이전에 학습된 데이터를 기억하지 않고 처리후 메모리에서 삭제됨.
- 순환 신경망은 이전 데이터를 메모리에 기록함.
- 이전 데이터의 처리 결과가 다음 데이터 입력시 영향을 주는 구조

1. 순환 신경망 구조
1) 현재 데이터와 은닉층에서 출력된 데이터가 같이 사용됨. <br>![image](https://user-images.githubusercontent.com/84116509/177993984-95be1cc4-6244-44ae-9dda-8cd328d73322.png)
2) 순환 신경망의 node를 Cell 이라고함.
  . x: 입력, h: 출력, hp: 이전 타임 스텝의 은식 상태 <br>![image](https://user-images.githubusercontent.com/84116509/177994002-73196a6c-5770-48df-a7db-b5b247d77743.png)
3) 출력값 계산
    X: 입력값
    Hp: 이전 타임 스텝의 은식 상태
    Wx: X에 곱해지는 가중치
    Wh: Hp에 곱해지는 가중치
    b: 편향,y 절편
    H: 출력, 활성화 함수로 tanh(Hyperbolic tangent) 사용 <br>![image](https://user-images.githubusercontent.com/84116509/177994033-a61e1245-a742-4c17-9535-1cc501762781.png)
4) 활성화 함수로 tanH가 많이 사용됨, Relu도 사용됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994052-bc48f608-85c1-481c-97c8-a49376209ab7.png)

2. 가중치의 흐름: 전결합 층에 출력 상태를 저장하는 기능이 추가됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994081-8b97591d-6822-4693-ae45-a4b3bfd0390a.png)
3. 데이터 A가 입력되어 처리된후 2가지의 출력이 발생하며 1가지는 이후에 재사용됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994104-db8c0874-adfe-4bec-9d75-e4c96d266c8d.png)
  - 데이터 B가 입력되어 사용되는 경우 A의 출력 결과가 재사용됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994140-71fcc5cd-2bac-4246-9526-65aa03a330a7.png)
  - 데이터 C가 입력되어 사용되는 경우 B의 출력 결과가 재사용됨, 이때 미약하지만 A 데이터의 영향이 C에까지 전달됨, 여기서는 A, B, C 데이터임으로 『타임 스텝』은 3이됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994190-34e7ab76-695a-4d03-9538-eb439075d79e.png)
  - 셀의 출력은 은닉 상태가 됨.<br>![image](https://user-images.githubusercontent.com/84116509/177994228-2bfb3e1d-9b89-41d4-8316-f1ca2090cf46.png)
4. '하나의 rnn cell'에서의 hidden 레이어의 출력값 전달 흐름
   - 하나의 셀은 2개의 가중치 파라미터, 절편 1개, 상태 저장용 파라미터 1개, 출력용 파라미터 1개로 구성됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994267-6923f21a-aec8-4c92-98d7-b13f623a51e7.png)
   - 입력값 3개가 하나의 rnn cell에 입력되는 경우
     . 첫번째 타임 스텝에서 h0는 0을 가지고 있음
     . 연산이 일어난 후 첫번째 타임 스텝 출력 h1이 2번째 타임 스텝 Wh와 곱해져서 입력됨
     . 두번째 타임 스텝 출력 h2가 3번째 타임 스텝 Wh와 곱해져서 입력됨 <br>![image](https://user-images.githubusercontent.com/84116509/177994314-f3c88782-7dd1-479b-84b7-7fd90b97c4e4.png)
5. 3개의 셀은 어떤 rnn 셀에 데이터가 전달되더라도 서로 가중치를 전달함으로 rnn셀이 3개이면 가중치는 9개가 발생함.<br>![image](https://user-images.githubusercontent.com/84116509/177994374-ae7c66c3-f54a-429e-bcba-b6c47427ed01.png)
   - 파라미터 계산: 순환 신경망 갯수 x 3 = 9 개의 가중치가 발생함. <br>![image](https://user-images.githubusercontent.com/84116509/177994398-7d8ac0a2-21ba-41ce-8b68-2c235aa66646.png)
6. 처리되는 데이터는 타임 스텝이라고 함
   - 입력되는 데이터는 주로 2차원의 형태를 가지고 있음.
   - 하나의 sample을 sequence(문장)라고함, 시퀀스 안에는 여러개의 아이템(단어)이 들어가 있음.
   - 시퀀스의 길이(단어의 개수)가 타임스텝(소그룹)의 길이가 됨. ★
   - 각단어를 3개의 숫자로 표현하면서 4개의 단어로 구성되는 문장의 타임 스텝: 4 <br>![image](https://user-images.githubusercontent.com/84116509/177994426-864a700b-cc51-40df-a95f-510e326301b0.png)
 순환층 통과후 아래의 결과가 됨, rnn 뉴런의 수가 출력(1차원 배열의 형태) 갯수가됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994456-643f65cb-b41b-41d2-bf3b-88036f2bdb1c.png)
7. 최종 출력은 마지막 타임 스텝의 은닉 상태가 결과로 출력됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994497-8bb59639-1a3d-442c-a945-c09dd676cf27.png)
8. 2개의 rnn 셀이 있는 경우
   - 첫번째 셀은 모든 타임 스텝의 은닉 상태 출력, 마지막 셀은 마지막 타임 스텝의 은닉 상태만 출력
   - I: 처음에는 가장 앞쪽의 타입스텝의 값이 입력
   - am ← I
   - a ← am ← I
   - boy ← a ← am ← I: 마지막 스텝인 boy 데이터의 은닉 상태가 출력됨. <br>![image](https://user-images.githubusercontent.com/84116509/177994558-1af8528d-4a3f-4d37-9539-265b319f9150.png)
9. 전체적인 흐름
   - 100개의 단어(표현)들중 20개(단어수)의 단어(타임 스텝)로 이루어진 sample(문장, 숫자 배열...) 입력
   - rnn Cell이 10개임으로 10개의 출력 발생
   - 출력이 1차원임으로 Flatten 함수를 사용하지 않음. <br>![image](https://user-images.githubusercontent.com/84116509/177994602-de088e69-16fc-4cac-9b59-d13cde550b92.png)

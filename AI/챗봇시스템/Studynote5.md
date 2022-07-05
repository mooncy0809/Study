[01] 순환신경망(RNN: Recurrent Neural Network), 시계열 자료의 처리
- 일정한 시간 간격으로 배치된 시계열 데이터의 처리
- 텍스트등의 순차 데이터의 처리
- 완전 연결 신경망이나 CNN은 이전에 학습된 데이터를 기억하지 않고 처리후 메모리에서 삭제됨.
- 순환 신경망은 이전 데이터를 메모리에 기록함.
- 이전 데이터의 처리 결과가 다음 데이터 입력시 영향을 주는 구조

1. RNN 구조
   - model.add(SimpleRNN(units=10, return_sequences=False, input_shape=(n_timesteps, n_features)))
     . units=10: rnn 계층에 존재하는 전체 뉴런수
     . return_sequences=False: 은닉 상태값을 출력할지 결정
     . False: 마지막 시점의 메모리 셀에서만 결과를 출력, True: 모든 rnn 계산과정에서 결과를 출력
     . return_sequences는 다층 구조의 rnn 모델이나 one-to-many, many-to-many구조에서 사용
     . input_shape=(n_timesteps, n_features): 입력 시퀀스 길이, 변수의 갯수
      input_shape=(100, 500)
      100: 1개의 문장이 100개의 단어로 구성됨(timestep 수 100)
      500: 원핫 인코딩된 값, 행별 단어에 해당하는 1개만 1이고 나머지는 0, 변수의 갯수는 500개, 500개의 변수로 하나의 단어 표현

1) ht는 현재 시점의 은닉 상태, ht+1은 다음 시점의 은닉 상태를 저장함으로 값이 계속 유지되어 다음셀의 입력에 영향을 미침. <br>
![image](https://user-images.githubusercontent.com/84116509/177339067-d076420e-74f7-4859-9b78-72a59a14271d.png)<br>
2) 순차적으로 입력되는 x를 나타낸 경우 <br>![image](https://user-images.githubusercontent.com/84116509/177339132-d1d38911-5b2e-4a9e-9f6b-2c1a0b3be474.png)<br>
3) many-to-one: 모델의 경우, 다수의 변수 입력과 하나의 출력 <br>![image](https://user-images.githubusercontent.com/84116509/177339183-6c19e451-c0be-49a7-84a3-dec9ff01eaa6.png)
4) one-to-many: 하나의 변수 입력으로 다수의 출력이 발생하는 경우 <br>
5) many-to-many; 다수의 입력 변수와 다수의 출력, 번역기등에서 사용 <br> ![image](https://user-images.githubusercontent.com/84116509/177339225-355cdcd9-d354-40d1-bef9-1a0081364d94.png)
6) Wx = Xt에 대한가중치, Wh = ht-1에대한 가중치, Wy = ht에대한 가중치, 편향(bias)은 같음
   - 현재 시점을 t, Xt는 현재 시점의 입력 벡터, Yt는 현재 시점의 출력 벡터, ht는 현재 시점의 은닉 벡터값임.
   - 은닉층: ht = tanh(WxXt + Whht-1+bh)
   - 출력층: yt = Wx * (Ht * Wh) * Xt + b (DNN: yt = Wx * Xt + b)<br>![image](https://user-images.githubusercontent.com/84116509/177339312-1f1ddfc2-59c8-4a77-b8da-75e969450e87.png)


1. RNN 모델을 이용한 Sin 파동 예측하기
   - 입력 시퀀스 15개, 출력 1개를 구성하는 네트워크 <br>![image](https://user-images.githubusercontent.com/84116509/177339374-ea058446-32f7-4668-882c-e656898dfff1.png)
   - split_sequence 함수의 원리 <br>![image](https://user-images.githubusercontent.com/84116509/177339423-b96c3333-fc0c-496a-a915-8559ab480a7e.png)
   - 입력 시퀀스 길이: 15 개, 변수의 갯수: 1개 <br> ![image](https://user-images.githubusercontent.com/84116509/177339468-1e043a4e-33ae-40a3-8a64-289258cf7449.png)
   - 시각화 <br>![image](https://user-images.githubusercontent.com/84116509/177339528-7c2794d2-b98e-469a-977a-e4753f2b59b0.png)


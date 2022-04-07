# 추론통계
### Z 값, 통계량 산출 실습
1. 표준화

1] 모집단의 하나의 값(Scaler)을 표준화, Z(p-value)값 산출
   - μ: 모평균, σ: 모표준편차<br>![image](https://user-images.githubusercontent.com/84116509/162158693-0ee0b43b-3bae-43dc-b222-3d3688b5344f.png)
2] 표본 집단을 대상으로한 표준화, Z(p-value)값 산출, 통계량 산출 ★
① 모분산(σ²)을 아는 경우(모표준편차(σ)를 아는 경우)<br>![image](https://user-images.githubusercontent.com/84116509/162158776-fd09c63f-ce89-4c68-b37d-f9169bb62660.png)
② 모분산(σ²)을 모르는 경우(모표준편차(σ)를 모르는 경우), S: 표본 표준편차<br>![image](https://user-images.githubusercontent.com/84116509/162158826-4f523c22-e279-4d0b-8abb-7fa5570f5051.png)
3] 표준정규분포의 구간 특성<br>
![image](https://user-images.githubusercontent.com/84116509/162158875-794fdfda-f4e6-4a17-b10b-2797cafb0f2d.png)

2. σ는 표준정규분포의 표준편차가 아닌 정규분포의 표준편차를 가리킨다.<br>![image](https://user-images.githubusercontent.com/84116509/162158974-16d27844-f7e0-4756-8996-550a3b8f0101.png)

3. X-m=σ (편차=표준편차)이면 ![image](https://user-images.githubusercontent.com/84116509/162159018-c4619b45-ba08-4976-b55d-b6d0b06bf7b1.png)이고 표준정규분포곡선에서 아래 정도에 위치하게 된다.<br>![image](https://user-images.githubusercontent.com/84116509/162159074-9ae70585-286e-4a52-8c6a-8be2722ca1e5.png)
4. 임계치
- 임계치는 주어진 유의수준에서 귀무가설의 채택 또는 기각을 결정하는 데 기준이 되는 값<br>![image](https://user-images.githubusercontent.com/84116509/162159120-2c4818f6-6bc7-4238-8a48-5fed4ff998a9.png)
5. 양측 검정 <br>![image](https://user-images.githubusercontent.com/84116509/162160102-a1ed0b32-8821-4d28-bd09-7431e98f78b7.png)
1] 양측 검정(2 집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균과 B 집단의 평균은 다르다. A ≠ B
2] 양측 검정(모집단:표본 집단)
   - H0: 모집단 모평균은 표본집단 표본평균과 같다. μ = Xbar
   - H1: 모집단 모평균은 표본집단 표본평균과 다르다. μ ≠ Xbar

6. 좌측 검정(단측 검정)<br>![image](https://user-images.githubusercontent.com/84116509/162160340-cb2d2113-65b1-4043-983d-971604c2edfd.png)
1] 단측 검정 - 좌측검정(2 모집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균은 B 집단의 평균보다 작다. A < B
2] 단측 검정 - 좌측검정(모집단:표본 집단)
   - H0: 모집단 모평균은 표본집단 표본평균과 같다. Xbar = μ
   - H1: 표본집단의 표본평균은 모집단 모평균보다 작다. Xbar < μ

7. 우측 검정(단측 검정)<br>![image](https://user-images.githubusercontent.com/84116509/162160435-3f3da60a-ac2e-4529-80ca-1922266daf36.png)
1] 단측 검정 - 우측검정(2 모집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균은 B 집단의 평균보다 작다. A < B
2] 단측 검정 - 좌측검정(모집단:표본 집단)
   - H0: 모집단의 모평균은 표본집단의 표본평균과 같다. μ = Xbar
   - H1: 표본집단의 표본평균은 모집단의 모평균보다 크다. μ < Xbar

# 인공지능_DNN
### 수치 예측 모델의 구현(relu, adam, mse 활용), validation_split 적용
- 1차원(하나의 변수) 선형회귀를 구하는 공식
   y = wX + b
   f(x) = wX + b
- 기울기 w와 편향 b값을 예측하는 곳이 목표
  최적의 목표값: y = 2X + 0.16 
- 정확도는 '평균 제곱 오차(mse)'에 기반함.

1] graphviz 이용
   - pip로 설치하면 의존 패키지가 설치 안됨으로 에러 발생
   - pydot을 설치하면 graphviz가 설치됨
     (base) C:\WINDOWS\system32> activate ai
     (ai) C:\WINDOWS\system32> conda install pydot
   - Kernel 재시작
   - 사용
     from tensorflow.keras.utils import plot_model   # 네트워크 입출력 시각화
     .....
     plot_model(model, to_file='./model.png', show_shapes=True, show_layer_names=True) 

1. Script      
- 재 학습시 기존의 학습된 모델을 Upgrade(구형 Tensorflow 버전은 학습시마다 새로 모델 제작) 
  . 재학습시 손실에 변화가 없으면 Kernel -> Restart를 실행하고 그래도 변화가 없으면 파일을 다시 open
    (그래도 안되면 크롬을 다시 실행)
- 처음부터 새로 학습: Jupyter -> Kernel -> Restart
- 학습 주요 코드
```
# 전결합층을 은닉층으로 추가
# 1: 출력(노드, 뉴런, 신경세포) 갯수 1개, input_dim=1: 입력 갯수 1개
# activation='linear': 활성화 함수, 수치 예측, 선형회귀 결과를 출력
# optimizer='adam': 오차를 줄이기위한 역전파 알고리즘
# loss='mse': 실제 값과의 차이를 구하는 알고리즘
model = Sequential()
model.add(Dense(1, input_dim=1, activation='linear'))
model.compile(optimizer='adam', loss='mse')
model.summary()
hist = model.fit(x_train, y_train, validation_split=0.2, shuffle=True,
                epochs=300, batch_size=1)
# x_train: 훈련 데이터, y_train: 정답
# validation_split=0.2: 훈련에 참여하지 않고 검증만 하는 데이터, 20%
#                       검증 데이터는 가중치 변경에는 사용되지 않음.
# shuffle=True: x_train 훈련 데이터 무작위 추출
# epochs=300: 모든 데이터에 대하여 300번 학습
# batch_size=1: 미니 배치 옵션, 1건씩데이터 처리 후 가중치 변경
# 학습수 300 * (데이터 수 20 / 배치사이즈 1) = 6000번 가중치, bias 변경
# 재 학습시 기존의 학습된 모델을 Upgrade(Tensorflow 버전마다 다름)

# Epoch 1/300
# 16/16 [===========] - 1s 46ms/step - loss: 691.8280 - val_loss: 2168.1636
# Epoch 1/300: 현재 학습 카운트/전체 학습수
# 16/16: 가중치, 편향의 update 횟수
# 1s 46ms/step: 전체 데이터 1회 학습당 시간, 1/1000 초, ms
# loss: 691.8280: 훈련 손실
# val_loss: 2168.1636: 검증 손실
```
<br>![image](https://user-images.githubusercontent.com/84116509/162160820-f8968767-2f27-410b-a72a-599e43071f8d.png)

### 오차 역전파(Back Propagation)

1. 오차 역전파 개론 
- 신경망 내부의 가중치는 오차 역전파 방법을 사용해 수정.
- 오차 역전파는 오차를 줄이기위하여 미분을 이용하여 가중치와 편향을 조정하는 과정
- 최적화의 계산 방향이 출력층에서 시작해 앞(뒤어서 앞으로, 입력층전)으로 진행되며,
  출력 부분인 뒤에서 앞으로 이동하며 가중치, 절편을 변경하는것을
  오차 역전파(back propagation)라고 부름.<br>![image](https://user-images.githubusercontent.com/84116509/162160880-ee1f5801-4e1f-4d0f-9199-2ebe588a00b0.png)

2. 오차 역전파 구동 방식
1) 표준 정규 분포에 기반하여 임의의 초기 가중치, 편향을 할당한뒤 결과(yout)를 계산함.
2) 계산 결과와 실제값의 오차를 산출
3) 미분을 이용하여 오차가 감소되는 방향으로 가중치와 편향을 업데이트한다.
4) 1~3 과정을 더이상 오차가 줄어들지 않을 때까지 반복한다.
5) 오차 역전파는 편미분(편도함수)에 기반한 기술로 미분이 이루어지는 변수외에 나머지는 상수로 처리하여
    0을 만들어 미분 계산을 실행함. <br>![image](https://user-images.githubusercontent.com/84116509/162160947-565d92f6-224d-4e36-b96e-5d8a8bc2578b.png)

### 경사 하강법 
- 가중치, 편향에 대하여 편미분을 이용하여 오차를 줄이는 알고리즘

1. Batch 처리(전체 데이터)에 기반한 경사 하강법
   - 모든 데이터를 순차적으로 1건의 관측치를 처리할 때마다 오차를 산출후 오차를 모두 더하여 총오차를 산출후
     평균을 구하여 가중치를 변경함으로 계산량이 매우 많아 학습 시간이 많이 소요됨.
   - 순간 메모리 사용량이 높다.
   - 데이터의 특성이 잘 반영되지 않음
   - 최적의 해: f(x) = ax + b 공식에서 가장 오차가 적은 a와 b의 발견 <br>![image](https://user-images.githubusercontent.com/84116509/162161044-47017e0b-e6e9-492f-a42b-8cdcaeaadcf8.png)
2. 확률적 경사 하강법(SGD: Stochastic Gradient Descent)
   - 전체 데이터(관측치) 중에서 랜덤하게 1건을 추출하여 학습후 가중치 편향 변경,
     최종적으로는 모든 데이터를 학습하게됨.
   - 많은 오차 역전파를 통한 미분 연산이 발생하여 속도가 느림
   - 1건의 이상치에 영향을 심하게 받을 수 있음 <br>![image](https://user-images.githubusercontent.com/84116509/162161098-48aab263-42d7-4915-9a28-c794739fd44b.png)
3. Mini Batch에 기반한 경사 하강법(권장)
   - 무작위로 데이터를 선택하여 학습을 진행하면서 발생된 오차를 소규모 그룹(Mini Batch 크기)으로 나누어
     오차의 평균을 산출하여 가중치와 편향을 변경하는 방법
   - 확률적 경사 하강법에 비하여 오차 역전파를 통한 미분 연산시 속도가 빠름
   - 출력예: 100/100: Mini Batch를 진행하여 가중치와 편향을 변경하는 횟수 확인 가능
     . 100건의 데이터에 batch_size=2을 적용한 경우
     Epoch 1/300 50/50 [=] - 3s 4ms/step - loss: 0.2275 - accuracy: 0.9209 - val_loss: 0.2094 - val_accuracy: 0.9328
     
4. 모멘텀(가변적인 학습률)
   - 오차가 크면 더빨리 오차를 줄이고 target(답)에 근접해서는 오차를 조금씩 줄이는 방법
   - 이전의 가중치의 증가/감소 방향을 참고하여 관성의 법칙을 적용하여
     가중치를 변경하는 방법으로 속도가 빠르고,
     특정 지역의 최소 오차에 빠질 수 있는 위험이 적음.<br>![image](https://user-images.githubusercontent.com/84116509/162161172-ce66145c-5b02-46e2-bf6b-12cb6c0e8df9.png)
5. 케라스에서 제공되는 경사 하강법의 종류(최적화 함수): 가중치와 편향을 변경하는 방법
   - 경사하강 방법 + Batch size + 학습률을 이용하여 오차를 줄이도록(경사하강) 진행함<br>![image](https://user-images.githubusercontent.com/84116509/162161226-1eb051ca-521b-41c7-8080-299c5bfda0a8.png)<br>![image](https://user-images.githubusercontent.com/84116509/162161273-686e061b-bd4f-4900-99ca-f907f2fde812.png)


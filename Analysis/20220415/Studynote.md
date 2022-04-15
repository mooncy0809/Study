### 학습율(learning rate)
- 정확도 향상을위해 임의로 조정, 학습에 따라 오차 역전파를 진행하면서 오차를 감소 시킴.<br>![image](https://user-images.githubusercontent.com/84116509/163532783-a2bd89de-bda2-42f0-81a9-33a1a227e4af.png)
https://blog.daum.net/grace0802/18352155

- 오차를 줄이는 경사하강의 정도를 조절, 가중치와 Bias의 값의 변경 규모를 결정
- 가중치와 편향을 미분을 적용하여 감소시 어느정도의 크기로 감소할 것인지를 설정
- 정수를 사용하면 최소 오차를 지나가는 문제 발생
- 보통 0.1~ 0.001 정도의 값을 이용하여 오차를 줄여 나감
- 큰 규모의 데이터의 경우 학습시간이 너무 길기때문에 학습율을 높이면 
  학습이 빨리됨, 하지만 너무 크면 최소 오차가 정확히 산출되지 않을 수 있음.
- https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Adam
- Adam은 0.001을 기본 학습률로 사용함.


1] 미분을 진행하여 진행된 값을 경사의 기울기에 대응시키고 그 크기에 따라 가중치와 편향을 변경
    f(x) = a * X + b: a 기울기<Br>![image](https://user-images.githubusercontent.com/84116509/163532825-a71f74ca-bbeb-4827-9b32-eb49c3e40800.png)<br>
2] 오차가 감소해가는 상황, 오차를 줄이기위해 ± 부호가 변경되면서 최소 오차가 되도록 가중치와 편향을 변경<br>![image](https://user-images.githubusercontent.com/84116509/163532853-f3a02b8c-973c-4e64-8394-4a9e7bef9824.png)<br>
3] 기울기 재산정시 얼마의 크기로 기울기를 미세하게 조절 할것인지 결정함, 너무 큰 값이면 최소 기울기를 지나틸수 있음,
   학습을 계속 진행할수록 오차가 더욱 커지게됨, 따라서 기울기는 미세하게 조절함.<br>![image](https://user-images.githubusercontent.com/84116509/163532884-0427828a-bfc1-40cc-b1b6-093e39c691cf.png)

1. import
from tensorflow.keras.optimizers import Adam

2. 사용
- 학습률이 너무 커서 오차가 심하게 증가할 수 있음(정수 사용은 권장하지 않음).
  model.compile(optimizer=Adam(lr=10.0), loss='mse')

- 0 ~ 1 사이의 학습율 적용 권장
  model.compile(optimizer=Adam(lr=0.1), loss='mse')
  model.compile(optimizer=Adam(lr=0.0003), loss='mse')
  
  
### 가중치(Weights), 편향(Biases) 확인

1. 파라미터(가중치, y절편) 초기화 선언
   - mean: 평균, stddev: 표준 편차, seed: 난수 생성 기준
   - 정규 분포
  ```
     import tensorflow
     tensorflow.keras.initializers.RandomNormal(mean=0.0, stddev=0.05, seed=0)
     tensorflow.keras.initializers.RandomNormal(mean=0.0, stddev=1, seed=None)
  ```
   - 균등 분포
  ```
     tensorflow.keras.initializers.RandomUniform(minval=-0.05, maxval=0.05, seed=0)
     tensorflow.keras.initializers.RandomUniform(minval=-1.0, maxval=1.0, seed=None)
  
     model = Sequential()
  ```

   - 가중치, 편향의 초기화시 seed가 같아도 가중치와 편향은 다르게 갱신됨
  ```
     Epoch 1/1000
     loss: 0.3960 - accuracy: 0.8898 - val_loss: 0.2341 - val_accuracy: 0.9117
     Epoch 1/1000
     loss: 0.3371 - accuracy: 0.8859 - val_loss: 0.1952 - val_accuracy: 0.9360 
  ```



2. f(x) = aX+b: a, b 값의 확인
1) w5: 가중치, E_total: 오차 총합
    - 오차를 줄이려면 가중치를 늘려야하는 상황<br>![image](https://user-images.githubusercontent.com/84116509/163533196-099bfb03-ae1d-45f6-9ae3-5ebea0fc8f48.png)<br>
    - 가중치를 늘려 오차를 줄이는 과정
    - 가중치를 증가 시키는 경우: 새로운 가중치 ← 가중치 - (-미분 결과)
    - 가중치를 감소 시키는 경우: 새로운 가중치 ← 가중치 - (+미분 결과)<br>![image](https://user-images.githubusercontent.com/84116509/163533250-225f174c-09c6-4e28-a471-aa4c26bd7af9.png)<br>
  
### 특성(변수)의 선택
1. 여름 에어콘 판매량을 예측
   - 온도
   - 습도
   - 날씨등...
   - 컴퓨터 판매 대수 ? 방학때 판매량이 영향을 받음

2. 변수 선택의 기준
    - 상식적으로 타당해야함, 그러나 예측 못한 변수가 존재 할 수 있다는 것을 고려.
    - 상관관계(상관계수)가 있는 변수여야함.
    - 난수는 규칙이 없음으로 학습이 안됨.
    - Scatter plot등을 이용하여 데이터의 분포를 확인 할 수 있음(Seabon).

3. IQR을 통한 이상치의 처리, NAN일경우 기본값의 사용 여부
   - 이상치는 정확도를 감소 시킴
   - NAN은 정확도를 감소 시킴, 대체값 처리 방법

4. 주성분 분석, 차원 축소를 통한 변수의 선정
   - 어떤 변수가 영향을 많이 갖고 있는지를 판별(Elbow)

5. 올바른 변수의 선택은 딥러닝의 성공과 실패를 좌우할 정도로 중요함.



  

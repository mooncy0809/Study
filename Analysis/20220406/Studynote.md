### 인공 신경망(ANN: Artificial Neural Network) 
- 뇌를 구성하는 신경세포 뉴런(Neuron)의 동작원리에 기초한 기술
- 인간의 뇌는 1000억개의 뉴런으로 구성됨.

인공 지능(자동으로 작동하는 모든것들)
  --> 머신 러닝(Scikit-learn: 추론통계 기반, 선형회귀를 포함한 통계 알고리즘)
       . 데이터의 유형을 파악하여 머신러닝 알고리즘을 개발자가 선정
       . 정형 데이터는 우수하나 이미지, 영상, 음성, 자연어처리에서는 정확도가 매우 떨어짐.
  --> 신경망(퍼셉트론: 선형회귀 기반)
  --> 딥러닝(다층 퍼셉트론(MLP), CNN, RNN, LSTM, GAN, DQN.....)
       . 머신러닝의 단점을 개선함.
  --> Tensorflow, PyTorch...(자동화, 최적화 지원)
1. 신경 세포
- 각종 동물의 신경세포와 시냅스 수(인간: 860억개)<br>![image](https://user-images.githubusercontent.com/84116509/161920239-e415930a-f338-4348-a278-28a7cfbc3e4a.png)
- 생물의 신경 세포의 동작은 축색말단에서 가지돌기(수상돌기)로 시냅스가 전송되고
  시냅스의 값은 0이상의 아날로그 값(전기적인 성질과 화학물질로 구성)으로 다양하다.
- 신경 세포체: 인공 뉴런에서는 하나의 노드로 표현
- 가지 돌기(수상돌기): 입력값(입력 값의 강도) 수신(인공 뉴런: 데이터, csv 파일등으로 구성)
- 시냅스: 축삭(축삭말단)은 가지돌기(수상돌기)에게 시냅스를 전달한다.
  (인공 뉴런: '실수값'으로 표현이 가능하며 '가중치(기울기), 편향' 임 )
- 세포핵: 모든 입력 정보가 통합되어 축삭 돌기로 전달(인공 뉴런: 활성화 함수)
- 축삭 말단: 출력 값(인공 뉴런: 엣지로 출력)
- 신경 세포에서의 정보 전달 구조도<br>![image](https://user-images.githubusercontent.com/84116509/161920294-c4aba342-1480-4573-ac7d-8f6f6df3dc0c.png)


2. 신경 세포의 모델화(SW로 구현)

1] 퍼셉트론(perceptron)
- 인공신경망의 한 종류로서, 1957년에 코넬 항공 연구소(Cornell Aeronautical Lab)의
  프랑크 로젠블라트 (Frank Rosenblatt)에 의해 고안되었음.
- 각 노드의 가중치와 입력치를 곱한 것을 모두 합한 값이 활성함수에 의해 판단되는데, 
  그 값이 임계치(보통 0)보다 크면 뉴런이 활성화되고 결과값으로 1을 출력함
- 뉴런이 활성화되지 않으면 결과값으로 -1을 출력한다.
- XOR을 해결하지 못하는 문제는 인공지능 기술이 제1 암흑기로 진입하는 사건이되었다.
- 마빈 민스키와 시모어 페퍼트는 저서 "퍼셉트론"에서 단층 퍼셉트론은 XOR 연산이 불가능하지만, 
  다층 퍼셉트론으로는 XOR 연산이 가능함을 보였다.
- 인공 뉴런의 구조<Br>![image](https://user-images.githubusercontent.com/84116509/161920356-9c30ec37-3526-4095-87ba-ee25d18ea1f0.png)

2] 출력과 활성화 함수의 관계
    - y: 출력
    - f(u): 활성화 함수1
    - x: 변수, 데이터
    - w: 기울기, 가중치
    - b: y 절편, 편향, bias    <br>![image](https://user-images.githubusercontent.com/84116509/161920418-fc1fc399-a1c5-4498-9cfe-2a557c971b1e.png)
  <br>![image](https://user-images.githubusercontent.com/84116509/161920452-d593f910-7d47-4723-af60-8ccf4a6adf43.png)


### 뉴런의 네트워크화(다층신경망, 딥러닝)
1. 심층 신경망(딥러닝)
   - 은닉층이 여러개가 연속적으로 연결된 신경망
   - 제프리 힌튼 교수는 심층 신경망을 효율적으로 학습 시킬 수 있는 신경망 학습 알고리즘을 개발함.<Br>![image](https://user-images.githubusercontent.com/84116509/161920640-a6388d6d-67a3-4016-9602-e0394042ccdb.png)
2. 가중치, y 절편의 계산(파라미터)
   - 난수를 이용하여 가중치와 편향을 초기화함
   - 학습을 하면서 가중치와 편향의 값을 오차가 줄어드는 방향으로 변경을 해나감

1) 첫번째 input node: 2.00
2) 첫번째 hidden node: (2.00 * 0.1) + (3.00 * 0.5) + (4.00 * 0.9) + (-2.0)
                               입력값 * 가중치 + y 절편
                               = 0.2 + 1.5 + 3.6 - 2.0
                               = 3.3
                               시그모이드 함수 적용(e=2.71828): 1.0 / (1.0 + 2.71828^-(3.3)) = 0.96
                               = 1.0 / (1.0 + 0.036883)
                               = 1.0 / 1.036883
                               = 0.964429
- ih_w: input layer에서 hidden layer로 갈때의 가중치
- ho_w: hidden layer에서 output layer로 갈때의 가중치 <br>![image](https://user-images.githubusercontent.com/84116509/161920669-69c9c666-a3f1-4102-82f9-faf9ca4d2e82.png)


  
[01] Tensorflow 2.0
- https://www.tensorflow.org
- Google이 2015년 아파치 라이센스 2.0으로 오픈소스 프레임워크로 공개했다.
- 머신러닝 알고리즘 중에서도 심층신경망을 표현하고 구현하기 위한 인터페이스를 
  주 목적으로 설계되었다.
- 내부는 C++로 개발되었으며 간결한 호출을위해 주로 파이썬을 이용하여 Tensorflow를 사용한다.
- 텐서플로는 경사 하강법(오차 감소)등 모든 미분(기울기의 감소크기 판단, 감소할 오차의 크기 판단)을
  개발자가 단순한 함수 호출로 자동 처리 할 수 있도록 지원한다.
- 텐서플로는 예측 결과에서 실제값과의 오차를 줄이는 자동 미분 계산기임 ★.
- 텐서플로는 파이썬 기반의 패키지인 케라스를 이용하여 더욱 적은 코드로 고성능의 최적화된
  딥러닝 개발 환경을 구축할 수 있다.
- Tensorflow 1.x의 불편한 코딩문제로 Keras를 설치하여 사용했었음.
  . 데이터 흐름 그래프를 기반으로하는 코딩
  . 문법이 일반적인 Programming 언어의 형태를 갖지 않음.
- Tensorflow 1.2 부터는 비공식적으로 Keras가 내장되어 사용되었음.
- Tensorflow 2부터는 Keras가 표준적인 방법으로 지정됨.



### Tensorflow 2에서 Keras의 사용
- https://keras.io
- Tensorflow 1.2부터 통합
- Tensorflow 2.0부터 공식적인 Tensorflow의 상위 계층으로 지정됨.
- Keras는 Tensorflow의 까다로운 문법을 단순화하고 여러 학습의 최적화 기법을 지원
- MLP(다층 퍼셉트론)의 직관적인 Layer 코딩이 가능함. 
- Keras는 자체 딥러닝 엔진이 없음으로 Tensorflow(Google), PyTorch(Facebook)등의
  프레임워크가 설치되어야함. 
- 심층 신경망의 경우 은닉층을 직관적인 코딩이 가능하도록 지원함.
   
1. Sequential class
- Sequential class는 딥러닝의 구조를 한 층 한 층 쉽게 쌓아올릴 수 있게 해 줌
  Sequential class를 선언하고 나서 model.add() 함수를 사용해 필요한 층을 차례로 추가하면 됨

2. add 함수는 Dense(전결합, 밀집) class를 이용하여 계층 추가<Br>![image](https://user-images.githubusercontent.com/84116509/161920762-49ffab78-07d9-4f8e-8822-a1d4c29ecffb.png)
3. 입력층+은닉층
- 입력층은 가중치를 전달받지 않음으로 하나의 Layer로 인정되지 않음.
- Keras는 입력층과 은닉층이 결합되어 있음.
- 은닉층의 각노드는 입력값과 임의(random)의 가중치, y 절편(Bias)를 할당받고 활성화 함수를 거쳐
  최종 출력 값을 생성함.
- 코드: model.add(Dense(100, input_dim=17, activation='relu')) 
  . 100: 출력 노드의 갯수
  . input_dim=17: 입력 노드(속성/변수) 17 개임
  . activation='relu': 활성화 함수는 'relu' 함수를 사용함.<br>![image](https://user-images.githubusercontent.com/84116509/161920802-ed0ebb53-0c3a-42a6-8575-780896ab3843.png)
  
4. Dense 은닉층(전결합층, 밀집층, 완전 연결층)
- 은닉층의 각노드는 입력값과 임의(random)의 가중치를 할당받고 활성화 함수를 거쳐
  최종 출력 값을 생성함.
- 코드: model.add(Dense(40, activation='relu')) 
  . 40: 출력 노드의 갯수
  . activation='relu': 활성화 함수는 'relu' 함수를 사용함.


5. 출력층
- 은닉층으로부터의 입력데이터에 가중치를 곱하고 활성화 함수를 이용하여 최종 결과를 산출함.
- 코드: model.add(Dense(1)): 수치 예측
- 코드: model.add(Dense(1, activation='sigmoid')): 이항 분류
- 코드: model.add(Dense(1, activation='softmax')): 다항 분류
  . 출력층의 출력 데이터 개수는 1개임으로 1임
 
6. 모델 학습 과정 설정
- 지정한 모델이 효과적으로 구현될 수 있게 여러 가지 환경을 설정하는 부분
- 코드
  . 수치 예측: model.compile(loss='mean_squared_error', optimizer='adam', metrics=['mse'])
  . 분류 문제: model.compile(loss='mean_squared_error', optimizer='adam', metrics=['accuracy'])
- loss : 현재 가중치 세트를 평가하는 데 사용한 손실 함수(오차 함수). 
  . mean squared error(mse: 평균 제곱 오차): 수치 예측   예) 매출액
  . binary_crossentropy(이항 교차 엔트로피): 이항 분류   예) 참/거짓, 0/1, 생존/사망, 합격/불합격
  . categorical_crossentropy(범주형 교차 엔트로피): 다항(다중/범주) 분류   
    예) 품종 분류, 자동차의 종류 분류, 등급 분류

1] 오차 함수(비용함수, 손실 함수)의 종류
- 평균으로부터의 오차를 계산하는 오차 함수(비용함수, 손실 함수)의 종류, loss 옵션에 사용
- 수치 예측: mse(mean_squared_error), 회귀 기반의 오차를 계산, f(x) = aX + b
- 이항 분류: binary_crossentropy, log 기반의 오차를 계산, f(x) = -log(1-x)
- 다중 분류(범주형): categorical_crossentropy, log 기반의 오차를 계산 <br>![image](https://user-images.githubusercontent.com/84116509/161920870-1e5e737d-d949-4911-a2f0-e92b02e83417.png)
  
2] 오차 역전파 알고리즘(최적화 함수)
- optimizer(경사 하강법의 종류(최적화 함수)) : 최적의 가중치를 검색하는 데 사용되는
  최적화 알고리즘으로 효율적인 경사 하강법 알고리즘 중 하나인 ‘adam’을 사용.

3] 평가 척도  
- metrics : 평가 척도를 나타내며 수치 예측은 일반적으로 'mse', 분류 문제는 ‘accuracy’를 지정.

7. 모델 학습시키기
- 코드: model.fit(X, Y, epochs=10, batch_size=10) 
  . X: 데이터, 일반적으로 표준화하여 사용, 최대값으로 나누어 정규화하여 사용
  . Y: 실제값 
  . 에포크(epochs): 전체 데이터에 대하여 반복할 학습 횟수
- batch_size: 데이터를 한번에 몇건씩 처리할 것인지 선언(Mini batch)
  . batch_size는 적당히 커야하는데 너무 크면 학습 속도가 빨라지나 정확도는 떨어짐
  . 너무 작으면 학습속도가 너무 느리고 이상치가 없는 데이터에한해 정확도는 우수할 수 있음
  . 배치 사이즈가 크면 많은 메모리를 사용함으로 메모리 overflow문제 발생 할 수 있음
  . 배치 사이즈가 작을 경우 데이터의 이상치(outlier)의 각 실행 값의 편차가 생겨서 전체 결괏값이
    불안정해질 수 있음
  . batch_size가 1이면 1건 처리시마다 가중치를 변경하여 특정 데이터에 영향을 많이 받을 수 있음
  . 배치사이즈가 30이면 데이터 30건 처리후 오차의 평균을 바탕으로 가중치를 변경함
    데이터가 300건이면 10번 가중치를 변경함.

* Batch와 Mini Batch의 차이점은 Batch는 모든 데이터를 학습후 가중치 변경, Mini batch는 지정된 갯수만큼
  학습후 가중치 변경함으로 현재 대부분은 Mini Batch를 사용함.
8. 진행 사항을 챠트로 표현
```
# ----------------------------------------------------------------------------------
# 진행 사항을 챠트로 표현
# ----------------------------------------------------------------------------------
fig, loss_ax = plt.subplots()
fig.set_size_inches(10, 5)  # 챠트 크기 설정

acc_ax = loss_ax.twinx()   # x 축을 공유하는 새로운 Axes 객체를 만든다.

loss_ax.set_ylim([0.0, 1.0])
acc_ax.set_ylim([0.0, 1.0])

loss_ax.plot(hist.history['loss'], 'y', label='train loss')
acc_ax.plot(hist.history['accuracy'], 'b', label='train accuracy')

loss_ax.set_xlabel('epoch')
loss_ax.set_ylabel('loss')
acc_ax.set_ylabel('accuray')

loss_ax.legend(loc='upper left')
acc_ax.legend(loc='lower left')

plt.show()
# ----------------------------------------------------------------------------------
```
9. 모델 평가하기
- 코드: print("\n Accuracy: %.4f" % (model.evaluate(X, Y)[1])) 
- 데이터와 처리 결과를 이용해 정확도를 결과로 출력
- 학습데이터가 아닌 다른 데이터를 평가 대상으로 선정, 일반화 성능을 높이려는 의도.
 
10. 모델의 저장
- model.save('CancerSurvival.h5')
- 모델 저장 파일 형식 및 저장 내용: h5
  ① 나중에 모델을 재구성하기 위한 모델의 구성 정보
  ② 모델를 구성하는 각 뉴런들의 가중치
  ③ 손실함수, 최적화 등의 학습 설정
  ④ 재학습을 할 수 있도록 마지막 학습 상태 저장
  
11. 모델 로딩
- model = load_model('CancerSurvival.h5')
 
12. 모델의 사용
- 모델 사용시는 CPU의 성능이 낮아도 크게 영향을 받지 않음.
- 코드
```
predict_value = model.predict_classes(x_data[0:10])
print('type(predict_value):', type(predict_value))
print('predict_value:', predict_value)
model.summary()
print('-------------------------------------------------------')

for i in range(len(x_data)):
    print('실제값:', y_data[i], '예측값:', predict_value[i])
```

13. 모델의 사용 챠트로 확인
```
# ----------------------------------------------------------------------------------
# 모델 사용 결과를 챠트로 표현
# ----------------------------------------------------------------------------------
plt.scatter(x_data, y_data, color='g')
plt.plot(x_data, y_data, color='g')
plt.scatter(x_data, y_predict, color='r')
plt.plot(x_data, y_predict, color='r')
plt.grid(True)
plt.show()

# ----------------------------------------------------------------------------------
```
 
* matplotlib 관련 에러 발생시의 처리
_getfullpathname: embedded null character : Python3.x 에서 plt 오류
import matplotlib.pyplot as plt 시 _getfullpathname: embedded null character 오류 메세지가 나타나면,
'C:\ProgramData\Anaconda3\envs\machinegpu\Lib\site-packages\matplotlib' 설치 폴더내의 
'font_manager.py' 파일 241번 라인 편집

def win32InstalledFonts(directory=None, fontext='ttf'):  함수 안의

direc = os.path.abspath(direc).lower() 를 direc = direc.split('\0', 1)[0] 로 변경할 것.
  
  
14. 네트워크, 층(Layer), 손실 함수, 옵티마이저(가중치, BIAS 최적화) 사이의 관계 <br>![image](https://user-images.githubusercontent.com/84116509/161921145-a0f29787-ce24-494a-9883-9a85e14717c1.png)
  
15. 마지막층의 활성화 함수와 손실함수 선택 기준(활성화 함수, 손실 함수)
    1) 임의 값에 대한 회귀(수치 예측):  생략시 linear(항등 함수), mse
    2) 이진(이항) 분류: Sigmoid, binary_crossentropy
    3) 다중 분류: softmax, categorical_crossentropy
  
### Python script 기초 코드
- 경고 메시지 출력 중지 및 matplotlib 한글 깨짐처리
```
%autosave 0

import warnings
warnings.filterwarnings(action='ignore')

import os
import sys
import time
import random
import tensorflow
import tensorflow as tf

import pandas as pd
import seaborn as sb

import numpy as np

import matplotlib
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

from tensorflow.keras.models import Sequential  # class
from tensorflow.keras.models import load_model  # model 사용
from tensorflow.keras.layers import Dense       # 전결합
from tensorflow.keras.layers import Dropout     # 특정 node를 사용안함.
from tensorflow.keras.callbacks import EarlyStopping # 학습 자동 중지
from tensorflow.keras import regularizers   # L1, L2 규제 적용
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.models import load_model
from tensorflow.keras import optimizers
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.optimizers import RMSprop
from tensorflow.keras.utils import plot_model   # 네트워크 입출력 시각화
 
from sklearn.preprocessing import LabelEncoder  # class가 문자열인경우 변환
from sklearn.preprocessing import MinMaxScaler

from tensorflow.keras.callbacks import EarlyStopping
from tensorflow.keras.callbacks import ModelCheckpoint
from sklearn.model_selection import train_test_split # 학습셋과 테스트셋을 나눔
from sklearn.model_selection import StratifiedKFold  # K겹 교차 검증
from sklearn.metrics import confusion_matrix
from sklearn.metrics import roc_curve

import platform 

if (platform.system() == 'Windows'):  # Windows, Linux, Darwin
    rc('font', family=font_manager.FontProperties(fname="C:/Windows/Fonts/malgun.ttf").get_name())
    path = '.' # Local
else:    
    rc('font', family='NanumBarunGothic')  # Ubuntu 18.04 기준 한글 처리
    path = '/content/drive/My Drive/kd1_ml' # Colab

os.chdir(path) # 기본 경로 설정

plt.rcParams["font.size"] = 12         # 글자 크기
# plt.rcParams["figure.figsize"] = (10, 4) # 10:4의 그래프 비율
plt.rcParams['axes.unicode_minus'] = False  # minus 부호는 unicode 적용시 한글이 깨짐으로 설정

# Jupyter에게 matplotlib 그래프를 출력 영역에 표시할 것을 지시하는 명령
%matplotlib inline  
``` 
 

 
 
### 시각화 기초 코드

1. 수치 예측 시각화
1] 하나의 y 축 사용
```  
import matplotlib.pyplot as plt
%matplotlib inline  

fig, loss_ax = plt.subplots()
# plt.figure(figsize=(6,4)) # ERROR
fig.set_size_inches(10, 5)  # 챠트 크기 설정

# 왼쪽 y 축 설정
loss_ax.plot(hist.history['loss'], 'y', label='train loss')
loss_ax.plot(hist.history['val_loss'], 'r', label='val loss')
loss_ax.set_ylim([0.0, 124.0]) # 값을 반영하여 변경

# 축 레이블 설정
loss_ax.set_xlabel('epoch')  # 학습 횟수
loss_ax.set_ylabel('loss')   # 오차

loss_ax.legend(loc='upper left') # 오차 레이블 위치

plt.show()
``` 


2. 분류
1] 2개의 y 축 사용
```
import matplotlib.pyplot as plt
%matplotlib inline  

fig, loss_ax = plt.subplots()
# plt.figure(figsize=(6,4)) # ERROR
fig.set_size_inches(10, 5)  # 챠트 크기 설정

acc_ax = loss_ax.twinx()  # 오른쪽 y 출 설정

# 왼쪽 y 축 설정
loss_ax.plot(hist.history['loss'], 'y', label='train loss')
loss_ax.plot(hist.history['val_loss'], 'r', label='val loss')
loss_ax.set_ylim([0.0, 0.3419]) # 값을 반영하여 변경

# 오른쪽 y 축 설정
acc_ax.plot(hist.history['accuracy'], 'b', label='train accuracy')
acc_ax.plot(hist.history['val_accuracy'], 'g', label='val accuracy')
acc_ax.set_ylim([0.0, 1]) # 0.0, 1: 0 ~ 100 %, 정확도임으로 변경하지 않음

# 축 레이블 설정
loss_ax.set_xlabel('epoch')  # 학습 횟수
loss_ax.set_ylabel('loss')   # 오차
acc_ax.set_ylabel('accuracy') # 정확도

loss_ax.legend(loc='upper left') # 오차 레이블 위치
acc_ax.legend(loc='lower left')  # 정확도 레이블 위치

plt.show()
```

 
### 아달린(Adaline)
- 1960년에 스탠포드 대학의 버나드 위드로우와 테드호프가 퍼셉트론을 개선한
  적응형 선형 뉴런을 발표함.
- 역방향 연산을 step(임계 함수)전에 시행함으로 좀더 정밀한 처리가 가능함.
- sigmoid 함수는 연산 결과를 지수기반의 0부터 1사이의 값으로 변경 지원하여
  정밀한 분류 구현이 가능함(예) 0.002: 강아지, 0.003: 고양이...).<br>![image](https://user-images.githubusercontent.com/84116509/161921510-76a579d0-d5f9-44f1-9a3d-1782507c689e.png)

### 오차 역전파(Back Propagation)

1. 오차 역전파 개론 
- 신경망 내부의 가중치는 오차 역전파 방법을 사용해 수정.
- 오차 역전파는 오차를 줄이기위하여 미분을 이용하여 가중치와 편향을 조정하는 과정
- 최적화의 계산 방향이 출력층에서 시작해 앞(뒤어서 앞으로, 입력층전)으로 진행되며,
  출력 부분인 뒤에서 앞으로 이동하며 가중치, 절편을 변경하는것을
  오차 역전파(back propagation)라고 부름.<br>![image](https://user-images.githubusercontent.com/84116509/161921585-2f8d1fd2-aa2c-4ada-b2e2-28ceaa3cb714.png)

2. 오차 역전파 구동 방식
1) 표준 정규 분포에 기반하여 임의의 초기 가중치, 편향을 할당한뒤 결과(yout)를 계산함.
2) 계산 결과와 실제값의 오차를 산출
3) 미분을 이용하여 오차가 감소되는 방향으로 가중치와 편향을 업데이트한다.
4) 1~3 과정을 더이상 오차가 줄어들지 않을 때까지 반복한다.
5) 오차 역전파는 편미분(편도함수)에 기반한 기술로 미분이 이루어지는 변수외에 나머지는 상수로 처리하여
    0을 만들어 미분 계산을 실행함. <br>![image](https://user-images.githubusercontent.com/84116509/161921629-d5e95c59-b6f7-418f-9692-5b0720dfbe7e.png)

### 기울기 소실 문제와 활성화 함수

1. 오차 역전파는 출력층으로부터 하나씩 앞으로 되돌아가며 각 층의 가중치를 수정하는 방법
    - 가중치를 수정하려면 미분 값, 즉 기울기가 필요하나 층이 늘어나면서
      기울기가 중간에 0이 되어버리는 기울기 소실(vanishing gradient) 문제가 발생하기 시작 <br>![image](https://user-images.githubusercontent.com/84116509/161921686-737449e1-7e49-4c87-a7fe-aa2aa22f0d65.png)
    - 이는 활성화 함수로 사용된 시그모이드(0 ~ 1 사이의 무한대 영역) 함수의 특성 때문임
    - 아래처럼 시그모이드를 미분하면 최대치가 0.3이되며, 1보다 작으므로 계속 곱하다 보면 0에 가까워짐 따라서 층을 거쳐 갈수록 기울기가 사라져 가중치를 수정하기가 어려워지는 것<br>
  ![image](https://user-images.githubusercontent.com/84116509/161921790-be0aa18d-b8f0-4f7a-8a1a-680252917528.png)
    - 이를 해결하고자 은닉층에 활성화 함수를 시그모이드가 아닌 여러 함수로 대체하고 있음.
    - Sigmoid는 이항 분류를 위한 출력층에만 권장
  
  
2. activation : 활성화 함수 설정
  . linear: 디폴트 값, 입력뉴런과 가중치로 계산된 결과값이 그대로 출력됨, 예) 매출액, 수치 예측
  . relu: rectifier 함수, 은닉층에 주로 쓰임, 음수값은 0으로 대체하여 사용
  . sigmoid: 시그모이드 함수, 이진 분류 문제에서 출력층에 주로 쓰임 예) 참/거짓, 생존/사망, 합격/불합격
  . softmax: 소프트맥스 함수, 다중 클래스 분류 문제에서 출력층에 주로 쓰임 
               예) 품종 분류, 자동차의 종류 분류, 등급 분류
- 렐루: 토론토대학교의 제프리 힌튼 교수가 제안한 렐루(ReLU)는 시그모이드의 대안으로 떠오르며
  현재 가장 많이 사용되는 활성화 함수
  렐루는 x가 0보다 작을 때는 모든 값을 0으로 처리하고, 0보다 큰 값은 x를 그대로 사용하는 방법.
  이 방법을 쓰면 x가 0보다 크기만 하면 미분 값이 1이 됨, 따라서 여러 은닉층을 거치며 곱해지더라도 맨 처음 층까지 사라지지 않고 남아 있을 수 있음,
  딥러닝의 발전에 속도가 붙게 되는 활성화 함수임. <br>![image](https://user-images.githubusercontent.com/84116509/161921967-1a90ee54-2967-4700-9d9c-c2428e5b845b.png)


### 경사 하강법 
- 가중치, 편향에 대하여 편미분을 이용하여 오차를 줄이는 알고리즘

1. Batch 처리(전체 데이터)에 기반한 경사 하강법
   - 모든 데이터를 순차적으로 1건의 관측치를 처리할 때마다 오차를 산출후 오차를 모두 더하여 총오차를 산출후
     평균을 구하여 가중치를 변경함으로 계산량이 매우 많아 학습 시간이 많이 소요됨.
   - 순간 메모리 사용량이 높다.
   - 데이터의 특성이 잘 반영되지 않음
   - 최적의 해: f(x) = ax + b 공식에서 가장 오차가 적은 a와 b의 발견<br>![image](https://user-images.githubusercontent.com/84116509/161922021-936c81f6-7fe8-4a2f-b8aa-5c9e3d91ec96.png)

2. 확률적 경사 하강법(SGD: Stochastic Gradient Descent)
   - 전체 데이터(관측치) 중에서 랜덤하게 1건을 추출하여 학습후 가중치 편향 변경,
     최종적으로는 모든 데이터를 학습하게됨.
   - 많은 오차 역전파를 통한 미분 연산이 발생하여 속도가 느림
   - 1건의 이상치에 영향을 심하게 받을 수 있음 <br>![image](https://user-images.githubusercontent.com/84116509/161922060-5dc2578c-e409-4f19-8f25-5a5869713c85.png)
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
     특정 지역의 최소 오차에 빠질 수 있는 위험이 적음.<br>![image](https://user-images.githubusercontent.com/84116509/161922095-afea5f08-ea8c-4f01-afe1-c442a4d1e88f.png)

5. 케라스에서 제공되는 경사 하강법의 종류(최적화 함수): 가중치와 편향을 변경하는 방법
   - 경사하강 방법 + Batch size + 학습률을 이용하여 오차를 줄이도록(경사하강) 진행함<br>![image](https://user-images.githubusercontent.com/84116509/161922146-72c8b4a6-6a4c-412f-af4e-b510f34cd878.png)<br>![image](https://user-images.githubusercontent.com/84116509/161922175-ff320e75-3d10-4b18-a500-7a21a8f46ec1.png)

### 수치 예측 모델의 구현(relu, adam, mse 활용), validation_split 적용
- 1차원(하나의 변수) 선형회귀를 구하는 공식
   y = wX + b
   f(x) = wX + b
- 기울기 w와 편향 b값을 예측하는 곳이 목표
  최적의 목표값: y = 2X + 0.16 
- 정확도는 '평균 제곱 오차(mse)'에 기반함.

1) graphviz 이용
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
<br>![image](https://user-images.githubusercontent.com/84116509/161922315-e5c94d9f-1029-4e24-90b0-c90451a0ef9e.png)

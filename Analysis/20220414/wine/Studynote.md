## 와인의 종류 판정, train_test_split, EarlyStopping, ModelCheckpoint, 혼돈 행렬(Confusion matrix), ROC 곡선
- 이항 분류: True/False, 양성/음성, 합격/불합격, 생존/사망, 주행/정지...
- 데이터는 포르투갈 서북쪽의 대서양을 맞닿고 위치한 비뉴 베르드(Vinho Verde) 지방에서 만들어진
  와인을 측정한 데이터
- 레드와인 샘플 1,599개를 등급과 맛, 산도를 측정해 분석하고 화이트와인 샘플 4,898개를 마찬가지로 분석해
  데이터를 만들었음
  
1. 데이터 확인
1] 데이터 견본<br>![image](https://user-images.githubusercontent.com/84116509/163533550-177b387a-80d8-4107-8c80-8074474c4fa9.png)
<br>
2] 데이터 구조 <br>![image](https://user-images.githubusercontent.com/84116509/163533574-54ab764d-ee15-41dd-9c78-1450d8d52e76.png)
<br>
- 독립 변수(컬럼, 피처) 설명 <Br>![image](https://user-images.githubusercontent.com/84116509/163533597-27a4994d-61d1-4d4d-afa9-548ff1cd90c4.png)
<Br>
  
  
2. 와인의 종류 예측
- validation_split=0.2: 훈련과 검증 데이터만으로 모델을 평가하면 검증에 최적화된 모델이 만들어진다.
  공정한 테스트를 위하여(일반화 테스트) 원본 데이터에서 테스트 데이터를 준비해야함,
  분석가는 규칙을 모르기 때문에 테스트 데이터를 만들기 어려움 .

1) train_test_split 분할을 통한 훈련, 검증, 테스트 데이터의 분리

2) 90%: 분할대기(x_train_all), 10%: 테스트(x_test)
- stratify=Y: class 분류를 균형있게 조정함
- test_size=0.1: 10% 테스트 데이터
- random_state=seed: 분류시 동일한 조건의 난수를 적용하여 분류
 
seed = 0
x_train_all, x_test, y_train_all, y_test = train_test_split(X, Y,
                                                  stratify=Y,
                                                  test_size=0.1,
                                                  random_state=seed)

3) 나머지 데이터 90%를 분할, 70%: 훈련(x_train), 30%: 검증(x_val)
x_train, x_val, y_train, y_val = train_test_split(x_train_all, y_train_all,
                                                  stratify=y_train_all,
                                                  test_size=0.3,
                                                  random_state=seed)

4) 학습의 조기 종료
   - patience=5: 학습 결과가 개선되지 않아도 학습을 진행할 횟수
   - restore_best_weights=True: 학습 종료시 가장 우수한 가중치, 편향으로 저장
   early_stopping = EarlyStopping(monitor='loss', patience=5, restore_best_weights=True)
    
5) batch_size=10
   - 전방향으로 데이터가 1건씩 읽혀서 오차를 산출
   - 역전파시에 10건의 오차에 대한 평균을 산출하여 가중치와 Bias를 변경
   - 배치사이즈가 크면 특이한 데이터에대한 특징이 감소됨으로 정확도가 떨어질 수 있음.
   - 배치사이즈가 너무 작으면 이상치의 영향으로 인해 정확도가 떨어질 수 있음.
   - 일반적으로 배치사이즈는 30건을 넘지는 않음.

- 이항 분류(binary classification) 문제이므로 오차 함수는 binary_crossentropy를 사용
 
 
3. 검증 정확도가 개선되었을 때만 학습 모델 파일로 저장
1) 모델 저장 폴더의 생성
MODEL_DIR = './model/'
if not os.path.exists(MODEL_DIR): # 폴더가 존재하지 않으면 생성
    os.mkdir(MODEL_DIR)

2) 경로및 파일명 지정    
modelpath='./model/{epoch:04d}-{val_accuracy:.4f}.h5'    

3) 모델 저장 코드
# 검증 정확도가 개선되었을 때만 학습 모델 파일로 저장
# filepath='./wine.h5': 파일이 저장되는 경로와 파일명
# monitor='val_accuracy': 검증 정확도 기준으로 판단
# verbose=1: 기록되는 파일 정보 출력
# save_best_only=True: 검증 정확도가 개선되면 파일로 저장
checkpointer = ModelCheckpoint(filepath='./wine.h5', monitor='val_accuracy',
                               verbose=1, save_best_only=True)
   
▷ /ws_python/notebook/machine/dnn/wine/Wine1.ipynb
- import seaborn as sb # 시각화 패키지
- from tensorflow.keras.callbacks import ModelCheckpoint # 우수한 학습 모델 파일 저장
- from sklearn.metrics import confusion_matrix # 혼돈 행렬
- from sklearn.metrics import roc_curve          # roc 곡선
-------------------------------------------------------------------------------------
See file source.
-------------------------------------------------------------------------------------
  
4. 혼돈 행렬(Confusion matrix)을 통한 결과 분석
- Positive: 0, Negative: 1로 정의<Br>![image](https://user-images.githubusercontent.com/84116509/163533649-3e41af1e-c441-4e16-9c6c-5ef80514cf32.png)
<br>
  TP(진양성) : True로 예측하고 실제 값도 True, 고양이를 고양이로 인식
TN(진음성) : False로 예측하고 실제 값도 False, 강아지를 강아지로 인식
FP(위양성) : True로 예측하고 실제는 False, 실제는 강아지이나 고양이로 인식
FN(위음성) : False로 예측하고 실제는 True, 실제는 고양이이나 강아지로 인식

1] Accuarcy(정확도): 전체 분류 데이터 중 맞게 예측한 비율(*) <br>![image](https://user-images.githubusercontent.com/84116509/163533752-7ec4298b-caf3-41ec-8eb0-1746b60bcdac.png)
<br>
2] Recall (재현율, sensitivty(민감도)): 실제로 Positive인 것들 중 Positive로 예측한 비율, 실제 양성을 양성이라 맞춘 비율(*)<br>![image](https://user-images.githubusercontent.com/84116509/163533857-4020c0fe-cf9f-4f42-85d0-4632e5a8f3ab.png)
<br>
3] Specificity(특이도): Negative에 속하는 것들 중 실제 Negative 인것, 실제 음성중에 음성을 음성이라 맞춘 비율<br>
   TN / (TN + FN)<Br>
4] Precision(정밀도): Positive에 속하는 것들 중 실제 Positvie 인것, 양성으로 예측한 것 중에 실제 양성인 것<br>![image](https://user-images.githubusercontent.com/84116509/163534029-24d3ae88-ad57-45b2-82ec-9ca4468783b6.png)
<br>
5] 결과
[[245 0]
 [ 4 76]]
[[white wine 맞춘 갯수   white wine 틀린 갯수]
 [red wine 틀린 갯수     red wine 맞춘 갯수]]
  
5. ROC(Receiver Operating Characteristic) 곡선 append
- ROC 곡선으로 모델을 평가하는 척도는 AUC(Area Under the Curve)로 AUC가 크다면 정확도가
  높다는 것이다.
- 위양성률(FPR: False Positive Rate) : 진양성(TP) / 진양성(TP) + 위음성(FN), x 축
- 진양성률(TPR: True Positive Rate): 위양성(FP) / 진음성(TN) + 위양성(FP),  y 축<br>![image](https://user-images.githubusercontent.com/84116509/163534149-91367c3d-12c4-48c6-bf08-bcc2a6e4914d.png)
<br>

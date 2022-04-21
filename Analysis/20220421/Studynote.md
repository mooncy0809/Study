## 컨볼루션(합성곱) 신경망(CNN: Convolution Neural Network)
- 이미지 인식의 경우 파라미터(가중치, y절편)의 갯수가 너무 많이 발생하여
  메모리 부족 문제등이 발생함.
- Dense를 이용한 전결합층의 학습시 필요한 파라미터수
  입력 1: width: 1200
  입력 2: height: 800
  흑백 입력수: 1200 * 800 * 1 = 960,000 /  칼라 입력수: 1200 * 800 * 3  = 2,880,000 
  Layer 1: 1000 node
  필요한  파리미터수는? 2880000 * 1000 + 1000 ◀─ 입력 수 * 가중치 + BIAS
                              = 2,880,001,000   ◀─ 파라미터수: 2,880,001,000, 28억8천만 1천개의 파라미터 필요
  Layer 2: 100 node
  필요한  파리미터수는? 2,880,001,000 * 100 + 100 = ????      ◀─ 무수한 파라미터 필요
- CNN은 무수한 파라미터의 특성(추상화)을 압축하여 파라미터를 감소시키는 기능을 함.
- 컨볼루션 신경망은 입력된 이미지에서 특징(추상화)을 추출하기 위해 마스크 
  (필터, 윈도우 또는 커널이라고도 함)를 도입하는 기법
- '이미지 필터 위키' 검색: 일반적인 이미지에 효과를 주기위해 필터를 사용함
- 딥러닝의 필터는 이미지의 특징(추상화)을 찾기위해 필터를 사용함.
- 마스크(필터)를 이용하면 특징(추상화) 추출이 가능하고 파라미터의 수를 줄일 수 있음.

1. 마스크(필터)를 이용하면 특징 추출(추상화)이 가능, 특성의 파악, 필터에서 엣지를 중요하게 판단<br>![image](https://user-images.githubusercontent.com/84116509/164399903-fa987040-2284-4604-8b54-8fe9dd5e88f9.png)
2. 이미지의 특징을 찾아내기위해 필터(3 x 3)의 사용<br>![image](https://user-images.githubusercontent.com/84116509/164399961-c0dd6592-d6dc-4fd5-8113-cac6cb26c59d.png)
-특성을 찾아가는 과정, 해상도 높은 이미지를 단순한 픽셀로 추상화<br>![image](https://user-images.githubusercontent.com/84116509/164400036-5f3c7ad8-221b-4409-b3f5-4ed85804f7fa.png)
<br>![image](https://user-images.githubusercontent.com/84116509/164400096-b8715a07-59f0-4a5f-b7f8-43e9c142b931.png)
<br>![image](https://user-images.githubusercontent.com/84116509/164400178-580d4f62-a5a3-447a-b72f-a44d3d40224d.png)
<br>![image](https://user-images.githubusercontent.com/84116509/164400216-2fe44e58-fcb7-4885-a93e-d13c02f3f8d6.png)
<br>![image](https://user-images.githubusercontent.com/84116509/164400253-fe2930a2-c402-45f0-b2de-1ccd548cbe3a.png)
- 추상화된 고양이의 모습<br>![image](https://user-images.githubusercontent.com/84116509/164400310-9b065777-c904-411f-a786-158c0af724f4.png)

## 흑백 이미지의 합성곱 연산

1. CNN 흐름, 마스크(필터, 커널)의 동작
- 마스크(필터, 커널): 큰이미지를 단순화, 픽셀수를 줄여서 메모리 사용을 최소화함.
  학습시 이미지를 수치(numpy ndarray)로 표현하고, 이미지를 구성하는 특징을 수치적으로 표현이 가능함.
- width: 28 px, height: 28 px, color: gray 이미지의 특징을 찾아서 숫자를 판단하는 과정
- 흑백 입력수: 28 * 28 * 1 = 784 -> 24 * 24 * 마스크 수 -> 12 * 12 * 마스크 수<br>![image](https://user-images.githubusercontent.com/84116509/164400458-9837346b-8a15-476b-a83d-2dd3a3dd3d41.png)

1] 마스크(필터, 커널)의 연산
   - 원본 이미지(4x4)에 마스크(3x3)을 좌측 상단부터 곱한 결과를 더함, Bias는 필터당 1개.<br>![image](https://user-images.githubusercontent.com/84116509/164400600-a96e831a-5a82-44ed-a77f-9fdd7707f8db.png)
2] 다음열과 행으로 이동하며 가중치를 곱함(스트라이드, 슬라이딩).
   - 5 X 5 이미지에 3 X 3 마스크(필터, 커널) 동작 animation, 필터수만큼 출력
   - 색상값이 크면 연산후의 결과도 비례해서 큰 값이 할당됨.
   - 스트라이드(슬라이딩)을 진행하면 차원이 감소함.<br>![image](https://user-images.githubusercontent.com/84116509/164400726-8264f67a-4715-442a-ac30-0f44955a7657.png)
3] 여러개의 마스크(필터, 커널)를 이용한 합성곱 신경망(CNN)
    - 마스크(필터) 마다 1개의 Bias가 있음.
    - 4 x 4 이미지에 3 x 3 필터 3개를 적용하면 필터의 수만큼 출력으로 특성맵(결과) 3개가 생성됨.
    - (2, 2, 3) : (이미지의  width, 이미지의 height, 필터의 갯수)<br>![image](https://user-images.githubusercontent.com/84116509/164400832-a48e484b-2c18-47da-a9d4-c94196a7b7be.png)
2. CNN Convolution층 구현
   - 케라스에서 컨볼루션 층을 추가하는 class는 Conv2D()

1] 정의
   model.add(Conv2D(32, kernel_size=(3, 3), padding='same', input_shape=(30, 30, 1), activation='relu'))     
   ① 첫 번째 인자: 마스크(커널, 필터)를 몇 개 적용할지 정한다. 여기서는 32개의 마스크를 적용함

   ② kernel_size: 마스크(커널)의 크기를 정한다.
       kernel_size=(행, 열) 형식으로 정하며, 여기서는 3×3 크기의 마스크를 사용하게끔 정한다.
       일반적으로 3X3, 커널 사이즈가 크면 특성 맵(곱하기한 결과)의 크기가 더 크게 작아짐.

   ③ padding='same': 경계(외곽) 처리 방법
       - valid: 곱하기 진행중에 외곽은 1번만곱하기가 진행되어 특성맵에 특성이 적게 반영됨
       - same: 외곽 픽셀을 0으로 채워서 외곽의 연산횟수를 증가시켜 valid에 비해, 더 많이
                 외과의 데이터가 특성맵에 반영되도록 함, 급격한 차원 축소를 감소시킴(권장). <br>![image](https://user-images.githubusercontent.com/84116509/164400954-a4d397c7-62c4-4572-83a7-2915fdc1b739.png)
   ④ input_shape=(행, 열, 채널수) 형식으로 정한다. 채널은 흑백 1 또는 RGB 칼라 3 지정 ★
        input_shape=(30, 30, 1): 30 X 30 흑백 이미지 1장
        input_shape=(30, 30, 3): 30 X 30 칼라 이미지 1장

   ⑤ activation: 활성화 함수를 정의

    예)
     model.add(Conv2D(32, kernel_size=(3, 3), padding='valid', input_shape=(28, 28, 1),
                    activation='relu'))
     커널수 32, 28 x 28 픽셀의 흑백이미지 입력

     model.add(Conv2D(32, kernel_size=(3, 3), padding='valid', input_shape=(28, 28, 3),
                    activation='relu'))
     커널수 32, 28 x 28 픽셀의 컬러이미지 입력
  
   
3. Max pooling(Sub sampling)
   - 복잡한 컨볼루션층을 축소하는 기법으로 갖아 큰 특징(최대값)을 대표값으로 사용
   - 풀링 기법 중 가장 많이 사용되는 방법이 맥스 풀링(max pooling)
   - 맥스 풀링은 정해진 구역 안에서 가장 큰 값만 다음 층으로 넘기고 나머지는 버림
   - 사용
     model.add(MaxPooling2D(pool_size=(2, 2))) 
     model.add(MaxPooling2D(pool_size=(2, 2), strides=(2,2)): 셀을 몇개씩 이동할 것인지의 옵션
     model.add(MaxPooling2D(pool_size=(2, 2), strides=(4,4))
   - 4개의 영역으로 분할, 최대값(특징이 강한 값) 추출 <br>![image](https://user-images.githubusercontent.com/84116509/164401375-48faa9ea-4152-4321-b343-78c6bec396f3.png)
   - 필터가 3개인 경우(1, 1, 3): width, height, 필터의 개수 3 <br>![image](https://user-images.githubusercontent.com/84116509/164401526-222e15e7-168f-4e65-a6bf-87c337d933e1.png)

4. 드롭아웃(Dropout)
   - 많아진 노드로인해 학습 조건이 안좋아질 경우 Overfit(과적합)을 피하기위해
     은닉층에 있는 노드의 일부를 임의로 꺼줌, n1, n3는 사용하지 않게됨.
   - 20%의 노드를 끄려는 경우 Keras의 구현: model.add(Dropout(0.2))
   - MLP 기반의 Dense층에서도 Overfit(과대적합)를 줄이는 효과도 있음.  <br>![image](https://user-images.githubusercontent.com/84116509/164401605-985f7824-f536-40a1-ad49-2ea1c13dd458.png)
5. Flatten()
   - 3차원 텐서를 1차원 텐서 열방향으로 변경.
   - 네트워크 구성의 종료 전에 선언함.
   - model.add(Flatten()), 평탄화(전결합(Dense)층의 형태로 변경),
   - 필수의 수만큼 출력값의 수가 결정됨.<br>![image](https://user-images.githubusercontent.com/84116509/164401698-efec9ea2-7caf-46c8-9ba8-ffde4023863a.png)
6. 가로 x 세로 28 x 28 흑백 이미지의 CNN 처리 흐름<br>![image](https://user-images.githubusercontent.com/84116509/164401906-013a53bb-c5d3-4433-b6ba-1040ecefbf4f.png)
<br>![image](https://user-images.githubusercontent.com/84116509/164401947-6a175ed5-3527-446a-b8e8-a1057362098b.png)

7. 전체적인 CNN 구현 흐름
- CNN 학습은 지도 학습기반이며 정답을 찾을 수 있는 필터의 값을 최적화하는 과정이다. <br>![image](https://user-images.githubusercontent.com/84116509/164402020-33b3a3ed-2cfd-43a8-8c0b-b0066ff85027.png)

## Color 이미지의 합성곱 연산

1. Color 이미지는 3개의 Channel로 구성됨.<br>![image](https://user-images.githubusercontent.com/84116509/164402106-01bc3f32-405c-48c9-b95e-137bf7222e39.png)
2. 커널(필터) 또한 RGB 3차원으로 구성됨. <br>![image](https://user-images.githubusercontent.com/84116509/164402201-b21013d5-99f2-4c7d-b016-d7aa176e6412.png)
3. Color 이미지의 RGB 속성에 3차원 커널이 대응하여 연산이 이루어짐, 출력 결과는 1개의 값
   - (4, 4, 3): width 4px, height 4px, rgb 3
   - (3, 3, 3): width 3px, height 3px, rgb 3
   - 커널(필터)의 수만큼 출력<br>![image](https://user-images.githubusercontent.com/84116509/164402288-5ed888f9-f862-4fba-ba63-6281f26c5bbd.png)
4. 합성곱층 간의 연산
1) 이전 합성곱 층에서 (4, 4, 5)의 출력 발생: 이전 Conv층은 5개의 필터가 존재했었음.
2) 10개의 3 X 3 필터가 새로 대응한다면 최종 필터의 차원은 3 X 3 X 5가 되어야함.
    - 1번 Conv층의 필터의 수만큼 다음 2번 Conv층의 필터 사용시 필터의 깊이는 5가됨.
3) 10개의 3 X 3 필터가 적용됨으로 출력 결과는 10개의 특성 맵이 만들어 져야함 ★ <br>![image](https://user-images.githubusercontent.com/84116509/164402379-154cdb1d-8b33-4d91-b916-1a07cb1d1e4e.png)

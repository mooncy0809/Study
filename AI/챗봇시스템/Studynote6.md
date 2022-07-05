[01] Sin곡선을 예측하는 순환신경망 LSTM(Long Short-Term Memory) 모델의 사용
   - RNN 모델은 입력 시퀀스의 시점이 길어질수록 앞쪽의 데이터가 뒤쪽으로 전달되지 않아 학습 능력이 떨어짐.
   - RNN을 다층 구조로 쌓으면 입력과 출력 데이터 사이의 연관 관계가 줄어들어 장기 의존성 문제가 생김.
   - LSTM은 RNN의 문제점을 개선한 네트워크
     . Ct: LSTM 값의 마지막 단계까지 오랫 동안 정보 특성을 기억 할 수 있는 장기 상태
     . Xt: 데이터, 현재 시점의 입력값, ht-1: 이전 시점의 단기 은닉 상탯값, ht: 현재 시점의 단기 은닉 상탯값

1. LSTM 구조 
- 단기 기억을 오래도록 기억함.
- 순환 상태가 2개로 구성됨.
- 내부에 총 4개의 셀이 구성됨.
- 삭제 게이트는 셀 정보를 삭제, 입력 게이트는 새로운 정보를 셀 상태에 추가함.
- RNN에 비하여 우수한 성능을 나타냄. <br>![image](https://user-images.githubusercontent.com/84116509/177339647-bdc522e9-e003-47e0-ac64-e1bed9c61dcb.png)

2. LSTM 상세 구조
   - model.add(LSTM(units=10, return_sequences=False, input_shape=(n_timesteps, n_features)))
     . units=10: rnn 계층에 존재하는 전체 뉴런수
     . return_sequences=False: 은닉 상태값을 출력할지 결정
     . False: 마지막 시점의 메모리 셀에서만 결과를 출력, True: 모든 rnn 계산과정에서 결과를 출력
     . return_sequences는 다층 구조의 rnn 모델이나 one-to-many, many-to-many구조에서 사용
     . input_shape=(n_timesteps, n_features): 입력 시퀀스 길이, 변수의 갯수 <br>![image](https://user-images.githubusercontent.com/84116509/177339689-46ac684d-a326-4604-84e9-02852f77a966.png)
[02] 0 또는 1을 예측하는 양방향 LSTM 모델의 제작
   - 양방향에서 문장의 패턴을 분석 할 수 있는 패턴으로 LSTM 대비 정확도가 향상됨.
   - 문장이 긴 경우 단방향 LSTM의 경우 정확도가 떨어지는 문제를 해결
   - 문장에서 중요단어가 뒤에 있는 경우 정확도가 떨어지는 문제를 해결함.
     예) 유럽 여행중 ________ 타고 창밖 풍경을 보는사이 어느세 종착역에 도착했다. 

1. 양방향 LSTM 구조 <br>![image](https://user-images.githubusercontent.com/84116509/177339763-fefffaba-6c27-45cb-bbc2-dd885928f69b.png)
2. TimeDistributed: Dense가 3차원 데이터를 받을 수 있도록 처리함. <br>![image](https://user-images.githubusercontent.com/84116509/177339790-dce2a332-7fb6-4c27-a6c0-0d740cc56652.png)

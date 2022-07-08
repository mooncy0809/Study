[01] 챗봇 엔진 제작, 챗봇 엔진의 핵심 기능, 챗봇 엔진 처리 과정, 사용자 사전 구축, 전처리 모듈 제작, 전처리 모듈 테스트

1) pickle
   - Python의 list등 데이터 타입을 유지하면서 입출력 가능
   - 사용
        list = ['a', 'b', 'c']
        with open('./list.bin', 'wb') as f:
            pickle.dump(list, f)

        with open('./list.bin', 'rb') as f:
            data = pickle.load(f) # 단 한줄씩 읽어옴


1. 챗봇 엔진의 핵심 기능<br>![image](https://user-images.githubusercontent.com/84116509/177993641-718bf909-2ade-4f0b-8b2f-64e8777b48bc.png)
2. 챗봇 엔진 처리 과정 <br>![image](https://user-images.githubusercontent.com/84116509/177993662-1aa02e56-fe82-4059-96d4-97a4c81f3241.png)
3. Komoran 형태소 분석기 품사 태그표
   - https://docs.komoran.kr/index.html
   - NNG: 일반 명사
   - JKS: 주격 조사
   - JKB: 부사격 조사
   - VV: 동사
   - EF: 종결 어미
   - SF: 마치표, 물음표, 느낌표

4. Okt 형태소 분석기 품사 태그표
   - Noun: 명사
   - Verb: 동사
   - Adjective: 형용사
   - Josa: 조사
   - Punctuation: 구두점

[02] 단어 사전 구축 및 시퀀스 생성
   - 챗봇엔진에서 의도 분류 및 개체명 인식 모델의 학습을 하려면 단어 사전을 구축해야함.

1. 데이터<br>![image](https://user-images.githubusercontent.com/84116509/177993706-ef3ee25f-70f0-4901-8b9d-319b5875e732.png)
2. 단어 사전 구축에 필요한 말뭉치:
▷ /NLP/chatbot/dict/corpus.txt
```
0000    헬로우        0
0000    헬로        0
0000    안부 인사드립니다.        0
.....
0000    양장피 메뉴 주문 가능한가요        2
0000    양장피 주문하고싶은데 진행을 어떻게 하면 되나요        2
0000    양장피 방문이나 전화로 주문가능합니까?        2
```
3. 챗봇에서 사용하는 사전 파일 'chatbot_dict.bin' 생성, 단어 사전 구축 및 시퀀스 생성 모듈 제작
   - ./dict/chatbot_dict.bin 생성
   - ./corpus.txt: chatbot 사전을 만들 말뭉치

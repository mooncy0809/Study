 [01] 텍스트 유사도
1. n-gram의 사용 <br>![image](https://user-images.githubusercontent.com/84116509/177172283-df01ae86-caeb-4bd3-a94f-292e50238f2b.png)
2. 2-gram의 사용 <br>![image](https://user-images.githubusercontent.com/84116509/177172307-e5282c37-0e24-46e3-9147-edda7cf24705.png)
3. n-gram 유사도(TDM: Term-Document Matrix, 단어 문서 행렬)
   - tf(Term Frequency): 문장에서 동일한 토큰이 등장한 횟수
     . tf(A, B): A 문장에 등장하는 토큰 기준 B 문장에 동일하게 등장하는 토큰수 
   - tokens: 문장에 등장한 모든 토큰수 <br>![image](https://user-images.githubusercontent.com/84116509/177172339-d7601548-aad4-413f-929d-da05e4119e3d.png) <br>similarity = tf(A, B) / tokens(A) 
4. 코사인 유사도 <br>![image](https://user-images.githubusercontent.com/84116509/177172430-29303e31-818a-4866-bbab-15691b89ebad.png)
5. TDM: Term-Document Matrix, 단어 문서 행렬 <br>![image](https://user-images.githubusercontent.com/84116509/177172454-cc304c8d-99d1-4ee4-966f-ca3784c04517.png)
<br>![image](https://user-images.githubusercontent.com/84116509/177172475-be2f7ccb-ffda-4864-ab4d-5e4cdc90280d.png)
<br>![image](https://user-images.githubusercontent.com/84116509/177172494-b00df0dc-39c1-4f27-bd2b-76ddcdc5fca8.png)
<br>![image](https://user-images.githubusercontent.com/84116509/177172512-dc0256f6-76b5-459d-a468-3bb9a130b856.png)

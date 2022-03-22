## 변수, 상수, 함수, 거듭 제곱과 제곱근, 다항식 함수<br />
<br />
1. 일차방정식과 이차방정식<br />
1) 1차 방정식<br />
&nbsp; &nbsp; -&nbsp;f(x) = ax + b<br />
&nbsp; &nbsp; - 1차 함수 단순 선형회귀등에 이용됨.<br />
&nbsp; &nbsp; - 직선 형태의 결과가 발생함.<br />
<br />
2) 2차 방정식<br />
&nbsp; &nbsp; -&nbsp;f(x) = ax&sup2; + bx + c<br />
&nbsp; &nbsp; -&nbsp;2차 함수 다중 선형회귀등에 이용됨.<br />
&nbsp; &nbsp; - 곡선 형태의 결과가 발생함.<br />
<br />
<br />
2.&nbsp;연립방정식: 미지수가 여러개인 방정식<br />
&nbsp; &nbsp; 3 * x + y - 2 &nbsp;-&gt; 3x + y = 2 -&gt; 3x - 1 = 2 -&gt; 3x = 3 -&gt; x = 1<br />
&nbsp; &nbsp; x - 2 * y - 3&nbsp; -&gt; x - 2y = 3 -&gt; x + 2 = 3 -&gt; x = 1<br />
<br />
<br />
3. 함수<br />
&nbsp; &nbsp;- 함수는 방정식으로 구성됨.<br />
&nbsp; &nbsp;- 1차 함수<br />
&nbsp; &nbsp; &nbsp;. x의 차수가 1인 함수: f(x) = ax + b<br />
&nbsp; &nbsp;-&nbsp;2차 함수<br />
&nbsp; &nbsp; &nbsp;. x의 차수가 2인 함수: :&nbsp;f(x) = ax&sup2; + bx + c<br />
&nbsp; &nbsp;- 직선의 방정식<br />
&nbsp; &nbsp; &nbsp;. y = ax + b<br />
&nbsp; &nbsp; &nbsp;. a: 기울기<br />
&nbsp; &nbsp; &nbsp;. b: y 절편, 편향, bias<br />
<br />
<br />
4.&nbsp;기울기<br />
&nbsp; &nbsp;-&nbsp;y 축의 변화량 / x 축의 변화량<br />
<br />

## 수열의 합, 수열의 곱, 등차 수열, 평균, 분산, 표준편차, 균등 분포, 정규 분포<br />
<br />
1. 이용 분야에 따른 통계학의 구분: 기술 통계<br />
1) 기술 통계(요약통계)<br />
- 수집된 자료의 특성을 쉽게 파악하기 위해서 자료를 정리 및 요약하는 유형<br />
- 표, 그래프, 대표값(평균)등을 이용하여 표현<br />
- 요약(기술) 통계: 판매된 상품등을 대상으로 수집된 전체 데이터를 기반으로 함.<br />
-&nbsp;추론 통계 전에 기본적으로 거치는 통계<br />
<br />
2) 기술 통계량 유형<br />
&nbsp; &nbsp; - 대표값: 자료 전체를 대표하는 값으로 분포의 중심위치를 나타내는 측정치를 의미<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예)&nbsp;평균(Mean), 합계(Sum), 중위수(Median), 최빈수(mode), 사분위수(quartile) 등<br />
&nbsp; &nbsp; - 산포도: 자료가 대표값으로부터 얼마나 흩어져 분표하고 있는가를 보여주는 갓들의 의미<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예)&nbsp;분산(variance), 표준편차(Standard deviation), 최소값(Minimum), 최대값(Maximum),<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;범위(Range), 평균의 표준오차(S. E, mean) 등<br />
&nbsp; &nbsp; - 비대칭도: 분포가 기울어진 방향과 정도를 나타내는 왜도와 분포도가 얼마나 중심에 집중되어 있는가를<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;나타내는 첨도로 구성<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;예)&nbsp;첨도(kurtosis), 왜도(Skewness)<br />
<br />
<br />
2. 이용 분야에 따른 통계학의 구분: 추론 통계<br />
1) 추론 통계<br />
- 모집단(같은 상품을 구입한 모든 소비자)에서 추출한 표본의 정보를 이용하여<br />
&nbsp;&nbsp;모집단의 다양한 특성을 과학적으로 추론하는 통계.<br />
-&nbsp; 판매된 데이터를 기반으로하나 상품을 구입하지 않은 가상의 고객에 대한 구입의사를<br />
&nbsp; &nbsp;예측하기위해 실시<br />
&nbsp; . 일부 정보를 이용하여 전체적인 흐름이 어떤지 파악하는 통계<br />
&nbsp; . 어떤 분야의 데이터를 모두 수집한다는 것은 현실적으로 불가능에 가까움으로 예측 할 수 밖에 없음.<br />
&nbsp; . DBMS상에 등록된 매출은 모든 데이터를 이용 할 수 있어 요약통계가 가능하나,<br />
&nbsp; &nbsp; 기존에 미출액을 근거로하여 향후 매출액이 증가할 것인지는 추론 통계를 해야함.<br />
&nbsp; &nbsp; 예) 최근 10년간의 12월의 매출액을 근거로하여 올해 12월의 매출액을 예측,<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;설문조사를 바탕으로 신상품 개발시에 매출액 예약<br />
<br />
2) 추론 통계량 유형<br />
&nbsp; &nbsp;- 회귀분석, T-검정(평균 분석), F-검정(분산분석), 분류 분석, 군집 분석, 연관 분석등<br />
&nbsp;&nbsp;<br />
&nbsp;&nbsp;<br />
2. 조사의 방법<br />
- 모집단: 전체 데이터, 현실적으로 수집이 어려움, 전국의 IT 관련 종사자의 연봉<br />
- 모수: 모집단을 대상으로한 통계, 합계, 평균, 분산, 표준편차등<br />
- 샘플링: 모집단에서 일부 표본을 산출하는 과정,&nbsp;<br />
- 표본: 모집단의 일부 데이터, 서울지역의 IT 관련 종사자 연봉&nbsp;<br />
- 통계량: 표본을 대상으로한 통계, 합계, 평균, 분산, 표준편차등<br />
- 추론 통계는 기본 데이터 집단이 표본을 대상으로함 ★<br />
![image](https://user-images.githubusercontent.com/84116509/159429380-2b5f4803-6500-4227-9285-07c797a9acbb.png)<br />
<br />
1) 전수조사<br />
- 모집단내에 있는 모든 대상을 조사하는 방법<br />
- 전국민을 대상으로하는 인구조사가 대표적인 예<br />
- 전체를 대상으로함으로 모집단의 특성을 정확히 반영할 수 있으나<br />
&nbsp; 시간과 비용이 많이 소요되는 단점을 가진다.<br />
&nbsp; 예) 인구 총조사<br />
&nbsp;&nbsp;<br />
2) 표본조사<br />
- 모집단에서 추출된 표본을 대상으로 분석을 실시하기 때문에 전수조사의 단점을 개선할 수 있다.<br />
- 모집단의 특성을 반영하는 표본이 추출되지 못하는 경우 수집된 자료가 무용지물이 될 수 있다.<br />
- 예) 투표일 출구 조사, 선거 여론조사, 마케팅 조사, 산업현장의 안전성 검사, 의.생명분야 임상실험등<br />
&nbsp;<br />
&nbsp;<br />
3. 모집단과 표본<br />
- 모집단(Population)은 통계적 관찰 대상이 되는 개체의 전체집합을 의미하며, 표본(Sample)은 모집단에서<br />
&nbsp; 조사대상으로 추출된 부분집합을 뜻한다.<br />
- 모집단으로부터 표본을 추출하는 과정을 표본추출(Sampling)이라고한다.<br />
- 모집단의 특성을 나타내는 모수(Parameter)와 표본의 특성을 나타내는 통계량(Statistic)의 표기 방법<br />
- 모수와 통계량 기호&nbsp;<br />
&nbsp; 구분&nbsp; &nbsp; &nbsp; &nbsp; 모수(모집단 대상)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;통계량(표본 대상)<br />
&nbsp; ---------&nbsp; &nbsp;----------------------------------&nbsp; &nbsp;&nbsp;----------------------------------<br />
&nbsp; 의미&nbsp; &nbsp; &nbsp; &nbsp; 모집단의 특성을 나타내는 수치&nbsp; &nbsp; 표본의 특성을 나타내는 수치<br />
&nbsp; 표기&nbsp; &nbsp; &nbsp; &nbsp; 그리스 로마자&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 영문 알파벳<br />
&nbsp; 평균&nbsp; &nbsp; &nbsp; &nbsp; &mu;(뮤, 모평균)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/ckstorage/images/math/xbar.png" />(표본의 평균)&nbsp;<br />
&nbsp; 분산&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&sigma;&sup2;(시그마, 모분산)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;S&sup2;(표본의 분산)&nbsp;<br />
&nbsp; 표준편차&nbsp; &sigma;(모표준편차)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;S(표본의 표준편차)&nbsp;<br />
&nbsp; 대상 수&nbsp; &nbsp; N(사례수)&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; n(표본수)<br />
- 표준 편차 구하는 순서: 평균 &rarr; 편차&nbsp;&rarr; 분산&nbsp;&rarr; 표준편차&nbsp;<br />
&nbsp;<br />
<br />
1) 모집단의 모평균(&mu;), 표본의 표본 평균(<img alt="" src="http://soldeskit3.cafe24.com/ckstorage/images/math/xbar.png" /><img alt="" src="/ckstorage/images/math/xbar.png" />)<br />
&nbsp; &nbsp; - IT 개발자의 신입 연봉 평균은 2800만원이다.<br />
&nbsp; &nbsp; - 산출 공식<br />
&nbsp; &nbsp; &nbsp; . &sum;: X₁, X₂, X₃...의 합<br />
&nbsp; &nbsp; &nbsp; . 모든 데이터의 합을 구하여 갯수로 나눔<br />
<br />
&nbsp; &nbsp; &nbsp;&nbsp;![image](https://user-images.githubusercontent.com/84116509/159429486-d8ae35b9-d1a4-4a1a-85cb-d3fc8e0262e0.png)<br />
&nbsp; &nbsp; - 1이 7개, 2가 5개...의 평균<br />
&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp;![image](https://user-images.githubusercontent.com/84116509/159429518-5d84afcf-0f85-420f-9ac9-52e55b03535a.png)&nbsp;&nbsp;<br />
&nbsp;&nbsp;<br />
2) 편차(Deviation)<br />
&nbsp; &nbsp; -&nbsp;평균으로부터의 차이, 평균 - 관측 값<br />
&nbsp; &nbsp; - 편차의 합은 0이됨.<br />
&nbsp; &nbsp; - IT 개발자의 신입 연봉 평균은 2800만원이다. 이 연봉으로부터의 차이가 편차가됨.<br />
&nbsp; &nbsp; - 편차가 적으면 안정적인 연봉을 기대할 수 있으나, 편차가 크면 나의 연봉을 예측하기 어렵다.<br />
&nbsp; &nbsp; - 김밥천국의 하루 매출액 평균이 50만원인데 편차가 크면 경영자는 불안하다.<br />
&nbsp; &nbsp; - 편차가 심한 상권: 학교앞 점포, 여름에 방문객에 주로 차지하는 해수욕장앞 상권, 펜션, 스키장 관련등&nbsp; &nbsp; &nbsp;<br />
&nbsp; &nbsp; - 산출 공식<br />
&nbsp; &nbsp; &nbsp;&nbsp;![image](https://user-images.githubusercontent.com/84116509/159429599-ddf60b1c-6b53-4b8d-85b2-db6e21c3ca69.png)<br />
&nbsp;<br />
&nbsp; &nbsp; &nbsp;&nbsp;![image](https://user-images.githubusercontent.com/84116509/159429607-9e88839f-7755-4a43-8c2e-2b76da7a928c.png)<br />
&nbsp;<br />
3) 분산(Variance)<br />
&nbsp; &nbsp; - 평균(대표값)으로부터 떨어진 거리들의 평균<br />
&nbsp; &nbsp; - 편차의 합은 0이됨으로 전체 편차를 알고싶어서 수치적으로 계산해도 0이됨으로 의미가 없음.<br />
&nbsp; &nbsp; - 편차가 심한 상권: 학교앞 점포, 여름에 방문객이 주로 있는 해수욕장앞 상권, 펜션, 스키장 관련등의<br />
&nbsp; &nbsp; &nbsp; 상가에 대해서 수집된 데이터의 전체 편차를 알고 싶지만 0이됨으로 분산이 필요함.&nbsp; &nbsp; &nbsp;<br />
&nbsp; &nbsp; - 분산은 편차의 제곱을 적용하여 모두 양수로 변경한 다음 합을 구하는 절차를 통해 산출<br />
&nbsp; &nbsp; - 편차가 커지면 분산도 따라서 커지는 비례관계임.<br />
&nbsp; &nbsp; - 편차가 커지면 분산도 커지고 경영자는 매출액을 예측하기 어렵게된다.<br />
&nbsp; &nbsp; - 분산이 커지면 예측이 어려워 정확도가 떨어지고 머신러닝, 딥러닝에서의 예측 결과가 안좋음.<br />
&nbsp; &nbsp; -&nbsp;모집단의 모분산: &sigma;&sup2;<br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;![image](https://user-images.githubusercontent.com/84116509/159429703-4ee7b1f1-6bfc-40e4-aa89-e051729bb740.png)<br />
&nbsp;&nbsp;<br />
&nbsp; &nbsp; - 표본의 분산(불편 분산): S&sup2;, 변량(데이터)의 수를 n-1로 지정, 5건 데이터의 경우 4로 지정 ★<br />
&nbsp; &nbsp; &nbsp; &nbsp;![image](https://user-images.githubusercontent.com/84116509/159429718-1064fd98-5dea-47d2-bbfc-708800aca072.png)<br />
<br />
4) n-1을 지정하는 이유(표본의 분산(불편 분산))<br />
&nbsp; &nbsp;- 모분산은 전체 데이터에 대한 분산임<br />
&nbsp; &nbsp;- 표본 분산은 표본을 이용한 분산을 계산하여 전체 분산이 어떻다고 예측하는 것임.<br />
&nbsp; &nbsp;- 전국의 분식집의 매출액 분산을 예측하는 것은 어려움으로 일부 점포에 대한 표본 분산을 진행하고<br />
&nbsp; &nbsp; &nbsp;전국의 분식집의 매출액 분산을 추측함(추상적).<br />
&nbsp; &nbsp;- 일반적으로 표본집단의 분산이 모집단보다 작음으로 균형을 맞추기위하여 표본 집단의 분산을 값을 증가시킴<br />
&nbsp; &nbsp;- 모집단의 데이터의 갯수를 자유도(n)라고한다.<br />
&nbsp; &nbsp;- 표본집단의 데이터의 갯수를 자유도-1(n-1)하여 값을 증가시킨다.<br />
&nbsp; &nbsp;- 전체 데이터를 대상으로한 모분산은 소규모의 데이터를 기반으로 산출된 표본분산의 값보다 값이 큰 경우가 많음.<br />
&nbsp; &nbsp; &nbsp; . 서울 종로의 분식집 편차와 지방의 분식집 편차는 거래 규모가 달라 전체 데이터의 경우 편차가 다를 수 있음.<br />
&nbsp; &nbsp; &nbsp; . 서울에서 휴가를 갈때 소요시간 예측<br />
&nbsp; &nbsp; &nbsp; . 전국 모든 IT 직종의 평균 연봉 구간: 지역적 특성과 다양한 조건에따라 연봉 발생(모분산)&nbsp;<br />
&nbsp; &nbsp; &nbsp; . 서울 지역의&nbsp;IT 직종의 평균 연봉 구간: 좁은 지역과 서울이라는 조건에따라 연봉 발생(포본 분산)<br />
&nbsp; &nbsp;- 모집단: 지구상의 모든 지역의 최저/최고 온도 조사 (온도 분산이 큼, 극지역 -60도이하)<br />
&nbsp; &nbsp;- 표본: 대한민국 지역의&nbsp;최저/최고 온도 조사 (온도 분산이 서울 지역에 국한됨, -15~35도)<br />
&nbsp; &nbsp;- 표본의 편차가 작은 문제를 해결하기위해 표본의수를 감소(n-1)시켜 표본 분산의 값을 증가시킴<br />
&nbsp;&nbsp;<br />
5) 표준 편차(Standard Deviation) ★<br />
&nbsp; &nbsp;- 분산은 편차가 제곱이되어 있음으로 원본 값의 편차가 2배증가되어 있는 문제 발생<br />
&nbsp; &nbsp;- 제곱근(SQRT, &radic;)을 이용하여 원래의 수로 환원<br />
&nbsp; &nbsp;-&nbsp;모집단의 모표준편차: &sigma;<br />
&nbsp;<br />
&nbsp; &nbsp; &nbsp;![image](https://user-images.githubusercontent.com/84116509/159429756-8d17ae5a-1b48-4ec9-af5d-b2f3df19cdb2.png)<br />
&nbsp;<br />
&nbsp; &nbsp;-&nbsp;표본의 표준편차: S, 변량의 수(데이터의 수)를 n-1로 지정&nbsp;<br />
<br />
&nbsp; &nbsp;- 표준 편차의 구간: 모든 표본들이 평균으로 떨어진 정도, 평균에서 멀어질수록 일반적인 발생 데이터가 아닐 수 있음.<br />
&nbsp; &nbsp; &nbsp;예) 연봉이 5000 만원데 누군가는 2억을 받는다면 일반적인 상황이 아님, 의심이 발생함.<br />
&nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/ckstorage/images/R/01/10.jpg" /><br />
&nbsp; &nbsp;- 6 sigma: 100% -&nbsp;0.002% -&gt; 99.998 % 범위 거의 100%, 불량률 0%을 지향하는 기업 경영 목표중 하나<br />
&nbsp; &nbsp; &nbsp;<img alt="" src="/ckstorage/images/R/01/11.jpg" /><br />
&nbsp; &nbsp;<br />
<br />
[02] 정규 분포<br />
1. 확률론과&nbsp;통계학에서&nbsp;정규 분포(正規 分布,&nbsp;영어:&nbsp;normal distribution) 또는<br />
&nbsp;&nbsp;&nbsp;가우스 분포(Gau&szlig; 分布,&nbsp;영어:&nbsp;Gaussian distribution)는&nbsp;연속 확률 분포의 하나이다.<br />
&nbsp; &nbsp;- 가우스 분포: 정규 분포, 은하수 정규 분포의 형태,&nbsp;https://namu.wiki/w/%EC%A0%95%EA%B7%9C%EB%B6%84%ED%8F%AC<br />
&nbsp; &nbsp;-&nbsp;연속 확률 분포: 실수형 분포<br />
<br />
정규분포는 수집된 자료의 분포를&nbsp;근사하는 데에 자주 사용되며, 이것은&nbsp;중심극한정리에 의하여 독립적인&nbsp;확률변수들의 평균은 정규분포에 가까워지는 성질이 있기 때문이다.<br />
정규분포는 2개의 매개 변수&nbsp;평균&nbsp;<img alt="\mu " src="https://wikimedia.org/api/rest_v1/media/math/render/svg/9fd47b2a39f7a7856952afec1f1db72c67af6161" />과&nbsp;표준편차&nbsp;<img alt="\sigma " src="https://wikimedia.org/api/rest_v1/media/math/render/svg/59f59b7c3e6fdb1d0365a494b81fb9a696138c36" />에 대해 모양이 결정되고,&nbsp;특히, 평균이 0이고 표준편차가 1인 정규분포&nbsp;<img alt="{\mathrm  {N}}(0,1)" src="https://wikimedia.org/api/rest_v1/media/math/render/svg/d15a45b474dded72fba385afd8397325a74d8986" />을&nbsp;표준 정규 분포(standard normal distribution)라고 한다.<br />
<br />
<br />
<br />
[03]&nbsp;표준정규분포(Standard Normal Distribution)<br />
&nbsp; &nbsp;- 정규 분포를 이용하여 확률(pdf)이나 값(ppf)의 추정을 진행 할 시 분포의 규모가 달라서&nbsp;<br />
&nbsp; &nbsp; &nbsp;2개의 정규 분포등을 비교할 때 표준적인 기준이 필요하여 표준 정규 분포가 만들어짐.<br />
&nbsp; &nbsp;- 표준 정규분포표를 만들어 z라는 값을 구해서 어떤 값이 몇 %에 위치하는지 알 수 있음.<br />
&nbsp;<br />
1. 표준정규분포<br />
&nbsp; &nbsp;- 분포가 다른 2개의 정규분포를 일정한 기준에 일치시켜 비교하기위함.<br />
&nbsp; &nbsp; &nbsp;예) 약을 먹기전과 먹은후의 효과의 비교, 입사시 각종 점수의 비교<br />
&nbsp; &nbsp;- 단위에 따라서 평균과 분산이 다른 정규분포(N(&mu;(평균),&nbsp;&sigma;&sup2;(분산): 1)를 표준화한 것이 표준정규분포임.<br />
&nbsp; &nbsp;- 표준정규분포는 정규분포를 N(0(평균), 1(분산, 표준편차))로 변경한 분포를 말함.<br />
&nbsp; &nbsp;- 전체의 합은 1임으로 확률에 대응함, 평균 0을 기준으로 좌측 50%, 우측 50%로 나누어짐.<br />
<img alt="" src="http://www.nulunggi.pe.kr/ckstorage/images/nation/R2/03/02.jpg" /><br />
- 영역을 1로 변환하여 확률 대응이 가능함으로 정규분포의 확률을 구할 때 이용함.<br />
<br />
<img alt="" src="http://www.nulunggi.pe.kr/ckstorage/images/nation/R2/03/05.gif" /><br />
&nbsp;<br />
- 표준화 예(TOEIC &lt;-&gt; TOFEL &lt;-&gt; TEPS 점수 인정 비교)&nbsp;<br />
&nbsp;<img alt="" src="http://www.nulunggi.pe.kr/ckstorage/images/nation/R2/03/01.jpg" /><br />
&nbsp; &nbsp;- TOEIC: 1000 점 만점 가정, TOEFL: 100점 만점 가정<br />
&nbsp; &nbsp; &nbsp;. 평균: 0 기준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 500 == TOEFL&nbsp;50 동일한 수준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 600 == TOEFL 60 동일한 수준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 700 == TOEFL 70 동일한 수준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 800 == TOEFL 80 동일한 수준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 900 == TOEFL 90 동일한 수준<br />
&nbsp; &nbsp; &nbsp;. TOEIC 1000 == TOEFL 100 동일한 수준<br />
<br />
&nbsp; &nbsp;- 만약 어떤 자격증이 300점이고 또다른 자격증의 점수는 1520점이라면 서로 같은 난이도의 비교는<br />
&nbsp; &nbsp; &nbsp;상당히 어려움으로 표준화란 기법이 필요함.<br />
&nbsp;&nbsp;<br />
<br />
2. 표준화 변수 Z<br />
- 정규분포의 변수(확률변수) X를 구하기 위해서 표준정규분포로 바꾸는 변수를 표준화 변수 Z라고한다.<br />
- 정규분포를 표준정규분포로 바꾸는 Z의 공식<br />
&nbsp; Z = X - &mu; / &sigma;&nbsp; &nbsp;X: 변수(확률변수), &mu;: 모평균, &sigma;: 모 표준 편차<br />
&nbsp; Z = X - &mu; / &sigma;&nbsp; &nbsp;X: 1명의 성적, &mu;: 반 전체 평균, &sigma;: 평균으로부터 성적의 표준적인 차이<br />
<img alt="" src="http://www.nulunggi.pe.kr/ckstorage/images/nation/R2/03/13.png" /><br />
<br />
<br />

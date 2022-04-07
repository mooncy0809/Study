## 정규 분포
1. 확률론과 통계학에서 정규 분포(正規 分布, 영어: normal distribution) 또는 가우스 분포(Gauß 分布, 영어: Gaussian distribution)는
   연속 확률(값을 무한대로 세분화, 실수등) 분포의 하나이다.
   - 가우스 분포: 정규 분포, 은하수 정규 분포의 형태, https://namu.wiki/w/%EC%A0%95%EA%B7%9C%EB%B6%84%ED%8F%AC
   - 연속 확률 분포: 값을 무한대로 세분화, 실수형 분포
   - 정규분포는 수집된 자료의 분포를 근사(어떤 목표값으로 가까이가는 현상)하는 데에 자주 사용되며,
     이것은 중심극한정리에 의하여 독립적인 확률변수(컬럼, 데이터 변수)들의 평균은 정규분포에 가까워지는 성질이 있기 때문이다.
     정규분포는 2개의 매개 변수 평균 \mu 과 표준편차 \sigma 에 대해 모양이 결정되고,
     특히, 평균이 0이고 표준편차가 1(분산 1)인 정규분포 {\mathrm  {N}}(0,1)을 표준 정규 분포(standard normal distribution)라고 한다. ★


## 표준정규분포(Standard Normal Distribution)
   - 정규 분포를 이용하여 확률(pdf)이나 값(ppf)의 추정을 진행 할 시 분포의 규모가 달라서 
     2개의 정규 분포등을 비교할 때 표준적인 기준이 필요하여 표준 정규 분포가 만들어짐.
   - 표준 정규분포표를 만들어 z(표준화된 값)라는 값을 구해서 어떤 값이 몇 %에 위치하는지 알 수 있음.
 
1. 표준정규분포
   - 분포가 다른 2개의 정규분포를 일정한 기준에 일치시켜 비교하기위함.
     예) 약을 먹기전과 먹은후의 효과의 비교, 입사시 각종 점수의 비교
   - 단위에 따라서 평균과 분산이 다른 정규분포(N(μ(평균), σ²(분산): 1)를 표준화한 것이 표준정규분포임.
   - 표준정규분포는 정규분포를 N(0(평균), 1(분산, 표준편차))로 변경한 분포를 말함.
   - 전체의 합은 1임으로 확률에 대응함, 평균 0을 기준으로 좌측 50%, 우측 50%로 나누어짐.<br>![image](https://user-images.githubusercontent.com/84116509/161703957-70cce009-456a-485f-9796-27549ba38a03.png)
   - 영역을 1로 변환하여 확률 대응이 가능함으로 어떤 사건의 확률을 구할 때 이용함. <br>![image](https://user-images.githubusercontent.com/84116509/161704001-7ed50b22-5dcc-4cd9-894e-5717a5592cb2.png)
   - 표준화 예(TOEIC <-> TOFEL <-> TEPS 점수 인정 비교) <br>![image](https://user-images.githubusercontent.com/84116509/161704054-2c5fd237-edc1-45a6-9b68-aed176ed6a31.png)
   - TOEIC: 1000 점 만점 가정, TOEFL: 100점 만점 가정
     . 평균: 0 기준
     . TOEIC 500 == TOEFL 50 동일한 수준
     . TOEIC 600 == TOEFL 60 동일한 수준
     . TOEIC 700 == TOEFL 70 동일한 수준
     . TOEIC 800 == TOEFL 80 동일한 수준
     . TOEIC 900 == TOEFL 90 동일한 수준
     . TOEIC 1000 == TOEFL 100 동일한 수준
   - 만약 어떤 자격증이 300점이고 또다른 자격증의 점수는 1520점이라면 서로 같은 난이도의 비교는 상당히 어려우므로 표준화란 기법이 필요함 -> 표준정규분포에 대응하는 값의 형태로 변환.

2. 표준화 변수 Z
- 정규분포의 변수(확률변수) X를 표준정규분포에 대응하는 값으로 변경한 값의 이름을 Z라고한다.
- 정규분포를 표준정규분포로 바꾸는 Z의 공식
  Z = X - μ / σ   X: 변수(확률변수, 값), μ: 모평균, σ: 모 표준 편차
  Z = X - μ / σ   X: 1명의 성적, μ: 반 전체 평균, σ: 평균으로부터 성적의 표준적인 차이
        -> 반에서 성적이 상위 몇 %에 위치하는지 값 산출 가능 <br>![image](https://user-images.githubusercontent.com/84116509/161704217-a2fcda84-3775-4347-8f25-0952f3387245.png)
    예) A 고등학교의 B반 학생의 국어 점수가 평균 75점, 표준편차 5점인 정규분포로 나타났다.
    이 경우에 어느 학생의 점수가 70점~80점 사이일 확률은?
 
    평균: 75점, 표준 편차: 5점, 변수(확률 변수): 70, 80 <Br>![image](https://user-images.githubusercontent.com/84116509/161704299-084c65cb-a5fd-4eba-8b7c-a1459bd22abb.png)
    평균 보다 적을 경우: lz = 70 - 75 / 5 <- X-μ / σ, 평균 보다 클 경우: uz = 80 - 75 / 5 <- X-μ / σ
  lowerz = 70 - 75 / 5 -> -1
  upperz = 80 - 75 / 5 -> 1
  확률 구간 P(70 < 어떤 점수 X < 80) -> P(lowerz < 어떤 점수 Z < upperz) -> P( -1 < Z < 1 )
- Z값에 의해서 평균 0을 기준으로 ±1σ(표준편차)의 표준정규분포로 나타낸 경우, 면적을 이용하여 확률을 구함(적분) <Br>![image](https://user-images.githubusercontent.com/84116509/161704400-8be66708-d35d-435a-9877-14348aab48f7.png)

3. Z값의 확률(면적)을 구하기 위해서는 표준정규분포표를 이용한다.
   - 표준정규 분포표 종류중 50%의 영역을 초기값으로 가지고 시작하는 분포표는 Z=0인경우
     확률은 0.5(50%)가 초기값이다.
   - 표준정규 분포표 종류중 0%의 영역을 초기값으로 가지고 시작하는 분포표는 Z=0인경우
     확률은 0.0(0%)이 초기값이다.   
   - 크다 작다등 단측 검정이면 Z=0에서 0.5 사용, 일치여부(차이)를 체크하는 양측 검정이면 Z=0에서 0.0 사용 <br>![image](https://user-images.githubusercontent.com/84116509/161704452-133cd306-cdeb-4b76-977d-254e8ac68921.png)<br>![image](https://user-images.githubusercontent.com/84116509/161704476-62807803-4729-4826-8132-f5b4c1e9f59f.png)<Br>![image](https://user-images.githubusercontent.com/84116509/161704499-3777fa4b-4669-427e-8ff9-6b8ff92e5308.png)
1) 점수가 양수와 음수로 나누어짐으로 확률이 0.0(0%)를 갖는 표를 기준으로한다.
   최종 결과는 양수 영역만 계산하고 x2를하여 최종 확률을 결정한다. 
2) Z 값의 확률 구간 P(-1 < Z < 1)이 된다.
3) Z=1에 대한 값은 0.3413이며 이는 0부터 1까지의 확률이된다.
   Z=-1에 대한 값은 좌우 대칭으로 0.3413이며 이는 0부터 1까지의 확률이된다. 
   따라서 P(-1 < Z < 1)인 경우의 확률은 0.6826이 된다.
4) 평균 75점, 표준편차가 5점일때 어느 학생의 점수가 70~80점 사이일 확률은
    약 68.3 %가된다. <Br>![image](https://user-images.githubusercontent.com/84116509/161704535-e7cdfe38-e630-481c-92dd-e0dc5f9e76c7.png)

4. Z값과 확률 구간(Z 값의 산출은 확률을 계산하는 것과 같음, 적분 기반)
1) 확률 구간 P(70 < X < 80) => P(Z=70 - 75 / 5 < Z < Z=80 - 75 / 5)
                       = P(-1 < Z < 1) = 68.3 %
2) 확률 구간 P(65 < X < 85) => P(Z=65 - 75 / 5 < Z < Z=85 - 75 / 5)
                       = P(-2 < Z < 2) = 0.4772 + 0.4772 = 95.44 %
3) 확률 구간 P(60 < X < 90) => P(Z=60 - 75 / 5 < Z < Z=90 - 75 / 5)
                       = P(-3 < Z < 3) = 0.4987 + 0.4987 = 99.74 % <Br>![image](https://user-images.githubusercontent.com/84116509/161704568-5e27b36a-fd47-42e2-8455-ea67690e50d9.png)
- z 값은 연속적인 값이라 특정 % 추정(점추정)하기 어렵다.
  당신의 연봉은 49.257%이다.는 무한대로 z값이 나누어지고 특정수의 추정은 틀릴 확률이 매우 높음.
- 구간으로 추정을 할 경우 당신의 연봉은 40 ~ 60% 구간이다. 는 논리적으로 신뢰성이 높아짐.
 
5. 신뢰수준(Confidence Level, 신뢰 계수)
   - Z 값은 확률 100%와 대응함으로 Z 값을 이용하여 %를 산출 가능.
   - 사회과학 분야에서 일반적으로 사용되는 신뢰수준은 90%, 95%, 99%이다.
     이러한 신뢰 수준에 해당하는 Z값은 아래와 같다.
   - Z값은 신뢰구간을 추정하는 데 유용하게 이용된다.
   - z 값이 1.65이하이면 평균기준 90% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균 기준으로 90% 영역안에 포함되는 수치가 나왔다면 효과 있음.
     . 혈압을 가정하여 80 ~ 120 90% 영역으로 지정 할 수 있음. 
   - z 값이 1.96이하이면 평균기준 95% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균 기준으로 95% 영역안에 포함되는 수치가 나왔다면 효과 있음.
     . 혈압을 가정하여 70 ~ 130 95% 영역으로 지정 할 수 있음. 
   - z 값이 2.58이하이면 평균기준 99% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균 기준으로 99% 영역안에 포함되는 수치가 나왔다면 효과 있음.
     . 혈압을 가정하여 60 ~ 140 99% 영역으로 지정 할 수 있음. <br>![image](https://user-images.githubusercontent.com/84116509/161704631-43664805-8268-48d3-859c-df3720f345fd.png)
 - z 값이 1.65이상이면 평균으로부터 멀리 떨어진 10% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균에서 멀리 떨어져 10% 영역안에 포함되는 수치는 효과없는 약으로 인정 할 수 있음.
     . 혈압을 가정하여 80보다 작거나 120보다 큰 10% 영역일경우 비정상 혈압으로 지정 할 수 있음. 
 - z 값이 1.96이상이면 평균으로부터 멀리 떨어진 5% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균에서 멀리 떨어져 5% 영역안에 포함되는 수치는 효과없는 약으로 인정 할 수 있음.
     . 혈압을 가정하여 70보다 작거나 130보다 큰 5% 영역일 경우 비정상 혈압으로 지정 할 수 있음. 
 - z 값이 2.58이상이면 평균으로부터 멀리 떨어진 1% 영역안에 포함되는 데이터
     . 신약을 개발하여 평균에서 멀리 떨어져 1% 영역안에 포함되는 수치는 효과없는 약으로 인정 할 수 있음.
     . 혈압을 가정하여 60보다 작거나 140보다 큰 1% 영역일 경우 비정상 혈압으로 지정 할 수 있음. 

6. 신뢰구간(Confidence Interval, 신뢰 한계)

1) 모집단이 정규 분포를 이루고 있다면 다음과 같은 '모평균의 신뢰구간 추정 식'에 의해서
    신뢰구간을 계산할 수 있다.

2) 신뢰 구간 추정식
    - 전체 데이터를 수집하기 어려움으로 표본 평균을 기준으로 모평균의 얼마일것이라고 추정하는 공식
     : 표본 평균, Z: 표준화 변수, σ: 표준 편차, n: 응답자 수, μ: 모평균, α: 유의 수준
     
   - α: 유의 수준, 0.5이면 5%를 비정상적인 결과로 해석
   - 1-α: α가 0.5일경우 0.95로 95%를 정상적인 구간으로 인정

3) 표준화 변수 Z 값
   ```
      비정상%          정상%        기준값
    유의 수준(α)   신뢰 수준(%)    Z값 
    --------------   --------------   -----
     0.10             90 %             1.64
     0.05             95 %             1.96
     0.01             99 %             2.58
   ```
4) Z값 적용
만약 신뢰 수준이 95%인 경우 Z값을 신뢰구간 추정 식에 적용하면 다음과 같다.
P( -1.96 * ( σ / sqrt(n)) <= μ <=  + 1.96*( σ / sqrt(n))) = 확률 0.95에 포함됨.

5) Z가 1.96일경우 모평균 μ가 존재 할 것이라는 신뢰구간 표현: [상한값, 하한값]
[  -Z*( σ / sqrt(n),  + Z*( σ / sqrt(n)]


예) 표본 평균을 이용하여 모평균의 구간을 추정하시오.
     - 표본 평균 통계량은 (평균): 45.11을 가지고 모평균을 추정 할 것.
    설문조사에서 전체 응답자(관측치) 수(N): 290, 통계량은 (평균): 45.11,  σ(표준편차): 13.752,
    α(유의 수준, 신뢰 수준: 95%): 0.05, Z(표준화 변수) 95%: 1.96이된다.

- 계산된 통계량을 신뢰구간 추정 식에 적용하면 다음과 같다.
  P(45.11 - 1.96*(13.752/sqrt(290)) <= μ <= 45.11 + 1.96*(13.752/sqrt(290) = 확률 0.95 95%에 포함됨

- 신뢰구간 추정 식을 토대로 신뢰구간을 나타내면 다음과 같다.
  [45.11 - 1.96(13.752/sqrt(290)), 45.11 + 1.96(13.752/sqrt(290) = [43.528, 46.692]

- 평균 45.11은 95% 신뢰 수준에서 신뢰구간 하한값: 43.528, 상한값: 46.692로 계산된다.
   . 구해진 모평균(μ)은 43.528 ~ 46.692의 구간에 들어갈 수 있다고 예측된다.
 
7. 표준 오차(Standard Error)
   - 표본은 전체 데이터가 아님으로 오차가 있을 수 밖에 없음.
   - 표본오차는 표본에서 계산된 추측값과 모집단의 실제값과의 차이를 의미한다.
   - 모집단 표본 1 -> 표본 평균 1
   - 모집단 표본 2 -> 표본 평균 2
   - 모집단 표본 3 -> 표본 평균 3
   - 표본 평균 1, 표본 평균 2, 표본 평균 3 -> 표본 평균의 평균(모평균이라고 가정)
      -> 표본 평균들의 편차 -> 표본 평균들의 분산 -> 표본 평균들의 표준 편차
   - SE = s/sqrt(n): 표본 평균들의 표준 편차 / sqrt(표본 평균 수 3)


8. 표본오차(Sampling Error)
   - 모집단 대표하는 표본이 아닌 경우의 오차, 모집단을 대표 할 수 없는 데이터의 경우 표본 오차가 커진다.
   - 허용오차를 백분율로 표현한다.
   - 표본오차는 신뢰수준이 결정되면 다음과 같은 '허용오차 계산식'에 의해서 계산할 수 있다.
   - 허용오차 계산식
     Z: 표준화 변수, n: 표본수, p: 확률

     ±Z * sqrt( ( p * ( 1 - p ) ) / n)

예) 20세 이상 유권자 표본 1,500명을 대상으로 A후보 대선 출마에 대한 찬성과 반대를 조사하는 설문조사를
    시행하였다.
    설문조사 결과 95% 신뢰수준에서 찬성 55%, 반대 45%가 나왔다. 이때 표본오차는 얼마인가?
    . 신뢰 수준: 95% → Z: 1.96 
    . 표본수: n = 1,500
    . 찬성률: p = 55%(0.55)
    . 반대율: 1-p = 45%(0.45 = 1 - 0.55)

    ±1.96 * sqrt((0.55 * (0.45))/1500) = ±1.96 * sqrt(0.2475 / 1500) = 1.96 * 0.0128 = 0.025088

    백분율로 적용하면 2.5088%가되어 반올림하면 ±2.5%의 표본오차가 나온다.

* 정당 지지율등을 뉴스 검색하여 표본 오차를 해석 할 것.
  https://www.daum.net/
 
 
9. 왜도(Skewness)와 첨도
- 왜도(skewness)는 평균을 중심으로 한 확률분포의 비대칭 정도를 나타내는 지표이다.
- 분포의 기울어진 방향과 정도를 나타내는 양을 의미한다.
- 왜도의 값이 0보다 크면 분포의 오른쪽 방향으로 비대칭 꼬리가 치우치고,
  왜도의 값이 0보다 작으면 왼쪽 방향으로 비대칭 꼬리가 치우친다.
- 왜도의 값이 0에 근사하면 평균을 중심으로 좌우대칭에 가깝다.
- 왜도가 0.007로 나타나는 경우는 좌우대칭에 가깝다고 판단할 수 있다.
- 왜도와 비대칭 관계(왜도>0, 왜도 ==0, 왜도 < 0) <Br>![image](https://user-images.githubusercontent.com/84116509/161704789-a4788dd9-9e51-4751-9a26-9f183d5168d7.png)
- 비대칭 분포는 평균(Mean), 중위수(Median), 최빈수(Mode)의 위치가 다름.
- 양의 비대칭도: 평균>중위수>최빈수
- 음의 비대칭도: 평균<중위<최빈수
- 음의 비대칭도(좌측 비대칭)는 왼쪽으로 꼬리가 긴 분포이며, 값이 큰 쪽으로 몰려있는
  형태로 이때 ‘왜도く0'이다. 또한 양의 비대칭도(우측 비대칭)는 오른쪽으로 꼬리가 긴
  분포이며. 값이 작은 쪽의 몰려있는 형태로 이때 '왜도 > 0'이다
  만약 '평균(Mean)=중위수(Median)=최빈수(Maximum)' 인 경우에는 좌우대칭인 분포로 나타나며,
  이는 정규분포가 된다

- 첨도(Kurtosis)는 표준정규분포와 비교하여 얼마나 뾰족한지를 측정하는 지표이다.
- 첨도가 0(또는 3)이면 정규분포 곡선을 이루고, 첨도가 0(또는 3)보다 크면
  정규분포보다 뾰족한 형태로 나타나며,
  첨도가 0(또는 3)보다 작으면 정규분포보다 완만한 형태의 곡선을 그린다.
  만약 첨도가 -0.5인 통계량으로 나타나는 경우는 정규분포보다 낮고 완만한 곡선을 그린다.
  다음 그림은 정규분포와 첨도의 관계를 나타내고 있다.<Br>![image](https://user-images.githubusercontent.com/84116509/161704849-3cc22283-8403-4adf-8b01-f4467717a78d.png)

### 모수와 비모수 검정
- 모수(Parametric) 검정은 관측값이 어느 특정한 확률분포(정규분포, 이항분포 등)를 따른다고 전제한 후
  그 분포의 모수에 대한 검정을 실시하는 방법이다. 일반적으로 정규 분포를 따름 
- 비모수(Non-parametric) 검정은 관측값이 어느 특정한 확률분포를 따른다고 전제할 수 없는 경우에
  실시하는 검정 방법이다. 분포가 어떤지 모를 경우 사용
- 일반적으로 표본의 수가 30개 이상이면 "중심극한정리(The Central Limit Theorem)"에 의해서
  정규분포를 따른다는 전제하에 모수 검정을 적용하게 된다.
- 중심극한정리(The Central Limit Theorem)
  표본의 크기가 커질수록 근사적으로 표본의 평균이 모평균과 같고, 분산이 모분산과 같은 정규분포를
  취한다는 이론이다. (일반적으로 n >= 30인 경우)

1. 정규분포인지 확인하는 방법
- 정규성 검정 방법에는 히스토그램과 Q-Q플롯(Plots)을 이용한다.
 
- 정규성 검정에 따른 모수와 비모수 검정, 모수(정규분포)을 주요 통계 적용 분포로 사용
```
검정 방법    모수(정규분포)               비모수(비정규분포)
-----------    --------------------------   --------------------------------
t 검정         독립 표본 t 검정             윌콕슨 검정 
                 대응 표본 t 검정             맨-휘트니 검정
분산분석     일원 배치 분산분석          크루스칼-윌리스 검정
관계분석     상관분석                       비모수적 상관분석
```
  
2. 검정 통계량(표본을 대상으로 계산된 값)
- 검정 통계량(Test Statistic)은 가설을 검정하기 위해 표본으로부터 계산된 통계량을 말한다.
  예) 표본에 대한 합, min, max,  평균, 중앙값, 분산, 표준편차...

- 표본을 대상으로한 검정 통계량(값)은 분석방법에 따라서 달라지는데,
  예를 들면 상관분석은 r 값, 회귀분석은 t 값, T 검정은 t 값, 분산 분석은 F 값,
  카이제곱은 x² 값 등으로 나타난다.



### 가설과 검정
    - 가설: 표본을 가지고 전체 데이터가 어떨것이라고 예측하는 것.
    - 검정: 가설이 실제로 맞는지 확인하는 절차이며 최종 계산된 통계량(값, 평균, 분산, 표준편차등)

1. 가설(hypothesis) 설정
   - 상식이 아닐수도 있다. 일반적인 규칙이 아닐수도 있다는 가정

2. 가설의 요건: 통계 분석을 통해서 채택 또는 기각될 수 있는 가설은 아래의 몇 가지 요건을 갖추어야한다.
- 검증성: 이론적으로 검증 가능해야한다.
  예) 하천의 유속 감소는 녹조를 증가 시킬 수 있다.
- 한정성: 한정적, 특징적이어야한다.       
  예) 4대강의 보는 유속을 느리게한다.
- 측정화: 변수 관계를 경험적 사실에 근거하여 측정 가능해야 한다.
  예) 수질 검사를 통하여 녹조 수치를 측정 할 수 있다.
- 계량화: 계량적 형태를 취하거나 계량화(수치화, 조작화)할 수 있어야한다.   
  예) 남조류 세포수가 500 이상이면 조류 주의보, 5,000 이상이면 조류 경보,
       1,000,000 이상이면 조류대발생으로 기준을 정한다.
- 명백성: 가설의 표현은 간단, 명료해야한다.   
  예) 4대강의 보는 녹조 발생에 많은 영향을 준다.
- 입증성: 명백하게 입증할 수 있어야 한다.       
  예) 4대강 공사 이전의 유속과 이후의 유속을 비교하고 녹조 수치를 비교한다.
- 연관성: 동일 연구 분야, 다른 가설이나 이론과 연관이 있어야한다.
  예) 유속이 느리면 물속의 불순물로인해 클로로필-a 농도가 상승하고 남조류의 수가 증가한다.
- 그 분야의 지식 즉 도메인 지식이 있어야 가설 설정이 수월하다.


3. 가설의 유형
1) 귀무가설(영가설, 상식): '두 변수간에 관계가 없다.' 또는 '차이가 없다.'는 H0로 표현함.
    - 누구나 알고 있는 상식, 기존에 누구나 그렇다고 알고 있었던 내용
    - 연령대별로 좋아하는 메뉴는 차이가 없다.
    - 신약 A는 복용해도 효과가 없다.
    - 귀무 가설의 대상은 상식이다.

2) 대립가설(연구가설): '두 변수간에 관계가 있다.' 또는 '차이가 있다.', '효과가 있다.'라는 진술로 H1으로 표현.
   - 귀무 가설에 반대되는 가설임.
   - 누구나 알고 있는 상식이 틀리다.
   - 연령대별로 좋아하는 메뉴는 차이가 있다.
   - 신약 A를 복용하면 효과가 있다.
   - 대립 가설의 대상은 상식을 부정하는 것이다.
   - 대립가설(연구가설)을 만들 수 있는 역량은 창의적인 생각이 많이 영향을 줌(인문학/소설)
   예) 귀무가설: 신분을 증명하려면 주민등록증이 필요하다.
        대립가설: 신분을 증명하려면 주민등록증이 필요하지 않다. -> 증명하기위한 IT 관련 기술 개발 -> 경제적 이익
   예) 귀무가설: 통장을 만들려면 은행을 가야한다.
        대립가설: 통장을 만들려고 은행을 갈 필요가 없다. -> 인터넷 뱅크(K 뱅크, 카카오뱅크) -> 핀테그 점유 -> 경제적 이익

    - 추론 통계에서는 대립가설을 제시하고, 이 가설이 채택 또는 기각되는지는 귀무가설을 통해서 검정한다.
      . 일반적인 결과를 벗어난 데이터의 발견(표본의 평균이 기준 영역을 벗어난 경우) 
    - 귀무 가설은 대립가설에비해서 입증이 수월함으로 귀무 가설이 틀렸음을 증명하여 대립가설을 채택한다.
    - 귀무 가설: 8월의 지역별 평균 기온은 25도이다.
      표본을 수집하여 평균기온이 25도가 아닌경우를 찾는 다면 대립가설을 채택하게된다.
      표본이 95% 신뢰구간에 들어가면 귀무가설이 인정되고 이 것은 평균 근처에 있다는 뜻이고,
      5% 영역은 평균에서 멀리 있는 곳임으로 특이한 데이터이고 빈도가 낮아 대립 가설을 채택함.

4. 가설의 검정의예(추론은 표본에 대한 평균값을 가지고 가설 검정을 함 ★★★★★)
                         ---------------------------------------------------------
1) 백신 사례
   - 전국에서 백신을 투약받은 국민을 무작위로 100명씩 표본을 선별하여 평균을 산출하는 과정을 
     100번(총 10,000 명 참여)을 진행하는 경우(평균 ★).
     . 1회 100명의 평균: 0 개
     . 2회 100명의 평균: 5 개 
     . 3회 100명의 평균: 4 개
     . 4회 100명의 평균: 0 개   
     . 5회 100명의 평균: 300 개 <-- 5번째 그룹은 5%영역안에 들어가서 예외적임으로 대립 가설 채택
     . 6회 100명의 평균: 8 개
     . 7회 100명의 평균: 0 개
     .....
     . 100회 평균: 5로 가정

     100회 테스트중 5회 300개는 평균 5개에서 너무 멀리 떨어져 있어 기준값(표준 편차 1.96: 95%)을 벗어남으로
                                           ---------------------------------------
     5번째 평가된 신약(백신)은 잔류 바이러스가 300개임으로 효과가 없을수도 있다라고 대립 가설 설정 가능. 
     5번째 그룹은 효과에 일반적이지 않은 특이한 증상을 나타냈음으로 이 그룹에 대한 추가 조사가 필요함.
 
2_ 투표의 사례
   - 전국에서 투표날 출구 조사에 응한 국민이 특정 후보에 투표한 표본을 100명씩 선별하여 평균을 산출하는 과정을 
     100번(총 10,000 명 참여)을 진행하는 경우(평균 ★).
     . 1회 100명의 평균: 0 개
     . 2회 100명의 평균: 5 개 
     . 3회 100명의 평균: 4 개
     . 4회 100명의 평균: 0 개   
     . 5회 100명의 평균: 90 개 <-- 5번째 그룹은 평균에서 멀리 떨어진 5%영역안에 존재함으로 대립 가설 채택
     . 6회 100명의 평균: 8 개
     . 7회 100명의 평균: 0 개
     .....
     . 100회 평균: 5로 가정

     100회 테스트중 5회 90개는 평균 5개에서 너무 멀리 떨어져 있어 기준값(표준 편차 1.96: 95%)을 벗어남으로
                                          ---------------------------------------
     5번째 수집된 투표수는 90개임으로 이 후보를 적극적으로 지지한다는 의심을 가지고 대립 가설 설정 가능. 
     5번째 그룹은 투표수가 높아 일반적이지 않은 많은 득표를 했음으로 이 그룹에 대한 추가 조사가 필요함.




### 신뢰구간(Confidence Interval, 신뢰 한계), 기각역(Critical region)과 채택역(Acceptance region)
1. 일반적인 모집단에서의 대표값의 점추정, 거의 맞출 확률 없음<br>![image](https://user-images.githubusercontent.com/84116509/161705322-4ad460d5-aac1-4681-a636-2eb7e0bb5156.png)
2. 점추정이 어려움으로 구간 추정으로 대표값을 선정함.
   - 모집단의 대푯값(평균)이 있을 것으로 추정되는 구간
   - 일반적으로 95% 신뢰 구간을 많이 사용함(표본 평균이 95% 영역, 평균 기준 표준 편차 1.96안에 들어와야 함)<Br>![image](https://user-images.githubusercontent.com/84116509/161705372-6777dc68-a96f-437e-9641-0a1d829a973a.png)

3. 귀무 가설이 틀릴 확률을 p-value로 결정하며 정규 분포포를 기준으로 95% 신뢰 수준에 0.05를 주로 사용함.
   - 데이터(벡터를 구성하는 하나의 값, Scaler, 숫자 하나) -> Z -> p-value
   - Z는 데이터가 표준화된 값이며 Z값이 표준정규분포표를 참고하여 확률값으로 변경된 것을 유의확률(p-value)라고함.
   - 유의수준 a는 발생된 p-value 값이 어떤 규칙(귀무가설)을 만족하는지 아니면 틀린지 판정하는 기준, 일반적으로 0.05(5%)
   - p-value를 산정하는 기준으로 통계 알고리즘마다 다르며 일반적으로 Python package를 이용하여 산정함.
   - p-value는 평균에 가까울 수록 큰 값이 됨.
   - p-value는 평균에서 멀어질 수록 작은 값이 됨.
   - p-value 값은 확률로 대응됨, p-value가 0.031이면 3.1%의 위치 -> 95%를 벗어난 영역으로 일반적이지 않은 값.
   - α 값(임계값, 경계값)이 0.05(귀무 가설: 95% 영역(표준편차 1.96), 대립 가설: 5 % 영역(표준편차 1.96 이상))
     . p-value가 α 값 0.05보다 크면 95% 영역안에 들어옴으로 귀무가설을 채택함.
     . p-value는 평균에 가까울 수록 큰 값이 됨으로 표준편차가 1.96이하이면 귀무 가설 채택.
     . p-value가 α 값 0.05보다 작으면 95% 영역을 벗어난 특이한 영역안에 들어옴으로 대립가설을 채택함.
     . p-value는 평균에서 멀어질 수록 작은 값이 됨으로 표준편차가 1.96이상이면 귀무 가설을 기각하고 대립 가설 채택.
     . z*: z 검정, t-검정의 t-value등 표본을 대상으로 한 검정 통계량의 값<br>![image](https://user-images.githubusercontent.com/84116509/161705415-50d52c14-9fe2-48d1-bb76-898c4ab6c71e.png)
   - 귀무 가설, 대립 가설(연구 가설)의 사례(일반적으로 95% 사용)
     . 일반적으로 p-value는 통계 알고리즘을 기반으로 Python package에서 산출하고,
      분석가는 그 결과를 해석 할 수 있어야함. <Br>![image](https://user-images.githubusercontent.com/84116509/161705521-6cee3a24-7456-4ae2-ad09-d00e7f3596c7.png)

4. 유의수준(α, 의미 있는 수준, 의미 있는 차이) 결정
   - 유의 수준은 0.05, 정규분포에서 평균에서 멀리 떨어진 5% 영역을 나타냄.
   - 대립가설의 채택 또는 기각은 유의 수준(의미 있는 수준, 의미 있는 차이) 0.05 미만일 경우
     p-value < 0.05 이면 대립 가설 채택
   - p-value > 0.05 이면 귀무 가설 채택
  - 유의 확률 p-value(P:probability, 확률)는 귀무가설 참이 아닐 확률, 0.05이면 5%는 귀무가설이 참이 아닐 확률
  - 유의확률이 유의수준보다 작으면(p-value < 0.05) 해당 귀무가설을 기각(타파)할 수 있으며,
    주장하고자 하는 대립가설을 채택할 수 있다. 
  - 연구자는 이러한 유의수준(의미가 있는 값)의 임계값(기준값)을 정해야하며 
    사회과학 분야에서는 a = 0.05 또는 p-value < 0.05를 기준으로 한다.
  - α=0.05라는 의미는 통계치가 모수치(모평균등)를 대표하는 정도에 있어서 오차가 5%이며,
    표본통계치의 신뢰도가 95%라는 것을 의미한다.
    즉 100번가운데 5번 이하로 나올 수 있는 확률을 말한다.
  - 일반적으로 유의수준은 0.1, 0.05, 0.01등의 값을 적용하며 특히 의,생명을 다루는 분야는 오차범위를 최소화하기위해 
     a=0.01 또는 p<0.01을 기준으로 99% 신뢰도를 확보하고 1% 오차만 인정하는 임계치를 정하기도한다.
  - 결론적으로 귀무 가설은 허용한 임계값(0.01, 0.05, 0.1등)보다 작으면 대립 가설을 채택하게된다.
 
예) 귀무 가설(Ho): 신약A는 A암 치료에 효과가 없다. 임계값을 0.05 수준으로 정한 경우 가설을 검정한
     확률 수준 p값이 0.04가 나왔다면 p값(0.04)이 a(알파, 0.05)보다 작기 때문에 귀무가설은(영가설)은 기각한다.
     즉 일반적으로 발생하는 상황이 아니기때문에 귀무 가설을 기각한다.
     따라서 신약 A는 A암 치료에 효과가 있을 확률이 높기때문에 '신약 A는 A암 치료에 효과가 있다.'를 채택한다.
     p <= 0.05보다 작다면 보기 드문 현상으로 귀무가설을 기각한다.
 

예) 대립가설(H1)은 '연령에 따라 에어콘 제품만족도에 차이가 있다' 를 검정하기 위해서 독립표본
     T 검정을 수행하였다. 이때 유의수준은 a=0.05로 결정 하였다.
     검정 결과 검정 통계량 t 값이 10.652, 유의확률 p 값이 0.012가 나왔다고 가정한다면
     유의확률 p=0.012로 나타났기 때문에 유의수준 a=0.05 기준에서
     귀무가설('연령에 따라 에어콘 제품만족도에 차이가 있다')이 기각된다. (p < a)에 따라서
     연령에 따라 제품만족도에 유의미한 차이가 없다고 할 수 있다.
 

5. 기각역(Critical region)과 채택역(Acceptance region)
   - 귀무가설(상식)이 타당하면 귀무가설을 채택하고, 대립가설(의문 제기)이 타당하면, 귀무가설을 기각한다.
   - 귀무가설을 채택하거나 기각하는 기준을 임계값(경계값)이라고 한다.
     . 전체 표본의 표준화된 z 값이 5%에 포함되면 귀무가설을 기각함.
   - 임계값을 기준으로 채택되는 범위를 채택역이라고 하며, 기각되는 범위를 기각역이라고한다.
   - 표본을 대상으로한 z값이(검정 통계량)의 값이 기각역에 속하면 귀무가설을 기각하게된다.

   - 표본이 원본 데이터의 95% 영역에 들어오면 원본과 차이가 없는것으로 인정하여 귀무 가설을 채택한다.
     하지만 표본 통계량(평균등)이 모집단영역의 95%를 넘어가는 표준 정규 분포표의 Z값 ±1.96이상이면
     의미가 있는것으로보고 귀무 가설을 기각하고 대립 가설을 채택한다.
     예) 종각역에 도착하는 300대의 전철중 30대를 조사하였더니 평균 도착 시간이 지연된경우 Z = 2.3이라면
          귀무 가설을 기각하고 대립 가설을 채택한다.
      Z = 1회 표본 평균 - (전체 표본의 평균) / 평균들의 표준편차
     표준편차는 단위가 달라서 여러분야에 규칙을 적용하기 어려움으로 표준화한 값(z)을 이용하여 판단 <br>![image](https://user-images.githubusercontent.com/84116509/161705568-66df7c04-29c7-4dda-840f-d60460153710.png)

6. 양측검정과 단측검정
  - 표본(검정 통계량)의 분포에서 유의수준 a(알파, p-value)에 의하여 기각역의 크기가 결정되는데
    기각역의 위치는 대립가설(H1)의 형태에 의하여 결정된다.
    즉 대립가설의 형태에 따라서 양측검정과 단측검정으로 나누어진다.

1) 양측검정은 귀무가설(H0) '경차는 20대에 만족도에 차이가 없다.'와 같은 형식으로
   방향성(어느 한쪽이 많고 적음이 없음)이 없는 경우 적용하는 검정 방법이다
   따라서 대립가설(H1)은 "경차는 20대에 만족도에 차이가 있다'는 가설로
   방향성(경차는 20대에 만족도가 더 크다. 경차는 20대에 만족도가 더 작다)을 갖는 형식으로
   대립가설을 진술할 수 있다.

   H0: 경차는 20대에 만족도에 차이기 없다.
   H1: 경차는 20대에 만족도에 차이가 있다.

2) 단측 검정은 어느 한쪽이 많거나 적은 가설인 경우 해당
    H0: 2002년부터 월드컵 4강에 들어간 아시아 국가는 1곳이다. (모수 μ(모평균) =1)
    H1: 2002년부터 월드컵 4강에 들어간 아시아 국가는 1곳 미만이다. (모수(모평균) μ < 1)
         2002년부터 월드컵 4강에 들어간 아시아 국가는 1곳 초과이다. (모수 μ(모평균) > 1)
   또는
    H0: 1일 생산되는 불량품의 개수는 평균 30개이다. (모수 μ(모평균) = 30)
    H1: 1일 생산되는 불량품의 개수는 평균 30개 이하이다. (모수(모평균) μ < 30)
         1일 생산되는 불량품의 개수는 평균 30개 이상이다.(모수 μ(모평균) > 30)<br>![image](https://user-images.githubusercontent.com/84116509/161705613-647a9298-48dd-4e79-a2d5-b8a25c83e56e.png)

7. 가설 검정 오류<br>![image](https://user-images.githubusercontent.com/84116509/161705652-8933a78a-d3ea-4bea-8eea-5143c5e508cb.png)
   - 가설을 검정하기 위해서는 귀무가설(H0)과 대립가설(H1)을 설정하여 통계 분석을 통해서
     둘 중 하나를 채택하게 된다. 이러한 검정과정에서 발생할 수 있는 오류(Error)는
     제1종 오류와 제2종 오류가 있다.
   - 표본의 결과가 95%안에 들어가면 상식이 인정되는 것으로 판단(귀무 가설 인정),
     하지만 평균에서 멀리 떨어진(표준 편차가 큰) 5%안에 들어가면 상식이 아닐수도 있다고 판단함.
   - 제 1 종 오류의 학률 α: 귀무 가설 기준으로 귀무 가설이 틀릴 확률이, 상식 무시
     . 유속을 감소시키면 녹조는 증가된다(상식).
     . 4대강의 보는 유속을 감소시키지만 녹조를 증가 시키지는 않는다(상식 무시).
   - 제 2 종 오류의 학률 β: 대립 가설(H1) 기준으로 대립 가설이 틀릴 확률, 상식이 틀리지만 상식을 선택하는 경우
     . 육식을 많이하면 비만해진다. -> 저탄고지: 탄수화물(밥)이 비만에 더 많은 영향을 준다.
     . 잘못된 상식을 찾는 것이 어려움.
   - 일반적으로 가설 검정시 2종 오류는 검증이 어려워 1종 오류를 대상으로 검사를 실시함.
     . 유속 감소시 녹조도 감소되는지 검증.

### 통계 분석 수행
- 변수의 척도(데이터의 형태)에 따라 대부분의 통계 분석방법이 결정되기 때문에 변수의 척도 선정이 무엇보다 중요하다.

1) 통계 분석 방법과 변수 척도 관계
① 빈도 분석: 가장 기초적이고, 간단한 분석방법으로 변수의 분포를 제공하며
    인구 통계적 특성(나이, 성별, 소득등 개인적 특성)을 제시하는데 용이하다. (모든 척도)
② 교차 분석: 변수 간의 분포와 백분율을 나타내주는 교차표를 작성하고,
    두 변수 간의 독립성과 관련성, 상관 관계(카이제곱검정)을 분석한다. (명목척도, 서열척도)
③ 요인 분석: 측정하려는 변수들의 상관관계가 높은 것끼리 묶어서 변수를 단순화하는데 이용한다.
    (타당성 검증)
    잘못 적재된 변수나 설명력이 부족한 변수를 제거한다. (등간척도, 비율척도)
④ 신뢰도 분석: 요인분석으로 추출된 요인들이 동질적인 변수들로 구성되어 있는가를 파악하는 분석 방법
    (등간척도, 비율척도)
⑤ 상관관계 분석: 설정한 가설을 검정하기전에 모든 연구가설에 사용되는 측정변수 간의 관계 정도를 제시하여
    변수 간의 관련성에 대한 윤곽을 제시한다. (피어슨 - 등간척도, 비율척도, 스피어만 - 서열척도)
⑥ 회귀분석: 독립변수가 종속변수에 어떠한 영향을 미치는지 파악하기위해 실시하는 분석방법이다.
    (두 변수 인과관계 분석) (등간척도, 비율척도)
⑦ t-검정: 종속변수에 대한 독립 변수의 집단 간 평균의 차이를 검정한다.
    독립표본 t-test와 대응표본 t-test 분류,
    표본이 30개 미만인경우 주로 사용
    (독립변수: 명목척도, 종속변수: 등간척도 또는 비율척도)
⑧ 분산분석: 데이터의 산포도를 확인하는 분산 분석, F 검정 
    (독립변수: 명목척도, 종속변수: 등간척도 또는 비율척도)
   
### Z 값, 통계량, 신뢰구간 산출 실습
1. 표준화 변수 Z(p-value)의 산출


2. 임계치
- 임계치는 주어진 유의수준에서 귀무가설의 채택 또는 기각을 결정하는 데 기준이 되는 값<br>![image](https://user-images.githubusercontent.com/84116509/161705797-a25079f7-a29e-4ba2-845d-d0525640ec0b.png)
3. 양측 검정<br>![image](https://user-images.githubusercontent.com/84116509/161705825-d7a07991-ae97-4019-9dfa-f75644e462a1.png)
1) 양측 검정(2 집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균과 B 집단의 평균은 다르다. A ≠ B
2) 양측 검정(모집단:표본 집단)
   - H0: 모집단 모평균은 표본집단 표본평균과 같다. μ = Xbar
   - H1: 모집단 모평균은 표본집단 표본평균과 다르다. μ ≠ Xbar

4. 좌측 검정(단측 검정)<br>![image](https://user-images.githubusercontent.com/84116509/161705887-702cc657-674e-45e2-b42d-5b6cf9cf44b5.png)
1) 단측 검정 - 좌측검정(2 모집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균은 B 집단의 평균보다 작다. A < B
2) 단측 검정 - 좌측검정(모집단:표본 집단)
   - H0: 모집단 모평균은 표본집단 표본평균과 같다. Xbar = μ
   - H1: 표본집단의 표본평균은 모집단 모평균보다 작다. Xbar < μ
5. 우측 검정(단측 검정)<br>![image](https://user-images.githubusercontent.com/84116509/161705948-ba9f7ce2-1402-46c0-a6fd-301eb069fe57.png)
1) 단측 검정 - 우측검정(2 모집단)
   - H0: A 집단의 평균과 B 집단의 평균은 같다. A = B
   - H1: A 집단의 평균은 B 집단의 평균보다 작다. A < B
2) 단측 검정 - 좌측검정(모집단:표본 집단)
   - H0: 모집단의 모평균은 표본집단의 표본평균과 같다. μ = Xbar
   - H1: 표본집단의 표본평균은 모집단의 모평균보다 크다. μ < Xbar
6. 표본 집단을 대상으로한 통계량 산출
1) 모분산을 아는 경우
<br>![image](https://user-images.githubusercontent.com/84116509/161706005-b4a62fcd-8720-40bc-af52-7be7ebd6823f.png)
2) 모분산을 모르는 경우
<br>![image](https://user-images.githubusercontent.com/84116509/161706024-9dc9d718-9708-4622-8a19-5314e0cccecb.png)


   
# 파이썬 한 줄 주석
'''
여러 줄 주석
'''

# 사용자에게 이름과 나이를 입력받아 출력하는 프로그램

# >> 결과화면 <<
# 이름 입력: 홍길동
# 나이 입력: 22
#
# 홍길동님 반갑습니다. "22세"이군요~~!
'''
name = input('이름 입력: ')
age = int(input('나이 입력: '))

print('\n%s님 반갑습니다. \"%d세\"이군요~~!' % (name, age))
'''

# 조건문(if문)
'''
n = int(input('정수 입력: '))

if n > 0 : # if 조건식 : 조건식이 참이면 실행
    print('양수입니다.')
elif n == 0 :
    print('0입니다.')
else : # 이도저도 아닐 때
    print('음수입니다.')
'''

# 입장료 계산 프로그램
# 1~15세: 2000원
# 16~25세: 3000원
# 26~40세: 4000원
# 41세~: 10000원
# 0세 이하인 경우는 "나이 오류입니다."라고 출력!

# ~11:10
# >> 결과화면 <<
# 나이 입력: 23
# 당신의 나이는 23세이고,
# 입장료는 3000원 입니다.
'''
age = int(input('나이 입력: '))

if age > 0: # 나이가 1세 이상이면 참!
    print('당신의 나이는 %d세이고,' % age)
    
    if age >= 1 and age <= 15 : # 1~15세 사이이면 참
        print('입장료는 2000원 입니다.')
    elif age >= 16 and age <= 25 : # 16~25세 사이이면 참
        print('입장료는 3000원 입니다.')
    elif age >= 26 and age <= 40 : # 26~40세 사이이면 참
        print('입장료는 4000원 입니다.')
    elif age >= 41 : # 41세 이상이면 참
        print('입장료는 10000원 입니다.')
 
else : # 나이가 0세 이하이면 else문 실행
    print('나이 오류입니다.')   
'''

# 사용자에게 정수(양수)를 입력받아 홀수/짝수 구하는 프로그램

# >> 결과화면 <<
# 정수(양수) 입력: 5
# 5는 홀수입니다.
'''
n = int(input('정수(양수) 입력: '))

if n % 2 == 1 : # n이 2의 배수가 아닌 경우(홀수)
    print('%d는 홀수입니다.' % n)
else :
    print('%d는 짝수입니다.' % n)
'''

# 성적관리 프로그램
# 90~100: A등급
# 80~89: B등급
# 70~79: C등급
# 60~69: D등급
# 0~59: F등급

# 사용자에게 점수(0~100) 입력하여 등급 출력하는 프로그램


# >> 결과화면 <<
# 점수(0~100) 입력: 88
# 88점은 B등급입니다.
'''
score = int(input('점수(0~100) 입력: '))

if score >= 90 and score <= 100 : # 90~100
    print('%d점은 A등급입니다.' % score)
    # print(score,'점은 A등급입니다.', sep='') 도 가능!
elif score >= 80 and score <= 89 : # 80~89
    print('%d점은 B등급입니다.' % score)
elif score >= 70 and score <= 79 : # 70~79
    print('%d점은 C등급입니다.' % score)
elif score >= 60 and score <= 69 : # 60~69
    print('%d점은 D등급입니다.' % score)
elif score >= 0 and score <= 59 : # 0~59
    print('%d점은 F등급입니다.' % score)
else :
    print('0~100 사이만 입력 가능합니다.')
'''

'''
score = int(input('점수(0~100) 입력: '))

if score < 0 or score > 100 : # 0보다 작거나 또는 100보다 크면 참
    print('0~100 사이만 입력 가능합니다.')
    
else : # 0~100 사이면 실행!!
    if score >= 90 : # 90~100
        print('%d점은 A등급입니다.' % score)
        # print(score,'점은 A등급입니다.', sep='') 도 가능!
    elif score >= 80 : # 80~89
        print('%d점은 B등급입니다.' % score)
    elif score >= 70 : # 70~79
        print('%d점은 C등급입니다.' % score)
    elif score >= 60 : # 60~69
        print('%d점은 D등급입니다.' % score)
    else : # 0~59
        print('%d점은 F등급입니다.' % score)
'''


# 1~100 사이의 정수를 입력받아, 5의배수이거나 7의배수인지 구분하는 프로그램
# 1~100 사이가 아니면 "1~100사이만 입력 가능합니다"라고 출력

# >> 결과화면1 <<
# 1~100 사이 정수 입력: 14
# 14는(은) 5의배수이거나 7의배수 입니다.

# >> 결과화면2 <<
# 1~100 사이 정수 입력: 3
# 3는(은) 5의배수이거나 7의배수가 아닙니다.

'''
n = int(input('1~100 사이 정수 입력: '))

if n >= 1 and n <= 100 : # 1~100 사이면 참!
    
    if n % 5 == 0 or n % 7 == 0 :
        print('%d는(은) 5의배수이거나 7의배수 입니다.' % n)
    else :
        print('%d는(은) 5의배수이거나 7의배수 아닙니다.' % n)
        
else : # 1~100 사이가 아니면 실행
    print('1~100 사이만 입력 가능합니다.')
'''

# 사칙연산 프로그램
# >> 결과화면 <<
# 정수1 입력: 5
# 정수2 입력: 7
#
# ==== 메뉴 ====
# 1. 덧셈
# 2. 뺄셈
# 3. 나눗셈(몫x)
# 4. 나머지
# 5. 종료
# ==============
# 메뉴 입력: 1
# 5 + 7 = 12
'''
n1 = int(input('정수1 입력: '))
n2 = int(input('정수2 입력: '))

print('\n==== 메뉴 ====')
print('1. 덧셈')
print('2. 뺄셈')
print('3. 나눗셈(몫x)')
print('4. 나머지')
print('5. 종료')
print('==============')
n = int(input('메뉴 입력: '))

if n == 1 : # n이 1이면 참!
    # print('%d + %d = %d' % (n1, n2, n1+n2)) # 아래 코드와 같음
    print(n1, '+', n2, '=', n1+n2) # 위 코드와 같음
elif n == 2 : # n이 2이면 참!
    print(n1, '-', n2, '=', n1-n2)
elif n == 3 : # n이 3이면 참!
    print('%d / %d = %.2f' % (n1, n2, n1/n2))
elif n == 4 : # n이 4이면 참!
    print(n1, '%', n2, '=', n1%n2)
elif n == 5 : # n이 4이면 참!
    print('종료합니다.')
else :
    print('1~5사이만 입력 가능합니다.')
'''
'''
import random

r = random.random() # 0.0 <= r < 1.0
r2 = random.randint(1,10) # 1 <= r <= 10, 1~10사이의 랜덤(난수)값
r3 = random.choice('abcdefg') # '문자열'안에서 1개 추출

print('r =', r)
print('r2 =', r2)
print('r3 =', r3)
'''

# 오늘의 운세
# 1~10까지 운세이고, 10이면 아주 좋음!!

# >> 결과화면 <<
# 오늘의 운세는 1(나쁨)~10(좋음) 중에 xx 입니다.

'''
import random

r = random.randint(1,10)

print('내일의 운세는 1(나쁨)~10(좋음) 중에', r, '입니다.')
'''

# 덧셈 프로그램
# 컴퓨터가 랜덤으로 3자리 숫자 2개를 발생시켜 더한 값을 사용자가 맞추는 프로그램
# 2자리 숫자: 100~999

# >> 결과화면1 <<
# 312 + 273 = 585
# 정답입니다.

# >> 결과화면2 <<
# 310 + 270 = 220
# 틀렸습니다.

'''
import random

r1 = random.randint(100,999) # 100~999 사이의 랜덤값 발생하여 r1에 대입!
r2 = random.randint(100,999) # 100~999 사이의 랜덤값 발생하여 r2에 대입!

print(r1, '+', r2, '= ', end='') # 마지막 줄바꿈 안씀!

result = int(input()) # 바로 입력 받음(문구 없이)

if result == r1 + r2 :
    print('정답입니다')
else :
    print('틀렸습니다')
'''

# 주사위(1~6) 3개를 던져서 같은 숫자가 나오면 "더블입니다" 출력!
# 다른 숫자가 나오면 "다릅니다" 출력!

# >> 결과화면1 <<
# 주사위 3개를 던집니다.
# (1,5,2) 주사위 눈의 숫자가 서로 다릅니다.

# >> 결과화면2 <<
# 주사위 3개를 던집니다.
# (2,2,2) 주사위 눈의 숫자가 더블입니다.
'''
import random

print('주사위 3개를 던집니다.')

r1 = random.randint(1,6)
r2 = random.randint(1,6)
r3 = random.randint(1,6)

# if문 사용하여 구현~~

if r1 == r2 and r2 == r3 : # r1,r2,r3 모두 같으면 참
    print('(%d,%d,%d) 주사위 눈의 숫자가 더블입니다.' % (r1,r2,r3))
else :
    print('(%d,%d,%d) 주사위 눈의 숫자가 서로 다릅니다.' % (r1,r2,r3))
'''

# 2개의 정수를 입력받아, 최대값과 최소값을 구하는 프로그램

# >> 결과화면 <<
# 정수1 입력: 5
# 정수2 입력: 5
#
# 최대값은 7이고, 최소값을 5입니다.
'''
n1 = int(input('정수1 입력: '))
n2 = int(input('정수2 입력: '))

print() # 줄바꿈

if n1 >= n2 : # n1이 크면 참!
    max = n1
    min = n2
else :
    max = n2
    min = n1

print('최대값은 %d이고, 최소값을 %d입니다.' % (max,min))
'''


# ~ 3:13
# 3개의 정수를 입력받아, 최대값과 최소값을 구하는 프로그램

# >> 결과화면 <<
# 정수1 입력: 15
# 정수2 입력: 5
# 정수3 입력: 12
#
# 최대값은 15이고, 최소값을 5입니다.
'''
n1 = int(input('정수1 입력: '))
n2 = int(input('정수2 입력: '))
n3 = int(input('정수3 입력: '))

print() # 줄바꿈

# max 부분
if n1 >= n2 and n1 >= n3 : # n1이 크면 참!
    max = n1
elif n2 >= n1 and n2 >= n3 : # n2가 크면 참!
    max = n2
else :
    max = n3

# min 부분
if n1 <= n2 and n1 <= n3 : # n1이 작으면 참!
    min = n1
elif n2 <= n1 and n2 <= n3 : # n2가 작으면 참!
    min = n2
else :
    min = n3

print('최대값은 %d이고, 최소값을 %d입니다.' % (max,min))
'''

# BMI프로그램 (if문 사용)
# 저체중: 18.5 미만
# 정상: 18.5 ~ 23 미만
# 과체중: 23.0 ~ 25 미만
# 비만: 25 이상~~

# >> 결과화면 <<
# 키(cm) 입력: 171.5
# 몸무게(kg) 입력: 55.5
#
# 당신의 bmi는 xx.x(정상) 입니다.
'''
cm = float(input('키(cm) 입력: '))
kg = float(input('몸무게(kg) 입력: '))

bmi = kg / ((cm/100)**2)
# bmi = kg / ((cm/100)*(cm/100)) 위와 같음

if bmi < 18.5 :
    result = '저체중'
elif bmi >= 18.5 and bmi < 23 :
    result = '정상'
elif bmi >= 23 and bmi < 25 :
    result = '과체중'
elif bmi >= 25 :
    result = '비만'

print('\n당신의 bmi는 %.1f(%s) 입니다.' % (bmi,result))
'''

# 요고는 참고쓰~~ >.<
'''
n = int(input('정수 입력: '))

print()
print('%d의 제곱은 %d입니다.' % (n, n*n))
print('%d의 세제곱은 %d입니다.' % (n, n*n*n))
print('======================')
print('%d의 제곱은 %d입니다.' % (n, n**2))
print('%d의 세제곱은 %d입니다.' % (n, n**3))
'''

# 자판기 프로그램

# >> 결과화면 <<
# 돈 입력: 700
# 
# ========== 메뉴 ==========
# 1. 아메리카노(1000원)
# 2. 카페라떼(1500원)
# 3. 카푸치노(2000원)
# 4. 카라멜마끼아또(2500원)
# 5. 종료
# ==========================
# 메뉴 선택: 1
# 아메리카노를 구매하셨습니다.
# 남은 돈은 700원 입니다.
'''
money = int(input('돈 입력: '))

print('\n========== 메뉴 ==========')
print('1. 아메리카노(1000원)')
print('2. 카페라떼(1500원)')
print('3. 카푸치노(2000원)')
print('4. 카라멜마끼아또(2500원)')
print('5. 종료')
print('==========================')

n = int(input('메뉴 입력: '))

if n == 1 :
    
    if money >= 1000 :
        money -= 1000 # money = money - 1000
        print('아메리카노를 구매하셨습니다.')
        print('잔돈은 %d원입니다.' % money)
    else :
        print('돈이 부족합니다.')
        print('잔돈은 %d원입니다.' % money)
        
elif n == 2 :
    
    if money >= 1500 :
        money -= 1500 # money = money - 1500
        print('카페라떼를 구매하셨습니다.')
        print('잔돈은 %d원입니다.' % money)
    else :
        print('돈이 부족합니다.')
        print('잔돈은 %d원입니다.' % money)
        
elif n == 3 :
    
    if money >= 2000 :
        money -= 2000 # money = money - 2000
        print('카푸치노를 구매하셨습니다.')
        print('잔돈은 %d원입니다.' % money)
    else :
        print('돈이 부족합니다.')
        print('잔돈은 %d원입니다.' % money)
       
elif n == 4 :
    
    if money >= 2500 :
        money -= 2500 # money = money - 2500
        print('카라멜마끼아또를 구매하셨습니다.')
        print('잔돈은 %d원입니다.' % money)
    else :
        print('돈이 부족합니다.')
        print('잔돈은 %d원입니다.' % money)
       
elif n == 5 :
    print('종료합니다.')
    
else :
    print('1~5만 입력 가능합니다.')

'''


# 반복문(while문)
'''
n = 0

while True : # 무한루프
    n += 1 # n = n + 1
    print('n =', n)
    break # while문 밖으로 나감!
    print('메롱')
    
print('종료합니다')
'''

'''
i = 0 # 1. 초기화

while i < 10 : # 2. 조건식
    print('*')
    i = i + 1 # i를 1 증가시킴!
'''
'''
import random

i = 1 # 반복제어변수 i 1.초기화
r = random.randint(1,10) # 1~10사이의 랜덤값 

while i <= r : # 2. 조건식
    i = i + 1 # 3. 증감식
    print('★', end='')
'''

# 로또 프로그램(1~45, 6개 추출)

# >> 결과화면 <<
# 로또 프로그램입니다.
# 이번주 번호는 xx, xx, xx, xx, xx, xx 입니다.
'''
import random

i = 1

print('로또 프로그램입니다.')
print('이번주 번호는 ', end='')

while i <= 6 :
    r = random.randint(1,45)
    if i == 6 :
        print(r,' ', sep='', end='')
    else :
        print(r,', ', sep='', end='')
    i = i + 1
    
print('입니다')
'''

# 문자열 인덱싱(0부터 시작)
'''
text = 'i love java.'

print('text[-1] =', text[-1])

i = 0
while i < len(text) :
    # print('text[', i, '] = ', text[i], sep='')
    # print('text[%2d] = %c' % (i, text[i]))
    print(text[i], end='')
    i = i + 1
'''

# 문자열 슬라이싱
# text[시작값:끝값-1]

# python & java

text1 = 'i love python.'
text2 = 'i love java.'

print(text1[:]) # text 모두 출력
print(text1[2:])
print(text1[0:5]) # 0~4 index까지 문자열 추출!
print(text1[7:13]) # 7~12 index까지 문자열 추출!

print(text1[7:13],'&',text2[7:11])

# '문자열' + '문자열'은 연결!!
# '문자열' * 3 은 3번 반복!
text3 = text1[7:13] + ' & ' + text2[7:11]
print(text3)






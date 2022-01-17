# fun1 함수 정의
'''
def fun1(n) : # 함수 정의시 (괄호)안은 매개변수(입력값을 받는 변수)라고 함!
    print('fun1(n) 함수 시작합니다')
    print('입력이 없는 함수입니다')
    print('n의 값은 ', n, '입니다', sep='')

def fun2() :
    print('fun2() 함수 시작합니다')
    print('입력이 없는 함수입니다')

   
print('기본 메인 부분입니다')
fun1(123) # fun1 함수 호출, 호출시 (괄호)안에 있는 값을 인자 or 인수 라고 함!
fun2()
'''



# 사각형 넓이 구하는 프로그램
# area(): 너비와 높이를 입력받아 넓이를 구해서 돌려주는 함수

# >> 결과화면 <<
# 너비 입력: 12
# 높이 입력: 5
#
# (12,5)의 넓이는 xxx입니다.

# area() 함수 정의, 매개변수(함수 정의시 입력 변수)는 w, h
# 지역변수는 함수 내에 선언한 변수
# 전역변수는 함수 외부에 선언한 변

'''
def area(w, h) : # area()함수에는 지역변수가 w, h, result
    return w * h
    

width = int(input('너비 입력: '))
height = int(input('높이 입력: '))

print('(%d,%d)의 넓이는 %d입니다.' % (width, height, area(width, height)))
'''

# 1~n까지 사이의 누적합 구하는 프로그램

# fun1(): 누적합 구하는 함수
# fun2(): 누적곱 구하는 함수

# >> 결과화면 <<
# 정수 입력: 5
# 1~5 사이의 누적합은 xx입니다.
# 1~5 사이의 누적곱은 xxx입니다.
'''
def fun1(n) : # 누적합 함수
    total = 0 # 누적합 변수 선언(초기값은 0으로 함)
    for i in range(1,n+1) :
        total += i # total = total + i 와 같음
    return total

def fun2(n) : # 누적곱 함수
    total = 1 # 누적곱 변수 선언(초기값은 1으로 함)
    for i in range(1,n+1) :
        total *= i # total = total * i 와 같음
    return total

n = int(input('정수 입력: '))
print('1~%d 사이의 누적합은 %d입니다.' % (n, fun1(n)))
print('1~%d 사이의 누적곱은 %d입니다.' % (n, fun2(n)))
'''
'''
def calc(x,y,z) :
    print('x =', x)
    print('y =', y)
    print('z =', z)

calc(1,2,3) # 기본 함수 호출 방법
calc(x=2, y=3, z=4) # 키워드 인수
calc(2, 3, z=4) # 키워드 인수
calc(y=1, z=3, x=5) # 키워드 인수
'''

# 디폴트 인수 사용
'''
def greet(name='lee', msg='좋은 아침입니다.'):
    print('안녕! ', name , ', ',  msg, sep='')
    
name = input('이름 입력: ')
msg = '배고프다..'

greet()
greet(name)
greet(name, msg)
'''
# 함수 호출시 인자(or 인수)가 몇 개 인지 모를때 * 사용!
# *n의 경우 n은 튜플로 받아들임!
# print(type(n))
'''
def calc(*n) :
    total = 0

    for i in n :
        total += i

        if i == len(n) :
            print(i, ' = ', sep='', end='')
        else :
            print(i, ' + ', sep='', end='')

    print(total)
'''   
 
#calc()
#calc(1)
#calc(1,2)
#calc(1,2,3)
#calc(1,2,3,4)
'''

# 1~6 사이의 랜덤(주사위)값을 발생시키는 함수 - r6() 함수
# 1~45 사이의 랜덤(로또)값을 발생시키는 함수 - r45() 함수
# 주사위 2개를 던져서 나온 눈의 합을 구하는 함수 - r_sum() 함수

# >> 결과화면 <<
# ========== 메뉴 ==========
# 1. 주사위1개 던지기
# 2. 주사위2개 던진 합
# 3. 로또(1~45) 1개 구하기
# 4. 종료
# ==========================
# 메뉴 선택: 1
# 주사위 숫자 5입니다.
#
# 메뉴 선택: 2
# 2 + 5 = 7
#
# 메뉴 선택: 3
# 로또 숫자 35입니다.
'''
'''
import random

def r6() : # 1~6 사이 랜덤값 발생 함수
    return random.randint(1,6)

def r45() : # 1~45 사이 랜덤값 발생 함수
    return random.randint(1,45)

def r_sum() : # 주사위 2개를 던져서 나온 눈의 합
    r1 = r6()
    r2 = r6()
    print('%d + %d = %d\n' % (r1, r2, r1+r2))
    
print('========== 메뉴 ==========') 
print('1. 주사위1개 던지기') 
print('2. 주사위2개 던진 합') 
print('3. 로또(1~45) 1개 구하기') 
print('4. 종료')
print('==========================')
while True :
    n = int(input('메뉴 선택: '))
    if n == 1 :
        print('주사위 숫자는 %d입니다.\n' % r6())
    elif n == 2 :
        r_sum()
    elif n == 3 :
        print('로또 숫자는 %d입니다.\n' % r45())
    elif n == 4 :
        print('종료합니다')
        break
    else :
        print('1~4만 입력 가능합니다.\n')
'''



'''
def fun1() :
    global b # global 명령어 사용하여 전역변수인 b를 값 유지
    b = b + 1
    print('fun1 함수 입니다')

a = 123 # 전역변수
b = 234

fun1()

print(a)
print(b)
'''

'''
def fun1(a,b):
    return a+b

print(fun1(1,2))
'''

# 람다(lambda)
'''
aa = lambda a,b: a+b

print(aa(1,2))
'''

# 재귀함수 (자기 자신의 함수를 다시 호출함)
# 3! = 3 * 2!
# n! = n * (n-1)!
# 1! 은 1


# >> 결과화면1 <<
# 정수 입력: 5
# 5! = 120

# >> 결과화면2 <<
# 정수 입력: 5
# 5! = 5 * 4 * 3 * 2 * 1 = 120
'''
def fac(n) : # 팩토리얼 구하는 함수
    if n == 1 : # 1! 은 1
        return 1 # 탈출 부분
    else :
        return n * fac(n-1) # 반복 부분(재귀 함수)


n = int(input('정수 입력: '))


# '5 * 4 * 3 * 2 * 1 = ' 출력 부분
print('%d! = ' % n, end='')

for i in range(n, 0, -1) : # i는 n~1
    if i == 1 :
        print(i, '= ', end='')
    else :
        print(i, '* ', end='')  

print('%d' % fac(n))
'''
# 10명의 학생(리스트) 점수중 70점 넘는 학생 수를 구하는 프로그램

# >> 결과화면 <<
# 10명의 학생 점수입니다.
# [15, 100, 88, 70, 55, 49, 72, 82, 30, 10]
#
# 70점 넘는 학생은 5명 입니다.
'''
score = [15,100,88,70,55,49,72,82,30,100]
print(score)

# for문 활용! 익덱싱 활용, score[0]
cnt = 0 # 70점 넘는 학생들 count할 변수!


for i in range(len(score)) : # i는 0~9
    if score[i] >= 70 :
        cnt = cnt + 1

#for i in score :
#    if i >= 70 :
#        cnt = cnt + 1

print('\n70점 넘는 학생은 %d명 입니다.' % cnt)
'''

# 피보나치 수열 (재귀함수 사용)
# 1 1 2 3 5 8 13 21 ...
# 1항과 2항은 1이다!!


# >> 결과화면 <<
# 정수 입력: 7
# 1, 1, 2, 3, 5, 8, 13
'''
def fibo(n): # 피보나치 수열 함수
    if n == 1 or n == 2 : # n이 1 또는 2인 경우 참!
        return 1
    else :
        return fibo(n-1) + fibo(n-2) # 반복 부분(재귀)
    
n = int(input('정수 입력: '))

# print('%d항의 값은 %d입니다.' % (n, fibo(n)))

for i in range(1, n+1) : # i는 1~n까지, n회 반복
    
    if i != n :
        print(fibo(i), ', ', sep='', end='') # fibo()함수는 n번 호출됨!
    else :
        print(fibo(i), end=' ') # fibo()함수는 n번 호출됨!
'''

# 재귀함수 사용
# my_power(n): n제곱을 구하는 프로그램

# base의 exp제곱을 구하는 프로그램

# >> 결과화면 <<
# base 입력: 2
# exp 입력: 3
# 2의 3제곱은 8입니다.
'''
def my_power(base, exp) :
    if exp == 0 :
        return 1
    else :
        return base * my_power(base, exp-1)
    
base = int(input('base 입력: '))
exp = int(input('exp 입력: '))

print('%d의 %d제곱은 %d입니다' % (base, exp, my_power(base,exp))) # 재귀함수 호출!
print('%d의 %d제곱은 %d입니다' % (base, exp, pow(base,exp))) # 내장함수 호출!
'''

# 리스트 [1,2,3,4] -> 값 변경 가능, 중복 허용
'''
list1 = [1,2,3,4]
list2 = [1,2,3,4]
list3 = list1 + list2

print(type(list1)) # <class 'list'>
print(list3)

list1[0] = 100
print(list1)

del list1[0]
print(list1)
'''


# 튜플 (1,2,3,4) -> 값 변경 불가, 중복 허용
'''
tu1 = (1,2,3,4)
tu2 = 2,3
tu3 = tu1 + tu2

tu4 = ('apple', 123, 'banana', 1.5, 123, 'apple', 'apple')
print(tu4.count('apple'),'개')
print(tu4.index('apple'))

print(type(tu1)) # <class 'tuple'>
print(type(tu2)) # <class 'tuple'>
print(tu3)


print('=======튜플 언팩킹(분리)=========')
(a,b,c,d) = tu1

print('a =',a)
print('b =',b)
print('c =',c)
print('d =',d)
'''

'''
def fun1() :
    a = (10,20) # 튜플 a
    
    print('fun1 함수 입니다.')
    
    return a


(a,b) = fun1()

print('a =', a)
print('b =', b)
'''

# 튜플은 값 변경(삭제, 변경 등) 불가!!!

# score 튜플로 작성 (5명 학생 점수)
# 5명의 학생 점수 중에서 50~70점 사이의 학생 점수의 합을 구하는 프로그램

# >> 결과화면 <<
# 5명의 학생 점수는 다음과 같습니다
# 90 50 100 71 31점 입니다.
#
# 50~70점 사이의 학생 점수의 총합은 xx점 입니다.
'''
score = (90, 50, 70, 51, 31) # 튜플은 (괄호) 생략 가능!
total = 0

print('5명의 학생 점수는 다음과 같습니다')

for i in (90, 50, 70, 51, 31) :
    print(i, '', end='')

    if i >= 50 and i <= 70 : # 50~70사이면 참!
        total += i


print('점 입니다.\n')
print('50~70점 사이의 학생 점수의 총합은 %d점 입니다.' % total)
'''



# 5명의 학생 점수 중에서 찾는 점수인 학생의 수를 구하는 프로그램

# >> 결과화면 <<
# 5명의 학생 점수는 다음과 같습니다
# 90 50 70 50 31점 입니다.
#
# 찾을 점수 입력: 31
# 31점인 학생은 1명입니다.
'''
score = (90, 50, 70, 50, 31)
total = 0

print('5명의 학생 점수는 다음과 같습니다')

for i in score :
    print(i, '', end='')

print('점 입니다.\n')

n = int(input('찾을 점수 입력: '))

print('%d점인 학생은 %d명입니다.' % (n, score.count(n)))
'''

# 튜플: 중복 허용, 값 변경 불가(삭제,추가,생성)
# 리스트: 중복 허용, 값 변경 가능!!
# 튜플과 리스트 모두 +(연결), *(반복)

'''
tu1 = (1,2,3,4,5) # 튜플

list1 = [] # 리스트 

list1 = list(tu1)
print(list1)

list1.append(6)
print(list1)

tu1 = tuple(list1)
print(tu1)
'''

# 튜플과 리스트 모두 +(연결), *(반복)
'''
tu1 = 1,2,3,4,5 # 튜플
tu2 = (6,7,8,9)

tu1 += tu2 # tu1 = tu1 + tu2

print(tu1)
'''
# 리스트 score 사용하여 n명의 학생 점수를 입력받아 출력하는 프로그램

# >> 결과화면 <<
# 학생 수 입력: 3
#
# 학생 1 점수 입력: 90.1
# 학생 2 점수 입력: 69.5
# 학생 3 점수 입력: 55.5
#
# 3명 학생의 점수를 출력합니다.
# [90.1, 69.5, 55.5]
'''
score = [] # 빈 리스트로 score 선언!

n = int(input('학생 수 입력: '))

print()

while len(score) < n :
    print('학생 ', len(score)+1, '점수 입력: ', sep='', end='')
    score.append(float(input()))

print('\n%d명 학생의 점수를 출력합니다.' % n)
print(score) # 리스트 출력시 양쪽 [ ] 출력
'''


# 로또 프로그램 (리스트 활용)

# >> 결과화면 <<
# 이번 주 로또 번호 입니다.
# [1 5 2 17 33 22]
'''
import random

lotto = [] # 빈 리스트 사용

print('이번 주 로또 번호 입니다.')

while len(lotto) < 6 : # 처음 len(lotto)는 0임! (0,1,2,3,4,5까지 6회 반복됨)
    lotto.append(random.randint(1,45)) # 1~45 사이의 랜덤값을 lotto 리스트에 추가함!


lotto.sort() # 오름차순
print(lotto) # 리스트 출력시, [] 앞뒤로 붙어서 출력됨!
'''

# >> 결과화면 <<
# 원본 출력: 3298120932
# 
# 0의 개수: 1
# 1의 개수: 1
# 2의 개수: 3
# 3의 개수: 2
# 4의 개수: 0
# 5의 개수: 0
# 6의 개수: 0
# 7의 개수: 0
# 8의 개수: 1
# 9의 개수: 2

num = [9,2,9,8,1,8,0,9,3,2] # 리스트 num에 10개 숫자로 시작!

print('원본 출력: ', end='') # 마지막 줄바꿈 x

for i in num : # i는 리스트 item value값으로 한번씩 대입되어 10번 반복!!
    print(i, end='') # 마지막 줄바꿈 x

print('\n')

for i in range(10) : # i는 0,1,2,3,4,5,6,7,8,9
    print('%d의 개수: %d' % (i, num.count(i))) 






























 




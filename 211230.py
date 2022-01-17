# 반복문 (for문)

# >> 결과화면 <<
# 정수 입력: 7
# 1, 2, 3, 4, 5, 6, 7
'''
n = int(input('정수 입력: '))

# range(start, end-1, step)
# start는 기본값 0
# step은 기본값 1

for x in range(1, n+1) : # 1,2,3,4,5,6,7 범위가 1~n까지 n회 반복!
    if x != n :
        print(x, end=', ')
    else :
        print(x)

'''    

# 구구단 프로그램

# >> 결과화면 <<
# 단(2~9) 입력: 10
# 2 * 1 =  2
# 2 * 2 =  4
# 2 * 3 =  6
# ...
# 2 * 9 = 18
'''
dan = int(input('단(2~9) 입력: '))

if dan >= 2 and dan <= 9 : # dan이 2~9 사이면 참!
    # 구구단 구현 부분

    for n in range(1,10): # 범위 1,2,3,4,5,6,7,8,9를 n에 대입!
        print('%d * %d = %2d' % (dan, n, dan*n)) # 2 * 1 = 2

else :
    print('2~9만 입력 가능합니다.') # "2~9만 입력 가능합니다." 출력
'''

# 1~100 사이의 랜덤값 r을 구해서
# 1~r 사이의 짝수를 출력하는 프로그램
# 7개당 줄바꿈!

# >> 결과화면 <<
# 랜덤값은 25 입니다.
# 1~25 사이의 짝수를 출력합니다.
#  2  4  6  8 10
# 12 14 16 18 20
# 22 24
'''
import random

cnt = 0
r = random.randint(1,100) # 1~100 사이의 랜덤값 발생하여 r에 대입

print('랜덤값은',r,'입니다.')
print('1~%d 사이의 짝수를 출력합니다.' % r)

for i in range(1,r+1) :
    
    if i % 2 == 0: # i가 짝수이면 참!
        cnt = cnt + 1

        if cnt % 7 == 0 : # cnt가 7의 배수이면 참!
            print('%2d' % i)
        else :
            print('%2d' % i, end=' ')

'''

# 1~10 사이의 누적합 구하는 프로그램

# >> 결과화면1 <<
# 1~10 사이의 누적합은 xx입니다.

# >> 결과화면2 <<
# 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55

# >> 결과화면3 <<
# 정수 입력: 7
# 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28
'''
total = 0
n = int(input('정수 입력: ')) # 사용자에게 정수 입력받아 반복 제어에 사용함!

for x in range(1,n+1) : # x는 1~n까지 n회 반복!!
    total += x # total = total + x 와 같음

    # if문 활용 마지막에는 = 출력!
    if x != n :
        print(x, '+', end=' ')
    else :
        print(x, '=', end=' ')
else :
    print(total)
'''

# >> 결과화면 <<
# 2 + 4 + 6 + 8 + 10 = xx
'''
total = 0 # 누적합 변수 total

# for문 활용하여 반복 제어
# range(start, end, step) -> start 기본 0, step 기본 1
# end의 경우, end 포함 안하고 그 전까지!!

for a in range(2,11,2) : # x는 1~9까지 2씩 증가하면서 반복!!
    total += a # total = total + a 와 같음

    if a != 10 :
        print(a, '+', end=' ')
    else :
        print(a, '=', end=' ')

print(total)
'''

# for문 활용하여 반복 제어
# range(start, end, step) -> start 기본 0, step 기본 1
# end의 경우, end 포함 안하고 그 전까지!!

# >> 결과화면 <<
# 1 - 2 + 3 - 4 + 5 - 6 + 7 = 4  
'''
total = 0

for x in range(1,8) : # x = 1,2,3,4,5,6,7 까지 7회 반복

    # total 계산 부분 
    if x % 2 == 1 : # x가 홀수이면 참!
        total += x # x가 홀수면 total에 누적함
    else :
        total -= x # x가 짝수면 total에서 뺌

    # 화면 출력 부분
    if x == 7 :
        print(x, '=', end=' ')  
    elif x % 2 == 1 :
        print(x, '-', end=' ')
    else :
        print(x, '+', end=' ')  
        
print(total)
'''

'''
total = 0

for x in range(1,8) : # x = 1,2,3,4,5,6,7 까지 7회 반복

    # 화면 출력 부분
    if x == 7 :
        total += x # x가 홀수면 total에 누적함
        print(x, '=', end=' ')  
    elif x % 2 == 1 :
        total += x # x가 홀수면 total에 누적함
        print(x, '-', end=' ')
    else :
        total -= x # x가 짝수면 total에서 뺌
        print(x, '+', end=' ')  
        
print(total)
'''

# >> 결과화면 <<
# 정수 입력: 7
# - 1 + 2 - 3 + 4 - 5 + 6 - 7 = xx
'''
total = 0
n = int(input('정수 입력: '))

for x in range(1,n+1) : # x = 1~n 까지 n회 반복

    if x % 2 == 1 : # x가 홀수면 참
        total -= x 
        print('-', x, end=' ')
    else :
        total += x 
        print('+', x, end=' ')  
        
print('=', total)
'''



'''
total = -1

print(total, end=' ')

for x in range(2,8) : # x = 2,3,4,5,6,7 까지 7회 반복

    if x % 2 == 1 : # x가 홀수면 참
        total -= x 
        print('-', x, end=' ')
    else :
        total += x 
        print('+', x, end=' ')  
        
print('=', total)
'''


# 숫자(1~50) 맞추기 게임, 단 5회 기회!

# >> 결과화면 <<
# [ 1회 도전 ]
# 정수 입력: 25
# 25 보다 큽니다
#
# [ 2회 도전 ]
# 정수 입력: 33
# 33 보다 작습니다.

# ...

# [ 5회 도전 ]
# 정수 입력: 32
# 33 보다 작습니다.
# 
# 5회의 기회를 모두 사용하셨습니다.
# 정답은 30 입니다.
'''
import random

r = random.randint(1,50)

for i in range(1,6) : # i = 1,2,3,4,5 로 5회 반복

    print('[ %d회 도전 ]' % i) # 1~5로 변화되는 i값 활용
    n = int(input('정수 입력: '))
    
    if r == n :
        print('★ 정답입니다 ★')
        break # while 문 밖으로 나감
    elif r > n :
        print(n, '보다 큽니다↑\n')
    else :
        print(n, '보다 작습니다↓\n')
        
else :
    print('5회의 기회를 모두 사용하셨습니다.')
    print('정답은', r, '입니다.')
'''


'''
import random

r = random.randint(1,50)

while True : # 무한루프 (True는 대문자 시작 주의)
    n = int(input('정수 입력: '))
    
    if r == n :
        print('★ 정답입니다 ★')
        break # while 문 밖으로 나감
    elif r > n :
        print(n, '보다 큽니다↑\n')
    else :
        print(n, '보다 작습니다↓\n')
'''

# 5~10 사이의 누적합 구하는 프로그램

# >> 결과화면 <<
# 시작 정수: 5
# 끝 정수: 10
# 5~10 사이의 누적합은 xx입니다.
'''
total = 0 # 누적변수 total

n1 = int(input('시작 정수: '))
n2 = int(input('끝 정수: '))

for i in range(n1, n2+1) :
    total += i # total = total + i 와 같음
    
print('%d~%d 사이의 누적합은 %d입니다.' % (n1,n2,total))

'''

# 주사위(1~6) 2개를 던져서 동일 숫자가 나올 확률을 구하는 프로그램
# 300번 던져서 나온 확률 -> xx.x% 출력 
# ~ 3:7

# >> 결과화면 <<
# 주사위 2개 던집니다.(300번 반복)
# 동일한 숫자가 나온 경우는 19.2% 입니다.

'''
import random

cnt = 0 # 동일 숫자 나올 경우 cnt 1씩 증가하며 사용할 변수

print('주사위 2개 던집니다.(500번 반복)')

for i in range(1, 501) : # i는 1~500, 500번 반복
    r1 = random.randint(1,6) # 주사위1
    r2 = random.randint(1,6) # 주사위2

    if r1 == r2 : # 동일 숫자 나올 경우
        cnt += 1 # cnt = cnt + 1 와 같음

print('같은 숫자가',cnt,'번 나왔군요 <- 이건 추가해 봄~')
print('동일한 숫자가 나온 경우는 %.1f%% 입니다.' % (cnt/500*100))
'''

# n은 사용자 입력(50~100만 가능, 그 외 에러메시지 출력) 받음
# 1부터 n까지 숫자 중, 3의 배수이고 7의 배수를 출력하는 프로그램

# >> 결과화면1 <<
# 정수(50~100) 입력: 1
# 50~100만 입력 가능합니다.

# >> 결과화면2 <<
# 정수(50~100) 입력: 70
# 1~70 사이의 3의배수이고 7의배수인 숫자를 출력합니다.
# 21 xx xx xx xx
'''
n = int(input('정수(50~100) 입력: '))

if n >= 50 and n <= 100 : # 50~100 사이면 참!
    
    for i in range(1, n+1) : # i는 1~n, n회 반복!
        
        if i % 3 == 0 and i % 7 == 0 : # i가 3과 7의 공배수이면 참
            print(i, '', end='')
        
else :
    print('50~100만 입력 가능합니다.')

'''

# 로또 프로그램
# 1~45 사이의 6개 숫자 출력하는 프로그램

# >> 결과화면1 <<
# 이번 주 로또 번호 입니다.
# 45 3 14 15 20 8

'''
import random

print('이번 주 로또 번호 입니다.')

for i in range(1, 7) : # 1~6까지 6회 반복
    r = random.randint(1,45)
    print(r, '', end='')
    
'''

# 음료수 자판기

# >> 음료수 자판기 <<
# ===== 메뉴 =====
# 1. 콜라(500원)
# 2. 사이다(600원)
# 3. 2% (700원)
# 4. 종료
# ================
# 메뉴 선택: 1
# 콜라 구매하셨습니다.

'''
money = int(input('돈 입력: '))

print('┌── 메뉴 ───┐')
print('│1. 콜라(500원)  │')
print('│2. 사이다(600원)│')
print('│3. 2% (700원)   │')
print('│4. 종료         │')
print('└────────┘')

while True : # 무한루프
    n = int(input('메뉴 선택: '))

    if n == 1 :
        if money >= 500 :
            print('☆ 콜라 구매하셨습니다.')
            money -= 500 # money = money - 500
            print('남은 돈은 %d원 입니다.\n' % money)
        else :
            print('돈이 부족합니다.')
            print('남은 돈은 %d원 입니다.\n' % money)

            add_money = int(input('돈 추가 입력: '))
            money += add_money # money = money + add_money
        
    elif n == 2 :
        if money >= 600 :
            print('☆ 사이다 구매하셨습니다.')
            money -= 600 # money = money - 600
            print('남은 돈은 %d원 입니다.\n' % money)
        else :
            print('돈이 부족합니다.')
            print('남은 돈은 %d원 입니다.\n' % money)

            add_money = int(input('돈 추가 입력: '))
            money += add_money # money = money + add_money
            
    elif n == 3 :
        if money >= 700 :
            print('☆ 2% 구매하셨습니다.')
            money -= 700 # money = money - 700
            print('남은 돈은 %d원 입니다.\n' % money)
        else :
            print('돈이 부족합니다.')
            print('남은 돈은 %d원 입니다.\n' % money)

            add_money = int(input('돈 추가 입력: '))
            money += add_money # money = money + add_money
            
    elif n == 4 :
        print('남은 돈 %d원 반환합니다.' % money)
        print('★ 종료합니다. ★')
        break # while문 밖으로 나감!
    
    else :
        print('1~4만 입력 가능합니다.\n')

'''

# 입력받을 숫자의 범위는 100~150 사이만 가능!
# 입력받은 숫자가 홀수이면 출력
# 입력받은 숫자가 짝수이면 미출력("종료합니다")
# 1 4 7 10 13 16 19...

# >> 결과화면1 <<
# 정수(100~150) 입력: 99
# 100~150 사이만 입력 가능합니다.

# >> 결과화면2 <<
# 정수(100~150) 입력: 120
# 종료합니다

# >> 결과화면3 <<
# 정수(100~150) 입력: 121
# 1 4 7 10 .... xx
'''
n = int(input('정수(100~150) 입력: '))

if n >= 100 and n <= 150 : # n이 100~150 사이면 

    if n % 2 == 0 : # n이 짝수이면 참!
        print('종료합니다')
        
    else :
        for i in range(1, n+1, 3):
            print(i, '', end='')
    
else :
    print('100~150 사이만 입력 가능합니다.')
'''

# 리스트 연습
'''
list1 = [1, 'hello', 2, 'apple', 3.1, 3, 4, 5]

list1.append('banana') # 맨 뒤에 추가!
list1.append('orange')
print(list1)

print(list1.pop()) # 맨 뒤에 있는 아이템이 빠져나감!

list1.remove('hello') # value로 검색하여 삭제!
print(list1)

list1.append('apple')
print(list1)

print(list1.index('apple'))

list1.clear() # 빈 리스트로 변경
print(list1)




list2 = [1,2,3,4,5]
print(list2)

list2.insert(2, 'hello')
print(list2)

list2[2] = 'python'
print(list2)



list3 = [5,2,1,8,3,1,12]
print(list3)

list3.sort()
print(list3)

list3.reverse()
print(list3)
'''

# 1~45 사이 6개 숫자를 추출하여 리스트 listA에 item 추가하여
# 오름차순으로 출력하는 프로그램
'''
import random

listA = [0,0,0,0,0,0] 

for i in range(len(listA)) : # i = 0,1,2,3,4,5
                             # 0으로 시작한 이유는 index 접근하기 위해

    listA[i] = random.randint(1,45)


listA.reverse() # 리스트 뒤집기(역순X)
print(listA)

listA.sort(reverse = True) # 내림차순(reverse 옵션 필요)
print(listA)

listA.sort() # 오름차순 1->9, a->z
print(listA)
'''

# 리스트 +(연결), *(반복)
'''
list1 = [1,2,3]
list2 = [2,3,4]

list3 = list1 + list2 # 연결
print(list3)

list4 = list2 * 3
print(list4)

del list3[2]
print(list3)

del list4[1:4]
print(list4)

# [2, 3, 4, 2, 3, 4]
list4.extend(list1)
print(list4)
'''
# ~57
# 5명의 학생 점수(실수)를 score 리스트에 대입하고,
# 총점과 평균을 구하는 프로그램

# >> 결과화면1 <<
# 5명의 총합은 xx.x점 입니다.
# 평균은 xx.x점 입니다.

'''
score = [99.1, 80.5, 100.0, 90.2, 77.7]
total = 0
n = len(score)

for i in score :
    total += i # total = total + i 
    
print('%d명의 총합은 %.1f점 입니다.' % (n, total))
print('평균은 %.1f점 입니다.' % (total/n) )
'''

# \t 활용
# >> 결과화면2 <<
# 1번   2번    3번   4번   5번
# 99.1  80.5  100.0  90.2  77.7
# =============================
# 100.0 99.1   90.2  80.5  77.7

score = [99.1, 80.5, 100.0, 90.2, 77.7]

n = len(score)

print('1번\t2번\t3번\t4번\t5번')

for i in score :
    print('%.1f\t' % i, end='')

print('\n\n======== 내림차순으로 출력 ==========')

score.sort(reverse = True) # 리스트 score 내림차순으로 정렬!

for i in score :
    print('%.1f\t' % i, end='')












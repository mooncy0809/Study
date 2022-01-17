# 파이썬 주석방법

'''
add = 10

# input()는 사용자에게 키보드 입력을 받아 문자열로 리턴!
# print()는 화면에 출력
# int()는 문자열(정수) -> 정수

age = int(input('나이 입력: '))
print('당신의 나이는',age,'세 입니다.')
print('정수는 int, 문자열은 str 입니다.')
print(age + add) # error!
'''

# 연산자
# 산술연산자: +,-,*,/,//,%
# 비교연산자: <, <=, >, >=, ==(같으면 참), !=(같지 않으면 참)
# 논리연산자: and(&&), or(||), not(!)
# 복합대입연산자: +=, -=, *=
# 대입연산자: =(우선순위가 가장 낮음, 오른쪽->왼쪽)
'''
n1 = 23 # 대입연산자
n2 = 20

print(n1,'+',n2,'=',n1 + n2)
print(n1,'-',n2,'=',n1 - n2)
print(n1,'*',n2,'=',n1 * n2)
print(n1,'/',n2,'=',n1 / n2) # 일반적인 나눗셈(소수점)
print(n1,'//',n2,'=',n1 // n2) # 몫
print(n1,'%',n2,'=',n1 % n2) # 나머지(홀/짝수, 배수 문제 활용)

print() # 줄바꿈
print(n1,'<',n2,'=>',n1 < n2) # False
print(n1,'<=',n2,'=>',n1 <= n2)
print(n1,'>',n2,'=>',n1 > n2) # True
print(n1,'>=',n2,'=>',n1 >= n2)
print(n1,'==',n2,'=>',n1 == n2) # 같으면 참!
print(n1,'!=',n2,'=>',n1 != n2) # 같지 않으면 참!

print() # 줄바꿈
print(True and True) # True
print(True and False) # False
print(True or True) # True
print(True or False) # True
print(not True) # False
print(10==10 and 2<3) # True

print() # 줄바꿈
n1 += n2 # n1 = n1 + n2 와 같음(복합대입연산자는 왼쪽피연산자가 변수임)
print(n1) # 46
'''

# ~45까지 (배운 부분만 활용해보기~ >.<)
# 3명의 학생 점수(0~100점)를 입력받고, 총점과 평균을 구하는 프로그램

# >> 결과화면 <<
# 학생1 점수 입력: 90
# 학생2 점수 입력: 86 
# 학생3 점수 입력: 100
#
# 90 , 86 , 100 점의 총점은 276 점입니다.
# 평균은 92.0 점입니다.

# 각 학생 점수 입력받아 n1,n2,n3에 대입
# int() 함수 사용하여 문자열을 정수로 변환
'''
n1 = int(input('학생1 점수 입력: ')) 
n2 = int(input('학생2 점수 입력: '))
n3 = int(input('학생3 점수 입력: '))

total = n1 + n2 + n3

print() # 줄바꿈
print(n1,',',n2,',',n3,'점의 총점은',total,'점입니다.')
print('평균은',total/3,'점입니다.')
'''


# 연산자(//,%) 활용
# 사용자에게 초(s)를 입력받아, 시,분,초로 출력하는 프로그램

# >> 결과화면 <<
# 초(s) 입력: 12345
# x시간 x분 45초
'''
s = int(input('초(s) 입력: '))
print(s//3600,'시간',s//60%60,'분', s % 60,'초')
'''

# 연산자(//,%) 활용
# 사용자에게 돈(money)을 입력받아, 만, 천, 백, 십, 일로 출력하는 프로그램

# >> 결과화면 <<
# 돈(money) 입력: 12345
# 1만 2천 3백 4십 5원
'''
m = int(input('돈(money) 입력: '))
print(m//10000,'만',m//1000%10,'천',m//100%10,'백',m//10%10,'십',m%10,'원')
'''

'''
name = input('이름 입력: ')
age = int(input('나이 입력: '))

print('안녕하세요. ', name, '님 반갑습니다.', sep='')
print('나이는 ', age, '세 이시군요.', sep='')

# print() 함수는 기본 sep=' '이고, end='\n'임!

# 형식지정자
# %s: 문자열
# %d: 정수
# %f: 실수
# %c: 문자
# %%: % 출력
# %o: 8진수(0~7)
# %x: 16진수(0~9, A~F)

# print('안녕하세요. %s님 반갑습니다.' % name)
# print('나이는 %d세 이시군요.' % age)

print('안녕하세요. %s님 반갑습니다.\n나이는 %d세 이시군요.' % (name, age))
'''

# 특수기호(이스케이프 코드)
# \t: tab
# \n: 줄바꿈
# \': ' 출력
# \": " 출력
# \\: \ 출력
# \a: 삑- 소리

# 사용자에게 실수를 입력받아 %로 출력하는 프로그램

# >> 결과화면 <<
# 실수 입력: 12.34

# 입력하신 실수는 12.34이고, 12.34%로 출력도 해봅니다.
'''
n = float(input('실수 입력: '))

print('\n입력하신 실수는 %.2f이고, %.3f%%로 출력도 해봅니다.' % (n, n))
# %f은 기본 소수점 6자리!!
'''

'''
n = 12.345
n2 = 1234

print('1234567890')
print('%d' % n2) # 왼쪽 정렬
print('%7d' % n2) # 총 7자리, 오른쪽 정렬
print('%-7d입니다.' % n2) # 총 7자리, 왼쪽 정렬
print('%3d입니다.' % n2) # 왼쪽 정렬
print('%07d입니다.' % n2) # 총 7자리, 오른쪽 정렬

print('%f' % n) # 소수점 6자리 기본임!
print('%8.1f' % n) # 총 8자리, 소수점 1자리, 오른쪽 정렬
print('%-8.1f' % n) # 총 8자리, 소수점 1자리, 왼쪽 정렬
print('%.2f' % n) # 소수점 2자리(3자리에서 5이상 반올림)
'''

'''
print('hello\'s python')
print("hello's python")
print('hello\"s python')
'''

# 사용자에게 실수인 몸무게(kg)와 키(cm)를 입력받아 bmi를 구하는 프로그램

# >> 결과화면 <<
# 몸무게 입력: 70.123
# 키 입력: 175.32
#
# 당신의 몸무게는 xx.xkg이고, 키는 xx.xcm 입니다.
# 당신의 bmi는 xx.xx입니다.
'''
kg = float(input('몸무게 입력: '))
cm = float(input('키 입력: '))

bmi = kg / ((cm/100)*(cm/100))

print('당신의 몸무게는%.1fkg이고, 키는 %.1fcm 입니다.' % (kg, cm))
print('당신의 bmi는 %.2f입니다.' % bmi)

'''

'''
str1 = 'hello'
str2 = str1 + 'python' # 문자열 + 문자열 (연결)
str3 = str1 * 4 # 문자열 * 숫자 (반복)

print(str1)
print(str2)
print(str3)

print('i love python!!')
print('i {0} python!!'.format('love'))
print('i {0} python!! hello {1}!!'.format('love','java'))

print('str1은 ', len(str2), '자 입니다.', sep='')
print('str1은 %d자 입니다.' % len(str2))
'''

'''
n = 12.345

print('1234567890')
print('{0:>10}'.format(n)) # 오른쪽 정렬
print('{0:<10}'.format(n)) # 왼쪽 정렬
print('{0:^10}'.format(n)) # 가운데 정렬
print('{0:=^10}'.format(n)) # 가운데 정렬
'''

'''
name = '  apple banana  '
ch = 'a'

print(name.upper()) # 모두 대문자로 변경
print(name.lower()) # 모두 소문자로 변경
print(name.lstrip()) # 왼쪽 공백 지우기!
print(name.rstrip()) # 오른쪽 공백 지우기!
print(name.strip()) # 양쪽 공백 지우기!
print(name, '에서 \'', ch, '\'는 ', name.count(ch), '개 입니다.', sep='')
'''

# 사용자에게 문자열을 입력받고, 또 찾을 문자 1개를 입력받아 몇 개 인지 구하는 프로그램

# >> 결과화면 <<
# 문자열을 입력하세요: hello python!!
# 찾을 문자 1개 입력: o
#
# "hello python!!" 에는 'o'가 2개 있습니다.

'''
text = input('문자열을 입력하세요: ')
find_ch = input('찾을 문자 1개 입력: ')

print('\n\"%s\" 에는 \'%c\'가 %d개 있습니다.' % (text, find_ch, text.count(find_ch)))
'''


# 돈을 입력받아, 500원, 100원짜리가 몇 개 인지 구하는 프로그램 (단위는 10원 단위)

# >> 결과화면 <<
# 돈 입력: 12300

# 12300원 이고,
# 500원: x개
# 100원: x개
# 50원: x개
# 10원: x개 입니다.
'''
money = int(input('돈 입력: '))

print('\n%d원 이고,' % money)
print('500원: %d개' % (money // 500))
print('100원: %d개' % (money % 500 // 100))
print('50원: %d개' % (money % 100 // 50))
print('10원: %d개' % (money % 50 // 10))
'''

# 사용자에게 정수(4자리)를 입력받아 각각의 숫자를 더하는 프로그램

# >> 결과화면 <<
# 정수(4자리) 입력: 1234
# 1 + 2 + 3 + 4 = 10
'''
n = int(input('정수(4자리) 입력: '))

a = n // 1000 # 천의 자리
b = n // 100 % 10 # 백의 자리
c = n // 10 % 10 # 십의 자리
d = n % 10 # 일의 자리

total = a + b + c + d

print('%d + %d + %d + %d = %d' % (a,b,c,d,total))
'''

# 화씨 온도(실수로 입력)를 섭씨 온도(실수로 출력)로 변환하는 프로그램

# >> 결과화면 <<
# 화씨 온도 입력: 100
# 섭씨 온도는 37.78 입니다.

'''
import math

f = float(input('화씨 온도 입력: '))
c = (f-32)*(5/9)

print(math.ceil(7.2)) # 올림, 8
print(math.floor(7.9)) # 내림, 7

#print('섭씨 온도는 %.2f 입니다.' % c)
'''

# 두 점의 사이의 거리를 구하는 프로그램
# p1_x, p1_y, p2_x, p2_y, dist 변수 사용

# >> 결과화면 <<
# p1_x 실수 입력: 1.2
# p1_y 실수 입력: 4.3

# p2_x 실수 입력: 5.1
# p2_y 실수 입력: 11.3

# p1(1.23, 4.3)와 p2(5.1, 11.3) 사이의 거리는 xx.xx 입니다.

import math

p1_x = float(input('p1_x 실수 입력: '))
p1_y = float(input('p1_y 실수 입력: '))
print() # 줄바꿈
p2_x = float(input('p2_x 실수 입력: '))
p2_y = float(input('p2_y 실수 입력: '))
print() # 줄바꿈

width = p1_x - p2_x # 음수가 나와도 상관x
height = p1_y - p2_y # 음수가 나와도 상관x 

dist = math.sqrt( (width*width) + (height*height) )

print('p1(%.1f, %.1f)와 p2(%.1f, %.1f) 사이의 거리는 %.2f 입니다.' % (p1_x, p1_y, p2_x, p2_y, dist))













# 랜덤 100~200 사이의 값을 발생시킴
# 주사위(1~6) 2개를 던져서 눈의 합이 6 이하인 경우의 확률 구하는 프로그램

# >> 결과화면 <<
# 150번 주사위 2개 던집니다.
# 주사위 2개 눈의 합이 6 이하인 경우는 xx.x% 입니다.
'''
import random as ra # random 모듈 이름대신 별명으로 ra 사용합니다!

r = ra.randint(100,200) # 100~200 사이 랜덤(난수) 발생하여 r에 대입  
cnt = 0 # 2개 합이 6이하인 경우 카운트!

print('%d번 주사위 2개 던집니다.' % r)

for i in range(1, r+1) : # 범위는 1~r까지이고, i는 1~r, r회 반복!
    r1 = ra.randint(1,6) # 1~6 사이 랜덤(난수) 발생하여 r1에 대입
    r2 = ra.randint(1,6) # 1~6 사이 랜덤(난수) 발생하여 r2에 대입
        
    if (r1 + r2) <= 6 : # 주사위 2개 합이 6이하인 경우 참!
        cnt += 1 # cnt = cnt + 1 와 같음

print('주사위 2개 눈의 합이 6 이하인 경우는 %.1f%% 입니다.' % (cnt/r*100))
'''

# 세트(set)
# 순서가 없음(index x), 중복x
# 세트 item(항목)은 변경x. 제거ok, 추가ok

'''
set1 = set([1,2,3,4,5])
set2 = {1,2,3,4,5}

print(type(set1))
print(type(set2))

set1.add(6)
print(set1)

set2.pop()
set2.pop()
set2.pop()
print(set2)


set1 = {'apple', 'banana', 'orange', 'apple'}

set1.add('cherry')
print(set1)

set1.pop()
print(set1)

set1.clear()
print(set1)

set1.add('apple')
print(set1)

del set1

set1 = {'apple', 'banana', 'orange'}
set2 = {'cherry', 'apple', 'banana'}


for i in set1 :
    print(i)
    
#set1.remove('apple')
set1.discard('apple')
print(set1)

#set3 = set1.union(set2) 
#print(set3)

#set1.intersection_update(set2) # set1,set2 항목 유지
#print(set1)

#set3 = set1.intersection(set2) # 새집합(set) 반환
#print(set1)
#print(set3)

#set1.symmetric_difference_update(set2)
#print(set1)

set1 = {1,2,3,4,5}
set2 = {2,4,6,8,10}

# 교집합
print(set1 & set2) 
set1.intersection(set2)

# 합집합
print(set1 | set2)
set1.union(set2)

# 차집합
print(set1 - set2)
set1.difference(set2)
'''

# 5개 색상 중에서 1개 색상을 출력하는 프로그램
# set 자료형을 사용하기!

# >> 결과화면 <<
# 5개 색상은 다음과 같습니다.
# black, white, red, blue, green
# 랜덤 색상은 red입니다.
'''
color = {'white','black','red','blue','green'}
cnt = 0

print('%d개 색상은 다음과 같습니다.' % len(color))

for i in color :
    cnt += 1
    
    if cnt < len(color) :
        print(i, ', ', sep='', end='')
    else :
        print(i)

print('랜덤 색상은 ', color.pop(), '입니다.', sep='')

## 랜덤 출력!
# for i in range(1,5) : # i는 1,2,3,4
#    color.pop()

# print('랜덤 색상은',color,'입니다.')
'''



# 5개 색상 중에서 1개 색상을 출력하는 프로그램
# list 자료형을 사용하기!

# >> 결과화면 <<
# 5개 색상은 다음과 같습니다.
# black, white, red, blue, green
# 랜덤 색상은 red입니다.
'''
import random

color = ['white','black','red','blue'] # 리스트사용!
cnt = 0

print('%d개 색상은 다음과 같습니다.' % len(color))

for i in color :
    cnt += 1
    
    if cnt < len(color) :
        print(i, ', ', sep='', end='')
    else :
        print(i)

r = random.randint(0,len(color)-1) # index로 사용할거라 0부터~
print('랜덤 색상은 ', color[r], '입니다.', sep='')

# print('랜덤 색상은 ', color.pop(), '입니다.', sep='')
# 위의 코드의 경우 항상 마지막 item이 출력되어 사용x
'''

'''
list1 = [1,2,3,4,5]
tu1 = (1,2,3,4,5) # 튜플

list2 = list(tu1) # list2 = [1,2,3,4,5]
list2[0] = 100 # list2 = [100,2,3,4,5]

tu1 = tuple(list2) # tu1 = (100,2,3,4,5)

print(tu1)
'''

'''
set1 = {1,2,3,4,5}
list1 = list(set1) # list1 = [1,2,3,4,5]

list1[0] = 200 # list1 = [200,2,3,4,5]
set1 = set(list1) # set1 = {200,2,3,4,5}

print(set1)
'''

# 딕셔너리(사전, dictionary)
# key:value (키:값), 중복x
# python 3.6 포함 이전 버전에서 순서없음, 3.7 순서있음
'''
dic1 = {'id':'admin',
        'password':'admin123'}

print(dic1['password'])
print(dic1.get('id'))
print(dic1.keys())

dic1['tel'] = '123-1234' # item 추가
dic1['id'] = 'admin2' # item 변경
dic1.update({'tel':'234-2345'}) # item 변경

# print(dic1.pop('tel')) # tel 제거!

print(dic1.popitem())
# 3.6이전 버전에서는 마지막 추가된 item 제거
# 3.7이후 버전에서는 임의항목 대신 제거

del dic1

# dic2에 있는 나이를 문자열로 초기화하였는데
# '22'만 추출하여 숫자 22로 변환하고 출력!

# >> 결과화면 <<
# dic2의 나이는 22입니다.
# 22 + 1 = 23

dic2 = {'name':'kim',
        'age':'22',
        'address':'seoul'}

print(dic2)

age = int(dic2.get('age'))
print('dic2의 나이는 %d입니다.' % age)
print('%d + 1 = %d' % (age, age+1))

print('name' in dic2) # True


list1 = list(dic2.keys())
print(list1)

list2 = list(dic2.values())
print(list2)


dic2 = {'name':'kim',
        'age':'22',
        'address':'seoul'}

#for i in dic2 :
#    print(dic2[i])

#for i in dic2.values() :
#    print(i)

#for i, j in dic2.items() :
#    print(i, j, sep=' - ')


dic3 = dic2
print(dic3)

dic4 = dic2.copy()
print(dic4)

dic5 = dict(dic2)
print(dic5)
'''

# ~1:00
# 딕셔너리 score 활용

# >> 결과화면 <<
# 1001번 'kim' 학생의 점수는 다음과 같습니다.
# 88.5 91.2 70.8 점입니다.
# 총점: xx.x점, 평균: xx.x점

'''
score = {'no':1001,
         'name':'kim',
         'kor':88.5,
         'eng':91.2,
         'math':70.8 }

total = 0

print("%d번 '%s' 학생의 점수는 다음과 같습니다." % (score['no'], score['name']))

for i, j in score.items() :
    
    if i == 'kor' or i == 'eng' or i == 'math' :
        total += j
        
        if i == 'math' :
            print(j, '점 입니다.', sep='')
        else :
            print(j, '점, ', sep='', end='')


print('총점: %.1f점, 평균: %.1f점' % (total, total/3)) 
'''

# 중첩 딕셔너리 (key:value)

# 다음 학생 3명의 나이 총합을 구하시오

# >> 결과화면 <<
# 3명의 나이 총합은 xx세 입니다.
# 22 + 24 + 27 = xx

student = {'s1' : {'name':'kim', 'age':22},
           's2' : {'name':'lee', 'age':24},
           's3' : {'name':'park', 'age':27}}

total = 0

for i, j in student.items() :
    total += j['age']

print('3명의 나이 총합은 %d세 입니다.' % total)















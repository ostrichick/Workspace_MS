

########################
# 1.0 Date types
########################
# variables = 등호 왼쪽에 위치하는 변수
# string:문자열
# int:숫자
# float: 소수점숫자
# boolean: True/False (자바스크립트와 다르게 첫글자 반드시 대문자)
# None: 비어있음 (자바스크립트 Null과 비슷)
# Variable 이름 지을때 asd_zxc_vbn 형태로 소문자+언더스코어로 지음 (snake case)
# # 자바스크립트 네이밍 asdZxcVbn (낙타 camel case)

# 1.1 Sequence types - List

# List를 사용하는 이유: 여러 값을 하나에 리스트에 넣어 효율적으로 관리할 수 있음
# 양식 variable = ["value1", "value2", "value3"]

days = ["일", "월", "화", "수", "목", "금", "토"]
print(days) #일 월 화 수 목 금 토
print("월" in days) #True
print("왈" in days) #False
print(days[3]) #수
print(len(days)) #7
days.append("쾅")
# print(days) # 일 월 화 수 목 금 토 쾅
days.reverse()
# print(days) # 쾅 토 금 목 수 화 월 일
days.reverse()

# 파이썬 라이브러리 https://docs.python.org/ko/3/library/index.html

# mutable (list) 리스트 안의 값을 변경할 수 있음
# immutable (tuple) 투플레 안의 값을 변경할 수 없음

# 1.2 Tuples and Dicts

dayss = ("일", "월", "화", "수", "목", "금", "토")
# print(dayss)
#투플레는 ()로 감쌈. 값을 절대 바꿀 수 없느 immutable sequence

# object나 reference를 만들고 싶을때?
# name = "Lalo"
# age=50
# Mexicano=True
# fav_food=["Nacho","Taco"]

lalo = { #딕셔너리 만들어서 정보들 집어넣기
    "name" : "Lalo",
    "age" : 50,
    "Mexicano" : True,
    "fav_food" : ["Nacho","Taco"] #리스트나 투플레같은것도 집어넣음
    }
print(lalo)
lalo["cruel"] = True # 크루얼 추가
print(lalo)

# 1.3 Built in Functions

# 펑션은 같은 행동을 반복할 수 있게 해줌

# 내장된 함수 목록 라이브러리 https://docs.python.org/ko/3/library/index.html

#len() 길이를 알려줌
#int() bool() str() float() 등의 명령어는 하나의 type을 다른 type으로 바꿈

# 1.4 Creating functions

# define function (디파인 펑션 = 함수 만들기)
def say_hello():
    print("hello!!!!!?") #들여쓰기가 굉장히 중요함. 중괄호 대신에 들여쓰기로 함수 판별
    print("i'm good?")
    
say_hello() # ()가 필요함

# 1.5 Function Arguments

def greeting(whois=" 익명"):
    print(f"hello there {whois}")
    
greeting("walter")


def deohagi(a=0,b=3939,c=0):#정해놓은 인자를 입력 안해줄 경우를 대비한 기본값
    print(a+b+c) 
deohagi(334) # 결과 1

# 1.6 Returns

# 리턴은 실질적으로 값에 변화를 주며 함수를 종료시킴. return 아래는 실행하지 않음

# 1.7 Keyworded Arguments

#인자의 순서보다는 인자의 이름을 매치시키는 것이 더 중요

def anny(name, age, from1, fav_food):
    return f"hello {name} you are {age}, from {from1}, like {fav_food}"

hehe = anny(fav_food="whale",age=49, from1="honduras",name="Hank") #인자의 갯수가 많을 때도 순서를 신경쓰지 않아도 됨
print(hehe)

# 1.8 Let's make a calculater

# 7가지 기능의 함수로 계산기 만들기
# str을 float로 변환시킬것

# if 조건:
    # 행동1
# else:
    # 행동2
    # return


# 1.9 Condotionals part 1

def peuleoseu(a,b):
    if type(b) is int or type(b) is float:
        return a+b
    else:
        return None
print(peuleoseu(13,9.9)) # = 22.9


# 1.10 if else and or

# def age_check(age):
#     print(f"당신은 {age}살입니다")
#     if age < 18:
#         print("아직 미성년자입니다")
#     elif age == 18 or age == 19:
#         print("민증 받으니 좋죠")
#     elif age > 19 and age < 30:
#         print("20대라 좋죠")
#     else :
#         return print("맛있게 드쇼")
    
# age_check(17)
# age_check(18)
# age_check(24)
# age_check(31)

# 1.11 For in

nalja = ("Mon", "Tue", "Wed", "Thu", "Fri")
for aquaman in nalja:
    if aquaman is "Wed":
        break
    else:
        print(aquaman)
        
# str, list, tuple 같은거 안에 있는걸 하나씩 순서대로 가져옴?

# 1.12 Modules import

# import math : math 모듈을 통째로 다 불러움
from math import fsum, pow #math 모듈에서 특정 하위모듈만 골라서 불러옴
from math import ceil as olim # 불러온 모듈의 이름을 바꾸기
#from 파일이름(확장자제외) import 함수이름 #다른 py파일에서 함수 가져오기

print(olim(2.3)) #올림
print(pow(3,3)) #제곱
print(fsum([4,67,2,7,4])) # 합계



# def calcul(a, b):
#     if (type(a) is str) or (type(b) is str):
#         return print("숫자를 입력해주세요.")
#     else:
#         a = float(a)
#         b = float(b)
#         return f"""a+b={a+b}
# a-b={a-b}
# a*b={a*b}
# a%b={a%b}
# a/b={a/b}
# a//b={a//b}
# a**b={a**b}"""

# calculator=calcul(3, 4)
# print(calculator)

# def calcul(a, b):
#     if (type(a) is str) or (type(b) is str):
#         return print("숫자를 입력해주세요.")
#     else:
#         a = float(a)
#         b = float(b)
#         return f"""a+b={a+b}
# a-b={a-b}
# a*b={a*b}
# a%b={a%b}
# a/b={a/b}
# a//b={a//b}
# a**b={a**b}"""

# calculator=calcul(5, 3)
# print(calculator)

# days =("일","월","화","수","목","금","토")

# for day in days:
#   if day == "화":
#     break
# else:
#   print(day)

# for letter in "why hello there":
#   print(letter)



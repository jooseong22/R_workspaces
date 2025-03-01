## CSV(Comma-Separated Values)
## CSV(데이터분석 데이터) -> 콤마로 구성된 데이터
## CSV파일은 데이터분석에서 매우 많이 사용됩니다.

# CSV파일 장점 : '광범위한 호환성(R, Python, C, C++)'
# CSV <-- 데이터프레임 < -- 분석하고 시각화

## R 저장,불러오는 파일 경로 수정하기
setwd('D:/r-data'); # D 드라이브에 r-data 폴더로 경로 수정
print(list.files()) #현재 경로에 있는 파일목록 출력

# 엑셀(csv)파일 불러오기
emp = read.csv('emp.csv') #엑셀 불러오기
# View(emp) 
# 퀴즈 -> 1~5행까지 출력, 아래 3행만 출력, 행/열 수 확인
print(head(emp,5))
print(tail(emp,3))
print(dim(emp))
print(str(emp)) #데이터프레임 열 데이터 타입 확인

# 데이터 형 변환

# 예제 문자 -> 숫자로 변환
num = c('100','200','300')
num = as.numeric(num) # 문자 -> 숫자
num = num * 2
print(num)

num2 = c(100,200,300)
# 숫자 -> 문자
num2 = as.character(num2)
print(num2)

# 날짜형으로 변환(why? 날짜관련 계산하기 위해서)
str(emp)
# 문자형 -> 날짜형
emp$HIREDATE = as.Date(emp$HIREDATE)
str(emp)

# 형변환 연습










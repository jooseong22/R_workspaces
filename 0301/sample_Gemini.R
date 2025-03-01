# R 디렉토리 변경
setwd('D:/r-data')
print(list.files()) #해당 경로 파일 확인

# CSV(엑셀) 불러오기
data = read.csv('student_data.csv')
#View(data)

# 각 과목(Math, Science, English)의 평균 점수를 계산하세요. 
math = mean(data$Math) # Math컬럼(열) 평균 구하기
cat('수학 평균 : ',math, '\n')

science = mean(data$Science)
cat('과학 평균 : ',science,'\n')

english = mean(data$English)
cat('영어 평균 :', english,'\n')

# 컴퓨터 총합을 구하시오. 단. 결측값 제거(NA.rm = TRUE)
# rm => remove
computer = sum(data$Computer, na.rm = TRUE)
print(computer)

# 영어과목 표준편차 구하시오.
# sd = stasndard deviation(표준편차)
english_sd <- sd(data$English, na.rm = TRUE)
cat("영어 과목 표준편차:", english_sd, "\n")
# 영어 값들이 평균으로 부터 (+-) 4.9만큼 
# 퍼져있다는 것을 의미합니다. 

# 과학 중앙값 구하기
science_median <- median(data$Science, na.rm = TRUE)
cat("과학 과목 중앙값:", science_median, "\n")

# 수학 사분위수 구하기
math_q =  quantile(data$Math)
print("수학 과목 사분위수:")
print(math_q)

# 최댓값, 최솟값 
# 수학 과목의 최댓값, 최솟값 구해보기
math_max = max(data$Math) # 최댓값
math_min = min(data$Math) # 최솟값
cat(' 최솟값 : ',math_min,'\n')
cat(' 최대값 : ',math_max,'\n')

# table
print(table(data$English)) # 점수별 인원 통계

# 데이터프레임 기초 통계량 전체 확인
# summary 사용하면 각 컬럼(열)별 기본 통계 확인
print(summary(data))

# install.packages("ggplot2")
library(ggplot2)
graph_data = data.frame(
  x = c('수학평균','영어평균','과학평균'),
  y = c(math,english,science) # 각 과목 평균값
)
# 그래프 생성
result = ggplot(data = graph_data,aes(x = x, y = y )) + 
  geom_col(fill = 'steelblue') +
  labs(
    title = "과목 평균",
    x = "과목",
    y = "평균점수"
  ) + 
  theme_minimal()
print(result)

# 급여가 3000 이상 받는 사원만 조회 (emp 데이터프레임이 없어 삭제)
# high_sal = subset(emp, SAL >= 3000)

# 급여가 2000이상인 직원의 이름하고 입사날짜, 직책 조회 (emp 데이터프레임이 없어 삭제)
emp_sal2000 = subset(emp, SAL >= 2000, select = c(ENAME,JOB,SAL))

print(emp_sal2000) # 급여가 2000 이상인 직원조회

#  설치, 설치 후 주석처리 합시다. 
#  설치된 디플라이어를 스크립트창에 가져와야함
#로드(임포트)
#install.packages('dplyr')
library(dplyr) # 디플라이어 로드
### ***** 디플라이어 핵심문법
# 1. filter : 조건에 맞는 행 조회
# 2. select : 특정 컬럼(열) 선택
# 3. mutate : 새로운 컬럼 추가
# 4. arrange : 행 정렬
# 5. group by : 데이터 그룹화
# 6. summarise : 통계 계산 
# 7. join : 여러 데이터프레임 병합
# 8. slice : 특정 행 선택 

# 디플라이어(dplyr) : data frame plier(공구)
# 데이터프레임을 다루는 '공구'
# 대규모 데이터를 처리할 때 매우 빠른 속도를 제공합니다. 
# 실무에서 전처리 작업할 때 자주 사용됩니다. 

# filter
# 행을 조건에 따라 필터링
# 급여가 3000 이상인 직원 조회
high_salary = emp %>% filter(SAL >= 3000)
print(high_salary)
# 급여가 3000 이상이고 부서번호가 20번인 사원 조회
high_dept_salary = emp %>% filter(SAL >= 3000 & DEPTNO == 20)
print(high_dept_salary)
# 부서번호(DEPTNO)가 20번이고, 직책(JOB) 'MANAGER'인 사원 조회 
dept_manager = emp %>% filter(DEPTNO == 20 & JOB == "MANAGER")
print(dept_manager)

# 급여가 2000이하고, 부서번호가 20번인 사원 조회
low_dept_salary = emp %>% filter(SAL <= 2000 & DEPTNO == 20)
print(low_dept_salary)

# 위 문제에서 사원이름, 부서번호만 조회
 emp_20 = emp %>% filter(SAL < 2000 & DEPTNO == 20 ) %>% select(ENAME,DEPTNO)
 print(emp_20)
 
 # 직책(JOB)이 'SALESMAN'인 사원의 이름, 직책, 입사날짜 조회
 emp_manger = emp %>% filter(JOB == 'SALESMAN') %>%
   select(ENAME,JOB,HIREDATE)
 print(emp_manger)
 
 # mutate()
 # 새로운 컬럼(열) 추가
 # 급여와 커미션의 합계를 새로운 열을 만들어서 추가
 # TOTAL_COM : 새로운 열 이름
 # is.na : is(?), na값이야?
 
 emp_comm = emp %>% mutate(TOTAL_COM = SAL + 
                             ifelse(is.na(COMM),0,COMM))
 # ifelse(is.na(COMM),0,COMM) : 
 # comm이 na면 0을 아니라면 comm을
 
# View(emp_comm) 
 # arrage()
 # 정렬
 # 급여기준으로 오름차순
 sorted_by_sal = emp %>% arrange(SAL)
 print(sorted_by_sal)
 # 급여기준으로 내림차순
 sorted_by_sal = emp %>% arrange(desc(SAL))
 print(sorted_by_sal)
 
 # 문제 1. 직원 이름(ENAME), 직업(JOB), 그리고 부서 번호(DEPTNO) 열만 선택하세요.
 result1 <- emp %>% select(ENAME, JOB, DEPTNO)
 print("문제 1:")
 print(result1)
 
 # 문제 2. 급여(SAL)가 2000 이상인 직원만 필터링하세요.
 result2 <- emp %>% filter(SAL >= 2000)
 print("문제 2:")
 print(result2)
 
 # 문제 3. 급여(SAL)를 기준으로 내림차순으로 정렬하세요.
 result3 <- emp %>% arrange(desc(SAL))
 print("문제 3:")
 print(result3)
 
 # 문제 4. 부서 번호(DEPTNO)가 30인 직원 중, 이름(ENAME)과 급여(SAL)만 선택하고 급여 순으로 내림차순 정렬하세요.
 result4 <- emp %>% filter(DEPTNO == 30) %>% select(ENAME, SAL) %>% arrange(desc(SAL))
 print("문제 4:")
 print(result4)
 
 # 문제 5. 직업(JOB)이 "MANAGER"인 직원 중, 부서 번호(DEPTNO)와 급여(SAL)를 선택하고 급여 순으로 오름차순 정렬하세요.
 result5 <- emp %>% filter(JOB == "MANAGER") %>% select(DEPTNO, SAL) %>% arrange(SAL)
 print("문제 5:")
 print(result5)
 
 # 문제 6. 급여(SAL)가 1500 이상이고 부서 번호(DEPTNO)가 20인 직원의 이름(ENAME), 직업(JOB), 그리고 급여(SAL)를 선택한 뒤 이름 순으로 정렬(오름차순)하세요.
 result6 <- emp %>% filter(SAL >= 1500 & DEPTNO == 20) %>% select(ENAME, JOB, SAL) %>% arrange(ENAME)
 print("문제 6:")
 print(result6)
 
 # 문제 7. 직업(JOB)이 "SALESMAN"인 직원 중, 급여(SAL)가 1500 이상인 직원의 이름(ENAME), 급여(SAL), 부서 번호(DEPTNO)를 선택하고 급여 순으로 내림차순 정렬하세요.
 result7 <- emp %>% filter(JOB == "SALESMAN" & SAL >= 1500) %>% select(ENAME, SAL, DEPTNO) %>% arrange(desc(SAL))
 print("문제 7:")
 print(result7)
 
 # 문제 8. 부서 번호(DEPTNO)가 10 또는 30인 직원 중, 이름(ENAME), 직업(JOB), 급여(SAL)을 선택하고 이름 순으로 정렬하세요.
 result8 <- emp %>% filter(DEPTNO %in% c(10, 30)) %>% select(ENAME, JOB, SAL) %>% arrange(ENAME)
 print("문제 8:")
 print(result8)
 
 # 문제 9. mutate()를 사용하여 급여(SAL)에 보너스(COMM, NA는 0으로 간주)를 더한 총 급여(Total_Salary) 열을 추가하세요.
 result9 <- emp %>% mutate(Total_Salary = SAL + ifelse(is.na(COMM), 0, COMM))
 print("문제 9:")
 print(result9)
 
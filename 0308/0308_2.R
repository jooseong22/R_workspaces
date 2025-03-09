library(dplyr)  # 로드

emp = read.csv('emp.csv') #파일 불러오기
# group by + summarise
# group by(~로): 
# 특정 열(컬럼) 묶어 그룹화합니다. 
group_job = emp %>% group_by(JOB)
print(group_job)

# R에 group by는 summarise, mutate, filter 등의 기능과 함께
# 사용하여 그룹별로 계산을 진행합니다.

# 부서별(group_by) 평균(mean) 급여 계산
# summarise: 요약하다
dept_avg_sal = emp %>% 
  group_by(DEPTNO) %>%
  summarise(AVG_SAL = mean(SAL))
print(dept_avg_sal)

# 직업별 평균 급여 계산, 단 평균 급여 내림차순 정렬하시오.
job_avg_sal = emp %>% 
  group_by(JOB) %>%
  summarise(AVG_SAL = mean(SAL)) %>%
  arrange(desc(AVG_SAL)) #내림차순 정렬
print(job_avg_sal)

# 직업(JOB)별 직원 수 계산, 단 직원 수 내림차순 정렬
job_count = emp %>% 
  group_by(JOB) %>%
  summarise(EMP_COUNT = n()) %>% # n() : 행 개수
  arrange(desc(EMP_COUNT))
print(job_count)

# CSV 파일 2개 이용하기
emp = read.csv('emp.csv')
dept = read.csv('dept.csv') 
# 두 데이터프레임 병합하기
# 교집합 컬럼을 이용한 데이터 병합(JOIN)
# inner_join: 내부조인
emp_with_dept = emp %>% 
  inner_join(dept, by = "DEPTNO")
# View(emp_with_dept)

# 40번 부서인 운영팀도 출력하기
# left : 왼쪽
# dept %>% left_join : 왼쪽에 있는 데이터프레임 데이터를
# 모두 병합하겠다.
# *****left_join
emp_with_dept = dept %>% left_join(emp, by = "DEPTNO")
#View(emp_with_dept)

# full_join(합집합) 모두 다 병합
emp_full_joined = full_join(emp,dept,by = "DEPTNO")
#View(emp_full_joined)

# 근무지가 "DALLAS"인 직원들의 `이름` 출력하기
result = emp %>% # DALLAS라는 컬럼(열)이 없기에 조인부터
  inner_join(dept, by = "DEPTNO") %>%
  filter(LOC == "DALLAS") %>%
  select(ENAME, LOC)
print(result)

# Slice : 특정 위치 조회
result = emp %>% slice(2,4) #2행과 4행 출력
print(result)

result = emp %>% slice(1 : 5) #1행 부터 ~ 5행까지
print(result)
# 부서별(group by) 최대 연봉 사원 조회
# n : 행 , n = 1 => 행 1개만 
result = emp %>% group_by(DEPTNO) %>% slice_max(SAL, n = 1)
print(result)





\

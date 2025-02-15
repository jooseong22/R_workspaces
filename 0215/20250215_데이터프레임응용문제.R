emp = data.frame(
  EMPNO = c(7369, 7499, 7521, 7566, 7698, 7782, 7788, 7839, 7844, 7900),
  ENAME = c("SMITH", "ALLEN", "WARD", "JONES", "BLAKE", "CLARK", "SCOTT", "KING", "TURNER", "ADAMS"),
  JOB = c("CLERK", "SALESMAN", "SALESMAN", "MANAGER", "MANAGER", "MANAGER", "ANALYST", "PRESIDENT", "SALESMAN", "CLERK"),
  MGR = c(7902, 7698, 7698, 7839, 7839, 7839, 7566, NA, 7698, 7788),
  HIREDATE = as.Date(c("1980-12-17", "1981-02-20", "1981-02-22", 
                       "1981-04-02", "1981-05-01", "1981-06-09",
                       "1982-12-09", "1981-11-17", "1981-09-08",
                       "1983-01-12")),
  SAL = c(800, 1600, 1250, 2975, 2850, 2450, 3000, 5000, 1500, 1100),
  COMM = c(NA, 300, 500, NA, NA, NA, NA, NA, NA, NA),
  DEPTNO = c(20, 30, 30, 20, 30, 10, 20, 10, 30, 20)
)

# emp에 징계여부(DISCIPLINARY)라는 컬럼을 추가해주시고 boolean형으로 데이터를 넣어주세요.

emp$DISCIPLINARY <- c(TRUE, FALSE, FALSE, TRUE, FALSE,
                      FALSE, TRUE, FALSE, TRUE, FALSE)

# 결과 출력
print(emp)

# emp 데이터 프레임에서 JOB이 "MANAGER"인 직원들의 이름(ENAME)과 급여(SAL)를 출력하세요.

# JOB이 'MANAGER'인 직원들의 이름과 급여 조회
managers <- emp[emp$JOB == "MANAGER", c("ENAME", "SAL")]

# 결과 출력
print(managers)

# COMM 열에 NA가 아닌 값을 가진 직원들의 사번(EMPNO)과 부서번호(DEPTNO)를 출력하세요.

# COMM 열에 NA가 아닌 값을 가진 직원들의 사번(EMPNO)과 부서번호(DEPTNO) 조회
result <- emp[!is.na(emp$COMM), c("EMPNO", "DEPTNO")]

# 결과 출력
print(result)



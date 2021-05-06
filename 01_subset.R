# subset

## 인덱싱 연산자 $, [], [[]]


str(mtcars)
head(mtcars)

mtcars$mpg
mtcars[['mpg']] # 벡터 출력
mtcars['mpg'] # 데이터 프레임 출력 
mtcars[[1]] # 벡터출력 

mtcars[c(1, 4)]
mtcars[c('mpg', 'hp')]
mtcars[, 1:2]

mtcars[-c(2, 3, 5, 7:11)] # 제외
mtcars[-1] # 1열 제외

mtcars[1] <- NULL
mtcars # 1 삭제됨

# 행렬인덱싱은 벡터로 
str(iris)
class(iris)
head(iris)
class(iris[1:5, ]) # df
class(iris[, c("Sepal.Length", "Sepal.Width")]) # df
class(iris[, 1]) # "numeric", 하나만 뽑으면 벡터로 뽑힘 

class(iris[, 1, drop=F]) # df 유지하는법

iris[1] # 이러면 그냥 df 유지 해줌. (리스트 인덱싱)

iris[1:5, c('Sepal.Length', 'Sepal.Width')]


## 조건줘서 서브셋

iris[iris$Sepal.Length > 7, ]

iris[iris$Sepal.Length > 7, c('Sepal.Length', 'Sepal.Width')]

subset(iris, 
       subset = (Sepal.Length > 7),
       select = c('Sepal.Length', 'Sepal.Width'))


## 무작위 표본 추출 

sample(x=1:10, size = 5)
sample(x=10, size = 5)
sample(x=1:10, size = 5, replace = T) # 복원추출
sample(10)

sample(iris, 3) # 5열 중 3개 열 무작위 추출

## df에서 랜덤 행 추출
index <- sample(nrow(iris), 3) # 인덱스를 무작위 추출하는 방식으로
iris[index, ]


## 중복값 제거

duplicated(c(1, 2, 3, 1, 1, 4, 3)) # 처음 출현하는 값만 False로

id <- c('A1', 'A2', 'A6')
name <- c('kim', 'lee', 'park')
price <- c(1000, 2000, 3000)

product <- data.frame(id=id, name=name, price=price)
product

product <- rbind(product, c('A1', 'kim', 1000))
product <- rbind(product, c('A3', 'kim', 1000))
product

duplicated(product) # 하나의 행의 모든 열 요소가 기존과 동일해야 True

product[duplicated(product), ] # 중복 행 출력 
product[!duplicated(product), ] # 중복 안된 행 출력

which(duplicated(product)) # 중복 행 인덱스 출력
product[-which(duplicated(product)), ]

unique(product) # 중복 제거 출력


# 결측값 제거
str(airquality) 

complete.cases(airquality) # df의 각 행에 NA 있으면 False 리턴
airquality.rm.NA <- airquality[complete.cases(airquality), ]
str(airquality.rm.NA)










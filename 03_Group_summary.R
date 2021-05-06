
# 집단별 합산, 집단별 평균등
# split, unstack 함수

head(mtcars) # am = 변속기 유형

mtc <- within(mtcars,
              am <- factor(am,
                           levels = c(0, 1),
                           labels = c('Automatic',
                                      'Manual')))
head(mtc)

g <- split(x=mtc$mpg, f=mtc$am)
g # 리스트 형태로 리턴

g[[1]]

mean(g[[1]])
mean(g[["Manual"]])
sapply(g, mean)

unstack(data.frame(mtc$mpg, mtc$am)) # unstack은 df로 만들어 줘서 넣어줘야함

head(iris)
g2 <- unstack(data.frame(iris$Sepal.Length, iris$Species)) # 그룹에 맞는 데이터 수가 동일하면 df로 리턴해줌
summary(g2)



# 집단별 분할과 함수적용을 동시에 해보기
# tapply, aggregate, by 함수

head(iris)

tapply(iris$Sepal.Length, INDEX = iris$Species, 
       FUN = mean) # index에 넣어준 범주 별로 넣어준 벡터의 값을 FUN처리

tapply(iris$Sepal.Length, INDEX = iris$Species, 
       FUN = length)

tapply(iris$Sepal.Length, INDEX = iris$Species, 
       FUN = sd)

## 응용: 교차표 생성성
with(mtcars, tapply(mpg, list(cyl, am), FUN = mean))  # 여러 범주 넣어줄때는 list로 묶어서 넣어줘야 함.
with(mtcars, tapply(mpg, list(Cyl=cyl, Trans=am), FUN = mean))



# aggregate로 두 범주 그룹화 하면 tapply에서 교차표로 뜬것과 다르게 
# df형태로 리턴해줌

a = with(mtcars, aggregate(x=mpg, by=list(Cyl=cyl, Trans=am), FUN=mean))
class(a)

head(mtcars)

aggregate(mtcars[c(1:6)], list(Gr.cyl=mtcars$cyl, Gr.am=mtcars$am), 
          FUN = mean) # df를 받을수도 있다.

aggregate(iris[1:4], list(Spec=iris$Species), FUN = mean) # by인자에는 하나일때도 list로 묶어서 넣어줘야 함



# by함수는 dataframe을 통째로 받을수 있다

by(data=iris, INDICES = iris$Species, FUN = summary) 

by(iris, iris$Species, FUN = function(x){mean(x$Sepal.Length)})

table(mtcars$gear) # 범주데이터 주면 범주별 빈도 출력
table(am=mtcars$am, gear=mtcars$gear)


# 연속형 변수를 구간으로 나눠서 범주형으로 만든 후 테이블 적용
mpg.cut <- cut(mtcars$mpg, breaks = 5) 
table(mpg.cut)






















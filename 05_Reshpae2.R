

# wide format, long format
# wide format은 record
# long format은 변수 목록 열과 값 열로 구성 
# long format은 primary key가 두번 등장할 수 있으나, 데이터 무결성은 유지된다.

# 변수의 갯수가 많을때에도 long format은 pk, 변수type, value 세개로 표현가능

# 함수마다 들어가는 포맷이 다를 수 있음.
# SPSS -> wide format, R -> long format 빈번 (ggplot2)

# melt(w -> l), dcast(l -> w) 함수


library(reshape2)

smiths # wide format


# wide -> long

smith.long <- melt(data = smiths)
?melt

smith.long <- melt(data = smiths,
                   id.vars='subject') # 식별자 명시적 지정
smith.long

smith.long <- melt(data = smiths,
                   id.vars = 'subject',
                   measure.vars = c(2:5)) # 측정값 명시적 지정
smith.long

smith.long <- melt(data = smiths,
                   id.vars = 'subject',
                   measure.vars = c('time', 'age', 'weight', 'height')) # 측정값 명시적 지정
smith.long



smith.long <- melt(data = smiths,
                   id.vars = 'subject',
                   measure.vars = c('time', 'age', 'weight', 'height'),
                   variable.name = "myVar", # 열 이름 정의
                   value.name = "myVal") # 열 이름 정의
smith.long




# long -> wide

?dcast()
dcast(data=smith.long, formula = subject ~ myVar)

dcast(data=smith.long, formula = subject ~ myVar,
      value.var = 'myVal')


head(airquality)

aq.long <- melt(airquality, 
                id.vars = c('Month', 'Day'))
aq.long

dcast(aq.long, formula = Month + Day ~ variable,
      value.var = 'value')


dcast(aq.long, formula = Month ~ variable,
      value.var = 'value',
      fun.aggregate = mean, na.rm=T)


























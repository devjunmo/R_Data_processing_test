
# 형태변환 2 - tidyr
# reshape 기능을 df에만 사용하게 하는 대신, 퍼포먼스 올리고 간단한 사용법 제공

# gather(): wide -> long // spread(): long -> wide

library(tidyr)

head(airquality)



# wide -> long

?gather

aq.long <- gather(airquality,
                  key=myFactor,
                  value = myMesurement,
                  Ozone:Temp) # 여기다 쓴것아 variable 값에 들어가고, 안쓴것은 식별자로 들어감.
aq.long

aq.long <- gather(airquality,
                  key=myFactor,
                  value = myMesurement,
                  Ozone,Temp) # 여기다 쓴것아 variable 값에 들어가고, 안쓴것은 식별자로 들어감.
aq.long

aq.long <- gather(airquality,
                  key=myFactor,
                  value = myMesurement,
                  -Month, -Day) # 식별자를 뺌으로써 지정해도 됨.
aq.long



airquality %>% gather(myFactor, myMesurement, Ozone:Temp)



# long -> wide

aq.long %>% spread(key=myFactor, value=myMesurement)





# separate / unite 함수


head(iris)
iris.long <- gather(iris, myElement, myMesurement, 
                    -Species)
head(iris.long)

?separate

iris.sep <- separate(data=iris.long,
                     col=myElement,
                     into=c('part', 'Measures')) # sep 기본 값 = 숫자와 알파벳이 아닌 값

head(iris.sep)


?unite

iris.unite <- unite(iris.sep,
                    col=myFactors,
                    part, Measures,
                    sep='_')
head(iris.unite)








































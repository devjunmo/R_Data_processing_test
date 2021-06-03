
# dplyr 패키지 -> 분할, 적용, 결합

# 5가지 기본함수 
# arrange = 지정한 열기준 소팅
# filter = 조건에 맞는 행 출력  
# select = 원하는 열 추출
# rename = 열 이름 바꾸기
# mutate = 새로운 열 추가
# summaries = 요약통계량

# n_distict = unique함수 기능
# sample_n / sample_frac = 샘플링

# group_by = 확장 데이터프레임화
# %>% = 파이프 연산자, 첫 파라미터에 아웃풋을 전달

head(airquality)

library(dplyr)

air.6 <- filter(airquality, Month==6) # 조건에 맞는 행출력
air.6
airquality[airquality$Month==6, ]
subset(airquality, subset = (Month==6))


air.and <- filter(airquality, Month==6 & Temp > 90) # 조건에 맞는 행출력
air.and

air.or <- filter(airquality, Month==6 | Temp > 90)
air.or



slice(airquality, 6:10) # 특정 행번호 추출
slice(airquality, n()) # 마지막 행 출력
slice(airquality, (n()-4):n()) # tail같은 효과 응용

# 지정한 열기준 오름차순 소팅
arrange(airquality, Temp, Month, Day) # Temp에서 동률뜨면 Month, Day순으로 결정정

arrange(airquality, desc(Temp), Month, Day) # Temp는 내림차순, 동률일대 Month, Day는 오름차순순




# 원하는 열을 추출 = select
head(airquality)
select(airquality, Month, Day, Temp)

select(airquality, Temp:Day) # 인접 열일때
select(airquality, -(Temp:Day)) # 


air <- select(airquality, Solar=Solar.R)
head(air)

# 참고) 열이름 바꾸기는 rename함수 사용
air <- rename(airquality, Solar=Solar.R)
head(air)

distinct(select(airquality, Month)) # 월이 뭐가있는지 확인할때




# 새로운 열 추가할때 mutate

air <- mutate(airquality, 
       Temp.C=(Temp-32)/1.8,
       Diff=Temp.C-mean(Temp.C))

head(air)

transform(airquality, 
          Temp.C=(Temp-32)/1.8,
          Diff=Temp.C-mean(Temp.C)) # 에러 Temp.C를 만들면서 동시에 사용하는것은 transform함수에서는 불가

air <- transform(airquality, 
          Temp.C=(Temp-32)/1.8)
head(air)



# 요약통계량 summarise

summarise(airquality,
          Mean=mean(Temp, na.rm=T),
          Median=median(Temp, na.rm=T),
          SD=sd(Temp, na.rm=T),
          MAX=max(Temp, na.rm=T),
          MIN=min(Temp, na.rm=T),
          N=n(),
          Distinct.Month=n_distinct(Month),
          First=first(Month),
          Last=last(Month))



# 그밖에 유용한 함수

## 무작위 행추출
sample_n(airquality, 5) # 지정된 갯수만큼 무작위 추출
sample_frac(airquality, 0.05) # 지정된 비율만큼 무작위 추출
sample_frac(airquality, 0.05, replace = T) # 복원추출


## group_by 함수 ★★★

grp.air <- group_by(airquality, Month) # Month레벨별로 그룹화된 데이터프레임 생성

class(grp.air) #"grouped_df" "tbl_df" "tbl" "data.frame"(df 확장판)

summarise(grp.air, Mean.Temp=mean(Temp, na.rm=T)) # 자동으로 그룹화 시켜서 출력

summarise(grp.air, 
          Mean.Temp=mean(Temp, na.rm=T),
          SD.Temp=sd(Temp, na.rm = T),
          Days=n() # 월별로 행의갯수 출력
          )



# 파이프 연산자 %>% -> 첫번째 인수로 df을 받는 함수들한테 유용

iris %>% head
1:10 %>% mean

# 매 단계마다 생성된 임시df이 다음 단계의 인풋으로 들어감
a1 <- select(airquality, Ozone, Temp, Month)
a1
a2 <- group_by(a1, Month)
a2
a3 <- summarise(a2,
                Mean.Ozone=mean(Ozone, na.rm=T),
                Mean.Temp=mean(Temp, na.rm=T))
a3
a4 <- filter(a3, Mean.Ozone>40 | Mean.Temp>80)
a4


air <- airquality %>% 
  select(Ozone, Temp, Month) %>% 
  group_by(Month) %>%
  summarise(Mean.Ozone=mean(Ozone, na.rm=T), Mean.Temp=mean(Temp, na.rm=T)) %>%
  filter(Mean.Ozone>40 | Mean.Temp>80)
air




















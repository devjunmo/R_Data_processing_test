
library(tibble)

# data.frame()
# tibble()

v1 <- c('a001', 'a002', 'a003')
v2 <- c('mouse', 'keyboard', 'usb')
v3 <- c(3000, 4000, 5000)

product <- tibble(id=v1, name=v2, price=v3)
str(product)
class(product) # "tbl_df"     "tbl"        "data.frame"
product


# 작은 규모의 데이터셋 만들기 / 직관적으로 생성

tribble_df <- tribble(
  ~id, ~name, ~price,
  'a001', 'mouse', 3000,
  'a002', 'keyboard', 4000,
  'a003', 'usb', 5000
)
tribble_df


# 리스트 형태

tb <- tibble(id=c(1, 2, 3),
             data=list(tibble(x=1, y=2),
                       tibble(x=4:5, y=6:7),
                       tibble(x=10)))

tb # 티블 데이터 프레임인데, data열의 데이터가 리스트형태로 들어가있음
tb$data # 3개의 원소를 갖는 리스트 구조이고, 각 원소는 티블 데이터프레임이 들어있음

tb$data[[1]] # 티블 df 추출
tb$data[[2]] # 티블 df 추출
tb$data[[3]] # 티블 df 추출



# df -> tibble_Df 변환

str(iris)
head(iris)
as_tibble(iris)

library(Lahman)

str(Batting)
head(Batting)
batt.tb <- as_tibble(Batting)
batt.tb

print(batt.tb, n=20) # 출력 행 갯수 지정
print(batt.tb, n=3, width = Inf) # 모든 열 출력
class(batt.tb) # "tbl_df"     "tbl"        "data.frame"
batt.df <- as.data.frame(batt.tb)
class(batt.df) #  "data.frame"
























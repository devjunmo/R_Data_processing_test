
# 각 원소에 동일하게 반복처리

# apply / lapply / sapply / mapply

?apply

x <- matrix(1:20, 4, 5)
x

## 각 행에 대하여 최대값 출력 
apply(x, MARGIN = 1, FUN = max) # MARGIN=1: 행별

## 열별 최소값 출력 
apply(x, MARGIN = 2, FUN = min) # MARGIN=2: 열별

x[,2]

apply(x[,2], FUN = max)


y <- array(1:24, c(4, 3, 2))
y

apply(y, 1, paste, collapse=',') # y배열에서 첫 차원(모든 행에 대해)을 추출해서 paste함수에 넘겨준다
### 작동방식은 아래와 같음 ###
a <- c(1, 5, 9, 13, 17, 21)
paste(a)
paste(a, collapse = ',')
##############################

apply(y, 2, paste, collapse=',')
apply(y, 3, paste, collapse=',')

apply(y, c(1, 2), paste, collapse=',')


Titanic
str(Titanic)
# 차원은 1: Class 2:Sex 3:Age 4:Survived

apply(Titanic, 1, sum) # 승객 등급별 탑승 인원수
apply(Titanic, 'Class', sum)

apply(Titanic, 4, sum) # 생존자, 사망자 수
apply(Titanic, 'Survived', sum)

apply(Titanic, c(1, 4), sum) # 교차표 생성



# lapply / sapply
# 리스트를 받아서 함수를 반복지정
# l은 출력을 리스트로, s는 출력을 벡터나 행렬, 리스트로 적절히 리턴
lapply()
sapply()

## 리스트는 배열의 배열이다

exams <- list(s20=c(78, 89, 91, 85, 95, 98),
              s21=c(85, 86, 97, 99, 90),
              s22=c(98, 96, 89, 90, 93, 85, 92),
              s23=c(98, 96, 91, 88, 93, 99))

exams

lapply(exams, length) # 각 배열당 length함수 적용
sapply(exams, length) # 벡터형태로 단순화 시켜 출력

lapply(exams, mean)
sapply(exams, sd)

sapply(exams, range) #각 원소당 최소값, 최댓값을 행렬형태로 단순화 시켜 출력


head(iris)
lapply(iris, class) # 데이터프레임의 각 '열'을 순회하며 함수 적용



sapply(iris, mean) # 경고메세지 출력

# iris의 5개의 컬럼이 function의 x로 들어가고, 
# body는 ifelse로.. 
# 람다함수느낌
sapply(iris, function(x) ifelse(is.numeric(x), mean(x), NA)) 




# mapply: 데이터셋을 여러개 받아줌

mapply(rep, 1:4, 4:1) # 1 2 3 4 , 4 3 2 1에서, 1,4 / 2,3 / 3,2 / 4,1이 차례로 rep함수에 들어간다


















































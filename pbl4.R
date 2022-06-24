#전처리한 당진 데이터
dangjin_obs_data <- read.csv("./dangjin_obs.csv", header=F, na.strings=c(""))
dangjin_fcst_data <- read.csv("./dangjin_fcst.csv", header=F, na.strings=c(""))
energy <- read.csv("./energy.csv", header=F, na.strings=c(""))
site_info <- read.csv("./site_info.csv", header=F, na.strings=c(""))

forecast_time<-dangjin_fcst_data[2:26305,1]
Temperature<-dangjin_fcst_data[2:26305,2]
Humidity <-dangjin_fcst_data[2:26305,3]
WindSpeed<-dangjin_fcst_data[2:26305,4]
WindDirection<-dangjin_fcst_data[2:26305,5]
Cloud<-dangjin_fcst_data[2:26305,6]

mode(Temperature) <- "numeric"
mode(Humidity) <- "numeric"
mode(WindSpeed) <- "numeric"
mode(WindDirection) <- "numeric"
mode(Cloud) <- "numeric"

dangjin_fcst<- data.frame(forecast_time,Temperature,Humidity,WindSpeed,WindDirection,Cloud)
dangjin_fcst

일시 <-dangjin_obs_data[3:25633,1]
기온 <-dangjin_obs_data[3:25633,2]
풍속<-dangjin_obs_data[3:25633,3]
풍향 <-dangjin_obs_data[3:25633,4]
습도 <-dangjin_obs_data[3:25633,5]
전운량 <-dangjin_obs_data[3:25633,6]

#형변환
mode(기온) <- "numeric"
mode(습도) <- "numeric"
mode(풍속) <- "numeric"
mode(풍향) <- "numeric"
mode(전운량) <- "numeric"

dangjin_obs <- data.frame(일시, 기온, 풍속, 풍향, 습도, 전운량)
dangjin_obs

time <- energy[2:25632, 1]
dangjin_floating <- energy[2:25632, 2]
dangjin_warehouse <- energy[2:25632, 3]
dangjin <- energy[2:25632, 4]

mode(dangjin_floating) <- "numeric"
mode(dangjin_warehouse) <- "numeric"
mode(dangjin) <- "numeric"

energy <-data.frame(time, dangjin_floating, dangjin_warehouse, dangjin)
energy

mean(dangjin_floating, na.rm = T)
mean(dangjin_warehouse, na.rm = T)
mean(dangjin, na.rm = T)

dangjin_floating <- ifelse(is.na(dangjin_floating),122.0611, dangjin_floating)
dangjin_warehouse <- ifelse(is.na(dangjin_warehouse),92.48027, dangjin_warehouse)
dangjin <- ifelse(is.na(dangjin),139.6587, dangjin)

table(is.na(energy))
table(is.na(dangjin_fcst))
table(is.na(dangjin_obs))

dangjin_data <- data.frame(일시, 기온, 풍속, 풍향, 습도, 전운량, dangjin_floating, dangjin_warehouse, dangjin)
dangjin_data
table(is.na(dangjin_data))

# train / test 나누기
sample = sample(1:nrow(dangjin_data), size = round(0.2 * nrow(dangjin_data)))
nrow(dangjin_data)
test = dangjin_data[sample, ]
train = dangjin_data[-sample, ]
nrow(test)
nrow(train)

# filltering
summary(test)
cor(test)
lm.fit = lm(dangjin~기온+풍속+풍향+습도+전운량, data= train)
summary(lm.fit)
coef(lm.fit)
summary(lm.fit)$coef

lm.fit2 = update(lm.fit, .~.-풍향)
summary(lm.fit2)

# baseline
#anova(lm.fit, lm.fit2)

pred = predict(lm.fit , test)
cor(pred, test$dangjin) #72%
lm.probs = predict(lm.fit, type = "response")
lm.probs
library(forecast)
accuracy(lm.fit)

#knn
library(class)
pred_1 <- knn(train[,c(2,3,4,5,6)], test[,c(2,3,4,5,6)],train[,7], k=2, prob = TRUE)

table(train$dangjin_floating)
table(train)
#labeling결과, 가장 가까운 5개에 대한 관측치 번호, 그에 따른 거리
knn(train=train[,c(2:6)], test=test[,c(2:6)], cl=train$dangjin, k=5, 
    prob = FALSE, algorithm = c("kd_tree"))
#훈련 데이터셋에 대해 cross validation을 해준 결과 출력
knn.cv(train=train[,c(2:6)], cl=train$dangjin, k=5, 
    prob = FALSE, algorithm = c("kd_tree"))

md05 <- knn(train=train[,c(2:6)], test=test[,c(2:6)], cl=train$dangjin, k=5, 
            prob = FALSE, algorithm = c("kd_tree"))
table(md05)
mean(md05==testLabels)


idx <- sample(x = c("train","valid","test"),
              size = nrow(data),
              replace = TRUE,
              prob= c(3, 1, 1))
train <- data[idx == "train", ] 
valid <- data[idx == "valid", ] 
test <- data[idx == "test", ]
library(scales)
train_x <- train[,-6]
valid_x <- valid[,-6]
test_x <- test[,-6]
train_y <- train[,6]
valid_y <- valid[,6]
test_y <- test[,6]
#k=1
knn_100 <- knn(train = train_x,
             test = valid_x,
             cl = train_y,
             k = 100)
#traiin 산점도
plot(formula = 기온 ~ 풍속, 
     data = train, 
     col = alpha(c("red","black","purple", "blue", "green"), 0.7)
     [train$dangjin], main = "KNN (k = 1)")
#knn valid 결과 표시하기
plot(formula = 기온 ~ 풍속, 
     data = valid,
     pch = 17,
     cex = 1.2,
     col = alpha(c("red","black","purple", "blue", "green"), 0.7)
     [train$dangjin])
legend("topright",
       c(paste("train", levels(train$dangjin)),
         paste("valid", levels(valid$dangjin))),
       pch = c(rep(1, 6), rep(17,6)),
       col = c(rep(alpha(c("red","black","purple", "blue", "green"), 0.7),2)),
       cex = 0.9)
dim(data)
str(data)
data <- data.frame(기온, 풍속, 풍향, 습도, 전운량, dangjin)
t_index <- sample(1:nrow(data), size=nrow(data)*0.7)
train <- data[t_index,]
test <- data[-t_index,]
xmat.train <- model.matrix(dangjin ~ 기온+풍속+풍향+습도+전운량, data=train)[,-6]
dangjin.train <- train$dangjin
xmat.test <- model.matrix(dangjin ~ 기온+풍속+풍향+습도+전운량, data=test)[,-6]

library(FNN)     # KNN 패키지
library(ROSE)
library(e1071)   # SVM 분석 패키지
library(Epi)     # ROC, AUC
library(class)
tune.out <- tune.knn(x=xmat.train, y=as.factor(dangjin.train), k=1:6)
tune.out
yhat_test <- knn.reg(xmat.train, xmat.test, dangjin.train, k=6)
mse <- mean((yhat_test$pred - test$dangjin)^2)
mse

library(caret)
treemod <- tree(dangjin~.,data=train)
plot(treemod)
text(treemod,pretty=0)
cv.tree = cv.tree(treemod)
plot(cv.tree$size,cv.tree$dev,type='b')
prune.tree = prune.tree(treemod, best=9)
plot(prune.tree)
text(prune.tree,pretty=0)
yhat = predict(treemod, newdata = dangjin)
dangjin.test=test$dangjin
plot(yhat,dangjin.test)
mean((yhat-dangjin.test)^2)
sqrt(23502.67)
mean(dangjin)
summary(dangjin)
dangjin

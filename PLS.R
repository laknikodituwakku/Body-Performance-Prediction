trainData = read.csv("training_data2.csv")
summary(trainData)

library(mdatools)
trainDataP = subset(trainData, select = -c(performance,age_dist,BMI))
head(trainDataP)
xc = trainDataP[-9]
head(xc)
yc = trainDataP[9]

ModelPLS = pls(xc, yc, scale = TRUE, cv=5, info = "body performance prediction")
summary(ModelPLS)
plot(ModelPLS)
plotXScores(ModelPLS,show.label = F)
plotXYLoadings(ModelPLS,show.label = TRUE)
plotVIPScores(ModelPLS,ncomp = 3, type = "h",show.label = TRUE)
summary(ModelPLS$coeffs)
plot(ModelPLS$coeffs,show.label = TRUE)

#This dataset contains the medical records of 299 patients who had 
#heart failure, where each patient profile has 12 clinical features.
#This case study attempts to determine the probability of dying 
#within 12 months of suffering heart failures. 
#We try to determine whether or not 11 regressors determine the 
#probabilities cause death within twelve months of heart failure. 


# age: age of the patient (years)
# anaemia: decrease of red blood cells or hemoglobin (boolean)
# high blood pressure: if the patient has hypertension (boolean)
# creatinine phosphokinase (CPK): level of the CPK enzyme in the blood (mcg/L)
# diabetes: if the patient has diabetes (boolean)
# ejection fraction: percentage of blood leaving the heart at each contraction (percentage)
# platelets: platelets in the blood (kiloplatelets/mL)
# sex: woman or man (binary)
# serum creatinine: level of serum creatinine in the blood (mg/dL)
# serum sodium: level of serum sodium in the blood (mEq/L)
# smoking: if the patient smokes or not (boolean)
# [target] death event: if the patient deceased within one year after having heart failure (boolean)



#install packages and libraries in R for data importation,analysis, 
#manipulation, and visualization

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(ggplot2)



#retrieve the heart failure patients data
heart_failure <- read.csv(
  "C:\\Users\\Abdul\\Desktop\\DataAnalysis22\\Portfolio\\Regression_Example_R\\heart_failure_clinical_records_dataset.csv",
  stringsAsFactors = FALSE)



#set heart_failure object as a data frame
as.data.frame(heart_failure)



#check data structure types
str(heart_failure)



#re-assign column headers

colnames(heart_failure) <- c(
                              "age" , "gender" ,"cardiac.death" ,  
                              "smoker" , "diabetes" , "hi.blood.press" , 
                              "cpk.enzyme.blood" ,
                              "blood.pumped.out", "platelets" ,  
                              "serum.sodium" , "serum.creatinine"
)



#re-assign boolean values to factor types

heart_failure$cardiac.death<-as.factor(heart_failure$cardiac.death)
heart_failure$gender<-as.factor(heart_failure$gender)
heart_failure$smoker<-as.factor(heart_failure$smoker)
heart_failure$diabetes<-as.factor(heart_failure$diabetes)
heart_failure$hi.blood.press<-as.factor(heart_failure$hi.blood.press)


#change the boolean values under gender to male and female
heart_failure$gender<-ifelse(test=heart_failure$gender == 0, no ="Female", yes ="Male")

#assign factor type to the gender column after changes
heart_failure$gender<-as.factor(heart_failure$gender)


#check data structure types again
str(heart_failure)


#look at data frame's first six rows to see how the changes look
head(heart_failure)



#predict cardiac.death using gender only
logistic.regression <- glm(cardiac.death ~ gender, data=heart_failure, family="binomial")

#use summary() function to get details about the logistic regression
summary(logistic.regression)


#the log(odds) of a woman dying within 12 months of heart failure are -0.75567. 

#The log(odds) ratio of a man dying of heart failure divided by the log(odds) that 
#a woman would die within 12 months of heart failure is -0.73632 for a man. 

#This number indicates that these these two odds are to close to one another, and that gender 
#is not a regressor that determines death within 12 months of heart failure

#The p-values also shows that both the log(odds) is statistically
#significant, but the log(odds)-ratio is not statistically significant.
#Again, this suggests that gender will not effect the probability of 
#death within 12 months of a heart failure




#predict cardiac.death using all variables(i.e regressors)
logistic.regression <- glm(cardiac.death ~ ., data=heart_failure, family="binomial")

#use summary() function to get details about the logistic regression
summary(logistic.regression)




#find the percent causation between the regressors and the dependent value, as well as 
#the probability that this logistic regression is correct given the data being used
#The following calculations of r-squared value and the p-value will give us this certainty

lr.null <- logistic.regression$null.deviance/-2
lr.proposed <- logistic.regression$deviance/-2
(lr.null-lr.proposed)/lr.null
1-pchisq(2*(lr.proposed- lr.null), df=length(logistic.regression$coefficients)-1)


#The probability value is very low 7.438494e-13, indicating that the regressors 
#used in this study are significant when determining death
#within 12 months of heart failure 

#There is a 21.0813% causality between the 11 regressors and the 
#dependent value of death. I believe it is safe to reject any regressors
#that have produced high p-values

#The regressors with low p-values indicate that within 12 months of heart failure,
#the determining factors in the probability of dying are age, the ability 
#the heart to pump blood after a heart failure, the amount of blood 
#platelets in the blood stream when the heart is pumping, the amount
#serum creatinine and serum sodium in the blood stream.





#to draw a logistics graph, create a new data.frame that contains the probabilities of 
#dying within 12 months after having heart failure 

predicted.cardiac.death<- data.frame(
  probability.of.cardiac.death= logistic.regression$fitted.values,
  cardiac.death=heart_failure$cardiac.death
)

#sort the predicted probabilities data frame from low to high probabilities
predicted.cardiac.death<-predicted.cardiac.death[order(predicted.cardiac.death$probability.of.cardiac.death, decreasing=FALSE),]

#add a new column to the data frame that has therank of each sample
predicted.cardiac.death$rank <- 1:nrow(predicted.cardiac.death)


#plot the logistic regression curve
ggplot(data=predicted.cardiac.death, aes(x=rank, y=probability.of.cardiac.death))+
  geom_point(aes(color=cardiac.death), alpha=1, stroke=2)+
  xlab("Index") +
  ylab("Predicted probability of death 12 months within surviving heart failure")



ggsave("heart_failure.pdf")





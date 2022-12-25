# Logistic-Regression

**Case Study: Aftermath of Surviving Heart Failure**

This dataset contains the medical records of 299 patients who had 
heart failure, where each patient profile has 12 clinical features.
This case study attempts to determine the probability of dying 
within 12 months of suffering heart failure. We try to make this 
determination using 11 of the clinical freatures(i.e regressors) which 
were measured and recorded after the patients survived a heart faiure. 

**Findings**

The probability value (p-value) is very low at 7.438494e-13, indicating that the regressors 
used in this study are significant when determining death within 12 months of heart failure.

There is, however, a 21.0813% causality between the 11 regressors and the dependent value of
death(after surviving a heartfailure). I believe this low R-squared value means that it is 
safe to reject any individual regressors that have produced high p-values (igher than 0.05).

The regressors with low p-values indicate that within 12 months of surviving heart failure,
the determining factors in the probability of the survivor dying are: 
  - age in years, 
  - the ability of the heart to pump blood after surviving a heart failure, 
  - the amount of blood platelets in the blood stream when the heart is pumping,
  - creatinine_phosphokinase levels in the blood stream,
  - the amount of serum creatinine in the blood stream,
  - and the amount of serum sodium in the blood stream.
  
 The rejected regressors that have low p-values, are at the root of the low R-squared vale are. 
 They have low causal effect on the death of a survivor of heart failure within the 12 months 
 that follow. These are the rejected clinical freatures(i.e regressors):
  -smoking
  -diabetes
  -high blood pressure
  -gender
  
  The logistic regression analysis findings suggest that probability probability of dying 
within 12 months of suffering heart failure comes down to the heart's ability to continue 
performing it's basic function, regardless of the cause of it's initial failure. 

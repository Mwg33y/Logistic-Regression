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
  - and the amount of serum sodium in the blood stream.
  
  
 Lower serum sodium is associated with increased short-term mortality in hospitalized patients 
 with worsening heart failure. A serum sodium level below 136 mEq/ml one of the most common biochemical 
 disorders featured in heart failure patients. In this study 100 patients have a serum sodium level 
 below 136 mEq/ml, and 97 participants in this study have died within 12 months of heart failure.
 
 A normal heart pumps blood out of its left ventricle at about 50 to 70 percent ejection fraction rate. A low 
 ejection fraction number can be an indicator of heart failure. An ejection fraction below 40 percent 
 means your heart isn't pumping enough blood and may be failing. 182 people were below 40% ejection fraction 
 rate, their average age was 60.3 years old, and 40% of them have died.
 
 97 participants in this study have died, and their average age was 65.2 years old. The average age of those 
 with low serum sodium in their blood stream was 63.7. 203 participants did not 
 die, and their average age was 58.8 years old. Those that died are, on average, older than those who did not.
 
 
 The rejected regressors that have low p-values, are at the root of the low R-squared vale are. 
 They have low causal effect on the death of a survivor of heart failure within the 12 months 
 that follow. These are the rejected clinical freatures(i.e regressors):
  - smoking
  - diabetes
  - high blood pressure
  - gender
  - the amount of blood platelets in the blood stream when the heart is pumping,
  - creatinine_phosphokinase levels in the blood stream,
  - the amount of serum creatinine in the blood stream,
  
  The logistic regression analysis findings suggest that the probability of dying 
within 12 months of suffering heart failure comes down to the heart's ability and strength to continue 
performing it's basic function, regardless of the cause of it's initial failure. Some heart failures 
are more severe than others, and some hearts are too old/weak to continue functioning.

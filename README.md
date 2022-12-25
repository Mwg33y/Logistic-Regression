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
  - age in years 
  - the ability of the heart to pump blood after surviving a heart failure 
  - and the amount of serum sodium in the blood stream
  
  
 Lower serum sodium is associated with increased short-term mortality in hospitalized patients 
 with worsening heart failure. A serum sodium level below 136 mEq/ml one of the most common biochemical 
 disorders featured in heart failure patients. In this study, 100 patients had a serum sodium level 
 below 136 mEq/ml.
 
 A normal heart pumps blood out of its left ventricle at about 50 to 70 percent ejection fraction rate. An 
 ejection fraction below 40 percent means your heart isn't pumping enough blood and may be an indicator 
 of heart failure within a three year period. In this study, 182 out of 299 patients were below 40% ejection 
 fraction rate.
 
 97 patients in this study have died, and their average age was 65.2 years old. There were 202 participants 
 that did not die, and their average age was 58.8 years old. 
 
 
 The rejected regressors that have low p-values, are at the root of the low R-squared vale are. 
 They have low causal effect on the death of a survivor of heart failure within the 12 months 
 that follow. These are the rejected clinical freatures(i.e regressors):
  - smoking
  - diabetes
  - high blood pressure
  - gender
  - the amount of blood platelets in the blood stream when the heart is pumping
  - creatinine_phosphokinase levels in the blood stream
  - the amount of serum creatinine in the blood stream
  
  When the rejected vaules are excluded, the R-squared values for the logistic regression drops down to 18.67%. The 
 rejected regressors only slight improve the r-squared value by 3%. Meaning they only 3% of the probability of the death 
 of a heart failure survivor.
 
 **Conclusion**
 
  The logistic regression analysis findings suggest that the probability of dying within 12 months of suffering 
heart failure comes down to the heart's ability and strength to continue performing it's basic function, with little 
regard to some of the causes (i.e rejected regressors) of it's initial failure. The following are some observations of
the patients in relation to signifcant/highly causal regressors (serum sodium, ejection rate, age):

        - Average age statistics of patients in relation to regressors within 12 months of heart failure
            - 97% of patients with serum sodium levels below 136 mEq/ml died, 3% did not die
	                - 67.6 years old for deceased
	                - 60.1 years old for living
            - 40% of patients with an ejection fraction rate below 40% have died, 60% did not die
                  - 63.7 years old for deceased
	                - 58 years old for living
            - The average age of patients that died was 65.2 years old. 
            - The average age of patients that did not die was 58.8 years old.


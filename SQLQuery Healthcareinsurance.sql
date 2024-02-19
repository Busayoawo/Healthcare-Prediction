select * from [dbo].[HealthcareInsurance]

--Calculate the average `bmi` and compare it between `male` and `female` groups
select sex, AVG(bmi) as AverageBmi
from [dbo].[HealthcareInsurance ]
group by sex

--Group the data by `region` and
--calculate the average number of `children` in each region.
Select region, AVG(children) as Average_children
from[dbo].[HealthcareInsurance ]
group by region

--Identify all records where `smoker` is 'yes' and `age` is less than 30.
Select *
from [dbo].[HealthcareInsurance ]
where smoker = 'yes'
and age < '30'

--: Compute the average `charges` for `smokers` versus `non-smokers`.: 
select smoker, AVG(charges) as Average_smoker
from [dbo].[HealthcareInsurance ]
group by smoker

--Determine if there's a correlation between `bmi` and `charges`. ****
--Does a higher BMI result in higher insurance charges?
select bmi,charges as correlationCheck
from [dbo].[HealthcareInsurance ]

---Analyze how `smoker` status and `bmi` together influence insurance `charges`.
Select 
---Create a new column `bmi_category` based on BMI: 
--'Underweight', 'Normal', 'Overweight', and 'Obese'.
Select *,
 case  WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi >= 18.5 AND bmi < 25 THEN 'Normal'
        WHEN bmi >= 25 AND bmi < 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS NewBmi_category
FROM[dbo].[HealthcareInsurance ]
    
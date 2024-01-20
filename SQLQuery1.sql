
select * from [dbo].[bank-direct-marketing-campaigns]

-- Jobs and total campaign 
select (job),count (job) as no_jobs,sum(campaign) as total_campaign
from [dbo].[bank-direct-marketing-campaigns]
group by job
order by no_jobs desc

-- pdays 
select pdays,count(pdays) as no_pdays
from [dbo].[bank-direct-marketing-campaigns]
group by pdays
order by no_pdays desc

--Jobs and pdays 
select (job),count (job) as no_jobs,sum(campaign) as total_campaign,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by job,campaign,poutcome
order by no_jobs desc

-- Group jobs and poutcome failure 
select (job), count(job) as no_jobs,sum(campaign) as total_campaign,count(pdays) as no_pdays , count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where poutcome='failure'
group by job
order by no_jobs desc

--Education count 
select education,count(education) as no_education
from [dbo].[bank-direct-marketing-campaigns]
group by education
order by no_education desc

--Education and campaing 
select (education), count(education) as no_education,sum(campaign) as total_campaign,pdays,count(pdays) as no_pdays , poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by education ,pdays,poutcome
order by no_education desc

--marital and campaign success
select (marital),count(marital)as no_marital,sum(campaign)as total_campaign,pdays,count(pdays) as no_pdays,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by marital,pdays,poutcome
order by no_poutcome desc

--married
select marital,count(marital) as no_marital,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where marital='married' and poutcome='success'
group by marital,poutcome 
order by no_poutcome desc

--single
select marital,count(marital) as no_marital,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where marital='single' and poutcome='success'
group by marital,poutcome 
order by no_poutcome desc

--divorced

select marital,count(marital) as no_marital,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where marital='divorced' and poutcome='success'
group by marital,poutcome 
order by no_poutcome desc


--Debt ratio "loan" and its relationship to the campaign
select (marital),count(marital)as no_marital,loan,count(loan) as no_loan,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by marital,loan,pdays,poutcome
order by no_poutcome desc

--yes they have loan and the campaign success
select (marital),count(marital)as no_marital,loan,count(loan) as no_loan,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where loan='yes' and poutcome='success'
group by marital,loan,pdays,poutcome
order by no_poutcome desc

--yes they have loan  and the campaign failure
select (marital),count(marital)as no_marital,loan,count(loan) as no_loan,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where loan='yes' and poutcome='failure'
group by marital,loan,pdays,poutcome
order by no_poutcome desc

-- no they dont have loan and the campaign success
select (marital),count(marital)as no_marital,loan,count(loan) as no_loan,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where loan='no' and poutcome='success'
group by marital,loan,pdays,poutcome
order by no_poutcome desc

-- no they dont have loan and the campaign failure
select (marital),count(marital)as no_marital,loan,count(loan) as no_loan,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where loan='no' and poutcome='failure'
group by marital,loan,pdays,poutcome
order by no_poutcome desc


--Contact method
select marital,count(marital) as no_marital,sum(campaign)as total_campaign,contact,count(contact) as contact,poutcome,count(poutcome) as no_poutcome 
from [dbo].[bank-direct-marketing-campaigns]
group by marital,contact,poutcome
order by no_marital desc

--to be successful
select marital,count(marital) as no_marital,sum(campaign)as total_campaign,contact,count(contact) as contact,count(poutcome) as no_poutcome 
from [dbo].[bank-direct-marketing-campaigns]
where poutcome='success'
group by marital,education,contact
order by no_marital desc

--failure
select marital,count(marital) as no_marital,sum(campaign)as total_campaign,contact,count(contact) as contact,count(poutcome) as no_poutcome 
from [dbo].[bank-direct-marketing-campaigns]
where poutcome='failure'
group by marital,education,contact
order by no_marital desc

--Education and those with debts are less likely to succeed in the campaign
select education,housing,count(housing) as no_housing,loan,count(loan) as no_loan,sum(campaign) as total_campaign,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where poutcome='success' and housing='yes ' and loan='yes'
group by education,housing,loan,campaign,poutcome
order by no_poutcome desc

--Education and those with debts are more likely to succeed in the campaign
select education,housing,count(housing) as no_housing,loan,count(loan) as no_loan,sum(campaign) as total_campaign,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
where poutcome='success' and housing='no ' and loan='no'
group by education,housing,loan,campaign,poutcome
order by no_poutcome desc 

 --Age range and debt ratio
  select 
  case
   when (age) <18 then 'Under 18' when (age) between 18 and 24 then '18-24'
   when (age) between 25 and 34 then '25-34' when (age) between 34and 40 then '34-40'
   when (age) between 40 and 45 then '40-45'when (age) between 40 and 45 then '45-50'
   when (age) between 50 and 55then'50-55' when (age) between 55 and 60 then '55-60'
   when (age) between 60 and 65 then '60-65' when(age) between 65 and 70 then '65-70'
   when (age) between 70 and 75 then '70-75'when (age) between 75 and 80 then '75-80'
   when (age) between 80 and 85 then '80-85'when (age) between 85 and 90 then '85-90'
   when(age) between 90 and 98 then'90-98'
 END as age_range
 ,count(housing) as no_housing ,count(loan) as no_loan,count(poutcome) as no_poutcome
  from [dbo].[bank-direct-marketing-campaigns]
 where housing = 'yes ' and loan ='yes' and poutcome='success'
 group by age  
 order by no_poutcome desc 
 
  --Focus on these ages in the campaign
  select 
  case
   when (age) <18 then 'Under 18' when (age) between 18 and 24 then '18-24'
   when (age) between 25 and 34 then '25-34' when (age) between 34and 40 then '34-40'
   when (age) between 40 and 45 then '40-45'when (age) between 40 and 45 then '45-50'
   when (age) between 50 and 55then'50-55' when (age) between 55 and 60 then '55-60'
   when (age) between 60 and 65 then '60-65' when(age) between 65 and 70 then '65-70'
   when (age) between 70 and 75 then '70-75'when (age) between 75 and 80 then '75-80'
   when (age) between 80 and 85 then '80-85'when (age) between 85 and 90 then '85-90'
   when(age) between 90 and 98 then'90-98'
 END as age_range
 ,count(housing) as no_housing ,count(loan) as no_loan,count(poutcome) as no_poutcome
  from [dbo].[bank-direct-marketing-campaigns]
 where housing = 'no ' and loan ='no' and poutcome='success'
 group by age  
 order by no_poutcome desc 


 --Months and campaigns
select month,sum(campaign) as total_campaign,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by month,poutcome
order by no_poutcome desc 

--Days of the week and campaigns
select day_of_week,sum(campaign) as total_campaign,poutcome,count(poutcome) as no_poutcome
from [dbo].[bank-direct-marketing-campaigns]
group by day_of_week,poutcome
order by no_poutcome desc 





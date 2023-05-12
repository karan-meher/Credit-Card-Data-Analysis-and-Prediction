--  Credit Card data analysis  --

use cc_;
select * from cc_clean_data;

-- 1 -- Group the customers based on their income type and find the average of their annual income.
select type_income, count(ind_id) as customer_count,  round(avg(annual_income1),2) as avg_annual_income
from cc_clean_data
group by type_income
order by avg_annual_income desc;

-- ------------------------------------------------------------------------------------------------------------------------------------ --

-- 2 -- Find the female owners of cars and property.
select ind_id, gender, car_owner, property_owner
from cc_clean_data
where gender = 'F' and (car_owner = 'Y' or property_owner = 'Y');

-- ------------------------------------------------------------------------------------------------------------------------------------ --

-- 3 -- Find the male customers who are staying with their families.
select ind_id, gender, housing_type
from cc_clean_data
where gender = 'M' and housing_type = 'With parents';

-- ------------------------------------------------------------------------------------------------------------------------------------ --

-- 4 -- Please list the top five people having the highest income.
select ind_id, annual_income1
from cc_clean_data
order by annual_income1 desc
limit 5;

-- ------------------------------------------------------------------------------------------------------------------------------------ --

-- 5 -- How many married people are having bad credit?
select marital_status, label as bad_credit, count(ind_id) as total_count
from cc_clean_data
where marital_status = 'Married' and label = 1;

-- ------------------------------------------------------------------------------------------------------------------------------------ --

-- 6 -- Between married males and females, who is having more bad credit? 
select gender, marital_status, label, count(gender) as count
from cc_clean_data
where marital_status = 'Married' and label = 1
group by gender; 

-- ------------------------------------------------------------------------------------------------------------------------------------ --

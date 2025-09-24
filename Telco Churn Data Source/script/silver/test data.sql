

select distinct customer_id from silver.[churn_raw]
where customer_id is null

select  distinct  substring(customer_id,6,len(customer_id))  ff
from silver.churn_raw
order by ff

select distinct customer_id 
from silver.[churn_raw]
where customer_id !=trim (customer_id)


select distinct customer_id from silver.[churn_raw]
where len(customer_id) != 10

-------------------------------------------------------------------------

select distinct country
from silver.[churn_raw]

select  country
from silver.[churn_raw]
where country is null

select  country
from silver.[churn_raw]
where country != trim (country)

-------------------------------------------------------------------------
select distinct state
from silver.[churn_raw]
order by 1

select  state
from silver.[churn_raw]
where state is null

select  state
from silver.[churn_raw]
where state != trim (state)

-------------------------------------------------------------------------
select  city ,count(*)
from silver.[churn_raw]
group by city

select  city
from silver.[churn_raw]
where city is null

select  city
from silver.[churn_raw]
where city != trim (city)

-------------------------------------------------------------------------

select zip_code
from bronze.[churn_raw]
where zip_code is null


select distinct zip_code
from [bronze].[churn_raw]

-- تجيب كل المدن اللي عندها أكتر من ZIP Code
SELECT city, COUNT(DISTINCT zip_code) AS ZipCount
FROM [bronze].[churn_raw]
GROUP BY city
HAVING COUNT(DISTINCT zip_code) > 1;

----------------------------------------------------------------------
select * from (
select left(lat_long,CHARINDEX(',',lat_long)-1) one,latitude
from bronze.[churn_raw]) t1
where one != latitude

select * from (
select substring(lat_long,CHARINDEX(',',lat_long)+1,len(lat_long)) one,longitude
from bronze.[churn_raw]) t1
where one != longitude



----------------------------------------------------------------------

select distinct gender
from silver.[churn_raw]

select gender 
from silver.churn_raw
where gender != trim (gender)

------------------------------------------------------------------------
select distinct [tenure_in_months]
from silver.churn_raw
order by 1

select [tenure_in_months]
from  silver.[churn_raw]
where [tenure_in_months] is null 


SELECT customer_id, [tenure_in_months], [monthly_charges_amount], [total_charges_amount]
FROM silver.churn_raw
WHERE ([tenure_in_months] = 0 AND [total_charges_amount] <> 0)
   OR ([tenure_in_months] > 0 AND [total_charges_amount] < [monthly_charges_amount]);

SELECT tenure_months, COUNT(*) 
FROM  bronze.churn_raw 
GROUP BY tenure_months
order by 1;


------------------------------------------------------------------------
select distinct phone_service
from bronze.churn_raw


SELECT phone_service, COUNT(*) 
FROM  bronze.churn_raw 
GROUP BY phone_service;

--------------------------------------------------------------------

select distinct multiple_lines
from bronze.churn_raw

select  multiple_lines
from bronze.churn_raw
where multiple_lines !=trim(multiple_lines) 

select  multiple_lines
from bronze.churn_raw
where multiple_lines like 'No phone%' and phone_service = 'yse'

SELECT multiple_lines, COUNT(*) 
FROM  bronze.churn_raw 
GROUP BY multiple_lines;

--------------------------------------------------------------------
select distinct online_security
from bronze.churn_raw
select distinct online_backup
from bronze.churn_raw
select distinct device_protection
from bronze.churn_raw
select distinct tech_support
from bronze.churn_raw
select distinct streaming_movies
from bronze.churn_raw
select distinct streaming_tv
from bronze.churn_raw

select  online_security,online_backup,device_protection,tech_support,streaming_movies,streaming_tv
from bronze.churn_raw
where online_security like '%internet%' 
  and online_backup like '%inter%'
  and device_protection like '%inter%'
  and tech_support like '%inter%'
  and streaming_movies like '%inter%'
  and streaming_tv like '%inter%'
  and internet_service = 'Yes'

  --------------------------------------------------------------------
  select distinct contract
  from bronze.churn_raw 

  select  contract
  from bronze.churn_raw 
  where contract != trim(contract)

SELECT contract, COUNT(*) 
FROM  bronze.churn_raw 
GROUP BY contract;

SELECT contract, AVG(tenure_months) AS avg_tenure
FROM bronze.churn_raw 
GROUP BY contract;




------------------------------------------------------------------------------
SELECT 
    customer_id,
    contract,
    tenure_months,
    total_charges,
    monthly_charges
FROM bronze.churn_raw
WHERE 
    -- حالة 1: عقد سنتين tenure أقل من 24
    (contract = 'Two year' AND tenure_months < 24)
    OR
    -- حالة 2: عقد سنة tenure أقل من 12
    (contract = 'One year' AND tenure_months < 12)
    OR
    -- حالة 3: عقد شهري tenure أكتر من 48 (ممكن يكون طبيعي بس نعلمها للمراجعة)
    (contract = 'Month-to-month' AND tenure_months > 48);


    
SELECT contract, COUNT(*) 
FROM  bronze.churn_raw 
GROUP BY contract;



SELECT 
    contract,
    tenure_months,
    total_charges,
    monthly_charges
FROM bronze.churn_raw

------------------------------------------------------------------------------

select distinct paperless_billing
from bronze.churn_raw


select  paperless_billing
from bronze.churn_raw
where paperless_billing != trim(paperless_billing)

------------------------------------------------------------------------------

select  payment_method ,count(*)
from bronze.churn_raw
group by payment_method
 

SELECT  customer_id,
    COUNT( payment_method) AS payment_methods_count
FROM  bronze.churn_raw
GROUP BY customer_id
HAVING COUNT( payment_method) > 1;

---------------------------------------------------------------------------
select monthly_charges
from bronze.churn_raw

select max(monthly_charges)
from bronze.churn_raw

select min(monthly_charges)
from bronze.churn_raw

select monthly_charges
from bronze.churn_raw
where monthly_charges <= 0

select monthly_charges
from bronze.churn_raw
where monthly_charges is null


---------------------------------------------------------------------------

select total_charges
from bronze.churn_raw
where total_charges <= 0

select total_charges, monthly_charges , tenure_months
from bronze.churn_raw
where total_charges is null

select total_charges , (tenure_months * monthly_charges) as total
from bronze.churn_raw

SELECT 
    customer_id,
    tenure_months,
    monthly_charges,
    total_charges,
    (tenure_months * monthly_charges) AS expected_total,
    total_charges - (tenure_months * monthly_charges) AS difference
FROM bronze.churn_raw
WHERE ABS(total_charges - (tenure_months * monthly_charges)) > 5 
order by total_charges - (tenure_months * monthly_charges) desc

---------------------------------------------------------------------------

select churn_label,count(*)
from bronze.churn_raw
group by churn_label

--------------------------------------------------------------------------
select churn_score,count(*)
from bronze.churn_raw
group by churn_score
order by 1

-------------------------------------------------------------------------- 
select cltv , tenure_months
from bronze.churn_raw
where cltv is null or cltv <=0  or cltv < total_charges
  

  --------------------------------------------------------------------------
select churn_reason ,count(*)
from bronze.churn_raw
group by churn_reason
order by count(*) desc

select churn_reason
from bronze.churn_raw
where churn_reason != trim (churn_reason)

select churn_reason , churn_label
from bronze.churn_raw
where churn_reason is not null and churn_label = 'NO'

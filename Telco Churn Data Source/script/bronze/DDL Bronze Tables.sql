/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
*/

IF Object_id ('bronze.churn_raw','U') is not null
drop table bronze.churn_raw
print 'Drop table bronze.churn_raw Done'
GO

Create table bronze.churn_raw
(
customer_id		  NVARCHAR (100),
gender		      NVARCHAR (50),
senior_citizen    NVARCHAR (20),
partner			  NVARCHAR (20),
dependents		  NVARCHAR (20),
count			  INT,
country			  NVARCHAR (50),
state			  NVARCHAR (50),
city			  NVARCHAR (50),
zip_code	      INT,
lat_long	      NVARCHAR (50),
latitude	      FLOAT,
longitude	      FLOAT,
phone_service	  NVARCHAR (20),
multiple_lines	  NVARCHAR (50),
internet_service  NVARCHAR (50),
online_security   NVARCHAR (50),
online_backup	  NVARCHAR (50),
device_protection NVARCHAR (50),
tech_support	  NVARCHAR (50),
streaming_tv	  NVARCHAR (50),
streaming_movies  NVARCHAR (50),
paperless_billing NVARCHAR (20),
payment_method	  NVARCHAR (50),
contract		  NVARCHAR (50),
tenure_months	  INT,
monthly_charges	  FLOAT,
total_charges	  FLOAT,
churn_label		  NVARCHAR (20),
churn_value		  INT,
churn_score		  INT,
cltv			  NVARCHAR (50),
churn_reason	  NVARCHAR (200),
);
print 'create table bronze.churn_raw Done'
GO
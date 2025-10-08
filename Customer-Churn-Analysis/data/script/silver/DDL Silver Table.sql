
IF OBJECT_ID('silver.[churn_raw]', 'U') IS NOT NULL
    DROP TABLE silver.churn_raw;
GO

CREATE TABLE silver.[churn_raw] (
	
	customer_key   	       NVARCHAR(30),
	gender				   NVARCHAR(10),
	is_senior_citizen	   NVARCHAR(5),
	has_partner			   NVARCHAR(5),
	has_dependents		   NVARCHAR(5),
	country				   NVARCHAR(20),
	state				   NVARCHAR(20),
	city				   NVARCHAR(30),
	latitude			   FLOAT,
	longitude			   FLOAT,
	has_phone_service	   NVARCHAR(5),
	has_multiple_lines	   NVARCHAR(30),
	internet_service_type  NVARCHAR(20),
	has_online_security	   NVARCHAR(30),
	has_online_backup	   NVARCHAR(30),
	has_device_protection  NVARCHAR(30),
	has_tech_support	   NVARCHAR(30),
	has_streaming_tv	   NVARCHAR(30),
	has_streaming_movies   NVARCHAR(30),
	is_paperless_billing   NVARCHAR(5),
	payment_method	 	   NVARCHAR(50),
	contract_type	   	   NVARCHAR(30),
	tenure_in_months	   INT,
	monthly_charges_amount FLOAT,
	total_charges_amount   FLOAT,
	churn_label			   NVARCHAR(5),
	churn_score			   INT,
	cltv				   INT,
	churn_reason           NVARCHAR(150)
);
GO


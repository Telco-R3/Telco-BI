create or alter procedure silver.load_data as 
Begin;
Begin try
        DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading churn_row table';
		PRINT '------------------------------------------------';

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

    print '>>truncate table : [silver].[churn_raw] '
    truncate table [silver].[churn_raw]

SET @start_time = GETDATE();
    print '>>Insert Data into : [Silver].[churn_raw] '
INSERT INTO [silver].[churn_raw] 
	(
	customer_key,
	gender,
	is_senior_citizen,
	has_partner,
	has_dependents,
	country,
	state,
	city,
	latitude,
	longitude,
	has_phone_service,
	has_multiple_lines,
	internet_service_type,
	has_online_security,
	has_online_backup,
	has_device_protection,
	has_tech_support,
	has_streaming_tv,
	has_streaming_movies,
	is_paperless_billing,
	payment_method,
	contract_type,
	tenure_in_months,
	monthly_charges_amount,
	total_charges_amount,
	churn_label,
	churn_score,
	cltv,
	churn_reason
	)
select 
	customer_id,
	gender,
	senior_citizen,
	partner,
	dependents,
	country,
	state,
	city,
	latitude,
	longitude,
	phone_service,
	multiple_lines,
	internet_service,
	online_security,
	online_backup,
	device_protection,
	tech_support,
	streaming_tv,
	streaming_movies,
	paperless_billing,
	payment_method,
	contract,
	tenure_months,
	monthly_charges,
	total_charges,
	churn_label,
	churn_score,
	cltv,
	CASE WHEN churn_reason is null then 'n/a'
		 ELSE  churn_reason
	   	 END AS churn_reason
from [bronze].[churn_raw]
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
PRINT '>> -------------';

--------------------------------------------------------------------------------------------------------------------
	SET @batch_end_time = GETDATE();
	PRINT '=========================================='
    PRINT 'Loading Silver Layer is Completed';
    PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
	PRINT '=========================================='

END try
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END

select *
from silver.churn_raw


exec bronze.load_data
exec silver.load_data
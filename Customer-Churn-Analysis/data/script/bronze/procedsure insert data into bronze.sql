
create or alter procedure  bronze.load_data as 
Begin;
Begin try
        DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading churn_row table';
		PRINT '------------------------------------------------';

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

    print '>>truncate table : [bronze].[churn_raw] '
    truncate table bronze.[churn_raw]

SET @start_time = GETDATE();
    print '>>Insert Data into : [bronze].[churn_raw] '
bulk insert [bronze].[churn_raw]
from 'E:\project\data_set\new.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
	)
	UPDATE [bronze].[churn_raw]
	SET lat_long=
	REPLACE (lat_long,'&',',')
	WHERE lat_long LIKE '%&%';
	
SET @end_time = GETDATE();
PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
PRINT '>> -------------';

--------------------------------------------------------------------------------------------------------------------
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


exec bronze.load_data
select * from bronze.churn_raw
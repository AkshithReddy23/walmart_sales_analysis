/*
========================================================================
Purpose: LOADING the data into bronze layer 
------------------------------------------------------------------------
How it works: 
    Bulk loading the data
    Creating a procedure for the bronze layer 
EXEC Bronze.load_sale_info
*/

CREATE OR ALTER PROCEDURE Bronze.load_sale_info AS

BEGIN 
	DECLARE @start_time DATETIME, @end_time DATETIME 

	BEGIN TRY
	
		SET @start_time = GETDATE()
		TRUNCATE TABLE Bronze.sale_info

		BULK INSERT Bronze.sale_info
		FROM 'C:\Users\akshi\Downloads\walmart.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)

		SET @end_time = GETDATE()
		PRINT 'Process Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS  NVARCHAR)+ ' seconds' 
	END TRY

	BEGIN CATCH
		PRINT '=================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '=================================================='

	END CATCH
END

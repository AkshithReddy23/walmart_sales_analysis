CREATE OR ALTER PROCEDURE Silver.load_silver AS  
BEGIN 
	BEGIN TRY 
		TRUNCATE TABLE Silver.sale_info;

		INSERT INTO Silver.sale_info (
			store_num,
			sale_date,
			sales,
			sales_flag,
			temp,
			sales_fuel,
			sales_cpi,
			unemp  
		)


		SELECT 
			store_num,
			TRY_CAST(CONVERT(DATE, sale_date, 103) AS DATE) AS sale_date,
			sales,
			sales_flag,
			temp,
			sales_fuel,
			ROUND(sales_cpi, 2) AS sales_cpi,
			unemp  
		FROM Bronze.sale_info
		ORDER BY TRY_CAST(CONVERT(DATE, sale_date, 103) AS DATE);

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



IF OBJECT_ID ('Gold.sale_info','U')  IS NOT NULL
	DROP TABLE Gold.sale_info;

CREATE VIEW Gold.sale_info AS 

SELECT 
	ROW_NUMBER() OVER(ORDER BY sale_date,sales_fuel) AS pk_num,
	store_num AS store_number,
	sale_date,
	sales,
	sales_flag,
	temp AS temperature,
	sales_fuel AS fuel_price,
	sales_cpi AS CPI,
	unemp AS unempolyed
	
FROM Silver.sale_info

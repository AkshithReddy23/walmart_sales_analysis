/*
===========================================================================
Purpose: Create a Table in Bronze Layer and Load data
---------------------------------------------------------------------------
How it works: 
      Create Table in Bronze Layer
      Load the RAW data into the bronze layer
*/

IF OBJECT_ID('Bronze.sale_info','U') IS NOT NULL
	DROP TABLE Bronze.sale_info

CREATE TABLE Bronze.sale_info (
	store_num INT,
	sale_date NVARCHAR(50),
	sales DECIMAL(12,2),
	sales_flag BIT,
	temp FLOAT,
	sales_fuel FLOAT,
	sales_cpi FLOAT,
	unemp FLOAT
);

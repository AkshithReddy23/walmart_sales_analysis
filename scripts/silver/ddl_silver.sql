/*
=============================================================
DDL SCRIPT: CREATE SILVER LAYER 
=============================================================
Script purpose:
			This script creates 6 tables in silver schema,
			Dropping existing tables, if they already exist.

			Run this script to re-define the DDL structure 
*/

IF OBJECT_ID('Silver.sale_info','U') IS NOT NULL
	DROP TABLE Silver.sale_info

CREATE TABLE Silver.sale_info (
	store_num INT,
	sale_date DATE,
	sales DECIMAL(12,2),
	sales_flag BIT,
	temp FLOAT,
	sales_fuel FLOAT,
	sales_cpi FLOAT,
	unemp FLOAT
);

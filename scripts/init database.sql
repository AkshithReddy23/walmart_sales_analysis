/*
===============================================================================
Prupose: Create DataBase and 3schemas Bronze,Silver, Gold
-------------------------------------------------------------------------------
How it works:
      Create a Database - salesdataset
          drops if it already exists and creates new when updated
      Creates 3 schemas Bronze, Silver, Gold 
      
===============================================================================
*/

IF EXISTS( SELECT 1 FROM sys.databases WHERE name = 'salesdataset')

BEGIN 
	ALTER DATABASE salesdataset SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE salesdataset;
END

CREATE DATABASE salesdataset

CREATE SCHEMA Bronze

CREATE SCHEMA Silver

CREATE SCHEMA Gold

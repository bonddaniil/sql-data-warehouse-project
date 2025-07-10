/*
==============================================================
Create Database and Schemas
==============================================================
Script Purpose:
  This script creates a new DB named "DataWarehouse" after checking if it is already exists. 
  If it is exists it is dropped and recerated. Also the script sets up three schemas within the DB:
  "bronze", silver and "gold".
*/

USE master;

GO

--Drop and recreate DWH

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
-- Finish all active sessions for DB
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;

-- Create DWH
GO
CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

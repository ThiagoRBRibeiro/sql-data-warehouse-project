/*
===============================================================================
 Script Name   : Create_DataWarehouse.sql
 Description   : This script creates a clean SQL Server environment for a 
                 modern data warehouse project. It includes:
                   - Dropping the existing 'DataWarehouse' database if it exists
                   - Creating a new 'DataWarehouse' database
                   - Defining schemas for the data processing layers:
                     * bronze  – Raw data ingestion
                     * silver  – Cleaned/transformed data
                     * gold    – Final data for analytics and reporting
                 
 Notes         : 
   - 'GO' is used to separate batches of T-SQL statements for proper execution.
   - Make sure you run this script with sufficient privileges.

 Created On    : [2025-08-20]
========
*/

-- Create Database 'DataWarehouse'
USE master;
GO

-- Drop and Recreate the 'DataWarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse
END;

GO

-- Create the 'DataWarehouse' Database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

-- GO -> Is like a separator, first execute de 1º then go to 2º and then ...

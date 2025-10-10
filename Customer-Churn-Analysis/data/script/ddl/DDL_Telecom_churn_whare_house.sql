
-- Drop and recreate the 'churn' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'churn')
BEGIN
    ALTER DATABASE churn SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE churn;
END;
GO

-- Create the 'churn' database
CREATE DATABASE churn;
GO

USE churn;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

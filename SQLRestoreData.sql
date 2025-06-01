USE TrainingDB;
GO

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    EnrollmentDate DATE
);

INSERT INTO Students VALUES
(1, 'Sara Ali', '2023-09-01'),
(2, 'Mohammed Nasser', '2023-10-15');
GO

-- Step 2: Full Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\\Backups\\TrainingDB_Full.bak';
GO

-- Step 3: Simulate data change
INSERT INTO Students VALUES (3, 'Fatma Said', '2024-01-10');
GO

-- Step 4: Differential Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\\Backups\\TrainingDB_Diff.bak' 
WITH DIFFERENTIAL;
GO

-- Step 5: Transaction Log Backup
ALTER DATABASE TrainingDB SET RECOVERY FULL;
GO

BACKUP LOG TrainingDB 
TO DISK = 'C:\\Backups\\TrainingDB_Log.trn';
GO

-- Step 6: Copy-Only Backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\\Backups\\TrainingDB_CopyOnly.bak' 
WITH COPY_ONLY;
GO

-- Full backup
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Full.bak';

-- Differential
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Diff.bak'
WITH DIFFERENTIAL;


-- Log backup
ALTER DATABASE TrainingDB SET RECOVERY FULL;
GO

BACKUP LOG TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Log.trn';


-- Copy-only
BACKUP DATABASE TrainingDB 
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_CopyOnly.bak'
WITH COPY_ONLY;


DROP DATABASE TrainingDB;

ALTER DATABASE TrainingDB 
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

DROP DATABASE TrainingDB;

USE master;
GO

ALTER DATABASE TrainingDB 
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE TrainingDB;

-- 1. Switch context to a different DB
USE master;
GO

-- 2. Force disconnect all users
ALTER DATABASE TrainingDB 
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- 3. Drop the database
DROP DATABASE TrainingDB;
GO

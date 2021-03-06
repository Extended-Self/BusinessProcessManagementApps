﻿SET ANSI_NULLS              ON;
SET ANSI_PADDING            ON;
SET ANSI_WARNINGS           ON;
SET ANSI_NULL_DFLT_ON       ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET QUOTED_IDENTIFIER       ON;
go

-- Must be executed inside the target database

-- Regular views
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='DateView' AND TABLE_TYPE='VIEW')
    DROP VIEW bpst_aal.DateView;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='AdministrativeView' AND TABLE_TYPE='VIEW')
    DROP VIEW bpst_aal.AdministrativeView;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='ServiceHealthView' AND TABLE_TYPE='VIEW')
    DROP VIEW bpst_aal.ServiceHealthView;

-- Tables
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='ServiceHealthData' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE bpst_aal.ServiceHealthData;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='AdministrativeData' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE bpst_aal.AdministrativeData;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='configuration' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE bpst_aal.[configuration];
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='bpst_aal' AND TABLE_NAME='date' AND TABLE_TYPE='BASE TABLE')
    DROP TABLE bpst_aal.[date];
    
-- Stored Procedures
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='bpst_aal' AND ROUTINE_NAME='sp_get_replication_counts' AND ROUTINE_TYPE='PROCEDURE')
    DROP PROCEDURE bpst_aal.sp_get_replication_counts;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE [name]='bpst_aal')
BEGIN
    EXEC ('CREATE SCHEMA bpst_aal AUTHORIZATION dbo'); -- Avoid batch error
END;

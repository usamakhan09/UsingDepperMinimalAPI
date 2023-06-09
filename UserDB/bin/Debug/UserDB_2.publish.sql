﻿/*
Deployment script for MinimalApiUserDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MinimalApiUserDB"
:setvar DefaultFilePrefix "MinimalApiUserDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Procedure [dbo].[spUser_Delete]...';


GO
ALTER PROCEDURE [dbo].[spUser_Delete]
	@id int
AS
begin
	delete
	from dbo.[User]
	where Id=@id;
end
GO
PRINT N'Altering Procedure [dbo].[spUser_Get]...';


GO
ALTER PROCEDURE [dbo].[spUser_Get]
	@id int
AS
begin
	select Id,FirstName,LastName 
	from dbo.[User]
	where Id=@id;
end
GO
PRINT N'Altering Procedure [dbo].[spUser_GetAll]...';


GO
ALTER PROCEDURE [dbo].[spUser_GetAll]
AS
begin
	select Id,FirstName,LastName 
	from dbo.[User]
end
GO
if not exists (select 1 from dbo.[User])
begin
	insert into dbo.[User] (FirstName,LastName)
	values ('usama','khan'),
	('areez','arsalan'),
	('Tim','paul'),
	('john','smith');	
end
GO

GO
PRINT N'Update complete.';


GO

USE [contosodb]
GO

INSERT INTO [dbo].[employee]
           ([id]
           ,[name]
           ,[active]
           ,[department]
           ,[date])
     VALUES
           (1
           ,'Evandro'
           ,1
           ,'IT'
           ,GETDATE())
GO

delete from employee;

DECLARE @i int = 0
WHILE @i < 1
BEGIN
    SET @i = @i + 1
    INSERT INTO [dbo].[employee]
           ([id]
           ,[name]
           ,[active]
           ,[department]
           ,[date])
     VALUES
           (NEXT VALUE FOR employee_seq
           ,'Evandro'
           ,1
           ,'IT'
           ,GETDATE())
END
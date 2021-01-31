SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UserValid](
    @email VARCHAR(MAX),
    @password VARCHAR(MAX),
    @valid BIT
)
AS BEGIN

SET NOCOUNT ON

IF EXISTS(SELECT * FROM Users WHERE userEmail = @email AND userPassword = @password)
    SET @Valid = 1
    ELSE 
    SET @valid = 0

END



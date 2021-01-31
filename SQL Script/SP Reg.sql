SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserReg](
    
    @firstName VARCHAR(MAX),
    @lastName VARCHAR(MAX),
    @email VARCHAR(MAX),
    @password VARCHAR(MAX),
    @ResponseMessage VARCHAR(MAX) OUTPUT
)
AS BEGIN

BEGIN TRANSACTION
BEGIN TRY

DECLARE @userInput INT
DECLARE @userID INT
DECLARE @catchError NVARCHAR(MAX)

SET @userInput = 0

SELECT @userInput = COUNT(userID)
FROM dbo.Users
WHERE userFirstName = @firstName AND userLastName = @lastName AND userEmail = @email  AND userPassword = @password

IF (@userInput = 0)
BEGIN
INSERT INTO dbo.Users(
    userFirstName,
    userLastName,
    userEmail,
    userPassword
) VALUES (
    @firstName,
    @lastName,
    @email,
    @password
) 
    SET @userID = @@IDENTITY
END

    IF @@TRANCOUNT > 0
        BEGIN
        COMMIT
        ROLLBACK TRANSACTION
    END

END TRY

BEGIN CATCH
    SET @CatchError = 'ERROR - User already Register' 
    IF @@TRANCOUNT > 0 BEGIN
    ROLLBACK TRANSACTION
    END
    RAISERROR (@CatchError, 1,0)

END CATCH
END
GO

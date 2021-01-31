SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserUpdate](
    @userID INT,
    @firstName VARCHAR(MAX),
    @lastName VARCHAR(MAX),
    @email VARCHAR(MAX),
    @username VARCHAR(MAX),
    @password VARCHAR(MAX)
)
AS BEGIN

UPDATE dbo.Users

SET
userFirstName = @firstName,
userLastName = @lastName,
userEmail = @email,
userName = @username,
userPassword = @password

WHERE userID = @userID

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UserDelete](
    @userID INT
)
AS BEGIN

DELETE dbo.Users 
WHERE userID = @userID

END
GO

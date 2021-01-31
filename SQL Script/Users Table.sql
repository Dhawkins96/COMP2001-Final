SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userFirstName] [varchar](max) NOT NULL,
	[userLastName] [varchar](max) NOT NULL,
	[userEmail] [varchar](max) NOT NULL,
	[userPassword] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[PassChange]
on [dbo].[Users]
AFTER UPDATE
AS
BEGIN

    IF UPDATE(userPassword)
    BEGIN
        
        DECLARE @userID INT
        DECLARE @oldPass VARCHAR

        SELECT @userID = userID, @oldpass = userPassword FROM DELETED

        INSERT INTO dbo.Password (userID, userPassword, passChanged) 
              VALUES (@userID, @oldpass, GETDATE())
    END
END

GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [PassChange]
GO

ALTER TRIGGER PassChange
on dbo.Users
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


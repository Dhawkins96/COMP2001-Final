CREATE VIEW UserCount AS

SELECT COUNT(Session.sessionID) as total, Users.userEmail
FROM dbo.Session, dbo.Users
WHERE Session.userID = Users.userID
GROUP BY Users.userEmail
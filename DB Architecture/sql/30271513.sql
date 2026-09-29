-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE ThrowError(@Message nvarchar(250))
AS
BEGIN   
   THROW 50001, @Message, 1;
END
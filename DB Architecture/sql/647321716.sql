-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE wm_RContainerType03
AS
	SELECT * FROM CONTAINER_TYPE
	 WHERE USE_AS_DEFAULT=N'<literal:1>'

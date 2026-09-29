-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RContainerType02
	@ContainerType nvarchar(25)
AS
	SELECT * 
     FROM CONTAINER_TYPE
	 WHERE CONTAINER_TYPE = @ContainerType
      AND active = N'<literal:1>'

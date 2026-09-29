-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RContainerClass01
	@ContainerClass nvarchar(25)
AS
	SELECT * FROM CONTAINER_CLASS
	 WHERE CONTAINER_CLASS = @ContainerClass

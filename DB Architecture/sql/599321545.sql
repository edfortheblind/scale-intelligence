-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RContainerClass02
	@ContainerClass nvarchar(25)
AS
	SELECT * 
     FROM container_class
	 WHERE container_class = @ContainerClass
      AND active = N'<literal:1>'

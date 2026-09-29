-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE FUNCTION fn_GetFeatureEnabled(
	@feature nvarchar(100),
	@user nvarchar(30)
)
RETURNS nchar(1)
BEGIN
DECLARE @enabled NCHAR(1);
	set @enabled = (SELECT case 
	ENABLED 
	when   N'<literal:1>' then N'<literal:2>'
	when N'<literal:3>' then (select case when user_name is not null then N'<literal:4>' else N'<literal:5>' end) 
	end
	FROM FEATURE_MANAGEMENT FM
	left join FEATURE_MANAGEMENT_USER FMU on FM.Object_ID = FMU.Feature_ID and FMU.User_Name = @user
	WHERE FEATURE_NAME = @feature);
	
	RETURN @enabled;
END
-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE FUNCTION fn_GetSecurityValues(
	@formId numeric(5),
	@userName nvarchar(30)
)
RETURNS nvarchar(64)
BEGIN
DECLARE @Result nvarchar(64);
	set @Result = (SELECT TOP 1 S.SEC_VALUES
FROM SECURITY S
LEFT JOIN USER_PROFILE U ON S.SECURITY_GROUP_ID=U.SECURITY_GROUP_ID AND U.USER_NAME = @userName
WHERE
S.FORM_ID = @formId AND
    (( S.SECURITY_LEVEL = N'<literal:1>' AND S.USER_NAME = @userName)
    OR (S.SECURITY_LEVEL = N'<literal:2>' AND S.SECURITY_GROUP_ID = U.SECURITY_GROUP_ID )
	OR S.SECURITY_LEVEL = N'<literal:3>')
ORDER BY
    CASE S.SECURITY_LEVEL
        WHEN N'<literal:4>' THEN 1
        WHEN N'<literal:5>' THEN 2
        WHEN N'<literal:6>' THEN 3
    END);
	
	RETURN @Result;
END

-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE FUNCTION DHfn_GetDateNoTime(@dt datetime)
RETURNS datetime										   
BEGIN
	return convert(datetime,convert(nvarchar(50),@dt,101)); -- [comment omitted]
END -- [comment omitted]
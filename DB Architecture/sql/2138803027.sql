-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












CREATE FUNCTION DHfn_RoundToSec(@dt datetime)
RETURNS datetime										   
BEGIN
	return dateadd(ms, -datepart(ms, @dt), @dt);
END -- [comment omitted]
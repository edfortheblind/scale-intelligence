-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]

-- [comment omitted]


/* [comment omitted] */








-- [comment omitted]


CREATE PROCEDURE MetaTrans_GetRecAppSchedule(
@internalNum numeric(9), @culture nvarchar(10), @warehouse nvarchar(25))

AS
	SET NOCOUNT ON;
	IF @internalNum = 0
	BEGIN
	-- [comment omitted]
		SELECT 
		N'<literal:1>' AS N'<literal:2>',
		-- [comment omitted]
		N'<literal:3>' AS N'<literal:4>', 
		0 AS N'<literal:5>', 
		N'<literal:6>' AS N'<literal:7>',
		N'<literal:8>' AS N'<literal:9>',
		N'<literal:10>' AS N'<literal:11>',
		N'<literal:12>' AS N'<literal:13>',
		N'<literal:14>' AS N'<literal:15>',
		N'<literal:16>' AS N'<literal:17>',
		N'<literal:18>' AS N'<literal:19>',
		N'<literal:20>' AS N'<literal:21>',
		N'<literal:22>' AS N'<literal:23>',
		N'<literal:24>' AS N'<literal:25>',
		N'<literal:26>' AS N'<literal:27>',
		N'<literal:28>' AS N'<literal:29>',
		N'<literal:30>' AS N'<literal:31>',
		@warehouse AS N'<literal:32>',
		N'<literal:33>' as N'<literal:34>'
	
	END
	ELSE
	BEGIN 
	-- [comment omitted]
		SELECT 
		N'<literal:35>' AS N'<literal:36>',
		-- [comment omitted]
		N'<literal:37>' AS N'<literal:38>', 
		RECEIPT_HEADER.INTERNAL_RECEIPT_NUM AS N'<literal:39>', 
		RECEIPT_HEADER.RECEIPT_ID AS N'<literal:40>',
		RECEIPT_HEADER.CARRIER AS N'<literal:41>',
		RECEIPT_HEADER.COMPANY AS N'<literal:42>',
		RECEIPT_HEADER.SHIP_FROM AS N'<literal:43>',
		RECEIPT_HEADER.SHIP_FROM_NAME AS N'<literal:44>',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS1 AS N'<literal:45>',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS2 AS N'<literal:46>',
		RECEIPT_HEADER.SHIP_FROM_ADDRESS3 AS N'<literal:47>',
		RECEIPT_HEADER.SHIP_FROM_CITY AS N'<literal:48>',
		RECEIPT_HEADER.SHIP_FROM_STATE AS N'<literal:49>',
		RECEIPT_HEADER.SHIP_FROM_POSTAL_CODE AS N'<literal:50>',
		RECEIPT_HEADER.SHIP_FROM_COUNTRY AS N'<literal:51>',
		RECEIPT_HEADER.TRAILER_ID AS N'<literal:52>',
		RECEIPT_HEADER.WAREHOUSE AS N'<literal:53>',
		RECEIPT_HEADER.CLOSE_DATE as N'<literal:54>'
		FROM RECEIPT_HEADER WHERE RECEIPT_HEADER.INTERNAL_RECEIPT_NUM = @internalNum ;
	END
	
	-- [comment omitted]
	SELECT 
	N'<literal:55>' as N'<literal:56>',
	-- [comment omitted]
	N'<literal:57>' AS N'<literal:58>',
	APPOINTMENT_SCHEDULE.OBJECT_ID AS N'<literal:59>', 
	APPOINTMENT_SCHEDULE.INTERNAL_RECEIPT_NUM AS N'<literal:60>', 
	APPOINTMENT_SCHEDULE.DOCK AS N'<literal:61>',
	CASE WHEN APPOINTMENT_SCHEDULE.APPT_DATE_TIME is not null THEN APPOINTMENT_SCHEDULE.APPT_DATE_TIME ELSE null END AS N'<literal:62>',
	CASE WHEN APPOINTMENT_SCHEDULE.END_DATE_TIME is not null THEN APPOINTMENT_SCHEDULE.END_DATE_TIME ELSE null END  AS N'<literal:63>',
	APPOINTMENT_SCHEDULE.USER_DEF1 AS N'<literal:64>',
	APPOINTMENT_SCHEDULE.USER_DEF2 AS N'<literal:65>',
	APPOINTMENT_SCHEDULE.USER_DEF3 AS N'<literal:66>',
	APPOINTMENT_SCHEDULE.USER_DEF4 AS N'<literal:67>',
	APPOINTMENT_SCHEDULE.USER_DEF5 AS N'<literal:68>',
	APPOINTMENT_SCHEDULE.USER_DEF6 AS N'<literal:69>',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF7, 0) AS N'<literal:70>',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF8, 0) AS N'<literal:71>'
	FROM (SELECT 1 AS A) A
	LEFT JOIN (
	SELECT  
	APPOINTMENT_SCHEDULE.OBJECT_ID, 
	APPOINTMENT_SCHEDULE.INTERNAL_RECEIPT_NUM, 
	APPOINTMENT_SCHEDULE.DOCK,
	APPOINTMENT_SCHEDULE.APPT_DATE_TIME,
	APPOINTMENT_SCHEDULE.END_DATE_TIME,
	APPOINTMENT_SCHEDULE.USER_DEF1,
	APPOINTMENT_SCHEDULE.USER_DEF2,
	APPOINTMENT_SCHEDULE.USER_DEF3,
	APPOINTMENT_SCHEDULE.USER_DEF4,
	APPOINTMENT_SCHEDULE.USER_DEF5,
	APPOINTMENT_SCHEDULE.USER_DEF6,
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF7, 0) as N'<literal:72>',
	ISNULL(APPOINTMENT_SCHEDULE.USER_DEF8, 0) as N'<literal:73>'
	FROM APPOINTMENT_SCHEDULE WHERE INTERNAL_RECEIPT_NUM = @internalNum) APPOINTMENT_SCHEDULE ON 1=1;

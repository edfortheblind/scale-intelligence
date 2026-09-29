-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE VIEW YARD_LOCATION_VIEW
AS

		SELECT 
		DOCK_LOCATION AS YARD_LOCATION,
		DOCK_LOCATION_AREA AS YARD_LOC_AREA,
		warehouse,
		RECORD_TYPE
		from DOCK_LOCATION 
		where RECORD_TYPE=N'<literal:1>'
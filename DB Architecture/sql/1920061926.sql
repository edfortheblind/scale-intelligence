-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE VIEW SERIAL_NUMBER_VIEW 
AS
   SELECT * FROM SERIAL_NUMBER
   UNION ALL
   SELECT * FROM AR_SERIAL_NUMBER
-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE VIEW [dbo].[VIEWER_RECEIPTS] AS
select	item, receipt_id, QUANTITY_UM, TOTAL_QTY, OPEN_QTY, RECEIPT_DATE, user_def1 as CLIN, '<literal:1>' As MaterielOwner
from	ar_receipt_detail
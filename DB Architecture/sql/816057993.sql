-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE VIEW CONTAINER_TYPE_AUTHORIZED_COMPANY_VIEW
AS
SELECT distinct CT.CONTAINER_TYPE,DESCRIPTION,CT.Authorized_company,CTAC.COMPANY FROM CONTAINER_TYPE CT 
  left outer join  CONTAINER_TYPE_AUTHORIZED_COMPANY CTAC on CT.Container_type = CTAC.Container_Type
  WHERE CT.ACTIVE = N'<literal:1>'
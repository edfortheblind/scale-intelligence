CREATE PROCEDURE WHSM_GetMenuChildRecords @objectId as numeric(9,0)
AS
with PARENTS as(

	SELECT * 
    from WAREHOUSE_MOBILE_MENU t1 where t1.PARENT_OBJECT_ID = @objectId

    union all
    select t.* from PARENTS
    join WAREHOUSE_MOBILE_MENU t on t.PARENT_OBJECT_ID  = PARENTS.OBJECT_ID 
)

select COUNT(*) AS sysCreated from PARENTS 
where SYSTEM_CREATED = N'Y'

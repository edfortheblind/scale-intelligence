/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 140413     | NVS           | 04/23/14      | Change item length to 50
 147423     | SHS        | 10/20/14 | Removed other SQL sections which were getting executed and changes were not reflecting, and corrected the types on input parameters

*/   


CREATE PROCEDURE wm_RItemCrossReference02
	@Item nvarchar(50),
	@XRefItem nvarchar(50),
	@Company nvarchar(25)
AS
	SELECT * FROM ITEM_CROSS_REFERENCE
		WHERE ITEM = @Item
		AND X_REF_ITEM = @XRefItem
	    AND ISNULL(Company,N'!') = ISNULL(@Company,N'!') 


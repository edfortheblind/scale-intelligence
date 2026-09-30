# Labor, yard and administration behavior

39 bounded stored-procedure contracts, 39 role records, 14 help topics and 28 authored questions. This is captured source interpretation, not operational execution or full-domain acceptance.

[Machine-readable contracts](mappings/batches/labor-yard-administration.json) · [Help topics](HELP_TOPICS.md)

## Source-defined contracts

| Object | Purpose | Persistent write targets |
| --- | --- | --- |
| [dbo.LBR_MonitorLaborGroupsChartData](sql/117223818.sql) | Select warehouse labor-group workload and recent completion indicators. | None in direct body |
| [dbo.LBR_MonitorLaborIndicatorTiles](sql/133223875.sql) | Select one coded labor indicator tile and its critical-level result. | None in direct body |
| [dbo.LBR_MonitorLaborUsersChartData](sql/149223932.sql) | Select assigned-user workload within one warehouse, labor group and work type. | None in direct body |
| [dbo.RPT_LaborTypeSummaryDetails](sql/209748150.sql) | Return dated labor-type detail rows for a report. | None in direct body |
| [dbo.GetIntraDayLaborProgressActiveEmployees](sql/904702621.sql) | Estimate active employees from their latest eligible consolidated labor record. | None in direct body |
| [dbo.DASH_GetLaborKPIData](sql/1468180626.sql) | Pivot stored labor dashboard values for one warehouse. | None in direct body |
| [dbo.dbc_ISecurity](sql/392700797.sql) | Insert a missing security assignment keyed by form, level and username. | SECURITY |
| [dbo.dbc_ISecurityCheckpoint](sql/408700854.sql) | Insert a missing security checkpoint registration. | SECURITY_CHECKPOINT |
| [dbo.dbc_ISecurityGroup](sql/544720993.sql) | Insert a missing security group. | SECURITY_GROUP |
| [dbo.DeleteUserProfileReferences](sql/568701424.sql) | Delete selected user-profile references and append a deletion activity record. | WORK_PROFILE_USER_AUTH, COMPANY_ACCESS, WAREHOUSE_ACCESS, USER_ADJSTMNT_AUTHORIZATION, SECURITY, WORK_SPECIAL_HANDLING, RECEIVING_PREFERENCE_USER_AUTHORIZATION, USER_SETTINGS, USER_PROFILE, USER_PROFILE_ACTIVITY |
| [dbo.CheckSecurityPermission](sql/1260179885.sql) | Produce a security-migration permission mismatch report through a persistent staging table. | tempSecurityCheck |
| [dbo.SEC_GetCheckpointsWithResourceFileKeys](sql/1505752767.sql) | Map registered security checkpoints to resource keys and coded permission values. | None in direct body |
| [dbo.SEC_GetSecurityForms](sql/1521752824.sql) | Return localized security forms using two materially different selection branches. | None in direct body |
| [dbo.wm_RUserProfile01](sql/1783325763.sql) | Retrieve a user profile by exact username. | None in direct body |
| [dbo.MetaTrans_DockLocationTransfer](sql/501225186.sql) | Prepare container and shipment context for a dock-location transfer screen. | None in direct body |
| [dbo.METATRANS_GetBillOfMaterialDetails](sql/517225243.sql) | Return bill-of-material detail with item tracking and location-inventory context. | None in direct body |
| [dbo.wm_UUserActivity01](sql/762798125.sql) | Mark idle user-activity sessions logged off and return affected row count. | USER_ACTIVITY |
| [dbo.Get_LaborActivityGroupsForConsolidation](sql/776702165.sql) | Assign candidate consolidation group identifiers to selected labor records. | None in direct body |
| [dbo.RPT_UserSummaryReportDetails](sql/801750259.sql) | Return labor details ordered for a user-summary report. | None in direct body |
| [dbo.RPT_YardVisibilityDetails](sql/897750601.sql) | Return dock, actual/scheduled trailer and receipt visibility details. | None in direct body |
| [dbo.RPT_YardVisibilityHdrDetails](sql/913750658.sql) | Aggregate dock visibility using actual-location trailer matches. | None in direct body |
| [dbo.RPT_YardVisibilityRcptDetails](sql/929750715.sql) | Return receipt-line quantities for the yard visibility report. | None in direct body |
| [dbo.WRK_MonitorAssignedUserChartData](sql/970798866.sql) | Return assigned-user work chart and six aggregate monitor results. | None in direct body |
| [dbo.MetaTrans_IndirectLaborWorkbenchLog](sql/1061227181.sql) | Prepare fixed presentation values for a labor activity entry screen. | None in direct body |
| [dbo.MetaTrans_ManualLaborActivityLog](sql/1077227238.sql) | Prepare fixed presentation values for a labor activity entry screen. | None in direct body |
| [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldDetails](sql/1127675065.sql) | Report matching location-inventory records older than one server-local day. | None in direct body |
| [dbo.RPT_CSO_UserLocationsGreaterThan1DayOldCount](sql/1143675122.sql) | Report matching location-inventory records older than one server-local day. | None in direct body |
| [dbo.SaveUserLastActivityEndTime](sql/1153751513.sql) | Store a supplied last-activity end time for one user. | USER_LAST_ACTIVITY |
| [dbo.WRK_UpdateDockWorkCreated](sql/1194799664.sql) | Mark dock work created and delegate container work-state update. | DOCK_MGMT_WORK_DATA |
| [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysDetails](sql/1207675350.sql) | Count recent transaction records with a negative after-quantity. | None in direct body |
| [dbo.RPT_CSO_TimesALocationHasGoneNegativeInPast30DaysCount](sql/1223675407.sql) | Count recent transaction records with a negative after-quantity. | None in direct body |
| [dbo.SCI_LABOR_MANAGEMENT_DETAIL](sql/1217751741.sql) | Export completed labor details changed within a timestamp window. | None in direct body |
| [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyDetails](sql/1239675464.sql) | Compare location on-hand quantity with selected shipping-work quantity. | None in direct body |
| [dbo.RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount](sql/1255675521.sql) | Compare location on-hand quantity with selected shipping-work quantity. | None in direct body |
| [dbo.PMN_UserActivity](sql/1781229746.sql) | Sample overlapping user-activity sessions at 30-second intervals. | None in direct body |
| [dbo.dbc_IDockMgrGridCustomization](sql/1852181994.sql) | Insert a missing dock-grid customization for a configured perspective. | DOCK_MGR_GRID_CUSTOMIZATION |
| [dbo.GetIntraDayLaborProgressWorkDetails](sql/920702678.sql) | Estimate intraday workload, completions, active users and hours by work type. | None in direct body |
| [dbo.DASH_RefreshLabor](sql/1548180911.sql) | Refresh selected stored labor dashboard indicators. | DASHBOARD_DATA |
| [dbo.RPT_BillOfLadingHeader](sql/1747409.sql) | Select bill-of-lading header/address context and container-or-detail lines. | None in direct body |

## Labor monitor counts and time windows

The routines use different record sources, timestamp columns and filters. Some count instructions or distinct users; condition-group totals can double-count a work unit. A browser-midnight tile differs from rolling one-hour windows, and unsupported tile codes return no tile.

1. Select the exact monitor routine and filter context.
2. Compare END_DATE_TIME, DATE_TIME_STAMP and browser-midnight predicates before comparing counts.

## Intraday labor estimates and active-user counts

It counts distinct users with sufficiently recent eligible activity, using group tolerance or 30 minutes. Work quantity, formatted labor-time grouping, throughput and NULL work-group joins affect estimates. These results do not establish attendance or end-to-end elapsed duration.

1. Compare eligible source windows, hold configuration and work-type selection.
2. Inspect NULL work-group joins and grouped formatted durations before interpreting calculated hours.

## Stored labor dashboard values and refresh

The reader pivots MAX stored values without checking expiry. The refresh routine either replaces all five KPI identifiers when one is missing or updates only expired rows. NULL expiry can prevent refresh, and duplicate identifiers are not rejected by the completeness test.

1. Check the stored identifier coverage and timestamp/expiry values through an authorized process.
2. Distinguish the read procedure from the separate refresh procedure and its caller transaction.

## Labor entry context and consolidation groups

The two MetaTrans log helpers return fixed presentation rows only. The grouping helper returns candidate group identifiers without persisting a consolidation. SaveUserLastActivityEndTime stores a supplied timestamp without enforcing that it increases.

1. Identify whether the caller requested screen context, grouping or timestamp storage.
2. Validate split identifiers and ordering before relying on group assignments.

## Labor reports and incremental export windows

The labor-type detail report uses inclusive START_DATE_TIME bounds. The user-summary detail routine has no date or warehouse filter. The SCI export uses DATE_TIME_STAMP greater than start and at most end, with non-NULL completion time and coded activity exclusions.

1. Identify the exact report/export procedure.
2. Compare the field and boundary operators used for its time window.

## Security registration and profile cleanup

The registration routines insert missing records and leave existing records unchanged. Profile cleanup performs nine deletes and a final activity insert without its own transaction. None of these bodies authenticates the caller or proves an action is authorized.

1. Review the exact insertion key or deletion order and caller authorization.
2. Use the separately established caller transaction and constraints when assessing partial failure.

## Security form branches and checkpoint display

No. The all-forms branch applies active-form, parent and restricted-ID logic, with a supplied authorized-user bypass. The explicit-user branch selects SECURITY/checkpoint matches without repeating those filters. Resource fallbacks and checkpoint display values are not authentication.

1. Determine @allForms and inspect the branch-specific predicates.
2. Resolve culture/resource fallback separately from permission enforcement.

## Security migration report persistent staging

It creates, fills, updates and drops an ordinary table named tempSecurityCheck. The name has no # prefix. It reports old-enabled/new-disabled permission mappings, but concurrent calls can collide and failure before the final DROP can leave the table behind.

1. Review the create/populate/compare sequence and persistent staging target.
2. Establish caller isolation and failure cleanup before any separately authorized execution.

## Yard visibility detail and total differences

Detail includes actual or scheduled trailer locations; header totals join actual locations only. Receipt and appointment joins can multiply rows and sums, while only selected identifiers are counted distinctly. NOLOCK also limits consistent interpretation.

1. Compare actual-versus-scheduled location selection.
2. Inspect receipt/detail/appointment multiplicity before comparing counts or quantities.

## Dock transfer context, work flags and grid settings

The transfer context routine only returns container and shipment selections. A different dock-work routine updates a flag then calls a container helper, even if the source lookup produces NULL. Grid customization is a separate insert-if-missing operation.

1. Identify the context getter versus work-state mutation.
2. Account for unordered TOP 1 context and the delegated container update.

## Session timeout units and activity samples

The timeout routine divides elapsed seconds by 86400.0, so its interval is in days. The sampling report generates 30-second timestamps and counts overlapping session rows by coded user type, not distinct employees; its recursion has no duration cap.

1. Interpret the timeout unit from the expression.
2. Bound a separately authorized sampling request and distinguish sessions from people.

## Inventory diagnostic count definitions

The age reports filter inventory record timestamps. Negative-history reports count negative after-state transaction records, not transitions or distinct locations. The shipping mismatch compares on-hand quantity only; allocated quantity is displayed but not compared, and missing shipping aggregates are excluded.

1. Read the source predicate and counting unit before interpreting a report title.
2. Check NULL joins, server-local time windows and location/warehouse identity.

## Bill-of-material inventory context

Its EXISTS test uses item, location and warehouse without company or available-quantity logic. Item attributes, configuration status and DISTINCT detail selection add context; the body does not reserve stock or assemble a product.

1. Check the exact item and company join separately from inventory existence.
2. Use separately evidenced availability and reservation rules for operational decisions.

## Bill-of-lading address and line selection

Yes. The container branch includes internal MOP number and container type; the shipment-detail fallback omits those columns. Address selection follows record existence and address-1 selectors, so an individual NULL address field does not necessarily fall back to another source.

1. Review the header address CASE selection and coded freight category.
2. Determine whether any container exists before binding the second result shape.

## Verification and limits

Every retained body was read, including executable text on lines containing omitted-comment markers. Source hashes and equivalence to private-original redaction are recorded in the local receipt; raw strings and comments are not copied into this artifact. The public contracts retain explicit opaque selector gaps. Exact dependency identities and high-risk branches were checked separately.

No claim of active application binding, correct live permissions, safe operational execution, complete process duration or production acceptance follows. The security migration procedure uses an ordinary staging table and requires particular care in any separately authorized run.

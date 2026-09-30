# Retained statement runtime profiles

These profiles explain captured statement activity. They do not measure complete warehouse process duration. Current object names are lookup context, not proof that the historical statistics used the current definition.

The retained 1,795 rows produce 163 separate object/replica/execution-type profiles for 163 historical IDs. All source row positions and dimensions remain in [runtime-profiles.json](mappings/runtime-profiles.json).

Weighted mean = total execution-weighted microseconds / statement executions / 1,000. Execution types and replica groups are kept separate. A missing profile does not establish an unused routine.

| Current name or unresolved historical ID | Replica group | Execution type | Statement executions | Weighted mean statement ms | Retained rows |
| --- | ---: | --- | ---: | ---: | ---: |
| Unresolved ID 776650110 | 1 | Regular | 637,756 | 2.402 | 734 |
| Unresolved ID 906798638 | 1 | Regular | 315,302 | 3.292 | 306 |
| Unresolved ID 1811797812 | 1 | Regular | 219,217 | 2.121 | 214 |
| dbo.WRK_GetWorkInstructionsForExecution | 1 | Regular | 99,418 | 2.330 | 102 |
| Unresolved ID 1195463633 | 1 | Regular | 54,236 | 2.513 | 55 |
| dbo.RPT_1348 | 1 | Regular | 595 | 197.882 | 5 |
| dbo.fn_GetFeatureEnabled | 1 | Regular | 23,810 | 1.489 | 5 |
| dbo.INV_InsertLocationInventory | 1 | Regular | 4,661 | 4.573 | 5 |
| dbo.SHP_InsightDetailPaneData | 1 | Regular | 1,791 | 9.587 | 5 |
| dbo.SRC_WorkConfiguratorModel | 1 | Regular | 3,802 | 4.407 | 5 |
| dbo.SECfn_GetSecurityCheckPoint | 1 | Regular | 47,191 | 0.267 | 5 |
| dbo.INV_UpdateLocation | 1 | Regular | 8,112 | 1.408 | 5 |
| dbo.STH_UpdateHeader | 1 | Regular | 6,231 | 1.745 | 5 |
| Unresolved ID 140123840 | 1 | Regular | 13,854 | 0.725 | 22 |
| dbo.HIST_SaveTransHist | 1 | Regular | 24,698 | 0.332 | 5 |
| dbo.SHP_MOPInsightDetailPaneData | 1 | Regular | 16 | 429.155 | 4 |
| dbo.TRAV_EX01_GetPackSizeWaveContainerData | 1 | Regular | 14 | 368.476 | 3 |
| dbo.WRK_GetWorkUnits | 1 | Regular | 916 | 5.313 | 5 |
| dbo.WAVE_InsightDetailPaneData | 1 | Regular | 1,554 | 2.287 | 4 |
| dbo.WRK_InsertWorkInstruction | 1 | Regular | 1,162 | 3.024 | 5 |
| Unresolved ID 558937363 | 1 | Regular | 3,622 | 0.969 | 7 |
| dbo.wm_IShippingContainer01 | 1 | Regular | 696 | 4.982 | 4 |
| dbo.INV_InsightDetailPaneData | 1 | Regular | 815 | 3.639 | 5 |
| dbo.INV_PickFromLocation | 1 | Regular | 10,684 | 0.226 | 2 |
| dbo.SHP_SetStatusesAtShipConfirm | 1 | Regular | 2,176 | 1.011 | 1 |
| dbo.INV_PutIntoLocation | 1 | Regular | 12,101 | 0.168 | 2 |
| dbo.WTH_DeactivateWork | 1 | Regular | 328 | 5.126 | 2 |
| dbo.SHP_GetStatusFlowFromContainer | 1 | Regular | 1,044 | 1.449 | 2 |
| Unresolved ID 638937648 | 1 | Regular | 310 | 4.292 | 6 |
| dbo.WTH_UpdateHeader | 1 | Regular | 1,000 | 1.306 | 2 |
| Unresolved ID 1574556943 | 1 | Regular | 6,645 | 0.193 | 27 |
| dbo.MetaTrans_Dashboard | 1 | Regular | 390 | 3.072 | 2 |
| Unresolved ID 622937591 | 1 | Regular | 87 | 12.302 | 6 |
| dbo.STH_UpdateOrderStatus | 1 | Regular | 65 | 16.177 | 1 |
| dbo.MetaTrans_ShippingContainerQC | 1 | Regular | 144 | 7.296 | 3 |
| dbo.INVfn_RtrvItemInfo | 1 | Regular | 3,180 | 0.267 | 2 |
| dbo.WRK_UpdateWorkInstruction | 1 | Regular | 109 | 6.873 | 2 |
| dbo.INV_AdjustInv | 1 | Regular | 2,173 | 0.313 | 2 |
| dbo.SDB_MoveQtyToSts01 | 1 | Regular | 2,614 | 0.242 | 2 |
| dbo.STSfn_RtrvStsName | 1 | Regular | 41,985 | 0.014 | 3 |
| dbo.INV_LoadInsightDetailPaneData | 1 | Regular | 342 | 1.543 | 2 |
| dbo.ADT_IAuditLogValue | 1 | Regular | 2,856 | 0.164 | 2 |
| dbo.INV_UpdateFromLocInv | 1 | Regular | 1,590 | 0.243 | 2 |
| dbo.INV_UpdateToLocInv | 1 | Regular | 537 | 0.642 | 2 |
| dbo.SHPContainer_InsightListPaneData | 1 | Regular | 220 | 1.538 | 2 |
| dbo.INV_CheckLocThreshold | 1 | Regular | 2,014 | 0.162 | 2 |
| dbo.INV_RtrvRplnLocCapacity | 1 | Regular | 830 | 0.353 | 2 |
| dbo.WRK_DeactivateWork | 1 | Regular | 68 | 4.030 | 1 |
| dbo.INV_CopyLocUmsForDestInventory | 1 | Regular | 733 | 0.362 | 2 |
| dbo.TRAV_LBL_ContainerContentsHeader | 1 | Regular | 193 | 1.091 | 1 |
| dbo.TRAV_EX08_ScheduledJob | 1 | Regular | 166 | 1.244 | 4 |
| dbo.RTH_UpdateHeader | 1 | Regular | 108 | 1.900 | 1 |
| dbo.MetaTrans_GetCloseContainer | 1 | Regular | 110 | 1.846 | 3 |
| dbo.CCP_InsightDetailPaneData | 1 | Regular | 304 | 0.665 | 1 |
| dbo.RSCMfn_RtrvResource | 1 | Regular | 6,274 | 0.031 | 3 |
| dbo.SaveUserLastActivityEndTime | 1 | Regular | 1,276 | 0.147 | 3 |
| dbo.WTH_UpdateDetailFull | 1 | Regular | 78 | 2.238 | 2 |
| dbo.INV_SaveHistInvChg | 1 | Regular | 1,951 | 0.084 | 2 |
| dbo.GENCONFIGfn_RtrvDesc | 1 | Regular | 4,381 | 0.025 | 3 |
| dbo.GetWarehouseTimezoneValue | 1 | Regular | 2,058 | 0.052 | 2 |
| dbo.SHP_UpdateFreightCharges | 1 | Regular | 256 | 0.365 | 2 |
| dbo.MetaTrans_GetInventoryTransfer | 1 | Regular | 25 | 3.687 | 2 |
| dbo.GENCONFIGfn_RtrvTranslatedDesc | 1 | Regular | 3,059 | 0.028 | 2 |
| dbo.TRAV_LBL_ContainerContentsDetails | 1 | Regular | 193 | 0.414 | 1 |
| dbo.INV_ArchiveSerialNumbers | 1 | Regular | 518 | 0.150 | 2 |
| dbo.wm_IReceiptHeader01 | 1 | Regular | 10 | 7.652 | 2 |
| dbo.WAVE_UpdateStatistics01 | 1 | Regular | 59 | 1.244 | 1 |
| dbo.STH_UpdateLoad | 1 | Regular | 374 | 0.167 | 2 |
| dbo.ship_container_tree_unit_a_i | 1 | Regular | 41 | 1.418 | 1 |
| dbo.wm_RItem07 | 1 | Regular | 54 | 1.017 | 2 |
| dbo.ADT_LogAudit | 1 | Regular | 239 | 0.228 | 2 |
| dbo.wm_IProcessHistory01 | 1 | Regular | 20 | 2.665 | 2 |
| dbo.ITMfn_RtrvUnitOfMeasure | 1 | Regular | 86 | 0.614 | 2 |
| dbo.wm_RItemUnitOfMeasure02 | 1 | Regular | 54 | 0.973 | 2 |
| dbo.wm_RInterfaceFlowStep02 | 1 | Regular | 528 | 0.088 | 4 |
| dbo.ILSStatusToText | 3 | Regular | 7,224 | 0.006 | 1 |
| dbo.CompleteWave_UpdateContSts | 1 | Regular | 41 | 1.034 | 1 |
| dbo.WRK_UpdateParentInstructionLnk | 1 | Regular | 109 | 0.386 | 2 |
| dbo.WTH_DeactivateShippingLoadWork | 1 | Regular | 26 | 1.611 | 1 |
| dbo.EX06ValidateMOPNum_Weights | 1 | Regular | 120 | 0.346 | 2 |
| dbo.NNR_GetNextNumber | 1 | Regular | 172 | 0.231 | 2 |
| dbo.wm_RInterfaceDetail01 | 1 | Regular | 528 | 0.062 | 4 |
| dbo.CompleteWave_UpdateOdrDtlCond | 1 | Regular | 3 | 10.894 | 1 |
| dbo.CompleteWave_UpdateHdrSts | 1 | Regular | 21 | 1.505 | 1 |
| dbo.wm_IReceiptDetail01 | 1 | Regular | 54 | 0.581 | 2 |
| dbo.RCB_SetStatus | 1 | Regular | 54 | 0.573 | 1 |
| dbo.WTH_UpdateStatus | 1 | Regular | 54 | 0.566 | 1 |
| dbo.SHP_InsighInPoolDetailPaneData | 1 | Regular | 57 | 0.492 | 1 |
| dbo.wm_RSystemConfigDetail01 | 1 | Regular | 113 | 0.245 | 4 |
| dbo.wm_IShipmentAllocRequest01 | 1 | Regular | 23 | 1.119 | 1 |
| dbo.fn_AuditLogValueReturnValue | 1 | Regular | 460 | 0.051 | 2 |
| dbo.WAVE_AddShipment | 1 | Regular | 14 | 1.621 | 1 |
| dbo.wm_RInterfaceFlowStep01 | 1 | Regular | 352 | 0.064 | 4 |
| dbo.WAVE_RemoveShipment | 1 | Regular | 8 | 2.726 | 1 |
| dbo.wm_RInterfaceDetail02 | 1 | Regular | 44 | 0.491 | 4 |
| dbo.TRAV_EX02_WorkCreationAfterExitPoint | 1 | Regular | 68 | 0.317 | 2 |
| dbo.SHP_SetXOfYForShipment | 1 | Regular | 116 | 0.182 | 1 |
| dbo.CompleteWave_UpdateDtlSts | 1 | Regular | 21 | 0.968 | 1 |
| dbo.MetaTrans_GetInventoryAdjustment | 1 | Regular | 5 | 3.796 | 1 |
| dbo.RPT_Travis_Commercial_Invoice | 1 | Regular | 14 | 1.340 | 2 |
| dbo.RCPT_InsightDetailPaneData | 1 | Regular | 28 | 0.650 | 2 |
| dbo.wm_RItem09 | 1 | Regular | 54 | 0.298 | 2 |
| dbo.WRK_InsightDetailPaneData | 1 | Regular | 34 | 0.470 | 2 |
| dbo.TRNHST_InsightDetailPaneData | 1 | Regular | 18 | 0.857 | 3 |
| dbo.wm_RItemCrossReference03 | 1 | Regular | 54 | 0.264 | 2 |
| dbo.wm_RGenericConfigDetail02 | 1 | Regular | 191 | 0.070 | 2 |
| dbo.TRAV_CC_Reconcile | 1 | Regular | 8 | 1.624 | 1 |
| dbo.work_instruction_outgoing_pd | 1 | Regular | 218 | 0.059 | 2 |
| dbo.wm_RItem10 | 1 | Regular | 54 | 0.230 | 2 |
| dbo.wm_RItem02 | 1 | Regular | 69 | 0.175 | 2 |
| dbo.MetaTrans_ShipmentLevelManifesting | 1 | Regular | 16 | 0.729 | 2 |
| dbo.wm_RItem01 | 1 | Regular | 162 | 0.067 | 2 |
| dbo.TRAV_EX06UpdateMOPValues | 1 | Regular | 38 | 0.284 | 2 |
| dbo.INVfn_GetAvailableQuantity | 1 | Regular | 21 | 0.504 | 1 |
| dbo.wm_RFunctionalAreaStatusFlow01 | 1 | Regular | 128 | 0.082 | 2 |
| dbo.TRAV_EX01_InsertDataForPS | 1 | Regular | 28 | 0.362 | 1 |
| dbo.MetadataTransActiveWavesForWarehouse | 1 | Regular | 4 | 2.447 | 1 |
| dbo.WAVE_UpdateStatistics | 1 | Regular | 6 | 1.564 | 1 |
| dbo.wm_RStorageTemplateDetail03 | 1 | Regular | 143 | 0.065 | 2 |
| dbo.wm_RInterfaceHeader01 | 1 | Regular | 44 | 0.210 | 4 |
| dbo.CompleteWave_UpdateOdrHdrCond | 1 | Regular | 21 | 0.438 | 1 |
| dbo.TRAV_EX01_ReprintPS | 1 | Regular | 17 | 0.483 | 1 |
| dbo.MetaTrans_CycleCountQuickPlan | 1 | Regular | 54 | 0.148 | 1 |
| dbo.dbc_IArchiveSerialNumbersInShipLoad | 1 | Regular | 13 | 0.605 | 1 |
| dbo.wm_RStorageTemplateHeader02 | 1 | Regular | 54 | 0.143 | 2 |
| dbo.wm_RItemUnitOfMeasure01 | 1 | Regular | 159 | 0.047 | 2 |
| dbo.WRK_UpdateShipContWorkCreated | 1 | Regular | 44 | 0.154 | 1 |
| dbo.RCPT_ContainerInsightDetailPaneData | 1 | Regular | 11 | 0.574 | 1 |
| dbo.WAVE_TransferShipment | 1 | Regular | 4 | 1.497 | 1 |
| dbo.SHP_ProcessShipmentDeallocationAndHistory | 1 | Regular | 4 | 1.483 | 1 |
| dbo.SRC_ReceivingConfiguratorModel | 1 | Regular | 69 | 0.086 | 2 |
| dbo.WRK_UpdateRecWorkCreated | 1 | Regular | 64 | 0.082 | 2 |
| dbo.TRAV_EX01_UpdateContainerDetails | 1 | Regular | 8 | 0.627 | 1 |
| dbo.TRAV_EX01_GetPrintLabelDetails | 1 | Regular | 40 | 0.107 | 1 |
| dbo.WRK_UpdateWorkUnitName | 1 | Regular | 4 | 1.069 | 2 |
| dbo.wm_RStorageTemplateDetail02 | 1 | Regular | 54 | 0.068 | 2 |
| dbo.WRK_UpdateCCWorkCreated | 1 | Regular | 19 | 0.183 | 1 |
| dbo.wm_RReceiptHeader01 | 1 | Regular | 54 | 0.064 | 2 |
| dbo.SHP_SetXOfYForWave | 1 | Regular | 22 | 0.141 | 1 |
| dbo.shipment_accessorials_a_i | 1 | Regular | 55 | 0.050 | 1 |
| dbo.wm_RPackingClass02 | 1 | Regular | 7 | 0.353 | 2 |
| dbo.STSfn_RtrvAdjacentSts | 1 | Regular | 15 | 0.162 | 1 |
| dbo.STSfn_RtrvSts | 1 | Regular | 12 | 0.201 | 1 |
| dbo.wm_RCompany02 | 1 | Regular | 5 | 0.437 | 2 |
| dbo.SRC_SystemDirectedWorkConfiguratorModel | 1 | Regular | 16 | 0.115 | 2 |
| dbo.MetaTrans_GetInventory | 1 | Regular | 2 | 0.806 | 1 |
| dbo.wm_RWarehouse02 | 1 | Regular | 5 | 0.316 | 2 |
| dbo.WRK_UpdateInventoryWorkCreated | 1 | Regular | 4 | 0.363 | 2 |
| dbo.MetaTrans_GetPrintSelectedDocuments | 1 | Regular | 6 | 0.237 | 1 |
| dbo.wm_RCompany01 | 1 | Regular | 5 | 0.268 | 2 |
| dbo.wm_RWarehouseAlert02 | 1 | Regular | 10 | 0.134 | 2 |
| dbo.TRAV_UpdateWorkUnitName | 1 | Regular | 4 | 0.331 | 2 |
| dbo.TRAV_EX02LANEDataProcess | 1 | Regular | 4 | 0.316 | 1 |
| dbo.CancelWave_UpdateShipLdSts | 1 | Regular | 3 | 0.397 | 1 |
| dbo.MetaTrans_ReprintWaveLabels | 1 | Regular | 7 | 0.140 | 1 |
| dbo.ITMfn_CalcQtyForReqUm | 1 | Regular | 3 | 0.304 | 1 |
| dbo.CancelWave_UpdateOrderHeader | 1 | Regular | 5 | 0.157 | 1 |
| dbo.MetaTrans_GetLookup | 1 | Regular | 3 | 0.225 | 2 |
| dbo.RECEIPT_HEADER_A_I | 1 | Regular | 10 | 0.065 | 2 |
| dbo.TRAV_EX01_MarkForPS | 1 | Regular | 2 | 0.215 | 1 |
| dbo.MetaTrans_GetCycleCountMasterPlan | 1 | Regular | 1 | 0.299 | 1 |
| dbo.CancelShipment_UpdateOrderHeader | 1 | Regular | 3 | 0.066 | 1 |
| dbo.TRAV_EX02_SCALEtoWCSDIFOutUpdate | 1 | Regular | 1 | 0.193 | 1 |

## What would establish whole-process timing

- **What is the elapsed duration of a complete warehouse task?** Several application, database and external-service stages can overlap or wait. Minimum evidence: Existing sanitized application traces with one process correlation ID, start/end events, clock/unit definitions, retries and stage coverage.
- **Which service/job invokes this routine under the current configuration?** Static call edges omit application-side entry points and active schedules. Minimum evidence: Sanitized deployed service/version map and scheduler configuration for that named process, excluding operational payloads.
- **Which historical definition produced each retained runtime group?** Object IDs and names can survive definition changes or be reused. Minimum evidence: Existing deployment/version history matched to observation interval and object identity; do not infer it from current hashes.

Profiles ordered by aggregate elapsed statement time are a review-priority aid, not a claim of a performance defect or user-facing latency. The original [runtime interpretation](RUNTIME.md) retains observation, role and capture limits.

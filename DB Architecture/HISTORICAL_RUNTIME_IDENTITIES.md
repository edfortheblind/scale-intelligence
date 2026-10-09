# Historical runtime identities and retained activity

**Status: COMPLETE / OWNER-CLOSED - 2026-10-09.** The owner directed agent-authored documentation of the identities/runtime even where official documentation is unavailable, followed by completion of this section. This register implements that instruction using the retained snapshot; it supplies no new vendor authority or live observation.

**Documentation coverage: 163/163 historical IDs (100%).** Of these, **154/163 (94.48%)** have a name/type match in the captured catalog and **9/9** unmatched IDs have explicit unknown-identity dispositions. The remaining unknown names are accepted limits of this closed work package, not an outstanding review assignment. The 154/163 lookup measure is preserved; it has not been relabeled as complete historical name recovery.

## Evidence and reading guide

The source is snapshot `20260929T214106Z`, retained on September 29, 2026. Its **1,795 aggregate rows** produce **163 profiles** and account for **1,598,031 statement executions**. The earliest retained interval starts **2025-11-16T16:00:00Z** and the latest ends **2026-09-29T22:00:00Z**; the last interval had not ended at collection. These boundaries do not establish continuous capture or a current observation.

The 154 name matches are lookup context from the 3,022-object snapshot: **135 stored procedures, 12 scalar functions, three table-valued functions and four triggers**. Matching an object ID to that catalog does not prove which name or definition existed when an older statistic was recorded. Historical definition identity remains unestablished for all 163 IDs.

- Each catalog name below opens its existing object card for captured type, static source and dependencies. Those cards are source evidence; name alone does not establish business behavior or a currently active caller.
- The profile index points to `/profiles/<index>` in [runtime-profiles.json](mappings/runtime-profiles.json). That record retains exact raw-row positions, interval boundaries, weighted elapsed/CPU totals, extrema and source-definition context.
- Raw positions point into [query_store_runtime.json](catalog/query_store_runtime.json). Positions and profile indices are zero-based. The nine unmatched records also have exact interval IDs and bindings in [runtime-identity-disposition.json](mappings/runtime-identity-disposition.json).
- All 163 profiles have execution type **Regular**. Replica group **1** contains 162 profiles / 1,794 rows; group **3** contains one profile / one row. The captured replica catalog records role types 1 and 3 respectively. Group totals are kept separate in the source; role history does not establish current topology.

**Metric meaning.** Statement counts are sums of retained statement executions, not stored-procedure calls or completed warehouse tasks. Mean ms is the execution-weighted statement duration: `SUM(weighted_total_duration_us) / SUM(statement_executions) / 1,000`, displayed to six decimal places. CPU ms uses the corresponding weighted CPU total. These aggregates do not establish user-facing elapsed time, percentiles, current performance, invocation counts or a performance defect. See [runtime interpretation](RUNTIME.md) and [retained profile guidance](RUNTIME_PROFILES.md).

## Complete identity/runtime register

Type codes: **P** = captured stored procedure; **FN** = captured scalar function; **TF** = captured table-valued function; **TR** = captured trigger; **Unknown** = no type/name in the captured object or module catalogs. Codes describe the snapshot match, not the historical definition.

| Historical object ID | Captured catalog name / type | Profile index | Replica group | Rows | Statements | Mean ms |
| ---: | --- | ---: | ---: | ---: | ---: | ---: |
| 23319493 | [dbo.INV_RtrvRplnLocCapacity](objects/23319493.md) / P | 0 | 1 | 2 | 830 | 0.353305 |
| 51843597 | [dbo.WRK_GetWorkInstructionsForExecution](objects/51843597.md) / P | 1 | 1 | 102 | 99,418 | 2.329892 |
| 67843654 | [dbo.WRK_GetWorkUnits](objects/67843654.md) / P | 2 | 1 | 5 | 916 | 5.313037 |
| 132507851 | [dbo.TRAV_UpdateWorkUnitName](objects/132507851.md) / P | 3 | 1 | 2 | 4 | 0.331000 |
| 140123840 | [Unknown identity](#historical-id-140123840) / Unknown | 4 | 1 | 22 | 13,854 | 0.725468 |
| 148507908 | [dbo.TRAV_EX02_WorkCreationAfterExitPoint](objects/148507908.md) / P | 5 | 1 | 2 | 68 | 0.317412 |
| 170796016 | [dbo.wm_RStorageTemplateDetail02](objects/170796016.md) / P | 6 | 1 | 2 | 54 | 0.068167 |
| 174272026 | [dbo.TRNHST_InsightDetailPaneData](objects/174272026.md) / P | 7 | 1 | 3 | 18 | 0.856611 |
| 186796073 | [dbo.wm_RSystemConfigDetail01](objects/186796073.md) / P | 8 | 1 | 4 | 113 | 0.245354 |
| 199320120 | [dbo.STSfn_RtrvSts](objects/199320120.md) / FN | 9 | 1 | 1 | 12 | 0.200667 |
| 254272311 | [dbo.WAVE_AddShipment](objects/254272311.md) / P | 10 | 1 | 1 | 14 | 1.620714 |
| 258099960 | [dbo.WTH_UpdateHeader](objects/258099960.md) / P | 11 | 1 | 2 | 1,000 | 1.306419 |
| 270272368 | [dbo.WAVE_InsightDetailPaneData](objects/270272368.md) / P | 12 | 1 | 4 | 1,554 | 2.287281 |
| 277224388 | [dbo.MetadataTransActiveWavesForWarehouse](objects/277224388.md) / P | 13 | 1 | 1 | 4 | 2.447500 |
| 286272425 | [dbo.WAVE_RemoveShipment](objects/286272425.md) / P | 14 | 1 | 1 | 8 | 2.726250 |
| 318272539 | [dbo.WAVE_TransferShipment](objects/318272539.md) / P | 15 | 1 | 1 | 4 | 1.497000 |
| 334272596 | [dbo.WAVE_UpdateStatistics](objects/334272596.md) / P | 16 | 1 | 1 | 6 | 1.563833 |
| 350272653 | [dbo.WAVE_UpdateStatistics01](objects/350272653.md) / P | 17 | 1 | 1 | 59 | 1.243678 |
| 453225015 | [dbo.MetaTrans_CycleCountQuickPlan](objects/453225015.md) / P | 18 | 1 | 1 | 54 | 0.148167 |
| 469225072 | [dbo.MetaTrans_Dashboard](objects/469225072.md) / P | 19 | 1 | 2 | 390 | 3.072121 |
| 533225300 | [dbo.MetaTrans_GetCloseContainer](objects/533225300.md) / P | 20 | 1 | 3 | 110 | 1.846064 |
| 558937363 | [Unknown identity](#historical-id-558937363) / Unknown | 21 | 1 | 7 | 3,622 | 0.968784 |
| 565225414 | [dbo.MetaTrans_GetCycleCountMasterPlan](objects/565225414.md) / P | 22 | 1 | 1 | 1 | 0.299000 |
| 567321431 | [dbo.wm_RCompany01](objects/567321431.md) / P | 23 | 1 | 2 | 5 | 0.267800 |
| 597225528 | [dbo.MetaTrans_GetInventory](objects/597225528.md) / P | 24 | 1 | 1 | 2 | 0.806000 |
| 613225585 | [dbo.MetaTrans_GetInventoryAdjustment](objects/613225585.md) / P | 25 | 1 | 1 | 5 | 3.796200 |
| 622937591 | [Unknown identity](#historical-id-622937591) / Unknown | 26 | 1 | 6 | 87 | 12.301713 |
| 631165494 | [dbo.fn_AuditLogValueReturnValue](objects/631165494.md) / FN | 27 | 1 | 2 | 460 | 0.050965 |
| 638937648 | [Unknown identity](#historical-id-638937648) / Unknown | 28 | 1 | 6 | 310 | 4.292142 |
| 661225756 | [dbo.MetaTrans_GetInventoryTransfer](objects/661225756.md) / P | 29 | 1 | 2 | 25 | 3.686520 |
| 680701823 | [dbo.fn_GetFeatureEnabled](objects/680701823.md) / FN | 30 | 1 | 5 | 23,810 | 1.488530 |
| 702273907 | [dbo.wm_IProcessHistory01](objects/702273907.md) / P | 31 | 1 | 2 | 20 | 2.665200 |
| 720057651 | [dbo.RECEIPT_HEADER_A_I](objects/720057651.md) / TR | 32 | 1 | 2 | 10 | 0.064800 |
| 728701994 | [dbo.GENCONFIGfn_RtrvDesc](objects/728701994.md) / FN | 33 | 1 | 3 | 4,381 | 0.024928 |
| 744702051 | [dbo.GENCONFIGfn_RtrvTranslatedDesc](objects/744702051.md) / FN | 34 | 1 | 2 | 3,059 | 0.027983 |
| 752057765 | [dbo.shipment_accessorials_a_i](objects/752057765.md) / TR | 35 | 1 | 1 | 55 | 0.049673 |
| 766274135 | [dbo.wm_IReceiptDetail01](objects/766274135.md) / P | 36 | 1 | 2 | 54 | 0.580815 |
| 768057822 | [dbo.ship_container_tree_unit_a_i](objects/768057822.md) / TR | 37 | 1 | 1 | 41 | 1.417854 |
| 773226155 | [dbo.MetaTrans_GetLookup](objects/773226155.md) / P | 38 | 1 | 2 | 3 | 0.225000 |
| 776650110 | [Unknown identity](#historical-id-776650110) / Unknown | 39 | 1 | 734 | 637,756 | 2.402267 |
| 782274192 | [dbo.wm_IReceiptHeader01](objects/782274192.md) / P | 40 | 1 | 2 | 10 | 7.651800 |
| 800057936 | [dbo.work_instruction_outgoing_pd](objects/800057936.md) / TR | 41 | 1 | 2 | 218 | 0.058972 |
| 807322286 | [dbo.wm_RFunctionalAreaStatusFlow01](objects/807322286.md) / P | 42 | 1 | 2 | 128 | 0.081891 |
| 830274363 | [dbo.wm_IShipmentAllocRequest01](objects/830274363.md) / P | 43 | 1 | 1 | 23 | 1.118696 |
| 839062125 | [dbo.RPT_Travis_Commercial_Invoice](objects/839062125.md) / P | 44 | 1 | 2 | 14 | 1.340214 |
| 839322400 | [dbo.wm_RGenericConfigDetail02](objects/839322400.md) / P | 45 | 1 | 2 | 191 | 0.069513 |
| 890798581 | [dbo.WRK_DeactivateWork](objects/890798581.md) / P | 46 | 1 | 1 | 68 | 4.030206 |
| 901226611 | [dbo.MetaTrans_GetPrintSelectedDocuments](objects/901226611.md) / P | 47 | 1 | 1 | 6 | 0.236667 |
| 903322628 | [dbo.wm_RInterfaceDetail01](objects/903322628.md) / P | 48 | 1 | 4 | 528 | 0.061987 |
| 906798638 | [Unknown identity](#historical-id-906798638) / Unknown | 49 | 1 | 306 | 315,302 | 3.291512 |
| 908178631 | [dbo.ADT_IAuditLogValue](objects/908178631.md) / P | 50 | 1 | 2 | 2,856 | 0.163604 |
| 910274648 | [dbo.wm_IShippingContainer01](objects/910274648.md) / P | 51 | 1 | 4 | 696 | 4.982326 |
| 919322685 | [dbo.wm_RInterfaceDetail02](objects/919322685.md) / P | 52 | 1 | 4 | 44 | 0.491068 |
| 935322742 | [dbo.wm_RInterfaceHeader01](objects/935322742.md) / P | 53 | 1 | 4 | 44 | 0.210477 |
| 938798752 | [dbo.WRK_InsertWorkInstruction](objects/938798752.md) / P | 54 | 1 | 5 | 1,162 | 3.023976 |
| 940178745 | [dbo.ADT_LogAudit](objects/940178745.md) / P | 55 | 1 | 2 | 239 | 0.228197 |
| 951322799 | [dbo.wm_RItem01](objects/951322799.md) / P | 56 | 1 | 2 | 162 | 0.066926 |
| 954798809 | [dbo.WRK_InsightDetailPaneData](objects/954798809.md) / P | 57 | 1 | 2 | 34 | 0.469882 |
| 967322856 | [dbo.wm_RItem02](objects/967322856.md) / P | 58 | 1 | 2 | 69 | 0.174652 |
| 972178859 | [dbo.CancelShipment_UpdateOrderHeader](objects/972178859.md) / P | 59 | 1 | 1 | 3 | 0.065667 |
| 988842885 | [dbo.TRAV_CC_Reconcile](objects/988842885.md) / P | 60 | 1 | 1 | 8 | 1.624125 |
| 1000702963 | [dbo.GetWarehouseTimezoneValue](objects/1000702963.md) / FN | 61 | 1 | 2 | 2,058 | 0.051667 |
| 1004178973 | [dbo.CancelWave_UpdateOrderHeader](objects/1004178973.md) / P | 62 | 1 | 1 | 5 | 0.157000 |
| 1020179030 | [dbo.CancelWave_UpdateShipLdSts](objects/1020179030.md) / P | 63 | 1 | 1 | 3 | 0.396667 |
| 1047323141 | [dbo.wm_RItem07](objects/1047323141.md) / P | 64 | 1 | 2 | 54 | 1.017074 |
| 1063323198 | [dbo.wm_RItemCrossReference03](objects/1063323198.md) / P | 65 | 1 | 2 | 54 | 0.264296 |
| 1080703248 | [dbo.HIST_SaveTransHist](objects/1080703248.md) / P | 66 | 1 | 5 | 24,698 | 0.331773 |
| 1095323312 | [dbo.wm_RItemUnitOfMeasure01](objects/1095323312.md) / P | 67 | 1 | 2 | 159 | 0.046975 |
| 1105751342 | [dbo.RSCMfn_RtrvResource](objects/1105751342.md) / FN | 68 | 1 | 3 | 6,274 | 0.031376 |
| 1118275389 | [dbo.wm_RCompany02](objects/1118275389.md) / P | 69 | 1 | 2 | 5 | 0.436600 |
| 1121751399 | [dbo.RTH_UpdateHeader](objects/1121751399.md) / P | 70 | 1 | 1 | 108 | 1.900000 |
| 1128703419 | [dbo.INV_AdjustInv](objects/1128703419.md) / P | 71 | 1 | 2 | 2,173 | 0.312839 |
| 1144703476 | [dbo.INV_ArchiveSerialNumbers](objects/1144703476.md) / P | 72 | 1 | 2 | 518 | 0.150199 |
| 1148179486 | [dbo.CCP_InsightDetailPaneData](objects/1148179486.md) / P | 73 | 1 | 1 | 304 | 0.665000 |
| 1153751513 | [dbo.SaveUserLastActivityEndTime](objects/1153751513.md) / P | 74 | 1 | 3 | 1,276 | 0.146679 |
| 1157227523 | [dbo.MetaTrans_ReprintWaveLabels](objects/1157227523.md) / P | 75 | 1 | 1 | 7 | 0.140429 |
| 1160703533 | [dbo.INV_CheckLocThreshold](objects/1160703533.md) / P | 76 | 1 | 2 | 2,014 | 0.161750 |
| 1165247206 | [dbo.ILSStatusToText](objects/1165247206.md) / FN | 77 | 3 | 1 | 7,224 | 0.006065 |
| 1173227580 | [dbo.MetaTrans_ShipmentLevelManifesting](objects/1173227580.md) / P | 78 | 1 | 2 | 16 | 0.729000 |
| 1176703590 | [dbo.INV_CopyLocUmsForDestInventory](objects/1176703590.md) / P | 79 | 1 | 2 | 733 | 0.361843 |
| 1178799607 | [dbo.WRK_UpdateCCWorkCreated](objects/1178799607.md) / P | 80 | 1 | 1 | 19 | 0.182737 |
| 1195463633 | [Unknown identity](#historical-id-1195463633) / Unknown | 81 | 1 | 55 | 54,236 | 2.512664 |
| 1205227694 | [dbo.MetaTrans_ShippingContainerQC](objects/1205227694.md) / P | 82 | 1 | 3 | 144 | 7.296500 |
| 1210799721 | [dbo.WRK_UpdateInventoryWorkCreated](objects/1210799721.md) / P | 83 | 1 | 2 | 4 | 0.363250 |
| 1226799778 | [dbo.WRK_UpdateParentInstructionLnk](objects/1226799778.md) / P | 84 | 1 | 2 | 109 | 0.385844 |
| 1230275788 | [dbo.wm_RInterfaceFlowStep01](objects/1230275788.md) / P | 85 | 1 | 4 | 352 | 0.064071 |
| 1240703818 | [dbo.INV_InsertLocationInventory](objects/1240703818.md) / P | 86 | 1 | 5 | 4,661 | 4.573265 |
| 1242799835 | [dbo.WRK_UpdateRecWorkCreated](objects/1242799835.md) / P | 87 | 1 | 2 | 64 | 0.081687 |
| 1246275845 | [dbo.wm_RInterfaceFlowStep02](objects/1246275845.md) / P | 88 | 1 | 4 | 528 | 0.088140 |
| 1271323939 | [dbo.wm_RPackingClass02](objects/1271323939.md) / P | 89 | 1 | 2 | 7 | 0.353429 |
| 1272703932 | [dbo.INV_InsightDetailPaneData](objects/1272703932.md) / P | 90 | 1 | 5 | 815 | 3.639144 |
| 1274799949 | [dbo.WRK_UpdateShipContWorkCreated](objects/1274799949.md) / P | 91 | 1 | 1 | 44 | 0.154159 |
| 1275151588 | [dbo.TRAV_LBL_ContainerContentsHeader](objects/1275151588.md) / P | 92 | 1 | 1 | 193 | 1.091021 |
| 1276179942 | [dbo.CompleteWave_UpdateContSts](objects/1276179942.md) / P | 93 | 1 | 1 | 41 | 1.034098 |
| 1291151645 | [dbo.TRAV_LBL_ContainerContentsDetails](objects/1291151645.md) / P | 94 | 1 | 1 | 193 | 0.413959 |
| 1292179999 | [dbo.CompleteWave_UpdateDtlSts](objects/1292179999.md) / P | 95 | 1 | 1 | 21 | 0.967571 |
| 1304704046 | [dbo.INV_LoadInsightDetailPaneData](objects/1304704046.md) / P | 96 | 1 | 2 | 342 | 1.543307 |
| 1308180056 | [dbo.CompleteWave_UpdateHdrSts](objects/1308180056.md) / P | 97 | 1 | 1 | 21 | 1.504714 |
| 1310276073 | [dbo.wm_RItem09](objects/1310276073.md) / P | 98 | 1 | 2 | 54 | 0.297852 |
| 1322800120 | [dbo.WRK_UpdateWorkInstruction](objects/1322800120.md) / P | 99 | 1 | 2 | 109 | 6.873101 |
| 1324180113 | [dbo.CompleteWave_UpdateOdrDtlCond](objects/1324180113.md) / P | 100 | 1 | 1 | 3 | 10.894000 |
| 1326276130 | [dbo.wm_RItem10](objects/1326276130.md) / P | 101 | 1 | 2 | 54 | 0.230296 |
| 1339151816 | [dbo.TRAV_EX08_ScheduledJob](objects/1339151816.md) / P | 102 | 1 | 4 | 166 | 1.244060 |
| 1340180170 | [dbo.CompleteWave_UpdateOdrHdrCond](objects/1340180170.md) / P | 103 | 1 | 1 | 21 | 0.437619 |
| 1340583864 | [dbo.SRC_WorkConfiguratorModel](objects/1340583864.md) / P | 104 | 1 | 5 | 3,802 | 4.407176 |
| 1370800291 | [dbo.WRK_UpdateWorkUnitName](objects/1370800291.md) / P | 105 | 1 | 2 | 4 | 1.068750 |
| 1374276301 | [dbo.wm_RItemUnitOfMeasure02](objects/1374276301.md) / P | 106 | 1 | 2 | 54 | 0.972852 |
| 1399324395 | [dbo.wm_RReceiptHeader01](objects/1399324395.md) / P | 107 | 1 | 2 | 54 | 0.064167 |
| 1400704388 | [dbo.INV_PickFromLocation](objects/1400704388.md) / P | 108 | 1 | 2 | 10,684 | 0.225698 |
| 1402800405 | [dbo.WTH_DeactivateShippingLoadWork](objects/1402800405.md) / P | 109 | 1 | 1 | 26 | 1.611038 |
| 1413228435 | [dbo.NNR_GetNextNumber](objects/1413228435.md) / P | 110 | 1 | 2 | 172 | 0.230564 |
| 1418800462 | [dbo.WTH_DeactivateWork](objects/1418800462.md) / P | 111 | 1 | 2 | 328 | 5.125823 |
| 1458208345 | [dbo.TRAV_EX01_GetPrintLabelDetails](objects/1458208345.md) / P | 112 | 1 | 1 | 40 | 0.107500 |
| 1464704616 | [dbo.INV_PutIntoLocation](objects/1464704616.md) / P | 113 | 1 | 2 | 12,101 | 0.168316 |
| 1473752653 | [dbo.SDB_MoveQtyToSts01](objects/1473752653.md) / P | 114 | 1 | 2 | 2,614 | 0.241928 |
| 1474208402 | [dbo.TRAV_EX01_InsertDataForPS](objects/1474208402.md) / P | 115 | 1 | 1 | 28 | 0.361821 |
| 1496704730 | [dbo.INV_SaveHistInvChg](objects/1496704730.md) / P | 116 | 1 | 2 | 1,951 | 0.083707 |
| 1498800747 | [dbo.WTH_UpdateDetailFull](objects/1498800747.md) / P | 117 | 1 | 2 | 78 | 2.237923 |
| 1515152443 | [dbo.STH_UpdateOrderStatus](objects/1515152443.md) / P | 118 | 1 | 1 | 65 | 16.177431 |
| 1522208573 | [dbo.TRAV_EX02LANEDataProcess](objects/1522208573.md) / P | 119 | 1 | 1 | 4 | 0.316000 |
| 1528704844 | [dbo.INV_UpdateFromLocInv](objects/1528704844.md) / P | 120 | 1 | 2 | 1,590 | 0.242710 |
| 1537752881 | [dbo.SECfn_GetSecurityCheckPoint](objects/1537752881.md) / TF | 121 | 1 | 5 | 47,191 | 0.267168 |
| 1544704901 | [dbo.INV_UpdateLocation](objects/1544704901.md) / P | 122 | 1 | 5 | 8,112 | 1.407953 |
| 1560704958 | [dbo.INV_UpdateToLocInv](objects/1560704958.md) / P | 123 | 1 | 2 | 537 | 0.641814 |
| 1570208744 | [dbo.TRAV_EX06UpdateMOPValues](objects/1570208744.md) / P | 124 | 1 | 2 | 38 | 0.284079 |
| 1574556943 | [Unknown identity](#historical-id-1574556943) / Unknown | 125 | 1 | 27 | 6,645 | 0.193238 |
| 1578801032 | [dbo.WTH_UpdateStatus](objects/1578801032.md) / P | 126 | 1 | 1 | 54 | 0.566093 |
| 1586208801 | [dbo.EX06ValidateMOPNum_Weights](objects/1586208801.md) / P | 127 | 1 | 2 | 120 | 0.345750 |
| 1601753109 | [dbo.SHP_GetStatusFlowFromContainer](objects/1601753109.md) / P | 128 | 1 | 2 | 1,044 | 1.449485 |
| 1617753166 | [dbo.SHP_InsighInPoolDetailPaneData](objects/1617753166.md) / P | 129 | 1 | 1 | 57 | 0.491807 |
| 1633753223 | [dbo.SHP_InsightDetailPaneData](objects/1633753223.md) / P | 130 | 1 | 5 | 1,791 | 9.586951 |
| 1672705357 | [dbo.INVfn_GetAvailableQuantity](objects/1672705357.md) / FN | 131 | 1 | 1 | 21 | 0.503810 |
| 1687325421 | [dbo.wm_RStorageTemplateDetail03](objects/1687325421.md) / P | 132 | 1 | 2 | 143 | 0.065070 |
| 1719325535 | [dbo.wm_RStorageTemplateHeader02](objects/1719325535.md) / P | 133 | 1 | 2 | 54 | 0.142667 |
| 1720705528 | [dbo.INVfn_RtrvItemInfo](objects/1720705528.md) / TF | 134 | 1 | 2 | 3,180 | 0.267285 |
| 1745753622 | [dbo.SHP_MOPInsightDetailPaneData](objects/1745753622.md) / P | 135 | 1 | 4 | 16 | 429.155125 |
| 1746209371 | [dbo.TRAV_EX01_UpdateContainerDetails](objects/1746209371.md) / P | 136 | 1 | 1 | 8 | 0.627500 |
| 1777753736 | [dbo.SHP_ProcessShipmentDeallocationAndHistory](objects/1777753736.md) / P | 137 | 1 | 1 | 4 | 1.482750 |
| 1788181766 | [dbo.dbc_IArchiveSerialNumbersInShipLoad](objects/1788181766.md) / P | 138 | 1 | 1 | 13 | 0.604846 |
| 1809753850 | [dbo.SHP_SetStatusesAtShipConfirm](objects/1809753850.md) / P | 139 | 1 | 1 | 2,176 | 1.010671 |
| 1811797812 | [Unknown identity](#historical-id-1811797812) / Unknown | 140 | 1 | 214 | 219,217 | 2.120550 |
| 1816705870 | [dbo.ITMfn_CalcQtyForReqUm](objects/1816705870.md) / FN | 141 | 1 | 1 | 3 | 0.304000 |
| 1825753907 | [dbo.SHP_SetXOfYForShipment](objects/1825753907.md) / P | 142 | 1 | 1 | 116 | 0.182190 |
| 1832705927 | [dbo.ITMfn_RtrvUnitOfMeasure](objects/1832705927.md) / TF | 143 | 1 | 2 | 86 | 0.614372 |
| 1833317841 | [dbo.TRAV_EX01_GetPackSizeWaveContainerData](objects/1833317841.md) / P | 144 | 1 | 3 | 14 | 368.476286 |
| 1841753964 | [dbo.SHP_SetXOfYForWave](objects/1841753964.md) / P | 145 | 1 | 1 | 22 | 0.141409 |
| 1847325991 | [dbo.wm_RWarehouse02](objects/1847325991.md) / P | 146 | 1 | 2 | 5 | 0.316200 |
| 1849317898 | [dbo.TRAV_EX02_SCALEtoWCSDIFOutUpdate](objects/1849317898.md) / P | 147 | 1 | 1 | 1 | 0.193000 |
| 1861177976 | [dbo.TRAV_EX01_MarkForPS](objects/1861177976.md) / P | 148 | 1 | 1 | 2 | 0.215000 |
| 1877178033 | [dbo.TRAV_EX01_ReprintPS](objects/1877178033.md) / P | 149 | 1 | 1 | 17 | 0.482706 |
| 1895326162 | [dbo.wm_RWarehouseAlert02](objects/1895326162.md) / P | 150 | 1 | 2 | 10 | 0.133500 |
| 1905754192 | [dbo.SHP_UpdateFreightCharges](objects/1905754192.md) / P | 151 | 1 | 2 | 256 | 0.365332 |
| 1909230202 | [dbo.RCB_SetStatus](objects/1909230202.md) / P | 152 | 1 | 1 | 54 | 0.573222 |
| 1925230259 | [dbo.RCPT_ContainerInsightDetailPaneData](objects/1925230259.md) / P | 153 | 1 | 1 | 11 | 0.574182 |
| 1937754306 | [dbo.SHPContainer_InsightListPaneData](objects/1937754306.md) / P | 154 | 1 | 2 | 220 | 1.538082 |
| 1957230373 | [dbo.RCPT_InsightDetailPaneData](objects/1957230373.md) / P | 155 | 1 | 2 | 28 | 0.650321 |
| 2001754534 | [dbo.SRC_ReceivingConfiguratorModel](objects/2001754534.md) / P | 156 | 1 | 2 | 69 | 0.085797 |
| 2017754591 | [dbo.SRC_SystemDirectedWorkConfiguratorModel](objects/2017754591.md) / P | 157 | 1 | 2 | 16 | 0.114750 |
| 2065754762 | [dbo.STH_UpdateHeader](objects/2065754762.md) / P | 158 | 1 | 5 | 6,231 | 1.745409 |
| 2071678428 | [dbo.RPT_1348](objects/2071678428.md) / P | 159 | 1 | 5 | 595 | 197.881805 |
| 2081754819 | [dbo.STH_UpdateLoad](objects/2081754819.md) / P | 160 | 1 | 2 | 374 | 0.167307 |
| 2097754876 | [dbo.STSfn_RtrvAdjacentSts](objects/2097754876.md) / FN | 161 | 1 | 1 | 15 | 0.161867 |
| 2129754990 | [dbo.STSfn_RtrvStsName](objects/2129754990.md) / FN | 162 | 1 | 3 | 41,985 | 0.013672 |

## Nine identities documented with bounded unknowns

These nine IDs account for **1,377 rows** and **1,251,029 statement executions**. Each has replica group **1**, captured role type **1**, and execution type **Regular**. Neither the 3,022-object catalog nor the 1,142-module catalog contains any of the nine. The aggregate export contains no historical query text, object-name/type/definition mapping or application caller. The retained procedure/function/trigger cache exports are empty; emptiness does not establish non-use.

For each record, the agent-authored description is therefore **historical statement activity attached to this numeric ID, with the original name, object type, business function and definition unknown**. Its measured aggregate activity can be documented; an original routine name or workflow cannot be responsibly reconstructed from timing similarity, a nearby ID or a naming convention. Absence does not establish deletion, renaming, replacement, non-use or a particular deployment change.

### Historical ID 140123840

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/4` binds raw rows **111-132 inclusive** (22 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-02-12T15:00:00Z** through **2026-02-14T16:00:00Z**. The rows record **13,854 statement executions**, weighted mean statement duration **0.725468 ms**, and weighted mean CPU **0.706183 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 558937363

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/21` binds raw rows **163-169 inclusive** (7 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-08-14T13:00:00Z** through **2026-08-14T20:00:00Z**. The rows record **3,622 statement executions**, weighted mean statement duration **0.968784 ms**, and weighted mean CPU **0.909084 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 622937591

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/26` binds raw rows **175-180 inclusive** (6 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-08-14T13:00:00Z** through **2026-08-14T20:00:00Z**. The rows record **87 statement executions**, weighted mean statement duration **12.301713 ms**, and weighted mean CPU **18.726563 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 638937648

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/28` binds raw rows **183-188 inclusive** (6 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-08-14T13:00:00Z** through **2026-08-14T20:00:00Z**. The rows record **310 statement executions**, weighted mean statement duration **4.292142 ms**, and weighted mean CPU **6.345835 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 776650110

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/39` binds raw rows **211-944 inclusive** (734 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2025-11-16T16:00:00Z** through **2026-02-14T17:00:00Z**. The rows record **637,756 statement executions**, weighted mean statement duration **2.402267 ms**, and weighted mean CPU **2.375480 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 906798638

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/49` binds raw rows **962-1267 inclusive** (306 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-08-17T10:00:00Z** through **2026-09-19T20:00:00Z**. The rows record **315,302 statement executions**, weighted mean statement duration **3.291512 ms**, and weighted mean CPU **3.178041 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 1195463633

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/81` binds raw rows **1335-1389 inclusive** (55 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-08-11T12:00:00Z** through **2026-08-15T21:00:00Z**. The rows record **54,236 statement executions**, weighted mean statement duration **2.512664 ms**, and weighted mean CPU **2.436923 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 1574556943

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/125` binds raw rows **1485-1511 inclusive** (27 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-02-12T15:00:00Z** through **2026-02-14T17:00:00Z**. The rows record **6,645 statement executions**, weighted mean statement duration **0.193238 ms**, and weighted mean CPU **0.191305 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

### Historical ID 1811797812

**Identity disposition: documented; original name/type/business function unknown.** Profile `/profiles/140` binds raw rows **1538-1751 inclusive** (214 rows). This is the numeric identity supported by the retained evidence; it is not assigned a guessed routine name.

Retained interval boundaries: **2026-02-17T11:00:00Z** through **2026-03-14T20:00:00Z**. The rows record **219,217 statement executions**, weighted mean statement duration **2.120550 ms**, and weighted mean CPU **2.098442 ms**. These are statement aggregates for this ID/group/type only; continuous observation, whole-routine calls and current execution are not established.

## Closure and retained limits

The requested identity/runtime documentation is complete and closed by the owner instruction. No additional official documentation is required to maintain that closure. An existing versioned identity inventory or deployment history explicitly tying an ID to a name/type/definition over the retained intervals could improve identification if the owner later reopens that question; it is not a pending action from this closeout.

Application/service callers, currently effective configuration, current installation and correlated whole-process duration are outside this register. Their separate deployment/timing workstream remains owner-frozen at **0/34**. Completing this register neither resolves that workstream nor authorizes a database connection, operational execution, monitoring change or new telemetry collection.

The original [C18 identity disposition](RUNTIME_IDENTITY_DISPOSITION.md), JSON sources and dated reports remain unchanged. This current owner closure supersedes earlier status wording that assigned historical identity documentation as pending, while preserving all original counts, limitations and source bindings.

## Retained source fingerprints

These SHA-256 values identify the existing inputs used for this register. The closeout rechecked all 163 profiles against their 1,795 raw rows, all 154 catalog matches and nine absent-ID dispositions. No source JSON, catalog, export baseline or historical receipt was rebuilt.

| Retained input | SHA-256 |
| --- | --- |
| [mappings/runtime-profiles.json](mappings/runtime-profiles.json) | `57ea1c40cf45513e83cdc5c04de7e4e7f01dcac2315a9dafbb216ea90c6449f2` |
| [mappings/runtime-identity-disposition.json](mappings/runtime-identity-disposition.json) | `17889f5a1272534abe2308b0c3c79704e769c3334f4fe5ce04d4a39ffe0e0828` |
| [catalog/query_store_runtime.json](catalog/query_store_runtime.json) | `e2d9c165500485a9db06156da434e9455141d0c796770787daee7a05c1e66dd1` |
| [catalog/objects.json](catalog/objects.json) | `c951f937ccd9f4e604cb22c88c029dbfaddcdefda4a9754f19f095cdf07876a7` |
| [catalog/modules.json](catalog/modules.json) | `9720c492f8632a45d4a3e0bac38869ffc0da35ec3c9bece317482814b26c4647` |
| [catalog/query_store_replicas.json](catalog/query_store_replicas.json) | `c4de0566c22ad6ce1bbe53e769fa0858517209252e279dee813977cf0505d7db` |
| [catalog/procedure_runtime.json](catalog/procedure_runtime.json) | `a5338d955b09046ec0b16f3a9625b7955c763aae07dc722e474e6078745f932f` |
| [catalog/function_runtime.json](catalog/function_runtime.json) | `a5338d955b09046ec0b16f3a9625b7955c763aae07dc722e474e6078745f932f` |
| [catalog/trigger_runtime.json](catalog/trigger_runtime.json) | `a5338d955b09046ec0b16f3a9625b7955c763aae07dc722e474e6078745f932f` |

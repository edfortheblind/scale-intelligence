# Snapdragon screen dossier index

Generated for **254 MAIN_UI_SCREEN records** from the saved metadata. Each file identifies its Form ID separately from its Screen object ID. This index includes active, inactive, legacy, and context-dependent records; it is not a count of verified navigable screens.

[Registry](../inventory/screen-registry.json) · [Configuration chains](../database/screen-configuration-chains.json) · [Configuration model](../reference/CONFIGURATION_MODEL.md) · [Shipping runtime review](shipping.md)

Regenerate after evidence changes: `python Snapdragon/tools/build_screen_dossiers.py`.

## Evidence coverage

| Category | Screen records |
|---|---:|
| Runtime route observed; Screen variant unconfirmed | 63 |
| Shared application entry observed; individual function unverified | 18 |
| Runtime attempted; error or unresolved result | 6 |
| Metadata only; runtime not observed | 167 |

Matching uses the saved configured path and observed requested route, preserving external hosts and exact nonempty query strings, and ignoring empty trailing question marks, URL fragments, and trailing slashes. Record context and Screen-variant selection still require verification. When distinct Forms share one path, the application-entry observation is explicitly separated from individual-function review.

### Separate Form-configuration audit

The [Form navigation audit](../evidence/config-form-navigation.json) contains 211 unique Forms against its stated denominator of 211. Scope: unique FORM_IDs linked to active MAIN_UI_SCREEN records in captured replica. This is a Form count, not the 254-Screen-record denominator above.

| Form-configuration result | Unique Forms |
|---|---:|
| Form Properties and Screens grid inspected | 211 |

Opening Form Properties and the Screens grid does not verify the runtime Screen variant or traverse all parts, groups, controls, events, and dialogs. A shared Form observation can appear in more than one Screen dossier.

## Source snapshot

| Input | Records / observations | SHA-256 |
|---|---:|---|
| screen-registry.json | 254 | `45de599156f8c7f82848559c0bd78c4e8a2e5ef6b2a3491b40b3c79b16606920` |
| screen-configuration-chains.json | 254 | `313891ec45f0d6981eca28c43f2a3e4747e95b41aa343346eaa7bb8ff6c0608a` |
| runtime-root.json | 28 | `0dbedcb4a546bbc616f00aba6bda84fbb49d51536833ccb8b5dd8a68c7911202` |
| runtime-source-agent.json | 23 | `48e8bf2ad44ef28b0e6e618278121d152fd44af5c8c49b69763aa4a805c8f6ea` |
| runtime-training-agent.json | 65 | `b5daf2c629e5e1c74ab65e6592f87808bf32faa0f27a472f3581dd1ec6225a19` |
| config-form-navigation.json | 211 | `a42cb353aada5c894398eb8f7d61df185db5458c81c030cf9511d6a8bcdbb96d` |
| screen-interaction-map.json | 4949 | `1e3fa64d90ef549453786e163cc4718532b1006366de96fdaa480a2d3455f54d` |
| safe-dependency-tokens.json | 2351 | `6579ca31e93442318564d8ee78fcc9b00af309d2cdead5bc323c7636f52b137e` |

The dossiers also map 3793 control attributes, 1767 events, and 2627 event parameters. The original interaction map keeps attribute/parameter values omitted; see the [interaction summary](../database/interaction-map-summary.json) for extraction limits. Runtime execution is unverified.

The separate [safe dependency supplement](../database/safe-dependency-tokens.json) contributes 2306 accepted tokens from 2351 selected candidate rows, with 45 values omitted. Selection uses exact configuration names and strict token grammars. Each accepted token is shown only in its associated Screen dossier; this does not close backend-semantic or runtime verification.

## All screen records

| Form ID | Screen ID | Name / dossier | Active | Route category | Configured path | Parts / groups / controls / columns | Runtime evidence | Form configuration evidence |
|---:|---:|---|---|---|---|---|---|---|
| 2 | 37 | [Configurations](by-id/form-2_screen-37.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 7 | 20 | [Shipment Explorer](by-id/form-7_screen-20.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 13 | 21 | [Shipment Quick Find](by-id/form-13_screen-21.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 15 | 14 | [Wave Explorer](by-id/form-15_screen-14.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 28 | 17 | [Packing](by-id/form-28_screen-17.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 40 | 29 | [Work Quick Find](by-id/form-40_screen-29.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 48 | 43 | [Transaction and Process History](by-id/form-48_screen-43.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 51 | 58 | [Quality History](by-id/form-51_screen-58.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 60 | 18 | [Manifest Explorer](by-id/form-60_screen-18.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 61 | 47 | [MNU_DisplayProperties](by-id/form-61_screen-47.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 62 | 23 | [Shipping Container Workbench](by-id/form-62_screen-23.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 65 | 7 | [Location Explorer](by-id/form-65_screen-7.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 69 | 8 | [Location Quick Find](by-id/form-69_screen-8.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 72 | 6 | [Inventory Management](by-id/form-72_screen-6.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 73 | 16 | [Close Container](by-id/form-73_screen-16.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 76 | 46 | [Audit Log Viewer](by-id/form-76_screen-46.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 83 | 30 | [Archive Data](by-id/form-83_screen-30.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 87 | 59 | [Receipt Quality History](by-id/form-87_screen-59.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 90 | 2 | [Receiving Workbench](by-id/form-90_screen-2.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 99 | 40 | [Interface Data](by-id/form-99_screen-40.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 100 | 22 | [Shipping Container Identification](by-id/form-100_screen-22.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 102 | 10 | [Work Order Workbench](by-id/form-102_screen-10.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 116 | 12 | [Finished Item Breakdown](by-id/form-116_screen-12.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 124 | 13 | [Order Entry](by-id/form-124_screen-13.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 143 | 5 | [Immediate Needs Viewer](by-id/form-143_screen-5.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 147 | 36 | [Billing Management Manual Generation](by-id/form-147_screen-36.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 153 | 49 | [Manual Inventory Adjustment](by-id/form-153_screen-49.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 159 | 57 | [Background Job Queue Viewer](by-id/form-159_screen-57.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 160 | 3 | [Receipt Container Viewer](by-id/form-160_screen-3.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 184 | 65 | [Performance Management Dashboard](by-id/form-184_screen-65.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 293 | 51 | [System Text Editor](by-id/form-293_screen-51.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2004 | 50 | [MNU_ScanAndWeighConfig](by-id/form-2004_screen-50.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2079 | 52 | [User Activity Viewer](by-id/form-2079_screen-52.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2126 | 9 | [Lot Workbench](by-id/form-2126_screen-9.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2149 | 63 | [Rate Shopping](by-id/form-2149_screen-63.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2151 | 64 | [World Ease Quick Find](by-id/form-2151_screen-64.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2500 | 34 | [Shipment Header Archive Viewer](by-id/form-2500_screen-34.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2501 | 33 | [Shipment Detail Archive Viewer](by-id/form-2501_screen-33.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2502 | 32 | [Receipt Header Archive Viewer](by-id/form-2502_screen-32.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2503 | 31 | [Receipt Detail Archive Viewer](by-id/form-2503_screen-31.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2513 | 39 | [Trading Partner Management](by-id/form-2513_screen-39.md) | Y | tpm | /tpm/trans/tpmdashboard | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2514 | 41 | [RF](by-id/form-2514_screen-41.md) | Y | legacy_rf | /RF/logon.aspx | 0 / 0 / 0 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2520 | 54 | [Warehouse Alerts](by-id/form-2520_screen-54.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2552 | 56 | [RFID History](by-id/form-2552_screen-56.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2555 | 55 | [Slotting Interface](by-id/form-2555_screen-55.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2594 | 66 | [Replenishment Request Viewer](by-id/form-2594_screen-66.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2595 | 69 | [Yard Check in & Out](by-id/form-2595_screen-69.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2598 | 70 | [Billing Management](by-id/form-2598_screen-70.md) | Y | external_application | http://OCIEAPP/BMWEB | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2599 | 71 | [Progistics](by-id/form-2599_screen-71.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2600 | 72 | [Slotting Optimization](by-id/form-2600_screen-72.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2610 | 73 | [Shipped Lot Viewer](by-id/form-2610_screen-73.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2617 | 74 | [Dock Manager](by-id/form-2617_screen-74.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2669 | 75 | [Supply Chain Intelligence](by-id/form-2669_screen-75.md) | Y | external_application | http://OCIEAPP/SCI | 0 / 0 / 0 / 0 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 2680 | 78 | [Multiple Order Pallet Viewer](by-id/form-2680_screen-78.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2681 | 77 | [VAS Workbench](by-id/form-2681_screen-77.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2683 | 76 | [QC Workbench](by-id/form-2683_screen-76.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2705 | 81 | [Interface Error Viewer](by-id/form-2705_screen-81.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2715 | 82 | [Shipment Detail Allocation Rejection Viewer](by-id/form-2715_screen-82.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2718 | 84 | [Movement Class Analysis Viewer](by-id/form-2718_screen-84.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2723 | 1767 | [Inventory Insight](by-id/form-2723_screen-1767.md) | Y | insight | /scale/insights/2723 | 7 / 26 / 65 / 38 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2735 | 1621 | [Shipment Insight](by-id/form-2735_screen-1621.md) | Y | insight | /scale/insights/2735 | 6 / 23 / 70 / 39 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2735 | 1786 | [Shipment Insight](by-id/form-2735_screen-1786.md) | N | inactive | /scale/insights/2735 | 7 / 27 / 74 / 39 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2757 | 1797 | [Work Insight](by-id/form-2757_screen-1797.md) | Y | insight | /scale/insights/2757 | 11 / 41 / 82 / 40 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2759 | 1445 | [Work Instruction](by-id/form-2759_screen-1445.md) | Y | record_detail_template | /scale/details/workinstruction | 1 / 10 / 72 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2760 | 1689 | [Shipment](by-id/form-2760_screen-1689.md) | Y | record_detail_template | /scale/details/shipment | 1 / 19 / 164 / 44 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2765 | 1539 | [Receiving Appointment Schedule](by-id/form-2765_screen-1539.md) | Y | transaction_context | /scale/trans/recappschedule | 1 / 6 / 26 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 2767 | 1765 | [Immediate Needs Insight](by-id/form-2767_screen-1765.md) | Y | insight | /scale/insights/2767 | 7 / 25 / 46 / 21 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2768 | 1770 | [Lot Insight](by-id/form-2768_screen-1770.md) | Y | insight | /scale/insights/2768 | 6 / 21 / 36 / 14 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2769 | 1498 | [Work Monitoring: Group](by-id/form-2769_screen-1498.md) | Y | monitor | /scale/monitors/2769 | 3 / 6 / 16 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2770 | 94 | [Consolidated Container Location Viewer](by-id/form-2770_screen-94.md) | N | inactive | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 2771 | 1497 | [Work Monitoring: Customer](by-id/form-2771_screen-1497.md) | Y | monitor | /scale/monitors/2771 | 3 / 6 / 16 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2772 | 1576 | [Inventory Adjustment](by-id/form-2772_screen-1576.md) | Y | transaction_menu | /scale/trans/inventoryAdjustment | 1 / 6 / 25 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2773 | 1796 | [Wave Insight](by-id/form-2773_screen-1796.md) | Y | insight | /scale/insights/2773 | 7 / 26 / 53 / 35 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2774 | 1774 | [Planned Shipment Insight](by-id/form-2774_screen-1774.md) | Y | insight | /scale/insights/2774 | 6 / 22 / 59 / 44 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2775 | 1595 | [Inventory Transfer](by-id/form-2775_screen-1595.md) | Y | transaction_menu | /scale/trans/inventoryTransfer | 1 / 6 / 26 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2776 | 1787 | [Shipment Line Insight](by-id/form-2776_screen-1787.md) | Y | insight | /scale/insights/2776 | 6 / 20 / 45 / 31 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2777 | 1781 | [Receipt Insight](by-id/form-2777_screen-1781.md) | Y | insight | /scale/insights/2777 | 7 / 25 / 62 / 31 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2778 | 1784 | [Receipt Quality History Insight](by-id/form-2778_screen-1784.md) | Y | insight | /scale/insights/2778 | 6 / 21 / 36 / 14 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2779 | 1782 | [Receipt Container Insight](by-id/form-2779_screen-1782.md) | Y | insight | /scale/insights/2779 | 6 / 20 / 51 / 26 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2780 | 1783 | [Receipt Line Insight](by-id/form-2780_screen-1783.md) | Y | insight | /scale/insights/2780 | 6 / 21 / 40 / 23 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2783 | 1792 | [Transaction History Insight](by-id/form-2783_screen-1792.md) | Y | insight | /scale/insights/2783 | 6 / 19 / 39 / 25 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2785 | 1773 | [Multiple Order Pallet Insight](by-id/form-2785_screen-1773.md) | Y | insight | /scale/insights/2785 | 6 / 20 / 33 / 19 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2787 | 1798 | [Work Order Insight](by-id/form-2787_screen-1798.md) | Y | insight | /scale/insights/2787 | 6 / 22 / 57 / 29 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2789 | 1800 | [Work Order Line Insight](by-id/form-2789_screen-1800.md) | Y | insight | /scale/insights/2789 | 6 / 21 / 40 / 27 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2790 | 1788 | [Shipped Lot Insight](by-id/form-2790_screen-1788.md) | Y | insight | /scale/insights/2790 | 6 / 19 / 31 / 20 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2791 | 1778 | [Putaway Group Insight](by-id/form-2791_screen-1778.md) | Y | insight | /scale/insights/2791 | 7 / 25 / 33 / 7 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2795 | 1693 | [Background Job Queue Insight](by-id/form-2795_screen-1693.md) | Y | insight | /scale/insights/2795 | 5 / 15 / 18 / 8 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2796 | 1776 | [Purchase Order Insight](by-id/form-2796_screen-1776.md) | Y | insight | /scale/insights/2796 | 6 / 21 / 47 / 18 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2797 | 1777 | [Purchase Order Line Insight](by-id/form-2797_screen-1777.md) | Y | insight | /scale/insights/2797 | 6 / 20 / 38 / 16 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 2798 | 1771 | [Manifest Insight](by-id/form-2798_screen-1771.md) | Y | insight | /scale/insights/2798 | 6 / 20 / 32 / 15 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3001 | 1421 | [Lot](by-id/form-3001_screen-1421.md) | Y | record_detail_template | /scale/details/lot | 1 / 8 / 27 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3003 | 1670 | [Wave](by-id/form-3003_screen-1670.md) | Y | record_detail_template | /scale/details/wavedetail | 1 / 8 / 35 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3004 | 1430 | [Replenishment Request](by-id/form-3004_screen-1430.md) | Y | record_detail_template | /scale/details/replenishmentrequestdetail | 1 / 10 / 70 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3005 | 1666 | [Receipt Container](by-id/form-3005_screen-1666.md) | Y | record_detail_template | /scale/details/receiptcontainer | 1 / 10 / 59 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3006 | 1415 | [Immediate Needs](by-id/form-3006_screen-1415.md) | Y | record_detail_template | /scale/details/immediateneeds | 1 / 7 / 32 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3010 | 1755 | [Manual Replenishment](by-id/form-3010_screen-1755.md) | Y | transaction_context | /scale/trans/manualreplenishment | 1 / 4 / 3 / 2 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3011 | 1554 | [Transfer Container](by-id/form-3011_screen-1554.md) | Y | transaction_context | /scale/trans/transfercontainer | 1 / 6 / 17 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3017 | 1688 | [Shipment Line](by-id/form-3017_screen-1688.md) | Y | record_detail_template | /scale/details/shipmentdetail | 1 / 22 / 155 / 32 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3020 | 1433 | [Shipping Container](by-id/form-3020_screen-1433.md) | Y | record_detail_template | /scale/details/shippingcontainer | 1 / 16 / 84 / 32 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3024 | 1521 | [Dock Location Transfer](by-id/form-3024_screen-1521.md) | Y | transaction_context | /scale/trans/dockloctransfer | 1 / 7 / 24 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3025 | 1555 | [Transfer Shipment](by-id/form-3025_screen-1555.md) | Y | transaction_context | /scale/trans/transfershipment | 2 / 11 / 24 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3026 | 1668 | [Shipping Load](by-id/form-3026_screen-1668.md) | Y | record_detail_template | /scale/details/shippingload | 2 / 14 / 60 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3027 | 1557 | [Update Quantity to Pack](by-id/form-3027_screen-1557.md) | Y | transaction_context | /scale/trans/updatequantitytopack | 1 / 5 / 12 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3028 | 1516 | [Shipment Consolidation](by-id/form-3028_screen-1516.md) | Y | transaction_context | /scale/trans/consolidateshipment | 1 / 9 / 33 / 28 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3029 | 1664 | [Close Container](by-id/form-3029_screen-1664.md) | Y | transaction_menu | /scale/trans/closecontainer | 1 / 8 / 28 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3030 | 1537 | [Print Documents](by-id/form-3030_screen-1537.md) | Y | transaction_context | /scale/trans/printselecteddocuments | 1 / 3 / 9 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3031 | 1545 | [Shipment Level Manifesting](by-id/form-3031_screen-1545.md) | Y | transaction_context | /scale/trans/shipmentlevelmanifesting | 1 / 5 / 20 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3033 | 1523 | [Inventory](by-id/form-3033_screen-1523.md) | Y | transaction_context | /scale/trans/inventory | 1 / 13 / 70 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3034 | 1428 | [Receipt](by-id/form-3034_screen-1428.md) | Y | record_detail_template | /scale/details/receipt | 1 / 12 / 83 / 13 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3035 | 1427 | [Receipt Line](by-id/form-3035_screen-1427.md) | Y | record_detail_template | /scale/details/receiptdetail | 1 / 11 / 82 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3036 | 1542 | [Receipt From Shipment](by-id/form-3036_screen-1542.md) | Y | transaction_context | /scale/trans/receiptFromship | 1 / 9 / 25 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3037 | 1447 | [Work Order](by-id/form-3037_screen-1447.md) | Y | record_detail_template | /scale/details/workorder | 1 / 11 / 54 / 31 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3038 | 1517 | [Cycle Count Plan Creation](by-id/form-3038_screen-1517.md) | Y | transaction_context | /scale/trans/cycleCountPlanCreation | 1 / 4 / 7 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3039 | 1519 | [Cycle Count Reconciliation](by-id/form-3039_screen-1519.md) | Y | transaction_context | /scale/trans/cycleCountReconciliation | 1 / 8 / 29 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3041 | 1769 | [Shipping Load Insight](by-id/form-3041_screen-1769.md) | Y | insight | /scale/insights/3041 | 7 / 25 / 52 / 21 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3042 | 1684 | [Transfer Shipment Line](by-id/form-3042_screen-1684.md) | Y | transaction_context | /scale/trans/transfershipmentline | 1 / 7 / 19 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3043 | 1794 | [VAS Insight: Container](by-id/form-3043_screen-1794.md) | Y | insight | /scale/insights/3043 | 4 / 13 / 20 / 15 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3044 | 1655 | [Split Shipment](by-id/form-3044_screen-1655.md) | Y | transaction_context | /scale/trans/splitshipment | 1 / 3 / 4 / 12 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3046 | 1785 | [Replenishment Insight](by-id/form-3046_screen-1785.md) | Y | insight | /scale/insights/3046 | 6 / 21 / 44 / 24 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3049 | 1511 | [Add Shipment to Wave](by-id/form-3049_screen-1511.md) | Y | transaction_context | /scale/trans/addshipmenttowave | 1 / 7 / 21 / 3 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3050 | 1768 | [Labor Activity Insight](by-id/form-3050_screen-1768.md) | Y | insight | /scale/insights/3050 | 6 / 21 / 42 / 35 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 3051 | 1494 | [Labor Monitoring](by-id/form-3051_screen-1494.md) | Y | monitor | /scale/monitors/3051 | 3 / 6 / 11 / 0 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 3052 | 1562 | [Yard Check in & Out](by-id/form-3052_screen-1562.md) | Y | transaction_menu | /scale/trans/yardcheckinout | 1 / 7 / 16 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3053 | 1532 | [Manual Labor Entry](by-id/form-3053_screen-1532.md) | Y | transaction_menu | /scale/trans/manuallaborentry | 1 / 8 / 17 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3054 | 1766 | [Interface Error Insight](by-id/form-3054_screen-1766.md) | Y | insight | /scale/insights/3054 | 6 / 18 / 30 / 15 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3055 | 1425 | [Quality History](by-id/form-3055_screen-1425.md) | Y | record_detail_template | /scale/details/qualityhistory | 1 / 7 / 28 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3062 | 1780 | [Quality History Insight](by-id/form-3062_screen-1780.md) | Y | insight | /scale/insights/3062 | 6 / 19 / 36 / 19 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3064 | 1522 | [Finished Item Breakdown](by-id/form-3064_screen-1522.md) | Y | transaction_context | /scale/trans/finisheditembreakdown | 1 / 7 / 19 / 13 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3066 | 1775 | [Process History Insight](by-id/form-3066_screen-1775.md) | Y | insight | /scale/insights/3066 | 6 / 19 / 29 / 14 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3067 | 1759 | [Audit Log Insight](by-id/form-3067_screen-1759.md) | Y | insight | /scale/insights/3067 | 6 / 19 / 28 / 16 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3070 | 1793 | [User Activity Insight](by-id/form-3070_screen-1793.md) | Y | insight | /scale/insights/3070 | 6 / 19 / 26 / 17 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3075 | 1799 | [Work Order License Plate Insight](by-id/form-3075_screen-1799.md) | Y | insight | /scale/insights/3075 | 6 / 21 / 38 / 17 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3080 | 1518 | [Cycle Count Quick Plan](by-id/form-3080_screen-1518.md) | Y | transaction_context | /scale/trans/ccquickplan | 1 / 10 / 48 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3081 | 1531 | [Lot Update Confirmation](by-id/form-3081_screen-1531.md) | Y | transaction_context | /scale/trans/lotupdateconf | 1 / 6 / 22 / 6 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3095 | 1429 | [Receipt Quality History](by-id/form-3095_screen-1429.md) | Y | record_detail_template | /scale/details/receiptqualityhistory | 1 / 7 / 32 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 3101 | 1761 | [Cycle Count Request Insight](by-id/form-3101_screen-1761.md) | Y | insight | /scale/insights/3101 | 6 / 22 / 41 / 22 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3105 | 1760 | [Cycle Count Plan Insight](by-id/form-3105_screen-1760.md) | Y | insight | /scale/insights/3105 | 6 / 23 / 43 / 17 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 3110 | 1772 | [Movement Class Insight](by-id/form-3110_screen-1772.md) | Y | insight | /scale/insights/3110 | 6 / 21 / 40 / 33 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4000 | 1618 | [Single Unit Packing](by-id/form-4000_screen-1618.md) | Y | transaction_menu | /scale/trans/singlesPacking | 1 / 6 / 5 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4005 | 1538 | [QC Workbench](by-id/form-4005_screen-1538.md) | Y | transaction_menu | /scale/trans/qcworkbench? | 2 / 6 / 9 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4006 | 95 | [Document Routing Viewer](by-id/form-4006_screen-95.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4007 | 1536 | [Packing](by-id/form-4007_screen-1536.md) | Y | transaction_menu | /scale/trans/packing | 1 / 6 / 8 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4012 | 1493 | [Inventory Monitoring](by-id/form-4012_screen-1493.md) | Y | monitor | /scale/monitors/4012 | 3 / 6 / 13 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4013 | 1496 | [Shipment Monitoring: Customer](by-id/form-4013_screen-1496.md) | Y | monitor | /scale/monitors/4013 | 3 / 6 / 12 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4015 | 1416 | [Inventory Attributes](by-id/form-4015_screen-1416.md) | Y | record_detail_template | /scale/details/inventoryattributes | 1 / 8 / 38 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4016 | 1544 | [Reprint Wave Labels](by-id/form-4016_screen-1544.md) | Y | transaction_context | /scale/trans/reprintwavelabels | 2 / 8 / 8 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4017 | 1543 | [Reprint Wave Documents](by-id/form-4017_screen-1543.md) | Y | transaction_context | /scale/trans/reprintwavedocs | 2 / 8 / 8 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4018 | 1530 | [Lookup](by-id/form-4018_screen-1530.md) | Y | transaction_context | /scale/trans/lookup | 3 / 5 / 5 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4020 | 1558 | [Cancel Wave](by-id/form-4020_screen-1558.md) | Y | transaction_context | /scale/trans/wavecancel | 1 / 3 / 4 / 7 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4023 | 1559 | [Wave Printer Selection](by-id/form-4023_screen-1559.md) | Y | transaction_context | scale/trans/waveprinterselection | 1 / 4 / 5 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4024 | 1513 | [Build Wave](by-id/form-4024_screen-1513.md) | Y | transaction_context | /scale/trans/buildwave | 1 / 6 / 4 / 3 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4026 | 1789 | [Shipping Container Insight](by-id/form-4026_screen-1789.md) | Y | insight | /scale/insights/4026 | 7 / 27 / 72 / 33 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4031 | 1535 | [New Wave](by-id/form-4031_screen-1535.md) | Y | transaction_context | /scale/trans/newwave | 1 / 5 / 6 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4034 | 1413 | [Audit Log](by-id/form-4034_screen-1413.md) | Y | record_detail_template | /scale/details/auditlog | 1 / 6 / 31 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4035 | 1748 | [Transaction History](by-id/form-4035_screen-1748.md) | Y | record_detail_template | /scale/details/transactionhistory | 1 / 13 / 73 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4036 | 1641 | [Process History](by-id/form-4036_screen-1641.md) | Y | record_detail_template | /scale/details/processhistory | 1 / 6 / 20 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4037 | 1683 | [Shipment Selection](by-id/form-4037_screen-1683.md) | Y | transaction_context | /scale/trans/shipmentselection | 1 / 4 / 4 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4038 | 1541 | [Receipt Workbench](by-id/form-4038_screen-1541.md) | Y | transaction_menu | /scale/trans/receiptWorkBench | 1 / 6 / 9 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4040 | 1534 | [Nest Container](by-id/form-4040_screen-1534.md) | Y | transaction_context | /scale/trans/NestContainer | 1 / 5 / 7 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4041 | 1640 | [Cycle Count Plan](by-id/form-4041_screen-1640.md) | Y | record_detail_template | /scale/details/cyclecountplan | 1 / 7 / 18 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4044 | 1671 | [Work Order Line](by-id/form-4044_screen-1671.md) | Y | record_detail_template | /scale/details/workorderline | 1 / 9 / 44 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4045 | 1529 | [Location Unit of Measure](by-id/form-4045_screen-1529.md) | Y | transaction_context | /scale/trans/locationunitmeasure | 1 / 5 / 8 / 9 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4046 | 1520 | [Warehouse Dashboard](by-id/form-4046_screen-1520.md) | Y | transaction_menu | /scale/trans/dashboard | 1 / 0 / 0 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4047 | 1560 | [Work Order Component Allocation](by-id/form-4047_screen-1560.md) | Y | transaction_context | /scale/trans/wocompalloc | 1 / 5 / 12 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4048 | 1572 | [Work Order Confirmation](by-id/form-4048_screen-1572.md) | Y | transaction_context | /scale/trans/workorderConfirm | 1 / 8 / 17 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4049 | 1423 | [Purchase Order](by-id/form-4049_screen-1423.md) | Y | record_detail_template | /scale/details/purchaseorder | 1 / 10 / 57 / 9 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4050 | 1510 | [Accessorial Assignment](by-id/form-4050_screen-1510.md) | Y | transaction_context | /scale/trans/accessorialassign | 1 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4051 | 1665 | [Purchase Order Line](by-id/form-4051_screen-1665.md) | Y | record_detail_template | /scale/details/purchaseorderline | 1 / 10 / 56 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4052 | 1802 | [Receipt From Purchase Order](by-id/form-4052_screen-1802.md) | Y | transaction_context | /scale/trans/receiptFromPO | 1 / 7 / 25 / 12 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4053 | 1687 | [Labor Activity](by-id/form-4053_screen-1687.md) | Y | record_detail_template | /scale/details/laboractivity | 1 / 7 / 48 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4055 | 1515 | [Close Manifest](by-id/form-4055_screen-1515.md) | Y | transaction_context | /scale/trans/closemanifest | 1 / 3 / 6 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4056 | 1594 | [Inventory Status Change](by-id/form-4056_screen-1594.md) | Y | transaction_menu | /scale/trans/invStatusChange | 1 / 6 / 21 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4058 | 1690 | [Order](by-id/form-4058_screen-1690.md) | Y | tpm | /tpm/details/tpmorderentry | 1 / 8 / 29 / 13 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4059 | 1603 | [Order Line](by-id/form-4059_screen-1603.md) | Y | tpm | /tpm/details/tpmorderlineentry | 1 / 4 / 11 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4061 | 1437 | [Order Submitted](by-id/form-4061_screen-1437.md) | Y | tpm | /tpm/details/tpmordersubmit | 1 / 3 / 12 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4063 | 1550 | [Personal Views](by-id/form-4063_screen-1550.md) | Y | tpm | /tpm/trans/tpmpersonalviews | 1 / 3 / 4 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4064 | 1440 | [Receipt](by-id/form-4064_screen-1440.md) | Y | tpm | /tpm/details/tpmreceiptentry | 1 / 7 / 25 / 9 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4065 | 1658 | [Order Status Insight](by-id/form-4065_screen-1658.md) | Y | tpm | /tpm/insights/4065 | 5 / 16 / 34 / 15 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4066 | 1477 | [Order Line Status Insight](by-id/form-4066_screen-1477.md) | Y | tpm | /tpm/insights/4066 | 5 / 15 / 29 / 19 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4067 | 1657 | [Order Container Status Insight](by-id/form-4067_screen-1657.md) | Y | tpm | /tpm/insights/4067 | 5 / 17 / 31 / 19 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4068 | 1548 | [Trading Partner Management](by-id/form-4068_screen-1548.md) | Y | tpm | /tpm/trans/tpmdashboard | 1 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4069 | 1512 | [Appointment Calendar](by-id/form-4069_screen-1512.md) | Y | transaction_menu | /scale/trans/apptschedule | 1 / 5 / 2 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4070 | 1441 | [Receipt Line](by-id/form-4070_screen-1441.md) | Y | tpm | /tpm/details/tpmreceiptlineentry | 1 / 4 / 11 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4072 | 1481 | [Receipt Status Insight](by-id/form-4072_screen-1481.md) | Y | tpm | /tpm/insights/4072 | 5 / 16 / 29 / 14 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4073 | 1482 | [Receipt Line Status Insight](by-id/form-4073_screen-1482.md) | Y | tpm | /tpm/insights/4073 | 5 / 16 / 29 / 16 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4074 | 1553 | [Receipt Submitted](by-id/form-4074_screen-1553.md) | Y | tpm | /tpm/trans/tpmreceiptsubmitted | 1 / 3 / 10 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4075 | 1644 | [Purchase Order](by-id/form-4075_screen-1644.md) | Y | tpm | /tpm/details/tpmpurchaseorderentry | 1 / 7 / 25 / 9 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4078 | 1480 | [Purchase Order Status Insight](by-id/form-4078_screen-1480.md) | Y | tpm | /tpm/insights/4078 | 5 / 18 / 35 / 13 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4079 | 1479 | [Purchase Order Line Status Insight](by-id/form-4079_screen-1479.md) | Y | tpm | /tpm/insights/4079 | 5 / 15 / 28 / 15 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4080 | 1439 | [Purchase Order Line](by-id/form-4080_screen-1439.md) | Y | tpm | /tpm/details/tpmpurchaseorderlineentry | 1 / 4 / 9 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4081 | 1551 | [Purchase Order Submitted](by-id/form-4081_screen-1551.md) | Y | tpm | /tpm/trans/tpmpurchaseordersubmitted | 1 / 3 / 10 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4085 | 1552 | [Receipt From Purchase Order](by-id/form-4085_screen-1552.md) | Y | tpm | /tpm/trans/tpmReceiptFromPO | 1 / 7 / 13 / 12 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4086 | 1795 | [Warehouse Mobile Menu Insight](by-id/form-4086_screen-1795.md) | Y | insight | /scale/insights/4086 | 6 / 19 / 27 / 15 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4087 | 1669 | [Warehouse Mobile Menu](by-id/form-4087_screen-1669.md) | Y | record_detail_template | /scale/details/warehousemobilemenu | 1 / 6 / 24 / 13 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4088 | 1801 | [World Ease Insight](by-id/form-4088_screen-1801.md) | Y | insight | /scale/insights/4088 | 6 / 21 / 28 / 8 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4090 | 1525 | [Company Transfer](by-id/form-4090_screen-1525.md) | Y | transaction_menu | /scale/trans/inventoryCompanyTransfer | 1 / 6 / 23 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4091 | 1790 | [Tote Insight](by-id/form-4091_screen-1790.md) | Y | insight | /scale/insights/4091 | 6 / 20 / 30 / 12 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4092 | 1791 | [Tote Detail Insight](by-id/form-4092_screen-1791.md) | Y | insight | /scale/insights/4092 | 6 / 18 / 25 / 25 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4093 | 1779 | [Putwall Insight](by-id/form-4093_screen-1779.md) | Y | insight | /scale/insights/4093 | 6 / 19 / 27 / 12 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4094 | 1762 | [DIF Incoming Message Insight](by-id/form-4094_screen-1762.md) | Y | insight | /scale/insights/4094 | 6 / 19 / 26 / 15 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4095 | 1763 | [DIF Outgoing Message Insight](by-id/form-4095_screen-1763.md) | Y | insight | /scale/insights/4095 | 6 / 19 / 26 / 12 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4096 | 1758 | [Archive Data Insight](by-id/form-4096_screen-1758.md) | N | inactive | /scale/insights/4096 | 6 / 18 / 21 / 6 | Metadata only; runtime not observed | No Form-configuration browser observation |
| 4097 | 1743 | [Employee Scorecard](by-id/form-4097_screen-1743.md) | Y | insight | /scale/insights/4097 | 4 / 9 / 20 / 0 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 4098 | 1686 | [SCALE Assist](by-id/form-4098_screen-1686.md) | Y | other_application | /ScaleAssist | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4101 | 1606 | [Configuration](by-id/form-4101_screen-1606.md) | Y | configuration_portal | /config | 0 / 0 / 0 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4103 | 1739 | [Sign Bills of Lading](by-id/form-4103_screen-1739.md) | Y | transaction_context | /scale/trans/signBol | 1 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4105 | 1764 | [Document Management Insight](by-id/form-4105_screen-1764.md) | Y | insight | /scale/insights/4105 | 6 / 19 / 30 / 11 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4106 | 1737 | [Receipt Monitoring](by-id/form-4106_screen-1737.md) | Y | monitor | /scale/monitors/4106 | 3 / 6 / 11 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 4116 | 1738 | [Indirect Labor Workbench](by-id/form-4116_screen-1738.md) | Y | transaction_menu | /scale/trans/indirectlaborworkbench | 1 / 5 / 6 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4119 | 1685 | [Shift Time](by-id/form-4119_screen-1685.md) | Y | other_application | /shifttime | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4120 | 1745 | [Indirect Labor](by-id/form-4120_screen-1745.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 4121 | 1749 | [Employee Timeline](by-id/form-4121_screen-1749.md) | Y | insight | /scale/insights/4121 | 4 / 9 / 11 / 0 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 4124 | 1750 | [Intraday Labor Progress](by-id/form-4124_screen-1750.md) | Y | insight | /scale/insights/4124 | 4 / 9 / 9 / 0 | Runtime attempted; error or unresolved result | Form Properties and Screens grid inspected |
| 4125 | 1746 | [SOP Assist](by-id/form-4125_screen-1746.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 4999 | 1607 | [Developer Hub](by-id/form-4999_screen-1607.md) | Y | developer_portal | /scale/general/developer | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 10000 | 85 | [Item unit of measure](by-id/form-10000_screen-85.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 10001 | 86 | [View nsns by lin](by-id/form-10001_screen-86.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 10005 | 91 | [Item snapshot](by-id/form-10005_screen-91.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 10006 | 92 | [LI Shawn](by-id/form-10006_screen-92.md) | Y | legacy_or_unresolved | Not populated | 0 / 0 / 0 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 40000 | 1747 | [Item Location Assignment](by-id/form-40000_screen-1747.md) | Y | record_detail_template | /scale/details/itemLocationAssignment | 1 / 6 / 18 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 40005 | 1418 | [Item Location Capacity](by-id/form-40005_screen-1418.md) | Y | record_detail_template | /scale/details/itemLocationCapacity | 1 / 7 / 24 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 40010 | 1654 | [MNU_ITEMUOMTRANSACTION](by-id/form-40010_screen-1654.md) | Y | transaction_context | /scale/trans/itemUOM | 1 / 5 / 9 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 40015 | 1580 | [Item Unit of Measure Details](by-id/form-40015_screen-1580.md) | Y | record_detail_template | /scale/details/itemUOMDetail | 1 / 8 / 30 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 40020 | 1549 | [Lookup](by-id/form-40020_screen-1549.md) | Y | tpm | /tpm/trans/tpmlookup | 3 / 5 / 5 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50000 | 1681 | [Screen Group Column](by-id/form-50000_screen-1681.md) | Y | metadata_editor | /scale/details/screengroupcolumn | 1 / 7 / 24 / 12 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50001 | 1679 | [Screen Control Grid Columns](by-id/form-50001_screen-1679.md) | Y | metadata_editor | /scale/details/screencontrolgridcolumns | 1 / 8 / 37 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50002 | 1676 | [Screen Control Attributes](by-id/form-50002_screen-1676.md) | Y | metadata_editor | /scale/details/screencontrolattributes | 1 / 7 / 32 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50003 | 1677 | [Screen Control Event Parameters](by-id/form-50003_screen-1677.md) | Y | metadata_editor | /scale/details/screencontroleventparameters | 1 / 6 / 21 / 0 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50004 | 1678 | [Screen Control Event](by-id/form-50004_screen-1678.md) | Y | metadata_editor | /scale/details/screencontrolevent | 1 / 7 / 24 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50005 | 1675 | [Screen Control](by-id/form-50005_screen-1675.md) | Y | metadata_editor | /scale/details/screencontrol | 1 / 11 / 39 / 40 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50006 | 1680 | [Screen Group](by-id/form-50006_screen-1680.md) | Y | metadata_editor | /scale/details/screengroup | 1 / 10 / 36 / 32 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50007 | 1682 | [Screen Part](by-id/form-50007_screen-1682.md) | Y | metadata_editor | /scale/details/screenpart | 1 / 8 / 28 / 11 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50008 | 1674 | [Screen](by-id/form-50008_screen-1674.md) | Y | metadata_editor | /scale/details/mainuiscreen | 1 / 8 / 29 / 10 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50009 | 1673 | [Form](by-id/form-50009_screen-1673.md) | Y | metadata_editor | /scale/details/form | 1 / 7 / 21 / 8 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50010 | 1501 | [Monitoring Screen Builder](by-id/form-50010_screen-1501.md) | Y | metadata_editor | /scale/trans/monitoringbuilder | 1 / 8 / 16 / 16 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 50012 | 1637 | [Database Table View](by-id/form-50012_screen-1637.md) | Y | metadata_editor | /scale/trans/dbtableview | 1 / 4 / 3 / 5 | Metadata only; runtime not observed | Form Properties and Screens grid inspected |
| 60010 | 96 | [Work Execution](by-id/form-60010_screen-96.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60011 | 97 | [Warehouse Mobile](by-id/form-60011_screen-97.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60012 | 101 | [Activity Architect](by-id/form-60012_screen-101.md) | Y | warehouse_mobile | /WarehouseMobile/activityArchitect | 0 / 0 / 0 / 0 | Runtime route observed; Screen variant unconfirmed | Form Properties and Screens grid inspected |
| 60013 | 1259 | [Remove Cart Container](by-id/form-60013_screen-1259.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60014 | 1757 | [Pallet QC](by-id/form-60014_screen-1757.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60020 | 100 | [Close Container](by-id/form-60020_screen-100.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60021 | 99 | [Receiving](by-id/form-60021_screen-99.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60022 | 102 | [Close Putaway Group](by-id/form-60022_screen-102.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60023 | 103 | [Immediate Dock Transfer](by-id/form-60023_screen-103.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60025 | 1598 | [Inventory Management](by-id/form-60025_screen-1598.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60026 | 1260 | [Cycle Count Reconciliation](by-id/form-60026_screen-1260.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60027 | 1261 | [Location Inquiry](by-id/form-60027_screen-1261.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60028 | 1581 | [Shipping Container Nesting](by-id/form-60028_screen-1581.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60029 | 1740 | [Receipt Container Nesting](by-id/form-60029_screen-1740.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60030 | 1584 | [Putwall Sort](by-id/form-60030_screen-1584.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60031 | 1597 | [Multiple Order Pallet Nesting](by-id/form-60031_screen-1597.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60034 | 1582 | [Clear Putwall Location](by-id/form-60034_screen-1582.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |
| 60035 | 1624 | [Shipping Container QC](by-id/form-60035_screen-1624.md) | Y | warehouse_mobile | /WarehouseMobile | 0 / 0 / 0 / 0 | Shared application entry observed; individual function unverified | Form Properties and Screens grid inspected |

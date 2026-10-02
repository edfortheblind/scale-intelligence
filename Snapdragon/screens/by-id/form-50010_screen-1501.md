# Monitoring Screen Builder — Form 50010, Screen 1501

Generated from the saved 2026-10-02 metadata and available runtime observations. Regenerate with `python Snapdragon/tools/build_screen_dossiers.py` after evidence changes.

**Runtime evidence:** Metadata only; runtime not observed. A configured row, a working route, and a tested business function are different claims.

**Form configuration evidence:** Form Properties and Screens grid inspected. This is tracked separately from runtime navigation.

[Screen index](../INDEX.md) · [Registry](../../inventory/screen-registry.json) · [Configuration chains](../../database/screen-configuration-chains.json) · [Configuration model](../../reference/CONFIGURATION_MODEL.md)

## Identity and navigation

| Property | Saved value |
|---|---|
| Form ID | 50010 |
| MAIN_UI_SCREEN Object ID | 1501 |
| Label / Form resource key | Monitoring Screen Builder / MNU_MONITORINGBUILDERTRANSACTION |
| Functional area code | 120 |
| Active / System created / Show in application menu | Y / Y / N |
| Route category / path type code | metadata_editor / 6 |
| Configured path | /scale/trans/monitoringbuilder |
| Candidate runtime URL | https://trav.manhscale.com/scale/trans/monitoringbuilder |
| Form configuration entry | https://trav.manhscale.com/scale/details/form/50010 |
| Inspection requirement | context_required_configuration_view_cancel_only |
| Form configuration table/view | MetaTrans_GetMonitoringBuilderModel |
| Help page reference | monitoringScreenBuilder.htm |

The Form ID identifies the form; the main UI Screen ID identifies this particular configuration record. Child IDs belong to their own object namespaces. Candidate paths and Form configuration entries are metadata-derived unless a matching browser observation is listed below.

## Form configuration browser evidence

| Observation | Value |
|---|---|
| Result | loaded_matching_form |
| Requested Form configuration URL | https://trav.manhscale.com/scale/details/form/50010 |
| Inspection time (UTC) | 2026-10-02T15:31:54.501Z |
| Form heading matches / resource key matches | True / True |
| Observed Form resource key | MNU_MONITORINGBUILDERTRANSACTION |
| Observed configured table/view | MetaTrans_GetMonitoringBuilderModel |
| Screens grid loaded / record count | True / 1 |
| Screen IDs exposed as links in observed grid | 1501 |
| This dossier Screen ID present in observed links | True |
| Mutations performed | False |

Source: [Form-configuration navigation audit](../../evidence/config-form-navigation.json). The audit opened the Form entry, expanded Form Properties and Screens, and compared the Form identity. Screen IDs above are only the links visibly exposed by that grid. A grid with no captured Screen links can still contain configuration rows. This does not establish which Screen variant is selected at runtime or that its child configuration was traversed.

## Runtime evidence

No matching runtime-route observation was found in the loaded evidence files. This dossier is a configuration map, not a claim that the route is accessible.

## Configurable architecture

Monitoring Screen Builder is recorded as `metadata_editor`. Its saved configuration contains 1 parts, 8 groups, 16 controls, and 16 grid-column records. This record uses its own configured part/group composition; inspect the names and relationships below instead of assuming the standard Insight hierarchy.

English labels below are resolved metadata resource labels, not proof of the currently rendered translation. Numeric type codes are preserved without inventing an enum meaning. Not populated means the extracted property has no value; it does not supply a default.

### Screen parts

| Part ID / name | English label / resource key | Type / sequence | Active / system / partial | Default action |
|---|---|---|---|---|
| 3463 / CrudDataPane | Not populated / Not populated | 10 / 25 | Y / Y / N | MonitoringBuilderMenuActionSave |

### Part 3463: CrudDataPane

| Group ID / name | Parent group ID | English label / resource key | Type / sequence | Active / system | Layout / loading / default action |
|---|---|---|---|---|---|
| 14421 / MonitoringBuilderMenu | Not populated | Not populated / Not populated | 70 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14421; default=None |
| 14422 / MonitoringBuilderMenuGroup | 14421 | Not populated / Not populated | 60 / 25 | Y / Y | Fixed to top=Y; loading=0; nested unit=14421; default=None |
| 14423 / MonitoringBuilderMainAccordion | Not populated | Not populated / Not populated | 40 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |
| 14424 / MonitoringBuilderFormAndScreenSubAccordion | 14423 | Screen Information / SCREENINFORMATION | 50 / 2000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |
| 14425 / SummaryMenuSubAccordion | 14423 | Summary Tiles / SUMMARYTILES | 50 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |
| 14426 / BreadCrumbSubAccordion | 14423 | Actions Bar / ACTIONSBAR | 50 / 10000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |
| 14427 / ChartAreaSubAccordion | 14423 | Chart Area / CHARTAREA | 50 / 60000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |
| 14428 / IndicatorTileSubAccordion | 14423 | Indicator Tiles / INDICATORTILES | 50 / 80000 | Y / Y | Fixed to top=N; loading=0; nested unit=14423; default=None |

#### Group 14422: MonitoringBuilderMenuGroup — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41847 / MonitoringBuilderMenuActionSave | Not populated / Save | 150 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=None; TOOL_TIP_RESOURCE_KEY=Save |
| 41848 / MonitoringBuilderHeaderSectionNewScreen | Not populated / Not populated | 260 / 25 | Y / Y | DATA_SOURCE_TYPE=None; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14424: MonitoringBuilderFormAndScreenSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41849 / FormId | Not populated / FormId | 90 / 200 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 41850 / FormKeyName | Not populated / FormKeyName | 10 / 400 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 41851 / FunctionalArea | Not populated / FunctionalArea | 80 / 500 | Y / Y | DATA_SOURCE_TYPE=70; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |

#### Group 14425: SummaryMenuSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41852 / SummaryTileGrid | Not populated / Not populated | 20 / 7100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41852 `SummaryTileGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14280 / ObjectId | ObjectId / Not populated / ObjectId | 20 / 10 / 5 / 122 | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14281 / Sequence | Sequence / Not populated / Sequence | 20 / 10 / 10 / 122 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14282 / Databinding | Databinding / Data Binding / DATABINDING | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14283 / ResourceKey | Resource_Key / Not populated / ResourceKey | 10 / 10 / 30 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14426: BreadCrumbSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41853 / jumpToInsight | Insight / INSIGHT | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 41854 / Breadcrumblabel | Breadcrumbs / BREADCRUMBS | 30 / 7000 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRow-1; TOOL_TIP_RESOURCE_KEY=None |
| 41855 / BreadCrumbGrid | Not populated / Not populated | 20 / 7100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41855 `BreadCrumbGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14284 / ObjectId | ObjectId / Not populated / ObjectId | 20 / 10 / 5 / 122 | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14285 / ResourceKey | Resource_Key / Not populated / ResourceKey | 10 / 10 / 30 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14427: ChartAreaSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41856 / ChartStoredProcedure | Stored Procedure / STOREDPROCEDURE | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 41857 / DataBinding | Data Binding / DATABINDING | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 41858 / drilldownToInsight | Insight URL / INSIGHTURL | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 41859 / InsightCriteria | Insight Criteria / INSIGHTCRITERIA | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-2; TOOL_TIP_RESOURCE_KEY=None |
| 41860 / ChartAreaGrid | Not populated / Not populated | 20 / 8100 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41860 `ChartAreaGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14286 / ObjectId | ObjectId / Not populated / ObjectId | 20 / 10 / 5 / 122 | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14287 / DrillDownLevel | DrillDownLevel / Drill Down Level / DRILLDOWNLEVEL | 20 / 10 / 10 / 500 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14288 / LevelCriteria | LevelCriteria / Level Criteria / LEVELCRITERIA | 10 / 10 / 10 / 500 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

#### Group 14428: IndicatorTileSubAccordion — controls

| Control ID / name | English label / resource key | Type / sequence | Active / system | Binding / layout / default flags |
|---|---|---|---|---|
| 41861 / StoredProcedure | Stored Procedure / STOREDPROCEDURE | 10 / 600 | Y / Y | DATA_SOURCE_TYPE=20; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=40; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlRowNarrowColumn-1; TOOL_TIP_RESOURCE_KEY=None |
| 41862 / IndicatorTileGrid | Not populated / Not populated | 20 / 9000 | Y / Y | DATA_SOURCE_TYPE=90; DEFAULT_STATE=None; DEFAULT_ACTION=None; LABEL_ORIENTATION=None; SCREEN_GROUP_COLUMN_ID=None; TEMPLATE_NAME=_MetaControlGridRow-1; TOOL_TIP_RESOURCE_KEY=None |

Grid columns for control 41862 `IndicatorTileGrid`:

| Column ID / field name | Field expression / English label / resource key | Type / SQL clause / sequence / width | Active / system / hidden | Key / editable / required / sort / decimals / source type |
|---|---|---|---|---|
| 14289 / ObjectId | ObjectId / Not populated / ObjectId | 20 / 10 / 5 / 122 | Y / Y / Y | IS_PRIMARY_KEY=Y; IS_EDITABLE=N; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14290 / ResourceKey | ResourceKey / Not populated / ResourceKey | 10 / 10 / 10 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14291 / DataBinding | DataBinding / Not populated / DataBinding | 10 / 10 / 20 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14292 / TileCriteria | TileCriteria / Not populated / TileCriteria | 10 / 10 / 30 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14293 / GoToInsightURL | GoToInsightURL / Go to Insight URL / GOTOINSIGHTURL | 10 / 10 / 30 / 325 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=Y; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14294 / CautionCriteria | CautionCriteria / Caution Criteria / CAUTIONCRITERIA | 10 / 10 / 30 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |
| 14295 / WarningCriteria | WarningCriteria / Warning Criteria / WARNINGCRITERIA | 10 / 10 / 30 / 221 | Y / Y / N | IS_PRIMARY_KEY=N; IS_EDITABLE=Y; REQUIRED_FOR_EDIT=N; ALLOW_SORT=Y; DECIMAL_POSITIONS=None; DATA_SOURCE_TYPE=None |

## Control attributes and event bindings

The [interaction map](../../database/screen-interaction-map.json) associates 34 control attributes, 13 events, and 13 event parameters with this Screen. These are configured relationships, not observed invocations.

Attribute and parameter values are intentionally not included in that map; it retains their byte lengths and SHA-256 fingerprints of UTF-16LE values. The tables below expose names, identifiers, flags, and value lengths only. A parameter named POSTServiceURL does not establish its endpoint without separate source/browser evidence; a security-checkpoint attribute does not establish the current user's permissions.

### Configured control attributes

| Attribute ID | Control ID / name | Attribute name | Active / system / control property | Value bytes / non-null token slots |
|---:|---|---|---|---|
| 32224 | 41847 / MonitoringBuilderMenuActionSave | data-securityCheckpoint | Y / Y / N | 2 / 0 |
| 32225 | 41849 / FormId | data-rule-required | Y / Y / Y | 8 / 0 |
| 32226 | 41850 / FormKeyName | data-rule-required | Y / Y / Y | 8 / 0 |
| 32227 | 41850 / FormKeyName | data-msg-required | Y / Y / Y | 18 / 1 |
| 32228 | 41851 / FunctionalArea | data-rule-required | Y / Y / Y | 8 / 0 |
| 32229 | 41851 / FunctionalArea | data-msg-required | Y / Y / Y | 18 / 1 |
| 32230 | 41852 / SummaryTileGrid | data-formId | Y / Y / Y | 10 / 0 |
| 32231 | 41852 / SummaryTileGrid | data-modelClass | Y / Y / N | 114 / 0 |
| 32232 | 41852 / SummaryTileGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32233 | 41852 / SummaryTileGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32234 | 41853 / jumpToInsight | data-rule-required | Y / Y / Y | 8 / 0 |
| 32235 | 41853 / jumpToInsight | data-msg-required | Y / Y / Y | 18 / 1 |
| 32236 | 41855 / BreadCrumbGrid | data-formId | Y / Y / Y | 10 / 0 |
| 32237 | 41855 / BreadCrumbGrid | data-modelClass | Y / Y / N | 112 / 0 |
| 32238 | 41855 / BreadCrumbGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32239 | 41855 / BreadCrumbGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32240 | 41856 / ChartStoredProcedure | data-rule-required | Y / Y / Y | 8 / 0 |
| 32241 | 41856 / ChartStoredProcedure | data-msg-required | Y / Y / Y | 18 / 1 |
| 32242 | 41857 / DataBinding | data-rule-required | Y / Y / Y | 8 / 0 |
| 32243 | 41857 / DataBinding | data-msg-required | Y / Y / Y | 18 / 1 |
| 32244 | 41858 / drilldownToInsight | data-rule-required | Y / Y / Y | 8 / 0 |
| 32245 | 41858 / drilldownToInsight | data-msg-required | Y / Y / Y | 18 / 1 |
| 32246 | 41859 / InsightCriteria | data-rule-required | Y / Y / Y | 8 / 0 |
| 32247 | 41859 / InsightCriteria | data-msg-required | Y / Y / Y | 18 / 1 |
| 32248 | 41860 / ChartAreaGrid | data-formId | Y / Y / Y | 10 / 0 |
| 32249 | 41860 / ChartAreaGrid | data-modelClass | Y / Y / N | 110 / 0 |
| 32250 | 41860 / ChartAreaGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32251 | 41860 / ChartAreaGrid | pageSize | Y / Y / Y | 4 / 0 |
| 32252 | 41861 / StoredProcedure | data-rule-required | Y / Y / Y | 8 / 0 |
| 32253 | 41861 / StoredProcedure | data-msg-required | Y / Y / Y | 18 / 1 |
| 32254 | 41862 / IndicatorTileGrid | data-formId | Y / Y / Y | 10 / 0 |
| 32255 | 41862 / IndicatorTileGrid | data-modelClass | Y / Y / N | 118 / 0 |
| 32256 | 41862 / IndicatorTileGrid | data-restupdate | Y / Y / Y | 0 / 0 |
| 32257 | 41862 / IndicatorTileGrid | pageSize | Y / Y / Y | 4 / 0 |

### Configured events

| Event object ID / trigger | Control ID / name | Configured handler name | Grid column | Active / system |
|---|---|---|---|---|
| 13920 / click | 41847 / MonitoringBuilderMenuActionSave | _webUi.detailsScreenBinding.invokePOSTWebService | Not populated | Y / Y |
| 13921 / iggridupdatingrowdeleted | 41852 / SummaryTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13922 / iggridupdatingrowadded | 41852 / SummaryTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13923 / iggridupdatingeditrowended | 41852 / SummaryTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13924 / iggridupdatingrowdeleted | 41855 / BreadCrumbGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13925 / iggridupdatingrowadded | 41855 / BreadCrumbGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13926 / iggridupdatingeditrowended | 41855 / BreadCrumbGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13927 / iggridupdatingrowdeleted | 41860 / ChartAreaGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13928 / iggridupdatingrowadded | 41860 / ChartAreaGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13929 / iggridupdatingeditrowended | 41860 / ChartAreaGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13930 / iggridupdatingrowdeleted | 41862 / IndicatorTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13931 / iggridupdatingrowadded | 41862 / IndicatorTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |
| 13932 / iggridupdatingeditrowended | 41862 / IndicatorTileGrid | _webUi.Grid.enableCommitActionForEditableGrid | Not populated | Y / Y |

### Configured event parameters

| Parameter ID / event object ID | Parameter name | Active / system | Value bytes |
|---|---|---|---:|
| 19227 / 13920 | POSTServiceURL | Y / Y | 142 |
| 19228 / 13921 | CommitSelector | Y / Y | 34 |
| 19229 / 13922 | CommitSelector | Y / Y | 34 |
| 19230 / 13923 | CommitSelector | Y / Y | 34 |
| 19231 / 13924 | CommitSelector | Y / Y | 34 |
| 19232 / 13925 | CommitSelector | Y / Y | 34 |
| 19233 / 13926 | CommitSelector | Y / Y | 34 |
| 19234 / 13927 | CommitSelector | Y / Y | 34 |
| 19235 / 13928 | CommitSelector | Y / Y | 34 |
| 19236 / 13929 | CommitSelector | Y / Y | 34 |
| 19237 / 13930 | CommitSelector | Y / Y | 34 |
| 19238 / 13931 | CommitSelector | Y / Y | 34 |
| 19239 / 13932 | CommitSelector | Y / Y | 34 |

## Selected dependency tokens

The separate [safe dependency supplement](../../database/safe-dependency-tokens.json) contains 10 selected candidate rows for this Screen: **5 accepted tokens** and **5 omitted values**. Rejected payloads are not reproduced. Candidates come from an exact configuration-name allowlist and strict value grammars; this is not a count of every configured value.

This supplement adds selected identifiers, resource codes, checkpoints, callbacks, and relative API paths. The original interaction map remains hash-only for attribute/parameter values. These tokens establish configuration dependencies; backend semantics, runtime selection, permission effects, and successful operation remain unverified.

| Source table / object ID | Control ID / event ID | Configuration name | Token kind | Accepted safe value | Active / system |
|---|---|---|---|---|---|
| SCREEN_CONTROL_ATTRIBUTES / 32224 | 41847 / Not applicable | data-securityCheckpoint | checkpoint | 1 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32230 | 41852 / Not applicable | data-formId | form_id | 50010 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32236 | 41855 / Not applicable | data-formId | form_id | 50010 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32248 | 41860 / Not applicable | data-formId | form_id | 50010 | Y / Y |
| SCREEN_CONTROL_ATTRIBUTES / 32254 | 41862 / Not applicable | data-formId | form_id | 50010 | Y / Y |

## Remaining verification

- Resolve remaining attribute/parameter values, CSS, named data sources, and backend semantics where needed. Selected dependency tokens and fingerprints do not establish complete action behavior or parameter mapping.
- Resolve type-code enums, inherited/default properties, conditional visibility, selection-dependent availability, and permission checkpoints from authoritative metadata/source evidence.
- Verify the currently selected Screen variant and traverse applicable record-detail/dialog/workflow routes. A successful parent route does not close those child paths.
- Confirm functional purpose, prerequisites, side effects, and error behavior from source or an explicitly suitable controlled exercise. No business operation is marked tested by this dossier.
- Verify keyboard/screen-reader behavior separately; field labels and DOM snapshots alone are not accessibility acceptance.

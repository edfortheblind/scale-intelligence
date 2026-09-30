# Source reconciliation and deployment questions

These comparisons connect captured AIM/SDK/SQL evidence with supplied implementation material. They retain product, version, configuration and timing differences. No external process, UI navigation or new configuration read occurred.

The [machine-readable register](mappings/source-reconciliation.json) resolves AIM evidence through [help sources](mappings/help-topics.json) and SDD evidence through [exact source/node citations](../SDD/derived/reviewed-knowledge.json).

## work-monitor-meaning

The implementation documents describe Open, In Progress and Closed work. The reviewed SQL monitor has its own filters, grouping and last-hour closed-count query. Shared labels do not prove identical screen bindings, inclusion rules or current counts.

Evidence disposition: `COMPATIBLE_PURPOSE_DIFFERENT_EVIDENCE_SCOPE`.

Minimum missing evidence: Sanitized installed monitor/screen-to-routine bindings and filter definitions; a synthetic example could demonstrate grouping without operational records.

AIM source IDs: family-work-aim. SQL object IDs: 1082799265, 172579703. SDD reviewed record IDs: work-monitor.

## automatic-putaway-timing

Automatic putaway is a documented configuration concept. The Covetrus SDD warns that confirmation before travel finishes affects recorded labor travel time. The retained aggregate observed AUTOMATIC_PUTAWAY N in 33 work-profile detail rows; it neither identifies an effective operator profile nor verifies the SDD behavior here.

Evidence disposition: `IMPLEMENTATION_TIMING_EXAMPLE_NOT_DEPLOYMENT_FACT`.

Minimum missing evidence: Version-matched work-profile/application confirmation contract and sanitized labor start/end event semantics. Do not execute work to manufacture timing.

AIM source IDs: family-locating-aim, family-labor-management-aim. SQL object IDs: 1544392571. SDD reviewed record IDs: covetrus-auto-putaway-timing, automatic-putaway.

## cycle-count-tolerance-conflict

Cycle counting checks physical versus recorded stock. The supplied SDDs contain implementation-specific tolerance choices; Grupo Julio describes a current 9999 value and an intended zero value. These are not interchangeable defaults and neither establishes this deployment’s tolerance.

Evidence disposition: `IMPLEMENTATION_CHOICES_AND_CURRENT_VERSUS_INTENDED_CONFLICT`.

Minimum missing evidence: Sanitized installed cycle-count tolerance scope, units and approval/recount behavior, with observation time and version.

AIM source IDs: family-cycle-counting-aim. SQL object IDs: . SDD reviewed record IDs: covetrus-cycle-tolerance, grupo-cycle-tolerance-conflict.

## labels-selection-versus-output

AIM describes configured rendering and printing; SQL supplies document choices and printer defaults; the SCALE 2021 training deck lists additional label prerequisites. Selecting a document, dispatching it and completing physical printing are separate evidence stages. Its 203-dpi guidance is version-specific, not proof of installed printer support.

Evidence disposition: `COMPLEMENTARY_STAGES_WITH_VERSION_LIMIT`.

Minimum missing evidence: Sanitized installed renderer/template/version mapping and acknowledgment contract, with a synthetic sample only if separately provided.

AIM source IDs: family-paperwork-aim. SQL object IDs: 901226611. SDD reviewed record IDs: label-prerequisites, document-routing.

## mawm-product-boundary

LAND describes Manhattan Active Warehouse Management. It remains comparison material; its choices cannot populate SCALE configuration defaults or explain deployed SCALE behavior without claim-specific applicability evidence. Both supplied originals remain preserved and one content item is indexed provisionally.

Evidence disposition: `EXCLUDED_FROM_SCALE_BEHAVIOR_TRANSFER`.

Minimum missing evidence: Product/version-specific evidence establishing any proposed shared claim; product-name similarity or file placement is insufficient.

AIM source IDs: . SQL object IDs: . SDD reviewed record IDs: land-product-boundary.

## status-995-meaning

The captured AIM status summary n166 names outbound 995 as Finished Item Is Allocated on a component line. SHP_SetStatusesAtShipConfirm excludes status1 = 995 in its reviewed detail updates. This joins a documented meaning and an observed numeric branch while leaving the installed status-flow mapping and caller conditions unverified.

Evidence disposition: `DOCUMENTED_LABEL_AND_STATIC_BRANCH_DEPLOYMENT_MAPPING_OPEN`.

Minimum missing evidence: Sanitized installed outbound status definition and status-flow binding for the relevant application version.

AIM source IDs: family-status-aim. SQL object IDs: 1809753850. SDD reviewed record IDs: .

## insight-screen-future-association

The SDD material documents Insight Architect activation and publishing for Manhattan Active SCALE; metadata objects also exist in the replica. This is an association for the future screen register, not proof of active screen configuration or completed navigation/SOP capture.

Evidence disposition: `FUTURE_NAVIGATION_ASSOCIATION_ONLY`.

Minimum missing evidence: Separately initiated authorized Insight screen registration with installed version, screen identity, access context and verified navigation.

AIM source IDs: family-general-system-concepts-aim. SQL object IDs: 43863223. SDD reviewed record IDs: insight-publish-boundary, insight-activation.

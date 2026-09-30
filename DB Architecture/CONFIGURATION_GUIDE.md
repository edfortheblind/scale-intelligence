# Configuration guide

14 reviewed documentary setting contracts. Settings labels are documentary concepts, not inferred database-column mappings. Five existing aggregate checks remain unchanged. SDD guidance is separately product/version scoped.

These are captured vendor rules, not instructions to change configuration or statements of current effective values. Defaults, missing values and precedence remain explicit when unestablished. See [reviewed observations](CONFIGURATION_VALIDATION.md) and [SDD reconciliation](../SDD/README.md) for separate evidence classes.

## Allocation rule sequence

Select candidate locations and strategy in numerical sequence order.

Scope: Allocation rule/sequence.

Accepted/documented values: Ordered sequences and a configured selection/strategy; exhaustive accepted-value list not established.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Sequences are processed in numeric order. No item/class/assignment override precedence is asserted.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-allocation-aim`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75. Setting-specific nodes: n71, n73.

## Locating rule sequence and selection

Choose storage destinations using a selection and strategy.

Scope: Locating rule/sequence.

Accepted/documented values: Documented strategies include permanent assignment, consolidation, empty location and specific multi-item location. See source for their separate constraints.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Sequences use numeric order. Manual item assignment and rule-set assignment are documented; conflict precedence between them is not established.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113. Setting-specific nodes: n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108.

## Delayed Locating

Route located product through a receiving pre-locate location with work when both required settings are active.

Scope: Locating rule plus receiving preference.

Accepted/documented values: Active/inactive documented. The reviewed database checker counts Y/N/NULL/OTHER for LOCATING_RULE_HEADER.DELAYED_LOCATING.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Both Delayed Locating and Create Putaway Work must be active. Parent locating uses the parent rule; child locating uses the nested-container rule. Otherwise locating uses rule details.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

At 2026-09-29 22:50:28-30 UTC, 36 inspected locating-rule headers had DELAYED_LOCATING N. This is not a per-container effective setting or current-primary guarantee.

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113. Setting-specific nodes: n113.

## Create Putaway Work

Determine whether receiving creates putaway work; participates in the delayed-locating decision.

Scope: Receiving preference.

Accepted/documented values: Active/inactive; exact deployed field encoding not established by this vendor passage.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: For delayed locating, this setting combines with the locating-rule flag; neither setting alone is sufficient.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-locating-aim`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113. Setting-specific nodes: n64, n113.

## Minimum replenishment threshold

Trigger real-time replenishment when quantity falls below a configured minimum percentage.

Scope: Location/location type or item/item class.

Accepted/documented values: Percentage; allowed range, rounding and missing-value defaults require detailed source review.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: The summary lists multiple scopes but does not establish their override order.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138. Setting-specific nodes: n69, n120.

## Replenishment quantity strategy

Choose how much product to replenish.

Scope: Replenishment master/strategy.

Accepted/documented values: Fill Destination; Round Down to previous whole increment; Round Up to next whole increment.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Fill Destination ignores Maximum Replenishment Percentage. The summary does not establish other capacity override rules.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138. Setting-specific nodes: n93, n100, n104, n108.

## Create Work Method

Control whether movement work is created automatically or later.

Scope: Replenishment master and originating process.

Accepted/documented values: Automatic and Manual are documented here; do not claim these exhaust every installed value.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Wave-generated requests require both a work-creation step in the wave and Automatic on the master. Manual/real-time requests use the master method.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-replenishment-aim`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138. Setting-specific nodes: n127, n130, n133, n138.

## Default versus custom status flow

Select the sequence of processing stages for a line.

Scope: Receipt/shipment line and defined status flow.

Accepted/documented values: A defined custom flow or the default flow; exact custom identifiers are deployment-specific.

Default: Documented default flow when no custom flow is associated.

Precedence and dependencies: The documented default is assigned when no custom flow is associated. A custom flow must be defined and associated before interface processing.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-status-aim`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n83, n86, n89, n92, n96, n103, n106, n109, n112, n115, n121, n124, n127, n130, n133, n136, n139, n142, n145, n148, n151, n154, n157, n160, n163, n166, n169, n172, n175, n178, n182, n185, n190. Setting-specific nodes: n74, n80, n96, n185.

## Outbound QC assignment priority

Choose which matching rule marks a container for inspection.

Scope: Active QC assignment records.

Accepted/documented values: Priority ordering and assignment reason; numeric bounds and defaults are not established here.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Evaluate active records in ascending priority; mark QC Pending at a match and increment the current-container count on all matching records as documented.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-quality-control-aim`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106. Setting-specific nodes: n104.

## Inbound QC eligibility

Select product eligible for inbound inspection and hold relevant quantities until disposition.

Scope: Item master.

Accepted/documented values: Eligible/ineligible; exact deployed field/default not established.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: The documented inbound path supports check-in-created license plates, not downloaded receipt containers.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-quality-control-aim`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106. Setting-specific nodes: n87.

## Window security record selection

Determine which documented permission records are consulted.

Scope: System-level versus user-level window security.

Accepted/documented values: Window/action permissions; exact active matrix is outside the captured evidence.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: The captured vendor model references user-level records when present, otherwise system-level records. This is not verified application authorization for the installed version.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-general-system-concepts-aim`: [General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md); AIM article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`, original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`, nodes n76, n81, n86, n91, n93, n95, n97, n100. Setting-specific nodes: n91, n93, n95, n97, n100.

## Interface language and resource selection

Display text in an available language for the specific interface.

Scope: Client/OS/browser/device/TPM setting and translated resources.

Accepted/documented values: Installed resource languages; translated text availability is a prerequisite.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: Desktop Windows-user language, browser language for other application screens, RF device language and TPM server-side setting are distinct documented paths. Missing help language folder falls back to base help.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-multi-language-support-aim`: [Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md); AIM article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`, original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`, nodes n63, n80, n82, n87, n92, n97, n102, n104. Setting-specific nodes: n80, n82, n87, n92, n97, n104.

## Immediate-needs request priority

Order fulfillment of competing requests for the same item.

Scope: Trigger default and request-level value.

Accepted/documented values: Priority value; exact range and deployment default not established.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: The trigger supplies a default, a request can be changed manually, and priorities apply to requests for the same item.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-immediate-needs-aim`: [Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md); AIM article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`, original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`, nodes n65, n67, n69. Setting-specific nodes: n67.

## Dock-process enablement

Choose which dock stages are used.

Scope: Consolidation, staging and loading processes.

Accepted/documented values: Each documented process can be enabled or disabled independently.

Default: NOT_ESTABLISHED_FROM_REVIEWED_PASSAGES

Precedence and dependencies: No mandatory all-stages sequence or installed override precedence is established.

Validation: Compare the sanitized installed setting definition and its application binding with this cited rule. No new database query is authorized by this guide.

Missing or conflicting setting: Do not substitute a value or precedence rule when the applicable contract is absent or conflicting; obtain the exact configured scope and version.

`family-dock-management-aim`: [Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md); AIM article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`, original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`, nodes n65. Setting-specific nodes: n65.

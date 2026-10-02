# Snapdragon source reference

Reviewed 2026-10-02. This reference explains the metadata model behind **Insight Architect**, called Snapdragon in the retained SDK source URL. It supports the live screen inventory; it is not a claim that the current installation implements every documented feature.

- [Configuration model](CONFIGURATION_MODEL.md): forms, screen hierarchy, routes, data bindings, actions, security, and customization.
- [Coverage criteria](COVERAGE_CRITERIA.md): what must be counted and observed before a section can be called complete.
- [Source receipts](source-index.json): 21 retained AIM/SDK articles with original URLs, local paths, capture timestamps, and verified SHA-256 hashes.
- [Schema reference](schema-index.json): 15 relevant table structures and 14 outgoing foreign-key records from the existing `20260929T214106Z` database snapshot. Contains no table rows.

Evidence has three separate meanings: product documentation describes a supported design; Sam's training describes a demonstrated workflow at its recording date; current browser and replica observations describe this installation at observation time. The reference files in this directory contribute the first category and historical schema structure only. The live inventory and training notes elsewhere in Snapdragon own the other categories.

The retained product sources contain two different customization descriptions. The SDK describes base and custom screen implementations under one form; AIM describes creation of a new custom form ID. [The model](CONFIGURATION_MODEL.md#customization-and-version-differences) preserves that difference. The current capture confirms same-form base/custom alternatives for Shipment form 2735; it does not establish every customization workflow.

The later [current-installation capture](../database/DATABASE_EVIDENCE.md) maps screen parts, groups, controls, group/grid columns, attributes, events and parameter relationships. Attribute/parameter values in the original bulk output are represented by hashes and byte lengths. A separate [dependency-token supplement](../database/SAFE_DEPENDENCY_TOKENS.md) retains selected identifiers and relative API paths under explicit name and token rules; it excludes rejected expressions and query payloads. The [Purchase Order walkthrough](../screens/purchase-order-configuration.md) records five directly inspected parameter bindings for one action. These observations supplement the product model; a structural record, token or value hash alone does not establish behavior.

Reference review is complete for the selected 21 articles (21/21 original hashes verified). This is **not** the percentage of screens visited, settings understood, or navigation completed. It does not change the accepted AIM/SDK collection status or close their existing source gaps.

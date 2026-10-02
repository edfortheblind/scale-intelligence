# Snapdragon: SCALE screen and configuration map

Start with [progress and percentages](STATUS.md), then use the [254-screen index](screens/INDEX.md). This folder documents the installed navigation and configuration structure observed on **2026-10-02**. It is an initial structural/functional map; conditional screen states and detailed behavior remain on the roadmap.

## What is available

| Read this | Use it for |
|---|---|
| [Status](STATUS.md) | Exact denominators, percentage by section, completed work and pending limitations |
| [Roadmap](ROADMAP.md) and [task register](inventory/tasks.json) | Work packages, evidence and next actions |
| [Screen index](screens/INDEX.md) | Find each form/screen, configured route, live outcome and configuration children |
| [Navigation map](NAVIGATION.md) | Open the 63 menu destinations and six additional numeric routes, with form links and observed outcomes |
| [Sam's training](training/README.md) | The navigation method, pinned source commit and corrections to uncertain training claims |
| [Purchase Order configuration walkthrough](screens/purchase-order-configuration.md) | Follow form 2796 through screen, part, group, control, event and parameter IDs |
| [Receiving / Cross Application / System Management](screens/receiving-cross-system.md) | Purpose, criteria, columns, actions and observed entry states |
| [Shipping / Order Planning](screens/shipping.md) | Outbound/planning screens and their observed controls |
| [Inventory / Work / Performance](screens/inventory-work-performance.md) | Inventory/work inquiry and transaction entry screens, monitors and SCI outcome |
| [Configuration model](reference/CONFIGURATION_MODEL.md) | Source-grounded explanation of forms, screens, groups, controls, data sources and behavior |
| [Replica configuration index](database/SCREEN_CONFIGURATION_INDEX.md) | Installed metadata counts and relational mapping |
| [Dependency mapping](database/DEPENDENCIES.md) | Selected table/column, form, checkpoint, API, stored-procedure and callback bindings |
| [Resume instructions](RESUME.md) | Continue without repeating completed discovery or losing scope limits |

## Verified scope

- **917 form records; 254 screen implementations; 253 distinct screen-linked forms; 211 active implementations.** These are different denominators.
- **211/211 active-form configuration pages inspected**, with matching form identity and a loaded Screens grid. Twenty-one legacy/unresolved rows have no navigable screen-path hyperlink; their form configuration still loads.
- **63/63 menu destinations attempted; 62 loaded.** Supply Chain Intelligence returns an application runtime error.
- **Six additional numeric routes inspected:** Warehouse Mobile Menu Insight loads; five Labor screens report that they are not licensed.
- **254 structural dossiers**, with runtime observations kept separate from metadata, base/custom status and shared application entries.
- **2,306 selected dependency values mapped across 142 screens**, including 184 distinct relative API paths and 74 distinct stored-procedure identifiers. These are configuration references; invocation behavior remains unverified.

The raw hierarchy explains how a screen is assembled. For example, Purchase Order form **2796** points to screen **1776**, its Actions menu is group **18050**, and its Close control is **51621**. That control has a `click` event and five configured service parameters. Reading this configuration did not close a purchase order.

## How to interpret the evidence

Sam's training demonstrates a method across different tenants. AIM/SDK describes product behavior across documented versions. The replica supplies installed configuration at its observation time; its freshness relative to PROD is not established. Browser observations establish what this session could reach and see. None alone proves all roles, workflows, action outcomes or conditional states.

All production interaction was inspection: menu navigation, accordion/dropdown expansion and configuration reading. No business action, configuration save, activation, publication, print or export was submitted. Captured runtime evidence excludes input values and business-grid rows. Database collection uses fixed read-only queries for configuration; credentials and raw SQL expressions remain outside this folder.

Detailed functional/configuration review remains open. The [status](STATUS.md) deliberately separates successful discovery from that remaining work.

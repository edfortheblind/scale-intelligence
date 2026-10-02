# Screen mapping completion criteria

This is the evidence checklist for the Snapdragon roadmap, not a declaration of live coverage. A source document, a known form ID, a successful route and a fully understood screen are different accomplishments.

## Define the denominator

Build the candidate universe from available form records, screen implementations, configured menu routes, Sam's training and links observed during traversal. Preserve the origin of each candidate. Classify Insight, Monitor, Details, Transaction, Complex, desktop/RF, editor-only, inactive/custom counterpart, or unresolved. Do not manufacture candidate IDs by scanning every integer or declare every `FORM` row to be an Insight.

Maintain separate identifiers for the form, implementation, route, part, nested group, control, event and parameter. One form can have more than one implementation; one implementation can expose multiple pages or states. Duplicate titles are not duplicate identities.

A whole-installation completion percentage requires a reconciled inventory. Until reconciliation, label the denominator **known candidates**, record the inventory timestamp and count additions. This prevents a successful partial visit set from appearing exhaustive.

## Evidence needed for each candidate

| Dimension | Completion evidence |
| --- | --- |
| Identity and availability | Form ID, title/resource key, implementation ID, active/base/custom status, page family, source of identity, availability outcome |
| Navigation | Entry path, requested and final URL, menu/breadcrumb context, confirmed parent/child links, return behavior, and stable route alternative where observed |
| Purpose | What an operator or administrator uses the screen for; inputs, outputs, prerequisite context and related process |
| Search | Basic/advanced criteria, types and operand choices, validation, required context and applicable saved-search behavior |
| List | Grid columns and meaning, sorting/filtering/selection behavior, paging, summaries and read-only drilldowns |
| Detail | Selected-record context, every visible tab/accordion/section, links and applicable empty-state behavior |
| Actions | Visible label, selection/context requirement, enablement evidence, bound handler/service where available, permission checkpoint, expected effect; no mutation required to document an action |
| Configuration | Metadata path for each part/group/control, layout/default/visibility properties, data source, grid column definitions, events, parameters and related settings |
| Data dependencies | Configured table/view, filter fields, detail procedure/service, context parameters and related screen IDs, each backed by source or metadata evidence |
| Evidence and limits | Observation timestamp, sanitized note/receipt, product/training/live evidence distinction, unvisited branch and reason, unsupported inference |

Not all dimensions apply to every page family. For example, an editor entity page need not have a runtime Insight search pane. Mark a dimension **not applicable** only with its reason; do not silently remove unfinished work from the denominator.

## States to count

At minimum, track `unvisited`, `route_attempted`, `loaded`, `structure_documented`, `configuration_mapped`, `reviewed`, and `blocked`. Preserve failure details alongside these stages. An access or invalid-link message counts as an attempted route, not a successfully inspected screen.

For tabbed and nested pages, keep a child-state checklist. A loaded header does not complete collapsed accordions, additional tabs, grid pages, detail sections, related editor records or modal configuration views. Document the action menu by observation without executing potentially mutating actions. When a branch requires saving, activating, deleting, publishing or submitting a transaction, record the boundary and the known behavior from metadata/product/training evidence.

Useful route outcomes include `success`, `application_invalid_link`, `permission_message`, `authentication_required`, `not_found`, `inactive_or_nonweb`, and `unexpected_error`. Preserve the exact visible category and requested/final URL. A category is a description of evidence, not a diagnosis: a suspected bad link remains unresolved until another configured or observed route confirms the destination.

## Progress calculations

Report counts as well as percentages, separated by functional section and page family:

- Route attempts: candidates with a recorded attempt / known candidates.
- Successful navigation: candidates whose relevant screen loaded / known navigable candidates, after classification; disclose unresolved candidates separately.
- Structure documentation: candidates whose applicable sections/states were described / applicable known candidates.
- Configuration mapping: implementations whose required metadata branches were mapped / applicable known implementations.
- Dependency mapping: documented controls/actions with resolved dependencies / controls/actions requiring a dependency.
- Section completion: reviewed dossiers meeting every applicable criterion / known candidates assigned to the section.

Use `N/A` for a zero denominator. Publish blocked and unclassified counts separately, and retain failed attempts in the attempted-work total. Do not average these percentages into a single apparent completion rate unless weights and the meaning of the result are explicitly stated. A roadmap item marked complete must point to a deliverable and its verification evidence.

## Reconciliation before closure

Reconcile the form/implementation inventory with configured navigation and discovered links; account for base/custom and active/inactive variants; account for nested metadata; resolve or document each failed route; confirm that every retained dossier has source receipts; and list all remaining live behavior, permission, configuration or business-action assumptions. Screen inspection cannot prove that a transaction succeeds, that a configuration change is safe, or that every role sees the same result.

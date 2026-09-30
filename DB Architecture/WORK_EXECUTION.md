# Work execution and monitoring

This snapshot review explains how work is offered, grouped, summarized and moved to inactive storage. It adds 13 module contracts and 21 role records, including 15 previously unreviewed objects. Seven help topics include two replacements for the initial pilot and five new answers. These counts describe this batch, not all SCALE functionality.

The [machine-readable batch](mappings/batches/work-execution.json) binds every contract to snapshot `20260929T214106Z`, object ID, original-definition SHA-256, exact redacted source hash and line range. All 13 private original-definition hashes matched the retained fingerprints. Reviewed conclusions expose no operational records or arbitrary private literals. No routine was executed. Routine-body review is distinct from complete application flow, effective settings and measured runtime.

## Which work is offered?

A work profile defines rules for executing warehouse work. AIM describes ordered sequences, advancing when the current sequence has no more work. The reviewed selector receives a particular profile and sequence; it does not itself implement that complete application loop. [AIM profile configuration, nodes n60, n63, n65](../AIM/reading/c8c2ec9d410d0d0b34795db2c5e9739a523f1f43dcff53a075dd003d3728b917.md).

The selector uses the supplied user, warehouse, work unit, location, containers, grouping and feature context. Those inputs can change eligibility, ordering and result size. The following stages are source-derived behavior, not observed execution:

1. For cart work outside the cycle-count branch, inspect grouping and sequencing. If the gate passes, build sorting expressions from `WORK_REGROUP_ORDER` and **update stored instruction sequence** before returning candidates.
2. Read profile options, zones, authorization and feature settings. Some profile options are read by profile alone; other options use both profile and sequence. Multiple profile rows therefore cannot be assumed to yield one deterministic detail row for every setting.
3. Choose source/destination quantity and warehouse predicates. Apply branch-specific work type, group, hold, condition, company, zone, assignment, container and shipping conditions.
4. In the gated system-directed location path, probe exact location, a greater location and a lower location in that order, with priority and user-assignment refinements where applicable.
5. Execute the final dynamic candidate query with bound data parameters. Its projection and ordering vary by branch. A performance branch applies a configurable row limit; missing, invalid or nonpositive limits fall back to 2000.

Evidence: [selector lines 99–174](sql/51843597.sql#L99), [branch/probe logic lines 190–430](sql/51843597.sql#L190), [final construction and execution lines 431–752](sql/51843597.sql#L431). The dynamic mutation is established by reviewed private original lines 133–139 and original hash `eca08945d5ab9ce42fdf8c01403853dd3addf9a62075e31053e20732f7db87cf`; the repository reading copy intentionally hides SQL strings.

This procedure must not be treated as a read-only diagnostic. A candidate list is also not proof of exclusive assignment: its checks, optional sequence update and final reads are separate statements without a body-owned transaction or reservation lock. The application caller's transaction and claiming protocol remain unknown.

Configured sorting fields become SQL syntax. They are not protected by binding the ordinary data parameters. Actual sort configuration, all possible generated statements and equivalence between optimized and legacy paths remain open. The local regroup loop reads `TOP 1` without an ordering clause, so its initial ordered insertion does not prove subsequent sorting-rule consumption order. These are static review findings, not reproduced runtime defects.

What to check: identify the profile and sequence, branch inputs and relevant authorization through an approved support path. The existing aggregate flag observations do not identify one user's effective profile. Do not infer a universal sort order, unlimited work, or successful selection from the procedure name.

## Why monitor counts differ

A work unit may contain several instruction rows. The group chart counts distinct work units within each work group; its summary adds distinct-unit counts within condition groups. A work unit represented in several conditions can contribute more than once to that summary. Instruction totals count rows. Estimated time sums stored estimates and is not elapsed duration.

The group and work-type procedures each return a chart followed by six scalar result sets. They read nonclosed detail instructions for active totals. The recently closed value reads both active and inactive storage, restricted to closed detail rows whose stamp falls within the previous hour. That stamp is not proven to be the exact completion-event time. [Group chart lines 17–75](sql/1082799265.sql#L17); [type chart lines 14–86](sql/1114799379.sql#L14).

Empty data has several output forms: chart rows may be absent, some `SUM` totals may be NULL, estimated time is normalized to zero, and a closed `COUNT` is zero. An absent warehouse filter yields no matching warehouse comparisons; it is not evidence that the warehouse has no work. Duplicate filter names lack a deterministic assignment order.

The work-type chart narrows the warehouse to one work group. A missing or normalized unassigned group selects NULL-group work, not every group. AIM describes group → type → assigned-user drilldown and warns that customized screens may differ. These are documented associations for future screen review; no deployed navigation was verified. [AIM monitor nodes n58, n60, n64, n114, n122](../AIM/reading/b77c848bec2898b6a573aa878319bb07181352908f6b6a8fa4c55b919d5c310c.md).

The SDK explains the monitor retrieval service, criteria parser and binding columns. Its example has one chart result, whereas the captured group routine adds six summary result sets and a detail-instruction restriction. The example therefore supports the integration pattern without being an exact copy of deployed behavior. [SDK nodes n47, n56, n59, n62, n97](../SDK/reading/2f1e464b919bbe6d9db8cf9f7a2eb6d5cfd5866b662fd85c0ef3c9c02005b000.md).

What to check: compare counting unit, condition, group, warehouse, time window and refresh context. Separate chart/scalar queries have no shared snapshot transaction in these bodies, so concurrent work can change between them. Generic-description joins also influence chart grouping; totals use separate queries.

## What indicator tiles count

The reviewed indicator routine chooses one of five conditions, always counting distinct work units:

| Tile purpose | Static predicate meaning |
| --- | --- |
| Aging | Open/in-process work with aging timestamp strictly earlier than UTC now minus one day. |
| Priority | Open/in-process work with priority at most 10. |
| Held | Open/in-process work with a non-NULL hold code. |
| Available condition group | Open/in-process work. |
| Assigned in-process | In-process work with a non-NULL assigned user. |

These branches do not contain the chart's detail-instruction filter. A recognized empty branch returns zero; an unknown or NULL tile selector produces no tile result set. Non-NULL empty strings meet the `IS NOT NULL` checks. [Indicator lines 15–90](sql/1098799322.sql#L15).

Caution and warning criteria are caller-supplied and evaluated independently. The critical-level function extracts an unsigned digit run and tests operator substrings. It returns one shared positive token when a test succeeds, otherwise NULL; it does not choose a combined winning severity. Invalid or oversized criteria have no dedicated safe fallback. [Critical-level function lines 9–47](sql/664701766.sql#L9).

What to check: confirm the selected tile and its threshold grammar before comparing a result with chart totals. No active tile names, thresholds, counts or colors were observed.

## Criteria and feature settings

The monitor parser returns `filterName` and `filterValue` rows. SDK criteria are comma-separated and end with a semicolon. The body tries equals, less-than and greater-than separators, trims the values and retains duplicate names. It does not return the comparison operator. NULL/empty/one-character input returns an empty table; the final unterminated criterion can be omitted. Intermediate 100- and 500-character buffers are narrower than the unbounded input, so long or malformed criteria are not proven safe. [Parser lines 12–77](sql/696701880.sql#L12).

The feature function has a concrete precedence rule: global Y returns Y; global N returns Y for a matching user override and N otherwise. A missing/other global value can return NULL. Duplicate joined matches can fail its scalar subquery. It does not inspect the feature's removed flag, product release or authorization-text fields. No feature or user values were fetched. [Feature resolver lines 2–19](sql/680701823.sql#L2).

These findings distinguish absent, duplicate and user-scoped settings. They do not authorize new configuration queries or reveal effective permissions.

## Grouping does not itself assign a worker

The work-unit grouping routine first writes the supplied group and resets sequence for all rows matching the work-unit name. It does not restrict that first update by warehouse, user or instruction type. Its second statement sequences the applicable zero-sequence detail subset. It does not write the assigned-user field. A NULL group can be written by the first update but cannot match the second equality predicate, leaving reset sequences. The two updates have no body-owned transaction. [Group update lines 8–40](sql/1354800234.sql#L8).

A separate unassign procedure clears group, user and team assignment for a nonempty group and one internal-process subset, then writes the supplied stamps. It leaves quantity, condition and sequence unchanged. No user/warehouse authorization check is present in that body. The supplied timestamp targets a nonnullable column. [Unassign lines 8–30](sql/1146799493.sql#L8).

What to check: establish the actual application caller, authorization and assignment transaction before attributing worker ownership to a group number. The source does not prove that every selector invocation is followed by either procedure.

## Closed and inactive work

The single-instruction deactivation routine copies the matching closed header and closed detail children into `IA_WORK_INSTRUCTION`, then deletes those matching active rows. Each statement has its own predicates; details can qualify even if their parent header did not. It does not change quantities or mark an open task closed. [Single deactivation lines 9–29](sql/890798581.sql#L9).

The batch routine first copies up to 10,000 eligible closed headers without an ordered TOP. Its shipment-related branch checks whether any linked shipment has trailing status below 900. It then copies active children whose parent appears anywhere in inactive storage, and deletes matching active detail/header IDs. The 10,000 bound applies only to the first insert. These bodies do not contain duplicate guards, an owned transaction, retention duration or scheduler frequency. [Batch deactivation lines 15–74](sql/874798524.sql#L15).

The combined view uses `UNION ALL` over active and inactive instruction tables. The snapshot exposes 102 compatible columns in both. It does not deduplicate or filter conditions, warehouse or age. Copy/delete operations can temporarily expose the same ID in both sources without stronger caller/isolation guarantees. Inactive storage is therefore not automatically an immutable audit trail. [View lines 5–9](sql/172579703.sql#L5).

What to check: identify the storage source and consumer filter. Moving closed work out of the active table does not necessarily remove it from a monitor. No cleanup or deactivation execution is recommended by this documentation.

## Insert-trigger effects

The outgoing-location trigger runs after an instruction INSERT. If any inserted row meets its process/location/template gate, the UPDATE joins all inserted instruction IDs and copies each target's destination template value into outgoing location. It does not repeat the qualifying gate per updated row. Mixed multi-row inserts can therefore affect nonqualifying inserted rows once another row enables the gate. This is static evidence, not a reproduced defect. [Trigger lines 2–17](sql/800057936.sql#L2).

The unresolved dependency named `inserted` is dispositioned as SQL's trigger pseudo-table, not a missing persistent table. This changes interpretation of one captured dependency entry without deleting the original catalog observation. The trigger is INSERT-only; the reviewed selector/group UPDATEs and deactivation DELETEs do not directly fire it.

## Remaining evidence

Application/service callers, effective authorization and configuration, actual screen bindings, transaction ownership outside these bodies, live concurrency behavior and whole-process timings remain unresolved. The selector's configured sorting expressions and feature-branch equivalence need further bounded evidence. No process family is declared completely reconciled by this batch.

The added help cases are authored expectations and forbidden claims; they are not results from a working help app. Future Insight registration, operational SOPs, retrieval tests and intended-user accessibility acceptance remain separate work.

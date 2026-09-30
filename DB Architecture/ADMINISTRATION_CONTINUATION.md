# Administration definitions and setup behavior

This source-grounded continuation reviews 46 complete procedure bodies and 27 table roles. It explains captured implementation, not current activation, permissions or successful warehouse execution. String literals remain opaque. The [batch](mappings/batches/administration-continuation.json) retains exact object, line and source hashes.

## Why configuration seed calls may preserve old settings

Many administration seed routines insert only when their key is absent. Repeating a call with a changed description or flag can therefore leave the existing row untouched. The action-menu routine also skips when another menu already has the same description.

1. Identify the exact routine and its duplicate key; do not assume all seed routines behave alike.
2. Check whether a matching row makes the insert a no-op; the reviewed bodies do not return a uniform success row.

Sources: [dbc_IActionMenu](sql/1708181481.sql), [dbc_IBatchSubmissionConfig](sql/1820181880.sql), [dbc_IDataRetrievalStmtHeader](sql/1836181937.sql), [dbc_IDynamicCallingHeader](sql/1932182279.sql), [dbc_IExitPointCategory](sql/1946802343.sql), [dbc_IExitPoint](sql/1948182336.sql), [dbc_IForm](sql/2012182564.sql), [dbc_ISystemConfigHeader](sql/2074802799.sql), [dbc_IMainUiTemplate](sql/2140183020.sql)

## Generic configuration updates replace omitted values

The generic configuration header and detail routines update existing records as well as insert missing ones. Their update branch assigns every listed field. Omitting an optional value supplies its default, often NULL, which can clear the old value. They do not validate detail values against the header definition.

1. Determine whether the record-type or record-type/identifier key already exists.
2. Review all supplied values and defaults because the update is not a partial patch.

Sources: [dbc_IGenericConfigDetail](sql/2026802628.sql), [dbc_IGenericConfigHeader](sql/2042802685.sql)

## Feature setting updates and unused removed input

The feature-management routine inserts a missing feature or updates its enabled flag, product-release field and modification stamps. The removed input is unused. A stored enabled flag alone does not prove that an application feature is currently available to a user.

1. Use the feature name to distinguish the insert and update branch.
2. Confirm application consumption and user permissions separately from the metadata write.

Sources: [dbc_IFeatureManagement](sql/1980182450.sql)

## Action menus, missing endpoints and repeated rules

An action definition needs an endpoint lookup; a menu option resolves a menu and optionally an action. Missing lookups can cause a required-field failure, while the menu option allows a NULL action. The rule routine appends each rule without checking for an existing copy. These routines register metadata and do not run an action.

1. Resolve endpoint/action/menu identities using each body’s stated predicate.
2. Distinguish required menu or endpoint identities from nullable menu-option actions, and inspect rule duplication separately.

Sources: [dbc_IDynamicAction](sql/1884182108.sql), [dbc_IDynamicActionRule](sql/1900182165.sql), [dbc_IActionMenuOption](sql/1724181538.sql)

## Endpoint and exit-point definitions do not execute hooks

Endpoint definitions describe code or transport bindings. Exit-point definitions describe named hooks and ordered parameters. The reviewed routines store those definitions without loading code, contacting a URI or invoking the hook. Existing definitions usually remain unchanged when the seed key already exists.

1. Read the endpoint or hook definition identity and required parent references.
2. Treat active flags and supported types as metadata until installed caller and service evidence establishes how they are used.

Sources: [dbc_IDynamicCallingDetail](sql/1916182222.sql), [dbc_IDynamicCallingHeader](sql/1932182279.sql), [dbc_IExitPointCategory](sql/1946802343.sql), [dbc_IExitPoint](sql/1948182336.sql), [dbc_IExitPointDetail](sql/1964182393.sql)

## Filter definitions, ordered terms and shared attributes

Filter setup stores a record-type definition, a named filter and ordered expression terms. These seed routines do not run the filter or check its expression grammar. Attribute definitions use one global attribute key: supplying another record type does not create another same-named attribute.

1. Identify the record type and filter name, then the sequence of each term.
2. Check field-type and expression meaning through the consuming implementation; stored text alone is not execution evidence.

Sources: [dbc_IFilterConfigDetail](sql/1962802400.sql), [dbc_IFilterConfigHeader](sql/1978802457.sql), [dbc_IFilterStatement](sql/1994802514.sql), [dbc_IFilterAttributes](sql/1996182507.sql)

## Form setup is a sequence of metadata helper calls

Form setup wrappers call separate helpers for the base form, display resources and checkpoint definitions. Viewer setup additionally creates viewer and screen metadata. No wrapper starts a transaction or compensates for a later helper failure, so complete setup depends on caller transaction behavior and all child calls succeeding.

1. Follow the exact wrapper’s helper order; process, configuration and viewer forms use different checkpoints.
2. Verify child definitions and the caller transaction before assuming the entire setup is atomic or effective permissions exist.

Sources: [dbc_IProcessForm](sql/136699885.sql), [dbc_IConfigForm](sql/1914802229.sql), [dbc_IViewerForm](sql/1957582012.sql), [dbc_IGenericConfigForm](sql/2053582354.sql), [dbc_IForm](sql/2012182564.sql)

## Insight, details and transaction form registrations differ

These wrappers register metadata forms and screen paths with numeric path type 6. Insight builds its path using the form ID. Details and transaction forms use a lowercased abbreviation and pass restriction/default identifiers. The transaction wrapper has an extra checkpoint tail. Registration does not prove the current screen route or actual navigation.

1. Select the wrapper used by the captured definition and follow its path construction and helper arguments.
2. Establish current screen navigation and effective restrictions separately; literal prefixes remain opaque in this review.

Sources: [dbc_IMetadataTransactionForm](sql/1989582126.sql), [dbc_IMetadataInsightForm](sql/2005582183.sql), [dbc_IMetadataDetailsForm](sql/2021582240.sql)

## Screen counts, templates and license associations

Screen setup checks the existing form rows, may replace the requested active flag, and uses a count guard before inserting. The table also enforces uniqueness on form ID plus active value. Template and license mapping routines register associations; they do not establish user access or license entitlement.

1. Distinguish form ID from screen object ID: one license helper selects every screen for the form, while Original selects one screen identity.
2. Keep count guards, table constraints and current application access separate; concurrent safety is not established by an existence check.

Sources: [dbc_IMainUiScreen](sql/2124182963.sql), [dbc_IMainUiTemplate](sql/2140183020.sql), [dbc_IMainUiTemplateFunGrpXref](sql/8699429.sql), [dbc_IMainUiWmLicenseXref](sql/24699486.sql), [dbc_IMainUiWmLicenseXrefOriginal](sql/40699543.sql)

## Lookup setup and status-flow metadata boundaries

Lookup setup stores table and field descriptions and can add resource text. Its optional configuration-record-type comparison is not NULL-safe. Status-flow setup inserts area/status metadata but does not move a warehouse transaction to a new status. Neither body proves the settings selected by an active user.

1. Check lookup record/table/configuration keys and the optional resource-text branch independently.
2. Read the exact functional-area/status key for status configuration; use separate transaction and caller evidence for operational effects.

Sources: [dbc_ILookupReference](sql/2108182906.sql), [dbc_IFunctionalAreaStatusFlow](sql/2010802571.sql)

## Screen parts, groups and controls preserve existing definitions

Screen setup stores parts, groups, layout columns, controls, attributes and event definitions. Most helpers preserve an existing name within its parent. The attribute helper also compares the value, so changing a value can add another row instead of replacing the old one. Event and parameter registration does not execute an event.

1. Check the exact parent identity and duplicate key before interpreting repeated setup.
2. Treat active flags, CSS, tokens and event metadata as definitions until a rendered application and caller behavior are separately verified.

Sources: [dbc_IScreenControl](sql/264700341.sql), [dbc_IScreenControlAttributes](sql/280700398.sql), [dbc_IScreenControlEvent](sql/296700455.sql), [dbc_IScreenControlEventParameters](sql/312700512.sql), [dbc_IScreenGroup](sql/344700626.sql), [dbc_IScreenGroupColumn](sql/360700683.sql), [dbc_IScreenPart](sql/376700740.sql)

## Grid and viewer bindings are metadata, with distinct duplicate rules

Grid setup stores expressions and edit/display flags; viewer setup stores header/detail bindings. They do not execute the data source or create database keys. Grid duplicate checks normalize NULL field names using zero, while web-screen setup preserves an existing screen name even when a different company is supplied.

1. Distinguish a UI primary-key flag from a real database constraint.
2. Check the actual duplicate predicate and data-source consumer; note that the grid helper uses GETDATE, unlike the explicit UTC calls in the other reviewed seed helpers.

Sources: [dbc_IScreenControlGridColumns](sql/328700569.sql), [dbc_IViewerTemplate](sql/504701196.sql), [dbc_IWebScreenDataHeader](sql/520701253.sql)

## Existing resource text can raise a setup error

The resource helper preserves an existing language/group/key. If a new text value compares unequal to the stored text, it raises SQL error severity 18 instead of updating the text. This matters to form wrappers that call it after earlier setup steps. System-configuration detail setup also preserves an existing key, but has no corresponding custom text-conflict check.

1. Identify language, resource group and key, then compare the source text under the database comparison rules.
2. Treat the SQL error and caller transaction separately; these helpers supply no automatic rollback for earlier wrapper effects.

Sources: [dbc_IResourceFileBase](sql/2058802742.sql), [dbc_ISystemConfigDetail](sql/488701139.sql)

## Complete routine contracts

### dbo.dbc_IMainUiTemplateFunGrpXref

Associate an existing main-UI template with a functional group.

Select every template matching TEMPLATE; insert each missing functional-group/template-object pair. An absent template produces no inserted row; existing links are preserved.

NULL and invalid inputs: NULL template matches no rows. NULL functional group does not match the duplicate predicate and violates the captured required target field. Duplicate template names can yield multiple distinct template-ID links.

Configuration: Selection is by template name and functional group only; ACTIVE is not tested.

Source: [complete body](sql/8699429.sql), lines 1–62; original definition SHA-256 `eae153bfb7c4cc56e11d57c5b8fc0f66fbc7bc08eabad0cd8e05bc1f78e741e1`.

### dbo.dbc_IMainUiWmLicenseXref

Associate screen definitions for a form with a license module.

Select all MAIN_UI_SCREEN rows for FORM_ID; insert each missing screen-object/license-module/advanced tuple. It can process several screens for one form.

NULL and invalid inputs: No matching form produces no rows; NULL form likewise matches none. Required license and advanced values are passed through without validation.

Configuration: This variant selects by FORM_ID; it does not test screen ACTIVE and does not validate license entitlement.

Source: [complete body](sql/24699486.sql), lines 1–69; original definition SHA-256 `fc090bd49f1a730e72c00504569a7cd324ac82c3464bf22c663475679e60c21b`.

### dbo.dbc_IMainUiWmLicenseXrefOriginal

Associate one screen identity with a license module.

Select MAIN_UI_SCREEN by OBJECT_ID; insert a missing screen/license-module/advanced tuple. The similar non-Original routine instead selects all screens for a form.

NULL and invalid inputs: Absent or NULL screen ID produces no rows. No license-availability or active-state validation occurs.

Configuration: Caller supplies the screen object identity; the procedure stores a mapping, not an entitlement grant.

Source: [complete body](sql/40699543.sql), lines 1–65; original definition SHA-256 `2cd646769852510c0afae971a58e4d235a39c67695ba872020ce2d6c4722aec4`.

### dbo.dbc_IProcessForm

Seed metadata and one security checkpoint for a process form.

Call dbc_IForm with a NULL table binding and caller systemDbScreen/objectIdentifier. Add title and help resources, then checkpoint 1. The formId parameter here is numeric(4), narrower than the numeric(5) helper.

NULL and invalid inputs: Required parameters can still be explicitly NULL; child routines and target constraints determine failure. No wrapper validation or recovery exists.

Configuration: String flags/resource groups are fixed opaque selectors; this wrapper passes the object identifier to FORM but creates no MAIN_UI_SCREEN record.

Source: [complete body](sql/136699885.sql), lines 1–63; original definition SHA-256 `7978d27c1bb46877447a11a48cc3a9b65e04adbe49e30596067a37b92b0ff6ac`.

### dbo.dbc_IActionMenu

Seed an action-menu definition.

Insert only if neither MENU_NAME nor DESCRIPTION already matches. The OR guard can suppress a new menu name merely because its description is already used.

NULL and invalid inputs: NULL equality does not count as an existing match; required target columns can reject NULL. Repeated calls do not update active/description fields.

Configuration: Caller active flag is stored; SYSTEM_CREATED and USER_STAMP are coded literals, not a current-user lookup.

Source: [complete body](sql/1708181481.sql), lines 1–61; original definition SHA-256 `17bb848b46a7acbeeaec6bf4190096769515c5b59ae306a1644e5fb3588fbd49`.

### dbo.dbc_IActionMenuOption

Add a sequenced action or separator to a menu.

For NULL actionName keep actionId NULL; otherwise resolve it by name. Resolve menu ID, then insert if that menu/sequence pair is absent.

NULL and invalid inputs: Missing menu leaves required ACTION_MENU_ID NULL and can fail. Missing action and an explicit NULL action both leave nullable ACTION_ID NULL. Duplicate names assign an unordered ID because no ordering is specified.

Configuration: Duplicate guard ignores action, shortcut and separator; changing supplied values does not update an existing menu/sequence.

Source: [complete body](sql/1724181538.sql), lines 1–79; original definition SHA-256 `46991e6c0429391de0ecde9d82129913f0bbf02eded38a5c9af1c98a36788afe`.

### dbo.dbc_IBatchSubmissionConfig

Seed a batch-submission record-type definition.

Insert schedule eligibility, optional description and parameter text only when RECORD_TYPE is absent. No scheduled job or batch is submitted.

NULL and invalid inputs: Description and parameter payload may be NULL; no parse, validation or execution of parameter text occurs.

Configuration: Existing record-type settings are preserved, including CAN_BE_SCHEDULED.

Source: [complete body](sql/1820181880.sql), lines 1–63; original definition SHA-256 `988e40900b2d1b9a54180504871ddda8c2bd221ef2fc0eefb3bf525b983b728e`.

### dbo.dbc_IDataRetrievalStmtHeader

Seed a data-retrieval statement header.

Insert the statement header key, description, calculation flag and external-source flag only if STMT_HEADER_KEY_NUM is absent. No query body or external source is executed.

NULL and invalid inputs: NULL required key/description/flags can fail target constraints. String defaults are opaque in the reading copy.

Configuration: Header flags are stored, not evaluated; existing keys are left unchanged.

Source: [complete body](sql/1836181937.sql), lines 1–66; original definition SHA-256 `e12c7c4810373969a8100571a99738952e57ce48fc86ec2b3caf0c991c9e5b70`.

### dbo.dbc_IDynamicAction

Seed a dynamic-action definition bound to an endpoint.

Resolve endpoint OBJECT_ID using a fixed opaque RECORD_TYPE and the caller identifier. Insert action fields only if ACTION_NAME is absent.

NULL and invalid inputs: Missing endpoint leaves required ACTION_ENDPOINT_ID NULL and can fail insertion. FORM_ID and SECURITY_CHECKPOINT are optional; no user-rights check is performed.

Configuration: ACTIVE and ALWAYS_AVAILABLE are saved; endpoint code is not invoked. Existing action names are not refreshed.

Source: [complete body](sql/1884182108.sql), lines 1–79; original definition SHA-256 `29495ad805336cb5215d0c3784ead178264d76260bf58b9d62d94c8ec12790a8`.

### dbo.dbc_IDynamicActionRule

Append a condition to a dynamic action.

Resolve ACTION_ID by action name and unconditionally insert a rule containing table, column, operator, literal-value and conjunction metadata. There is no duplicate guard.

NULL and invalid inputs: Missing action leaves required ACTION_ID NULL. Duplicate names have no defined assignment order; repeated valid calls can add duplicate logical rules.

Configuration: Rule text is stored as data, not executed or semantically validated here.

Source: [complete body](sql/1900182165.sql), lines 1–67; original definition SHA-256 `8a886bff2be381dbcd5cd5f0dd5cff6a7aacdc04d502824a0803fafde127452a`.

### dbo.dbc_IConfigForm

Seed a configuration form and its checkpoint definitions.

Create the form through dbc_IForm; add title/help resources; call checkpoint helper for IDs 1 through 6 in that order. The systemCreated input is unused.

NULL and invalid inputs: No wrapper validation, transaction or error handler exists; a child failure can leave earlier successful changes under caller/session transaction rules.

Configuration: The helper receives caller tableName and usedByGenerator plus a fixed opaque security flag; checkpoint registration does not prove effective user access.

Source: [complete body](sql/1914802229.sql), lines 1–79; original definition SHA-256 `99e03d28ccead976dfd5c1b4a408424e1e4cd279bd050c09dc43135627cf303c`.

### dbo.dbc_IDynamicCallingDetail

Seed an application endpoint description.

Insert only if RECORD_TYPE and IDENTIFIER are absent. Store local/remote code references, URI, transforms, operation and message metadata. ENDPOINT_TYPE defaults to numeric 1.

NULL and invalid inputs: Optional code/URI/transform fields default NULL. Required record-type, identifier, active and endpoint-type fields are not validated before insertion.

Configuration: The body neither connects to the URI nor loads assemblies. HTTP_HEADERS and TIME_OUT are not supplied by this procedure; omitted-column database behavior applies.

Source: [complete body](sql/1916182222.sql), lines 1–105; original definition SHA-256 `219b1136d35f6be65ef712f9a69e61e963048eb6501c2ba22a15a800b9258fcb`.

### dbo.dbc_IDynamicCallingHeader

Seed an endpoint record-type header.

Insert one header with supportedEndpointTypes only when RECORD_TYPE is absent. Existing headers remain unchanged.

NULL and invalid inputs: Required values passed as NULL can fail target constraints; the numeric endpoint-types input is not decoded or validated here.

Configuration: SYSTEM_CREATED has an opaque string default; supported endpoint types describe stored metadata, not observed service capability.

Source: [complete body](sql/1932182279.sql), lines 1–38; original definition SHA-256 `7c67574c1369ab61f419daeb06a6971a4a217929205a50909fbd63cffc6bffe1`.

### dbo.dbc_IExitPointCategory

Seed an exit-point category.

Insert category and description only when the category key is absent; stamp UTC time and coded creator fields.

NULL and invalid inputs: NULL category cannot match the guard and violates the required key. No category-name validation is implemented.

Configuration: Existing description is preserved.

Source: [complete body](sql/1946802343.sql), lines 1–33; original definition SHA-256 `9a85920dda275416b376202eaf98fc5f8eaa7d633f3aef735d46e4124fb08be2`.

### dbo.dbc_IExitPoint

Seed an exit-point definition.

Insert active flag, description, category and optional execution identifier only when EXIT_POINT is absent. This stores a hook definition without invoking it.

NULL and invalid inputs: executionIdentifier may be NULL. Required exit point/category/active fields remain subject to table constraints; category existence is not checked explicitly by the body.

Configuration: Existing exit-point settings are not updated. Runtime hook selection and category semantics need caller evidence.

Source: [complete body](sql/1948182336.sql), lines 1–64; original definition SHA-256 `5ac7064222adac54cca79e222f43c98d4bfb6ee26e6ab5cdd40a9db3700dca72`.

### dbo.dbc_IViewerForm

Seed a viewer form, resources, screen entry and security checkpoints.

Call form helper, viewer-template helper with engineType 0 and header/detail binding fields, title/help resources, checkpoints 1/21/22, main-UI screen helper, then two menu resources. The screen menuResourceKey is the mnemonic-key argument.

NULL and invalid inputs: Optional table/detail/object fields pass through. No wrapper validation or compensating rollback; a failure in a later helper can follow earlier effects.

Configuration: The screen helper receives objectIdentifier, while the FORM helper call does not. This is metadata construction, not a verified rendered viewer or access grant.

Source: [complete body](sql/1957582012.sql), lines 1–105; original definition SHA-256 `55c81ca32b702da85f40cb6194af86ed9d4dd0e14e9a0077dc690850f67bfb8f`.

### dbo.dbc_IFilterConfigDetail

Seed a named filter for a record type.

Insert optional full filter text and active/description metadata only when RECORD_TYPE plus FILTER_NAME is absent.

NULL and invalid inputs: filterStatement defaults NULL. Required key/description/active fields are passed through without explicit validation.

Configuration: The supplied filter string is stored and never executed here; existing filter text is not overwritten.

Source: [complete body](sql/1962802400.sql), lines 1–66; original definition SHA-256 `c545c437939ab220d1bdc40933557cf3be258ccb3ae1e362302fc27ae009250b`.

### dbo.dbc_IExitPointDetail

Seed one ordered parameter of an exit point.

Insert parameter name, DB type, output-direction flag and sequence only if EXIT_POINT plus SEQUENCE is absent.

NULL and invalid inputs: SEQUENCE is nullable in the target despite no declaration default; explicit NULL cannot equal an existing NULL in the guard. The captured unique exit-point/sequence index can still reject repetition.

Configuration: This records parameter metadata without binding values or invoking an exit point.

Source: [complete body](sql/1964182393.sql), lines 1–64; original definition SHA-256 `16733c1527f00541b7e21149a94616c809068ec9f8a674c4698b90ac3fb56f28`.

### dbo.dbc_IFilterConfigHeader

Seed a filter record-type definition.

Insert description, data-object path, optional join/table/value-table names and matching/order flags only if RECORD_TYPE is absent.

NULL and invalid inputs: Optional join/table/value-table fields default NULL; required DO_PATH and flags are not validated here.

Configuration: No join text or table name is executed; existing record-type settings remain unchanged.

Source: [complete body](sql/1978802457.sql), lines 1–75; original definition SHA-256 `ea88e7518c39559b9b653845d0c4a07e10d3bf553e9422a3489eb41e4bdcc78f`.

### dbo.dbc_IFeatureManagement

Insert or update a feature-management setting.

If feature name is absent, insert enabled/release/process fields with created and modified UTC times and print an opaque message. Otherwise update ENABLED, PRODUCT_RELEASE, DATE_TIME_STAMP and PROCESS_STAMP for matching names. removed is unused.

NULL and invalid inputs: No enabled-value or release validation is performed. NULL feature_name does not satisfy equality; target constraints govern the attempted insert.

Configuration: Update preserves CREATED_DATE and USER_STAMP. Storing ENABLED does not prove that every application caller consults this feature.

Source: [complete body](sql/1980182450.sql), lines 1–40; original definition SHA-256 `3ada2ff7e30b33578aeb3d98f0033112634d0fc7f31ce2212eaa2fc81cf0cf18`.

### dbo.dbc_IMetadataTransactionForm

Seed a metadata transaction form and screen registration.

Compose a form key from opaque prefix/suffix and abbreviation; add form, title/help resources and checkpoint 1. Compose a path using a fixed prefix and lowercased abbreviation; register pathType 6 with restrictions/defaults/menu flags; add two menu resources; call checkpoint 1 again and checkpoint 3.

NULL and invalid inputs: NULL abbreviation flows through string concatenation to derived form/path inputs. Child validation and constraints govern errors; no wrapper recovery exists.

Configuration: Restrictions/defaults identifiers are passed to the screen helper; their rules are not interpreted here. The repeated checkpoint-1 call is preserved, not deduplicated in this explanation.

Source: [complete body](sql/1989582126.sql), lines 1–91; original definition SHA-256 `fc26eff4a79905049ea477d8728956f598938897e8285a08f6195943228f3490`.

### dbo.dbc_IFilterStatement

Seed an ordered filter-expression term.

Insert term attributes, operand, optional value/conjunction/parenthesis counts only if RECORD_TYPE, FILTER_NAME and SEQUENCE are absent.

NULL and invalid inputs: Optional literal and grouping values may be NULL. No expression grammar, balanced-parenthesis or operand validation occurs.

Configuration: Sequence defines stored position; existing terms are preserved, and no filter execution occurs.

Source: [complete body](sql/1994802514.sql), lines 1–77; original definition SHA-256 `9b902027aa4a3a9236c0d99b9470396892cbb2a823c85e2a94c834adc78efc3e`.

### dbo.dbc_IFilterAttributes

Seed a filter-attribute definition.

Insert display flag, field type, optional record type and validation-list name only if ATTRIBUTE is absent.

NULL and invalid inputs: recordType and validationList default NULL. Required ATTRIBUTE/fieldType/displayDesc remain subject to constraints.

Configuration: The duplicate guard uses ATTRIBUTE alone, not RECORD_TYPE; the captured primary key also uses ATTRIBUTE alone.

Source: [complete body](sql/1996182507.sql), lines 1–65; original definition SHA-256 `c0526d66f440c2f9622883fc207675910e57ae6e3d594ad8fd988bcd0313a6d6`.

### dbo.dbc_IMetadataInsightForm

Seed an Insight metadata form and screen registration.

Register form, title/help resources and checkpoint 1; compose a screen path with opaque prefix plus formId text; register pathType 6 and menu flag; add two menu resource entries.

NULL and invalid inputs: NULL formId affects both child key and path derivation. Optional table/object fields pass through; no wrapper error recovery is present.

Configuration: This wrapper passes no restrictions/defaults identifiers. Source registration does not establish current Insight navigation or screen acceptance.

Source: [complete body](sql/2005582183.sql), lines 1–80; original definition SHA-256 `b30bd3743b515a9eaebc70669fcc2d5a19f81b7703b8d55d104e12e9f5ad34ff`.

### dbo.dbc_IFunctionalAreaStatusFlow

Seed one status-flow definition for a functional area.

Insert change/default-flow/mandatory flags, numeric status and optional related/system status only when FUNCTIONAL_AREA plus status is absent.

NULL and invalid inputs: relatedSts and systemSts default NULL; no transition-rule or status-range validation occurs.

Configuration: The body stores status configuration without changing transaction status or checking effective warehouse/company flow. Existing area/status rows remain unchanged.

Source: [complete body](sql/2010802571.sql), lines 1–75; original definition SHA-256 `d56675fc6aae6f512898f76fce7e642f3c3bb77416b2d16f2cd153e71f0002d6`.

### dbo.dbc_IForm

Seed the base form definition.

Insert the form key, parent/table bindings, generator/security flags and optional object/associated-form identifiers only if FORM_ID is absent.

NULL and invalid inputs: Optional objectIdentifier/associatedFormKey default NULL; explicitly NULL required fields remain subject to constraints.

Configuration: No resource, screen or user permission is created by this body itself. Existing form IDs are not updated even if other supplied fields change.

Source: [complete body](sql/2012182564.sql), lines 1–65; original definition SHA-256 `f15c3a61fedbc11b4a7b9a87f4bc96235b6d923ec0a3fa7ba2c9341fb98c233f`.

### dbo.dbc_IMetadataDetailsForm

Seed a metadata details form and screen registration.

Compose form key from fixed opaque fragments and abbreviation; add form/title/help/checkpoint 1; compose lowercased-abbreviation path; register pathType 6, menu flag, restrictions/defaults identifiers; add two menu resources.

NULL and invalid inputs: NULL abbreviation propagates into derived key/path. No wrapper validation or compensating action exists.

Configuration: Unlike the transaction wrapper, the body ends after menu-resource calls and has no extra checkpoint-1/checkpoint-3 tail.

Source: [complete body](sql/2021582240.sql), lines 1–88; original definition SHA-256 `57896a4fdb2c6da86ebd2ca991b3f416699f0bddb00a604ce49c41de15ed1283`.

### dbo.dbc_IGenericConfigDetail

Insert or replace generic configuration detail fields.

If recordType/identifier exists, update description, system flag, all five system values, eight user values, active flag and stamps; otherwise insert those fields. An omitted optional value therefore clears the matching existing field to NULL.

NULL and invalid inputs: Optional system/user values default NULL and are assigned on update. Explicit NULL key components miss the EXISTS branch and can fail required target keys on insert.

Configuration: This is a whole listed-field replacement, not an insert-only seed or partial patch. No header field-type/required/lookup validation is performed by this body.

Source: [complete body](sql/2026802628.sql), lines 1–108; original definition SHA-256 `75e13a1ce054a7b936af2b304536b2ea89aa6e93f5c72796fcde56648d5e6a26`.

### dbo.dbc_IGenericConfigHeader

Insert or replace generic configuration field definitions.

Branch on RECORD_TYPE existence. Update or insert description, system flag, all five system and eight user field definitions including names/types/lookups/required flags, then stamp the change.

NULL and invalid inputs: Optional field names/types/lookups default NULL and overwrite existing fields when omitted. Required-flag defaults are opaque strings and are also assigned during update.

Configuration: No migration or validation of stored GENERIC_CONFIG_DETAIL values is performed; changing header metadata alone does not prove existing details conform.

Source: [complete body](sql/2042802685.sql), lines 1–255; original definition SHA-256 `dee0a6ff0f721422fbbce2758a4a99e9d710b7a0880e12a58489b22bbaccc10a`.

### dbo.dbc_IGenericConfigForm

Seed a generic-configuration form and checkpoints.

Call form helper; store title under formKeyName and help under the separate helpResourceKey; register checkpoint IDs 1 through 6. systemCreated input is unused.

NULL and invalid inputs: No validation or wrapper transaction is present. Child failures and optional table binding retain child/caller semantics.

Configuration: Distinct helpResourceKey behavior differentiates this wrapper from dbc_IConfigForm. No actual screen interaction is verified.

Source: [complete body](sql/2053582354.sql), lines 1–86; original definition SHA-256 `0dd7c48236c92b42f5e24d26dbb2230e98cb031c46bdd8333fec05ae938bf154`.

### dbo.dbc_ISystemConfigHeader

Seed a system-configuration record-type header.

Insert recordType, description, system flag and stamps only when RECORD_TYPE is absent.

NULL and invalid inputs: NULL recordType misses the duplicate check and violates the required key; string system-created default remains opaque.

Configuration: This header write does not insert or change system configuration detail values.

Source: [complete body](sql/2074802799.sql), lines 1–34; original definition SHA-256 `0815e1f959b4f211857d328a276e27e3fbbeb8935152de14bb5bc254be89c051`.

### dbo.dbc_ILookupReference

Seed lookup metadata and optionally its resource text.

Insert table/field/type/warehouse/active metadata if RECORD_TYPE, TABLE_NAME and CONFIG_RECORD_TYPE match no existing row. Afterwards call the resource helper if recordTypeText is non-NULL, regardless of whether insertion was skipped.

NULL and invalid inputs: configRecordType defaults NULL, and equality against NULL cannot match an existing NULL. The absence check is therefore not NULL-safe. Optional lookup fields are stored without validating target table/column existence.

Configuration: No lookup query executes here. The resource call is independently conditional and can have effects after a no-op insert.

Source: [complete body](sql/2108182906.sql), lines 1–143; original definition SHA-256 `32d52fa56c6cc487b5566ee7dd4bc413114cd20d8edbabaa26cd2119bb341582`.

### dbo.dbc_IMainUiScreen

Seed a main-UI screen definition subject to existing screen counts.

Count rows for FORM_ID plus fixed opaque system/active selectors; when positive, replace the input active flag with another coded value. Attempt insertion only when the correlated aggregate guard does not find COUNT(*) greater than 1 for that form.

NULL and invalid inputs: No direct input validation. The guard concerns all rows for FORM_ID, not merely active rows; zero or one existing row satisfies the stated count condition. Captured uniqueness on FORM_ID plus ACTIVE separately constrains insertion.

Configuration: The intended count guard and coded flag substitution are static evidence, not a concurrency guarantee or execution acceptance. PathType defaults 1; menu visibility default is opaque. Caller restrictions/defaults identifiers are stored without interpretation.

Source: [complete body](sql/2124182963.sql), lines 1–105; original definition SHA-256 `145e298d167807d6d6364dc08e2148e0e0a41f66c2a247318bf50c80b966c318`.

### dbo.dbc_IMainUiTemplate

Seed a main-UI template definition.

Insert active/description/template metadata only if TEMPLATE is absent; preserve existing templates.

NULL and invalid inputs: NULL template does not match the guard and violates the required target column. The captured table unique key is OBJECT_ID rather than TEMPLATE.

Configuration: No template assignment or rendered screen is established by the seed.

Source: [complete body](sql/2140183020.sql), lines 1–63; original definition SHA-256 `14924a3b9238c457b8a60a9ee2baf8f30335170b3c11a993b258cb9e12f48ab0`.

### dbo.dbc_IScreenControl

Seed a named screen control within a screen group.

Insert control type, optional data source, state, action, CSS, label and template settings if CONTROL_NAME plus SCREEN_GROUP_ID is absent. No control is rendered or action executed.

NULL and invalid inputs: Optional binding/style fields default NULL; required values are not validated by this body. Existing names in the same group prevent an update even if sequence or template differs.

Configuration: Duplicate selection ignores SCREEN_GROUP_COLUMN_ID, sequence and active state; settings are metadata, not evidence of accessible behavior.

Source: [complete body](sql/264700341.sql), lines 1–100; original definition SHA-256 `2c0b9b52e11e384454139a41bef8756899648581f600ad3815b78d4c43df8341`.

### dbo.dbc_IScreenControlAttributes

Seed a control attribute and optional token fields.

Insert active/property flags, attribute value and ten token fields if SCREEN_CONTROL_ID, ATTRIBUTE_NAME and ATTRIBUTE_VALUE do not already match. A new value for an existing attribute name may add another row.

NULL and invalid inputs: Tokens default NULL. Equality is not NULL-safe for a supplied attribute value; required target fields may reject NULL. No attribute-name/value or token grammar is validated.

Configuration: Guard includes the attribute value but ignores active/property flags and tokens. Existing matching triples are preserved; no token substitution occurs here.

Source: [complete body](sql/280700398.sql), lines 1–382; original definition SHA-256 `51b19d4bf5befde5f3111431081c2f19a01cb8ea1e0850aeafef060586a7899f`.

### dbo.dbc_IScreenControlEvent

Seed a screen-control event registration.

Insert event ID/name, optional grid column and active flag if EVENT_ID plus SCREEN_CONTROL_ID is absent.

NULL and invalid inputs: gridColumn defaults NULL; other required values are passed through. Changing gridColumn or eventName does not bypass an existing event/control pair.

Configuration: Stores event metadata only; does not raise an event or invoke an event handler.

Source: [complete body](sql/296700455.sql), lines 1–67; original definition SHA-256 `22c5ae3ef180d76b7474708e902fdf9b7dae2fecd9260e24a220c8a83bf6efe8`.

### dbo.dbc_IScreenControlEventParameters

Seed one named parameter for a control event.

Insert parameter name/value and active flag if PARAMETER_NAME plus SCREEN_CONTROL_EVENT_ID is absent.

NULL and invalid inputs: Parameter value has no declaration default; explicit NULL remains subject to target constraints. No conversion to the eventual event argument type is attempted.

Configuration: Existing parameter values are preserved; registering a parameter does not execute the event.

Source: [complete body](sql/312700512.sql), lines 1–64; original definition SHA-256 `4ef69a7aa05ac95c1e4e4a2048e08eaece9934644b07576f7463f152749eaffb`.

### dbo.dbc_IScreenControlGridColumns

Seed a grid-column definition with edit and binding metadata.

Insert field, display/edit/binding/sort settings when screen-control ID, normalized FIELD, normalized FIELD_NAME and SQL_CLAUSE_TYPE have no match. FIELD and FIELD_NAME comparisons replace NULL with numeric 0 through ISNULL. Stamp with GETDATE, not GETUTCDATE.

NULL and invalid inputs: Optional FIELD_NAME is NULL by default; the ISNULL replacement converts to the expression string type, making NULL compare like zero text for this guard. Optional sequence and other metadata default NULL. No edit or field-expression validation occurs.

Configuration: Duplicate guard ignores sequence, flags and width. IS_PRIMARY_KEY is stored UI metadata; it creates no database key. Server local-time semantics of GETDATE must not be silently relabeled as explicit UTC.

Source: [complete body](sql/328700569.sql), lines 1–105; original definition SHA-256 `d90d598f82a1711875f29ed12b00ebc6d4dbc65d2e8eb6dd0a8a64288839a37d`.

### dbo.dbc_IScreenGroup

Seed a named screen group within a screen part.

Insert type, nesting, sequence, style, fixed-position and content-loading settings if GROUP_NAME plus SCREEN_PART_ID is absent. contentLoadingType defaults to numeric 0.

NULL and invalid inputs: parentGroupId and styling/action/resource inputs default NULL. No hierarchy-cycle, group-type or loading-mode validation is performed.

Configuration: Stored parent/nesting metadata does not prove runtime loading order or UI interaction.

Source: [complete body](sql/344700626.sql), lines 1–98; original definition SHA-256 `dd166291fed3530fdf2d8a94793d34d77117385deec6a0f7f794ee363c07fd2c`.

### dbo.dbc_IScreenGroupColumn

Seed a layout column within a screen group.

Insert column name, optional CSS and sequence when COLUMN_NAME plus SCREEN_GROUP_ID is absent.

NULL and invalid inputs: columnCssClass defaults NULL; required parent/name/sequence input errors are left to target constraints.

Configuration: Existing column name/group pairs preserve earlier CSS and sequence; no rendered layout is established.

Source: [complete body](sql/360700683.sql), lines 1–63; original definition SHA-256 `ca1f0b22784dd639daa31f41ca03a7e3871d57c2b7d007ae4e48437a9acb1771`.

### dbo.dbc_IScreenPart

Seed a named part within a screen.

Insert part type, sequence, active/partial-view flags and optional style/action/resource metadata if PART_NAME plus SCREEN_ID is absent.

NULL and invalid inputs: Style/action/resource inputs default NULL; partialView has an opaque coded default. No validation of UI part types or action names occurs.

Configuration: Existing part/screen pairs are preserved; source metadata does not verify the actual current screen composition.

Source: [complete body](sql/376700740.sql), lines 1–84; original definition SHA-256 `de9b51d9653629b83502b79bb5875f6127573a20178455132d5c9737891e354f`.

### dbo.dbc_IViewerTemplate

Seed viewer header/detail data bindings for a form.

Insert engine type, header data source and optional detail/header link fields if FORM_ID is absent.

NULL and invalid inputs: detailDataSource/detailField/headerField default NULL. No query, database-object existence or relationship validation is performed.

Configuration: The viewer-form wrapper passes engineType 0. Existing form bindings are not updated and no viewer query is run.

Source: [complete body](sql/504701196.sql), lines 1–69; original definition SHA-256 `9019a95068042bd4f03a312dea77f58f86ad20522cf8776fd79f55529b1baae0`.

### dbo.dbc_IWebScreenDataHeader

Seed a web-screen header and its code/binding metadata.

Insert company, screen type, parent, URL, code/method references and maxNumFields if SCREEN_NAME is absent. maxNumFields defaults 0.

NULL and invalid inputs: company, parentScreen and urlToCall default NULL; opaque code-reference defaults are not reconstructed. No URL or code reference is invoked.

Configuration: The duplicate guard uses SCREEN_NAME alone, not COMPANY; supplying another company does not create a second same-named header through this routine.

Source: [complete body](sql/520701253.sql), lines 1–85; original definition SHA-256 `5a5b7a2ce8ddf2966965bb9f359632196cec1f0a765e366bb30da1424bc0bd7d`.

### dbo.dbc_IResourceFileBase

Seed base resource text and report conflicting existing text.

Insert a missing language/group/key. If no row is inserted, read existing text/process stamp; when supplied text compares unequal, build an error and RAISERROR at severity 18/state 1. Existing text is never updated.

NULL and invalid inputs: fieldLength and decimalPos default 0; language default is opaque. A NULL text comparison is UNKNOWN and does not enter the inequality branch. Error text concatenation also depends on nullable components; no sanitized operational message is asserted.

Configuration: Comparison follows SQL collation. Repeating an existing key with equal text preserves previous field lengths, decimals and stamps; no language fallback is selected.

Source: [complete body](sql/2058802742.sql), lines 1–69; original definition SHA-256 `ecd1996aac6ef6e26d02ab4eea1c5b30505c00741fb7f1f2d84e63270c744580`.

### dbo.dbc_ISystemConfigDetail

Seed one system configuration value.

Insert key, record type, description, supplied value, optional lookup and value-required flag only when SYS_KEY plus RECORD_TYPE is absent.

NULL and invalid inputs: lookupKey defaults NULL; no validation that systemValue satisfies lookup/valueRequired metadata is performed by this body.

Configuration: Existing values are not overwritten; this static review reads no actual polymorphic SYSTEM_VALUE contents.

Source: [complete body](sql/488701139.sql), lines 1–49; original definition SHA-256 `a00293e9faf58207fcaac574c11ae6683fb6a72f6b8822770cc04c1eb9c68596`.

## Table roles

- [dbo.DATA_RETRIEVAL_STMT_HEADER](objects/342292279.md): Store retrieval-header identity and calculation/external-source flags. STMT_HEADER_KEY_NUM is the primary key; the seed writes header flags but neither query text nor executes a retrieval.
- [dbo.DYNAMIC_ACTION](objects/1270295585.md): Store named actions and their endpoint/security metadata. OBJECT_ID is the primary key; ACTION_NAME is required but has no captured unique index. ACTION_ENDPOINT_ID is required; optional FORM_ID and SECURITY_CHECKPOINT do not prove user authorization.
- [dbo.DYNAMIC_ACTION_RULE](objects/1302295699.md): Store conditions associated with dynamic actions. OBJECT_ID is the primary key; ACTION_ID is required and indexed. Table/column/operator/value/conjunction fields are metadata; the reviewed seed unconditionally appends rows.
- [dbo.DYNAMIC_CALLING_DETAIL](objects/1334295813.md): Store endpoint binding and transport metadata. OBJECT_ID is the primary key, with an additional unique RECORD_TYPE+IDENTIFIER key. URI and code/transform fields are nullable; ENDPOINT_TYPE and TIME_OUT are required. The seed does not populate HTTP_HEADERS/TIME_OUT or invoke the endpoint.
- [dbo.DYNAMIC_CALLING_HEADER](objects/1366295927.md): Define dynamic-calling record types and supported endpoint categories. RECORD_TYPE is the primary key; SUPPORTED_ENDPOINT_TYPES is required. The seed preserves existing headers and does not test endpoint availability.
- [dbo.EXIT_POINT](objects/1494296383.md): Store named exit-point hooks and their category/binding. EXIT_POINT is the primary key; category and ACTIVE are required, EXECUTION_IDENTIFIER nullable. Registration does not execute a hook.
- [dbo.EXIT_POINT_CATEGORY](objects/1526296497.md): Define categories for exit-point metadata. EXIT_POINT_CATEGORY is the primary key; description and system flag are required. The reviewed seed inserts absent categories only.
- [dbo.ACTION_MENU](objects/1533248517.md): Store action-menu identity and presentation settings. OBJECT_ID is the only captured unique key. The seed guard suppresses matches on either MENU_NAME or DESCRIPTION, although neither has its own unique index.
- [dbo.EXIT_POINT_DETAIL](objects/1558296611.md): Store ordered exit-point parameter definitions. OBJECT_ID is the primary key; EXIT_POINT+SEQUENCE has a unique index. SEQUENCE is nullable while parameter, type and direction are required; NULL equality in the seed is not NULL-safe duplicate detection.
- [dbo.ACTION_MENU_OPTION](objects/1565248631.md): Store ordered menu actions and separators. OBJECT_ID is the only unique key. ACTION_MENU_ID and SEQUENCE are required but their pair lacks a captured unique index; ACTION_ID is nullable for a separator or unresolved action lookup.
- [dbo.FILTER_ATTRIBUTES](objects/1622296839.md): Define filterable attributes and validation metadata. ATTRIBUTE alone is the primary key; RECORD_TYPE and VALIDATION_LIST are nullable. The seed cannot create a separate same-named attribute merely by supplying another record type.
- [dbo.FILTER_CONFIG_DETAIL](objects/1654296953.md): Store named filter definitions for record types. OBJECT_ID is the primary key and RECORD_TYPE+FILTER_NAME is separately unique. FILTER_STATEMENT may be NULL. The reviewed seed stores optional filter text without executing it.
- [dbo.SYSTEM_CONFIG_HEADER](objects/1675869037.md): Define system-configuration record-type headers. RECORD_TYPE is the primary key; the seed creates only the header and leaves actual detail values to other behavior.
- [dbo.MAIN_UI_SCREEN](objects/1682821057.md): Store screen binding, routing and menu metadata. OBJECT_ID is the primary key, with unique FORM_ID+ACTIVE and a foreign key to FORM. PATH and object/restriction/default identifiers are nullable. Procedure count checks do not replace uniqueness and do not establish a rendered or authorized screen.
- [dbo.FILTER_CONFIG_HEADER](objects/1686297067.md): Define filter record types and expression-building metadata. RECORD_TYPE is the primary key; DO_PATH and matching/order flags are required. JOIN_CLAUSE, TABLE_DO_NAME and VALUE_TABLE_NAME are nullable; seed writes these as metadata.
- [dbo.MAIN_UI_TEMP_FUN_GRP_XREF](objects/1730821228.md): Associate UI templates with functional groups. OBJECT_ID is the only unique key; MAIN_UI_TEMPLATE_ID and FUNCTIONAL_GROUP are required. The seed joins by template name and avoids existing pairs, but that logical pair is not backed by a captured unique index.
- [dbo.MAIN_UI_TEMPLATE](objects/1762821342.md): Store named main-UI templates. OBJECT_ID is the only captured unique key; TEMPLATE is required without a captured unique name index. The seed uses a name-based existence guard, so concurrency cannot be inferred safe from that guard.
- [dbo.FILTER_STATEMENT](objects/1782297409.md): Store ordered terms in named filter expressions. The primary key is RECORD_TYPE+FILTER_NAME+SEQUENCE. Operand/attribute are required while literal, conjunction and parenthesis counts are nullable; the seed does not validate expression grammar.
- [dbo.MAIN_UI_WM_LICENSE_XREF](objects/1794821456.md): Associate screen identities with license-module metadata. OBJECT_ID is the primary key; screen/license/advanced fields are required, without a unique index on their combined logical tuple. These stored links do not establish license entitlement.
- [dbo.GENERIC_CONFIG_HEADER](objects/2070298435.md): Define generic-configuration field names, types, lookups and required flags. RECORD_TYPE is the primary key. Five system and eight user field groups have nullable name/type/lookup columns and required flags. The reviewed procedure replaces all listed groups on update without validating existing detail values.
- [dbo.SCREEN_CONTROL_EVENT](objects/107863451.md): Store control-event registrations and optional grid-column context. The seed uses EVENT_ID+SCREEN_CONTROL_ID to preserve existing registrations, regardless of changed event name or grid-column input. Registration itself triggers no event.
- [dbo.SCREEN_CONTROL_EVENT_PARAMETERS](objects/139863565.md): Store named values for registered screen-control events. The seed preserves existing PARAMETER_NAME+SCREEN_CONTROL_EVENT_ID pairs; parameter values remain metadata, not verified typed event arguments.
- [dbo.SCREEN_CONTROL_GRID_COLUMNS](objects/171863679.md): Store grid-column expressions and edit/display/binding settings. The seed compares control, field, field name and clause type, normalizing NULL field values with ISNULL. Stored primary-key/edit flags are presentation metadata and create no database constraint.
- [dbo.SCREEN_GROUP_COLUMN](objects/235863907.md): Store layout columns for screen groups. The seed inserts absent group/name pairs and preserves existing CSS and sequence. The table records layout metadata, not rendered or accessibility acceptance.
- [dbo.SCREEN_PART](objects/267864021.md): Store screen parts and their sequence/type metadata. The seed inserts absent screen/name pairs without executing the stored default action. Parent references and nullable presentation fields require separate runtime interpretation.
- [dbo.VIEWER_TEMPLATE](objects/536388980.md): Store viewer data-source and linking-field definitions. FORM_ID controls the seed duplicate guard. Header/detail data-source names are metadata; the helper neither executes queries nor validates that names resolve.
- [dbo.WEB_SCREEN_DATA_HEADER](objects/1096390975.md): Store web-screen type, code and data-header metadata. The seed duplicate guard uses SCREEN_NAME alone while COMPANY can be NULL; stored URL/code/method references are not invoked.

## Execution and evidence limits

Every reviewed body lacks an explicit transaction, TRY/CATCH or compensating rollback. Caller/session rules govern commit, rollback and partial completion; child routines can contribute their own behavior. Existence checks and name lookups have no explicit serialization. Target keys and foreign keys remain independent constraints. No retained DML trigger is attached to the direct target tables in this batch.

Checkpoint registration is not proof of current user rights. Endpoint metadata is not network execution. Filter text is not a validated query. Object-name prefixes establish neither vendor nor custom ownership. Current UI paths, effective settings, service activation, runtime and intended-user accessibility acceptance require their own evidence.

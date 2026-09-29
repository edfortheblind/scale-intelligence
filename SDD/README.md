# SDD — SCALE solution design and supporting documents

This folder preserves the solution design documents, configuration guides, and functional training material supplied by the owner for the future **SCALE Intelligence** application. Its purpose is to help users understand how SCALE works: what a process does, how configuration affects it, how its steps connect, and where to find the supporting explanation.

These documents add implementation context to [AIM](../AIM/README.md), extension and integration context to [SDK](../SDK/README.md), and business meaning to the [database architecture assessment](../DB%20Architecture/). Together, these sources can connect a user's question to documented functionality, configuration concepts, and relevant database objects.

## Current state

The owner supplied nine source files. This README records their intended use and the method for assessing them. Document bodies have **not yet been reviewed, extracted, indexed, or validated for the application** as part of this intake. Versions and dates listed below come from filenames and require confirmation against each document.

The existing AIM/SDK collection remains [closed with owner-accepted exceptions](../_project/COLLECTION_CLOSURE.md). Adding SDD material does not reopen that acquisition or change its fidelity measurements. The consultation application remains a separate implementation phase.

## Source inventory

| Supplied document | Intended use to assess | Filename version / date |
| --- | --- | --- |
| [Covetrus implementation SDD](<Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final)(2).docx>) | SCALE implementation decisions and process examples | v1.4 / 2023-08-31 |
| [Grupo Julio implementation SDD](<Grupo Julio - Manhattan Active SCALE Implementation Solution Design Document - v1.5 - Final - 2024-09-03.pdf>) | SCALE implementation decisions and process examples | v1.5 / 2024-09-03 |
| [J Knipper implementation SDD](<J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final).pdf>) | SCALE implementation decisions and process examples | v1.3 / 2024-12-10 |
| [LAND MAWM SDD](<LAND MAWM Solution Design Document v2.11.docx>) | Product-specific comparison material; applicability to SCALE requires review | v2.11 / date unspecified |
| [LAND MAWM SDD — second supplied copy](<LAND MAWM Solution Design Document v2.11 (1).docx>) | Same bytes as the preceding file; retain supplied copy and avoid duplicate indexing | v2.11 / date unspecified |
| [Insight Architect configuration](<MA Documentation - Insight Architect Configuration.pdf>) | Screen configuration and metadata concepts | Unspecified |
| [Manhattan SCALE labels](<Manhattan SCALE - Labels.pptx>) | Label concepts and supporting illustrations | Unspecified |
| [HADDAD configuration walkthrough](<SCALE Configuration Walkthrough - HADDAD.docx>) | Configuration sequence and implementation examples | Unspecified |
| [SCALE work and picking functionality](<SCALE Work and Picking Functionality.docx>) | Work execution and picking explanations | Unspecified |

The two LAND files were verified as byte-identical on 2026-09-29: each is 19,727,099 bytes, with SHA-256 `de62bfaf88f5d35b6c7e4a9719a1d5102eaa8b9fe317919912c25f6f6db8193f`. Both originals remain in place. Their filenames identify MAWM; retain that product distinction until review establishes which concepts, if any, apply to SCALE.

## AEKR working method

Apply AEKR as an evidence and review method. This folder does not install an AEKR runtime or contain its private governance material. The owner's current instructions define scope; final acceptance remains with the owner.

1. **Preserve the supplied originals.** Record filename, format, byte length, SHA-256, product, version, document date, and provenance before creating derived content. Keep extracted text, reading copies, authored explanations, and source files distinguishable.
2. **Read for process meaning.** Identify the user goal, roles, entry point, prerequisites, configuration dependencies, process steps, status changes, outputs, exceptions, and integration points. Preserve qualifications, diagrams, tables, and relevant context.
3. **Separate kinds of evidence.** Label vendor functionality, a particular implementation's choices, examples, observed replica metadata, and analyst inferences. A design decision in one implementation does not establish the configuration of the assessed SCALE environment.
4. **Reconcile claims.** Compare relevant claims with AIM, SDK, and the database assessment. Record differences in product, version, terminology, or behavior as explicit questions or contradictions; do not silently select one account.
5. **Verify each derived artifact.** Check extraction fidelity, table and diagram meaning, source locations, links, and the support for every authored claim. A coordinator reviews delegated results; author self-review is not described as independent audit.
6. **Keep acceptance explicit.** Distinguish source intake, technical verification, suitability for user explanations, and owner acceptance. Record limitations where evidence cannot support a conclusion.

Use the existing [data architecture](../_project/DATA_ARCHITECTURE.md) as the common design reference. Reuse its separation of originals, structured documents, reading copies, and rebuildable search indexes. New SDD records should preserve their own provenance and must not overwrite AIM/SDK records or inherit their verification status.

## How this material should serve SCALE Intelligence

The intended explanation path is:

**User question → functional process → documented configuration and behavior → relevant AIM/SDK references → matching database objects → cited answer.**

For example, a question about picking should link to the relevant work and picking documentation, the corresponding AIM process, any applicable SDK extension contract, and database objects actually found in the assessed replica. Missing links remain visible rather than being filled with assumed behavior.

Each useful process explanation should capture:

- The question it answers, intended user, functional domain, and product/version scope.
- Its trigger, prerequisites, ordered steps, configuration influences, and expected outcome.
- Error, retry, exception, and status behavior when supported by the source.
- Related screens, terms, SDK entry points, and database objects, with the basis for each match.
- Exact source citations, evidence status, unresolved questions, and review state.

SDD citations should identify the source file and SHA-256 plus a verified section, page, slide, table, or figure. DOCX page numbers depend on rendering, so section and structural locations should accompany any rendered-page citation. AIM/SDK links should retain their existing resource ID, original SHA-256, and content node ID.

Documented process flow, static database logic, and measured runtime are separate evidence. These files may describe how a process is intended to execute; actual execution duration, frequency, active configuration, and deployment-specific behavior require appropriate operational evidence. Schema metadata alone cannot establish all of those facts.

## Boundaries and acceptance criteria

The source documents may describe named implementations. Derived user-facing explanations should carry only the implementation detail needed for the question and permitted audience. Preserve source notices and attribution. Placement in this folder does not authorize public redistribution, operational execution, or use of one implementation's details as a universal SCALE rule.

SDD intake is ready for application indexing when the declared source set has a provenance inventory, verified extraction or explicit exceptions, stable citations, duplicate handling, product/version labels, reviewed mappings, and an accepted suitability decision. Completeness should use the supplied inventory as its denominator; missing or unreadable material remains recorded.

Until those checks are completed, this folder is a **supporting source collection with a documented intake method**. No SDD-derived explanation is marked verified solely because its original file is present.

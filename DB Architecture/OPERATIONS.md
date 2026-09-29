# Collection, rebuilding and verification

The tools use installed Python 3.14, pyodbc 5.3.0 and Microsoft ODBC Driver 18 for SQL Server. The collector has a fixed SELECT catalog, TLS certificate verification, 20-second connect timeout, 45-second command timeout and a five-second lock wait. It never executes supplied SQL or a documented procedure. Two SET statements change only its own session lock timeout/deadlock priority.

```powershell
python tools\assess_db.py
python tools\build_db_docs.py "$env:LOCALAPPDATA\TAB\SCALE-Intelligence\private\db-assessment\20260929T214106Z"
python -m unittest discover -s tests -p test_db_assessment.py -v
python tools\verify_db_docs.py
```

The first command creates a new private timestamped snapshot; substitute its actual directory when building a new generation. Default credential input is `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/credentials/replica.connection.txt`, relocated from the root under the owner's explicit instruction and protected by a verified current-user-only ACL. An alternate authorized private file can be supplied with `--connection-file <private-path>`; never put credentials themselves in command arguments. Collection accepts only the supported ADO.NET SQL-password format and converts it in memory to ODBC with escaped values. The supplied input's ReadWrite intent is overridden to ReadOnly; its bytes were preserved during relocation.

Raw output is confined to `%LOCALAPPDATA%/TAB/SCALE-Intelligence/private/db-assessment/`. The default private directory inherits local Windows account permissions; this workflow does not claim a new ACL or encryption policy. Raw definitions may contain sensitive comments/literals. Keep that directory out of Git, OneDrive and general app retrieval.

An exclusive `collector.lock` prevents cooperating simultaneous collectors. If interrupted, verify that the assessment process has ended before removing only that stale lock; use a recorded PID when present, and do not assume an empty lock is stale. No automatic stale-lock takeover occurs. A failed metadata SELECT is recorded as unavailable with a SQLSTATE/native code; error text, endpoints and account values are not logged. `--only` can repeat named fixed query classes in the same private snapshot after a concrete compatibility fix; failed classes cannot reuse stale prior rows during derivation.

The builder fails on a different existing snapshot or stale object/module/catalog outputs. For a new snapshot, prepare a separate clean checkout and replace the previous generated catalog/object/SQL/domain/process outputs and indexes within that checkout. Preserve authored guides, the prior accepted generation, curated `functional-roles.json`, `help-topics.json`, `functional-coverage.json` and configuration observations separately before replacing generated mappings/evidence. Curated records bind snapshot/source identities: revalidate and deliberately migrate them before joining them to a new generation. Never delete all mappings/evidence on the assumption that they are generated structural files. A future transactional refresh implementation can replace this manual boundary when repeated collection is required.

Source definitions are hashed as UTF-8 text returned by the driver. They are not database backup/DACPAC byte identities. Repository derivatives omit SQL string literals and comments, plus external server/synonym target metadata. Definitions therefore cannot be used to restore or execute the original routines. Business constants, dynamic SQL text, quoted result aliases and default values require private source review before precise semantic publication.

The verifier checks dataset/record counts, per-definition hashes, citation IDs/nodes/original hashes, local links and accidental credential-value exposure without printing credential contents. It records a closed inventory of DB outputs and related changed tools/tests, not a hash of the unrelated AIM/SDK repository. Independent audit and owner acceptance are separate states.

No commit, push, database mutation, monitoring enablement, app deployment, benchmark workload or OneDrive upload verification is part of these commands.
## Functional-help extension

The metadata-only capture remains reproducible independently of the functional-help extension. Curated [help topics](HELP_TOPICS.md), [object roles](FUNCTIONAL_ROLES.md) and the [functional report](SCALE_FUNCTIONAL_REPORT.md) are reviewed interpretation layers; do not overwrite them with name-based domain candidates during a future schema refresh.

The owner separately approved [bounded configuration validation](CONFIGURATION_VALIDATION.md). Its command is `python tools/check_scale_configuration.py --execute-reviewed-allowlist`; it uses the same protected credential input and collector lock, five fixed configuration SELECTs and aggregate-only outputs. It does not change `assess_db.py`'s metadata-only contract. Current results are timestamped replica observations and must not be relabeled as present-tense effective settings after they become stale.

Run the targeted checks with `python -m unittest discover -s tests -p test_scale_configuration.py -v`. The artifact verifier also checks reviewed help/role/configuration evidence. Neither validation executes application procedures or performs end-user app acceptance.

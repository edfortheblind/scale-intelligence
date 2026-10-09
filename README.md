# SCALE Intelligence

A knowledge base for understanding SCALE warehouse processes, configuring common workflows and explaining unexpected results.

## Read the knowledge base

Start the local application from this folder:

```powershell
python tools/serve_help.py --port 8765
```

Open [SCALE Knowledge](http://127.0.0.1:8765). Search by process, screen or setting, or browse the warehouse processes. Each article presents its explanation first, with supporting documentation and technical detail available on demand.

The **Configure SCALE** section covers work profiles, packing preferences, printers and closing documents, receiving preferences, returns status, packing classes and criteria, and container eligibility. Procedures use documented screen and field names. Available controls and effective settings depend on the installation.

**Detailed procedure guides** opens the Warehouse Mobile/RF and Cross Application manuals inside the application. Search results include matching guide sections alongside the existing articles. Each manual has a contents list, task steps, source citations and explicit limits; recorded screen observations remain distinct from documented procedures.

**TAB design reference** provides a separate search and browsing path for 12 reconciled answers and 69 reviewed claims from the official Travis and TRAV3PL designs. Results retain dated design scope, unresolved decisions and exact source citations; the owner's dated purchase-order clarification is identified separately.

## Reference library

- [Warehouse Mobile / RF operator guide](SDD/RF/README.md): task-by-task receiving, inventory, work, shipping and support procedures, with all 45 retained base flows mapped.
- [Cross Application screens](SDD/RF/CROSS_APPLICATION.md): document, interface-error and history investigation, plus live navigation observations.
- [All functionality articles](DB%20Architecture/HELP_TOPICS.md): a reading copy of the application articles.
- [TAB core design reference](SDD/TAB_DESIGN_REFERENCE.md): official TAB source interpretation, qualifications and cross-source reconciliation.
- [SCALE Functionality Reference](SDD/SCALE_FUNCTIONAL_REFERENCE.md): processes, configuration choices and dependencies across 14 chapters.
- [Printable functionality reference](output/pdf/SCALE%20Functionality%20Reference%20SDD.pdf).
- [AIM documentation](AIM/README.md): application documentation and preserved sources.
- [SDK documentation](SDK/README.md): development reference and preserved sources.
- [Database architecture](DB%20Architecture/README.md): captured structure and technical analysis.

The application reads the retained library and has no connection to warehouse operations. Documentation and captured source code explain behavior; they do not establish a particular warehouse's active settings.

## Maintaining this project

[Open issues and owner decisions](OPEN_ISSUES.md) is the current section-by-section review register, with detailed context, evidence and decision fields. [Historical runtime identities](DB%20Architecture/HISTORICAL_RUNTIME_IDENTITIES.md) documents all 163 retained IDs and closes that documentation task.

[Application maintenance](help_app/README.md) covers article authoring, source bindings and validation. [Project status](PROJECT_STATUS.md) records current results and limitations; [resume instructions](_project/RESUME.md) and the [master continuation prompt](03_SCALE_INTELLIGENCE_MASTER_PROMPT.md) govern engineering work. [Authorization](_project/AUTHORIZATION.md) records the internal documentation scope.

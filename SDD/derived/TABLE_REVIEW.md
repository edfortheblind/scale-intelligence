# Reviewed logical PDF tables

These are human-reviewed source overlays. Raw extracted grids remain unchanged in document JSON. Captions, split-page continuity and blank cells were checked against private page renders. All rows describe a named implementation; no live database meaning is established.

76 logical tables. Candidate disposition and unreviewed IDs are in [reviewed-tables.json](reviewed-tables.json).

## Knipper replenishment location characteristics

Two-page table joined; source bullet lists normalized to named columns. Candidate p057-t002 fragments header/rows; p057-t003 is a spurious text fragment inside its first row. Zone spelling retained with line wraps removed and dash normalized.

[sdd-1c25f20de1eafc3e p057-t002, p058-t002](reading/sdd-1c25f20de1eafc3e.md#p057-t002)

| Number | Zone | Assignment | License plate tracking | Item/lot | Allocate in transit |
| --- | --- | --- | --- | --- | --- |
| 1 | PM Locations (KMW, KDC and OHW) - EA Pick | Permanent | No | Single item; single lot | Y |
| 2 | PM Locations (KMW, KDC and OHW) - CS Pick | Permanent | No | Single item; single lot | Y |
| 3 | PTL Locations (KMW, KDC and OHW) - EA Pick | Permanent | No | Single item; single lot | Y |
| 4 | PTL Locations (KMW, KDC and OHW) - CS Pick | Permanent | No | Single item; single lot | Y |
| 5 | 3PL PM Locations - EA and CS | Permanent | No | Single item; single lot | Y |
| 6 | 3PL Case Pick Locations | Permanent | No | Single item; single lot | Y |
| 7 | DEA PM Locations (KMW, KDC and OHW) | Dynamic | Yes | Single item; single lot | Y |
| 8 | DTP Refrigerated PM (KMW, KDC and OHW) | Dynamic | Yes | Single item; single lot | Y |
| 9 | DTP Freezer PM (KMW, KDC and OHW) | Dynamic | Yes | Single item; single lot | Y |

## Knipper Lot tracked replenishment - CS

Artificial blank/None columns removed after visual review; duplicate General/DEA fragments from comment markup omitted. Four distinct source tables retained, including disagreement with page57 prose.

[sdd-1c25f20de1eafc3e p058-t003](reading/sdd-1c25f20de1eafc3e.md#p058-t003)

| Sequence | Strategy | Location Selection | Eligible UMs |
| --- | --- | --- | --- |
| 10 | First Expiration, First Out | Reserve (General, DEA, Refrigerated, Freezer and 3PL) | CS |

## Knipper Lot tracked replenishment - PL

Artificial blank/None columns removed after visual review; duplicate General/DEA fragments from comment markup omitted. Four distinct source tables retained, including disagreement with page57 prose.

[sdd-1c25f20de1eafc3e p058-t004](reading/sdd-1c25f20de1eafc3e.md#p058-t004)

| Sequence | Strategy | Location Selection | Eligible UMs |
| --- | --- | --- | --- |
| 10 | First Expiration, First Out | Reserve (General, DEA, Refrigerated, Freezer and 3PL) | PL |

## Knipper Non lot tracked replenishment - CS

Artificial blank/None columns removed after visual review; duplicate General/DEA fragments from comment markup omitted. Four distinct source tables retained, including disagreement with page57 prose.

[sdd-1c25f20de1eafc3e p058-t005](reading/sdd-1c25f20de1eafc3e.md#p058-t005)

| Sequence | Strategy | Location Selection | Eligible UMs |
| --- | --- | --- | --- |
| 10 | First In, First Out | Reserve (General, DEA, Refrigerated, Freezer and 3PL) | CS |

## Knipper Non lot tracked replenishment - PL

Artificial blank/None columns removed after visual review; duplicate General/DEA fragments from comment markup omitted. Four distinct source tables retained, including disagreement with page57 prose.

[sdd-1c25f20de1eafc3e p058-t006](reading/sdd-1c25f20de1eafc3e.md#p058-t006)

| Sequence | Strategy | Location Selection | Eligible UMs |
| --- | --- | --- | --- |
| 10 | First In, First Out | Reserve (General, DEA, Refrigerated, Freezer and 3PL) | PL |

## Knipper standard wave-flow template

Two physical-page fragments joined; continuation has no repeated header. The source calls this a standard template for multiple existing flows, not the sole wave flow.

[sdd-1c25f20de1eafc3e p070-t002, p071-t002](reading/sdd-1c25f20de1eafc3e.md#p070-t002)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Override Data: Set Default Status Flow |
| 30 | Override Data: Set Allocate Complete Flag |
| 32 | Override Data: Set Packing Class |
| 34 | RTS Address Verification |
| 40 | Allocation |
| 42 | DT Location Assignment |
| 43 | DTP Wave Splitting |
| 50 | Container Creation |
| 60 | Routing |
| 70 | Pallet Building |
| 80 | VAS Assignment |
| 90 | QC Assignment |
| 100 | Dock Assignment |
| 110 | Load Building |
| 120 | Work Creation Shipping Container |
| 130 | Paperwork – Labels |
| 999 | Override Data: Check for No Work |
| 1000 | Complete Wave |

## Knipper Parcel status flow

Spurious blank columns removed; title and column-header rows separated. Status codes are design configuration, not a universal status enum.

[sdd-1c25f20de1eafc3e p076-t002](reading/sdd-1c25f20de1eafc3e.md#p076-t002)

| Status | Status Name |
| --- | --- |
| 100 | In Pool |
| 200 | Wave Pending |
| 201 | In Wave |
| 300 | Picking Pending |
| 301 | In Picking |
| 401 | In Packing |
| 700 | Ship Confirm Pending |
| 800 | Load Confirm Pending |
| 900 | Closed |

## Knipper Non Parcel / LTL status flow

Spurious blank columns removed; title and column-header rows separated. Status codes are design configuration, not a universal status enum.

[sdd-1c25f20de1eafc3e p076-t003](reading/sdd-1c25f20de1eafc3e.md#p076-t003)

| Status | Status Name |
| --- | --- |
| 100 | In Pool |
| 200 | Wave Pending |
| 201 | In Wave |
| 300 | Picking Pending |
| 301 | In Picking |
| 401 | In Packing |
| 650 | Loading Pending |
| 700 | Ship Confirm Pending |
| 800 | Load Confirm Pending |
| 900 | Closed |

## Grupo Julio disposition to inventory status

Spurious blank columns removed. Cuarentena inventory status remains the actual empty string; no Held/quarantine status inferred.

[sdd-d50ca4a96095c930 p036-t001](reading/sdd-d50ca4a96095c930.md#p036-t001)

| Disp Code | Inventory Status |
| --- | --- |
| Cuarentena |  |
| Defectuoso | Defectuoso |
| Disponible | Disponible |
| VAS | VAS |

## Grupo Julio reason to disposition

Spurious blank columns removed. Cuarentena inventory status remains the actual empty string; no Held/quarantine status inferred.

[sdd-d50ca4a96095c930 p036-t002](reading/sdd-d50ca4a96095c930.md#p036-t002)

| Reason Code | Disposition Code |
| --- | --- |
| Compostura Alta | Cuarentena |
| Compostura Baja | Cuarentena |
| Compostura Media | Cuarentena |
| Disponible | Disponible |
| Etiquetado | VAS |
| Monarch | VAS |
| Revision | VAS |
| Seleccion | VAS |

## Ola Tiendas y Clientes

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p054-t001, p055-t001](reading/sdd-d50ca4a96095c930.md#p054-t001)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 30 | Set Custom Status Flow |
| 33 | Set Online in PTS |
| 39 | Shipment Distribution Before |
| 40 | Shipment Distribution |
| 46 | Set Consolidation To SH |
| 47 | Set Route |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 95 | Container Creation |
| 96 | Container Creation Statistics |
| 98 | Work Creation Shipping Containers |
| 110 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 125 | Paperwork – Labels |
| 140 | Complete Wave |

## Ola Flujo Don y Des

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p055-t002](reading/sdd-d50ca4a96095c930.md#p055-t002)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 22 | Override: Remove Store Distribution |
| 25 | Set Eligible to NULL |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 100 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola Flujo Express

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p055-t003](reading/sdd-d50ca4a96095c930.md#p055-t003)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 30 | Set Custom Status Flow |
| 40 | Set Eligible to NULL |
| 50 | Set Online in PTS |
| 60 | Shipment Distribution Before |
| 70 | Shipment Distribution |
| 80 | Set Consolidation To SH |
| 90 | Set Route |
| 100 | Rule Assignment |
| 110 | Allocation |
| 120 | Allocation Statistics |
| 130 | Container Creation |
| 140 | Container Creation Statistics |
| 150 | Work Creation Shipping Containers |
| 160 | Work Creation Allocation Requests |
| 170 | Labor Plan Execution |
| 180 | Paperwork - Labels |
| 190 | Complete Wave |

## Ola Flujo Insumos

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p055-t004, p056-t001](reading/sdd-d50ca4a96095c930.md#p055-t004)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 22 | Override: Remove Store Distribution |
| 25 | Set Eligible to NULL |
| 26 | Rem Consolidation Allowed |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 100 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola Flujo Muestras

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p056-t002](reading/sdd-d50ca4a96095c930.md#p056-t002)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 22 | Override: Remove Store Distribution |
| 25 | Set Eligible to NULL |
| 26 | Rem Consolidation Allowed |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 92 | Dock Assignment |
| 100 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola PH y Colombia

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p056-t003, p057-t001](reading/sdd-d50ca4a96095c930.md#p056-t003)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 30 | Set Custom Status Flow |
| 35 | Set Consolidation To SH |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 95 | Container Creation |
| 96 | Container Creation Statistics |
| 98 | Work Creation Shipping Containers |
| 110 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 125 | Paperwork - Labels |
| 140 | Complete Wave |

## Ola Flujo Uniformes

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p057-t002](reading/sdd-d50ca4a96095c930.md#p057-t002)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 25 | Override: Remove Store Distribution |
| 30 | Set Custom Status Flow |
| 35 | Set Eligible to NULL |
| 70 | Rule Assignment |
| 80 | Allocation |
| 81 | Set Alloc Zone on Work Colgado |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 100 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola Flujo Clientes Esp

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p057-t003](reading/sdd-d50ca4a96095c930.md#p057-t003)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 25 | Set Eligible to NULL |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 100 | Work Creation Allocation Requests |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola Flujo Online

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p057-t004, p058-t001](reading/sdd-d50ca4a96095c930.md#p057-t004)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 25 | Set Eligible to NULL |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 85 | Set Delete COMPANY NULL |
| 90 | Allocation Statistics |
| 116 | Work Creation Allocation Requests |
| 117 | Set Alloc Zone on Work Online |
| 118 | VAS Assignment |
| 120 | Labor Plan Execution |
| 140 | Complete Wave |

## Ola Flujo TDA Movil

Heading attribution and all rows checked against rendered pages54-58; split-page continuations joined without inserting a header or inventing a step. Source labels retained, including custom step names.

[sdd-d50ca4a96095c930 p058-t002](reading/sdd-d50ca4a96095c930.md#p058-t002)

| Sequence | Description |
| --- | --- |
| 10 | Start Wave |
| 20 | Start Wave Statistics |
| 25 | Set Eligible to NULL |
| 30 | Set Custom Status Flow |
| 70 | Rule Assignment |
| 80 | Allocation |
| 90 | Allocation Statistics |
| 140 | Complete Wave |

## Rejected and remaining candidates

- `sdd-1c25f20de1eafc3e`: 172 candidates; 8 reviewed logical tables from 10 candidates; 14 layout/fragment artifacts rejected; 148 candidates unreviewed.
- `sdd-d50ca4a96095c930`: 47 candidates; 12 reviewed logical tables from 16 candidates; 0 layout/fragment artifacts rejected; 31 candidates unreviewed.

The Knipper page57 prose names most-available-first for non-lot items, while its page58 tables name FIFO. Both are preserved. Knipper comment balloons also question EA versus case replenishment. The Grupo Julio Cuarentena inventory-status cell is blank. These gaps are not filled by inference.

## PDF continuation — 2026-09-30

The following 53 logical tables were visually reconciled. Blank placeholders and historical rows remain explicit. Grupo Julio now has a disposition for every one of its 47 detected table candidates; undetected/raster-table completeness remains unknown.

### Grupo Julio upload folders

Joined two-line header; {storage} is a literal source placeholder, not an observed endpoint.

[sdd-d50ca4a96095c930 p022-t001](reading/sdd-d50ca4a96095c930.md#p022-t001)

| <code>Interface Process</code> | <code>Folder</code> | <code>File Extension</code> |
| --- | --- | --- |
| <code>Inventory Transaction</code> | <code>https://{storage}/ils/Interface/Upload/Inventory</code> | <code>it.xml</code> |
| <code>Item Balance</code> | <code>https://{storage}/ils/Interface/Upload/Balance</code> | <code>ib.xml</code> |
| <code>Receiving</code> | <code>https://{storage}/ils/Interface/Upload/Receiving</code> | <code>rc.xml</code> |
| <code>Shipping</code> | <code>https://{storage}/ils/Interface/Upload/Shipping</code> | <code>sh.xml</code> |

### Grupo Julio receipt ID types

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-d50ca4a96095c930 p024-t001](reading/sdd-d50ca4a96095c930.md#p024-t001)

| <code>Receipt ID Type</code> | <code>Description</code> | <code>Interfaced</code> |
| --- | --- | --- |
| <code>DEV CIE</code> | <code>Returns from Clients</code> | <code>N</code> |
| <code>DEV TDA</code> | <code>Returns from Stores</code> | <code>Y</code> |
| <code>REC NAC</code> | <code>Receipts from national vendors</code> | <code>Y</code> |
| <code>REC IMP</code> | <code>Receipts from external vendors</code> | <code>Y</code> |
| <code>REC INS</code> | <code>Receipts from insumos</code> | <code>Y</code> |

### Grupo Julio receipt types

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-d50ca4a96095c930 p024-t002](reading/sdd-d50ca4a96095c930.md#p024-t002)

| <code>Receipt ID Type</code> | <code>Receipt Type</code> | <code>Description</code> |
| --- | --- | --- |
| <code>DEV CIE</code> | <code>DEV CIE</code> | <code>Returns from Clients</code> |
| <code>DEV TDA</code> | <code>DEV TDA</code> | <code>Returns from Stores</code> |
| <code>REC NAC</code> | <code>OC</code> | <code>Receipts from national vendors</code> |
| <code>REC IMP</code> | <code>REC IMP</code> | <code>Receipts from external vendors</code> |
| <code>REC INS</code> | <code>REC INS</code> | <code>Receipts from insumos</code> |

### Grupo Julio sample locating zones

Removed detector-only columns. The page explicitly calls this a non-final sample list.

[sdd-d50ca4a96095c930 p041-t001](reading/sdd-d50ca4a96095c930.md#p041-t001)

| <code>Locating Zone</code> | <code>Description</code> |
| --- | --- |
| <code>L-Reserva Calzado</code> | <code>Reserve locations for shoes</code> |
| <code>L-Reserva Calzado TP</code> | <code>Reserve locations for shoes from past seasons</code> |
| <code>L-Drop Calzado</code> | <code>Locations to drop items during outbound</code> |
| <code>L-Devolucion</code> | <code>Locations for returns</code> |

### Grupo Julio locating: Devolucion

Two-line header collapsed; N retained. Source says listed rules are examples subject to build-phase review.

[sdd-d50ca4a96095c930 p041-t002](reading/sdd-d50ca4a96095c930.md#p041-t002)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate to location that already contains</code> | <code>Devolucion</code> | <code>N</code> |
| <code>15</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Devolucion</code> | <code>N</code> |
| <code>30</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Almacenaje Supervisor</code> | <code>N</code> |

### Grupo Julio locating: Almacenaje Colgado TA

Two-line header collapsed; N retained. Source says listed rules are examples subject to build-phase review.

[sdd-d50ca4a96095c930 p042-t001](reading/sdd-d50ca4a96095c930.md#p042-t001)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate to location that already contains</code> | <code>Almacenaje Colgado TA</code> | <code>N</code> |
| <code>15</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Almacenaje Colgado TA</code> | <code>N</code> |
| <code>20</code> | <code>Empty location</code> | <code>Almacenaje Colgado TA</code> | <code>N</code> |
| <code>30</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Almacenaje Supervisor</code> | <code>N</code> |

### Grupo Julio locating: Almacenaje VAS Etiquetado

Two-line header collapsed; N retained. Source says listed rules are examples subject to build-phase review.

[sdd-d50ca4a96095c930 p042-t002](reading/sdd-d50ca4a96095c930.md#p042-t002)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>30</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Almacenaje VAS Etiquetado</code> | <code>N</code> |
| <code>40</code> | <code>Use specific (mult-item) location regardless of status</code> | <code>Almacenaje Supervisor</code> | <code>N</code> |

### Grupo Julio sample allocating zones

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-d50ca4a96095c930 p064-t001](reading/sdd-d50ca4a96095c930.md#p064-t001)

| <code>Allocating Zone</code> |
| --- |
| <code>A-Donacion</code> |
| <code>A-Drop Colgado</code> |
| <code>A-Put to Store Calzado</code> |
| <code>A-Reserva Doblado</code> |

### Grupo Julio Asignacion Calzado

Example allocation rules, not an exhaustive rule set. All Eligible UMs cells are visibly blank; no unit eligibility is inferred.

[sdd-d50ca4a96095c930 p064-t002](reading/sdd-d50ca4a96095c930.md#p064-t002)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>First in, first out</code> | <code>Reserva Calzado</code> | <code></code> |

### Grupo Julio Asignacion Destruccion

Example allocation rules, not an exhaustive rule set. All Eligible UMs cells are visibly blank; no unit eligibility is inferred.

[sdd-d50ca4a96095c930 p064-t003](reading/sdd-d50ca4a96095c930.md#p064-t003)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>First in, first out</code> | <code>Reserva Destruccion</code> | <code></code> |

### Grupo Julio Asignacion Devolucion

Example allocation rules, not an exhaustive rule set. All Eligible UMs cells are visibly blank; no unit eligibility is inferred.

[sdd-d50ca4a96095c930 p064-t004](reading/sdd-d50ca4a96095c930.md#p064-t004)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>First in, first out</code> | <code>Reserva Devolucion</code> | <code></code> |

### Grupo Julio Asignacion Disponible Col

Example allocation rules, not an exhaustive rule set. All Eligible UMs cells are visibly blank; no unit eligibility is inferred.

[sdd-d50ca4a96095c930 p064-t005](reading/sdd-d50ca4a96095c930.md#p064-t005)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>5</code> | <code>First in, first out</code> | <code>Devoluciones</code> | <code></code> |
| <code>10</code> | <code>First in, first out</code> | <code>Reserva Colgado TA</code> | <code></code> |
| <code>20</code> | <code>First in, first out</code> | <code>Reserva Colgado TP</code> | <code></code> |

### Grupo Julio Asignacion Disponible Mez

Example allocation rules, not an exhaustive rule set. All Eligible UMs cells are visibly blank; no unit eligibility is inferred.

[sdd-d50ca4a96095c930 p064-t006](reading/sdd-d50ca4a96095c930.md#p064-t006)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>30</code> | <code>First in, first out</code> | <code>Reserva Doblado</code> | <code></code> |

### Grupo Julio base dock-management flow

Joined two-line header. No/YES/NO casing retained; configured location names are source-specific.

[sdd-d50ca4a96095c930 p084-t001](reading/sdd-d50ca4a96095c930.md#p084-t001)

| <code>Status</code> | <code>Location Subclass</code> | <code>Default Loc</code> | <code>Create Next Move</code> |
| --- | --- | --- | --- |
| <code>In Packing</code> | <code>Packing</code> | <code>EMPAQUE-01</code> | <code>No</code> |
| <code>Staging Pending</code> | <code>Packing</code> | <code>EMPAQUE-01</code> | <code>YES</code> |
| <code>Loading Pending</code> | <code>Staging</code> | <code>STG-001</code> | <code>YES</code> |
| <code>Ship Confirm Pending</code> | <code>Dock Door</code> | <code>EMBDOCK-01</code> | <code>NO</code> |

### Grupo Julio sample adjustment and transfer types

Joined page continuation; preserved blank quantity for Cambio de Estado and all signed limits. Source explicitly says this list is not final.

[sdd-d50ca4a96095c930 p088-t001, p089-t001](reading/sdd-d50ca4a96095c930.md#p088-t001)

| <code>Name</code> | <code>Class</code> | <code>Quantities</code> | <code>Create Work</code> | <code>Interface</code> |
| --- | --- | --- | --- | --- |
| <code>Ajuste Inventario Inicial</code> | <code>Adjustment</code> | <code>-50 / +9999999</code> | <code>N</code> | <code>Y</code> |
| <code>Ajuste Conteo Ciclico (+)</code> | <code>Adjustment</code> | <code>0 / +9999999</code> | <code>N</code> | <code>Y</code> |
| <code>Ajuste por Online (-)</code> | <code>Adjustment</code> | <code>-9999999 / 0</code> | <code>N</code> | <code>Y</code> |
| <code>Cambio de Estado</code> | <code>Status Change</code> | <code></code> | <code>N</code> | <code>Y</code> |
| <code>Transferencia a Tda Movil</code> | <code>Transfer</code> | <code>0 / +99999</code> | <code>N</code> | <code>N</code> |
| <code>Transferencia con Trabajo</code> | <code>Transfer</code> | <code>0 / +99999</code> | <code>Y</code> | <code>N</code> |

### Grupo Julio order types (English)

Bilingual source presentations retained as separate physical tables; they are not two independent configurations. Codes may change during build.

[sdd-d50ca4a96095c930 p051-t001](reading/sdd-d50ca4a96095c930.md#p051-t001)

| <code>Order Types</code> | <code>Description</code> | <code>Interfaced</code> | <code>Frequency</code> |
| --- | --- | --- | --- |
| <code>Pedido CTE</code> | <code>Orders from clients</code> | <code>Y</code> | <code>Random</code> |
| <code>Pedido INS</code> | <code>Orders for insumos</code> | <code>Y</code> | <code>Random</code> |
| <code>Pedido TDA</code> | <code>Orders from stores</code> | <code>Y</code> | <code>Random</code> |

### Grupo Julio order types (Spanish)

Bilingual source presentations retained as separate physical tables; they are not two independent configurations. Codes may change during build.

[sdd-d50ca4a96095c930 p051-t002](reading/sdd-d50ca4a96095c930.md#p051-t002)

| <code>Tipos de Pedidos</code> | <code>Descripción</code> | <code>Interfaz</code> | <code>Frecuencia</code> |
| --- | --- | --- | --- |
| <code>Pedido CTE</code> | <code>Pedidos de clientes</code> | <code>Y</code> | <code>Random</code> |
| <code>Pedido INS</code> | <code>Pedidos de insumos</code> | <code>Y</code> | <code>Random</code> |
| <code>Pedido TDA</code> | <code>Pedidos de tiendas</code> | <code>Y</code> | <code>Random</code> |

### Grupo Julio illustrative wave sequence (English)

Bilingual example sequence retained separately. It is explicitly an example, not the selected per-order wave templates on pages 54–58.

[sdd-d50ca4a96095c930 p053-t001](reading/sdd-d50ca4a96095c930.md#p053-t001)

| <code>Sequence</code> | <code>Description</code> |
| --- | --- |
| <code>10</code> | <code>Start Wave</code> |
| <code>20</code> | <code>Override Data: Set Default Status Flow</code> |
| <code>30</code> | <code>Replenishment</code> |
| <code>40</code> | <code>Rule Assignment</code> |
| <code>50</code> | <code>Allocation</code> |
| <code>60</code> | <code>Container Creation</code> |
| <code>70</code> | <code>Pallet Building</code> |
| <code>80</code> | <code>Load Building</code> |
| <code>90</code> | <code>Work Creation Replenishment</code> |
| <code>100</code> | <code>Work Creation Shipping Containers</code> |
| <code>110</code> | <code>Paperwork – Labels</code> |
| <code>120</code> | <code>Complete Wave</code> |

### Grupo Julio illustrative wave sequence (Spanish)

Bilingual example sequence retained separately. It is explicitly an example, not the selected per-order wave templates on pages 54–58.

[sdd-d50ca4a96095c930 p053-t002](reading/sdd-d50ca4a96095c930.md#p053-t002)

| <code>Secuencia</code> | <code>Descripción</code> |
| --- | --- |
| <code>10</code> | <code>Inicio de ola</code> |
| <code>20</code> | <code>Anular datos: establecer el flujo de estado predeterminado</code> |
| <code>30</code> | <code>Reabastecimiento</code> |
| <code>40</code> | <code>Asignación de reglas</code> |
| <code>50</code> | <code>Asignación</code> |
| <code>60</code> | <code>Creación de contenedores</code> |
| <code>70</code> | <code>Construcción de pallets</code> |
| <code>80</code> | <code>Construcción de cargas</code> |
| <code>90</code> | <code>Creación de trabajos de reabastecimiento</code> |
| <code>100</code> | <code>Creación de trabajo de Contenedores de envío</code> |
| <code>110</code> | <code>Hojas de trabajo – Etiquetas</code> |
| <code>120</code> | <code>Ola completa</code> |

### Grupo Julio PTL integration

Added an explicit visible revision-state column after page inspection. The raw extraction does not encode PDF strike-through. EX04/EX07/EX02/EX06/EX08 are retained only as historical struck-through rows, not approved implementation instructions. Wrapped To_Location underscore restored on page 104.

[sdd-d50ca4a96095c930 p103-t001](reading/sdd-d50ca4a96095c930.md#p103-t001)

| <code>Extension</code> | <code>Visible revision state</code> | <code>Description</code> |
| --- | --- | --- |
| <code>EX01</code> | <code>VISIBLE_UNSTRUCK_DESIGN_TEXT</code> | <code>Put to Light Sort Integration Extension to integrate with a PTL (Put to Light) system. Existing extension in 2015. Will be ported to Active SCALE. The old extensions that this extension will replace are: EX01, EX01-A, EX01-B, EX01-C, AI0011, AI0013, AI0019, AI0020, AI0038, AI0039 and AI0040. Base Alternative: None.</code> |

### Grupo Julio Interface integration

Added an explicit visible revision-state column after page inspection. The raw extraction does not encode PDF strike-through. EX04/EX07/EX02/EX06/EX08 are retained only as historical struck-through rows, not approved implementation instructions. Wrapped To_Location underscore restored on page 104.

[sdd-d50ca4a96095c930 p103-t002](reading/sdd-d50ca4a96095c930.md#p103-t002)

| <code>Extension</code> | <code>Visible revision state</code> | <code>Description</code> |
| --- | --- | --- |
| <code>EX03</code> | <code>VISIBLE_UNSTRUCK_DESIGN_TEXT</code> | <code>Inventory Reserve for E-Commerce Extension to set/reset inventory attributes, used to reserve inventory for specific order types (Online, for example). Existing extension in 2015. Will be ported to Active SCALE. The old extensions that this extension will replace are: EX03, EX03-A and EX03- B. Base Alternative: Check-in the items and then allocate from specific location.</code> |

### Grupo Julio Warehouse mobile extensions, part 1

Added an explicit visible revision-state column after page inspection. The raw extraction does not encode PDF strike-through. EX04/EX07/EX02/EX06/EX08 are retained only as historical struck-through rows, not approved implementation instructions. Wrapped To_Location underscore restored on page 104.

[sdd-d50ca4a96095c930 p103-t003](reading/sdd-d50ca4a96095c930.md#p103-t003)

| <code>Extension</code> | <code>Visible revision state</code> | <code>Description</code> |
| --- | --- | --- |
| <code>EX04</code> | <code>STRUCK_THROUGH_HISTORICAL</code> | <code>Add Inventory RF Screen Existing extension in 2015. Not in use. Will not be ported to Active SCALE. The extensions that this extension would replace are: EX04 and EX04-A. Base Alternative: N/A</code> |
| <code>EX05</code> | <code>VISIBLE_UNSTRUCK_DESIGN_TEXT</code> | <code>Receiving Workflow without Quantity Prompt Extension to default the quantity being checked-in to 1 (one). Existing extension in 2015. Will be ported to Active SCALE. The old extensions that this extension will replace are: EX05 and EX07. Base Alternative: Enter the required quantity (1) before checking in.</code> |

### Grupo Julio Warehouse mobile extensions, part 2

Added an explicit visible revision-state column after page inspection. The raw extraction does not encode PDF strike-through. EX04/EX07/EX02/EX06/EX08 are retained only as historical struck-through rows, not approved implementation instructions. Wrapped To_Location underscore restored on page 104.

[sdd-d50ca4a96095c930 p104-t001](reading/sdd-d50ca4a96095c930.md#p104-t001)

| <code>Extension</code> | <code>Visible revision state</code> | <code>Description</code> |
| --- | --- | --- |
| <code>EX07</code> | <code>STRUCK_THROUGH_HISTORICAL</code> | <code>Putaway Grouping by Item Location Extension to group the putaway work based on Putaway Group ID/Item/To_Location. Existing extension in 2015. Will be ported to Active SCALE as part of the EX05. Base Alternative: This extension is only needed as a side effect of EX05.</code> |
| <code>EX09</code> | <code>VISIBLE_UNSTRUCK_DESIGN_TEXT</code> | <code>Cycle Count One by One Extension to allow counting one by one during cycle count. Existing extension in 2015. Will be ported to Active SCALE. Base Alternative: Perform regular counting.</code> |

### Grupo Julio Performance improvement extensions

Added an explicit visible revision-state column after page inspection. The raw extraction does not encode PDF strike-through. EX04/EX07/EX02/EX06/EX08 are retained only as historical struck-through rows, not approved implementation instructions. Wrapped To_Location underscore restored on page 104.

[sdd-d50ca4a96095c930 p104-t002](reading/sdd-d50ca4a96095c930.md#p104-t002)

| <code>Extension</code> | <code>Visible revision state</code> | <code>Description</code> |
| --- | --- | --- |
| <code>EX02</code> | <code>STRUCK_THROUGH_HISTORICAL</code> | <code>Cross Dock for Multi Item Container Extension to allow cross docking for multi-item containers. Existing extension in 2015. Still under discussion if it should be ported or not to Active SCALE. Base Alternative: Check-in the items and then allocate from specific location.</code> |
| <code>EX06</code> | <code>STRUCK_THROUGH_HISTORICAL</code> | <code>Immediate Needs Locating Rule by Receiving Preference Extension to use a different locating rule based on the receiving preference used, only for immediate needs. Existing extension in 2015. The required configuration is not in place on Grupo Julio production’s environment, which means it is not being used. Grupo Julio will execute some tests to make sure the extension is not in use. Base Alternative: Use a single locating rule.</code> |
| <code>EX08</code> | <code>STRUCK_THROUGH_HISTORICAL</code> | <code>Custom Immediate Needs Viewer This extension was never developed by Manhattan Associates. A draft document was provided by Logística de México. Most of the requirements from this document are now supported by base SCALE. Base Alternative: Use the base Immediate Needs Insight screen and handle any possible exceptional scenario by SOP.</code> |

### Grupo Julio action items explicitly not migrated

The page heading explicitly excludes all 21 listed action items from this project. Table entries describe historic fixes; no current defects or deployed fixes are inferred.

[sdd-d50ca4a96095c930 p105-t001](reading/sdd-d50ca4a96095c930.md#p105-t001)

| <code>Action Item</code> | <code>Description</code> |
| --- | --- |
| <code>AI0003</code> | <code>Load Confirmation Slowness Analysis</code> |
| <code>AI0004</code> | <code>Error on Load Confirmation</code> |
| <code>AI0005</code> | <code>Null reference exception on dock door transfer</code> |
| <code>AI0006</code> | <code>Debug patch for load confirmation issue</code> |
| <code>AI0007</code> | <code>Dock Transfer with open staging work issue</code> |
| <code>AI0008</code> | <code>Fix for Date issue while upload</code> |
| <code>AI0009</code> | <code>No staging work created issue fix</code> |
| <code>AI0010</code> | <code>Fix for partial Imm needs update issue</code> |
| <code>AI0012</code> | <code>Distributed shipment wave cancellation issue</code> |
| <code>AI0014</code> | <code>Fix for session issue</code> |
| <code>AI0016</code> | <code>Mezzanine new container and printing issue fix</code> |
| <code>AI0017</code> | <code>Mezzanine new container issue fix</code> |
| <code>AI0018</code> | <code>Colgado close work issue</code> |
| <code>AI0024</code> | <code>InternalShipAllocNum issue fix</code> |
| <code>AI0026</code> | <code>Deactivate work issue fix</code> |
| <code>AI0028</code> | <code>Confirm imm Work till DropLoc issue</code> |
| <code>AI0029</code> | <code>Debug patch for EX05 issue</code> |
| <code>AI0035</code> | <code>Receipt interface upload issue fix</code> |
| <code>AI0037</code> | <code>Work confirmation during load confirm issue fix</code> |
| <code>AI0041</code> | <code>Fix for EX09 Cycle count issue</code> |
| <code>AI0042</code> | <code>Fix for EX09 Cycle count work assignment issue</code> |

### Grupo Julio source revision history

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-d50ca4a96095c930 p109-t001](reading/sdd-d50ca4a96095c930.md#p109-t001)

| <code>Date</code> | <code>Changed By</code> | <code>Version</code> | <code>Notes</code> |
| --- | --- | --- | --- |
| <code>8/8/2024</code> | <code>Luciano Peres</code> | <code>1.0</code> | <code>First draft</code> |
| <code>8/19/2024</code> | <code>Luciano Peres</code> | <code>1.1</code> | <code>Added outbound section</code> |
| <code>8/26/2024</code> | <code>Luciano Peres</code> | <code>1.2</code> | <code>Changes based on client’s feedback</code> |
| <code>8/28/2024</code> | <code>Luciano Peres</code> | <code>1.3</code> | <code>Changes based on client’s feedback</code> |
| <code>8/29/2024</code> | <code>Luciano Peres</code> | <code>1.4</code> | <code>Changes based on client’s feedback</code> |
| <code>9/3/2024</code> | <code>Luciano Peres</code> | <code>1.5</code> | <code>Last changes to prepare document for sign-off</code> |

### Grupo Julio document-stated statistics

Reconstructed merged two-column layout. Historical figures are only assertions in this private design document; the averaging interval is not stated and no operational data was queried.

[sdd-d50ca4a96095c930 p007-t001](reading/sdd-d50ca4a96095c930.md#p007-t001)

| <code>Criteria</code> | <code>Statistic</code> |
| --- | --- |
| <code>Peak season</code> | <code>September ~ December</code> |
| <code>Low season</code> | <code>January ~ March</code> |
| <code>Working shifts</code> | <code>1 (7am ~ 5:30pm)</code> |
| <code>Average units received during peak season</code> | <code>15,630</code> |
| <code>Average units shipped during peak season</code> | <code>382,285</code> |
| <code>Total SKUs</code> | <code>193,524</code> |
| <code>Company</code> | <code>Julio</code> |
| <code>Warehouse</code> | <code>CEDIS JULIO</code> |
| <code>City</code> | <code>Ciudad de México</code> |
| <code>Number of licenses</code> | <code>35</code> |

### Grupo Julio terminology

Joined three-page glossary. Empty terminology cells remain empty; retained source spellings including Temporada Atual. These definitions do not establish database mappings.

[sdd-d50ca4a96095c930 p013-t001, p014-t001, p015-t001](reading/sdd-d50ca4a96095c930.md#p013-t001)

| <code>Client Terminology</code> | <code>MA Terminology</code> | <code>Definition</code> |
| --- | --- | --- |
| <code></code> | <code>SCALE</code> | <code>Supply Chain Architected for Logistics Execution warehouse management.</code> |
| <code>INTELISIS</code> | <code>HOST / ERP</code> | <code>Client’s ERP system integrating with Scale</code> |
| <code></code> | <code>ITEM</code> | <code>Item Identifier for regular inventory. For client, this is item code, style, color, and size.</code> |
| <code></code> | <code>ITEM CROSS REFERENCE</code> | <code>Global Trade Item Number. Definition of an SKU in a specific Unit of Measurement (UoM).</code> |
| <code></code> | <code>RECEIPTS</code> | <code>Goods purchased by Client. Purchase orders and receipts have a 1:M mapping. SCALE maintains these as receipts with PO interfaced on receipt header.</code> |
| <code></code> | <code>TRAILER ID</code> | <code>A container or truck being received into the DC. One inbound trailer has one receipt.</code> |
| <code></code> | <code>SHIPMENT</code> | <code>Goods to be shipped to stores, wholesale customers, or retail supermarkets. The order in ERP and shipment in scale will be a 1:1 mapping.</code> |
| <code></code> | <code>WAVE</code> | <code>A wave represents the different steps that the system uses to retrieve orders from the pool, and process them into the outbound portion of SCALE</code> |
| <code></code> | <code>RUN WAVE</code> | <code>a group of orders when processed resulting in inventory allocation</code> |
| <code></code> | <code>POOL</code> | <code>Any orders pending processing to be shipped immediately after interface to SCALE</code> |
| <code></code> | <code>WORK INSTRUCTION</code> | <code>Transaction tracked by SCALE to coordinate the movement of inventory for a variety of warehouse processes. A group of work instruction is a work unit</code> |
| <code></code> | <code>SHIPPING CONTAINER</code> | <code>An object that can be used to hold or transport inventory for a shipment.</code> |
| <code></code> | <code>RECEIVING CONTAINER</code> | <code>An object that can be used to hold or transport inventory for a receipt.</code> |
| <code></code> | <code>LPN (LOGISTICS UNIT)</code> | <code>An object that can be used to hold or transport inventory. When nested, the tree unit is referred to as the parent logistics unit.</code> |
| <code></code> | <code>P&amp;D</code> | <code>Pick up and Drop location</code> |
| <code></code> | <code>ODWS</code> | <code>Override Data Wave Step. SCALE provides a wave step that allows performing crud operation to data during the wave process.</code> |
| <code></code> | <code>EXIT POINT</code> | <code>An external process that performs logic in line with the base process. Used to update data or perform additional logic.</code> |
| <code></code> | <code>ASN</code> | <code>Advanced Shipping Notice. Receipt that contains all information that will be received into the warehouse, including the container IDs.</code> |
| <code>DEV</code> | <code>RMA</code> | <code>Returns Merchandise Authorizations. Receipt interfaced into SCALE with the information of the returning items.</code> |
| <code></code> | <code>SOP</code> | <code>Standard Operational Procedure. Documentation containing steps that must be followed to execute a procedure. May include steps executed in different systems and outside of systems.</code> |
| <code></code> | <code>MHE</code> | <code>Material Handling Equipment.</code> |
| <code></code> | <code>PTL</code> | <code>Put to Light system. Used by Grupo Julio during sorting process.</code> |
| <code>TA / TP</code> | <code></code> | <code>TA = Temporada Atual (Current Season) TP = Temporada Pasada (Previous Season)</code> |

### Knipper sample locating zones

Joined page-35 row 5 with its two bullet continuation at top of page 36. Original numbering (including 9 before 8) and L-DEA Reserve spelling retained. Source says additional building/customer zones will be configured.

[sdd-1c25f20de1eafc3e p035-t002, p036-t002](reading/sdd-1c25f20de1eafc3e.md#p035-t002)

| <code>Number</code> | <code>Locating Zone</code> | <code>Description</code> |
| --- | --- | --- |
| <code>1</code> | <code>L-DEA Reserve</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>3</code> | <code>L-DEA-Returns</code> | <code>• Multi Item • LPN Tracked • Max Lot = 0</code> |
| <code>4</code> | <code>L-Refrigerated</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>5</code> | <code>L-OHW-Reserve</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>6</code> | <code>L-KMW-Reserve</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>7</code> | <code>L-Freezer</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>9</code> | <code>L-3PL-Reserve</code> | <code>• Single Item • LPN Tracked • Max Lot = 1</code> |
| <code>8</code> | <code>L-Damaged</code> | <code>• Multi Item • LPN Tracked • Max Lot = 0</code> |
| <code>10</code> | <code>L-KMW-Returns</code> | <code>• Multi Item • LPN Tracked • Max Lot = 0</code> |
| <code>11</code> | <code>L-OHW-Returns</code> | <code>• Multi Item • LPN Tracked • Max Lot = 0</code> |
| <code>12</code> | <code>L-See-Supervisor</code> | <code>• Multi Item • LPN Tracked • Max Lot = 0</code> |

### Knipper locating: Refrigerated

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-1c25f20de1eafc3e p036-t003](reading/sdd-1c25f20de1eafc3e.md#p036-t003)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate - Exclude differing lots</code> | <code>L-Refrigerated</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-Refrigerated</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper locating: DEA Controlled

Joined the sequence-30 continuation on page 37. Source alternates L-DEA Reserve and L-DEA-Reserve; retained both without asserting identity.

[sdd-1c25f20de1eafc3e p036-t004, p037-t002](reading/sdd-1c25f20de1eafc3e.md#p036-t004)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate - Exclude differing lots</code> | <code>L-DEA Reserve</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-DEA-Reserve</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper locating: General

Removed detector-only columns. Line-wrapped zone names joined; source lists sample sequences only.

[sdd-1c25f20de1eafc3e p037-t003](reading/sdd-1c25f20de1eafc3e.md#p037-t003)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate - Exclude differing lots</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper locating: Freezer

Removed detector-only columns. Line-wrapped zone names joined; source lists sample sequences only.

[sdd-1c25f20de1eafc3e p037-t004](reading/sdd-1c25f20de1eafc3e.md#p037-t004)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate - Exclude differing lots</code> | <code>L-Freezer</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-Freezer</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper locating: General and Literature

Removed detector-only columns. Line-wrapped zone names joined; source lists sample sequences only.

[sdd-1c25f20de1eafc3e p037-t005](reading/sdd-1c25f20de1eafc3e.md#p037-t005)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate to location that already contains the item</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper locating: Damaged

Removed detector-only columns. Line-wrapped zone names joined; source lists sample sequences only.

[sdd-1c25f20de1eafc3e p038-t003](reading/sdd-1c25f20de1eafc3e.md#p038-t003)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-Damaged</code> | <code>No</code> |

### Knipper locating: Returns

Removed detector-only columns. Line-wrapped zone names joined; source lists sample sequences only.

[sdd-1c25f20de1eafc3e p038-t004](reading/sdd-1c25f20de1eafc3e.md#p038-t004)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-KMW-Returns/L-OHW-Returns</code> | <code>No</code> |

### Knipper locating: General and Medical Devices

Joined sequence 10 on page 37 with sequences 20 and 30 on page 38; sample sequence, not all configured rules.

[sdd-1c25f20de1eafc3e p037-t006, p038-t002](reading/sdd-1c25f20de1eafc3e.md#p037-t006)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Split Quantity</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>Consolidate to location that already contains the item</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>20</code> | <code>Empty Location</code> | <code>L-KMW-Reserve/ L-OHW-Reserve</code> | <code>No</code> |
| <code>30</code> | <code>Use specific (multi-item) location regardless of status</code> | <code>L-See-Supervisor</code> | <code>No</code> |

### Knipper component allocation

Joined FIFO non-lot sequence 10 and FEFO lot sequence 20 across pages. Eligible UMs are blank in both rows.

[sdd-1c25f20de1eafc3e p062-t003, p063-t002](reading/sdd-1c25f20de1eafc3e.md#p062-t003)

| <code>Sequence</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> |
| --- | --- | --- | --- |
| <code>10</code> | <code>First in First Out</code> | <code>A-General Reserve – Non-Lot</code> | <code></code> |
| <code>20</code> | <code>First Expiration First Out</code> | <code>A-General Reserve - Lot</code> | <code></code> |

### Knipper order profiles

Preserved blank Frequency cells; Y/Manual is the source value, not proof all orders use both channels.

[sdd-1c25f20de1eafc3e p069-t002](reading/sdd-1c25f20de1eafc3e.md#p069-t002)

| <code>Order Profile</code> | <code>Description</code> | <code>Interfaced</code> | <code>Frequency</code> |
| --- | --- | --- | --- |
| <code>Direct to Physicians (DTP)</code> | <code>• Orders for samples to physicians</code> | <code>Y/Manual</code> | <code></code> |
| <code>Direct to Rep (DTR)</code> | <code>• Orders for samples to Medical Reps</code> | <code>Y/Manual</code> | <code></code> |
| <code>3PL</code> | <code>• Orders for 3PL accounts</code> | <code>Y/Manual</code> | <code></code> |
| <code>Destruction</code> | <code>• Shipping inventory for destruction</code> | <code>Y/Manual</code> | <code></code> |
| <code>Direct to Consumer (Ecom)</code> | <code>• Direct to consumer orders</code> | <code>Y/Manual</code> | <code></code> |

### Knipper shipment allocating zones

Joined ten numbered rows across pages. A-PNP retains Dynamically Assigned and Permanent, matching both the visible page-79 row and extracted candidate. Missing bullet fields elsewhere remain missing; no tracking default inferred. Generic zone names may have warehouse suffixes.

[sdd-1c25f20de1eafc3e p078-t002, p079-t002](reading/sdd-1c25f20de1eafc3e.md#p078-t002)

| <code>Number</code> | <code>Allocating Zone</code> | <code>Description</code> |
| --- | --- | --- |
| <code>1</code> | <code>A-DTP-PM A-DTP A-DTP REF A-DTP Cart</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>2</code> | <code>A-DEA A-DEA-CAGE A-DEA-PM</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>3</code> | <code>A-DEA-FLOOR</code> | <code>• Multiple Item • Dynamically Assigned • License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>4</code> | <code>A-3PL-CP A-3PL-PM A-3PL-LANE A-3PL-RESV</code> | <code>• Single Item • Dynamically Assigned • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>5</code> | <code>A-Shelves (KMW and OHW)</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>6</code> | <code>A-FREEZER (KMW and OHW)</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>7</code> | <code>A-REFG (KMW and OHW)</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>8</code> | <code>A-PNP</code> | <code>• Single Item • Dynamically Assigned and Permanent • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>9</code> | <code>A-RESV (KMW and OHW)</code> | <code>• Single Item • Dynamically Assigned • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |
| <code>10</code> | <code>A-CP (KMW and OHW)</code> | <code>• Single Item • Dynamically Assigned • Not License Plate Tracking • Allocate In Transit • Inventory Status = Available</code> |

### Knipper allocation: Non-lot controlled

Collapsed two-line header; retained blank sequence-30 Location Selection, Clear Loc? and Lot cells. No implied wildcard/default added.

[sdd-1c25f20de1eafc3e p079-t003](reading/sdd-1c25f20de1eafc3e.md#p079-t003)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> | <code>Inventory Status</code> | <code>Clear Loc?</code> | <code>Lot</code> |
| --- | --- | --- | --- | --- | --- | --- |
| <code>10</code> | <code>First In First out</code> | <code>A-RESV</code> | <code>PL</code> | <code>Available</code> | <code></code> | <code></code> |
| <code>20</code> | <code>First In First Out</code> | <code>A-CP</code> | <code>CS</code> | <code>Available</code> | <code></code> | <code></code> |
| <code>30</code> | <code>First In First Out</code> | <code></code> | <code>PK, EA</code> | <code>Available</code> | <code></code> | <code></code> |

### Knipper allocation: Lot controlled

Collapsed two-line header; retained blank sequence-30 Location Selection, Clear Loc? and Lot cells. No implied wildcard/default added.

[sdd-1c25f20de1eafc3e p080-t002](reading/sdd-1c25f20de1eafc3e.md#p080-t002)

| <code>Seq</code> | <code>Strategy</code> | <code>Location Selection</code> | <code>Eligible UMs</code> | <code>Inventory Status</code> | <code>Clear Loc?</code> | <code>Lot</code> |
| --- | --- | --- | --- | --- | --- | --- |
| <code>10</code> | <code>First Expiration First out</code> | <code>A-RESV</code> | <code>PL</code> | <code>Available</code> | <code></code> | <code></code> |
| <code>20</code> | <code>First Expiration First out</code> | <code>A-CP</code> | <code>CS</code> | <code>Available</code> | <code></code> | <code></code> |
| <code>30</code> | <code>First Expiration First out</code> | <code></code> | <code>PK, EA</code> | <code>Available</code> | <code></code> | <code></code> |

### Knipper interface extension placeholder

Two empty rows retained. This section is blank, not evidence that the implementation has no interfaces.

[sdd-1c25f20de1eafc3e p110-t002](reading/sdd-1c25f20de1eafc3e.md#p110-t002)

| <code>Extension</code> | <code>Description (Defined above in the interface section)</code> |
| --- | --- |
| <code></code> | <code></code> |
| <code></code> | <code></code> |

### Knipper performance management extension placeholder

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-1c25f20de1eafc3e p110-t003](reading/sdd-1c25f20de1eafc3e.md#p110-t003)

| <code>Extension</code> | <code>Description</code> | <code>Module</code> |
| --- | --- | --- |
| <code>N/A</code> | <code></code> | <code></code> |

### Knipper warehouse management extensions

Joined two-page extension inventory. Preserved unusual source wording Flash title. Titles identify design scope only and do not establish extension implementation, SQL identity, or runtime acceptance.

[sdd-1c25f20de1eafc3e p110-t004, p111-t002](reading/sdd-1c25f20de1eafc3e.md#p110-t004)

| <code>Extension</code> | <code>Description</code> |
| --- | --- |
| <code>EX12</code> | <code>Scheduled Ship Date Validation Before Close Container</code> |
| <code>EX13</code> | <code>Pick to Light Wave Splitting Wave Steps: Cancel Replenishment for Rejected Orders DTP Location Assignment DTP Wave Splitting Exit point: Release Wave - Before</code> |
| <code>EX14</code> | <code>Custom BOL</code> |
| <code>EX16</code> | <code>FedEx Express Reference Fields</code> |
| <code>EX17</code> | <code>Re-Cartonization of Containers based on Season</code> |
| <code>EX18</code> | <code>Whole Number Allocation for Work Orders</code> |
| <code>EX19</code> | <code>MHE Interface - Scale Pick to Light Integration PTLViewer Outbound msg for pick confirmation</code> |
| <code>EX19A</code> | <code>MHE Integration Changes to Support Multiple MHE Server</code> |
| <code>EX24</code> | <code>Display Item Alias in RF Pick confirmation screen</code> |
| <code>EX26</code> | <code>Display Expiry Date on cycle count screen</code> |
| <code>EX36</code> | <code>Corrugate Item Tracking</code> |
| <code>EX37</code> | <code>Serialization Integration with Rfxcel Inbound</code> |
| <code>EX37A</code> | <code>SERIALIZATION INTEGRATION INBOUND FOR LOT VALIDATION</code> |
| <code>EX38</code> | <code>Serialization Integration with Rfxcel Outbound</code> |
| <code>EX38A</code> | <code>Serialization Integration with Rfxcel Outbound</code> |
| <code>EX38B</code> | <code>Verification &amp; Address Validation</code> |
| <code>EX38C</code> | <code>Downgrade UOM Picking &amp; Serialization Changes</code> |
| <code>EX38D</code> | <code>Additional Changes to Outbound Serialization</code> |
| <code>EX39</code> | <code>GS1 Scanning for Work Confirmation Item Validation</code> |
| <code>EX40</code> | <code>Printing multiple work unit document from work insight</code> |
| <code>EX41</code> | <code>Mass updates - Change Carrier, Service, Scheduled ship date for multiple shipments at Wave level</code> |
| <code>EX42</code> | <code>Custom Return from Shipment</code> |
| <code>EX43</code> | <code>Flash title – Inventory Conversion from one Item to another</code> |
| <code>EX44</code> | <code>LPN Combine</code> |
| <code>EX27</code> | <code>HazMat documents/Accessorial</code> |
| <code>EX46</code> | <code>Pallet level QC after nesting for DSCSA</code> |
| <code>EX47</code> | <code>Cubiscan Integration</code> |
| <code>EX48</code> | <code>Auto refresh Wave Insight screen</code> |
| <code>EX49</code> | <code>TPM Order Status Insight Changes</code> |

### Knipper Generic Data Bind API procedure placeholder

N/A and To be documented if identified during tech design retained; this is an unresolved design placeholder, not an authoritative stored-procedure inventory.

[sdd-1c25f20de1eafc3e p111-t003](reading/sdd-1c25f20de1eafc3e.md#p111-t003)

| <code>SP</code> | <code>Description</code> |
| --- | --- |
| <code>N/A</code> | <code>To be documented if identified during tech design</code> |
| <code></code> | <code></code> |

### Knipper future warehouse gaps placeholder

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-1c25f20de1eafc3e p111-t004](reading/sdd-1c25f20de1eafc3e.md#p111-t004)

| <code>Extension</code> | <code>Description</code> |
| --- | --- |
| <code>N/A</code> | <code></code> |

### Knipper documents inventory

Joined two pages. Restored visible DOC01 label omitted by candidate p111-t005; other three IDs preserved.

[sdd-1c25f20de1eafc3e p111-t005, p112-t002](reading/sdd-1c25f20de1eafc3e.md#p111-t005)

| <code>Document</code> | <code>Description</code> |
| --- | --- |
| <code>DOC01</code> | <code>Receiving Worksheet</code> |
| <code>DOC02</code> | <code>Pack List</code> |
| <code>DOC03</code> | <code>Bill of Lading</code> |
| <code>DOC04</code> | <code>Commercial Invoice</code> |

### Knipper Labels

Retained source rows including blanks, N/A and TBD where present. Inventory entries are design evidence only; no executable extension or deployed configuration was examined.

[sdd-1c25f20de1eafc3e p112-t003](reading/sdd-1c25f20de1eafc3e.md#p112-t003)

| <code>Label</code> | <code>Description</code> |
| --- | --- |
| <code>LBL01</code> | <code>Receipt Container Label</code> |
| <code>LBL02</code> | <code>Vendor Label</code> |
| <code>LBL03</code> | <code>Container Contents Label</code> |
| <code>LBL04</code> | <code>Shipping Label</code> |
| <code>LBL05</code> | <code>Pallet Label</code> |

### Knipper Exit Points

Retained source rows including blanks, N/A and TBD where present. Inventory entries are design evidence only; no executable extension or deployed configuration was examined.

[sdd-1c25f20de1eafc3e p112-t004](reading/sdd-1c25f20de1eafc3e.md#p112-t004)

| <code>Exit Point</code> | <code>Description</code> |
| --- | --- |
| <code>EP01</code> | <code>Cancel Shipment – Before</code> |
| <code>EP02</code> | <code>Close Container – Before</code> |
| <code>EP03</code> | <code>Close Container UI Validation</code> |
| <code>EP04</code> | <code>Container Manifesting – After</code> |
| <code>EP05</code> | <code>Load Confirmation – Before</code> |
| <code>EP06</code> | <code>Release Wave – Before</code> |
| <code>EP07</code> | <code>Release Wave - After</code> |
| <code>EP08</code> | <code>RF Group Assignment – After</code> |
| <code>EP09</code> | <code>Ship Label Custom Text – Progistics</code> |
| <code>EP10</code> | <code>Shipment Allocation Request After</code> |

### Knipper Notifications

Retained source rows including blanks, N/A and TBD where present. Inventory entries are design evidence only; no executable extension or deployed configuration was examined.

[sdd-1c25f20de1eafc3e p112-t005](reading/sdd-1c25f20de1eafc3e.md#p112-t005)

| <code>Notification</code> | <code>Description</code> |
| --- | --- |
| <code>Several</code> | <code>TBD as needed</code> |
| <code></code> | <code></code> |
| <code></code> | <code></code> |

### Knipper Labor Management Extensions

Retained source rows including blanks, N/A and TBD where present. Inventory entries are design evidence only; no executable extension or deployed configuration was examined.

[sdd-1c25f20de1eafc3e p112-t006](reading/sdd-1c25f20de1eafc3e.md#p112-t006)

| <code>Extension</code> | <code>Description</code> |
| --- | --- |
| <code>N/A</code> | <code></code> |

### Knipper source revision history

Removed detector-only null columns and joined printed line wraps after visual cell reconciliation.

[sdd-1c25f20de1eafc3e p118-t002](reading/sdd-1c25f20de1eafc3e.md#p118-t002)

| <code>Date</code> | <code>Changed By</code> | <code>Doc. Version</code> | <code>Notes</code> |
| --- | --- | --- | --- |
| <code>10/21/24</code> | <code>Ravishankar Suragihalli</code> | <code>1.0</code> | <code>Draft based on existing functional flow and discussions during kickoff.</code> |
| <code>11/12/2024</code> | <code>Ravishankar Suragihalli</code> | <code>1.1</code> | <code>Added Outbound flow.</code> |
| <code>12/05/2024</code> | <code>Ravishankar Suragihalli</code> | <code>1.2</code> | <code>Addressed the review comments</code> |
| <code>12/10/2024</code> | <code>Ravishankar Suragihalli</code> | <code>1.3</code> | <code>Addressed the review comments</code> |

## Knipper remaining candidate review — 2026-09-30 delta 2

All 96 previously pending candidates received a disposition after viewing 89 complete page renders. Four candidates form the three logical tables below; 92 detections are page-layout or highlighted-prose artifacts. All 219 PDF candidates are dispositioned. This does not establish the total number of raster/undetected tables or complete semantic review.

### Knipper terminology, including continued glossary

Joined all 12 page-9 rows and six page-10 continuation rows; removed detector-only columns and joined printed line wraps. The Client Terminology cell beside P&D is visibly blank and remains blank. Source wording, including tree unit, is retained. No semantic cell correction was necessary.

[sdd-1c25f20de1eafc3e p009-t002, p010-t002](reading/sdd-1c25f20de1eafc3e.md#p009-t002)

| <code>Client Terminology</code> | <code>MA Terminology</code> | <code>Definition</code> |
| --- | --- | --- |
| <code>WMS</code> | <code>SCALE</code> | <code>Supply Chain Architected for Logistics Execution warehouse management.</code> |
| <code>EDI</code> | <code>HOST / ERP</code> | <code>Knipper’ ERP system integrating with Scale</code> |
| <code>ITEM</code> | <code>ITEM</code> | <code>Item Identifier for regular inventory. For Knipper, this is item code, style, color, and size.</code> |
| <code>GTIN</code> | <code>ITEM CROSS REFERENCE</code> | <code>Global Trade Item Number. Definition of an SKU in a specific Unit of Measurement (UoM).</code> |
| <code>PURCHASE ORDER / RECEIPTS</code> | <code>RECEIPTS</code> | <code>Goods purchased by Knipper. Purchase orders and receipts have a 1:M mapping. SCALE maintains these as receipts with PO interfaced on receipt header.</code> |
| <code>TRAILER ID (IN BOUND)</code> | <code>TRAILER ID</code> | <code>A container or truck being received into the DC. One inbound trailer has one receipt.</code> |
| <code>TRACK &amp; TRACE ITEM</code> | <code>ITEM</code> | <code>Items needing tracking and traceability in SCALE for the source and valid paperwork.</code> |
| <code>ORDER</code> | <code>SHIPMENT</code> | <code>Goods to be shipped to stores, wholesale customers, or retail supermarkets. the order in ERP and shipment in scale will be a 1:1 mapping.</code> |
| <code>WAVE</code> | <code>WAVE</code> | <code>A wave represents the different steps that the system uses to retrieve orders from the pool, and process them into the outbound portion of SCALE</code> |
| <code>RUN WAVE</code> | <code>RUN WAVE</code> | <code>a group of orders when processed resulting in inventory allocation</code> |
| <code>POOL</code> | <code>POOL</code> | <code>Any orders pending processing to be shipped immediately after interface to SCALE</code> |
| <code>PICK TASK</code> | <code>WORK INSTRUCTION</code> | <code>Transaction tracked by SCALE to coordinate the movement of inventory for a variety of warehouse processes. A group of work instruction is work unit</code> |
| <code>CARTON / CASE</code> | <code>SHIPPING CONTAINER</code> | <code>An object that can be used to hold or transport inventory for a shipment.</code> |
| <code>CARTON / CASE (INBOUND)</code> | <code>RECEIVING CONTAINER</code> | <code>An object that can be used to hold or transport inventory for a receipt.</code> |
| <code>LPN</code> | <code>LOGISTICS UNIT</code> | <code>An object that can be used to hold or transport inventory. When nested, the tree unit is referred to as the parent logistics unit.</code> |
| <code></code> | <code>P&amp;D</code> | <code>Pick up and Drop location</code> |
| <code>ODWS</code> | <code>ODWS</code> | <code>Override Data Wave Step. SCALE provides a wave step that allows performing crud operation to data during the wave process.</code> |
| <code>EXIT POINT</code> | <code>EXIT POINT</code> | <code>An external process that performs logic in line with the base process. Used to update data or perform additional logic.</code> |

### Knipper receipt download: current typical ASN/returns format

Two data rows retained. Removed the detector-only third column. The surrounding body calls this the typical header/detail format for ASNs and returns; automated downloads apply to EDI accounts. Display labels are not verified SQL object names.

[sdd-1c25f20de1eafc3e p012-t002](reading/sdd-1c25f20de1eafc3e.md#p012-t002)

| <code>SCALE Table</code> | <code>Description</code> |
| --- | --- |
| <code>Receipt Order Header</code> | <code>Header Level Receipt Data</code> |
| <code>Receipt Order Detail</code> | <code>Line Item Detail Receipt Data</code> |

### Knipper receipt download: future container-level possibility

Three data rows retained. The immediately preceding paragraph says Knipper may explore this container-level format in future. It is not the current typical header/detail design, and not an observed deployed interface.

[sdd-1c25f20de1eafc3e p012-t003](reading/sdd-1c25f20de1eafc3e.md#p012-t003)

| <code>SCALE Table</code> | <code>Description</code> |
| --- | --- |
| <code>Receipt Order Header</code> | <code>Header Level Receipt Data</code> |
| <code>Receipt Order Detail</code> | <code>Line Item Detail Receipt Data</code> |
| <code>Receipt Container</code> | <code>Box level Receipt Data</code> |

# AIM process documentary review

All 62 retained process-summary bodies across 34 families were read, and all 53 captured image references were visually inspected. Fifty are substantive figures; three reference one transparent UI asset. The review adds 130 source-bound refinements. No deployment reconciliation or application execution is claimed.

The [machine-readable review](mappings/process-documentary-review.json) contains exact original, article JSON, node-subtree and image hashes, per-family denominators, stable refinement IDs, preserved introductory reviews and integration fragments. Reading-copy links open the article; the listed node IDs identify its retained content-tree passages. They are not fabricated browser fragment anchors.

| Measure | Reviewed / retained |
| --- | --- |
| Families | 34 / 34 |
| Article bodies | 62 / 62 |
| Image references | 53 / 53 |
| Substantive figures | 50 / 50 |
| Decorative references | 3 / 3 |
| Unique image assets | 51 |
| Unavailable captured images | 0 |
| Full deployment reconciliations | 0 |

Review scope: complete retained body text was read in normalized block order, including table cell text and two supplementary direct-text passages. Local figure assets were viewed. Original HTML/CSS render fidelity, related-topic bodies, operational configuration, installed application behavior and end-to-end runtime remain outside this review. Only the authored refinements below are curated conclusions; body coverage does not automatically approve every source statement.

Source conflicts are preserved in the affected families, including LTL example rates/calculation order, cycle-count branches and quantity timing, QC wording, Dock assignment phases, Wave paperwork and Work Order allocation/location wording. Production indexing remains disabled for this new derived review. No acquisition retry was performed.

## Allocation

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Allocation chooses which storage locations will supply a request for product. Work creation then turns the allocated quantity into warehouse tasks.

**Initiation.** The allocation step runs in a wave before work creation.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-allocation-r01 — stages.** Shipment priority ordering precedes rule selection: shipment line, then item, then \*Default. Convert quantities using the item or applicable item-class UOM record, then process numbered rule sequences.

[Allocation Process Summary: Process Flows](../AIM/reading/07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5.md) — n72, n74, n81, n84, n87, n90, n95, n99, n102, n105, n108, n120; article `07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5`; original SHA-256 `1bcf2c300a45a9958203effd20ec808ae8f3e6d3a692e6430e2689666ea84642`.

**process-documentary-allocation-r02 — configuration.** Allocation combines immutable eligibility checks with optional location filters and strategy ordering. Available quantity subtracts allocated and suspense quantities; allowing in-transit allocation adds in-transit quantity. A blank location UOM list permits all UOMs.

[Allocation Process Summary: Process Flows](../AIM/reading/07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5.md) — n123, n128, n129, n183, n186, n198, n212, n217; article `07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5`; original SHA-256 `1bcf2c300a45a9958203effd20ec808ae8f3e6d3a692e6430e2689666ea84642`.

**process-documentary-allocation-r03 — outcomes errors.** Partial allocation creates requests for fulfilled quantities and tries later sequences. Exhausted rules invoke shipment-splitting and rejection/pool behavior governed by status actions; allocate-complete can reject an entire shipment. The figure labels exhaustion status 999, while prose gives richer status-action branches.

[Allocation Process Summary: Process Flows](../AIM/reading/07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5.md) — n230, n239, n242, n246, n250, n253, n256, n285, n66; article `07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5`; original SHA-256 `1bcf2c300a45a9958203effd20ec808ae8f3e6d3a692e6430e2689666ea84642`.

[Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md) — n210; article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`; original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`.

**process-documentary-allocation-r04 — configuration.** Closest Match orders location-inventory records, not summed physical-location totals. Over-allocation from permanent assignments is restricted to shipment allocation, non-LP locations and non-lot items. Thread count is controlled by Technical Values.

[Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md) — n109, n125, n129, n195, n205; article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`; original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`.

**process-documentary-allocation-figure-00 — substantive figure.** The vertical allocation flow orders wave lines, chooses a rule using line -&gt; item -&gt; default fallback, converts quantity, and iterates rule sequences. Selection and strategy branches converge on allocation. Success advances the line/wave; shortage tries another sequence, and exhaustion shows status 999. This simplified figure does not show all prose rejection/status-action variants.

[Allocation Process Summary: Process Flows](../AIM/reading/07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5.md) — n66; article `07389991e41715f41b06fe903bb2e10d79c84341d24367dfa9f5cdc93288f9c5`; original SHA-256 `1bcf2c300a45a9958203effd20ec808ae8f3e6d3a692e6430e2689666ea84642`.

[Local asset](../AIM/source/assets/d79bdc7107e7372313f27a384b3a3332c2dce13c7eca57b79108903724d50288.gif) — SHA-256 `d79bdc7107e7372313f27a384b3a3332c2dce13c7eca57b79108903724d50288`; 793 × 2161 pixels.

**Application/database gap.** Reconcile rule fallback, in-transit eligibility and rejection/status actions with the actual application-to-SQL boundary; status 999 in the figure is not the whole shortage policy.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Billing Management Integration

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** The documented integration sends SCALE data to a separate Billing Management application so warehouse work can support third-party charges.

**Initiation.** A configured integration uploads SCALE data to Billing Management.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-billing-management-integration-r01 — initiation.** A configured event such as load confirmation triggers processing; manual triggers are also possible. The vendor source describes Billing Management as a separate product and requires SQL Server for this integration.

[Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md) — n65, n80, n82, n85, n93, n95, n115; article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`; original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`.

**process-documentary-billing-management-integration-r02 — stages.** The active trigger header identifies a root detail with no parent; its data query is mapped into XML, then child details are traversed. Process history records trigger success/failure and output goes to the configured directory for later pickup.

[Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md) — n95, n97, n99, n101, n103, n105, n107; article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`; original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`.

**process-documentary-billing-management-integration-r03 — configuration.** Inline trigger records need a corresponding coded event check; defining a record alone does not create a new trigger point. Manual triggers still require appropriate SQL and the target XML schema.

[Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md) — n113, n115; article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`; original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`.

**process-documentary-billing-management-integration-figure-41 — substantive figure.** The diagram shows normal SCALE processing continuing across the trigger. A side path places data in a SCALE upload directory; Billing Management retrieves it when its user performs an action requiring SCALE data. It depicts asynchronous file exchange, not a shared application or direct database call.

[Billing Management Integration Process Summary: Process Flows](../AIM/reading/93b67a5e861866a83006663aa86b2dc1260d4b60f07e573a2a274b5380c5e1d4.md) — n66; article `93b67a5e861866a83006663aa86b2dc1260d4b60f07e573a2a274b5380c5e1d4`; original SHA-256 `57e5da667130e38ea48c2ab829af634768d99040e1b1e9b97e16dfdb692ed1f1`.

[Local asset](../AIM/source/assets/0a03b3fe100e8a453c4174971a188027c582addcb58ddbba3f32eb93dd98a5e5.gif) — SHA-256 `0a03b3fe100e8a453c4174971a188027c582addcb58ddbba3f32eb93dd98a5e5`; 676 × 457 pixels.

**Application/database gap.** Separate XML file creation from Billing Management pickup, processing and acknowledgment; the trigger definition alone does not supply a coded inline event.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Carrier Management

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Carrier management controls carrier selection and shipping rules. Routing guides, shipping calendars and estimated container counts can affect the available shipping choices.

**Initiation.** Carrier assignment or rating during outbound processing.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-carrier-management-r01 — initiation.** Routing runs from a wave for all included shipments or from Shipment Insight for a selected unassigned shipment. Interactive rate shopping is separate and excludes in-process waves and ship-confirmed shipments.

[Carrier Management Process Summary: Process Flows](../AIM/reading/4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659.md) — n73, n75, n78; article `4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659`; original SHA-256 `e8a2413271c15282dc425f8ad5bd92e9b6cd216a36babefc1a7c26219a172550`.

[Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md) — n205, n207, n209; article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`; original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`.

**process-documentary-carrier-management-r02 — stages.** Eligible routing guides are ordered by customer/ship-to and routing code, then lowest priority number for ties. A guide chooses a carrier or a carrier group; commitment and date/postal support filter group members before rating engines return rates.

[Carrier Management Process Summary: Process Flows](../AIM/reading/4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659.md) — n80, n82, n90, n102, n148, n152, n155, n165, n169, n175, n178, n181, n184, n186, n195, n200, n203; article `4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659`; original SHA-256 `e8a2413271c15282dc425f8ad5bd92e9b6cd216a36babefc1a7c26219a172550`.

**process-documentary-carrier-management-r03 — outcomes errors.** Parcel manifesting can follow packing/closing or a manual request. Manifest state distinguishes blank, Error, Manifested and Closed; remanifesting is permitted until closure, after which containers cannot be changed or removed.

[Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md) — n159, n161, n163, n167, n169, n172, n175, n178; article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`; original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`.

**process-documentary-carrier-management-r04 — configuration.** The diagram includes Use Rating in Selection: its No branch chooses best delivery days. This qualifier should accompany simplified cheapest-carrier explanations. Progistics/FedEx architecture details are retained vendor-era descriptions, not evidence of current deployed services.

[Carrier Management Process Summary: Process Flows](../AIM/reading/4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659.md) — n66; article `4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659`; original SHA-256 `e8a2413271c15282dc425f8ad5bd92e9b6cd216a36babefc1a7c26219a172550`.

[Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md) — n97, n101, n105; article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`; original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`.

**process-documentary-carrier-management-figure-11 — substantive figure.** White initiation boxes split wave routing from a user-selected shipment. Blue boxes filter and organize guides, choose a fitting guide, then branch single carrier versus carrier group. Use Rating in Selection branches to rating IDs or best delivery days. Progistics, FedEx, internal LTL and custom rating paths converge on carrier/rate assignment. The diagram adds a delivery-days branch not explicit in the adjacent numbered prose.

[Carrier Management Process Summary: Process Flows](../AIM/reading/4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659.md) — n66; article `4f356b32ad2ac2eb79097e963385c7d8c2904bd465c065373343b4dea5f47659`; original SHA-256 `e8a2413271c15282dc425f8ad5bd92e9b6cd216a36babefc1a7c26219a172550`.

[Local asset](../AIM/source/assets/7235b356eaa8245c3eb1c04c12348a5ab8c171ae404da00166e555e4c2f51955.gif) — SHA-256 `7235b356eaa8245c3eb1c04c12348a5ab8c171ae404da00166e555e4c2f51955`; 1135 × 2377 pixels.

**Application/database gap.** Resolve rating-enabled versus best-delivery-days selection and the installed engine/manifest-close contract before applying the historical carrier integrations.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Container Creation in the Wave

Bodies: 2/2; images: 9/9 (9 substantive, 0 decorative).

**User goal.** A wave can create shipping containers for allocated line quantities. A container strategy determines how those quantities are combined or split.

**Initiation.** The container-creation wave step executes.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-container-creation-in-the-wave-r01 — initiation.** Container creation is a wave step after allocation, with four named strategies: Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, and 3D Cubing.

[Container Creation in the Wave Process Summary: Functionality](../AIM/reading/ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780.md) — n65; article `ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780`; original SHA-256 `bf4db6f7da1b69fb0d340568d3638f92ca64c2a646be9f5f2f756715e2983c15`.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n90, n94; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

**process-documentary-container-creation-in-the-wave-r02 — stages.** Create full-UOM containers first unless Treat as Loose applies; then sort loose quantities by packing class and criteria ordering. Packing class comes from the shipment line or \*Default, and determines the container group.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n99, n101, n103, n105, n107, n114, n119, n121, n123; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

**process-documentary-container-creation-in-the-wave-r03 — configuration.** Usable container volume includes fill percent. Stabilization adds padding on both sides of each dimension. 3D cubing tries Same Pack, Default Pack, Two-Item Pack and Three-Item Pack in order, stopping at success; fixed orientation or nonstackability can invoke 2D packing.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n158, n160, n162, n164, n166, n168, n170, n183, n186, n199, n282, n284, n286, n288, n290, n292, n538, n540; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

**process-documentary-container-creation-in-the-wave-r04 — outcomes errors.** An invalid default stabilization code falls back to zero and logs process history. The source expressly does not support creating wave containers from allocation requests and later RF picking/putaway into those existing shipping containers because the work cannot be linked.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n129, n250, n262, n274; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

**process-documentary-container-creation-in-the-wave-figure-16 — substantive figure.** A wave runs preceding steps, then container creation splits full-UOM containers from loose quantities. Full containers receive IDs; loose quantities are ordered, assigned an explicit or default packing class, and passed to rotation/creation strategies.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n86; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/9815c43d168ef392af5165004998cde6ceff99e22ff63b97f3869af43811b193.gif) — SHA-256 `9815c43d168ef392af5165004998cde6ceff99e22ff63b97f3869af43811b193`; 367 × 1174 pixels.

**process-documentary-container-creation-in-the-wave-figure-17 — substantive figure.** A wireframe container holds a small first item in its lower front/right corner, establishing the residual-space example.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n383; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/ad0fcd08b36095a1966160e0a50b51c6ba916460a37910313948c6be741ba38a.gif) — SHA-256 `ad0fcd08b36095a1966160e0a50b51c6ba916460a37910313948c6be741ba38a`; 198 × 184 pixels.

**process-documentary-container-creation-in-the-wave-figure-18 — substantive figure.** Red dotted lines highlight the residual cuboid to the left of the first item.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n389; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/0ad6266898f7785f5c6828b5f00c2fb001cb4b6951b847e1f6efc6a8b5e76592.gif) — SHA-256 `0ad6266898f7785f5c6828b5f00c2fb001cb4b6951b847e1f6efc6a8b5e76592`; 172 × 172 pixels.

**process-documentary-container-creation-in-the-wave-figure-19 — substantive figure.** Red dotted lines highlight the residual cuboid above the first item.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n393; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/620501e8202b2e73fb84db0fe1bed7de1719c6a00849b1ecf6419111c8c1001d.gif) — SHA-256 `620501e8202b2e73fb84db0fe1bed7de1719c6a00849b1ecf6419111c8c1001d`; 172 × 171 pixels.

**process-documentary-container-creation-in-the-wave-figure-20 — substantive figure.** Red dotted lines highlight the residual cuboid behind the first item.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n397; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/609918297fd018235c84fda780df8d338a7261360d576ca97dc0c9979d2cf7d4.gif) — SHA-256 `609918297fd018235c84fda780df8d338a7261360d576ca97dc0c9979d2cf7d4`; 173 × 171 pixels.

**process-documentary-container-creation-in-the-wave-figure-21 — substantive figure.** A second blue-labeled item sits beside the first item along the container floor.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n417; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/3797a9a69caf4f2c1a2112d65206fe70340bb380f93f472af1584102d91d9cd4.gif) — SHA-256 `3797a9a69caf4f2c1a2112d65206fe70340bb380f93f472af1584102d91d9cd4`; 172 × 174 pixels.

**process-documentary-container-creation-in-the-wave-figure-22 — substantive figure.** A red residual region extends above and behind the two placed items; it illustrates the first candidate cuboid after the second placement.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n422; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/cd5dee14879ec601acbf1ddf7fe00a36052dce769eefa66e0e0f34cef0c830cf.gif) — SHA-256 `cd5dee14879ec601acbf1ddf7fe00a36052dce769eefa66e0e0f34cef0c830cf`; 177 × 178 pixels.

**process-documentary-container-creation-in-the-wave-figure-23 — substantive figure.** A red horizontal region above the placed items illustrates the second candidate cuboid.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n426; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/6f97d18aa585802480d4c66dd4566b16cb402fe8effbdc2220d6fe8badac874d.gif) — SHA-256 `6f97d18aa585802480d4c66dd4566b16cb402fe8effbdc2220d6fe8badac874d`; 175 × 174 pixels.

**process-documentary-container-creation-in-the-wave-figure-24 — substantive figure.** A top view shows Item1 and Item2 in two horizontal rows within a rectangular footprint labeled width 5 and length 2. It illustrates an orientation example, not a validated packing result for this deployment.

[Container Creation in the Wave Process Summary: Process Flows](../AIM/reading/58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb.md) — n491; article `58b174b614d3d98ce179aa9b0caea4e04491798b8bb583ec3c58787a502560eb`; original SHA-256 `26e6d6bc2e491b3c9b398e9dc25ac291faae817df10c56f25f22e37c7e2d4f6c`.

[Local asset](../AIM/source/assets/56f46de20b21337f82b33ab8a5391313f697a1543ab3cee92ecc4381eb1ae220.gif) — SHA-256 `56f46de20b21337f82b33ab8a5391313f697a1543ab3cee92ecc4381eb1ae220`; 434 × 174 pixels.

**Application/database gap.** Resolve the selected cubing strategy, dimensional units, stabilization and work-to-container binding; geometric examples do not validate packing for any actual item.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Cycle Counting

Bodies: 2/2; images: 3/3 (3 substantive, 0 decorative).

**User goal.** Cycle counting compares a physical count at a location with the quantity recorded by SCALE. It can start from a count plan or from activity that makes a location due for counting.

**Initiation.** A user creates a count plan, or the system creates activity-driven count instructions.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-cycle-counting-r01 — initiation.** Counts originate from reusable master plans, one-time quick plans, or location activity. Plans may be scheduled; activity counts are immediate only when preferences and work execution allow it.

[Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md) — n66, n86, n94, n99, n104, n106; article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`; original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n148, n214, n216; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

**process-documentary-cycle-counting-r02 — stages.** Requests identify location/item/company/lot/LP, not a frozen quantity. In-transit-only inventory is treated as absent for request creation. Duplicate pending requests suppress new requests at the location; inactive locations are excluded while frozen locations can be counted.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n78, n81, n94, n100, n107, n110, n140; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

**process-documentary-cycle-counting-r03 — configuration.** Create-work choices determine RF/work execution versus paperwork. Immediate Reconcile of Bad Count and tolerance Min/Max govern automatic adjustment or Pending Review. Plan execution is complete only after open requests and pending reconciliations are resolved.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n138, n146, n148, n186, n188, n190, n193, n195, n200, n249, n251, n253; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

**process-documentary-cycle-counting-r04 — outcomes errors.** Standard counts do not prompt for catch weight; within-tolerance adjustment uses average weight, while blind count prompts and distinguishes new versus existing inventory. The LP diagram adds recount, added-LP review and uncounted-LP checks. LP diagram quantity-timing wording differs from general prose, so exact On Hand/Suspense timing needs reconciliation.

[Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md) — n115, n119, n120, n121, n124, n125, n126, n129; article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`; original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n188, n251, n267; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

**process-documentary-cycle-counting-r05 — source exception.** The plan-based diagram labels both final more-counts branches No, although one ends execution and the other displays the next count. The activity-driven diagram supplies the expected Yes/No split; the plan-based label ambiguity is not silently corrected.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n127, n209; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

**process-documentary-cycle-counting-figure-31 — substantive figure.** The two-part diagram separates green plan creation from orange execution. Master/quick plans generate requests and branch to work or paperwork. Released work supports current/new-item counting; mismatches branch through immediate-reconcile and tolerance checks to automatic adjustment or supervisor reconciliation. The new-item side path includes tolerance and single-item-location checks.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n127; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

[Local asset](../AIM/source/assets/be6c6ff663fe6ffb8ec08caf6bbb4509aa36ad333952c1d22c88adcb5487ed08.gif) — SHA-256 `be6c6ff663fe6ffb8ec08caf6bbb4509aa36ad333952c1d22c88adcb5487ed08`; 1585 × 3600 pixels.

**process-documentary-cycle-counting-figure-32 — substantive figure.** A warehouse action triggers a request. Perform Threshold Counts Immediately and work-profile eligibility determine immediate RF counting versus a queued request. Counting then branches current/new item, equal/different quantity, immediate reconciliation and tolerance, before continuing or ending.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n209; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

[Local asset](../AIM/source/assets/a7bd4415a2c0fc64139c3a6d2effdb6960debeb61de6065f741c9384973bc38a.gif) — SHA-256 `a7bd4415a2c0fc64139c3a6d2effdb6960debeb61de6065f741c9384973bc38a`; 1421 × 2439 pixels.

**process-documentary-cycle-counting-figure-33 — substantive figure.** The LP flow first chooses LP count versus unit count; a mismatched LP count falls back to units. The user or system identifies each LP. Unknown LPs can be added or discarded; zero counts require empty-location confirmation, differences can require recount, and tolerances govern review. On completion, uncounted LPs raise an error/continue-or-leave choice. Its pending-review inventory wording is not identical to the general count prose.

[Cycle Counting Process Summary: Process Flows](../AIM/reading/71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7.md) — n267; article `71e9cfa8294b965b70be00b564408c726a41da70ba6c002fe00adf6da5a0b3f7`; original SHA-256 `d05f4f0190606071e751dceb589edcc1a8f5ad4a0c52ac3fb73c8b6f33ccaed2`.

[Local asset](../AIM/source/assets/c34519734733005dee92b591a68c7d8344bb359df39bf017aca25cb1352456aa.gif) — SHA-256 `c34519734733005dee92b591a68c7d8344bb359df39bf017aca25cb1352456aa`; 746 × 2330 pixels.

**Application/database gap.** Reconcile LP-specific pending-review quantity timing with general counting prose and application transaction behavior; clarify ambiguous diagram branch labels.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Device Integration Framework

Bodies: 2/2; images: 2/2 (2 substantive, 0 decorative).

**User goal.** The Device Integration Framework connects SCALE with automation equipment, such as conveyors or pick-to-light systems. It exchanges messages; a received file alone does not prove the requested warehouse action finished.

**Initiation.** Equipment exchanges messages, or files arrive for a configured transfer process.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-device-integration-framework-r01 — stages.** Incoming TCP messages pass through the communication service into DIF\_INCOMING\_MESSAGE, then the processing service dispatches the configured custom API or IDiFAPI event execution path. A heartbeat is acknowledged without the ordinary table-write path.

[Device Integration Framework Process Summary: Process Flows](../AIM/reading/3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59.md) — n78, n80, n82, n85, n86, n88, n89, n90; article `3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59`; original SHA-256 `9253645e239f3650e4baf0693ca0bb1fa0bcb16592bc64285c07aa1321b38c28`.

**process-documentary-device-integration-framework-r02 — configuration.** File transfer is incoming-only. From directory/extension, polling sleep, rename/move and Insert Message determine whether a file becomes an incoming-message record. A separate Web API path is described for MHE submissions.

[Device Integration Framework Process Summary: Process Flows](../AIM/reading/3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59.md) — n96, n99, n102, n107, n109, n110, n112; article `3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59`; original SHA-256 `9253645e239f3650e4baf0693ca0bb1fa0bcb16592bc64285c07aa1321b38c28`.

[Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md) — n118, n122, n126, n130, n134, n138, n182; article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`; original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`.

**process-documentary-device-integration-framework-r03 — outcomes errors.** Incoming persistence success/failure determines ACK/NAK when enabled. Outgoing messages are read from DIF\_OUTGOING\_MESSAGE and retried a configured number of times; missing configured heartbeat ACK shuts the endpoint down and writes history. Insight screens support manual error reset.

[Device Integration Framework Process Summary: Process Flows](../AIM/reading/3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59.md) — n85, n125, n127, n129, n132, n135, n136; article `3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59`; original SHA-256 `9253645e239f3650e4baf0693ca0bb1fa0bcb16592bc64285c07aa1321b38c28`.

[Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md) — n111, n146, n152, n164; article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`; original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`.

**process-documentary-device-integration-framework-figure-08 — substantive figure.** MHE sends through an endpoint/TCP-configured communication service into DIF\_INCOMING\_MESSAGE. The processing service can call a Custom API or the lower IDiFAPI route: event definition, DC ID, dynamic event execution identifier and web-service endpoint lead into SCALE. ACK/NAK returns to MHE.

[Device Integration Framework Process Summary: Process Flows](../AIM/reading/3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59.md) — n76; article `3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59`; original SHA-256 `9253645e239f3650e4baf0693ca0bb1fa0bcb16592bc64285c07aa1321b38c28`.

[Local asset](../AIM/source/assets/a4dede0cbe7be8494d1ff90a7144dc391631728f6ddaa20f63da3d3471536dfb.gif) — SHA-256 `a4dede0cbe7be8494d1ff90a7144dc391631728f6ddaa20f63da3d3471536dfb`; 1112 × 686 pixels.

**process-documentary-device-integration-framework-figure-09 — substantive figure.** SCALE passes an outgoing message through an exit point into DIF\_OUTGOING\_MESSAGE. The communication service uses endpoint/event configuration and branches through HTTP/web-service or TCP handlers toward MHE, with an acknowledgment return. This establishes documentary boundaries, not a validated integration.

[Device Integration Framework Process Summary: Process Flows](../AIM/reading/3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59.md) — n123; article `3c63bdf0272ec9766ff0f09ad26edf86b80acc7a3e3ca5d322c6845dbf3b9d59`; original SHA-256 `9253645e239f3650e4baf0693ca0bb1fa0bcb16592bc64285c07aa1321b38c28`.

[Local asset](../AIM/source/assets/f88f5f9194a19b27a6e22fd9ae07b64757ae12c63d86038802197c6d67cd6b13.gif) — SHA-256 `f88f5f9194a19b27a6e22fd9ae07b64757ae12c63d86038802197c6d67cd6b13`; 1072 × 725 pixels.

**Application/database gap.** Bind custom/IDiFAPI handlers, durable incoming persistence and ACK/NAK semantics separately from outgoing retry/heartbeat state; no live endpoint is established.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Dock Management

Bodies: 2/2; images: 3/3 (3 substantive, 0 decorative).

**User goal.** Dock management tracks containers through packing-area consolidation, staging and truck loading. These stages use distinct inventory-tracked locations and can be enabled separately.

**Initiation.** Shipment containers reach the outbound dock area.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-dock-management-r01 — stages.** Dock handling separates consolidation near packing, staging after container close, and loading into dock-door locations. Each area may have positions. The assignment strategy orders areas with positions, areas without positions, then positions; a closed position falls back to its parent area.

[Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md) — n65, n76, n78, n83, n90, n98; article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`; original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n73, n75, n77, n79, n81, n83, n84; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

**process-documentary-dock-management-r02 — configuration.** Create Next Move controls work creation at close-container/RF-putaway decisions for packing/staging subclasses. Immediate RF transfers require no open/in-process container work and the relevant next-move setting disabled.

[Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md) — n113, n115, n117, n119, n123; article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`; original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`.

**process-documentary-dock-management-r03 — outcomes errors.** The assignment diagram distinguishes missing flow header from missing detail: allocation can fail back to pool with process history when no header exists, while default-location fallbacks handle other branches. During dock assignment a missing header retains the prior allocation location. These figure-specific outcomes must not be merged into a single universal fallback.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n65; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

**process-documentary-dock-management-r04 — configuration.** Dock-door assignment excludes doors assigned to open loads. The composite figure distinguishes actual assignment/reassignment, which adjusts inventory and creates work, from preassignment, which marks a future location. RF Immediate Dock Transfer is explicitly a no-next-work path.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n92, n93, n100; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

**process-documentary-dock-management-figure-01 — substantive figure.** The tall diagram separates dock assignment during Allocation from the later Dock Assignment wave step. Flow header/detail and status checks choose defaults or selection/assignment strategies. Missing-header branches differ between phases. Side panels describe carrier-based selection and shipment anchoring, and require Container Creation/Pallet Building before Dock Assignment and Work Creation after it when those steps are used.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n65; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

[Local asset](../AIM/source/assets/13758c4da99b2608f29fa8a834dfdf8e4703e10b6a02950b21678f3594bef6fa.gif) — SHA-256 `13758c4da99b2608f29fa8a834dfdf8e4703e10b6a02950b21678f3594bef6fa`; 1582 × 3845 pixels.

**process-documentary-dock-management-figure-02 — substantive figure.** A dock-layout illustration traces three inbound paths: receiving cross-dock, put-to-store, and inventory consolidation. Paths may visit packing, staging or dock doors; pack-and-hold is a separate staging detour needing a later manual transfer. Numbered areas are examples, not warehouse configuration.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n97; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

[Local asset](../AIM/source/assets/1c5bb67c638f2163fd1145a227695c3fac120b32436798d4593432ab826d5c7a.gif) — SHA-256 `1c5bb67c638f2163fd1145a227695c3fac120b32436798d4593432ab826d5c7a`; 3368 × 1199 pixels.

**process-documentary-dock-management-figure-03 — substantive figure.** The composite has consolidation, dock-location types, Dock Manager transfer, next-move creation, and RF Immediate Dock Transfer sections. It distinguishes preassignment from a physical/system transfer, validates top-level containers, blocks RF immediate transfer when work is open/in process, and shows load/dock-door defaults. Packing-area and consolidation inventory-tracking descriptions are different; do not treat all dock-area types as equivalent.

[Dock Management Process Summary: Process Flows](../AIM/reading/0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918.md) — n100; article `0c77698ccfe7d7e04d05ab3b30be92ac8b6430702a653276c2e4e15a459fe918`; original SHA-256 `9f25bd0d3f5ebfd1d5d21b7e94585ad9a691e24740873b5cdae221c60887c536`.

[Local asset](../AIM/source/assets/d6cec0d632be7890f208fc2ddde444318bb868ad75b6cbd13d13a83302e7423e.gif) — SHA-256 `d6cec0d632be7890f208fc2ddde444318bb868ad75b6cbd13d13a83302e7423e`; 3168 × 3387 pixels.

**Application/database gap.** Distinguish allocation-time default assignment, later dock assignment, preassignment and physical transfer; missing flow header has phase-specific outcomes.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## GS1 Barcode

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** A GS1 barcode can carry several data elements, such as an item, quantity or lot. SCALE uses application-identifier templates to interpret those elements; the template may be associated with a receiving preference.

**Initiation.** A barcode is interpreted during a supported process; label creation can occur in a wave or when closing a container.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-gs1-barcode-r01 — initiation.** Inbound RF receiving scans labels containing multiple application identifiers, rather than a single item identifier; outbound GS1 labels can print from the wave or close-container process.

[GS1 Barcode Process Summary: Functionality](../AIM/reading/5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069.md) — n64, n66, n83, n93; article `5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069`; original SHA-256 `56aefab9a84d3879c034c2d09a2f71c62781a1cbd314d2c38c6254e205c88c6c`.

**process-documentary-gs1-barcode-r02 — configuration.** A receiving-preference AI template specifies scan count, segment order and manual verification. It controls inbound parsing, not the physical layout of an outbound label; generic outbound labels are customization starting points.

[GS1 Barcode Process Summary: Functionality](../AIM/reading/5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069.md) — n85, n93; article `5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069`; original SHA-256 `56aefab9a84d3879c034c2d09a2f71c62781a1cbd314d2c38c6254e205c88c6c`.

**Application/database gap.** Separate inbound AI-template parsing and manual verification from outbound label rendering, scanner behavior and current standards compliance.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## General System Concepts

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Warehouse, company and user setup provide the context for SCALE activity. A warehouse identifies where transactions occur, while user profiles and security records influence access.

**Initiation.** An authorized user opens a function in a configured warehouse.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-general-system-concepts-r01 — configuration.** Every transaction is associated with a warehouse and at least one warehouse is required. Multi-company distribution is optional; source instructions distinguish defining two or more companies from leaving company setup unused.

[General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md) — n76, n81; article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`; original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`.

**process-documentary-general-system-concepts-r02 — stages.** A user profile supplies preferences and access authorization. On window access the documented precedence checks user-level security records first and otherwise system-level security. Relaxed and highly restrictive approaches are configuration choices.

[General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md) — n86, n91, n93, n95, n97, n100, n104, n107; article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`; original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`.

**process-documentary-general-system-concepts-r03 — outcomes errors.** The article describes a permissive default security posture, but that statement is vendor documentation, not evidence of this deployment&#x27;s current permissions. Access behavior and effective overrides require separate application configuration evidence.

[General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md) — n91, n93, n97, n100; article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`; original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`.

**Application/database gap.** Reconcile user-level and system-level security resolution with installed application authorization; a documented permissive default is not a permission finding.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Immediate Needs

Bodies: 2/2; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Immediate needs record product that cannot yet fulfill a shipment, work order, replenishment or short pick. Newly received stock can then be allocated to fill that shortage.

**Initiation.** A supported request cannot be completely fulfilled.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-immediate-needs-r01 — initiation.** Configured shortage triggers can log needs from shipment allocation, short picks, replenishment allocation and work-order component allocation. Trigger activation and item eligibility are required; Add BOM Component Lines components/finished items are excluded.

[Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md) — n65, n111, n114, n117, n120; article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`; original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`.

[Immediate Needs Process Summary: Process Flows](../AIM/reading/d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a.md) — n84, n94; article `d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a`; original SHA-256 `d24d4130079d72ae7d97a0aabc30d08de28cce36366e9e0016a6b142fe94105e`.

**process-documentary-immediate-needs-r02 — stages.** Receipt locating checks validity, removes stale requests, and uses new inventory to fulfill needs. A whole LP for one need may cross-dock; put-to-store needs can split child containers; residual quantity uses normal locating.

[Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md) — n90, n93, n96, n105; article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`; original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`.

[Immediate Needs Process Summary: Process Flows](../AIM/reading/d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a.md) — n98, n100, n102, n118, n135; article `d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a`; original SHA-256 `d24d4130079d72ae7d97a0aabc30d08de28cce36366e9e0016a6b142fe94105e`.

**process-documentary-immediate-needs-r03 — configuration.** Immediate-needs locating rule precedence is shipment line, system default, then original LP location/rule; after assignment another rule is not attempted. Putaway-group membership independently determines group fulfillment and residual putaway.

[Immediate Needs Process Summary: Process Flows](../AIM/reading/d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a.md) — n143, n145, n147, n150, n153, n155, n171, n175; article `d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a`; original SHA-256 `d24d4130079d72ae7d97a0aabc30d08de28cce36366e9e0016a6b142fe94105e`.

**process-documentary-immediate-needs-r04 — outcomes errors.** Locate By Parent does not fulfill immediate needs. Work-order build locations are prohibited for immediate-needs allocation. Request priority orders competing needs for the same item, and fulfilled requests close/disappear from the viewer.

[Immediate Needs Process Summary: Process Flows](../AIM/reading/d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a.md) — n138, n159, n162, n268; article `d4f3a4f49417bd0ab4a8a95ce5e4cfc8040e007b1b978b60d44bea3372b0056a`; original SHA-256 `d24d4130079d72ae7d97a0aabc30d08de28cce36366e9e0016a6b142fe94105e`.

[Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md) — n67, n69; article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`; original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`.

**Application/database gap.** Bind trigger/item eligibility, request priority, parent/child handling and locating-rule fallback to the active receiving/application path.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Interface

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Interfaces exchange records between SCALE and an order system. A job can be started manually or by a schedule, and one failed file does not necessarily stop other files from being processed.

**Initiation.** A manual or scheduled upload/download starts.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-interface-r01 — initiation.** Users or scheduled jobs initiate uploads/downloads. File processing orders files by modification time, while records within a file retain file order. ERP is a documentary placeholder for the sending/receiving system.

[Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md) — n66; article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`; original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`.

[Interface Process Summary: Process Flows](../AIM/reading/ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3.md) — n69, n82, n112, n131; article `ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3`; original SHA-256 `3e1fa33b9615e7e2c0471912c2827fbbb9ccd829e8e564c8b6c168b872f4a67f`.

**process-documentary-interface-r02 — stages.** Delimited/fixed-length/direct input is prepared as legacy XML; XML input is already in the required format. Before/after custom steps surround business processing. Direct mode uses transfer tables before valid records reach production tables.

[Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md) — n118, n122; article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`; original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`.

[Interface Process Summary: Process Flows](../AIM/reading/ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3.md) — n76, n78, n95, n98, n106, n110, n114, n120; article `ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3`; original SHA-256 `3e1fa33b9615e7e2c0471912c2827fbbb9ccd829e8e564c8b6c168b872f4a67f`.

**process-documentary-interface-r03 — configuration.** Process records control data type, transaction cap and file extension. Upload criteria restrict eligible records; output directory precedence is process detail then interface system value. Record IDs must be unique across headers and details.

[Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md) — n145; article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`; original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`.

[Interface Process Summary: Process Flows](../AIM/reading/ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3.md) — n85, n137, n150, n155; article `ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3`; original SHA-256 `3e1fa33b9615e7e2c0471912c2827fbbb9ccd829e8e564c8b6c168b872f4a67f`.

**process-documentary-interface-r04 — outcomes errors.** Download creates success/process and error XML files plus history/alerts. Failure in one file does not prevent other files from processing. This does not establish per-record transaction atomicity, retry idempotence or the deployed custom ERP parser.

[Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md) — n68; article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`; original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`.

[Interface Process Summary: Process Flows](../AIM/reading/ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3.md) — n116, n118, n161; article `ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3`; original SHA-256 `3e1fa33b9615e7e2c0471912c2827fbbb9ccd829e8e564c8b6c168b872f4a67f`.

**process-documentary-interface-figure-52 — substantive figure.** The diagram separates download and upload. Download branches file input versus transfer tables, converges at user/scheduled initiation, converts non-XML input, and runs custom before/after steps around SCALE rules. Upload selects eligible data and branches output directory versus transfer table for ERP custom pickup. History, alerts and error files appear at both boundaries.

[Interface Process Summary: Process Flows](../AIM/reading/ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3.md) — n66; article `ff9dff8815dd0430808523fa60275e20a08e169d0544515beb1c9909c27bdea3`; original SHA-256 `3e1fa33b9615e7e2c0471912c2827fbbb9ccd829e8e564c8b6c168b872f4a67f`.

[Local asset](../AIM/source/assets/f9f33e0a7737a25bc555cafdf49da99e661b640af580c5b09767f882bffe215c.gif) — SHA-256 `f9f33e0a7737a25bc555cafdf49da99e661b640af580c5b09767f882bffe215c`; 582 × 2646 pixels.

**Application/database gap.** Identify transaction boundaries, retry/idempotence and acknowledgments across preparation, custom steps, transfer tables and production processing.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Inventory Management

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Inventory management corrects recorded stock outside ordinary picking or putaway. The adjustment class determines how an adjustment type is processed; license-plate transactions can handle mixed product together.

**Initiation.** An authorized user completes an inventory adjustment or transfer.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-inventory-management-r01 — initiation.** Desktop/Insight or RF adjustment requests correct stock outside ordinary pick/putaway. RF presents only user/warehouse-authorized adjustment types, and fields vary by adjustment class.

[Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md) — n66, n68; article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`; original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`.

[Inventory Management Process Summary: Process Flows](../AIM/reading/edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0.md) — n72, n73, n76, n77; article `edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0`; original SHA-256 `8ba6a03e7cbddeb165072864fffc79afc5a6fe9612e26d086de7cf9ce60430c2`.

**process-documentary-inventory-management-r02 — stages.** RF quantity adjustments/transfers validate inventory tracking, configured item/location checks, existing contents and multi-item eligibility. Status changes verify that the item exists at the nominated location. Validation failure returns the user for another value.

[Inventory Management Process Summary: Process Flows](../AIM/reading/edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0.md) — n81, n84, n89, n94, n97, n100, n103, n106, n111; article `edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0`; original SHA-256 `8ba6a03e7cbddeb165072864fffc79afc5a6fe9612e26d086de7cf9ce60430c2`.

**process-documentary-inventory-management-r03 — configuration.** Some desktop adjustment/transfer types create work: stock becomes in transit at the destination and transfers reserve the source. This work-creation option is not supported during RF inventory adjustments. Quantity bounds and frozen-location permissions belong to adjustment types.

[Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md) — n99, n118, n120; article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`; original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`.

**process-documentary-inventory-management-r04 — outcomes errors.** Full-quantity negative adjustments/transfers do not prompt for catch weight; partial quantities can default from average weight, and work-based actions capture weight during execution. Lot Insight restrictions apply when inventory attributes are linked; lot status/expiry edits propagate across matching item/company/lot inventory.

[Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md) — n75, n76, n128, n129, n130, n135, n136, n137, n140, n141, n144; article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`; original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`.

**process-documentary-inventory-management-figure-51 — substantive figure.** The RF flow branches Adjustment/Transfer from Status Change. Quantity actions check tracking, item, location, mixed-item permission and quantity bounds before adjusting stock, with failed checks looping back. Status change has its own item-at-location check. White boxes are user actions and blue boxes system decisions.

[Inventory Management Process Summary: Process Flows](../AIM/reading/edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0.md) — n67; article `edca94441e91a9acd50d8668b047aec7beeba2b981c755b883a5e875295359e0`; original SHA-256 `8ba6a03e7cbddeb165072864fffc79afc5a6fe9612e26d086de7cf9ce60430c2`.

[Local asset](../AIM/source/assets/26301b5651486d0af5ed7d0159c23f71feba83f94a206fa0dd12ef5fa111a762.gif) — SHA-256 `26301b5651486d0af5ed7d0159c23f71feba83f94a206fa0dd12ef5fa111a762`; 687 × 1623 pixels.

**Application/database gap.** Distinguish RF adjustments from desktop work-creating adjustments and locate the caller transaction boundary for inventory/tracking validations.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Inventory Tracking

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Inventory tracking records where stock is and what state it is in. Quantity categories distinguish inventory states, and lots, serial numbers, catch weights and attributes provide additional identification.

**Initiation.** Product enters, moves through or leaves the warehouse.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-inventory-tracking-r01 — stages.** Inventory buckets distinguish physical On Hand, incoming In Transit, reserved Allocated and count-related Suspense. The basic Available calculation is On Hand minus Allocated minus Suspense; this introductory formula should not erase the allocation article&#x27;s configured in-transit variant.

[Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md) — n64, n87, n90, n93, n96, n99, n102, n103, n104, n105; article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`; original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`.

**process-documentary-inventory-tracking-r02 — configuration.** Lot and serial templates define identifier structures; master/minor serials have different display roles. Inventory attributes are twenty named fields usable across receiving, allocation and ERP interfaces for LP and non-LP stock.

[Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md) — n108, n113, n115, n125; article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`; original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`.

**process-documentary-inventory-tracking-r03 — outcomes errors.** Movement-class analysis uses scheduled historical-demand data to support placement decisions. It describes a planning capability, not observed throughput, active schedules or an automatically proven best location.

[Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md) — n131; article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`; original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`.

**Application/database gap.** Use operation-specific available-quantity rules; identify how the application consumes tracking attributes and history rather than inferring behavior from balances.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Item

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Item setup defines product characteristics and handling controls, including locating, allocation, lot and serial behavior. The captured summary also describes using shipment-line item values when separate item records are not maintained.

**Initiation.** An item is configured or supplied through interface/shipment-line data.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-item-r01 — initiation.** Item records can be interfaced or maintained in SCALE. The source permits optional item-master setup and fallback to shipment-line values; that general statement must be reconciled with process-specific validation flags before use.

[Item Process Summary: Functionality](../AIM/reading/d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0.md) — n64; article `d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0`; original SHA-256 `ac7b4d20dd4c56102e0606305932bbc6c3688cab1a4fdf0f3a6a141f6c0505a7`.

**process-documentary-item-r02 — configuration.** Item templates control ID structure; item UOM breakdown and dimensions support capacity calculations. Alternate items replace unavailable/obsolete items, while substitutes address out-of-stock items. Item cross-references allow UPC/EAN-14 identification during processing.

[Item Process Summary: Functionality](../AIM/reading/d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0.md) — n78, n83, n85, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n99, n104; article `d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0`; original SHA-256 `ac7b4d20dd4c56102e0606305932bbc6c3688cab1a4fdf0f3a6a141f6c0505a7`.

**Application/database gap.** Resolve item-master optionality against process-specific item validation, item-class defaults and quantity/dimension units.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## LTL Rating

Bodies: 3/3; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Less-than-truckload rating calculates freight for a shipment using route, weight and freight class. SCALE’s documented internal rating also considers minimum charges and whether the next weight break would be cheaper.

**Initiation.** An LTL shipment is rated.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-ltl-rating-r01 — stages.** Select a valid rate base by effective criteria, origin/destination and shipment characteristics. Rate each LTL class using shipment weight breaks, total charges, apply minimums and compare deficit-weight alternatives; mixed-class deficit uses the lowest class.

[LTL Rating Process Summary: Functionality](../AIM/reading/66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376.md) — n71, n73, n75, n77, n95, n120, n125; article `66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376`; original SHA-256 `ecf370ae2e20127447eeb2276766ecffcb7d9e7f73ecd56a1097f70a134337d2`.

[LTL Rating Process Summary: Scenarios](../AIM/reading/dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9.md) — n246, n248, n252, n254, n260, n271, n273; article `dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9`; original SHA-256 `51e2938d68bca37b5b3ba77d1eefacae858494c7a5e126bb5003e212e7fc7241`.

**process-documentary-ltl-rating-r02 — configuration.** FAK can rate different actual classes at an agreed class. Scenario minimum-charge precedence is detail before header. Rates and postal codes in examples are illustrative and not current carrier prices.

[LTL Rating Process Summary: Functionality](../AIM/reading/66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376.md) — n110, n115; article `66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376`; original SHA-256 `ecf370ae2e20127447eeb2276766ecffcb7d9e7f73ecd56a1097f70a134337d2`.

[LTL Rating Process Summary: Scenarios](../AIM/reading/dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9.md) — n98, n193, n248, n284; article `dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9`; original SHA-256 `51e2938d68bca37b5b3ba77d1eefacae858494c7a5e126bb5003e212e7fc7241`.

**process-documentary-ltl-rating-r03 — outcomes errors.** The scenario calls 42.50 the rate for a 600-pound shipment, while the preceding table places 42.50 under &lt;500 and 41.80 under &lt;1000. Retain this source inconsistency; do not promote its numeric example into an executable rating oracle.

[LTL Rating Process Summary: Scenarios](../AIM/reading/dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9.md) — n193, n248, n256, n271; article `dc00c5fc10d6dcd7c8ab0f4764c6a743bff2853b818ec60bcaee60e39a1280f9`; original SHA-256 `51e2938d68bca37b5b3ba77d1eefacae858494c7a5e126bb5003e212e7fc7241`.

**process-documentary-ltl-rating-figure-43 — substantive figure.** Internal LTL rating is called from routing, ship confirmation or an external call for carrier symbol ILS.LTL. The diagram selects a rate base, determines class/weight, computes the lower rate-base versus deficit-weight charge, then applies the class-level minimum (or rate-base minimum if none) and returns the freight charge. This order differs from the simplified prose ordering and is retained without asserting deployed calculation precedence.

[LTL Rating Process Summary: Process Flow](../AIM/reading/cb50f4eb7c0861b9e02b531274b21aae23d02e1638cad72295576d6308b9e6d1.md) — n68; article `cb50f4eb7c0861b9e02b531274b21aae23d02e1638cad72295576d6308b9e6d1`; original SHA-256 `9c362eb8fbab4a6bfa9ffb09359df749d770d841ef118c77404f8e2b85a0a518`.

[Local asset](../AIM/source/assets/dca8e98a96fa066e1e07e0dbdd5e84a8afad0bb606193a1f28aa1a2c544ec49d.gif) — SHA-256 `dca8e98a96fa066e1e07e0dbdd5e84a8afad0bb606193a1f28aa1a2c544ec49d`; 859 × 1231 pixels.

**Application/database gap.** Resolve the documented table/example and minimum-versus-deficit ordering discrepancies before any implementation comparison; no current tariff is inferred.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Labor Management

Bodies: 3/3; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Labor management collects productivity information from warehouse actions such as picking, packing and receiving. It supports comparing work and plans with expected performance.

**Initiation.** Workers perform supported warehouse actions.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-labor-management-r01 — initiation.** Warehouse actions produce labor requests which a continuing labor service turns into detail records; untracked duties can be manually entered. A labor-plan wave step separately estimates required labor.

[Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md) — n68, n85, n90, n95; article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`; original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`.

**process-documentary-labor-management-r02 — configuration.** Labor plans order labor groups; groups carry staffing, hours, UOM and estimated time per transaction. Scenario calculations distinguish one transaction per UOM demand from one per quantity, producing different workload estimates.

[Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md) — n95, n100; article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`; original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`.

[Labor Management Process Summary: Scenarios](../AIM/reading/1577dee17cd3cea384f5b8e40cd757565dffd0a44971e2ddedcc12a2428f0a2b.md) — n77, n78, n79, n80, n81, n82, n83, n84, n85, n112, n114, n116, n126, n128, n130, n132; article `1577dee17cd3cea384f5b8e40cd757565dffd0a44971e2ddedcc12a2428f0a2b`; original SHA-256 `f02f163563476cbb4d68450952d98e3423c97c1c6b1dbeff0568e16d7299b898`.

**process-documentary-labor-management-r03 — outcomes errors.** The example estimates do not measure runtime or actual employee performance. Direct and indirect labor are separately defined, and observed productivity requires actual authorized labor records and processing evidence.

[Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md) — n106, n109; article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`; original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`.

[Labor Management Process Summary: Scenarios](../AIM/reading/1577dee17cd3cea384f5b8e40cd757565dffd0a44971e2ddedcc12a2428f0a2b.md) — n112, n128; article `1577dee17cd3cea384f5b8e40cd757565dffd0a44971e2ddedcc12a2428f0a2b`; original SHA-256 `f02f163563476cbb4d68450952d98e3423c97c1c6b1dbeff0568e16d7299b898`.

**process-documentary-labor-management-r04 — configuration.** The plan diagram distinguishes work-line versus shipment-line planning according to placement relative to work creation. When a line qualifies for multiple groups, its displayed result comes from the last processed group.

[Labor Management Process Summary: Process Flow](../AIM/reading/2c40a0663e01097c47bd6bee6909321cad74a41dddc7dea5f2eb38b4a305dbf0.md) — n69; article `2c40a0663e01097c47bd6bee6909321cad74a41dddc7dea5f2eb38b4a305dbf0`; original SHA-256 `3d461db403d79f677dcce3c926973f03e11b43548078106682c5a95068ec57ad`.

**process-documentary-labor-management-figure-06 — substantive figure.** The Labor Plan Processing diagram begins with a choice of work-line or shipment-line planning, then configures plan/group sequence and links a work type. The Labor Plan Execution wave step selects qualifying lines. Its callout says that if a line qualifies for multiple groups, only the last processed group&#x27;s calculation is displayed. Results can be viewed in an Operational SCI report; this figure concerns planning, not the labor-request service.

[Labor Management Process Summary: Process Flow](../AIM/reading/2c40a0663e01097c47bd6bee6909321cad74a41dddc7dea5f2eb38b4a305dbf0.md) — n69; article `2c40a0663e01097c47bd6bee6909321cad74a41dddc7dea5f2eb38b4a305dbf0`; original SHA-256 `3d461db403d79f677dcce3c926973f03e11b43548078106682c5a95068ec57ad`.

[Local asset](../AIM/source/assets/0894ff6e0fd2751f159df52d75dd3087052f2dceed2ad43b31c24f57c51507f2.gif) — SHA-256 `0894ff6e0fd2751f159df52d75dd3087052f2dceed2ad43b31c24f57c51507f2`; 942 × 1086 pixels.

**Application/database gap.** Separate planning calculations and last-matching-group display from actual labor-request processing and measured performance.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Locating

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Locating chooses a storage destination for checked-in product. Rules select candidate locations and a strategy; creating putaway work is a separate choice. Delayed locating can first send the container to a receiving pre-locate area.

**Initiation.** Checked-in containers are submitted for locating.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-locating-r01 — initiation.** Receipt check-in precedes locating, which chooses storage and may create putaway instructions according to receiving preferences. Process History explains decisions; Transaction History records actual locating events.

[Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md) — n64, n66; article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`; original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`.

**process-documentary-locating-r02 — configuration.** Numbered locating sequences combine strategy and eligible-location selection. Style consolidation is child-container-only; Empty Location does not use another item&#x27;s permanent assignment, and Fill One And Only One does not continue to other locations once its selected location fills.

[Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md) — n83, n85, n87, n90, n94, n96, n98, n102, n105, n108; article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`; original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`.

**process-documentary-locating-r03 — stages.** Delayed Locating requires both the rule flag and Create Putaway Work. Parent locating uses the parent rule and child locating the nested container&#x27;s rule; otherwise normal rule details apply.

[Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md) — n113; article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`; original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`.

**Application/database gap.** Bind the container rule and both delayed-locating prerequisites to the calling receiving/work flow; identify failure handling without stock samples.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Location

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** A location is a defined place where stock can be picked, put away or replenished. Location types share dimensions and capacity settings, while movement classes describe what kinds of product can be stored there.

**Initiation.** Warehouse locations are defined and referenced by warehouse work.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-location-r01 — configuration.** Location types share dimensions and quantity maximums; movement classes restrict product placement. Templates define structured IDs and separators, while predefined location classes identify purpose.

[Location Process Summary: Functionality](../AIM/reading/21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae.md) — n63, n78, n83; article `21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae`; original SHA-256 `d517ff8730848df37cb3418877be0cb80e0e68650ed39845945145bad5425462`.

**process-documentary-location-r02 — stages.** Permanent item assignments support non-inventory products. Pickup/dropoff locations are intermediate handoffs: one worker can deposit product and another transport it onward, rather than treating P&amp;D as the final destination.

[Location Process Summary: Functionality](../AIM/reading/21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae.md) — n88, n93; article `21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae`; original SHA-256 `d517ff8730848df37cb3418877be0cb80e0e68650ed39845945145bad5425462`.

**Application/database gap.** Resolve effective location-type overrides, movement classes, permanent assignments and P&amp;D handoffs; type metadata alone does not prove final storage.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Multi-Language Support

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Language behavior depends on which SCALE interface is being used and which translations are installed. Desktop, browser, RF device and TPM settings are described separately in the captured documentation.

**Initiation.** A user opens an interface or online help.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-multi-language-support-r01 — configuration.** Translated TRP resources supply display text. Remote-desktop system-menu windows follow Windows user language; other application screens follow browser language. RF language can be set on the device independently.

[Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md) — n80, n82, n87, n92; article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`; original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`.

**process-documentary-multi-language-support-r02 — outcomes errors.** TPM website language is server/Web User configuration controlled in this source. Online help looks for the user-language folder and falls back to base help when it is absent; this does not establish translation availability or present product-version behavior.

[Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md) — n97, n102, n104; article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`; original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`.

**process-documentary-multi-language-support-r03 — stages.** The System Text Editor Translation Wizard supports export/import and copying existing resource values for translation. Language selection, resource translation and translated help are distinct setup tasks.

[Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md) — n80, n109; article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`; original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`.

**Application/database gap.** Identify each installed client and its TRP/browser/Windows/RF/help fallback contract; the captured desktop-era model is not proof of current localization.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Packing/Shipping

Bodies: 2/2; images: 3/3 (3 substantive, 0 decorative).

**User goal.** Packing associates shipment lines with containers, validates items and generates packing labels. Shipping then manages packed shipments through dock processing and confirmation.

**Initiation.** Allocated/picked shipment quantities enter the applicable packing and shipping flow.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-packing-shipping-r01 — initiation.** Packing associates shipment contents to containers; closing collects container/weight data and prevents further packing. Bypass packing depends on Create Containers at Closing or wave-created containers.

[Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md) — n65, n101, n111; article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`; original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`.

**process-documentary-packing-shipping-r02 — stages.** RF nesting checks container existence, an open parent and same-shipment membership before linking child ID/contents to the parent. A parent may be newly created during the flow.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n91, n95, n101, n104, n107, n111; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

**process-documentary-packing-shipping-r03 — outcomes errors.** The close-container figure validates shipment/container, shipment membership and released wave; pending VAS requires an override while pending QC blocks. It adds an international on-the-fly restriction and notes RF/web-service international manifesting is unsupported in this documented flow.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n77; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

**process-documentary-packing-shipping-r04 — configuration.** The close figure sequences manifesting, container/child status advancement, configured paperwork, optional load assignment, next dock move and transaction history. Grouping containers requires a common shipment and does not itself affect carrier rating/routing.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n77; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

[Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md) — n111, n116, n122; article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`; original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`.

**process-documentary-packing-shipping-figure-38 — substantive figure.** Desktop, RF and web-service entry paths converge on container validation. Invalid data, unresolved VAS without override, pending QC and an international on-the-fly case lead to errors. The main path validates carrier/type/dimensions and weight, updates the container, conditionally manifests, advances statuses, prints configured documents, optionally assigns a load/next move, and writes close history. RF/web-service international manifesting is expressly limited.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n77; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

[Local asset](../AIM/source/assets/196179bef7be595d7e600e07c5b519f0b402859f0f0bbb7fc49b5ccd1cba920a.gif) — SHA-256 `196179bef7be595d7e600e07c5b519f0b402859f0f0bbb7fc49b5ccd1cba920a`; 1243 × 4698 pixels.

**process-documentary-packing-shipping-figure-39 — substantive figure.** RF nesting scans child/parent IDs, optionally creates a parent type, checks existence/open-parent/same-shipment, nests the child and loops for another container. Failed validations return to input.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n88; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

[Local asset](../AIM/source/assets/e044b3dbeb44b596ff6ce30ae97bda05b3d16bf20f1fa40fc00c29f6d20e79c6.gif) — SHA-256 `e044b3dbeb44b596ff6ce30ae97bda05b3d16bf20f1fa40fc00c29f6d20e79c6`; 687 × 1434 pixels.

**process-documentary-packing-shipping-figure-40 — substantive figure.** Combine Pallets validates source/destination, then branches on item contents: nest the source container intact or move its children and delete the now-empty source pallet. A destination-manifest branch appears before completion. The figure describes application behavior, not authorization to delete warehouse records.

[Packing/Shipping Process Summary: Process Flows](../AIM/reading/8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c.md) — n121; article `8f70dc416df0ae3806d85fde427d282bf3000100ec5ea52cad950ef69216791c`; original SHA-256 `61fda2ead92d01a594cb7fd17055f8ded15300590e97df57986ae1011bc3cda3`.

[Local asset](../AIM/source/assets/00dffb51cb3c0674c59be69f388aaf15e0f5bd01266f3c4e9bb5895b59e90946.gif) — SHA-256 `00dffb51cb3c0674c59be69f388aaf15e0f5bd01266f3c4e9bb5895b59e90946`; 625 × 1177 pixels.

**Application/database gap.** Reconcile close validation, QC/VAS gates, manifest service, status update, print and next-move steps with the actual caller and transaction boundaries.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Paperwork

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Paperwork produces documents and labels at warehouse processing points such as waves, container closure and shipment or load confirmation. A configured rendering or printing service produces the output.

**Initiation.** A configured inbound or outbound processing point requests documents or labels.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-paperwork-r01 — initiation.** Manual or process events such as wave, container close and shipment/load confirmation generate paperwork. The source names SSRS and Progistics as rendering/printing options.

[Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md) — n66; article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`; original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`.

[Paperwork Process Summary: Process Flows](../AIM/reading/d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82.md) — n64, n68; article `d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82`; original SHA-256 `99686740147152c7867ffe8cc584e276a9bbd1c82ab0bae530ad569fd359d8b8`.

**process-documentary-paperwork-r02 — configuration.** Custom templates belong in the application Printing directory; the source separately says Progistics uses its own unmodifiable templates. Successful document generation is not evidence of printer delivery.

[Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md) — n84, n89; article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`; original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`.

[Paperwork Process Summary: Process Flows](../AIM/reading/d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82.md) — n68; article `d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82`; original SHA-256 `99686740147152c7867ffe8cc584e276a9bbd1c82ab0bae530ad569fd359d8b8`.

**process-documentary-paperwork-r03 — stages.** The SSRS diagram separates document-data submission, PDF rendering/storage, an SSRS print-request record, SCALE Printing Service detection, DynamicPDF PrintManager forwarding and physical printer output.

[Paperwork Process Summary: Process Flows](../AIM/reading/d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82.md) — n68; article `d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82`; original SHA-256 `99686740147152c7867ffe8cc584e276a9bbd1c82ab0bae530ad569fd359d8b8`.

**process-documentary-paperwork-figure-50 — substantive figure.** A workstation process sends document data to SSRS; SSRS renders a PDF on the SCALE server and confirmation leads to an SSRS Print Request table record. SCALE Printing Service detects the record, passes PDF to DynamicPDF PrintManager, and that component sends it to the printer. The separate queue, file and device stages explain why a PDF alone does not prove printing.

[Paperwork Process Summary: Process Flows](../AIM/reading/d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82.md) — n68; article `d941c46e5ddb6d9c2b8cb286d95148937ab7ae9372293deca87a2a35004aca82`; original SHA-256 `99686740147152c7867ffe8cc584e276a9bbd1c82ab0bae530ad569fd359d8b8`.

[Local asset](../AIM/source/assets/f2e4dd14040814e4c4452f04e6010eff3af1456f199bac541ded60363b33030c.gif) — SHA-256 `f2e4dd14040814e4c4452f04e6010eff3af1456f199bac541ded60363b33030c`; 681 × 367 pixels.

**Application/database gap.** Bind SSRS rendering, file storage, print-request persistence, Printing Service and PrintManager to installation/acknowledgment evidence; PDF existence is not physical output.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Performance Management

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Performance management combines history, alerts and reporting to help explain warehouse activity. Transaction history describes inventory changes; process history describes system decisions. An alert request still needs later processing.

**Initiation.** A warehouse event, decision, discrepancy or configured alert condition occurs.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-performance-management-r01 — stages.** The source separates transaction history for inventory effects, process history for decisions, quality history for discrepancies/reason codes, and receipt quality history for receiving milestones. Each supports a different troubleshooting question.

[Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md) — n87, n91, n94, n97, n100; article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`; original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`.

**process-documentary-performance-management-r02 — configuration.** An alert condition writes a request; the warehouse-alert scheduled job turns it into an alert and configured history/email effects. Alert priority and scheduled reporting/processes are distinct controls.

[Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md) — n104, n109; article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`; original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`.

**process-documentary-performance-management-r03 — outcomes errors.** History can record success or failure, but this article does not supply measured durations, active alert schedules or observed notifications for the assessed warehouse.

[Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md) — n87, n104; article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`; original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`.

**Application/database gap.** Establish job schedules, retention, correlation and delivery semantics separately for transaction/process/quality/receipt history and alerts.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Quality Control

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Quality control checks inbound product or outbound container contents before normal processing continues. The inbound process holds the relevant receipt quantity for inspection; outbound failures need resolution before the next status step.

**Initiation.** Eligible inbound items are received, or outbound containers are selected for QC.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-quality-control-r01 — initiation.** Inbound QC samples receipt quantities for inspection and holds related inventory in QC status. It supports LPs created by check-in, not downloaded receipt containers. Outbound QC is assigned in a wave, at existing-container work start or by an authorized manual action.

[Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md) — n87, n92, n96, n99, n102; article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`; original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`.

**process-documentary-quality-control-r02 — configuration.** Outbound active assignment records are evaluated in ascending priority; the first match marks QC Pending and its assignment reason, while all matching records have their current container counts incremented.

[Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md) — n104, n106; article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`; original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`.

**process-documentary-quality-control-r03 — outcomes errors.** Inbound inspection requires manual transfer/status resolution; outbound failures must be resolved before the next status. The inbound diagram&#x27;s diamond asks whether the item is already in QC, routes No to normal locating and Yes onward; preserve this potentially confusing source wording rather than silently reversing the branch.

[Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md) — n87, n92; article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`; original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`.

[Quality Control Process Summary: Process Flows](../AIM/reading/3ee97470fbd2629832ec1589bf0a1993a6b6df3dfd4f08ec3e4bbc0b18eab522.md) — n66; article `3ee97470fbd2629832ec1589bf0a1993a6b6df3dfd4f08ec3e4bbc0b18eab522`; original SHA-256 `64f714281b833ccc787279baf2d1d154afcac076dc7b50653acb055666723db3`.

**process-documentary-quality-control-figure-10 — substantive figure.** RF and Receipt Workbench check-in converge on receiving validation and QC gates for preference/item eligibility and the diagram&#x27;s already-in-QC decision. A piece-count/percentage sample is converted/rounded and compared with received quantity to decide whole-container or split quantities. After confirmation, QC and residual locating occur, QC status is assigned, and physical pass/fail inspection leads to manual transfer or reconciliation. The already-in-QC branch wording needs source clarification.

[Quality Control Process Summary: Process Flows](../AIM/reading/3ee97470fbd2629832ec1589bf0a1993a6b6df3dfd4f08ec3e4bbc0b18eab522.md) — n66; article `3ee97470fbd2629832ec1589bf0a1993a6b6df3dfd4f08ec3e4bbc0b18eab522`; original SHA-256 `64f714281b833ccc787279baf2d1d154afcac076dc7b50653acb055666723db3`.

[Local asset](../AIM/source/assets/d6383e448a55779204b74dcbbd05df50a4e9636f768f22edabff51bb55e7b38f.gif) — SHA-256 `d6383e448a55779204b74dcbbd05df50a4e9636f768f22edabff51bb55e7b38f`; 973 × 3781 pixels.

**Application/database gap.** Resolve the figure already-in-QC wording and active sampling/assignment/release rules; no inspection outcome or configured authorization is established.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Receiving

Bodies: 2/2; images: 3/3 (2 substantive, 1 decorative).

**User goal.** Receiving first checks product into the warehouse and then locates it for storage. Check-in creates receipt containers for all or part of a line; locating chooses their destination.

**Initiation.** Product arrives against an interfaced or application-created receipt.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-receiving-r01 — initiation.** Desktop receiving starts with an interfaced receipt or receipt creation from Insight/Workbench, shipment or PO. RF initiation depends on receiving preference and can use header/item, header/container, blind, item or container entry; the prose calls these four types but enumerates more variants.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n81, n86, n90, n94, n539, n540, n542, n548, n551; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

[Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md) — n123, n139; article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`; original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`.

**process-documentary-receiving-r02 — stages.** Check-in converts quantities using item then item-class UOM, optionally verifies the breakdown without changing master UOM, groups by storage-template settings, captures tracking data and assigns LP IDs. Locate then processes explicit parent/child units through ordered rules and capacity checks.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n128, n131, n140, n153, n156, n163, n177, n180, n187, n190, n202, n205, n294, n298; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

**process-documentary-receiving-r03 — configuration.** Locating-rule assignment can occur at line creation or check-in; mixed-item containers cannot use a single item fallback. Explicit item/location capacity takes precedence over the dimensional/volumetric fallback. Delayed locating requires both its rule flag and Create Putaway Work.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n98, n163, n193, n290, n298, n306, n309, n313, n316, n476; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

**process-documentary-receiving-r04 — outcomes errors.** If no eligible location fits and sequences are exhausted, locating fails. With putaway work, quantity is allocated at receiving and in transit to destination; without work it becomes On Hand during locating before physical movement. Quick-receiving Skip does not reprompt: use Workbench or LP-initiation receiving later.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n483, n484, n486, n489, n493, n496, n500, n502, n505, n598; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

**process-documentary-receiving-r05 — configuration.** RF receiving is workflow-driven and configurable per user; shipped activities can be changed. Thus the static process diagrams do not prove the effective screen order of the deployed receiving workflow.

[Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md) — n94, n96, n98; article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`; original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`.

**process-documentary-receiving-figure-34 — substantive figure.** Desktop receipt initiation/check-in feeds UOM conversion and optional locating-rule assignment. Locating branches through delayed pre-location or numbered strategy/selection rules, tests capacity, assigns a destination and optional putaway work, then loops if Locate All was chosen. The figure simplifies sequence failure; use accompanying prose for exhaustion behavior.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n77; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

[Local asset](../AIM/source/assets/0735f9c8c0ad5874124c386100b9afe266f2865c998ca1555d40b34b70d28152.gif) — SHA-256 `0735f9c8c0ad5874124c386100b9afe266f2865c998ca1555d40b34b70d28152`; 832 × 2460 pixels.

**process-documentary-receiving-figure-35 — decorative transparent ui asset.** Transparent 16-by-16-pixel UI image; visually inspected but contains no process information and is not counted as a process diagram.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n319; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

[Local asset](../AIM/source/assets/1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31.gif) — SHA-256 `1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31`; 16 × 16 pixels.

**process-documentary-receiving-figure-36 — substantive figure.** RF receiving branches header/blind, item and container initiation. Item entry validates open receipt quantity, special handling, quantity and LP assignment, then tracking/disposition. Container execution branches check-in only, check-in plus locate/work, or quick receiving with user/system location selection.

[Receiving Process Summary: Process Flows](../AIM/reading/7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4.md) — n524; article `7ce243224234ef2a085f503382eb7608a270aeae80192c654d977e0ec2da1eb4`; original SHA-256 `502c7c8a17c746c0f89952398da45caaedad8658950cd52939a3037be126e5d2`.

[Local asset](../AIM/source/assets/d72feeb97aaea61aae5dc198ff4064db91e71189aff19063df6751bd05b685ae.gif) — SHA-256 `d72feeb97aaea61aae5dc198ff4064db91e71189aff19063df6751bd05b685ae`; 805 × 1981 pixels.

**Application/database gap.** Resolve workflow activities per user, rule assignment timing, capacity precedence and no-work quantity timing before relating status to physical movement.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Replenishment

Bodies: 3/3; images: 6/6 (4 substantive, 2 decorative).

**User goal.** Replenishment moves stock from bulk storage toward forward picking locations. Creating a replenishment request and creating the work to move it are separate stages controlled by the replenishment master and wave flow.

**Initiation.** A manual request, configured wave step or real-time minimum-threshold condition starts replenishment.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-replenishment-r01 — initiation.** Replenishment can be manual, wave-demand, pool-demand or real-time capacity based. Real-time means a threshold event marks a location for a scheduled job, not necessarily immediate physical movement. Masters and item/location criteria select and order the work.

[Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md) — n69, n93, n116, n120; article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`; original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`.

[Replenishment Process Summary: Scenarios](../AIM/reading/4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb.md) — n93, n105, n109, n110, n111, n112; article `4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb`; original SHA-256 `2746e2d83734a7557d559b08d74fd0fd18be3478ef9d05e65fefa18baa846a4e`.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n89, n91, n94, n102, n105, n107, n110; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

**process-documentary-replenishment-r02 — configuration.** Demand UOM determines eligible demand; replenishment increment determines the moved unit. Capacity fullness uses On Hand plus In Transit against maximum quantity. The location threshold comparison is less-than-or-equal in the flow text. Source allocation rule precedence is replenishment master, item, then \*Default.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n115, n119, n122, n125, n131, n134, n333, n336, n339, n355, n358, n361, n596, n599, n602; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

**process-documentary-replenishment-r03 — stages.** Fill Location targets capacity; round-up/down respects replenishment increments. The location-need example calculates target fill minus On Hand/In Transit despite a reversed subtraction phrase. Excess-demand requests can queue for the same permanent location; subsequent threshold activity marks requests for later work creation.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n344, n611, n614, n617, n620, n623, n627, n630; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Replenishment Process Summary: Scenarios](../AIM/reading/4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb.md) — n133, n136, n137, n138, n139, n140, n141, n472, n474, n476, n478, n480, n482, n484; article `4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb`; original SHA-256 `2746e2d83734a7557d559b08d74fd0fd18be3478ef9d05e65fefa18baa846a4e`.

**process-documentary-replenishment-r04 — configuration.** Consolidate with Existing Requests supports many small waves and scheduled larger moves. Work-type priority orders competing replenishment methods. Create Work Method distinguishes automatic, manual/scheduled and none; none can mark destination stock On Hand before paperwork-driven physical movement.

[Replenishment Process Summary: Scenarios](../AIM/reading/4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb.md) — n147, n150, n151, n152, n153, n154, n155, n156, n216; article `4487deee330a6c980837ba465722a9328cf6f7df7e89ecc7d624955d5625d1bb`; original SHA-256 `2746e2d83734a7557d559b08d74fd0fd18be3478ef9d05e65fefa18baa846a4e`.

[Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md) — n127, n130, n133, n138; article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`; original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n379, n658; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

**process-documentary-replenishment-r05 — outcomes errors.** RF short-pick replenishment is conditional on work special handling. Its figure checks whether in-transit quantity can cover the shortage, raises related work priority when sufficient, and lets the user confirm the short pick or return and wait/partially pick.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n666, n669; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

**process-documentary-replenishment-figure-25 — substantive figure.** Wave/pool demand selects master records, item demand UOM and forward locations, then compares supply/capacity, applies fill or rounding strategy and allocates source inventory. The excess-demand setting determines whether to retain requests for the same location or seek further empty locations.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n86; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/4e5131160780b7417e2a67eb6d1230034e0b6ce503d75ba6352fc6580a72bf6e.gif) — SHA-256 `4e5131160780b7417e2a67eb6d1230034e0b6ce503d75ba6352fc6580a72bf6e`; 687 × 2203 pixels.

**process-documentary-replenishment-figure-26 — decorative transparent ui asset.** Transparent 16-by-16-pixel UI image; no process content.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n178; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31.gif) — SHA-256 `1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31`; 16 × 16 pixels.

**process-documentary-replenishment-figure-27 — substantive figure.** Location-need replenishment orders eligible locations, totals On Hand/In Transit, determines maximum capacity, compares fullness to the minimum threshold, computes fill target minus existing/in-transit stock, rounds and allocates. The diagram makes the subtraction direction explicit.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n390; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/5b26c9be4334115a26905b654753eb4c1db2ee6f9e4d8ef2c0f0111eab8b0167.gif) — SHA-256 `5b26c9be4334115a26905b654753eb4c1db2ee6f9e4d8ef2c0f0111eab8b0167`; 519 × 2124 pixels.

**process-documentary-replenishment-figure-28 — decorative transparent ui asset.** Transparent 16-by-16-pixel UI image; no process content.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n439; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31.gif) — SHA-256 `1d600a0343eef0b105f4dd86d1b7572306777214a30e5b8d49e91c153d7bca31`; 16 × 16 pixels.

**process-documentary-replenishment-figure-29 — substantive figure.** After an RF short-pick attempt, the work-special-handling flag gates replenishment. Existing/new in-transit stock is tested against the short quantity; adequate supply promotes related work priority and asks whether the user still confirms a short pick. Otherwise the short pick proceeds.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n669; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/d701d1360dad64947823a8229e729bb224b534c9372ed987fc8ba7e670cceef0.gif) — SHA-256 `d701d1360dad64947823a8229e729bb224b534c9372ed987fc8ba7e670cceef0`; 733 × 1225 pixels.

**process-documentary-replenishment-figure-30 — substantive figure.** Work creation branches None, Automatic and Manual/Scheduled. None immediately moves the system quantity; Automatic creates work. Manual/scheduled requests can be marked by a threshold event or user, filtered by the scheduled job&#x27;s marked-only setting, or explicitly created immediately.

[Replenishment Process Summary: Process Flows](../AIM/reading/61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58.md) — n681; article `61f0a241aded189425d956f7a9408608bd793068a8dc510d53f5fb402c6c9b58`; original SHA-256 `a9c010164a64d8287b5dd44e4923f6275c58eaf918469a077f87bfff03135225`.

[Local asset](../AIM/source/assets/c54455b04076f184b6c60f17e6651aa534279db33edfc15d3bba19baa4a19771.gif) — SHA-256 `c54455b04076f184b6c60f17e6651aa534279db33edfc15d3bba19baa4a19771`; 844 × 999 pixels.

**Application/database gap.** Resolve thresholds, demand/increment UOM, pending-request consolidation and scheduled marked-only work creation; real-time threshold marking does not prove immediate execution.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Retail

Bodies: 3/3; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Retail functionality supports distributing product to multiple stores and cross-docking received product toward outbound delivery. Cross-docking moves product through receiving to shipping without the ordinary storage path.

**Initiation.** Store orders are processed or received product is designated for cross-docking.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-retail-r01 — goal and initiation.** Retail distribution turns placeholder order lines bearing mark-for stores into store shipments and supports receiving-time cross-dock or put-to-store handling.

[Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md) — n68, n101, n106; article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`; original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`.

[Retail Process Summary: Scenarios](../AIM/reading/bb5f104e6bc8fb14cee68462f095f0b65f3b42a31c51586b5d91cb1e041692a9.md) — n71, n74; article `bb5f104e6bc8fb14cee68462f095f0b65f3b42a31c51586b5d91cb1e041692a9`; original SHA-256 `1a090aa89365780de637f62adee54670e87f3a368db64ab92e21327eaac5706e`.

**process-documentary-retail-r02 — configuration.** Put-to-store needs a PTS location class, item immediate-needs eligibility, locating rules, preferences/work profiles and store-location assignment criteria. These are documentary prerequisites, not evidence of enabled configuration.

[Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md) — n86, n89, n92, n95, n98; article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`; original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`.

**process-documentary-retail-r03 — stages and outcome.** Shipment distribution consolidates into an eligible open shipment or creates a new shipment, converts mark-for to ship-to, then allocates inventory or creates immediate need. Receiving can cross-dock an entire qualifying LP or split need quantity from inventory remainder; put-to-store assignment determines the need destination.

[Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md) — n106, n111, n116; article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`; original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`.

[Retail Process Summary: Process Flows](../AIM/reading/825362ce63eec82d03b279c1117d144ef548a82c34da4150fee050de9ddb4ecb.md) — n68; article `825362ce63eec82d03b279c1117d144ef548a82c34da4150fee050de9ddb4ecb`; original SHA-256 `781e6f3360e0b08d0d5b2158313e714cb413bed75bc12c63f9550906b8d86e4e`.

**process-documentary-retail-r04 — limitations and errors.** Lot tracking is supported. The scenarios exclude serial tracking when splitting receipt containers for put-to-store/residual inventory but support it for cross-dock. An unlocated split put-to-store container is directed to Shipping Dock on relocation in the documented scenario.

[Retail Process Summary: Scenarios](../AIM/reading/bb5f104e6bc8fb14cee68462f095f0b65f3b42a31c51586b5d91cb1e041692a9.md) — n96, n100, n105; article `bb5f104e6bc8fb14cee68462f095f0b65f3b42a31c51586b5d91cb1e041692a9`; original SHA-256 `1a090aa89365780de637f62adee54670e87f3a368db64ab92e21327eaac5706e`.

**process-documentary-retail-figure-37 — substantive figure.** Two flows connect retail receiving to store-order distribution. Receiving compares LP quantity with need: no need goes to inventory; LP quantity no greater than need cross-docks the entire LP; excess splits into children for need and residual inventory. A PTS assignment sends need to PTS, otherwise the immediate-needs locating rule search applies. Shipment Distribution precedes Allocation, turns store-marked lines into shipments, and routes allocated full/loose product to shipping or assigned PTS; shortages can create immediate needs.

[Retail Process Summary: Process Flows](../AIM/reading/825362ce63eec82d03b279c1117d144ef548a82c34da4150fee050de9ddb4ecb.md) — n68; article `825362ce63eec82d03b279c1117d144ef548a82c34da4150fee050de9ddb4ecb`; original SHA-256 `781e6f3360e0b08d0d5b2158313e714cb413bed75bc12c63f9550906b8d86e4e`.

[Local asset](../AIM/source/assets/6565d49aa4a3e09abc640725c64227ecdc651e94a78c2570d627563995984a9f.gif) — SHA-256 `6565d49aa4a3e09abc640725c64227ecdc651e94a78c2570d627563995984a9f`; 1015 × 2989 pixels.

**Application/database gap.** Bind distribution-before-allocation, store assignment and serial-tracking limitations to the selected cross-dock/PTS receiving path.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Returns

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Returns processing handles unwanted or damaged product from arrival through preparation for putaway. Putaway groups can combine related returned items for one trip.

**Initiation.** Returned merchandise arrives at the receiving dock.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-returns-r01 — goal and initiation.** Returned goods use a receipt generated from a shipment or a blind receipt; consolidation groups allow good/bad returned product to be handled together before putaway.

[Returns Process Summary: Functionality](../AIM/reading/ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456.md) — n65; article `ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456`; original SHA-256 `875b8f400ce5607b4ff4cea042183deff1cd8de801a72f01876ec507a40e2987`.

[Returns Process Summary: Process Flows](../AIM/reading/c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072.md) — n70, n72, n74, n76, n77; article `c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072`; original SHA-256 `961706f504926b3a78942ae02c2bf44fd48ed8ad5d457c7259ff0c4baa40d48f`.

**process-documentary-returns-r02 — stages.** Workbench check-in confirms quantity and optionally reason/disposition, assigns or verifies LP IDs and locating rules, finds a returns putaway group, then closes the group to create putaway work. Manual repair/repackaging follows for applicable returns.

[Returns Process Summary: Process Flows](../AIM/reading/c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072.md) — n81, n83, n85, n87, n89, n92, n95, n106, n108, n110; article `c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072`; original SHA-256 `961706f504926b3a78942ae02c2bf44fd48ed8ad5d457c7259ff0c4baa40d48f`.

**process-documentary-returns-r03 — configuration and errors.** Reason/disposition are not described as universally mandatory; when used they affect condition and locating. Failure to find a group prevents locate. Group closing may be manual or maximum-unit driven and the group can be reopened to remove a container.

[Returns Process Summary: Process Flows](../AIM/reading/c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072.md) — n85, n97, n99, n102, n106; article `c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072`; original SHA-256 `961706f504926b3a78942ae02c2bf44fd48ed8ad5d457c7259ff0c4baa40d48f`.

**process-documentary-returns-r04 — outcome boundary.** The documented return flow ends with work created and manual processing completed; physical putaway is still awaited, so group close alone does not prove stock reached its final location.

[Returns Process Summary: Process Flows](../AIM/reading/c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072.md) — n108, n110; article `c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072`; original SHA-256 `961706f504926b3a78942ae02c2bf44fd48ed8ad5d457c7259ff0c4baa40d48f`.

**process-documentary-returns-figure-42 — substantive figure.** Receipt from shipment or blind receipt converges on quantity/condition/LP check-in. Rule assignment leads to putaway-group selection, with failed selection returning to Workbench correction. Closing the group creates work; manual processing follows before the returns flow ends. Actual putaway execution is outside this diagram.

[Returns Process Summary: Process Flows](../AIM/reading/c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072.md) — n66; article `c38f2b3691834ac9c82b749b9183b656120c137536624a7e17bfdfab84c8c072`; original SHA-256 `961706f504926b3a78942ae02c2bf44fd48ed8ad5d457c7259ff0c4baa40d48f`.

[Local asset](../AIM/source/assets/b2b863679dac5031c366ad5a5a18306cad8a284dee150e1b552807aec34b0b53.gif) — SHA-256 `b2b863679dac5031c366ad5a5a18306cad8a284dee150e1b552807aec34b0b53`; 870 × 3034 pixels.

**Application/database gap.** Resolve reason/disposition, group selection/closure and manual-processing boundaries separately from final putaway execution.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Status

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** Statuses show progress through receiving or shipping. Lines follow their assigned flow, and header leading/trailing values summarize the most and least advanced progress. A Closed receipt does not always prove physical putaway when work creation is not required.

**Initiation.** A receipt or shipment line enters a status flow and processing advances.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-status-r01 — goal and initiation.** Status flows define the permitted sequence of a line and the leading/most-advanced and trailing/least-advanced header status. A default flow applies when none is assigned; an interfaced or custom flow can alter the path.

[Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md) — n63, n74, n80, n83, n89, n96, n182, n185, n190; article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`; original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`.

**process-documentary-status-r02 — stages and outcome.** Documented inbound progression includes 100 Check In Pending, 200 Locate Pending, 300 Putaway Pending, 301 In Putaway and 900 Closed. When no putaway work is created, the text allows 200 to 900 without establishing physical storage completion.

[Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md) — n103, n106, n109, n112, n115; article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`; original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`.

**process-documentary-status-r03 — stages and errors.** Outbound examples distinguish pool, wave, picking, packing, staging/loading, ship/load confirmation and delivered states. Special outcomes include 994 Complete Rejected To Pool, 995 Finished Item Allocated, 996 Component Allocated, 997 Immediate Need Pending, 998 Delete Rejected and 999 Rejected; these are source flow definitions rather than verified deployment settings.

[Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md) — n121, n124, n127, n130, n133, n136, n139, n142, n145, n148, n151, n154, n157, n160, n163, n166, n169, n172, n175, n178; article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`; original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`.

**process-documentary-status-r04 — configuration.** Custom flows can omit steps and should be assigned before interface processing. Interpret header status with its leading/trailing semantics and associated container/line state; a single header code is not proof every line completed that stage.

[Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md) — n182, n185, n190; article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`; original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`.

**Application/database gap.** Resolve active custom/default flows and header leading/trailing aggregation against application transition calls; source status labels do not identify every deployed numeric condition.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Technical

Bodies: 1/1; images: 0/0 (0 substantive, 0 decorative).

**User goal.** The documented process queue accepts batch requests and processes them in the background according to priority. The queue names in the captured documentation are not yet reconciled to this replica.

**Initiation.** An application batch process submits background work.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-technical-r01 — goal and initiation.** Process Queuing Service records a real-time batch request in ProcessQueueRequest for a background thread to process by priority; Background Job Queue Insight provides the documented monitoring surface.

[Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md) — n68; article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`; original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`.

**process-documentary-technical-r02 — stages and configuration.** Scheduled jobs enqueue repeated work for batch processing. Custom viewers can select searches, results, actions, colours/icons and one or two header/detail tables; decimal presentation uses the Windows separator.

[Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md) — n79, n84, n89; article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`; original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`.

**process-documentary-technical-r03 — interface boundary.** The source describes XML web services callable by third-party software through a reachable web server. It does not establish deployed endpoints, authorization policy, retries, idempotency or a running queue worker.

[Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md) — n74, n68, n79; article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`; original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`.

**Application/database gap.** Identify the installed component for ProcessQueueRequest and background processing rather than assuming the source identifier exists in the observed SQL snapshot.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Trading Partner Management

Bodies: 1/1; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Trading Partner Management is a documented website for order entry, status and supply-chain collaboration. It can expose inbound, outbound and inventory information in a multi-company context.

**Initiation.** An authorized trading partner uses a configured TPM website.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-trading-partner-management-r01 — goal and initiation.** TPM exposes web inquiry/order collaboration and statistics/inventory views. Internal users can see warehouse information across companies; external users are limited to their own records and allowed companies, with a Customer ID required for external users.

[Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md) — n63, n77, n105, n107, n110, n113, n115; article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`; original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`.

**process-documentary-trading-partner-management-r02 — configuration.** Company branding and external single-company or selected multi-company access are configurable. The figure uses different illustrative business names from the prose; both illustrate role/company scope rather than actual tenant identities.

[Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md) — n77, n82, n86, n88, n91, n94, n97, n100, n103; article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`; original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`.

**process-documentary-trading-partner-management-r03 — stages and outcome.** Documented functions include purchase-order/shipment creation, order-status research, statistics by criteria in HTML/XML, inventory inquiry, and email alerts on configured status/document events with templates and recipients.

[Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md) — n120, n125, n131, n136, n141; article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`; original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`.

**process-documentary-trading-partner-management-figure-07 — substantive figure.** A customer web inquiry site shows a distributor over two companies. An internal warehouse manager and an external multi-company customer connect at distributor scope; a single-company external customer connects only to one company. The illustration names Owens Distribution, Gerber, General Housewares, Walmart and Kroger, unlike the prose examples; names are illustrative, not deployed access evidence.

[Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md) — n103; article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`; original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`.

[Local asset](../AIM/source/assets/799ebefd6dd8544e766911e55c41e9a3bac5fd5d8347fff76253795c04bd4c17.GIF) — SHA-256 `799ebefd6dd8544e766911e55c41e9a3bac5fd5d8347fff76253795c04bd4c17`; 733 × 371 pixels.

**Application/database gap.** Identify installed TPM authorization and company/customer isolation; website examples and email capability do not establish access or delivery.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Wave

Bodies: 2/2; images: 4/4 (4 substantive, 0 decorative).

**User goal.** A wave groups the steps that bring orders from the pool into outbound processing. Its master defines the steps to run and the resulting entities, such as allocation requests or containers.

**Initiation.** A configured wave is run against selected orders.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-wave-r01 — goal and initiation.** Build associates pooled shipments to authorized wave masters, considering lower shipment/master priority numbers first and applying wave criteria. Run executes the configured flow; Release makes generated work and documents available to the floor.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n83, n86, n88, n91, n95, n98, n102, n105, n110, n135, n155, n161, n178; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md) — n65; article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`; original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`.

**process-documentary-wave-r02 — configuration and errors.** Maximums constrain shipment counts/details/units/value/weight/volume. A shipment is never split across waves; one exceeding a master maximum by itself stays in the pool. Criteria failures are retried against later masters.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n113, n117, n121, n124, n126, n129; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md) — n111, n113, n116, n119, n122, n125, n128; article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`; original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`.

**process-documentary-wave-r03 — configuration.** Automatic, manual, build-inactive and scheduled modes are documented in Functionality. The main flow diagram shows only automatic versus user-run branches. Auto Release is a separate setting; completion of Run does not by itself establish release.

[Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md) — n95, n97, n100, n103, n106; article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`; original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n146, n148, n151, n166, n173, n176; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

**process-documentary-wave-r04 — stages.** The pallet-building diagram requires Container Creation before Pallet Building and Pallet Building before Work Creation. It tests eligibility and fit using the master strategy, creates a new pallet container when necessary, and nests shipping containers.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n187; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

**process-documentary-wave-r05 — configuration and outcome.** Paperwork should follow steps producing its data. The master defaults to \*Default; sequential data selection and ordering, document type/generator, routing guide and template produce a batch document. Print-break sequences distribute copies, otherwise the routing guide supplies the printer.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n205, n209, n213, n215, n222, n225, n228, n234, n237, n242, n245, n248, n254, n257, n260, n263, n267, n270; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

**process-documentary-wave-r06 — stages and errors.** Pick groups separate full cases from loose containers, evaluate source locations against sequence ranges/zones, and create another group on maximum overflow. All contents of a loose container must qualify; containers matching no sequence remain outside a pick group.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n283, n286, n291, n295, n298, n300, n303, n307, n310, n313, n317, n320, n322; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

**process-documentary-wave-r07 — source exception.** Paperwork step 6 contains an unrelated locating-rule sentence at n252. The reviewed paperwork guidance relies on the surrounding document generation/routing steps and does not treat that sentence as a supported locating requirement.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n251, n252, n254; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

**process-documentary-wave-figure-12 — substantive figure.** Three colored phases show Build criteria/maximum loops, Run automatic-versus-manual selection, and Release auto-versus-user selection. Work/documents become available at Release. Scheduled and build-inactive modes described in prose are not separate diagram branches.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n79; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Local asset](../AIM/source/assets/36d76bb49b5d5d41cb3fdc0b4529766738187b96d200b17e79f114931f770267.gif) — SHA-256 `36d76bb49b5d5d41cb3fdc0b4529766738187b96d200b17e79f114931f770267`; 493 × 1183 pixels.

**process-documentary-wave-figure-13 — substantive figure.** Pallet Building starts after Container Creation and before Work Creation. It retrieves the pallet master, criteria, strategy and pallet type, skips ineligible containers, tests fit, creates a new pallet if needed, nests the container, and repeats. A side note describes a \*Default fallback; deployed master assignment is unverified.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n187; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Local asset](../AIM/source/assets/4bb1d8ba81d3d831d1afbbfd5f8d5f840787d8a7e69195943444cfc57db26874.gif) — SHA-256 `4bb1d8ba81d3d831d1afbbfd5f8d5f840787d8a7e69195943444cfc57db26874`; 529 × 1285 pixels.

**process-documentary-wave-figure-14 — substantive figure.** The paperwork wave step assigns a master, loops sequential selection criteria, orders matching records, resolves document type/generator and routing guide, fills the template, and sends created paperwork to master-specified printer(s) or the guide printer.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n197; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Local asset](../AIM/source/assets/3ec67900e0ce3dacbe79b48bce6637daaf3fe63d40bf5eeabd57746556dfc956.gif) — SHA-256 `3ec67900e0ce3dacbe79b48bce6637daaf3fe63d40bf5eeabd57746556dfc956`; 513 × 1513 pixels.

**process-documentary-wave-figure-15 — substantive figure.** Pick-group creation follows allocation/container creation. Full containers are considered before loose quantities. Sequence location/zone eligibility controls grouping; a full group creates another cart/group, while nonmatching containers are bypassed for further comparisons.

[Wave Process Summary: Process Flows](../AIM/reading/4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb.md) — n279; article `4febf633605a81b90e6d8ff137a852b584aca0eaaed3dd92f20023b9749906cb`; original SHA-256 `c5b541627ba25ed3d87b245a38a8fd73ee596ebcbb8fe354f5f6bce5b66c93f0`.

[Local asset](../AIM/source/assets/fab7080f7bbfbf7f9d6c155690d3ad679e161e56463b1ef87914cd4be7f86c2e.gif) — SHA-256 `fab7080f7bbfbf7f9d6c155690d3ad679e161e56463b1ef87914cd4be7f86c2e`; 603 × 959 pixels.

**Application/database gap.** Resolve master priority/criteria/maximums, selected step order, run mode, release flag and retry policy independently; build/run/release are distinct boundaries.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Work

Bodies: 2/2; images: 6/6 (6 substantive, 0 decorative).

**User goal.** Work creation turns product-handling needs into warehouse instructions. Work execution is the employee carrying out an instruction, such as picking or counting. A work unit groups the relevant product work.

**Initiation.** An allocation, inventory adjustment, replenishment or other supported need requests work.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-work-r01 — goal and initiation.** Allocation, adjustment or replenishment needs initiate creation of work units; physical execution is a separate employee action. Paper group picking runs outside regular work execution, whereas RF group picking can maintain work while users pick into shipping containers or totes.

[Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md) — n65, n92, n98; article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`; original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`.

**process-documentary-work-r02 — configuration and stages.** Creation filters masters by requesting process, then uses lower priority numbers first and reserves matching requests so later masters do not reprocess them. Order By values sequence requests, instruction numbers identify details, estimated rates support planned time and configured breaks form work units.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n91, n96, n100, n105, n108, n112, n115, n120, n125, n135, n138, n141, n145, n147; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-r03 — configuration.** Wave Replen Work Type can override the creation-master work type for wave replenishment. Auto Print applies to outbound work. The illustrated Order By example uses SHIPMENT\_ID, PICK\_LOC and ITEM ascending, with the work-unit break only on SHIPMENT\_ID.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n145, n150, n128; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-r04 — stages and outcome.** Non-RF users move goods from pick lists and an authorized administrator records worker, times, quantity, exception reason and confirmation in Work Insight. Confirmation advances to Ready for Packing or the configured intermediate status; the document does not equate pick-list printing with execution.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n166, n171, n207, n209, n212, n214, n217, n221, n224, n227, n230, n233, n235, n239; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-r05 — configuration and errors.** RF sign-on selects the default work profile or an authorized alternative. Work type and zone/equipment must fit its details; no eligible instruction sends the employee to a supervisor. System-, user-, or group-user initiation precedes assignment; receipt pre-locate destinations can trigger relocation.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n255, n258, n261, n265, n270, n275, n280, n284, n289, n292; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-r06 — configuration and errors.** Special handling can require location/quantity verification, maximum pickup and authorized location/lot/LP overrides. Short picks reject the short quantity and decrement source On Hand. Partial-pick closure and replenishment/work-order over-pick availability depend on handling settings.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n295, n297, n306, n317, n323, n326, n329, n332; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-r07 — outcome.** Putaway may be automatic under the documented profile setting or explicitly confirmed, with shipping-container identification and optional nesting. Zone-based Picking Management permits multiple employees to execute parts of a work unit, unlike the ordinary single-user description.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n335, n340, n344, n354; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md) — n105, n110; article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`; original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`.

**process-documentary-work-r08 — diagram refinement.** System-directed selection first considers work eligibility, already assigned work and work ahead of the current location. Its configured assignment method determines priority/location/FIFO ordering. An unsuccessful assignment retries selection to address concurrency; returned work still executes in sequence order.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n364; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

**process-documentary-work-figure-44 — substantive figure.** Creation orders eligible masters, compares requests and reserves matches, tries declined requests against later masters, orders matching requests, assigns instruction numbers and builds work units.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n84; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/044ac8c90f9e729ba3dcb31aa3de5b797f3352c6bc79af832416165eaff2fb04.gif) — SHA-256 `044ac8c90f9e729ba3dcb31aa3de5b797f3352c6bc79af832416165eaff2fb04`; 435 × 712 pixels.

**process-documentary-work-figure-45 — substantive figure.** Order By screen example lists SHIPMENT\_ID, PICK\_LOC and ITEM in ascending order. Create Work Unit is Y for SHIPMENT\_ID and N for the other two rows; this is an example, not actual warehouse configuration.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n128; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/b8867a1231f7a5bc233432c6e5b8f0a0b10e6232163ca6ee49bbdde36548a37a.gif) — SHA-256 `b8867a1231f7a5bc233432c6e5b8f0a0b10e6232163ca6ee49bbdde36548a37a`; 506 × 163 pixels.

**process-documentary-work-figure-46 — substantive figure.** Non-RF execution generates and distributes pick lists, physically moves goods, optionally records time/date stamps, returns the completed list and confirms it in Work Insight.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n162; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/bd7c3c1c799b2152615340f5b712d4bd328067c03e4355581601c9ab4d85fcd9.gif) — SHA-256 `bd7c3c1c799b2152615340f5b712d4bd328067c03e4355581601c9ab4d85fcd9`; 595 × 1207 pixels.

**process-documentary-work-figure-47 — substantive figure.** RF flow branches on default/selectable profile and system, user or group-user initiation. It checks work availability/requirements, can relocate a receipt at pre-locate, assigns work, applies handling, and loops complete/short/partial/over picks. Automatic or manual putaway and optional nesting lead to further putaway, work or profile-detail selection; no remaining work sends the user to a supervisor.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n248; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/2042d117262821b56ad147bad022bc7d6d7407f4eb8d28408cc56f6c84004a09.gif) — SHA-256 `2042d117262821b56ad147bad022bc7d6d7407f4eb8d28408cc56f6c84004a09`; 1378 × 4641 pixels.

**process-documentary-work-figure-48 — substantive figure.** Picking Management signs a worker into an active zone, chooses or scans a work unit, optionally prints, assigns then confirms or unassigns it. Picking/short picking into a container and logoff release remaining instructions for the next zone worker. Completion means all work instructions have been executed.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n354; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/055ed6773fbb9e706cb57fef4d4679ae05dcc00ec20835996bab64796654fcee.gif) — SHA-256 `055ed6773fbb9e706cb57fef4d4679ae05dcc00ec20835996bab64796654fcee`; 754 × 2387 pixels.

**process-documentary-work-figure-49 — substantive figure.** System-directed selection retrieves eligible work, favors already assigned work when present, and selects work ahead of the current location if available. Priority/Location/FIFO, Location/Priority/FIFO or FIFO determine the selected instruction. Work-unit assignment failure loops to Start; successful assignment returns work in sequence order, despite selection by a nearby instruction.

[Work Process Summary: Process Flows](../AIM/reading/d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0.md) — n364; article `d114e048049d66584a42a020611a6659f5b2950e0912f87d395e30d98dbed9c0`; original SHA-256 `e212b81418a90830206ba11709a03722cf7282aecc4ed27ee8916844f0879120`.

[Local asset](../AIM/source/assets/e2d742a80ebd52f7f37465db267d562a5724ca1861870fe1a306e9dd56a8dd8f.gif) — SHA-256 `e2d742a80ebd52f7f37465db267d562a5724ca1861870fe1a306e9dd56a8dd8f`; 720 × 832 pixels.

**Application/database gap.** Join the source selection diagram only to separately reviewed SQL contracts; resolve application profile/zone/equipment checks and assignment concurrency before claiming equivalence.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Work Order

Bodies: 2/2; images: 1/1 (1 substantive, 0 decorative).

**User goal.** A work order manages making a finished item from component parts. Components and instructions can come from a bill of material or be entered for the order; movement can use created work or paperwork.

**Initiation.** A work order is created or released, or components are manually allocated.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-work-order-r01 — goal and initiation.** A user or Work Order Creation wave step creates assembly work using a BOM or manually entered finished-item/component/instruction data. BOM revisions support multiple versions; manually entered information is not maintained as a reusable BOM.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n69, n71, n72, n74, n77; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

[Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md) — n64; article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`; original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`.

**process-documentary-work-order-r02 — configuration and stages.** Components can be allocated on creation, on release, or manually later. A BOM quantity increase applies only when configured and its minimum is reached. Release then drives movement of components to the build location and assembly/confirmation of finished items.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n81, n83, n85, n87, n101, n103, n105; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

[Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md) — n86; article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`; original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`.

**process-documentary-work-order-r03 — configuration and outcome.** Create Work plus matching component/finished-item criteria creates movement work and In Transit stock. Without Create Work the application transfers On Hand automatically; physical component/finished-item delivery is still required and may be guided by paperwork.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n89, n93, n96, n99, n101, n108, n112, n115, n118, n67; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

[Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md) — n98, n101, n104, n105; article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`; original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`.

**process-documentary-work-order-r04 — additional capabilities.** The source supports finished-item breakdown into components, manually or automatically printed picking/instruction/putaway lists, and interfaces for work orders/BOMs. These statements do not establish installed interface configuration or demonstrated disassembly.

[Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md) — n91, n96, n98, n101, n104, n110; article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`; original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`.

**process-documentary-work-order-r05 — source exception.** The diagram first calls creation-time allocation allocation of the finished item, while prose describes components. Its last box delivers finished items to storage; prose n121 says build location despite preceding storage movement. Both inconsistencies are retained rather than resolved into a deployment claim.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n67, n81, n115, n118, n121; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

**process-documentary-work-order-r06 — error handling.** When Create Work is enabled but no component work-criteria record applies, the prose calls for deallocating components, creating a suitable criteria record and allocating again. Missing finished-item criteria also prevents movement-work creation. This is documentary recovery guidance, not an authorized operational action.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n92, n111; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

**process-documentary-work-order-figure-04 — substantive figure.** Manual or wave creation leads to allocation and release. Component movement branches between created work and automatic system transfer, then physical delivery to the build location. Assembly/confirmation leads to another work-versus-transfer branch and physical delivery to storage. The first allocation box says finished item, differing from component-allocation prose; the final storage box differs from prose n121 build location.

[Work Order Process Summary: Process Flows](../AIM/reading/13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b.md) — n67; article `13f4293e76dae913600b8728475cf98fe2a2c0bb0185e121900654e1f3bf1a4b`; original SHA-256 `9a05bfd9eee65bdbea11d5fee9f84a22e8d36a0b375d9e47d14513de0c09539e`.

[Local asset](../AIM/source/assets/ab04fefe9d379657a5489657bdbc5727bf332ce7e3e02a6b49b4c6120eae6c21.gif) — SHA-256 `ab04fefe9d379657a5489657bdbc5727bf332ce7e3e02a6b49b4c6120eae6c21`; 627 × 844 pixels.

**Application/database gap.** Resolve allocation timing, component quantity increases and criteria failure recovery; source diagram/prose disagree on allocation entity and final location wording.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

## Yard Management

Bodies: 3/3; images: 1/1 (1 substantive, 0 decorative).

**User goal.** Yard management tracks trailers outside the warehouse and their moves to receiving. Trailer check-in, yard moves and final checkout are distinct events; receipts need an associated trailer ID.

**Initiation.** A trailer arrives and is checked into a yard location.

The goal and initiation retain the introductory review; its exact references remain unchanged in JSON.

**process-documentary-yard-management-r01 — goal and initiation.** Yard management tracks arriving trailers through guard check-in, yard/dock movement, inbound processing and guard checkout. A receipt must carry a trailer ID for the documented check-in process; appointments are optional.

[Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md) — n68, n87, n93, n95, n97; article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`; original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`.

[Yard Management Process Summary: Scenarios](../AIM/reading/7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b.md) — n71; article `7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b`; original SHA-256 `1d0a89d69c03aeacab65b7a8e7b508281fc8ac80b2feb1676d0d00435fa58cb3`.

**process-documentary-yard-management-r02 — configuration.** Yard spaces are defined as dock locations in SCALE. The guard can assign a yard destination or an available Receiving Dock; an appointment can default that dock. The example assumes a fenced yard and an existing receipt/trailer association.

[Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md) — n99; article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`; original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`.

[Yard Management Process Summary: Scenarios](../AIM/reading/7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b.md) — n71; article `7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b`; original SHA-256 `1d0a89d69c03aeacab65b7a8e7b508281fc8ac80b2feb1676d0d00435fa58cb3`.

[Yard Management Process Summary: Process Flow](../AIM/reading/19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e.md) — n69; article `19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e`; original SHA-256 `8f6b08bed008c84e3f4f9b8b5b4ff5f67c1cdd712509257d63946c27891c8757`.

**process-documentary-yard-management-r03 — stages and outcome.** RF yard jockey moves identify trailer and destination. A previously assigned destination defaults unless the trailer is already there, in which case Receiving Dock defaults. After inbound processing the trailer can return to storage before full-screen checkout.

[Yard Management Process Summary: Scenarios](../AIM/reading/7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b.md) — n76, n81; article `7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b`; original SHA-256 `1d0a89d69c03aeacab65b7a8e7b508281fc8ac80b2feb1676d0d00435fa58cb3`.

[Yard Management Process Summary: Process Flow](../AIM/reading/19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e.md) — n69; article `19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e`; original SHA-256 `8f6b08bed008c84e3f4f9b8b5b4ff5f67c1cdd712509257d63946c27891c8757`.

**process-documentary-yard-management-r04 — error boundary.** The retained summaries state receipt/trailer eligibility and dock availability but do not specify all collision, concurrent-move, checkout-validation or exception-recovery rules; those remain application/configuration gaps.

[Yard Management Process Summary: Scenarios](../AIM/reading/7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b.md) — n71, n76, n81; article `7443e3e89496f9304c291b1ef7f8b58a902c25013eb2530e642fdf872731807b`; original SHA-256 `1d0a89d69c03aeacab65b7a8e7b508281fc8ac80b2feb1676d0d00435fa58cb3`.

[Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md) — n68, n99; article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`; original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`.

**process-documentary-yard-management-figure-05 — substantive figure.** The diagram assumes an existing receipt with trailer ID and an external yard. Guard check-in and destination assignment branch to yard parking or Receiving Dock; RF moves can reposition trailers until receipt processing. Once inbound processing finishes, the trailer may return to yard storage before guard checkout. No database transaction or conflict-resolution logic appears.

[Yard Management Process Summary: Process Flow](../AIM/reading/19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e.md) — n69; article `19121afbb15611fdef34a586884686e2483c2abdfeb6dc2dc7f3897d0369337e`; original SHA-256 `8f6b08bed008c84e3f4f9b8b5b4ff5f67c1cdd712509257d63946c27891c8757`.

[Local asset](../AIM/source/assets/31cb5317361ceaf77811c8d82035f6fc96fb76a034bdbd3841bd9d56a2103741.gif) — SHA-256 `31cb5317361ceaf77811c8d82035f6fc96fb76a034bdbd3841bd9d56a2103741`; 552 × 1002 pixels.

**Application/database gap.** Resolve trailer/receipt association, destination defaults, dock availability and concurrent move/checkout validation; the flow has no database transaction contract.

Installed settings, calling application behavior, transaction boundaries and execution acceptance remain unestablished. See the preserved introductory evidence gap and new source-bound refinements in JSON.

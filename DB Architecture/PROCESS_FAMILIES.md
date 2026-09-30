# Reviewed process-family passages

All 34 captured families have introductory text-passage reviews. Expanded full-body and static-figure review is linked separately below when available, preserving the original introductory evidence. Zero families have full deployment reconciliation. These headings are not an exhaustive SCALE capability denominator.

## Allocation

Allocation chooses which storage locations will supply a request for product. Work creation then turns the allocated quantity into warehouse tasks.

Trigger: The allocation step runs in a wave before work creation.

1. Apply allocation-rule sequences in numeric order; each sequence combines eligible locations with a selection strategy.
2. Reserve selected inventory when pick confirmation is used. The documented alternative removes inventory when the load is confirmed.

Configuration: Allocation rules combine location selection and strategy. Item and location characteristics can affect selection and ordering. Pick-confirmation behavior changes when inventory is removed.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which allocation rule and pick-confirmation mode does the application select for this deployment? Obtain sanitized rule-assignment and wave-step bindings, without inventory or shipment records.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Allocation-request conversion, splitting and destination/container linkage are concrete supporting behaviors; location-selection strategy and effective allocation rules remain unreconciled. [Exact reviewed batch](mappings/batches/allocation-wave-replenishment.json).

Partial deployed association: UOM candidate precedence and conversion helpers support allocation metadata; no complete allocation strategy, stock reservation or effective rule assignment established. [Exact reviewed batch](mappings/batches/function-semantics.json).

`family-source`: [Allocation Process Summary: Functionality](../AIM/reading/a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3.md); AIM article `a2d8089500b1e693033fa7cbf77ca4b879de2a70a0a976f2d5cb926deb137ba3`, original SHA-256 `4bb0846eaeda14b5bf3a42ee4d3887811eb92d8143191fcdfba8c732c51c2043`, nodes n67, n69, n71, n73, n75.

## Billing Management Integration

The documented integration sends SCALE data to a separate Billing Management application so warehouse work can support third-party charges.

Trigger: A configured integration uploads SCALE data to Billing Management.

1. Upload relevant system data to the separate billing application.
2. The billing application calculates, tracks and charges for warehouse work.

Configuration: The integration and the separate billing product must be configured; this summary does not establish field mappings or retry settings.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Is this deployment integrated with Billing Management, and what upload contract applies? Obtain a sanitized integration/version mapping and acknowledgment contract.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Billing Management Integration Process Summary: Functionality](../AIM/reading/07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41.md); AIM article `07dfda3003b2e06f5c5ab468f983c79caca43080bedaf1f3d7554f6321715a41`, original SHA-256 `de2b53f4e532ff96b20d7797a0d17b4447c55e256519ecab5bf5e786b51d2d92`, nodes n65.

## Carrier Management

Carrier management controls carrier selection and shipping rules. Routing guides, shipping calendars and estimated container counts can affect the available shipping choices.

Trigger: Carrier assignment or rating during outbound processing.

1. Use routing guides to identify a carrier or group for a customer/company and weight or container range.
2. Apply carrier no-ship calendars; wave container estimates can be used for rating.

Configuration: Routing guides can vary by weight and container count. Calendars identify excluded dates or weekend days. Carrier records can inherit shared setup; additional shipping services have their own configuration.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which carrier/rating service version and routing guide apply here? Obtain sanitized carrier-service bindings and routing precedence, without addresses or shipment data.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Carrier Management Process Summary: Functionality](../AIM/reading/0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4.md); AIM article `0f22f1f323600031ea5c3cc568dd2af321864f30780e3c575cac1c2905eaa2e4`, original SHA-256 `6cae75f2a3d61f172808f8acc5a96ad0bc3875fc54c44c6a26bfe7d8b8ae2bd2`, nodes n65, n67, n69, n71, n73, n75.

## Container Creation in the Wave

A wave can create shipping containers for allocated line quantities. A container strategy determines how those quantities are combined or split.

Trigger: The container-creation wave step executes.

1. Use the allocated shipment-line quantities as the input to container creation.
2. Apply the configured strategy to determine the containers and distribute quantities.

Configuration: The documented strategies are Consolidate And Do Not Split, Split And Do Not Consolidate, Consolidate And Split Only Once, and 3D Cubing.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which container strategy and packing constraints are assigned to the wave? Obtain sanitized wave-step and strategy contracts; do not infer a strategy from existing containers.

Expanded captured documentary review: 2/2 text bodies, 9/9 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Container Creation in the Wave Process Summary: Functionality](../AIM/reading/ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780.md); AIM article `ac1a4d877d9ffe1b990794887848f749622dd7c2cd0a9ad41e79766deab74780`, original SHA-256 `bf4db6f7da1b69fb0d340568d3638f92ca64c2a646be9f5f2f756715e2983c15`, nodes n65.

## Cycle Counting

Cycle counting compares a physical count at a location with the quantity recorded by SCALE. It can start from a count plan or from activity that makes a location due for counting.

Trigger: A user creates a count plan, or the system creates activity-driven count instructions.

1. Select work through a plan-based or activity-driven count request.
2. Physically verify whether the location inventory matches the recorded inventory.

Configuration: Plan-based and activity-driven counting have different triggers; reconciliation tolerances and approval rules need further source review.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which count tolerances, recount and approval rules are enabled? Obtain sanitized cycle-count configuration and application handling; no physical counts are available here.

Expanded captured documentary review: 2/2 text bodies, 3/3 static image references, 5 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Related bounded help topics: inventory-activity-count [Exact reviewed batch](mappings/batches/inventory.json).

`family-source`: [Cycle Counting Process Summary: Functionality](../AIM/reading/548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3.md); AIM article `548d817cbc4d0efb1392d60c7811bc8f3021bcab5f4dbe675984c54a883ca5b3`, original SHA-256 `62b53306bb40dde023f7fe8b495cff98a3604c93e7613707f4547202de3ae47c`, nodes n66.

## Device Integration Framework

The Device Integration Framework connects SCALE with automation equipment, such as conveyors or pick-to-light systems. It exchanges messages; a received file alone does not prove the requested warehouse action finished.

Trigger: Equipment exchanges messages, or files arrive for a configured transfer process.

1. The configured file transfer reads supported files from designated folders into incoming-message handling.
2. Configured post-processing can change an extension, move the file and insert an incoming-message record for subsequent processing.

Configuration: File formats, extension rules, destination handling and whether to insert a message are configuration choices.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which device service, message handler and acknowledgment/retry rules are installed? Obtain sanitized service/version and message-schema evidence, without endpoints or live payloads.

Expanded captured documentary review: 2/2 text bodies, 2/2 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Device Integration Framework Process Summary: Functionality](../AIM/reading/6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60.md); AIM article `6678efaf48f28c0a44b2e1460d2ab6c18050a333a56de1c53ba503cb274c6b60`, original SHA-256 `74bb52247a8d357f0ae9e8639f45f24337864b942d0f0c28254ea313a5f68966`, nodes n65, n67, n69.

## Dock Management

Dock management tracks containers through packing-area consolidation, staging and truck loading. These stages use distinct inventory-tracked locations and can be enabled separately.

Trigger: Shipment containers reach the outbound dock area.

1. Consolidate items or containers at a packing-area location when that process is enabled.
2. Use staging locations and dock-door locations for enabled staging and loading stages.

Configuration: Each dock-management process can be independently enabled or disabled.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which consolidation, staging and loading stages and status flows apply here? Obtain sanitized stage configuration and location-class mapping.

Expanded captured documentary review: 2/2 text bodies, 3/3 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Dock Management Process Summary: Functionality](../AIM/reading/9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c.md); AIM article `9857f2ac70834cdabe3e8245f2ee06c0451ed99523ada65852b8863953ad7b1c`, original SHA-256 `d3c20015a2fe617a03fced72f7bc976f250507efe52b67d6febe460194ff44c3`, nodes n65.

## GS1 Barcode

A GS1 barcode can carry several data elements, such as an item, quantity or lot. SCALE uses application-identifier templates to interpret those elements; the template may be associated with a receiving preference.

Trigger: A barcode is interpreted during a supported process; label creation can occur in a wave or when closing a container.

1. Interpret barcode segments using the applicable application-identifier template.
2. The documented wave and close-container processes can generate GS1 labels from configured templates.

Configuration: Application-identifier templates determine parsing. Receiving preferences can select a template; generic supplied labels can be customized.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which barcode/template version and receiving-preference binding apply? Obtain a sanitized template definition and synthetic barcode example; current GS1 standard compliance is not established by this captured summary.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 2 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [GS1 Barcode Process Summary: Functionality](../AIM/reading/5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069.md); AIM article `5f876e2632897c1569720f398a7ed5a564bc2d5792bad79a2a06d674e41e6069`, original SHA-256 `56aefab9a84d3879c034c2d09a2f71c62781a1cbd314d2c38c6254e205c88c6c`, nodes n64, n66, n68.

## General System Concepts

Warehouse, company and user setup provide the context for SCALE activity. A warehouse identifies where transactions occur, while user profiles and security records influence access.

Trigger: An authorized user opens a function in a configured warehouse.

1. Associate transactions with a warehouse; the vendor summary requires at least one warehouse.
2. The captured window-security description checks user-level records when present and otherwise references system-level records.

Configuration: Company setup supports multi-company processing. User profiles carry preferences and company authorizations. The historical documented security default must not be treated as the permissions of this deployment.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which deployed version and authorization layer govern access? Obtain a sanitized security model and application-version contract, never another user profile or password.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [General System Concepts Process Summary: Functionality](../AIM/reading/85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1.md); AIM article `85149c7693291207b2c43b2565198094a6af1ad3eaa3cb03fe2dfa28c7a351d1`, original SHA-256 `2abb64aa793ebb9b72cbcfc007af8c24f6508deebb57bcf432a46085bd48bfaf`, nodes n76, n81, n86, n91, n93, n95, n97, n100.

## Immediate Needs

Immediate needs record product that cannot yet fulfill a shipment, work order, replenishment or short pick. Newly received stock can then be allocated to fill that shortage.

Trigger: A supported request cannot be completely fulfilled.

1. Log an immediate-needs request for the unmet quantity.
2. Use newly received quantity to fulfill the need; requests for the same item are considered using their priorities.
3. The documented viewer removes the request after fulfillment closes it.

Configuration: The trigger defines a default priority, which can be changed for a request. Priority comparison is documented for requests of the same item.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which immediate-needs triggers and priority rules apply to the process? Obtain sanitized trigger definitions and fulfillment bindings, without shortage records.

Expanded captured documentary review: 2/2 text bodies, 0/0 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Immediate Needs Process Summary: Functionality](../AIM/reading/5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d.md); AIM article `5dc3ad182d2fa6eed29085709e0c784b0b831ddb4bf10e21616b711279fd1c2d`, original SHA-256 `f909c9c7b964714a286e52d66ffbc21159ed3371740322e650197b40dd19d0e3`, nodes n65, n67, n69.

## Interface

Interfaces exchange records between SCALE and an order system. A job can be started manually or by a schedule, and one failed file does not necessarily stop other files from being processed.

Trigger: A manual or scheduled upload/download starts.

1. Process appropriate files or records from earliest to latest last-modified time.
2. Record detailed errors for failures; when processing several files, continue with other files after a file-data error.

Configuration: Transport mode, touchpoint and schedule determine the interface path; those active settings are not supplied by this summary.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: What installed interface mode, schema, idempotency and acknowledgment rules apply? Obtain sanitized interface contracts and version evidence; do not inspect live payload/error files under this task.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Interface Process Summary: Functionality](../AIM/reading/178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e.md); AIM article `178aec6d3faf8830199512924f58cf463d20acfbc6b6485c40a0948c32a1cd0e`, original SHA-256 `16a5da0368ba8d3c53860134e3270982414a29c92ad4c62f1c13da24e4067a7c`, nodes n66, n68.

## Inventory Management

Inventory management corrects recorded stock outside ordinary picking or putaway. The adjustment class determines how an adjustment type is processed; license-plate transactions can handle mixed product together.

Trigger: An authorized user completes an inventory adjustment or transfer.

1. Process the selected adjustment type according to its adjustment class.
2. Apply the documented inventory change when the transaction completes; license-plate tracking can extend the context.

Configuration: Adjustment types/classes and license-plate tracking affect processing. The captured summary restricts Lot Insight adjustment/status-change/transfer when inventory attributes are linked.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which adjustment class, permissions and attribute restrictions apply? Obtain sanitized adjustment definitions and caller transaction behavior; individual balances remain outside scope.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Related bounded help topics: inventory-empty-source, inventory-destination-units [Exact reviewed batch](mappings/batches/inventory.json).

`family-source`: [Inventory Management Process Summary: Functionality](../AIM/reading/9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe.md); AIM article `9c9b2f34d8c2aeee8291236b7db3a8d7712db3a3188eda0681cc00157c1ccdfe`, original SHA-256 `9fe93dc5c192f74ebe3d424157aa85d024f7079485cbc7e9c9c475c794e7eee6`, nodes n66, n68, n70, n74, n75, n76.

## Inventory Tracking

Inventory tracking records where stock is and what state it is in. Quantity categories distinguish inventory states, and lots, serial numbers, catch weights and attributes provide additional identification.

Trigger: Product enters, moves through or leaves the warehouse.

1. Track product location and state through its warehouse journey.
2. Use quantity categories and applicable lot, serial, weight and attribute identification.

Configuration: The summary names the tracking dimensions; item-specific activation and quantity equations require the detailed contracts.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which item tracking controls and quantity-category rules apply to this workflow? Obtain sanitized rule definitions and application bindings; no current quantities are known.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Related bounded help topics: inventory-quantity-buckets, inventory-serial-linkage, inventory-lot-lifecycle [Exact reviewed batch](mappings/batches/inventory.json).

`family-source`: [Inventory Tracking Process Summary: Functionality](../AIM/reading/de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c.md); AIM article `de1742b64ef4309ef4218ae2c31c0200d48c4bbe37e994ff9b64365ea255a28c`, original SHA-256 `b87db78c2d841a850fc229481eabccd5eea820d3fee31495a2578a92707c5a88`, nodes n64.

## Item

Item setup defines product characteristics and handling controls, including locating, allocation, lot and serial behavior. The captured summary also describes using shipment-line item values when separate item records are not maintained.

Trigger: An item is configured or supplied through interface/shipment-line data.

1. Use item characteristics and handling controls when processing the product.
2. In the documented optional-item-master path, reference values supplied on shipment lines.

Configuration: Item controls can include allocation/locating rules and tracking requirements. Company context matters in multi-company use.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Does this deployment require item masters, and which field defaults/overrides apply? Obtain the installed item/interface contract; optional behavior in the summary is not a deployment guarantee.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 2 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Item Process Summary: Functionality](../AIM/reading/d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0.md); AIM article `d805afb741af2fe0359ea6a96de0677c5ef0bb1532f7454099e15ce9f148c9b0`, original SHA-256 `ac7b4d20dd4c56102e0606305932bbc6c3688cab1a4fdf0f3a6a141f6c0505a7`, nodes n64.

## LTL Rating

Less-than-truckload rating calculates freight for a shipment using route, weight and freight class. SCALE’s documented internal rating also considers minimum charges and whether the next weight break would be cheaper.

Trigger: An LTL shipment is rated.

1. Determine a rate base using warehouse origin, shipment destination and any additional configured criteria.
2. Rate each freight class and weight, total mixed classes and check carrier minimums.
3. Apply the documented deficit-weight comparison against the next weight break.

Configuration: Rate bases contain class/weight breaks; carrier minimums and route criteria influence the calculation.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Is internal LTL rating or an external rating service used, and what contract/version applies? Obtain sanitized rating configuration; no current price, tariff or shipment quote is established.

Expanded captured documentary review: 3/3 text bodies, 1/1 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [LTL Rating Process Summary: Functionality](../AIM/reading/66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376.md); AIM article `66f522d9ea61a79265d4f554eefaa3cf9eb580ca5083eb1e4a3282e7a7c55376`, original SHA-256 `ecf370ae2e20127447eeb2276766ecffcb7d9e7f73ecd56a1097f70a134337d2`, nodes n67, n69, n71, n73, n75, n77.

## Labor Management

Labor management collects productivity information from warehouse actions such as picking, packing and receiving. It supports comparing work and plans with expected performance.

Trigger: Workers perform supported warehouse actions.

1. Generate labor data from supported work execution, packing and receiving activities.
2. Use the recorded data to assess productivity and compare labor plans with expectations.

Configuration: Activity definitions, standards and plan configuration are not established by the reviewed summary.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: What time boundaries, standards and exclusions define each labor measure here? Obtain sanitized measurement definitions and correlation design; no employee performance data is authorized.

Expanded captured documentary review: 3/3 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Labor Management Process Summary: Functionality](../AIM/reading/7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65.md); AIM article `7dd4c71c4fffda7e9ee1126c5142b92f5d6ebf82faf4a4f204c59dfe5f1bfd65`, original SHA-256 `54c9034017f6e99c435f01fb8113c4cbb342583be0357d049f2bf4364b00d066`, nodes n68.

## Locating

Locating chooses a storage destination for checked-in product. Rules select candidate locations and a strategy; creating putaway work is a separate choice. Delayed locating can first send the container to a receiving pre-locate area.

Trigger: Checked-in containers are submitted for locating.

1. Select the applicable locating rule, using the parent rule when locating by parent and the nested-container rule when locating by child.
2. Evaluate rule sequences in numeric order, applying each location selection and strategy.
3. If both Delayed Locating and Create Putaway Work are active, locate with work to the receiving pre-locate location; otherwise use rule details.

Configuration: Rules can be assigned on the item or through rule-set assignment. Strategies and eligible locations govern placement. Delayed locating requires both flags; one active flag is insufficient.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which rule assignment and receiving preference are effective for the container? Obtain sanitized assignment and preference contracts. Aggregate delayed-locating flags cannot establish per-container behavior.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Named rule-header retrieval and receipt-container locating-rule FK support configuration linkage only; strategy execution and effective assignment remain unknown. [Exact reviewed batch](mappings/batches/receiving-shipping.json).

`family-source`: [Locating Process Summary: Functionality](../AIM/reading/4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa.md); AIM article `4007cca3ce3ca3273f3ee4e6d51d7027ae1816c6f7ce71af9f254400514146aa`, original SHA-256 `e215745a6d81b87363e12c8d05d0ac51d7b6337430ce4b448bc6edcedf67b24a`, nodes n64, n66, n81, n83, n85, n87, n90, n94, n96, n98, n102, n105, n108, n113.

## Location

A location is a defined place where stock can be picked, put away or replenished. Location types share dimensions and capacity settings, while movement classes describe what kinds of product can be stored there.

Trigger: Warehouse locations are defined and referenced by warehouse work.

1. Associate a location with a location type where common dimensions and quantity limits are needed.
2. Use movement-class rules to identify the types of product allowed in that location.

Configuration: Location type, capacity and movement class influence use; actual availability remains operational data.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: What inheritance/override rules apply between a location and its type? Obtain sanitized definitions and the installed resolution contract.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 2 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Location Process Summary: Functionality](../AIM/reading/21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae.md); AIM article `21428da0ae44e13ca2c0bcefba196f6df8418538d3c715c19189eea8ec30c5ae`, original SHA-256 `d517ff8730848df37cb3418877be0cb80e0e68650ed39845945145bad5425462`, nodes n63.

## Multi-Language Support

Language behavior depends on which SCALE interface is being used and which translations are installed. Desktop, browser, RF device and TPM settings are described separately in the captured documentation.

Trigger: A user opens an interface or online help.

1. Use the applicable translated resources; the documented desktop path follows Windows-user language and other application screens follow browser language.
2. RF language can be selected on the device; the documented TPM language uses its server-side web-user setting.
3. For online help, use a matching language folder when available, otherwise fall back to the base help.

Configuration: Resource files and translated help must exist; a language preference alone does not supply a translation.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which client types and localization version are installed? Obtain sanitized client/resource-language inventory and fallback rules; the historical desktop model may differ from current clients.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Multi-Language Support Process Summary: Functionality](../AIM/reading/3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea.md); AIM article `3e7f7707cbad374ac9e9f33aea0d9c046ee877c02eff247d8fd4776e6a8038ea`, original SHA-256 `1b7d8d6f4ca55bcae49fb22b6cf405789100c3d2c1f8b11214c085cad5b45a33`, nodes n63, n80, n82, n87, n92, n97, n102, n104.

## Packing/Shipping

Packing associates shipment lines with containers, validates items and generates packing labels. Shipping then manages packed shipments through dock processing and confirmation.

Trigger: Allocated/picked shipment quantities enter the applicable packing and shipping flow.

1. Associate lines with containers, validate items and generate packing labels in the documented packing process.
2. Manage packed shipments at the dock through load confirmation and departure processing.

Configuration: The reviewed summary separates packing and shipping; exact status-flow, validation and confirmation settings need deployed evidence.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which packing validation and shipping confirmation steps are active? Obtain sanitized status-flow/application bindings, carrier handoffs and print acknowledgments.

Expanded captured documentary review: 2/2 text bodies, 3/3 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Container root identity initialization and confirmation status propagation implement bounded storage effects; packing, carrier, labels and departure remain external. [Exact reviewed batch](mappings/batches/receiving-shipping.json).

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Packing/Shipping Process Summary: Functionality](../AIM/reading/5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66.md); AIM article `5ac29e4a274425e27625988f719182ef57034ce6339602c8fa1afa288cacbe66`, original SHA-256 `3e1681439112d83ef8fba00cc2eb8510f26367574d860634bfb01850bf937e8c`, nodes n65.

## Paperwork

Paperwork produces documents and labels at warehouse processing points such as waves, container closure and shipment or load confirmation. A configured rendering or printing service produces the output.

Trigger: A configured inbound or outbound processing point requests documents or labels.

1. Choose the configured document/label template for the processing point.
2. Use the configured renderer/printer, such as the vendor-described reporting or label application.

Configuration: Renderer selection and customized templates change the output. A listed document does not prove successful dispatch or physical printing.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which renderer, template version and delivery acknowledgment apply? Obtain sanitized document-service bindings and a synthetic output sample; do not print labels for diagnosis.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Paperwork Process Summary: Functionality](../AIM/reading/55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56.md); AIM article `55af77d15ea086df1525f231a6b3792823d2c0be73ad904b830fb751012a0e56`, original SHA-256 `f7d597f378321afb3251784f133a91d233a2f24534422bf53cfcefa420168688`, nodes n66.

## Performance Management

Performance management combines history, alerts and reporting to help explain warehouse activity. Transaction history describes inventory changes; process history describes system decisions. An alert request still needs later processing.

Trigger: A warehouse event, decision, discrepancy or configured alert condition occurs.

1. Record the relevant transaction, process, quality or receipt-quality history described by the vendor.
2. Create an alert request for a configured condition. A scheduled alert job subsequently processes it into alert output.

Configuration: Alerts can produce history, email or both; configured jobs run reporting and other scheduled processes.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which history retention and alert-delivery jobs are configured, and what proves delivery? Obtain sanitized job/retention contracts and correlation semantics; no event completeness is assumed.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Performance Management Process Summary](../AIM/reading/b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c.md); AIM article `b9f415be06c542c5d9cfde6e82f215db824f5cfc894b21e3c1db55c08bdb7b3c`, original SHA-256 `e416ac0d38d63480fb6f4326ad6e321d40c0d947b7c6a77295d33305e4846363`, nodes n63, n87, n91, n94, n97, n100, n104, n109.

## Quality Control

Quality control checks inbound product or outbound container contents before normal processing continues. The inbound process holds the relevant receipt quantity for inspection; outbound failures need resolution before the next status step.

Trigger: Eligible inbound items are received, or outbound containers are selected for QC.

1. For inbound QC, route a portion to inspection and hold the remaining quantity in the inspection status; disposition after inspection depends on the result.
2. For outbound QC, assign during the wave, at eligible work start or through an authorized manual action.
3. Evaluate active QC assignment rules in ascending priority and mark a matching container QC Pending; resolve failures before continuation.

Configuration: Inbound eligibility is configured on the item. The captured documentation supports check-in-created license plates, not downloaded receipt containers. Work-start assignment applies to existing wave-created containers, not new containers introduced during RF picking.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which QC assignment, item eligibility and disposition rules apply? Obtain sanitized rule definitions and status transitions; actual inspection results are not available.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Reviewed module bodies support the linked bounded topics. Vendor passage association does not establish installed application binding or complete process reconciliation. [Exact reviewed batch](mappings/batches/shipping-interfaces.json).

`family-source`: [Quality Control Process Summary: Functionality](../AIM/reading/7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff.md); AIM article `7fee83bedacc280d73ab8604d7da77e350970595a7d54a61a63799eeb27494ff`, original SHA-256 `51b07421090b73e4d97f4a49f4d74557d4ca6d71bb35156614a6e641675ce7ce`, nodes n64, n87, n92, n96, n99, n102, n104, n106.

## Receiving

Receiving first checks product into the warehouse and then locates it for storage. Check-in creates receipt containers for all or part of a line; locating chooses their destination.

Trigger: Product arrives against an interfaced or application-created receipt.

1. Check in quantity and create receipt containers, consolidating into the largest unit of measure the quantity accommodates.
2. Allow uncheck/recheck while successful locating has not occurred.
3. Locate the checked-in containers using the separate locating process.

Configuration: Receipt quantities and units of measure affect container creation; locating and putaway preferences govern subsequent steps.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: What receiving preferences, over/under-receipt controls and locating handoffs apply? Obtain sanitized configuration and application contracts; no receipt quantities are inspected.

Expanded captured documentary review: 2/2 text bodies, 3/3 static image references, 5 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Receipt container identity mutation is related to vendor-described receiving containers, but this helper does not implement check-in quantities or locating. [Exact reviewed batch](mappings/batches/receiving-shipping.json).

`family-source`: [Receiving Process Summary: Functionality](../AIM/reading/b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369.md); AIM article `b9c3ffa9a81498cb548bdb61d00ba2dd34e5bfb79695f24b28a31d26d9eb8369`, original SHA-256 `b34355dc06ff7bda053191f657f72735d152012a6fe33cee1a2f714c9453d8b2`, nodes n65.

## Replenishment

Replenishment moves stock from bulk storage toward forward picking locations. Creating a replenishment request and creating the work to move it are separate stages controlled by the replenishment master and wave flow.

Trigger: A manual request, configured wave step or real-time minimum-threshold condition starts replenishment.

1. Use the replenishment master and allocation rule to obtain product from bulk and represent quantity in transit to the forward location.
2. Apply a fill or whole-increment rounding strategy to the requested quantity.
3. For wave-generated requests, automatic work needs both a work-creation wave step and an Automatic Create Work Method; manual and real-time requests follow the master method.

Configuration: Minimum thresholds may be defined at location/location-type or item/item-class scope. The reviewed summary does not resolve all override precedence. Fill Destination disregards Maximum Replenishment Percentage; rounding down and rounding up have different quantity results.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which threshold inheritance, master and work-creation method apply? Obtain sanitized scope/precedence and wave-step bindings; do not infer that every replenishment creates work immediately.

Expanded captured documentary review: 3/3 text bodies, 6/6 static image references, 5 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Capacity fallback, evaluation flag, request splitting/counting and cancellation implement bounded replenishment behavior; configured master, scheduler, routing and physical execution remain unreconciled. [Exact reviewed batch](mappings/batches/allocation-wave-replenishment.json).

Partial deployed association: Availability and measurement functions support replenishment decisions; branch-specific NULL/filter/fallback behavior does not establish actual replenishment amount or work creation. [Exact reviewed batch](mappings/batches/function-semantics.json).

`family-source`: [Replenishment Process Summary: Functionality](../AIM/reading/b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1.md); AIM article `b254d4db09e26e4051dbd17a72fdac027fe6db1686788a4353a109d9882819c1`, original SHA-256 `9b560a988caa9db9aaa507fc0d4cecf68e8f7961c13c99fa1c954cd7b332d6be`, nodes n69, n72, n93, n100, n104, n108, n116, n120, n127, n130, n133, n138.

## Retail

Retail functionality supports distributing product to multiple stores and cross-docking received product toward outbound delivery. Cross-docking moves product through receiving to shipping without the ordinary storage path.

Trigger: Store orders are processed or received product is designated for cross-docking.

1. Use store orders, also called distros, to distribute product to multiple store destinations.
2. Where configured, transfer received product to the shipping dock for customer delivery.

Configuration: The reviewed summary identifies capabilities; distribution, allocation and cross-dock eligibility rules require further review.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which distro/cross-dock strategy and order-matching rules apply? Obtain sanitized retail configuration and application bindings, without store order data.

Expanded captured documentary review: 3/3 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Retail Process Summary: Functionality](../AIM/reading/d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe.md); AIM article `d66501685943e369aafe700282173d0b45d991727af47ccc51e47478b4a362fe`, original SHA-256 `a1a9a1e3afc8fdfb208c84f118d9b70cb9741ea40636bdbf944a8aace23d8d7d`, nodes n68.

## Returns

Returns processing handles unwanted or damaged product from arrival through preparation for putaway. Putaway groups can combine related returned items for one trip.

Trigger: Returned merchandise arrives at the receiving dock.

1. Check in and locate the returned items.
2. Arrange items into putaway location groups so related items or items in the same locating zone can move together.

Configuration: Putaway location grouping influences the trip; disposition rules for usable and damaged goods are not established by this summary.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which return disposition, inventory status and grouping rules apply? Obtain sanitized returns definitions and resolution paths.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Returns Process Summary: Functionality](../AIM/reading/ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456.md); AIM article `ab511acd0eb85811a8567d2fc518dc5865a8177edddadafe02ff1c95ed87d456`, original SHA-256 `875b8f400ce5607b4ff4cea042183deff1cd8de801a72f01876ec507a40e2987`, nodes n65.

## Status

Statuses show progress through receiving or shipping. Lines follow their assigned flow, and header leading/trailing values summarize the most and least advanced progress. A Closed receipt does not always prove physical putaway when work creation is not required.

Trigger: A receipt or shipment line enters a status flow and processing advances.

1. Use the line’s assigned custom flow, or the default flow when no custom flow is assigned.
2. Process the configured statuses in sequence and update parent progress as lines and containers advance.
3. Interpret leading and trailing status together. For the documented no-work receiving path, locating can lead to Closed without a work-confirmation step.

Configuration: Custom flows can use fewer statuses and must be defined and associated before interface processing. The documented meaning of outbound 995 is Finished Item Is Allocated on a component line; this is vendor meaning, not verified effective deployment configuration.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which active default/custom flow, labels and application transitions apply? Obtain sanitized flow definitions and bindings; aggregate flags cannot prove a valid transition for an individual transaction.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Configured mapping/adjacency and slot transforms support status interpretation; active flow assignments and valid process transitions remain unreconciled. [Exact reviewed batch](mappings/batches/function-semantics.json).

Partial deployed association: Action mapping, supplied confirmation status propagation and warehouse-local date conversion relate to documented status concepts without proving current allowed transitions/custom flow. [Exact reviewed batch](mappings/batches/receiving-shipping.json).

`family-source`: [Status Process Summary: Functionality](../AIM/reading/5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d.md); AIM article `5457fa08c32aa8b1137227340752ca7675d89f3e0a75f512094c3fb5a453b39d`, original SHA-256 `2cc05e7c1cef1d68ccd7fc8901c12905c61f6b49b9e3d4d1a3ae28f3a0f59119`, nodes n63, n74, n80, n83, n86, n89, n92, n96, n103, n106, n109, n112, n115, n121, n124, n127, n130, n133, n136, n139, n142, n145, n148, n151, n154, n157, n160, n163, n166, n169, n172, n175, n178, n182, n185, n190.

## Technical

The documented process queue accepts batch requests and processes them in the background according to priority. The queue names in the captured documentation are not yet reconciled to this replica.

Trigger: An application batch process submits background work.

1. The documented service writes a process request.
2. Process requests in the background according to the configured thread priority.

Configuration: Active service topology, polling and concurrency need separate deployment evidence. Existing scheduling tables are not proven queue aliases.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: What installed component implements the documented process queue? Obtain a sanitized service-to-database architecture mapping; do not guess another database or rename scheduling objects.

Expanded captured documentary review: 1/1 text bodies, 0/0 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Technical Process Summary: Functionality](../AIM/reading/62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311.md); AIM article `62470f051ed57f24c0d7d9e59111662d32d64353aee9f242c70a9c048d6b3311`, original SHA-256 `491f681174642377dd197e62fc880b3fdcf9a7d737ce1d6611e228ae528363ea`, nodes n63, n68.

## Trading Partner Management

Trading Partner Management is a documented website for order entry, status and supply-chain collaboration. It can expose inbound, outbound and inventory information in a multi-company context.

Trigger: An authorized trading partner uses a configured TPM website.

1. Provide the configured order-entry, status, statistics and inventory-information functions.
2. Apply the website’s company context and presentation setup.

Configuration: TPM is a separate web surface in the documentation; existence, version and access controls are not established for this deployment.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Is TPM installed, and how is company/user authorization enforced? Obtain a sanitized component and authorization contract; no public availability or user access is assumed.

Expanded captured documentary review: 1/1 text bodies, 1/1 static image references, 3 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Trading Partner Management Process Summary: Functionality](../AIM/reading/30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7.md); AIM article `30da060b42a91d41911358c40ad130de83d9dee39759303024cfdf8ad73ec5a7`, original SHA-256 `70c06d03187e0259c8678d60bd71d16d3f215f7e6512f1eaceda34b5c2ff5585`, nodes n63.

## Wave

A wave groups the steps that bring orders from the pool into outbound processing. Its master defines the steps to run and the resulting entities, such as allocation requests or containers.

Trigger: A configured wave is run against selected orders.

1. Use the wave master to determine processing steps.
2. Execute those configured steps to move orders into outbound processing and create the required entities.

Configuration: Wave-master configuration determines step selection and execution; the reviewed summary does not establish every step or failure/restart behavior.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which wave-master step order, failure policy and retry rules are installed? Obtain sanitized master/application contracts and correlation design, without wave/order records.

Expanded captured documentary review: 2/2 text bodies, 4/4 static image references, 7 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Shipment membership, summary/progress refresh, limited step guards and display projections support wave management; complete master execution/restart policy remains external. [Exact reviewed batch](mappings/batches/allocation-wave-replenishment.json).

`family-source`: [Wave Process Summary: Functionality](../AIM/reading/ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e.md); AIM article `ff0d6dcb383f13d0f16ae9e21279d28c7b9f03cb6c555d98422f3e3acb47cc5e`, original SHA-256 `7cc9576de1f1a7765ef4ef299b2e23fb6b4924faa76a84fe27223d5f51a38b5b`, nodes n65.

## Work

Work creation turns product-handling needs into warehouse instructions. Work execution is the employee carrying out an instruction, such as picking or counting. A work unit groups the relevant product work.

Trigger: An allocation, inventory adjustment, replenishment or other supported need requests work.

1. Determine which entities need work using configured values and create work units/instructions.
2. An employee performs the action specified by the instruction, such as a pick or cycle count.

Configuration: Creation criteria and execution profiles influence work; this overview does not prove current tasks or assignments.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which creation criteria, execution profile and application caller govern this work? Obtain sanitized bindings; use the separate reviewed SQL contracts for bounded selection behavior.

Expanded captured documentary review: 2/2 text bodies, 6/6 static image references, 8 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Work-created flags, replenishment instruction relinking and open-work predicates support work lifecycle observations; these helpers do not establish creation or execution. [Exact reviewed batch](mappings/batches/allocation-wave-replenishment.json).

Partial deployed association: Zone predicate, work-name suggestion and dashboard work formulas are bounded supporting behavior; actual user enforcement, unique reservation and complete execution are external. [Exact reviewed batch](mappings/batches/function-semantics.json).

`family-source`: [Work Process Summary: Functionality](../AIM/reading/76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3.md); AIM article `76770f4602f9b9e52b4fce3fb8973ffa25b3e882ead4fd0e2faea14766f877a3`, original SHA-256 `8fe175033aa7df42a105d4f6f4761a35c333680abae209074c8a16c16cad10e6`, nodes n65.

## Work Order

A work order manages making a finished item from component parts. Components and instructions can come from a bill of material or be entered for the order; movement can use created work or paperwork.

Trigger: A work order is created or released, or components are manually allocated.

1. Use the selected bill of material/revision or entered components and instructions.
2. Allocate components automatically at creation/release when configured, or manually.
3. Use work creation to move components and finished items, or use the documented paperwork-based path.

Configuration: Bill-of-material revisions support versions of a finished item. Allocation timing and use of work creation are separate decisions.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which bill-of-material revision, allocation timing and completion/consumption rules apply? Obtain sanitized work-order configuration and application contracts.

Expanded captured documentary review: 2/2 text bodies, 1/1 static image references, 6 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

`family-source`: [Work Order Process Summary: Functionality](../AIM/reading/7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05.md); AIM article `7ce64df7dccc3aa20a98d55da3bebc5982d6628fd234699353055014fb625c05`, original SHA-256 `acdec9a54988db2a6a542b95a64220f7f40bd22747ad02d5849c6fa77a826383`, nodes n64.

## Yard Management

Yard management tracks trailers outside the warehouse and their moves to receiving. Trailer check-in, yard moves and final checkout are distinct events; receipts need an associated trailer ID.

Trigger: A trailer arrives and is checked into a yard location.

1. Assign the arriving trailer to a yard or queuing location.
2. Move it within the yard or to the receiving dock when ready.
3. After its inbound processing finishes, move it back to the yard or check it out.

Configuration: Receipt/trailer association is required for the described yard process. Arrival appointments are optional.

Only exceptions stated in the cited stages are established; remaining error/rollback/retry paths require source and caller review.

Open evidence question: Which yard status values, appointment rules and receipt associations apply? Obtain sanitized status/configuration definitions; numeric trigger conditions alone do not name business statuses.

Expanded captured documentary review: 3/3 text bodies, 1/1 static image references, 4 source-bound refinements. [Readable review](PROCESS_DOCUMENTARY_REVIEW.md) and [exact family evidence](mappings/process-documentary-review.json). This does not establish installed application behavior.

Partial deployed association: Vendor-required receipt/trailer association has a concrete trigger-based link/stamp implementation; check-in/movement/checkout and coded-status meaning remain unreconciled. [Exact reviewed batch](mappings/batches/receiving-shipping.json).

`family-source`: [Yard Management Process Summary: Functionality](../AIM/reading/ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9.md); AIM article `ea0dcdbe8b292306e502eb84dc28fca30d15b41c916d24a683648f70412fd7a9`, original SHA-256 `85deed38d0afc11b33c579084e36ad8b555b9d554a1b6a6061670c08991e683b`, nodes n68.

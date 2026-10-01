# Warehouse Mobile / RF operator guide

Start with the task you need to perform. Each guide explains the normal sequence, required inputs, configuration-dependent prompts, exceptions and the action that completes the operation. An **LP** is a license plate identifying inventory or a container; **UM/UOM** means unit of measure. A tote, cart, inventory LP and shipping container serve different purposes and are not interchangeable identifiers.

| Your task | Read |
| --- | --- |
| Receive a delivery, locate received stock or handle its lot/serial details | [Receiving and locating](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#receiving-initiation) |
| Transfer, adjust or change the status of inventory | [Inventory operations](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#inventory-transfers) |
| Look up a location or perform/reconcile a count | [Location inquiry](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#location-inquiry), [cycle counting](WAREHOUSE_MOBILE_INVENTORY_RECEIVING_FLOWS.md#cycle-count) |
| Start work, pick, put away or replenish | [Work execution](WAREHOUSE_MOBILE_WORK_FLOWS.md#entry-and-profiles) |
| Work with carts, totes or putwall locations | [Carts](WAREHOUSE_MOBILE_WORK_FLOWS.md#cart-picking), [totes](WAREHOUSE_MOBILE_WORK_FLOWS.md#pick-to-tote), [putwall](WAREHOUSE_MOBILE_WORK_FLOWS.md#putwall-sort) |
| Close or nest containers; check shipping quality | [Shipping and container tasks](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md#close-container) |
| Assign a printer, transfer at a dock, capture a receiving image or record indirect labor | [Supporting tasks](WAREHOUSE_MOBILE_SHIPPING_SUPPORT_FLOWS.md) |
| Investigate a document, interface error or history event | [Cross Application screens](CROSS_APPLICATION.md) |
| Find a specific menu choice or base screen-flow number | [Complete flow catalog](WAREHOUSE_MOBILE_SOURCE_CATALOG.md) |

## Start from the menu

In the inspected SCALE session, open **Menu > Cross Application > Warehouse Mobile**. Its 16 visible choices are all mapped in the [flow catalog](WAREHOUSE_MOBILE_SOURCE_CATALOG.md#find-a-task-from-the-menu). **RF** is also a separate entry in that menu; the two entries use different routes. This guide concentrates on Warehouse Mobile, the end-user RF workflow requested here. Legacy RF references are identified explicitly where they help explain a shared concept.

Choose the correct procedure before entering an identifier. **Go** can submit a receipt, inventory change, pick or putaway. Selecting a system-built-cart work profile can build and assign a cart before Go. **Back** does not mean rollback; follow the documented exit behavior for that particular task. [Work profiles and effects](WAREHOUSE_MOBILE_WORK_FLOWS.md#entry-and-profiles).

## How to use the evidence

The numbered procedures are grounded in retained AIM documentation. Release, permissions, user defaults, preferences and configured screen flows can change the screens presented to an operator. Source links and node numbers are supplied beside the relevant steps so a supervisor can investigate a difference.

The [live navigation record](warehouse-mobile-live-navigation.json) separately records the labels and empty entry screens inspected on October 1, 2026. Operational identifiers and configuration values are omitted. Those observations do not show that the downstream transactions succeeded. Work Execution was kept at menu level because its documented default-profile and automatic-assignment behavior can produce effects during entry.

The catalog accounts for all **45 base SRC identifiers** in the retained screen-flow table. It distinguishes dedicated procedures, shared initiation/confirmation, limited descriptions and unresolved context. Forty-five cataloged entries do not mean forty-five complete executable walkthroughs. In particular, blind-receipt header details, some negative-adjustment behavior, the LP-specific warehouse-transfer sequence and generic Nest/Remove context retain explicit source limits. Shared work confirmation is documented once and linked to the relevant work types.

This operator guide supplements the [single SCALE Functionality Reference](../SCALE_FUNCTIONAL_REFERENCE.md). It is a task manual, not a second implementation SDD or a declaration of effective warehouse configuration.

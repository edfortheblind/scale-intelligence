# J Knipper \- Manhattan Active SCALE Implementation Solution Design Document v1\.3  2024\-12\-10 \(Final\)

Original SHA-256: `1c25f20de1eafc3e78be4c4c3fc50b5a82dfcab4803f827a9d4d6824179c1ca1`

Provisional extraction; source-specific limitations remain in JSON. Source bodies below are literal text, not executable HTML or Markdown.

<a id="p001-b001"></a>
## p001\-b001 — PDF page 1, block 1

```text
PUSH POSSIBLE

```

<a id="p001-b002"></a>
## p001\-b002 — PDF page 1, block 2

```text
TM 

```

<a id="p001-b003"></a>
## p001\-b003 — PDF page 1, block 3

```text
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p001-b004"></a>
## p001\-b004 — PDF page 1, block 4

```text
 
 

```

<a id="p001-b005"></a>
## p001\-b005 — PDF page 1, block 5

```text
 

```

<a id="p001-b006"></a>
## p001\-b006 — PDF page 1, block 6

```text
 
 
SCALE Solution Design Document 

```

<a id="p001-b007"></a>
## p001\-b007 — PDF page 1, block 7

```text
 
(Multiple sites, Global Design) 

```

<a id="p001-b008"></a>
## p001\-b008 — PDF page 1, block 8

```text
 
 
 
 
 
 

```

<a id="p001-b009"></a>
## p001\-b009 — PDF page 1, block 9

```text
Date Created: 10/23/2024 
  

```

<a id="p001-b010"></a>
## p001\-b010 — PDF page 1, block 10

```text
Date Modified: 12/10/2024 
  

```

<a id="p001-b011"></a>
## p001\-b011 — PDF page 1, block 11

```text
Date Printed: 
 

```

<a id="p001-b012"></a>
## p001\-b012 — PDF page 1, block 12

```text
Functional Design Sign-off Date:  
 

```

<a id="p001-b013"></a>
## p001\-b013 — PDF page 1, block 13

```text
Document Version: 1.0 
 

```

<a id="p001-b014"></a>
## p001\-b014 — PDF page 1, block 14

```text
 
 
 
 
 
 
 
 
 

```

<a id="p001-b015"></a>
## p001\-b015 — PDF page 1, block 15

```text
 
 
 

```

<a id="p002-b001"></a>
## p002\-b001 — PDF page 2, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p002-b002"></a>
## p002\-b002 — PDF page 2, block 2

```text
 

```

<a id="p002-b003"></a>
## p002\-b003 — PDF page 2, block 3

```text
TABLE OF CONTENTS 

```

<a id="p002-b004"></a>
## p002\-b004 — PDF page 2, block 4

```text
INTRODUCTION _____________________________________________________________ 4 

```

<a id="p002-b005"></a>
## p002\-b005 — PDF page 2, block 5

```text
STATISTICS AND LAYOUT ____________________________________________________ 5 

```

<a id="p002-b006"></a>
## p002\-b006 — PDF page 2, block 6

```text
TECHNOLOGY ______________________________________________________________ 5 

```

<a id="p002-b007"></a>
## p002\-b007 — PDF page 2, block 7

```text
KEY DECISIONS / ASSUMPTIONS ______________________________________________ 6 

```

<a id="p002-b008"></a>
## p002\-b008 — PDF page 2, block 8

```text
TERMINOLOGY _____________________________________________________________ 9 

```

<a id="p002-b009"></a>
## p002\-b009 — PDF page 2, block 9

```text
I. INTERFACES _____________________________________________________________ 11 

```

<a id="p002-b010"></a>
## p002\-b010 — PDF page 2, block 10

```text
1.0       DOWNLOAD FROM HOST TO SCALE __________________________________ 11 

```

<a id="p002-b011"></a>
## p002\-b011 — PDF page 2, block 11

```text
2.0 UPLOAD FROM WM TO HOST ___________________________________________ 13 

```

<a id="p002-b012"></a>
## p002\-b012 — PDF page 2, block 12

```text
II. 
INBOUND ____________________________________________________________ 14 

```

<a id="p002-b013"></a>
## p002\-b013 — PDF page 2, block 13

```text
3.0 PROCESS OVERVIEW __________________________________________________ 14 

```

<a id="p002-b014"></a>
## p002\-b014 — PDF page 2, block 14

```text
4.0 
PRE-RECEIVING ____________________________________________________ 15 

```

<a id="p002-b015"></a>
## p002\-b015 — PDF page 2, block 15

```text
5.0 
APPOINTMENT SCHEDULING _________________________________________ 19 

```

<a id="p002-b016"></a>
## p002\-b016 — PDF page 2, block 16

```text
6.0 
UNLOADING ________________________________________________________ 21 

```

<a id="p002-b017"></a>
## p002\-b017 — PDF page 2, block 17

```text
7.0 
QUALITY AUDIT _____________________________________________________ 21 

```

<a id="p002-b018"></a>
## p002\-b018 — PDF page 2, block 18

```text
8.0 
RECEIVING / PALLETIZATION _________________________________________ 22 

```

<a id="p002-b019"></a>
## p002\-b019 — PDF page 2, block 19

```text
9.0 
EXCEPTIONS _______________________________________________________ 32 

```

<a id="p002-b020"></a>
## p002\-b020 — PDF page 2, block 20

```text
10.0 
PUTAWAY _________________________________________________________ 35 

```

<a id="p002-b021"></a>
## p002\-b021 — PDF page 2, block 21

```text
III.  
INVENTORY CONTROL ________________________________________________ 42 

```

<a id="p002-b022"></a>
## p002\-b022 — PDF page 2, block 22

```text
11.0 
INVENTORY MANAGEMENT __________________________________________ 42 

```

<a id="p002-b023"></a>
## p002\-b023 — PDF page 2, block 23

```text
12.0 
CYCLE COUNT ______________________________________________________ 48 

```

<a id="p002-b024"></a>
## p002\-b024 — PDF page 2, block 24

```text
13.0 
REPLENISHMENT ___________________________________________________ 53 

```

<a id="p002-b025"></a>
## p002\-b025 — PDF page 2, block 25

```text
14.0 
WORK ORDERS _____________________________________________________ 61 

```

<a id="p002-b026"></a>
## p002\-b026 — PDF page 2, block 26

```text
15.0 
BILL OF MATERIALS (BOM) ___________________________________________ 62 

```

<a id="p002-b027"></a>
## p002\-b027 — PDF page 2, block 27

```text
16.0 
WORK ORDER CREATION ____________________________________________ 62 

```

<a id="p002-b028"></a>
## p002\-b028 — PDF page 2, block 28

```text
17.0 
COMPONENT PULLING ______________________________________________ 62 

```

<a id="p002-b029"></a>
## p002\-b029 — PDF page 2, block 29

```text
18.0 
FINISHED GOODS CREATION _________________________________________ 64 

```

<a id="p002-b030"></a>
## p002\-b030 — PDF page 2, block 30

```text
19.0 
FINISHED GOODS PUTAWAY _________________________________________ 65 

```

<a id="p002-b031"></a>
## p002\-b031 — PDF page 2, block 31

```text
VI. 
66 

```

<a id="p002-b032"></a>
## p002\-b032 — PDF page 2, block 32

```text
OUTBOUND _______________________________________________________________ 66 

```

<a id="p002-b033"></a>
## p002\-b033 — PDF page 2, block 33

```text
20.0 
WAVE PROCESSING _________________________________________________ 68 

```

<a id="p002-b034"></a>
## p002\-b034 — PDF page 2, block 34

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 2 of 119 
 

```

<a id="p002-t001"></a>
## p002\-t001 — PDF page 2, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
TABLE OF CONTENTS
INTRODUCTION 4
_____________________________________________________________
STATISTICS AND LAYOUT 5
____________________________________________________
TECHNOLOGY 5
______________________________________________________________
KEY DECISIONS / ASSUMPTIONS 6
______________________________________________
TERMINOLOGY 9
_____________________________________________________________
I. INTERFACES 11
_____________________________________________________________
1.0 DOWNLOAD FROM HOST TO SCALE 11
__________________________________
2.0 UPLOAD FROM WM TO HOST 13
___________________________________________
II. INBOUND 14
____________________________________________________________
3.0 PROCESS OVERVIEW 14
__________________________________________________
4.0 PRE-RECEIVING 15
____________________________________________________
5.0 APPOINTMENT SCHEDULING 19
_________________________________________
6.0 UNLOADING 21
________________________________________________________
7.0 QUALITY AUDIT 21
_____________________________________________________
8.0 RECEIVING / PALLETIZATION 22
_________________________________________
9.0 EXCEPTIONS 32
_______________________________________________________
10.0 PUTAWAY 35
_________________________________________________________
III. INVENTORY CONTROL 42
________________________________________________
11.0 INVENTORY MANAGEMENT 42
__________________________________________
12.0 CYCLE COUNT 48
______________________________________________________
13.0 REPLENISHMENT 53
___________________________________________________
14.0 WORK ORDERS 61
_____________________________________________________
15.0 BILL OF MATERIALS (BOM) 62
___________________________________________
16.0 WORK ORDER CREATION 62
____________________________________________
17.0 COMPONENT PULLING 62
______________________________________________
18.0 FINISHED GOODS CREATION 64
_________________________________________
19.0 FINISHED GOODS PUTAWAY 65
_________________________________________
VI. 66
OUTBOUND 66
_______________________________________________________________
20.0 WAVE PROCESSING 68
_________________________________________________
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 2 of 119						
```

<a id="p003-b001"></a>
## p003\-b001 — PDF page 3, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p003-b002"></a>
## p003\-b002 — PDF page 3, block 2

```text
 

```

<a id="p003-b003"></a>
## p003\-b003 — PDF page 3, block 3

```text
21.0 
WAVE MANAGEMENT ________________________________________________ 88 

```

<a id="p003-b004"></a>
## p003\-b004 — PDF page 3, block 4

```text
22.0 
WORK MANAGEMENT _______________________________________________ 92 

```

<a id="p003-b005"></a>
## p003\-b005 — PDF page 3, block 5

```text
23.0 
PICKING ___________________________________________________________ 93 

```

<a id="p003-b006"></a>
## p003\-b006 — PDF page 3, block 6

```text
24.0 
PACKING _________________________________________________________ 100 

```

<a id="p003-b007"></a>
## p003\-b007 — PDF page 3, block 7

```text
25.0 
DOCK MANAGEMENT _______________________________________________ 106 

```

<a id="p003-b008"></a>
## p003\-b008 — PDF page 3, block 8

```text
26.0 
LOAD CONFIRMATION ______________________________________________ 107 

```

<a id="p003-b009"></a>
## p003\-b009 — PDF page 3, block 9

```text
27.0 
PARCEL MANIFESTING PROCESS ____________________________________ 108 

```

<a id="p003-b010"></a>
## p003\-b010 — PDF page 3, block 10

```text
VI.  
CONVERSION NOTE __________________________________________________ 109 

```

<a id="p003-b011"></a>
## p003\-b011 — PDF page 3, block 11

```text
VII.  
SYSTEM EXTENSIONS ________________________________________________ 110 

```

<a id="p003-b012"></a>
## p003\-b012 — PDF page 3, block 12

```text
VIII. 
OPEN ISSUES _______________________________________________________ 113 

```

<a id="p003-b013"></a>
## p003\-b013 — PDF page 3, block 13

```text
IX. 
RESOLVED ISSUES __________________________________________________ 114 

```

<a id="p003-b014"></a>
## p003\-b014 — PDF page 3, block 14

```text
X.   FUTURE FUNCTIONALITY _______________________________________________ 114 

```

<a id="p003-b015"></a>
## p003\-b015 — PDF page 3, block 15

```text
APPENDIX A – Configuration Notes __________________________________________ 114 

```

<a id="p003-b016"></a>
## p003\-b016 — PDF page 3, block 16

```text
APPENDIX B – Override Data Wave Steps _____________________________________ 115 

```

<a id="p003-b017"></a>
## p003\-b017 — PDF page 3, block 17

```text
APPENDIX C – Security permissions __________________________________________ 116 

```

<a id="p003-b018"></a>
## p003\-b018 — PDF page 3, block 18

```text
APPENDIX D – Supplemental DC Ops Data ____________________________________ 117 

```

<a id="p003-b019"></a>
## p003\-b019 — PDF page 3, block 19

```text
REVISION HISTORY ________________________________________________________ 118 

```

<a id="p003-b020"></a>
## p003\-b020 — PDF page 3, block 20

```text
SOLUTION DESIGN DOCUMENT SIGN-OFF ____________________________________ 119 

```

<a id="p003-b021"></a>
## p003\-b021 — PDF page 3, block 21

```text
 
 

```

<a id="p003-b022"></a>
## p003\-b022 — PDF page 3, block 22

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 3 of 119 
 

```

<a id="p003-t001"></a>
## p003\-t001 — PDF page 3, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
21.0 WAVE MANAGEMENT 88
________________________________________________
22.0 WORK MANAGEMENT 92
_______________________________________________
23.0 PICKING 93
___________________________________________________________
24.0 PACKING 100
_________________________________________________________
25.0 DOCK MANAGEMENT 106
_______________________________________________
26.0 LOAD CONFIRMATION 107
______________________________________________
27.0 PARCEL MANIFESTING PROCESS 108
____________________________________
VI. CONVERSION NOTE 109
__________________________________________________
VII. SYSTEM EXTENSIONS 110
________________________________________________
VIII. OPEN ISSUES 113
_______________________________________________________
IX. RESOLVED ISSUES 114
__________________________________________________
X. FUTURE FUNCTIONALITY 114
_______________________________________________
APPENDIX A – Configuration Notes 114
__________________________________________
APPENDIX B – Override Data Wave Steps 115
_____________________________________
APPENDIX C – Security permissions 116
__________________________________________
APPENDIX D – Supplemental DC Ops Data 117
____________________________________
REVISION HISTORY 118
________________________________________________________
SOLUTION DESIGN DOCUMENT SIGN-OFF 119
____________________________________
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 3 of 119						
```

<a id="p004-b001"></a>
## p004\-b001 — PDF page 4, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p004-b002"></a>
## p004\-b002 — PDF page 4, block 2

```text
 

```

<a id="p004-b003"></a>
## p004\-b003 — PDF page 4, block 3

```text
INTRODUCTION  
 
This document is designed to outline the proposed process for the SCALE implementation at 
Knipper, Inc.’s (Knipper) current distribution centers. This implementation includes existing 2 
physical sites to follow the functionality described in this document. Future implementations at 
other Knipper facilities may result in either changes being made to this document or entirely new 
functional flows per facility.  
 
SCALE is upgraded from version 2013 to Manhattan Active SCALE ® for this implementation, 
and Knipper migrates the required functionality into the new version.  
 
The objective of this document is to define the proposed process and scope from a Manhattan 
Associates’ perspective and to identify key extensions to the Manhattan Associates suite of 
products.  This document serves as a reference throughout the process for confirmation of the 
approach and definition of tasks. It will also serve as a reference for Manhattan Associate’s 
customer support organization after implementation, and potentially a reference point for any 
future Knipper implementations. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p004-b004"></a>
## p004\-b004 — PDF page 4, block 4

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 4 of 119 
 

```

<a id="p004-t001"></a>
## p004\-t001 — PDF page 4, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
INTRODUCTION
This document is designed to outline the proposed process for the SCALE implementation at
Knipper, Inc.’s (Knipper) current distribution centers. This implementation includes existing 2
physical sites to follow the functionality described in this document. Future implementations at
other Knipper facilities may result in either changes being made to this document or entirely new
functional flows per facility.
SCALE is upgraded from version 2013 to Manhattan Active SCALE ® for this implementation,
and Knipper migrates the required functionality into the new version.
The objective of this document is to define the proposed process and scope from a Manhattan
Associates’ perspective and to identify key extensions to the Manhattan Associates suite of
products. This document serves as a reference throughout the process for confirmation of the
approach and definition of tasks. It will also serve as a reference for Manhattan Associate’s
customer support organization after implementation, and potentially a reference point for any
future Knipper implementations.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 4 of 119						
```

<a id="p005-b001"></a>
## p005\-b001 — PDF page 5, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p005-b002"></a>
## p005\-b002 — PDF page 5, block 2

```text
 

```

<a id="p005-b003"></a>
## p005\-b003 — PDF page 5, block 3

```text
STATISTICS AND LAYOUT 
 
MULTIPLE  
 
Warehouse statistics are listed inline below. 
 

```

<a id="p005-b004"></a>
## p005\-b004 — PDF page 5, block 4

```text
Warehouse Stats.xlsx

```

<a id="p005-b005"></a>
## p005\-b005 — PDF page 5, block 5

```text
 

```

<a id="p005-b006"></a>
## p005\-b006 — PDF page 5, block 6

```text
 
 
Layout  

```

<a id="p005-b007"></a>
## p005\-b007 — PDF page 5, block 7

```text
 

```

<a id="p005-b008"></a>
## p005\-b008 — PDF page 5, block 8

```text
Existing Layouts are used. Layout drawings not available 

```

<a id="p005-b009"></a>
## p005\-b009 — PDF page 5, block 9

```text
 
 
TECHNOLOGY 
 

```

<a id="p005-b010"></a>
## p005\-b010 — PDF page 5, block 10

```text
• Host ERP-  
• Middleware –   
• WM Platform: Windows 
• Version: Manhattan Active® SCALE 
• Warehouse Mobile Vendor: Zebra - procured through Manhattan.  
• MHE Vendor: Lightning Pick 
• Label Printer: Zebra 203 dpi (Fixed).  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p005-b011"></a>
## p005\-b011 — PDF page 5, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 5 of 119 
 

```

<a id="p005-t001"></a>
## p005\-t001 — PDF page 5, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
STATISTICS AND LAYOUT
MULTIPLE
Warehouse statistics are listed inline below.
Warehouse Stats.xlsx
Layout
Existing Layouts are used. Layout drawings not available
TECHNOLOGY
• Host ERP-
• Middleware –
• WM Platform: Windows
• Version: Manhattan Active® SCALE
• Warehouse Mobile Vendor: Zebra - procured through Manhattan.
• MHE Vendor: Lightning Pick
• Label Printer: Zebra 203 dpi (Fixed).
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 5 of 119						
```

<a id="p006-b001"></a>
## p006\-b001 — PDF page 6, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p006-b002"></a>
## p006\-b002 — PDF page 6, block 2

```text
 

```

<a id="p006-b003"></a>
## p006\-b003 — PDF page 6, block 3

```text
 
 
KEY DECISIONS / ASSUMPTIONS 
 

```

<a id="p006-b004"></a>
## p006\-b004 — PDF page 6, block 4

```text
Commented [BK1]: Lakewood should be split 
between KDC and OHW? 

```

<a id="p006-b005"></a>
## p006\-b005 — PDF page 6, block 5

```text
Commented [NC2R1]: Per breakout sessions & Vic’s 
final decision is to keep them together. 

```

<a id="p006-b006"></a>
## p006\-b006 — PDF page 6, block 6

```text
Commented [NC3R1]: This is resolved 

```

<a id="p006-b007"></a>
## p006\-b007 — PDF page 6, block 7

```text
Commented [SM4]: Key Decisions #13: what is this 
telling us? 

```

<a id="p006-b008"></a>
## p006\-b008 — PDF page 6, block 8

```text
Commented [NC5R4]: Knipper owns the UOM 

```

<a id="p006-b009"></a>
## p006\-b009 — PDF page 6, block 9

```text
Commented [NC6R4]: This is resolved 

```

<a id="p006-b010"></a>
## p006\-b010 — PDF page 6, block 10

```text
Commented [SM7]: Add Pallet "PL" 

```

<a id="p006-b011"></a>
## p006\-b011 — PDF page 6, block 11

```text
Commented [NC8R7]: Knipper to take back to MAH 
for further clarity 

```

<a id="p006-b012"></a>
## p006\-b012 — PDF page 6, block 12

```text
Commented [RS9R7]: If we enable grouping for PL 
UM, SCALE may create one LPN for more than one 
Pallet. This is not recommended. One LPN should be 
assigned to one PL. 

```

<a id="p006-b013"></a>
## p006\-b013 — PDF page 6, block 13

```text
Commented [NC10R7]: NC12022024: This is resolved 

```

<a id="p006-b014"></a>
## p006\-b014 — PDF page 6, block 14

```text
Commented [SM11]: Need more clarity on this. 

```

<a id="p006-b015"></a>
## p006\-b015 — PDF page 6, block 15

```text
Commented [NC12R11]: This is resolved 

```

<a id="p006-b016"></a>
## p006\-b016 — PDF page 6, block 16

```text
Commented [RS13R11]: Unless PL can have a GTIN 
like EA, PK and CS, we do not setup item cross 
reference for PL 

```

<a id="p006-b017"></a>
## p006\-b017 — PDF page 6, block 17

```text
1) The scope of this document is limited to the standardized flows identified for the following 
distribution centers. Over time, Knipper may add additional DCs in future phases. One 
Warehouse will be created in SCALE for each facility list below.  
• 
Lakewood, NJ 
• 
Charleston, IN 
2) Company configuration will be used. Item master in SCALE is maintained with the 
appropriate company information which represents Knipper’s customer. All inventory in 
SCALE is maintained for these companies. Over time, Knipper may add other companies 
in future phases through a change management process identified collectively with 
Manhattan Associates.  
3) Host assigns company on the interfaced receipts and shipments. 
4) Item master will be interfaced into SCALE for account which have EDI capabilities. 
Otherwise, Items will be created manually in SCALE. 
5) Item master in SCALE includes units of measure, dimensions, and weights for all 
products for all units of measure Cubiscan will be used to gather the dimension and 
weight information. Cubiscan is not integrated with SCALE. 
6) All dimensions are stored using IN (Inches). 
7) All weights are stored using LB (Pounds). 
8) Items will not be shared across companies.  
9) Item master in SCALE maintains Item Cross Reference. 
10) Knipper has standardized UOMs to have one storage template. 
• 
EA-PK-CS-PL  
• 
CS-PL 
• 
EA-ROLL-CS 
• 
ROLL-CS-PL 
• 
PK-CS-PL 
11) Item Cross Reference is configured in GTIN format and is unique for an item and Unit of 
Measure combinations. It is of 12 or 14 digits. This information is interfaced from the host 
for EDI for accounts with EDI, otherwise maintained directly in SCALE.  
12) Item Cross Reference can be shared across items.  
13) Knipper owns and sets the quantity um symbol for the quantity unit of measures for the 
manifesting process.  
14) Knipper provides the conversion quantity for all units of measure. If the product is never 
received or shipped in a specific conversion quantity, then that record is not used in 
SCALE.   
15) EA, PK, ROLL, and CS units of measure of the storage templates have group during 
check-in set to ‘Yes’. 
16) All units of measures other than PL have a separate Item Cross Reference. PL UoM does 
not have a cross reference configured.  
17) The Quantity unit of measure is a whole number. 

```

<a id="p006-b018"></a>
## p006\-b018 — PDF page 6, block 18

```text
Commented [NC14R11]: NC12022024: Pallet has a 
GTIN for Pallet. The lowest UOM is shipped . This is 
resolved. 

```

<a id="p006-b019"></a>
## p006\-b019 — PDF page 6, block 19

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 6 of 119 
 

```

<a id="p006-t001"></a>
## p006\-t001 — PDF page 6, detected table 1

```text
					MENT
Commented [BK1]: Lakewood should be split
between KDC and OHW?
Commented [NC2R1]: Per breakout sessions & Vic’s
final decision is to keep them together.
Commented [NC3R1]: This is resolved
Commented [SM4]: Key Decisions #13: what is this
telling us?
Commented [NC5R4]: Knipper owns the UOM
Commented [NC6R4]: This is resolved
Commented [SM7]: Add Pallet "PL"
Commented [NC8R7]: Knipper to take back to MAH
for further clarity
Commented [RS9R7]: If we enable grouping for PL
UM, SCALE may create one LPN for more than one
Pallet. This is not recommended. One LPN should be
assigned to one PL.
Commented [NC10R7]: NC12022024: This is resolved
Commented [SM11]: Need more clarity on this.
Commented [NC12R11]: This is resolved
Commented [RS13R11]: Unless PL can have a GTIN
like EA, PK and CS, we do not setup item cross
reference for PL
Commented [NC14R11]: NC12022024: Pallet has a
GTIN for Pallet. The lowest UOM is shipped . This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
KEY DECISIONS / ASSUMPTIONS
1) The scope of this document is limited to the standardized flows identified for the following
distribution centers. Over time, Knipper may add additional DCs in future phases. One
Warehouse will be created in SCALE for each facility list below.
• Lakewood, NJ
• Charleston, IN
2) Company configuration will be used. Item master in SCALE is maintained with the
appropriate company information which represents Knipper’s customer. All inventory in
SCALE is maintained for these companies. Over time, Knipper may add other companies
in future phases through a change management process identified collectively with
Manhattan Associates.
3) Host assigns company on the interfaced receipts and shipments.
4) Item master will be interfaced into SCALE for account which have EDI capabilities.
Otherwise, Items will be created manually in SCALE.
5) Item master in SCALE includes units of measure, dimensions, and weights for all
products for all units of measure Cubiscan will be used to gather the dimension and
weight information. Cubiscan is not integrated with SCALE.
6) All dimensions are stored using IN (Inches).
7) All weights are stored using LB (Pounds).
8) Items will not be shared across companies.
9) Item master in SCALE maintains Item Cross Reference.
10) Knipper has standardized UOMs to have one storage template.
• EA-PK-CS-PL
• CS-PL
• EA-ROLL-CS
• ROLL-CS-PL
• PK-CS-PL
11) Item Cross Reference is configured in GTIN format and is unique for an item and Unit of
Measure combinations. It is of 12 or 14 digits. This information is interfaced from the host
for EDI for accounts with EDI, otherwise maintained directly in SCALE.
12) Item Cross Reference can be shared across items.
13) Knipper owns and sets the quantity um symbol for the quantity unit of measures for the
manifesting process.
14) Knipper provides the conversion quantity for all units of measure. If the product is never
received or shipped in a specific conversion quantity, then that record is not used in
SCALE.
15) EA, PK, ROLL, and CS units of measure of the storage templates have group during
check-in set to ‘Yes’.
16) All units of measures other than PL have a separate Item Cross Reference. PL UoM does
not have a cross reference configured.
17) The Quantity unit of measure is a whole number.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 6 of 119						
```

<a id="p007-b001"></a>
## p007\-b001 — PDF page 7, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p007-b002"></a>
## p007\-b002 — PDF page 7, block 2

```text
 

```

<a id="p007-b003"></a>
## p007\-b003 — PDF page 7, block 3

```text
Commented [SM15]: Need ability to manage a 
scenario where there are more than one of the same 
serial number, but for different Items. 

```

<a id="p007-b004"></a>
## p007\-b004 — PDF page 7, block 4

```text
18) Several items are serial number tracked. These items include tracking as below and are 
marked on item master. Two different Items can have same serial number, and SCALE 
should be configured to allow duplicate serial numbers. 

```

<a id="p007-b005"></a>
## p007\-b005 — PDF page 7, block 5

```text
Commented [NC16R15]: For non-DSCSA inventory - 
to allow duplicates. Follow up with MAH 

```

<a id="p007-b006"></a>
## p007\-b006 — PDF page 7, block 6

```text
Commented [RS17R15]: SCALE allows same serial 
number to be captured for two different items. 
Rephrased the assumption 

```

<a id="p007-b007"></a>
## p007\-b007 — PDF page 7, block 7

```text
Commented [NC18R15]: NC12022024: resolved. 

```

<a id="p007-b008"></a>
## p007\-b008 — PDF page 7, block 8

```text
Commented [SG19]: Is this correct? 

```

<a id="p007-b009"></a>
## p007\-b009 — PDF page 7, block 9

```text
Commented [SM20R19]: If it is not going to be 
mentioned in this document, where will it be 
mentioned? 

```

<a id="p007-b010"></a>
## p007\-b010 — PDF page 7, block 10

```text
Commented [SM21R19]: EX37B document? 

```

<a id="p007-b011"></a>
## p007\-b011 — PDF page 7, block 11

```text
Commented [NC22R19]: MAH will be providing / 
providing new design documents for the DSCSA 
Serialization. It will be provided prior to Build. This 
comment is being resolved 

```

<a id="p007-b012"></a>
## p007\-b012 — PDF page 7, block 12

```text
Commented [SM23]: This is what causes issue on 
3PL inbound, multi lot issue - PL #11 

```

<a id="p007-b013"></a>
## p007\-b013 — PDF page 7, block 13

```text
Commented [NC24R23]: This is resolved 

```

<a id="p007-b014"></a>
## p007\-b014 — PDF page 7, block 14

```text
Commented [RS25R23]: Please advise if this should 
be rephrased 

```

<a id="p007-b015"></a>
## p007\-b015 — PDF page 7, block 15

```text
Commented [NC26R23]: NC12022024: resolved. 

```

<a id="p007-b016"></a>
## p007\-b016 — PDF page 7, block 16

```text
Commented [RS27]: Reviewing further for unit of 
measure discrepancies  

```

<a id="p007-b017"></a>
## p007\-b017 — PDF page 7, block 17

```text
Commented [RS28R27]: We have an email thread 
going on with this with Caleb/Vimal. We have already 
provided recommendation and need final confirmation 
from Caleb/Vimal to go ahead to resolve 

```

<a id="p007-b018"></a>
## p007\-b018 — PDF page 7, block 18

```text
Commented [SM29]: Add to Parking Lot: Need to 
ensure LP is not assigned to the user who dropped 
the work off at a drop zone. 

```

<a id="p007-b019"></a>
## p007\-b019 — PDF page 7, block 19

```text
Commented [SM30R29]: Dont want to have to scan 
SN at drop zone if already verified when pulled. 

```

<a id="p007-b020"></a>
## p007\-b020 — PDF page 7, block 20

```text
Commented [NC31R29]: MAH to confirm  

```

<a id="p007-b021"></a>
## p007\-b021 — PDF page 7, block 21

```text
Commented [RS32R29]: The user should be 
...

```

<a id="p007-b022"></a>
## p007\-b022 — PDF page 7, block 22

```text
Commented [NC33R29]: NC12022024: this is 
...

```

<a id="p007-b023"></a>
## p007\-b023 — PDF page 7, block 23

```text
Commented [CC34]: please explain 

```

<a id="p007-b024"></a>
## p007\-b024 — PDF page 7, block 24

```text
Commented [NC35R34]: MAH will be able to 
...

```

<a id="p007-b025"></a>
## p007\-b025 — PDF page 7, block 25

```text
• 
Inbound only 
• 
Inbound and Outbound 
• 
Inbound, Inventory and Outbound 
• 
Outbound only 
19) DSCSA workflow is excluded from the scope of this document. There are call outs to 
inbound and outbound extensions for DSCSA.  The integration and deployment strategy 
for DSCSA with the migration must be reviewed during the conversion planning.  
20) None of the items are catch weight enabled. 
21) None of the items are immediate needs eligible. Cross-docking with/without immediate 
needs is out of the scope of this implementation. 
22) Lot tracking will be utilized. Lot-tracked items have the lot ID and expiration date available 
on the product when being received. The lot ID will not be barcoded on all products.  
23) For some items, Knipper uses lot ID without the need for expiration date tracking. These 
items were set up this way during the original implementation and have a dummy 
expiration date setup. These lots or dates are not used for FEFO. 
24) An item on a receipt has only one detail for the same lot, if lot is interfaced.  
25) Purchase order and receipt in the host may have 1:M mapping. However, Purchase 
orders are not sent to SCALE. 
26) Treat as Loose Flag is set to Y on the item unit of measure for eligible UM’s if the product 
must be repacked before shipping. The Value will be set to N if it can be shipped in the 
package it is currently stored in.  
27) Dimensions are provided for the shape the product it is shipped in. If for example T-Shirts 
are shipped as rolled, then the dimension of the Roll will be provided.  
28) Location Unit of measure override is not leveraged for this implementation.  
29) Item location assignments (Permanent Locations) are used.  
30) Item Location Capacity records will be provided for permanent locations. 
31) All inventory locations are single item and single lot other than those identified later in the 
document for exception handling including but not limited to Damages, Held, Destruction, 
and the Virtual ‘See Supervisor’ location.  
32) All inventory locations are License plate tracked other than forward pick locations.  
33) P&D locations are used mostly in all the warehouses in the scope of this implementation.  
34) Hazardous materials are shipped using SCALE in the implementation. 
35) Inbound systemic QC is not leveraged. A manual SOP using a visual QC is leveraged.  
36) Quick receiving will not be leveraged. Quick Receiving is the process in SCALE where 
the inventory is putaway to final location without any putaway work being generated. 
37) Returns are interfaced to SCALE as a Receipt ID Type of RA. For some scenarios with 
returns due to package not delivered, Knipper would like to utilize custom Receipt from 
Shipment functionality. Knipper would like to enhance the base functionality to automate 
extraction of lot and Expiry date from the shipping container data.  
38) Inventory Attributes are not leveraged. Inventory attributes are specific attributes to use 
with inventory for processing reasons.  

```

<a id="p007-b026"></a>
## p007\-b026 — PDF page 7, block 26

```text
Commented [RS36R34]: The Hazmat documents for ...

```

<a id="p007-b027"></a>
## p007\-b027 — PDF page 7, block 27

```text
Commented [NC37R34]: NC12022024: Resolved. 

```

<a id="p007-b028"></a>
## p007\-b028 — PDF page 7, block 28

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 7 of 119 
 

```

<a id="p007-t001"></a>
## p007\-t001 — PDF page 7, detected table 1

```text
					MENT
Commented [SM15]: Need ability to manage a
scenario where there are more than one of the same
serial number, but for different Items.
Commented [NC16R15]: For non-DSCSA inventory -
to allow duplicates. Follow up with MAH
Commented [RS17R15]: SCALE allows same serial
number to be captured for two different items.
Rephrased the assumption
Commented [NC18R15]: NC12022024: resolved.
Commented [SG19]: Is this correct?
Commented [SM20R19]: If it is not going to be
mentioned in this document, where will it be
mentioned?
Commented [SM21R19]: EX37B document?
Commented [NC22R19]: MAH will be providing /
providing new design documents for the DSCSA
Serialization. It will be provided prior to Build. This
comment is being resolved
Commented [SM23]: This is what causes issue on
3PL inbound, multi lot issue - PL #11
Commented [NC24R23]: This is resolved
Commented [RS25R23]: Please advise if this should
be rephrased
Commented [NC26R23]: NC12022024: resolved.
Commented [RS27]: Reviewing further for unit of
measure discrepancies
Commented [RS28R27]: We have an email thread
going on with this with Caleb/Vimal. We have already
provided recommendation and need final confirmation
from Caleb/Vimal to go ahead to resolve
Commented [SM29]: Add to Parking Lot: Need to
ensure LP is not assigned to the user who dropped
the work off at a drop zone.
Commented [SM30R29]: Dont want to have to scan
SN at drop zone if already verified when pulled.
Commented [NC31R29]: MAH to confirm
Commented [RS32R29]: The user should be ...
Commented [NC33R29]: NC12022024: this is ...
Commented [CC34]: please explain
Commented [NC35R34]: MAH will be able to ...
Commented [RS36R34]: The Hazmat documents for ...
Commented [NC37R34]: NC12022024: Resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
18) Several items are serial number tracked. These items include tracking as below and are
marked on item master. Two different Items can have same serial number, and SCALE
should be configured to allow duplicate serial numbers.
• Inbound only
• Inbound and Outbound
• Inbound, Inventory and Outbound
• Outbound only
19) DSCSA workflow is excluded from the scope of this document. There are call outs to
inbound and outbound extensions for DSCSA. The integration and deployment strategy
for DSCSA with the migration must be reviewed during the conversion planning.
20) None of the items are catch weight enabled.
21) None of the items are immediate needs eligible. Cross-docking with/without immediate
needs is out of the scope of this implementation.
22) Lot tracking will be utilized. Lot-tracked items have the lot ID and expiration date available
on the product when being received. The lot ID will not be barcoded on all products.
23) For some items, Knipper uses lot ID without the need for expiration date tracking. These
items were set up this way during the original implementation and have a dummy
expiration date setup. These lots or dates are not used for FEFO.
24) An item on a receipt has only one detail for the same lot, if lot is interfaced.
25) Purchase order and receipt in the host may have 1:M mapping. However, Purchase
orders are not sent to SCALE.
26) Treat as Loose Flag is set to Y on the item unit of measure for eligible UM’s if the product
must be repacked before shipping. The Value will be set to N if it can be shipped in the
package it is currently stored in.
27) Dimensions are provided for the shape the product it is shipped in. If for example T-Shirts
are shipped as rolled, then the dimension of the Roll will be provided.
28) Location Unit of measure override is not leveraged for this implementation.
29) Item location assignments (Permanent Locations) are used.
30) Item Location Capacity records will be provided for permanent locations.
31) All inventory locations are single item and single lot other than those identified later in the
document for exception handling including but not limited to Damages, Held, Destruction,
and the Virtual ‘See Supervisor’ location.
32) All inventory locations are License plate tracked other than forward pick locations.
33) P&D locations are used mostly in all the warehouses in the scope of this implementation.
34) Hazardous materials are shipped using SCALE in the implementation.
35) Inbound systemic QC is not leveraged. A manual SOP using a visual QC is leveraged.
36) Quick receiving will not be leveraged. Quick Receiving is the process in SCALE where
the inventory is putaway to final location without any putaway work being generated.
37) Returns are interfaced to SCALE as a Receipt ID Type of RA. For some scenarios with
returns due to package not delivered, Knipper would like to utilize custom Receipt from
Shipment functionality. Knipper would like to enhance the base functionality to automate
extraction of lot and Expiry date from the shipping container data.
38) Inventory Attributes are not leveraged. Inventory attributes are specific attributes to use
with inventory for processing reasons.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 7 of 119						
```

<a id="p007-t002"></a>
## p007\-t002 — PDF page 7, detected table 2

```text
28) Location Unit of measure override is not leveraged for this	implementation
```

<a id="p008-b001"></a>
## p008\-b001 — PDF page 8, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p008-b002"></a>
## p008\-b002 — PDF page 8, block 2

```text
 

```

<a id="p008-b003"></a>
## p008\-b003 — PDF page 8, block 3

```text
Commented [SM38]: Knipper has discretion to use 
sequencing as needed. 

```

<a id="p008-b004"></a>
## p008\-b004 — PDF page 8, block 4

```text
Commented [NC39R38]: MAH to confirm this can be 
done for flexibility 

```

<a id="p008-b005"></a>
## p008\-b005 — PDF page 8, block 5

```text
Commented [RS40R38]: If Knipper is able to assign 
Picking/Putaway sequences to the locations, those can 
be utilized for sequencing while tasks are being 
created. 

```

<a id="p008-b006"></a>
## p008\-b006 — PDF page 8, block 6

```text
Commented [NC41R38]: NC12022024: this is 
resolved. 

```

<a id="p008-b007"></a>
## p008\-b007 — PDF page 8, block 7

```text
Commented [SM42]: Can FedEx be added here? 

```

<a id="p008-b008"></a>
## p008\-b008 — PDF page 8, block 8

```text
Commented [NC43R42]: MAH to confirm. Knipper has 
a current integration with Progistics. Separate 
Integration for Fedex 

```

<a id="p008-b009"></a>
## p008\-b009 — PDF page 8, block 9

```text
Commented [RS44R42]: I have added FedEx but 
please note that only carriers which were mentioned in 
the SOW were UPS, USPS and UPS Mail Innovations 
for parcel carrier. 

```

<a id="p008-b010"></a>
## p008\-b010 — PDF page 8, block 10

```text
Commented [NC45R42]: NC12022024: What is the 
impact to the SOW 

```

<a id="p008-b011"></a>
## p008\-b011 — PDF page 8, block 11

```text
Commented [RS46R42]: I do see that FedEx parcel 
service is being used in SCALE 2013 currently. In that 
case, we should be able to migrate in SCALE Active as 
well 

```

<a id="p008-b012"></a>
## p008\-b012 — PDF page 8, block 12

```text
Commented [RS47R42]: Checked the SOW again and 
FedEx is included. We can resolve this. 

```

<a id="p008-b013"></a>
## p008\-b013 — PDF page 8, block 13

```text
Commented [SM48]: Knipper would like to use 
...

```

<a id="p008-b014"></a>
## p008\-b014 — PDF page 8, block 14

```text
Commented [NC49R48]: MAH to confirm if any 
...

```

<a id="p008-b015"></a>
## p008\-b015 — PDF page 8, block 15

```text
Commented [RS50R48]: The configurations will need ...

```

<a id="p008-b016"></a>
## p008\-b016 — PDF page 8, block 16

```text
Commented [NC51R48]: NC12022024: This is 
...

```

<a id="p008-b017"></a>
## p008\-b017 — PDF page 8, block 17

```text
Commented [SM52]: Blind LPNs are used for Blind ...

```

<a id="p008-b018"></a>
## p008\-b018 — PDF page 8, block 18

```text
Commented [NC53R52]: MAH to add. Current 
...

```

<a id="p008-b019"></a>
## p008\-b019 — PDF page 8, block 19

```text
Commented [RS54R52]: The blind LPNs can be used ...

```

<a id="p008-b020"></a>
## p008\-b020 — PDF page 8, block 20

```text
Commented [NC55R52]: NC12022024: this is 
...

```

<a id="p008-b021"></a>
## p008\-b021 — PDF page 8, block 21

```text
Commented [CC56]: What do the Item labels look ...

```

<a id="p008-b022"></a>
## p008\-b022 — PDF page 8, block 22

```text
Commented [RS57R56]: Currently this is not 
...

```

<a id="p008-b023"></a>
## p008\-b023 — PDF page 8, block 23

```text
Commented [NC58R56]: NC12022024: this is 
...

```

<a id="p008-b024"></a>
## p008\-b024 — PDF page 8, block 24

```text
Commented [SM59]: Can we get a demo?  KMW ...

```

<a id="p008-b025"></a>
## p008\-b025 — PDF page 8, block 25

```text
Commented [NC60R59]: Configuration based. This is ...

```

<a id="p008-b026"></a>
## p008\-b026 — PDF page 8, block 26

```text
Commented [SM61]: Can we get a demo?  KMW ...

```

<a id="p008-b027"></a>
## p008\-b027 — PDF page 8, block 27

```text
39) Picking sequence and/or Putaway sequence are not leveraged.  Location template is 
used in the order-by clause to determine how putaway and picking should occur in the 
warehouse. The existing setup is used. 
40) Wave-based dock assignment is leveraged in this implementation.  
41) Wave-based shipment consolidation is not leveraged in this implementation.   
42) When a split shipment happens on load confirmation in SCALE, Middleware or Host 
system will be able to handle processing of multiple upload files.   
43) Transportation Execution is implemented for the supported services of FedEx, UPS, 
USPS and UPS Mail Innovations. 
44) Rate shopping is not leveraged and is out of the scope of this implementation.  
45) Location Check Digit is not leveraged for location verification.  
46) Host does not send a delete interface for deleting item master. The obsolete items are 
not marked as inactive either.  
47) Receiving worksheets are utilized and system-generated LPN labels are used.  
48) Country of origin for an item is tracked in SCALE at the Item level.  
49) Item labels (Knipper/Supplier SKU labels) are not required to be printed from SCALE.  
50) Systemic outbound QC is used in this implementation. Knipper would like to enhance QC 
functionality to be able to perform QC for Pallets with nested containers. 
51) Work Orders will be utilized in this implementation.  
52) Setting up labor management is not in scope of this implementation.  
53) Knipper migrates the existing ODWS to generic configs during the build phase. This is to 
establish an SOP where reliance on Manhattan cloud services to execute ODWS is 
alleviated.  
54) This document uses suggested naming conventions for configurations like locating rule 
names, zones, work type names, etc. Actual names may change during the configuration 
phase. 
55) Vocollect Voice Picking will not be utilized. 
56) In the warehouse, physically there can be multiple packing locations but systematically 
in SCALE there is a one pack location per warehouse.  
57) Parcel international shipments are manifested at shipment level. 
58) Back-order processing is done at Host. In SCALE we ship 100% of the quantity requested 
by host. Allocation exceptions and Pick exceptions are handled according to the SOP 
defined by Knipper. 
59) Receipt Workbench will be utilized for receiving receipts for most accounts of Knipper 
(mainly MSM) accounts as most of the products do not have barcode for Item and Lot. 
For 3PL accounts, Warehouse Mobile receiving will be utilized. 
 
 
 
  
 
 
 
 
 
 

```

<a id="p008-b028"></a>
## p008\-b028 — PDF page 8, block 28

```text
Commented [NC62R61]: Hardware integration - this is 
...

```

<a id="p008-b029"></a>
## p008\-b029 — PDF page 8, block 29

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 8 of 119 
 

```

<a id="p008-t001"></a>
## p008\-t001 — PDF page 8, detected table 1

```text
					MENT
Commented [SM38]: Knipper has discretion to use
sequencing as needed.
Commented [NC39R38]: MAH to confirm this can be
done for flexibility
Commented [RS40R38]: If Knipper is able to assign
Picking/Putaway sequences to the locations, those can
be utilized for sequencing while tasks are being
created.
Commented [NC41R38]: NC12022024: this is
resolved.
Commented [SM42]: Can FedEx be added here?
Commented [NC43R42]: MAH to confirm. Knipper has
a current integration with Progistics. Separate
Integration for Fedex
Commented [RS44R42]: I have added FedEx but
please note that only carriers which were mentioned in
the SOW were UPS, USPS and UPS Mail Innovations
for parcel carrier.
Commented [NC45R42]: NC12022024: What is the
impact to the SOW
Commented [RS46R42]: I do see that FedEx parcel
service is being used in SCALE 2013 currently. In that
case, we should be able to migrate in SCALE Active as
well
Commented [RS47R42]: Checked the SOW again and
FedEx is included. We can resolve this.
Commented [SM48]: Knipper would like to use ...
Commented [NC49R48]: MAH to confirm if any ...
Commented [RS50R48]: The configurations will need. ..
Commented [NC51R48]: NC12022024: This is ...
Commented [SM52]: Blind LPNs are used for Blind. ..
Commented [NC53R52]: MAH to add. Current ...
Commented [RS54R52]: The blind LPNs can be used. ..
Commented [NC55R52]: NC12022024: this is ...
Commented [CC56]: What do the Item labels look ...
Commented [RS57R56]: Currently this is not ...
Commented [NC58R56]: NC12022024: this is ...
Commented [SM59]: Can we get a demo? KMW ...
Commented [NC60R59]: Configuration based. This is. ..
Commented [SM61]: Can we get a demo? KMW ...
Commented [NC62R61]: Hardware integration - this i.s..	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
39) Picking sequence and/or Putaway sequence are not leveraged. Location template is
used in the order-by clause to determine how putaway and picking should occur in the
warehouse. The existing setup is used.
40) Wave-based dock assignment is leveraged in this implementation.
41) Wave-based shipment consolidation is not leveraged in this implementation.
42) When a split shipment happens on load confirmation in SCALE, Middleware or Host
system will be able to handle processing of multiple upload files.
43) Transportation Execution is implemented for the supported services of FedEx, UPS,
USPS and UPS Mail Innovations.
44) Rate shopping is not leveraged and is out of the scope of this implementation.
45) Location Check Digit is not leveraged for location verification.
46) Host does not send a delete interface for deleting item master. The obsolete items are
not marked as inactive either.
47) Receiving worksheets are utilized and system-generated LPN labels are used.
48) Country of origin for an item is tracked in SCALE at the Item level.
49) Item labels (Knipper/Supplier SKU labels) are not required to be printed from SCALE.
50) Systemic outbound QC is used in this implementation. Knipper would like to enhance QC
functionality to be able to perform QC for Pallets with nested containers.
51) Work Orders will be utilized in this implementation.
52) Setting up labor management is not in scope of this implementation.
53) Knipper migrates the existing ODWS to generic configs during the build phase. This is to
establish an SOP where reliance on Manhattan cloud services to execute ODWS is
alleviated.
54) This document uses suggested naming conventions for configurations like locating rule
names, zones, work type names, etc. Actual names may change during the configuration
phase.
55) Vocollect Voice Picking will not be utilized.
56) In the warehouse, physically there can be multiple packing locations but systematically
in SCALE there is a one pack location per warehouse.
57) Parcel international shipments are manifested at shipment level.
58) Back-order processing is done at Host. In SCALE we ship 100% of the quantity requested
by host. Allocation exceptions and Pick exceptions are handled according to the SOP
defined by Knipper.
59) Receipt Workbench will be utilized for receiving receipts for most accounts of Knipper
(mainly MSM) accounts as most of the products do not have barcode for Item and Lot.
For 3PL accounts, Warehouse Mobile receiving will be utilized.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 8 of 119						
```

<a id="p008-t002"></a>
## p008\-t002 — PDF page 8, detected table 2

```text
48) Country of origin for an item is tracked in SCALE at the Item level.	
49)	Item labels (Knipper/Supplier SKU labels) are not required to be printed from SCALE.
```

<a id="p009-b001"></a>
## p009\-b001 — PDF page 9, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p009-b002"></a>
## p009\-b002 — PDF page 9, block 2

```text
 

```

<a id="p009-b003"></a>
## p009\-b003 — PDF page 9, block 3

```text
 
 
TERMINOLOGY 
 

```

<a id="p009-b004"></a>
## p009\-b004 — PDF page 9, block 4

```text
Client Terminology 
MA Terminology 
Definition 
WMS 
SCALE 
Supply Chain Architected for Logistics 
Execution warehouse management. 
EDI 
HOST / ERP 
Knipper’ ERP system integrating with 
Scale  

```

<a id="p009-b005"></a>
## p009\-b005 — PDF page 9, block 5

```text
ITEM 
ITEM 
Item Identifier for regular inventory. 
For Knipper, this is item code, style, 
color, and size. 
GTIN 
ITEM CROSS REFERENCE 
Global Trade Item Number. Definition 
of an SKU in a specific Unit of 
Measurement (UoM). 
PURCHASE 
ORDER 
/ 
RECEIPTS 

```

<a id="p009-b006"></a>
## p009\-b006 — PDF page 9, block 6

```text
RECEIPTS 
Goods 
purchased 
by 
Knipper.  
Purchase orders and receipts have a 
1:M mapping. SCALE maintains these 
as receipts with PO interfaced on 
receipt header. 
TRAILER ID (IN BOUND) 
TRAILER ID 
A container or truck being received 
into the DC. One inbound trailer has 
one receipt. 
TRACK & TRACE ITEM 
ITEM 
Items 
needing 
tracking 
and 
traceability in SCALE for the source 
and valid paperwork. 
ORDER 
SHIPMENT 
Goods to be shipped to stores, 
wholesale 
customers, 
or 
retail 
supermarkets. the order in ERP and 
shipment in scale will be a 1:1 
mapping. 
WAVE 
WAVE 
A wave represents the different steps 
that the system uses to retrieve orders 
from the pool, and process them into 
the outbound portion of SCALE 
RUN WAVE 
RUN WAVE 
a group of orders when processed 
resulting in inventory allocation  
POOL 
POOL 
Any orders pending processing to be 
shipped immediately after interface to 
SCALE 
PICK TASK 
WORK INSTRUCTION 
Transaction tracked by SCALE to 
coordinate the movement of inventory 
for a variety of warehouse processes. 
A group of work instruction is work unit 

```

<a id="p009-b007"></a>
## p009\-b007 — PDF page 9, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 9 of 119 
 

```

<a id="p009-t001"></a>
## p009\-t001 — PDF page 9, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
TERMINOLOGY
Client Terminology MA Terminology Definition
WMS SCALE Supply Chain Architected for Logistics
Execution warehouse management.
EDI HOST / ERP Knipper’ ERP system integrating with
Scale
ITEM ITEM Item Identifier for regular inventory.
For Knipper, this is item code, style,
color, and size.
GTIN ITEM CROSS REFERENCE Global Trade Item Number. Definition
of an SKU in a specific Unit of
Measurement (UoM).
PURCHASE ORDER / RECEIPTS Goods purchased by Knipper.
RECEIPTS Purchase orders and receipts have a
1:M mapping. SCALE maintains these
as receipts with PO interfaced on
receipt header.
TRAILER ID (IN BOUND) TRAILER ID A container or truck being received
into the DC. One inbound trailer has
one receipt.
TRACK & TRACE ITEM ITEM Items needing tracking and
traceability in SCALE for the source
and valid paperwork.
ORDER SHIPMENT Goods to be shipped to stores,
wholesale customers, or retail
supermarkets. the order in ERP and
shipment in scale will be a 1:1
mapping.
WAVE WAVE A wave represents the different steps
that the system uses to retrieve orders
from the pool, and process them into
the outbound portion of SCALE
RUN WAVE RUN WAVE a group of orders when processed
resulting in inventory allocation
POOL POOL Any orders pending processing to be
shipped immediately after interface to
SCALE
PICK TASK WORK INSTRUCTION Transaction tracked by SCALE to
coordinate the movement of inventory
for a variety of warehouse processes.
A group of work instruction is work unit
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 9 of 119						
```

<a id="p009-t002"></a>
## p009\-t002 — PDF page 9, detected table 2

```text
	Client Terminology			MA Terminology			Definition	
WMS			SCALE			Supply Chain Architected for Logistics
Execution warehouse management.		
EDI			HOST / ERP			Knipper’ ERP system integrating with
Scale		
ITEM			ITEM			Item Identifier for regular inventory.
For Knipper, this is item code, style,
color, and size.		
GTIN			ITEM CROSS REFERENCE			Global Trade Item Number. Definition
of an SKU in a specific Unit of
Measurement (UoM).		
PURCHASE ORDER /
RECEIPTS			RECEIPTS			Goods purchased by Knipper.
Purchase orders and receipts have a
1:M mapping. SCALE maintains these
as receipts with PO interfaced on
receipt header.		
TRAILER ID (IN BOUND)			TRAILER ID			A container or truck being received
into the DC. One inbound trailer has
one receipt.		
TRACK & TRACE ITEM			ITEM			Items needing tracking and
traceability in SCALE for the source
and valid paperwork.		
ORDER			SHIPMENT			Goods to be shipped to stores,
wholesale customers, or retail
supermarkets. the order in ERP and
shipment in scale will be a 1:1
mapping.		
WAVE			WAVE			A wave represents the different steps
that the system uses to retrieve orders
from the pool, and process them into
the outbound portion of SCALE		
RUN WAVE			RUN WAVE			a group of orders when processed
resulting in inventory allocation		
POOL			POOL			Any orders pending processing to be
shipped immediately after interface to
SCALE		
PICK TASK			WORK INSTRUCTION			Transaction tracked by SCALE to
coordinate the movement of inventory
for a variety of warehouse processes.
A group of work instruction is work unit		
```

<a id="p010-b001"></a>
## p010\-b001 — PDF page 10, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p010-b002"></a>
## p010\-b002 — PDF page 10, block 2

```text
 

```

<a id="p010-b003"></a>
## p010\-b003 — PDF page 10, block 3

```text
CARTON / CASE 
SHIPPING CONTAINER 
 
 

```

<a id="p010-b004"></a>
## p010\-b004 — PDF page 10, block 4

```text
An object that can be used to hold or 
transport inventory for a shipment.  
 
CARTON / CASE (INBOUND) RECEIVING CONTAINER 
An object that can be used to hold or 
transport inventory for a receipt.  
LPN  
LOGISTICS UNIT 
An object that can be used to hold or 
transport inventory. When nested, the 
tree unit is referred to as the parent 
logistics unit.  
 
P&D 
Pick up and Drop location 
ODWS 
ODWS 
Override Data Wave Step. SCALE 
provides a wave step that allows 
performing crud operation to data 
during the wave process. 
EXIT POINT 
EXIT POINT 
An external process that performs 
logic in line with the base process. 
Used to update data or perform 
additional logic. 
 
 
UOM DEFINITION: 
These are examples of a unit of measure definition displaying four UOMs and their respective 
representation to the other UOMs. This is not the baseline unit of measures. 
 

```

<a id="p010-b005"></a>
## p010\-b005 — PDF page 10, block 5

```text
Figure – Unit of Measure  

```

<a id="p010-b006"></a>
## p010\-b006 — PDF page 10, block 6

```text
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p010-b007"></a>
## p010\-b007 — PDF page 10, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 10 of 119 
 

```

<a id="p010-t001"></a>
## p010\-t001 — PDF page 10, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
CARTON / CASE SHIPPING CONTAINER An object that can be used to hold or
transport inventory for a shipment.
CARTON / CASE (INBOUND) RECEIVING CONTAINER An object that can be used to hold or
transport inventory for a receipt.
LPN LOGISTICS UNIT An object that can be used to hold or
transport inventory. When nested, the
tree unit is referred to as the parent
logistics unit.
P&D Pick up and Drop location
ODWS ODWS Override Data Wave Step. SCALE
provides a wave step that allows
performing crud operation to data
during the wave process.
EXIT POINT EXIT POINT An external process that performs
logic in line with the base process.
Used to update data or perform
additional logic.
UOM DEFINITION:
These are examples of a unit of measure definition displaying four UOMs and their respective
representation to the other UOMs. This is not the baseline unit of measures.
Figure – Unit of Measure
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 10 of 119						
```

<a id="p010-t002"></a>
## p010\-t002 — PDF page 10, detected table 2

```text
CARTON / CASE	SHIPPING CONTAINER	An object that can be used to hold or
transport inventory for a shipment.
CARTON / CASE (INBOUND)	RECEIVING CONTAINER	An object that can be used to hold or
transport inventory for a receipt.
LPN	LOGISTICS UNIT	An object that can be used to hold or
transport inventory. When nested, the
tree unit is referred to as the parent
logistics unit.
	P&D	Pick up and Drop location
ODWS	ODWS	Override Data Wave Step. SCALE
provides a wave step that allows
performing crud operation to data
during the wave process.
EXIT POINT	EXIT POINT	An external process that performs
logic in line with the base process.
Used to update data or perform
additional logic.
```

<a id="p011-b001"></a>
## p011\-b001 — PDF page 11, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p011-b002"></a>
## p011\-b002 — PDF page 11, block 2

```text
 

```

<a id="p011-b003"></a>
## p011\-b003 — PDF page 11, block 3

```text
 
 
I. INTERFACES 
 

```

<a id="p011-b004"></a>
## p011\-b004 — PDF page 11, block 4

```text
Commented [RS63]: This picture will be updated with 
the details of host/middleware used by Knipper 

```

<a id="p011-b005"></a>
## p011\-b005 — PDF page 11, block 5

```text
Host system downloads information into SCALE using API-based methods of interfacing. 
Upload from SCALE to Host will be handled using XML file-based method of interfacing. 
This allows the Host system to create records with key information for downloads, and 
SCALE reads this key information to download the information into the SCALE 
production tables. XML upload method also allows the Host system to read key 
information from SCALE’s upload XML records.  
 
Each interface touch point below can be run manually as well as through scheduled jobs 
as defined by Knipper. The specific schedule can depend on the Host system, 
warehouse processing times and SCALE interface execution times. 
 
Warehouse alerts can be configured to notify Knipper employees when a download or 
upload interface has failed for any reason.  
 
1.0       DOWNLOAD FROM HOST TO SCALE 
 

```

<a id="p011-b006"></a>
## p011\-b006 — PDF page 11, block 6

```text
Commented [RS64R63]: Please advise the details on 
the host and middleware system so that this can be 
updated. 

```

<a id="p011-b007"></a>
## p011\-b007 — PDF page 11, block 7

```text
Commented [NC65R63]: NC12022024: Vimal to 
provide 

```

<a id="p011-b008"></a>
## p011\-b008 — PDF page 11, block 8

```text
 
Figure: Download Touchpoints 
 

```

<a id="p011-b009"></a>
## p011\-b009 — PDF page 11, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 11 of 119 
 

```

<a id="p011-t001"></a>
## p011\-t001 — PDF page 11, detected table 1

```text
					MENT
Commented [RS63]: This picture will be updated with
the details of host/middleware used by Knipper
Commented [RS64R63]: Please advise the details on
the host and middleware system so that this can be
updated.
Commented [NC65R63]: NC12022024: Vimal to
provide	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
I. INTERFACES
Host system downloads information into SCALE using API-based methods of interfacing.
Upload from SCALE to Host will be handled using XML file-based method of interfacing.
This allows the Host system to create records with key information for downloads, and
SCALE reads this key information to download the information into the SCALE
production tables. XML upload method also allows the Host system to read key
information from SCALE’s upload XML records.
Each interface touch point below can be run manually as well as through scheduled jobs
as defined by Knipper. The specific schedule can depend on the Host system,
warehouse processing times and SCALE interface execution times.
Warehouse alerts can be configured to notify Knipper employees when a download or
upload interface has failed for any reason.
1.0 DOWNLOAD FROM HOST TO SCALE
Figure: Download Touchpoints
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 11 of 119						
```

<a id="p012-b001"></a>
## p012\-b001 — PDF page 12, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p012-b002"></a>
## p012\-b002 — PDF page 12, block 2

```text
 

```

<a id="p012-b003"></a>
## p012\-b003 — PDF page 12, block 3

```text
1.1    Item Master 
 
For majority of Knipper’s accounts (Companies), Item master is managed manually in 
SCALE as there is no EDI capabilities currently. The Item download interface is 
automated only for EDI accounts. For EDI accounts, the Host system downloads a 
record into the SCALE Item Master when an item is modified or created. If an item 
already exists in the Item Master, then the record is flagged as a change and SCALE 
updates the existing item with the latest information bridged from the host.  Information 
such as item number and item description are downloaded from the host system into 
SCALE. Item unit of measure and item cross reference is also downloaded as part of 
item master interface. 
 
 
1.2    Receipts 
 
For majority of Knipper’s accounts, Receipt creation is managed manually in SCALE as 
there is no EDI capabilities currently. The Receipts download interface is automated only 
for EDI accounts. For EDI accounts, Receipts will be interfaced to SCALE. This data is 
sent immediately upon creation of ASN record in Host and could sit in SCALE potentially 
across several shipments or deliveries until the entire receipt has been received (or 
manually closed). The information downloaded to SCALE from host will always contain 
both header and detail level information. This is the typical format for Knipper for ASNs 
and Returns. This data is illustrated in the table below:  
 

```

<a id="p012-b004"></a>
## p012\-b004 — PDF page 12, block 4

```text
SCALE Table 
Description 
Receipt Order Header 
Header Level Receipt Data 
Receipt Order Detail 
Line Item Detail Receipt Data 
 
In Future, Knipper may explore capability to send container level information. These true 
ASN records are periodically processed within SCALE to create Receipt records. The 
information downloaded to SCALE will always contain header, detail, and container level 
information. This data is illustrated in the table below:  
  

```

<a id="p012-b005"></a>
## p012\-b005 — PDF page 12, block 5

```text
SCALE Table 
Description 
Receipt Order Header 
Header Level Receipt Data 
Receipt Order Detail 
Line Item Detail Receipt Data 
Receipt Container 
Box level Receipt Data 
 
 
1.3   Shipments 
 
For majority of Knipper’s accounts, Shipment creation is managed manually in SCALE 
as there is no EDI capabilities currently. The Shipment download interface is automated 
only for EDI accounts. For EDI accounts, Shipments are created in Host and Host 
reformats the data into SCALE format and sends with a warehouse-specific shipment 

```

<a id="p012-b006"></a>
## p012\-b006 — PDF page 12, block 6

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 12 of 119 
 

```

<a id="p012-t001"></a>
## p012\-t001 — PDF page 12, detected table 1

```text
			MENT	
				
		KNIPPER SOLUTION DESIGN DOCU	MENT	
				
1.1 Item Master
For majority of Knipper’s accounts (Companies), Item master is managed manually in
SCALE as there is no EDI capabilities currently. The Item download interface is
automated only for EDI accounts. For EDI accounts, the Host system downloads a
record into the SCALE Item Master when an item is modified or created. If an item
already exists in the Item Master, then the record is flagged as a change and SCALE
updates the existing item with the latest information bridged from the host. Information
such as item number and item description are downloaded from the host system into
SCALE. Item unit of measure and item cross reference is also downloaded as part of
item master interface.
1.2 Receipts
For majority of Knipper’s accounts, Receipt creation is managed manually in SCALE as
there is no EDI capabilities currently. The Receipts download interface is automated only
for EDI accounts. For EDI accounts, Receipts will be interfaced to SCALE. This data is
sent immediately upon creation of ASN record in Host and could sit in SCALE potentially
across several shipments or deliveries until the entire receipt has been received (or
manually closed). The information downloaded to SCALE from host will always contain
both header and detail level information. This is the typical format for Knipper for ASNs
and Returns. This data is illustrated in the table below:
SCALE Table Description
Receipt Order Header Header Level Receipt Data
Receipt Order Detail Line Item Detail Receipt Data
In Future, Knipper may explore capability to send container level information. These true
ASN records are periodically processed within SCALE to create Receipt records. The
information downloaded to SCALE will always contain header, detail, and container level
information. This data is illustrated in the table below:
SCALE Table Description
Receipt Order Header Header Level Receipt Data
Receipt Order Detail Line Item Detail Receipt Data
Receipt Container Box level Receipt Data
1.3 Shipments
For majority of Knipper’s accounts, Shipment creation is managed manually in SCALE
as there is no EDI capabilities currently. The Shipment download interface is automated
only for EDI accounts. For EDI accounts, Shipments are created in Host and Host
reformats the data into SCALE format and sends with a warehouse-specific shipment
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 12 of 119				
```

<a id="p012-t002"></a>
## p012\-t002 — PDF page 12, detected table 2

```text
SCALE Table	Description	
Receipt Order Header	Header Level Receipt Data	
Receipt Order Detail	Line Item Detail Receipt Data	
```

<a id="p012-t003"></a>
## p012\-t003 — PDF page 12, detected table 3

```text
SCALE Table	Description
Receipt Order Header	Header Level Receipt Data
Receipt Order Detail	Line Item Detail Receipt Data
Receipt Container	Box level Receipt Data
```

<a id="p013-b001"></a>
## p013\-b001 — PDF page 13, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p013-b002"></a>
## p013\-b002 — PDF page 13, block 2

```text
 

```

<a id="p013-b003"></a>
## p013\-b003 — PDF page 13, block 3

```text
Commented [RS66]: This picture will be updated with 
the details of host/middleware used by Knipper 

```

<a id="p013-b004"></a>
## p013\-b004 — PDF page 13, block 4

```text
header, one or more shipment details, and optional shipment comments in SCALE. The 
shipment header contains information such as customer, customer address, ship to 
address, carrier, and scheduled ship date information. The shipment detail is the item 
level detail for the shipment containing information such as item and ordered quantity. 
Comments can be linked to the shipment header or details to validate additional 
processing requirements within the warehouse. Until the shipment has been waved, 
SCALE can process updates and deletions from the Host against the shipment.  
 
 
2.0 UPLOAD FROM WM TO HOST 
 

```

<a id="p013-b005"></a>
## p013\-b005 — PDF page 13, block 5

```text
Commented [RS67R66]: Please advise the details on 
the host and middleware system so that this can be 
updated. 

```

<a id="p013-b006"></a>
## p013\-b006 — PDF page 13, block 6

```text
Commented [NC68R66]: NC12022024: Vimal to 
provide 

```

<a id="p013-b007"></a>
## p013\-b007 — PDF page 13, block 7

```text
 
Figure: Upload Touchpoints 

```

<a id="p013-b008"></a>
## p013\-b008 — PDF page 13, block 8

```text
2.1 Receipt Confirmation 
 

```

<a id="p013-b009"></a>
## p013\-b009 — PDF page 13, block 9

```text
The Interface Data option creates the receipt upload files from SCALE for all 
receipt containers that have reached the status ‘Closed’. The receipt upload files 
are the output of the receiving processes within SCALE. The upload includes 
receipt header, receipt detail, and receipt container. 
 
For Knipper, the upload will be performed at container level when the status of 
the receipt container reached ‘Closed’. This is a global setting and will apply for 
all kind of receipt types. 
 
2.2 Shipment Confirmation 
 

```

<a id="p013-b010"></a>
## p013\-b010 — PDF page 13, block 10

```text
The Interface Data option creates the shipment upload files from SCALE for all 
shipments that have reached status ‘Load Confirm Pending’ (shipment has been 
loaded to the truck). The shipment upload files are the output of the outbound 
process within SCALE. These files are generated after the execution of the load 
confirmation. The upload includes shipment header, shipment detail, shipment 
comment, and shipping container information. 
 
2.3 Inventory Transactions 
 

```

<a id="p013-b011"></a>
## p013\-b011 — PDF page 13, block 11

```text
SCALE maintains 4-wall inventory at a detailed level and communicates any 
changes in inventory levels to Host through the Inventory Transactions Interface. 

```

<a id="p013-b012"></a>
## p013\-b012 — PDF page 13, block 12

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 13 of 119 
 

```

<a id="p013-t001"></a>
## p013\-t001 — PDF page 13, detected table 1

```text
					MENT
Commented [RS66]: This picture will be updated with
the details of host/middleware used by Knipper
Commented [RS67R66]: Please advise the details on
the host and middleware system so that this can be
updated.
Commented [NC68R66]: NC12022024: Vimal to
provide	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
header, one or more shipment details, and optional shipment comments in SCALE. The
shipment header contains information such as customer, customer address, ship to
address, carrier, and scheduled ship date information. The shipment detail is the item
level detail for the shipment containing information such as item and ordered quantity.
Comments can be linked to the shipment header or details to validate additional
processing requirements within the warehouse. Until the shipment has been waved,
SCALE can process updates and deletions from the Host against the shipment.
2.0 UPLOAD FROM WM TO HOST
Figure: Upload Touchpoints
2.1 Receipt Confirmation
The Interface Data option creates the receipt upload files from SCALE for all
receipt containers that have reached the status ‘Closed’. The receipt upload files
are the output of the receiving processes within SCALE. The upload includes
receipt header, receipt detail, and receipt container.
For Knipper, the upload will be performed at container level when the status of
the receipt container reached ‘Closed’. This is a global setting and will apply for
all kind of receipt types.
2.2 Shipment Confirmation
The Interface Data option creates the shipment upload files from SCALE for all
shipments that have reached status ‘Load Confirm Pending’ (shipment has been
loaded to the truck). The shipment upload files are the output of the outbound
process within SCALE. These files are generated after the execution of the load
confirmation. The upload includes shipment header, shipment detail, shipment
comment, and shipping container information.
2.3 Inventory Transactions
SCALE maintains 4-wall inventory at a detailed level and communicates any
changes in inventory levels to Host through the Inventory Transactions Interface.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 13 of 119						
```

<a id="p014-b001"></a>
## p014\-b001 — PDF page 14, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p014-b002"></a>
## p014\-b002 — PDF page 14, block 2

```text
 

```

<a id="p014-b003"></a>
## p014\-b003 — PDF page 14, block 3

```text
Commented [RS69]: This is the recommendation so 
that Receipts in the Host system can be closed 
automatically in case of short receiving scenario. Need 
to confirm with Knipper if it is possible to implement this 
on the host system.. 

```

<a id="p014-b004"></a>
## p014\-b004 — PDF page 14, block 4

```text
All status changes and quantity changes in inventory are eligible to be uploaded 
to host system. During the cycle count process if the initial count produces 
discrepancy, then that transaction (suspense quantity) is also uploaded as 
inventory transaction upload to host.  
 
If a receipt is manually closed in SCALE, the receipt close transaction is also 
uploaded as part of inventory transaction upload.  
 
2.4 Item Balance 
 

```

<a id="p014-b005"></a>
## p014\-b005 — PDF page 14, block 5

```text
Commented [NC70R69]: NC12022024: We close 
when we receive the remaining inventory for receipt 

```

<a id="p014-b006"></a>
## p014\-b006 — PDF page 14, block 6

```text
Commented [RS71R69]: This recommendation is 
more on SCALE generating an electronic confirmation 
that Receipt has been still closed if it cannot be 
completely received. If this is not a valid use case, we 
can resolve this. 

```

<a id="p014-b007"></a>
## p014\-b007 — PDF page 14, block 7

```text
The total on-hand inventory for a given item and lot combination and inventory 
status can be uploaded to the host system on-demand through the Interface Data 
option in SCALE, or on a scheduled basis as configured in the Scheduled Job 
option. Any time the total on hand quantities are needed to compare against the 
host system, this option can be run and sent to the host system for reporting & 
comparison purposes. 
 

```

<a id="p014-b008"></a>
## p014\-b008 — PDF page 14, block 8

```text
1. For Knipper, include 0 inventory items in item balance upload will be set 
to No. 
 

```

<a id="p014-b009"></a>
## p014\-b009 — PDF page 14, block 9

```text
2. Item balance will not include inventory from receiving dock locations. 
 

```

<a id="p014-b010"></a>
## p014\-b010 — PDF page 14, block 10

```text
3. Item balance will include inventory from shipping dock locations. 
 

```

<a id="p014-b011"></a>
## p014\-b011 — PDF page 14, block 11

```text
4. Update and Delete for the Download Touchpoints 
 

```

<a id="p014-b012"></a>
## p014\-b012 — PDF page 14, block 12

```text
As part of download interface SCALE allows Host to modify or delete the 
records that were interfaced to SCALE. There are certain validations that 
SCALE performs before allowing these changes. The Validations are: 
 

```

<a id="p014-b013"></a>
## p014\-b013 — PDF page 14, block 13

```text
1. Shipment can be Updated / Deleted when the Leading and 
Trailing status of the shipment are in status of In Pool. Based 
upon the Action Code sent as part of the interface, SCALE 
determines what action (Insert, Update, Delete) needs to be 
carried out. 
2. Receipts can be updated / deleted when Leading and Trailing 
status is in “Check In Pending”. 
 
 
II. 
INBOUND 
 
3.0 PROCESS OVERVIEW 
 

```

<a id="p014-b014"></a>
## p014\-b014 — PDF page 14, block 14

```text
Knipper performs Item Level Receiving for all receipt types. Once the ASN is created, host 
system will send receipt download records to SCALE. From this, the Receiving Worksheet 

```

<a id="p014-b015"></a>
## p014\-b015 — PDF page 14, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 14 of 119 
 

```

<a id="p014-t001"></a>
## p014\-t001 — PDF page 14, detected table 1

```text
					MENT
Commented [RS69]: This is the recommendation so
that Receipts in the Host system can be closed
automatically in case of short receiving scenario. Need
to confirm with Knipper if it is possible to implement this
on the host system..
Commented [NC70R69]: NC12022024: We close
when we receive the remaining inventory for receipt
Commented [RS71R69]: This recommendation is
more on SCALE generating an electronic confirmation
that Receipt has been still closed if it cannot be
completely received. If this is not a valid use case, we
can resolve this.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
All status changes and quantity changes in inventory are eligible to be uploaded
to host system. During the cycle count process if the initial count produces
discrepancy, then that transaction (suspense quantity) is also uploaded as
inventory transaction upload to host.
If a receipt is manually closed in SCALE, the receipt close transaction is also
uploaded as part of inventory transaction upload.
2.4 Item Balance
The total on-hand inventory for a given item and lot combination and inventory
status can be uploaded to the host system on-demand through the Interface Data
option in SCALE, or on a scheduled basis as configured in the Scheduled Job
option. Any time the total on hand quantities are needed to compare against the
host system, this option can be run and sent to the host system for reporting &
comparison purposes.
1. For Knipper, include 0 inventory items in item balance upload will be set
to No.
2. Item balance will not include inventory from receiving dock locations.
3. Item balance will include inventory from shipping dock locations.
4. Update and Delete for the Download Touchpoints
As part of download interface SCALE allows Host to modify or delete the
records that were interfaced to SCALE. There are certain validations that
SCALE performs before allowing these changes. The Validations are:
1. Shipment can be Updated / Deleted when the Leading and
Trailing status of the shipment are in status of In Pool. Based
upon the Action Code sent as part of the interface, SCALE
determines what action (Insert, Update, Delete) needs to be
carried out.
2. Receipts can be updated / deleted when Leading and Trailing
status is in “Check In Pending”.
II. INBOUND
3.0 PROCESS OVERVIEW
Knipper performs Item Level Receiving for all receipt types. Once the ASN is created, host
system will send receipt download records to SCALE. From this, the Receiving Worksheet
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 14 of 119						
```

<a id="p014-t002"></a>
## p014\-t002 — PDF page 14, detected table 2

```text
If a receipt is manually closed in SCALE, the	receipt	close transaction is also
uploaded as part of inventory transaction upload.		
```

<a id="p015-b001"></a>
## p015\-b001 — PDF page 15, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p015-b002"></a>
## p015\-b002 — PDF page 15, block 2

```text
 

```

<a id="p015-b003"></a>
## p015\-b003 — PDF page 15, block 3

```text
can be printed to assist in the receiving process. Each item and quantity are then received. 
SCALE will then perform locating to identify a suitable storage location based on item 
characteristics. Lastly, the system directs the receipt containers to a storage location for 
putaway. ` 
 
Each step mentioned in the overview are described in detail in the sections below. 
 
Note: Knipper currently uses a customized Receiving worksheet and same will be ported 
over to Active SCALE. 
 

```

<a id="p015-b004"></a>
## p015\-b004 — PDF page 15, block 4

```text
 
Figure: Receiving Worksheet sample 

```

<a id="p015-b005"></a>
## p015\-b005 — PDF page 15, block 5

```text
 
 
4.0 
PRE-RECEIVING 
 

```

<a id="p015-b006"></a>
## p015\-b006 — PDF page 15, block 6

```text
4.1 
Receipt Creation 
 

```

<a id="p015-b007"></a>
## p015\-b007 — PDF page 15, block 7

```text
4.1.1 Interface  
 
Host will produce receipt download records that are interfaced to SCALE for the 
ASNs and Returns. Host sends these records as download messages to SCALE. 
These records are then processed and validated through the SCALE interface to 
ensure the data format is correct. 
 
4.1.2 Receipt ID Types 
 

```

<a id="p015-b008"></a>
## p015\-b008 — PDF page 15, block 8

```text
To group receipts from SCALE screens and to drive processing rules, it is helpful 
for SCALE to store different Receipt ID Types and Receipt Types. 
 

```

<a id="p015-b009"></a>
## p015\-b009 — PDF page 15, block 9

```text
The following list of Receipt ID Types will be configured in the system:  
 

```

<a id="p015-b010"></a>
## p015\-b010 — PDF page 15, block 10

```text
• 
ASN 
• 
Packing List 

```

<a id="p015-b011"></a>
## p015\-b011 — PDF page 15, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 15 of 119 
 

```

<a id="p015-t001"></a>
## p015\-t001 — PDF page 15, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
can be printed to assist in the receiving process. Each item and quantity are then received.
SCALE will then perform locating to identify a suitable storage location based on item
characteristics. Lastly, the system directs the receipt containers to a storage location for
putaway. `
Each step mentioned in the overview are described in detail in the sections below.
Note: Knipper currently uses a customized Receiving worksheet and same will be ported
over to Active SCALE.
Figure: Receiving Worksheet sample
4.0 PRE-RECEIVING
4.1 Receipt Creation
4.1.1 Interface
Host will produce receipt download records that are interfaced to SCALE for the
ASNs and Returns. Host sends these records as download messages to SCALE.
These records are then processed and validated through the SCALE interface to
ensure the data format is correct.
4.1.2 Receipt ID Types
To group receipts from SCALE screens and to drive processing rules, it is helpful
for SCALE to store different Receipt ID Types and Receipt Types.
The following list of Receipt ID Types will be configured in the system:
• ASN
• Packing List
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 15 of 119						
```

<a id="p016-b001"></a>
## p016\-b001 — PDF page 16, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p016-b002"></a>
## p016\-b002 — PDF page 16, block 2

```text
 

```

<a id="p016-b003"></a>
## p016\-b003 — PDF page 16, block 3

```text
• 
Returns 

```

<a id="p016-b004"></a>
## p016\-b004 — PDF page 16, block 4

```text
 
Receipt type is a free format field on a receipt record. It is commonly used to 
identify what type of supplier sent the receipt, such as manufacturer, vendor, etc. 
The system does not validate this value.  
 

```

<a id="p016-b005"></a>
## p016\-b005 — PDF page 16, block 5

```text
 
1.1.3 Create Receipt from Purchase Order Insight 
 
Knipper does not create receipts manually from Purchase Order.  
 
 
1.1.4 Create Receipt using Receipt Insight 
 
Knipper does create receipts manually using Receipt Insight screen. For 
majority of Knipper’s accounts, Receipts are not interfaced automatically. The 
Receipts are created manually based out of the packing List document received 
from the vendor.  

```

<a id="p016-b006"></a>
## p016\-b006 — PDF page 16, block 6

```text
Commented [SM72]: > 1.1.5 does not provide much 
detail to how the new system creates receipts from 
shipments. 
 
>Need to be able to modify receipt data. 
 
> Once LPs are created, need the ability to 
locate/un-locate at the line level. 
 
 

```

<a id="p016-b007"></a>
## p016\-b007 — PDF page 16, block 7

```text
Commented [NC73R72]: This can be resolved. MAH 
to provide EX 40 

```

<a id="p016-b008"></a>
## p016\-b008 — PDF page 16, block 8

```text
1.1.5 Create Receipt from Shipment 
 
Knipper does create receipts from shipments to receive the returns. The Receipt 
from Shipment is used to create the Returns receipt for the undelivered shipments 
which are returned with all the original packaging. 
 
Note: Currently Knipper uses this functionality to create Receipt from Shipment. 
However, the receipt lines are created without the lot information populated. 
Knipper would like to enhance the functionality to populate lot information based 
on lot shipped on the shipments [EX40 – Custom Receipt from Shipment].     
 

```

<a id="p016-b009"></a>
## p016\-b009 — PDF page 16, block 9

```text
Commented [SM74]: Add Lot and Expiration Date 
to this. 

```

<a id="p016-b010"></a>
## p016\-b010 — PDF page 16, block 10

```text
Commented [RS75R74]: We will have a separate 
design document which will have all the details. 

```

<a id="p016-b011"></a>
## p016\-b011 — PDF page 16, block 11

```text
1.1.6 Blind Receipts 
 
Knipper does leverage blind receiving in some scenarios when there is no ASN 
receipt exists.    
 

```

<a id="p016-b012"></a>
## p016\-b012 — PDF page 16, block 12

```text
Commented [NC76R74]: NC12022024: this is 
resolved. 

```

<a id="p016-b013"></a>
## p016\-b013 — PDF page 16, block 13

```text
 
4.2 
Viewing Receipts 
 

```

<a id="p016-b014"></a>
## p016\-b014 — PDF page 16, block 14

```text
Commented [SM77]: Want the ability to Blind 
Receive in the future. 

```

<a id="p016-b015"></a>
## p016\-b015 — PDF page 16, block 15

```text
Commented [NC78R77]: Knipper leverage blind 
receipts. MAH to update 

```

<a id="p016-b016"></a>
## p016\-b016 — PDF page 16, block 16

```text
All receipts that are downloaded or created in SCALE can be viewed from the 
Receiving Insight screens.  The lines can be viewed using Receipt Line Insight.  
If ASNs are downloaded or created, they can be viewed using Receipt Container 
Insight.  
 
   

```

<a id="p016-b017"></a>
## p016\-b017 — PDF page 16, block 17

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 16 of 119 
 

```

<a id="p016-t001"></a>
## p016\-t001 — PDF page 16, detected table 1

```text
					MENT
Commented [SM72]: > 1.1.5 does not provide much
detail to how the new system creates receipts from
shipments.
>Need to be able to modify receipt data.
> Once LPs are created, need the ability to
locate/un-locate at the line level.
Commented [NC73R72]: This can be resolved. MAH
to provide EX 40
Commented [SM74]: Add Lot and Expiration Date
to this.
Commented [RS75R74]: We will have a separate
design document which will have all the details.
Commented [NC76R74]: NC12022024: this is
resolved.
Commented [SM77]: Want the ability to Blind
Receive in the future.
Commented [NC78R77]: Knipper leverage blind
receipts. MAH to update	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• Returns
Receipt type is a free format field on a receipt record. It is commonly used to
identify what type of supplier sent the receipt, such as manufacturer, vendor, etc.
The system does not validate this value.
1.1.3 Create Receipt from Purchase Order Insight
Knipper does not create receipts manually from Purchase Order.
1.1.4 Create Receipt using Receipt Insight
Knipper does create receipts manually using Receipt Insight screen. For
majority of Knipper’s accounts, Receipts are not interfaced automatically. The
Receipts are created manually based out of the packing List document received
from the vendor.
1.1.5 Create Receipt from Shipment
Knipper does create receipts from shipments to receive the returns. The Receipt
from Shipment is used to create the Returns receipt for the undelivered shipments
which are returned with all the original packaging.
Note: Currently Knipper uses this functionality to create Receipt from Shipment.
However, the receipt lines are created without the lot information populated.
Knipper would like to enhance the functionality to populate lot information based
on lot shipped on the shipments [EX40 – Custom Receipt from Shipment].
1.1.6 Blind Receipts
Knipper does leverage blind receiving in some scenarios when there is no ASN
receipt exists.
4.2 Viewing Receipts
All receipts that are downloaded or created in SCALE can be viewed from the
Receiving Insight screens. The lines can be viewed using Receipt Line Insight.
If ASNs are downloaded or created, they can be viewed using Receipt Container
Insight.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 16 of 119						
```

<a id="p017-b001"></a>
## p017\-b001 — PDF page 17, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p017-b002"></a>
## p017\-b002 — PDF page 17, block 2

```text
 

```

<a id="p017-b003"></a>
## p017\-b003 — PDF page 17, block 3

```text
 
Figure – Receipt Insight 

```

<a id="p017-b004"></a>
## p017\-b004 — PDF page 17, block 4

```text
 

```

<a id="p017-b005"></a>
## p017\-b005 — PDF page 17, block 5

```text
 
Figure – Receipt Line Insight 

```

<a id="p017-b006"></a>
## p017\-b006 — PDF page 17, block 6

```text
 

```

<a id="p017-b007"></a>
## p017\-b007 — PDF page 17, block 7

```text
 
Figure – Receipt Container Insight 

```

<a id="p017-b008"></a>
## p017\-b008 — PDF page 17, block 8

```text
 

```

<a id="p017-b009"></a>
## p017\-b009 — PDF page 17, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 17 of 119 
 

```

<a id="p017-t001"></a>
## p017\-t001 — PDF page 17, detected table 1

```text
				MENT	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
Figure – Receipt Insight
Figure – Receipt Line Insight
Figure – Receipt Container Insight
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 17 of 119					
```

<a id="p018-b001"></a>
## p018\-b001 — PDF page 18, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p018-b002"></a>
## p018\-b002 — PDF page 18, block 2

```text
 

```

<a id="p018-b003"></a>
## p018\-b003 — PDF page 18, block 3

```text
 
 
4.3 
Generate Receiving Documents 
 

```

<a id="p018-b004"></a>
## p018\-b004 — PDF page 18, block 4

```text
Commented [SM79]: Update for 3PL to use DOC01 
and DOC02; OP-101D: Receiving Worksheet & 3PL-
QA-001A: QA Inspection of Incoming Material 

```

<a id="p018-b005"></a>
## p018\-b005 — PDF page 18, block 5

```text
Commented [NC80R79]: MAH to update to the 2 
documents 

```

<a id="p018-b006"></a>
## p018\-b006 — PDF page 18, block 6

```text
Commented [RS81R79]: Please confirm if the 2nd 
document is OP-101D or QA-001A. Also, I assume 
these are currently being used and will be ported over. 

```

<a id="p018-b007"></a>
## p018\-b007 — PDF page 18, block 7

```text
Once a receipt has been created and validated, documents can be printed against it 
Knipper prints the receiving Work sheet (DOC01) for all receiving flows. This document 
contains various data from the receipt that can be printed from SCALE by selecting a 
receipt from the Receipt Insight and choosing the Print Selected Documents option from 
Actions. The Receiving Worksheet is used to aid in the systematic receiving process and 
serves as a receiving journal after the receiving process. 
 
 

```

<a id="p018-b008"></a>
## p018\-b008 — PDF page 18, block 8

```text
Commented [NC82R79]: NC12022024: 1st document 
OP-101D and 2nd document QA-001A. Yes we are 
porting. This is resolved 

```

<a id="p018-b009"></a>
## p018\-b009 — PDF page 18, block 9

```text
 
Figure – Printing Receiving worksheet 

```

<a id="p018-b010"></a>
## p018\-b010 — PDF page 18, block 10

```text
 
 

```

<a id="p018-b011"></a>
## p018\-b011 — PDF page 18, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 18 of 119 
 

```

<a id="p018-t001"></a>
## p018\-t001 — PDF page 18, detected table 1

```text
					MENT
Commented [SM79]: Update for 3PL to use DOC01
and DOC02; OP-101D: Receiving Worksheet & 3PL-
QA-001A: QA Inspection of Incoming Material
Commented [NC80R79]: MAH to update to the 2
documents
Commented [RS81R79]: Please confirm if the 2nd
document is OP-101D or QA-001A. Also, I assume
these are currently being used and will be ported over.
Commented [NC82R79]: NC12022024: 1st document
OP-101D and 2nd document QA-001A. Yes we are
porting. This is resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
4.3 Generate Receiving Documents
Once a receipt has been created and validated, documents can be printed against it
Knipper prints the receiving Work sheet (DOC01) for all receiving flows. This document
contains various data from the receipt that can be printed from SCALE by selecting a
receipt from the Receipt Insight and choosing the Print Selected Documents option from
Actions. The Receiving Worksheet is used to aid in the systematic receiving process and
serves as a receiving journal after the receiving process.
Figure – Printing Receiving worksheet
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 18 of 119						
```

<a id="p019-b001"></a>
## p019\-b001 — PDF page 19, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p019-b002"></a>
## p019\-b002 — PDF page 19, block 2

```text
 

```

<a id="p019-b003"></a>
## p019\-b003 — PDF page 19, block 3

```text
 
Figure – Receiving work sheet sample 

```

<a id="p019-b004"></a>
## p019\-b004 — PDF page 19, block 4

```text
 
 
5.0 
APPOINTMENT SCHEDULING 
 

```

<a id="p019-b005"></a>
## p019\-b005 — PDF page 19, block 5

```text
5.1 
Operations 
 

```

<a id="p019-b006"></a>
## p019\-b006 — PDF page 19, block 6

```text
Commented [SM83]: Knipper will have discretion to 
schedule in or out of scale. 

```

<a id="p019-b007"></a>
## p019\-b007 — PDF page 19, block 7

```text
Commented [NC84R83]: MAH to confirm no impact 
for Knipper using discretion 

```

<a id="p019-b008"></a>
## p019\-b008 — PDF page 19, block 8

```text
Commented [RS85R83]: Please note that 
appointments can only be scheduled for Inbound 
shipments (Receipts). There is no functionality to 
manage appointments for shipping loads. 

```

<a id="p019-b009"></a>
## p019\-b009 — PDF page 19, block 9

```text
Commented [NC86R83]: NC12022024: This is 
resolved. 

```

<a id="p019-b010"></a>
## p019\-b010 — PDF page 19, block 10

```text
Knipper handles inbound appointment scheduling currently outside of SCALE. With this 
implementation, Knipper continues to handle the appointment scheduling outside of 
SCALE.  
 
 
A typical workflow for using systemic appointment scheduling is listed here for reference 
if Knipper wants to leverage it in the future.  
 
To better facilitate the receiving, Knipper personnel may assign an appointment for the 
given receipt using the New Appointment function in the Receipt Insight screen option. 
This is documented for reference purposes in case appointment visibility is needed inside 
SCALE. This needs a receipt ID visibility in SCALE in advance. Users can then go back 
and view what receipts are scheduled for a given day by viewing the Appointments folder 
in the Receipt Insight.  
 

```

<a id="p019-b011"></a>
## p019\-b011 — PDF page 19, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 19 of 119 
 

```

<a id="p019-t001"></a>
## p019\-t001 — PDF page 19, detected table 1

```text
				MENT
Commented [SM83]: Knipper will have discretion to
schedule in or out of scale.
Commented [NC84R83]: MAH to confirm no impact
for Knipper using discretion
Commented [RS85R83]: Please note that
appointments can only be scheduled for Inbound
shipments (Receipts). There is no functionality to
manage appointments for shipping loads.
Commented [NC86R83]: NC12022024: This is
resolved.	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
Figure – Receiving work sheet sample
5.0 APPOINTMENT SCHEDULING
5.1 Operations
Knipper handles inbound appointment scheduling currently outside of SCALE. With this
implementation, Knipper continues to handle the appointment scheduling outside of
SCALE.
A typical workflow for using systemic appointment scheduling is listed here for reference
if Knipper wants to leverage it in the future.
To better facilitate the receiving, Knipper personnel may assign an appointment for the
given receipt using the New Appointment function in the Receipt Insight screen option.
This is documented for reference purposes in case appointment visibility is needed inside
SCALE. This needs a receipt ID visibility in SCALE in advance. Users can then go back
and view what receipts are scheduled for a given day by viewing the Appointments folder
in the Receipt Insight.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 19 of 119					
```

<a id="p020-b001"></a>
## p020\-b001 — PDF page 20, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p020-b002"></a>
## p020\-b002 — PDF page 20, block 2

```text
 

```

<a id="p020-b003"></a>
## p020\-b003 — PDF page 20, block 3

```text
 
Figure – Appointment Schedule Window 

```

<a id="p020-b004"></a>
## p020\-b004 — PDF page 20, block 4

```text
 
This allows for enhanced management of dock door locations, as well as the personnel 
required to unload the trailers at the dock. Users may enter the following information when 
scheduling an inbound appointment:  
 

```

<a id="p020-b005"></a>
## p020\-b005 — PDF page 20, block 5

```text
• 
Trailer ID 
• 
Dock Door 
• 
Start Date/Time 
• 
End Date/Time  
 
Note: Appointments can only be scheduled for open receipts in SCALE. Appointments 
can’t be created without associating a receipt with it. 
 
A graphical calendar screen for managing inbound receipt appointments is also available. 
The screen shows activity for the day per dock door and allows the user to easily see and 
schedule open spots on the calendar. From this screen, the user can preview appointment 
details, schedule new appointments, change existing appointments, or delete 
appointments.  
  

```

<a id="p020-b006"></a>
## p020\-b006 — PDF page 20, block 6

```text
 
Figure – Receiving Appointment Schedule Window 

```

<a id="p020-b007"></a>
## p020\-b007 — PDF page 20, block 7

```text
 
 
 
 
 

```

<a id="p020-b008"></a>
## p020\-b008 — PDF page 20, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 20 of 119 
 

```

<a id="p020-t001"></a>
## p020\-t001 — PDF page 20, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Appointment Schedule Window
This allows for enhanced management of dock door locations, as well as the personnel
required to unload the trailers at the dock. Users may enter the following information when
scheduling an inbound appointment:
• Trailer ID
• Dock Door
• Start Date/Time
• End Date/Time
Note: Appointments can only be scheduled for open receipts in SCALE. Appointments
can’t be created without associating a receipt with it.
A graphical calendar screen for managing inbound receipt appointments is also available.
The screen shows activity for the day per dock door and allows the user to easily see and
schedule open spots on the calendar. From this screen, the user can preview appointment
details, schedule new appointments, change existing appointments, or delete
appointments.
Figure – Receiving Appointment Schedule Window
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 20 of 119						
```

<a id="p021-b001"></a>
## p021\-b001 — PDF page 21, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p021-b002"></a>
## p021\-b002 — PDF page 21, block 2

```text
 

```

<a id="p021-b003"></a>
## p021\-b003 — PDF page 21, block 3

```text
6.0 
UNLOADING 
 

```

<a id="p021-b004"></a>
## p021\-b004 — PDF page 21, block 4

```text
6.1 
Unloading Trailer 
 
Upon the arrival of the truck and verification of the appointment schedule at the guard 
check, delivery documentation is obtained from the driver and matched to the 
corresponding receipts in SCALE. The delivery documentation includes a packing slip, 
BOL, Seal ID, and other information. Once it is verified that the receipt exists in SCALE, the 
truck is docked at the assigned door and items are unloaded from the truck to that pre-
receiving dock area. For Knipper, this area is the receiving dock. 
 
Note: Seal id and Truck id is available as paperwork for the receipts. This information is not 
available in the interface. Knipper manually updates this information on the receipt header.  
 
Some of the floor-loaded trailers may not have decent stacking/layering of the product. 
Multiple people may unload such trailers. The same item on the receipt may be present in 
the nose, mid, or tail of the truck and that leads to some single-item pallets taking more 
time to build before systemic check-in can begin. 
 
At this point, a visual QC check is conducted outside of SCALE if required. Knipper may 
perform a supplier compliance check outside of SCALE and leverage user-defined fields 
on the receipt header to capture compliance codes. This supplier compliance process is 
out of the scope of this implementation is not defined here.  
 
Once all items are unloaded and verified, the truck leaves the warehouse. If mixed item 
pallets are unloaded, they are broken into single item pallets. For lot tracked items, always, 
single item, single lot pallets are created.  
 
Tribal knowledge is leveraged at the DCs, for receipts by vendor, to decide using putaway 
groups or not. Since moving heavy items across pallets is labor intensive, the receiving 
clerks makes this decision during trailer unload. Manhattan recommends flagging heavy 
items on the receiving worksheet to provide visual aid to the clerk and users before 
unloading begins.   
 
. 
 
7.0 
QUALITY AUDIT 
 

```

<a id="p021-b005"></a>
## p021\-b005 — PDF page 21, block 5

```text
7.1 
Inbound Quality Control 
 

```

<a id="p021-b006"></a>
## p021\-b006 — PDF page 21, block 6

```text
Knipper performs a visual QC as an SOP on the inbound products and receives with a 
default status of ‘QC Hold’. The inventory status will be set to ‘QC Hold’ for all the Inbound 
LPNs even though physical inspection is performed on few selected LPNs. The quality 
inspection for the selected LPNs will be performed though all LPNs will be putaway to the 
reserve location before that.  
 

```

<a id="p021-b007"></a>
## p021\-b007 — PDF page 21, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 21 of 119 
 

```

<a id="p021-t001"></a>
## p021\-t001 — PDF page 21, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
6.0 UNLOADING
6.1 Unloading Trailer
Upon the arrival of the truck and verification of the appointment schedule at the guard
check, delivery documentation is obtained from the driver and matched to the
corresponding receipts in SCALE. The delivery documentation includes a packing slip,
BOL, Seal ID, and other information. Once it is verified that the receipt exists in SCALE, the
truck is docked at the assigned door and items are unloaded from the truck to that pre-
receiving dock area. For Knipper, this area is the receiving dock.
Note: Seal id and Truck id is available as paperwork for the receipts. This information is not
available in the interface. Knipper manually updates this information on the receipt header.
Some of the floor-loaded trailers may not have decent stacking/layering of the product.
Multiple people may unload such trailers. The same item on the receipt may be present in
the nose, mid, or tail of the truck and that leads to some single-item pallets taking more
time to build before systemic check-in can begin.
At this point, a visual QC check is conducted outside of SCALE if required. Knipper may
perform a supplier compliance check outside of SCALE and leverage user-defined fields
on the receipt header to capture compliance codes. This supplier compliance process is
out of the scope of this implementation is not defined here.
Once all items are unloaded and verified, the truck leaves the warehouse. If mixed item
pallets are unloaded, they are broken into single item pallets. For lot tracked items, always,
single item, single lot pallets are created.
Tribal knowledge is leveraged at the DCs, for receipts by vendor, to decide using putaway
groups or not. Since moving heavy items across pallets is labor intensive, the receiving
clerks makes this decision during trailer unload. Manhattan recommends flagging heavy
items on the receiving worksheet to provide visual aid to the clerk and users before
unloading begins.
.
7.0 QUALITY AUDIT
7.1 Inbound Quality Control
Knipper performs a visual QC as an SOP on the inbound products and receives with a
default status of ‘QC Hold’. The inventory status will be set to ‘QC Hold’ for all the Inbound
LPNs even though physical inspection is performed on few selected LPNs. The quality
inspection for the selected LPNs will be performed though all LPNs will be putaway to the
reserve location before that.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 21 of 119						
```

<a id="p022-b001"></a>
## p022\-b001 — PDF page 22, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p022-b002"></a>
## p022\-b002 — PDF page 22, block 2

```text
 

```

<a id="p022-b003"></a>
## p022\-b003 — PDF page 22, block 3

```text
Commented [SG87]: Please mention that User will 
search by Lot and 1 Lot is 1 Receipt 

```

<a id="p022-b004"></a>
## p022\-b004 — PDF page 22, block 4

```text
Commented [NC88R87]: MAH to add 

```

<a id="p022-b005"></a>
## p022\-b005 — PDF page 22, block 5

```text
Commented [RS89R87]: Added 

```

<a id="p022-b006"></a>
## p022\-b006 — PDF page 22, block 6

```text
Commented [SG90]: Will they then transfer to another 
location? 

```

<a id="p022-b007"></a>
## p022\-b007 — PDF page 22, block 7

```text
Commented [NC91R90]: MAH to respond 

```

<a id="p022-b008"></a>
## p022\-b008 — PDF page 22, block 8

```text
Commented [RS92R90]: Added 

```

<a id="p022-b009"></a>
## p022\-b009 — PDF page 22, block 9

```text
The inventory status of the LPNs will be changed based on the outcome of the quality 
inspection. The status will be updated as below 
 
1. QC Pass – User will change Inventory status from QC Hold to Available from Insight 
screen or Warehouse mobile. Note: The user will search LPNs by one lot at time to 
update the status as one lot is received on one receipt. 
2. QC Fail –   The disposition of the inventory will be updated based on the decision from 
the customer. The LPNs will be transferred to a designated location depending on the 
final disposition. If the final disposition is destruction, the LPNs will be transferred to 
the designated location. 
 
 
8.0 
RECEIVING / PALLETIZATION 
 
After unloading the truck and physically building the pallets if needed, and executing manual 
quality audit SOP, systematic receiving is then initiated via a check-in process. Checking 
In product is the process that creates the inventory inside of SCALE based on Receiving 
Preference of the user performing the action. 
 
 
 

```

<a id="p022-b010"></a>
## p022\-b010 — PDF page 22, block 10

```text
8.1 
Item Receiving (Pallets) – 3PL/Track and Trace Receiving 
 
Item level receiving is used for receiving single item, single lot pallets. The receiving clerk 
uses Receiving Worksheet (DOC01) to decide and use this receiving preference. These 
pallets may either be manually built pallets or pre-built pallets.  
 
The receiving preference is configured in SCALE as below: 
 

```

<a id="p022-b011"></a>
## p022\-b011 — PDF page 22, block 11

```text
• 
Create Putaway Work: Yes 
• 
Nest During Check In: No 
• 
Disposition Code Required: No  
• 
License Plate Assignment: System 
• 
RF Workflow: Header – Item  
• 
Execution Method: Check in and Locate (immediate) 
• 
Container Locating Method: Parent 
• 
Default Inventory Status – QC Hold/Client Hold 
 

```

<a id="p022-b012"></a>
## p022\-b012 — PDF page 22, block 12

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 22 of 119 
 

```

<a id="p022-t001"></a>
## p022\-t001 — PDF page 22, detected table 1

```text
					MENT
Commented [SG87]: Please mention that User will
search by Lot and 1 Lot is 1 Receipt
Commented [NC88R87]: MAH to add
Commented [RS89R87]: Added
Commented [SG90]: Will they then transfer to another
location?
Commented [NC91R90]: MAH to respond
Commented [RS92R90]: Added	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
The inventory status of the LPNs will be changed based on the outcome of the quality
inspection. The status will be updated as below
1. QC Pass – User will change Inventory status from QC Hold to Available from Insight
screen or Warehouse mobile. Note: The user will search LPNs by one lot at time to
update the status as one lot is received on one receipt.
2. QC Fail – The disposition of the inventory will be updated based on the decision from
the customer. The LPNs will be transferred to a designated location depending on the
final disposition. If the final disposition is destruction, the LPNs will be transferred to
the designated location.
8.0 RECEIVING / PALLETIZATION
After unloading the truck and physically building the pallets if needed, and executing manual
quality audit SOP, systematic receiving is then initiated via a check-in process. Checking
In product is the process that creates the inventory inside of SCALE based on Receiving
Preference of the user performing the action.
8.1 Item Receiving (Pallets) – 3PL/Track and Trace Receiving
Item level receiving is used for receiving single item, single lot pallets. The receiving clerk
uses Receiving Worksheet (DOC01) to decide and use this receiving preference. These
pallets may either be manually built pallets or pre-built pallets.
The receiving preference is configured in SCALE as below:
• Create Putaway Work: Yes
• Nest During Check In: No
• Disposition Code Required: No
• License Plate Assignment: System
• RF Workflow: Header – Item
• Execution Method: Check in and Locate (immediate)
• Container Locating Method: Parent
• Default Inventory Status – QC Hold/Client Hold
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 22 of 119						
```

<a id="p023-b001"></a>
## p023\-b001 — PDF page 23, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p023-b002"></a>
## p023\-b002 — PDF page 23, block 2

```text
 

```

<a id="p023-b003"></a>
## p023\-b003 — PDF page 23, block 3

```text
 
                      Figure - Receiving Preference Configurations 
The user selects Receiving option from Warehouse Mobile Main Menu. User selects the 
Item Level Receiving option.  
 
Once selected, the user scans:  

```

<a id="p023-b004"></a>
## p023\-b004 — PDF page 23, block 4

```text
Commented [SM93]: Need to locate at line level 

```

<a id="p023-b005"></a>
## p023\-b005 — PDF page 23, block 5

```text
Commented [NC94R93]: MAH to confirm if this can 
done. 

```

<a id="p023-b006"></a>
## p023\-b006 — PDF page 23, block 6

```text
Commented [RS95R93]: The locate is always at the 
LPN level even though same rule can be assigned to a 
line. 

```

<a id="p023-b007"></a>
## p023\-b007 — PDF page 23, block 7

```text
• 
Receipt ID (from Receiving work sheet DOC01) 
• 
Item code on the product 
• 
Quantity (Key in) in the applicable UoM. The lowest UoM will be always 
defaulted, and the user selects the UoM to receive. 
 
 
[EX39 – GS1 Label Scanning] – To extract GTIN, Lot and Expiration Date from GS1 
label. If no label, the details will be entered. 
After assigning a system-generated license plate number, the user either scans the Lot or 
keys in (if no barcode). 
 
If the lot and expiration date are interfaced on the receipt detail, the information is 
prepopulated.  
 
If the Item is Serial Number Tracked for Inbound, the user will scan the serial number from 
the barcode on the product or keys in (if no barcode). 
 
At this time, SCALE locates the LPN and putaway work is created and receipt Container 
Label (LBL01) is printed. The label is applied at the front bottom case of the pallet. SCALE 
determines a putaway location based on the locating rule assigned during the Check-In 
process. 

```

<a id="p023-b008"></a>
## p023\-b008 — PDF page 23, block 8

```text
Commented [NC96R93]: NC12022024: this is 
resolved. 

```

<a id="p023-b009"></a>
## p023\-b009 — PDF page 23, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 23 of 119 
 

```

<a id="p023-t001"></a>
## p023\-t001 — PDF page 23, detected table 1

```text
					MENT
Commented [SM93]: Need to locate at line level
Commented [NC94R93]: MAH to confirm if this can
done.
Commented [RS95R93]: The locate is always at the
LPN level even though same rule can be assigned to a
line.
Commented [NC96R93]: NC12022024: this is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Receiving Preference Configurations
The user selects Receiving option from Warehouse Mobile Main Menu. User selects the
Item Level Receiving option.
Once selected, the user scans:
• Receipt ID (from Receiving work sheet DOC01)
• Item code on the product
• Quantity (Key in) in the applicable UoM. The lowest UoM will be always
defaulted, and the user selects the UoM to receive.
[EX39 – GS1 Label Scanning] – To extract GTIN, Lot and Expiration Date from GS1
label. If no label, the details will be entered.
After assigning a system-generated license plate number, the user either scans the Lot or
keys in (if no barcode).
If the lot and expiration date are interfaced on the receipt detail, the information is
prepopulated.
If the Item is Serial Number Tracked for Inbound, the user will scan the serial number from
the barcode on the product or keys in (if no barcode).
At this time, SCALE locates the LPN and putaway work is created and receipt Container
Label (LBL01) is printed. The label is applied at the front bottom case of the pallet. SCALE
determines a putaway location based on the locating rule assigned during the Check-In
process.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 23 of 119						
```

<a id="p024-b001"></a>
## p024\-b001 — PDF page 24, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p024-b002"></a>
## p024\-b002 — PDF page 24, block 2

```text
 

```

<a id="p024-b003"></a>
## p024\-b003 — PDF page 24, block 3

```text
 
The system-generated label (LBL01) has flowing key information on it and is the same 
label currently used. 

```

<a id="p024-b004"></a>
## p024\-b004 — PDF page 24, block 4

```text
• 
License Plate # 
• 
SKU (Item) 
• 
Locating location 
• 
Lot  
• 
Expiration Date 
 
Note: Knipper uses a customized LPN label and same will be ported over to SCALE 
Active. 
 
The user continues to receive the next item for the same receipt or exit the current receipt 
and start over with a new receipt ID. Exiting a receipt on the Warehouse Mobile does NOT 
close that receipt. Users can go back to that receipt at any point in time.     
 

```

<a id="p024-b005"></a>
## p024\-b005 — PDF page 24, block 5

```text
 
Figure: Item Level Receiving flow 

```

<a id="p024-b006"></a>
## p024\-b006 — PDF page 24, block 6

```text
 
Note: [EX37 – DSCSA Inbound Processing] will be developed to enhance the Item 
Level Receiving to receive DSCSA tracked Items. The screen will be customized, and 

```

<a id="p024-b007"></a>
## p024\-b007 — PDF page 24, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 24 of 119 
 

```

<a id="p024-t001"></a>
## p024\-t001 — PDF page 24, detected table 1

```text
				MENT	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
The system-generated label (LBL01) has flowing key information on it and is the same
label currently used.
• License Plate #
• SKU (Item)
• Locating location
• Lot
• Expiration Date
Note: Knipper uses a customized LPN label and same will be ported over to SCALE
Active.
The user continues to receive the next item for the same receipt or exit the current receipt
and start over with a new receipt ID. Exiting a receipt on the Warehouse Mobile does NOT
close that receipt. Users can go back to that receipt at any point in time.
Figure: Item Level Receiving flow
Note: [EX37 – DSCSA Inbound Processing] will be developed to enhance the Item
Level Receiving to receive DSCSA tracked Items. The screen will be customized, and
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 24 of 119					
```

<a id="p025-b001"></a>
## p025\-b001 — PDF page 25, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p025-b002"></a>
## p025\-b002 — PDF page 25, block 2

```text
 

```

<a id="p025-b003"></a>
## p025\-b003 — PDF page 25, block 3

```text
Commented [SM97]: Need to re-verify EX37B is still 
accurate. 

```

<a id="p025-b004"></a>
## p025\-b004 — PDF page 25, block 4

```text
details will be documented in the extension specification document. The DSCSA Inbound 
Processing module will only be developed for Warehouse Mobile (RF). 
 

```

<a id="p025-b005"></a>
## p025\-b005 — PDF page 25, block 5

```text
Commented [SM98R97]: Need to be able to scan 
SSCC and verify quantity. 

```

<a id="p025-b006"></a>
## p025\-b006 — PDF page 25, block 6

```text
Commented [NC99R97]: This is resolved. New 
documents coming for MAH 

```

<a id="p025-b007"></a>
## p025\-b007 — PDF page 25, block 7

```text
 
                                                            Figure – Receipt Workbench Receiving 
 

```

<a id="p025-b008"></a>
## p025\-b008 — PDF page 25, block 8

```text
Commented [SM100]: Desktop Check In - need to 
be able to verify the Lot and Expiration Date to be 
checked in. 

```

<a id="p025-b009"></a>
## p025\-b009 — PDF page 25, block 9

```text
Commented [NC101R100]: MAH to confirm and add 

```

<a id="p025-b010"></a>
## p025\-b010 — PDF page 25, block 10

```text
 
                                                              Figure – Receipt Workbench Receiving – Lot not Prepopulated 
Note: Receipt Workbench will also be utilized for receiving Receipts in OHW (NJ) and 
KMW (IN) warehouses.  

```

<a id="p025-b011"></a>
## p025\-b011 — PDF page 25, block 11

```text
 
8.2 
Damage Receiving 
 

```

<a id="p025-b012"></a>
## p025\-b012 — PDF page 25, block 12

```text
Commented [RS102R100]: If the lot/expiration date is 
already assigned at the line level, then no additional 
scan is needed. If not, user is asked to scan. Please let 
me know if additional screenshots are needed to 
illustrate all the steps. 

```

<a id="p025-b013"></a>
## p025\-b013 — PDF page 25, block 13

```text
Commented [NC103R100]: NC12022024: Please 
provide additional screenshot 

```

<a id="p025-b014"></a>
## p025\-b014 — PDF page 25, block 14

```text
              Damage receiving will be used for receipts of receipt type ASN and Packing List 
when the inventory is damaged, or inventory can’t be sold. Receipt will be at line level. 
The inventory will be received on a single item pallet. 
 

```

<a id="p025-b015"></a>
## p025\-b015 — PDF page 25, block 15

```text
Commented [RS104R100]: Added a screenshot with 
an example where lot is not pre-populated 

```

<a id="p025-b016"></a>
## p025\-b016 — PDF page 25, block 16

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 25 of 119 
 

```

<a id="p025-t001"></a>
## p025\-t001 — PDF page 25, detected table 1

```text
					MENT
Commented [SM97]: Need to re-verify EX37B is still
accurate.
Commented [SM98R97]: Need to be able to scan
SSCC and verify quantity.
Commented [NC99R97]: This is resolved. New
documents coming for MAH
Commented [SM100]: Desktop Check In - need to
be able to verify the Lot and Expiration Date to be
checked in.
Commented [NC101R100]: MAH to confirm and add
Commented [RS102R100]: If the lot/expiration date is
already assigned at the line level, then no additional
scan is needed. If not, user is asked to scan. Please let
me know if additional screenshots are needed to
illustrate all the steps.
Commented [NC103R100]: NC12022024: Please
provide additional screenshot
Commented [RS104R100]: Added a screenshot with
an example where lot is not pre-populated	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
details will be documented in the extension specification document. The DSCSA Inbound
Processing module will only be developed for Warehouse Mobile (RF).
Figure – Receipt Workbench Receiving
Figure – Receipt Workbench Receiving – Lot not Prepopulated
Note: Receipt Workbench will also be utilized for receiving Receipts in OHW (NJ) and
KMW (IN) warehouses.
8.2 Damage Receiving
Damage receiving will be used for receipts of receipt type ASN and Packing List
when the inventory is damaged, or inventory can’t be sold. Receipt will be at line level.
The inventory will be received on a single item pallet.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 25 of 119						
```

<a id="p026-b001"></a>
## p026\-b001 — PDF page 26, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p026-b002"></a>
## p026\-b002 — PDF page 26, block 2

```text
 

```

<a id="p026-b003"></a>
## p026\-b003 — PDF page 26, block 3

```text
 
                                          Figure - Receiving Preference Configurations 
 

```

<a id="p026-b004"></a>
## p026\-b004 — PDF page 26, block 4

```text
Commented [SM105]: Upon receipt, LPN placed on 
"Received Damaged" hold. 

```

<a id="p026-b005"></a>
## p026\-b005 — PDF page 26, block 5

```text
 
                                       Figure – Damage Receiving  
 
Damage Receiving will be performed from the Receipt Workbench. The user selects the 
Receipt Workbench option from the Receiving menu. The user selects Damage Receiving 
Preference (OHW and KMW). Once complete, the user scans or enters the Receipt ID 
from the Receiving Worksheet (DOC01). Next, the user selects the item and enters the 
quantity to be received for the item. If the item doesn’t have unit of measure information 
or dimension information, the system notifies the user of this. The user selects the 
Disposition Code. A Disposition Code indicates the status of the inventory within an LPN.  

```

<a id="p026-b006"></a>
## p026\-b006 — PDF page 26, block 6

```text
Commented [NC106R105]: This can be resolved 

```

<a id="p026-b007"></a>
## p026\-b007 — PDF page 26, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 26 of 119 
 

```

<a id="p026-t001"></a>
## p026\-t001 — PDF page 26, detected table 1

```text
					MENT
Commented [SM105]: Upon receipt, LPN placed on
"Received Damaged" hold.
Commented [NC106R105]: This can be resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Receiving Preference Configurations
Figure – Damage Receiving
Damage Receiving will be performed from the Receipt Workbench. The user selects the
Receipt Workbench option from the Receiving menu. The user selects Damage Receiving
Preference (OHW and KMW). Once complete, the user scans or enters the Receipt ID
from the Receiving Worksheet (DOC01). Next, the user selects the item and enters the
quantity to be received for the item. If the item doesn’t have unit of measure information
or dimension information, the system notifies the user of this. The user selects the
Disposition Code. A Disposition Code indicates the status of the inventory within an LPN.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 26 of 119						
```

<a id="p027-b001"></a>
## p027\-b001 — PDF page 27, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p027-b002"></a>
## p027\-b002 — PDF page 27, block 2

```text
 

```

<a id="p027-b003"></a>
## p027\-b003 — PDF page 27, block 3

```text
Commented [SM107]: Default location for 
Damages: KMW-QA-Damage 

```

<a id="p027-b004"></a>
## p027\-b004 — PDF page 27, block 4

```text
Commented [NC108R107]: This can be resolved 

```

<a id="p027-b005"></a>
## p027\-b005 — PDF page 27, block 5

```text
For example, the item(s) could be in good condition, damaged, broken, etc. These codes 
are linked to a specific locating rule that the system can locate product differently based 
on its disposition code. At this time, SCALE performs locating. The work unit of the 
putaway work will be the LPN value. 
 
The LPNs will be putaway to the designated damaged area with appropriate Damaged 
status awaiting the communication on further action. The inventory will be shipped for 
destruction upon approval from Knipper’s customer. 
 
  

```

<a id="p027-b006"></a>
## p027\-b006 — PDF page 27, block 6

```text
8.3 
Returns  
 

```

<a id="p027-b007"></a>
## p027\-b007 — PDF page 27, block 7

```text
Customer returns are received and stocked into the inventory based on the disposition. 
Returns will be stored in a designated area.  
 
Return receiving is used for receipts of receipt type RA/RMA that are downloaded to 
SCALE from Host. For some returns, receipts are created using Shipments.  
 
Returns use their receiving preference, and the default inventory status is 
‘Available/Awaiting Client’ and located to a returns location. Knipper will maintain 
designated Returns location for each warehouse.  
 

```

<a id="p027-b008"></a>
## p027\-b008 — PDF page 27, block 8

```text
Commented [SM109]: Does not go on QC hold, 
should go onto either available or awaiting client 
disposition depending on the nature of the product 
returned. 

```

<a id="p027-b009"></a>
## p027\-b009 — PDF page 27, block 9

```text
Commented [NC110R109]: MAH to update 

```

<a id="p027-b010"></a>
## p027\-b010 — PDF page 27, block 10

```text
Commented [RS111R109]: updated 

```

<a id="p027-b011"></a>
## p027\-b011 — PDF page 27, block 11

```text
 
                   Figure - Receiving Preference Configurations 

```

<a id="p027-b012"></a>
## p027\-b012 — PDF page 27, block 12

```text
 

```

<a id="p027-b013"></a>
## p027\-b013 — PDF page 27, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 27 of 119 
 

```

<a id="p027-t001"></a>
## p027\-t001 — PDF page 27, detected table 1

```text
					MENT
Commented [SM107]: Default location for
Damages: KMW-QA-Damage
Commented [NC108R107]: This can be resolved
Commented [SM109]: Does not go on QC hold,
should go onto either available or awaiting client
disposition depending on the nature of the product
returned.
Commented [NC110R109]: MAH to update
Commented [RS111R109]: updated	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
For example, the item(s) could be in good condition, damaged, broken, etc. These codes
are linked to a specific locating rule that the system can locate product differently based
on its disposition code. At this time, SCALE performs locating. The work unit of the
putaway work will be the LPN value.
The LPNs will be putaway to the designated damaged area with appropriate Damaged
status awaiting the communication on further action. The inventory will be shipped for
destruction upon approval from Knipper’s customer.
8.3 Returns
Customer returns are received and stocked into the inventory based on the disposition.
Returns will be stored in a designated area.
Return receiving is used for receipts of receipt type RA/RMA that are downloaded to
SCALE from Host. For some returns, receipts are created using Shipments.
Returns use their receiving preference, and the default inventory status is
‘Available/Awaiting Client’ and located to a returns location. Knipper will maintain
designated Returns location for each warehouse.
Figure - Receiving Preference Configurations
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 27 of 119						
```

<a id="p028-b001"></a>
## p028\-b001 — PDF page 28, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p028-b002"></a>
## p028\-b002 — PDF page 28, block 2

```text
 

```

<a id="p028-b003"></a>
## p028\-b003 — PDF page 28, block 3

```text
Commented [SM112]: PL #20 - Good for Rep 
Returns using integrated RMA to receive against. 
 
Need a process to address undeliverable DTP 
(Direct to practitioner).  Want to be able to scan the 
OB container number from original shipment, pull the 
data of the shipment to receive back in.  

```

<a id="p028-b004"></a>
## p028\-b004 — PDF page 28, block 4

```text
Commented [NC113R112]: MAH to confirm 

```

<a id="p028-b005"></a>
## p028\-b005 — PDF page 28, block 5

```text
Commented [RS114R112]: This section describes the 
process of receiving into the warehouse. However, the 
receipt creation process you are asking will be 
documented in a separate design document as it will 
be a custom process. 

```

<a id="p028-b006"></a>
## p028\-b006 — PDF page 28, block 6

```text
Commented [NC115R112]: NC12022024: this is 
resolved. 

```

<a id="p028-b007"></a>
## p028\-b007 — PDF page 28, block 7

```text
Commented [SM116]: Do the users not verify lot 
and expiration date? 

```

<a id="p028-b008"></a>
## p028\-b008 — PDF page 28, block 8

```text
Commented [NC117R116]: MAH to add/confirm 

```

<a id="p028-b009"></a>
## p028\-b009 — PDF page 28, block 9

```text
Commented [RS118R116]: Knipper would like to pre-
assign lot/expiration into the lines prior to receiving. 
Hence, the user will not scan lot/expiration during 
receiving 

```

<a id="p028-b010"></a>
## p028\-b010 — PDF page 28, block 10

```text
Commented [NC119R116]: NC12022024: this is 
resolved. 

```

<a id="p028-b011"></a>
## p028\-b011 — PDF page 28, block 11

```text
 
                        Figure – Returns Receiving 
 
Returns Receiving will be performed from the Receipt Workbench. The user selects the 
Receipt Workbench option from the Receiving menu. The user selects Returns Receiving 
Preference (OHW/KMW). Once complete, the user scans or enters the Receipt ID from 
the Receiving Worksheet (DOC01). Next, the user selects the item and enters the quantity 
to be received for the item. If the item does not have unit of measure information or 
dimension information, the system notifies the user of this. The user selects the 
Disposition Code. A Disposition Code indicates the status of the inventory within an 
LPN.The user selects a Reason code indicating the reason for Returns. For example, the 
item(s) could be in good condition, damaged, broken, etc. These codes are linked to a 
specific locating rule that the system can locate product differently based on its disposition 
code. At this time, SCALE performs locating. The work unit of the putaway work will be 
the LPN value. 
 
The LPNs will be putaway to the designated Returns area with appropriate inventory 
status awaiting the communication on further action. The inventory will be shipped for 
destruction upon approval from Knipper’s customer. 
 
8.4 
Blind Receiving 
 
Blind receiving is used for receiving when there is no ASN receipt exists. The operator will 
create a receipt using the RF on the fly and add line items to the receipt. 
 
The receiving preference is configured in SCALE as below: 
 

```

<a id="p028-b012"></a>
## p028\-b012 — PDF page 28, block 12

```text
• 
Create Putaway Work: Yes 
• 
Nest During Check In: No 
• 
Disposition Code Required: No  
• 
License Plate Assignment: System 

```

<a id="p028-b013"></a>
## p028\-b013 — PDF page 28, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 28 of 119 
 

```

<a id="p028-t001"></a>
## p028\-t001 — PDF page 28, detected table 1

```text
					MENT
Commented [SM112]: PL #20 - Good for Rep
Returns using integrated RMA to receive against.
Need a process to address undeliverable DTP
(Direct to practitioner). Want to be able to scan the
OB container number from original shipment, pull the
data of the shipment to receive back in.
Commented [NC113R112]: MAH to confirm
Commented [RS114R112]: This section describes the
process of receiving into the warehouse. However, the
receipt creation process you are asking will be
documented in a separate design document as it will
be a custom process.
Commented [NC115R112]: NC12022024: this is
resolved.
Commented [SM116]: Do the users not verify lot
and expiration date?
Commented [NC117R116]: MAH to add/confirm
Commented [RS118R116]: Knipper would like to pre-
assign lot/expiration into the lines prior to receiving.
Hence, the user will not scan lot/expiration during
receiving
Commented [NC119R116]: NC12022024: this is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Returns Receiving
Returns Receiving will be performed from the Receipt Workbench. The user selects the
Receipt Workbench option from the Receiving menu. The user selects Returns Receiving
Preference (OHW/KMW). Once complete, the user scans or enters the Receipt ID from
the Receiving Worksheet (DOC01). Next, the user selects the item and enters the quantity
to be received for the item. If the item does not have unit of measure information or
dimension information, the system notifies the user of this. The user selects the
Disposition Code. A Disposition Code indicates the status of the inventory within an
LPN.The user selects a Reason code indicating the reason for Returns. For example, the
item(s) could be in good condition, damaged, broken, etc. These codes are linked to a
specific locating rule that the system can locate product differently based on its disposition
code. At this time, SCALE performs locating. The work unit of the putaway work will be
the LPN value.
The LPNs will be putaway to the designated Returns area with appropriate inventory
status awaiting the communication on further action. The inventory will be shipped for
destruction upon approval from Knipper’s customer.
8.4 Blind Receiving
Blind receiving is used for receiving when there is no ASN receipt exists. The operator will
create a receipt using the RF on the fly and add line items to the receipt.
The receiving preference is configured in SCALE as below:
• Create Putaway Work: Yes
• Nest During Check In: No
• Disposition Code Required: No
• License Plate Assignment: System
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 28 of 119						
```

<a id="p029-b001"></a>
## p029\-b001 — PDF page 29, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p029-b002"></a>
## p029\-b002 — PDF page 29, block 2

```text
 

```

<a id="p029-b003"></a>
## p029\-b003 — PDF page 29, block 3

```text
• 
RF Workflow: Blind  
• 
Execution Method: Check in and Locate (immediate) 
• 
Container Locating Method: Parent 
• 
Default Inventory Status – QC Hold/Client Hold 
 
The user selects Receiving option from Warehouse Mobile Main Menu. User selects the 
Blind Receiving option.  
 
Once selected, the user enters:  

```

<a id="p029-b004"></a>
## p029\-b004 — PDF page 29, block 4

```text
Commented [SM120]: Need to locate at line level 

```

<a id="p029-b005"></a>
## p029\-b005 — PDF page 29, block 5

```text
Commented [NC121R120]: MAH to confirm if this can 
done. 

```

<a id="p029-b006"></a>
## p029\-b006 — PDF page 29, block 6

```text
Commented [RS122R120]: The locate is always at the 
LPN level even though same rule can be assigned to a 
line. 

```

<a id="p029-b007"></a>
## p029\-b007 — PDF page 29, block 7

```text
• 
Receipt ID 
• 
Item code on the product 
• 
Quantity (Key in) in the applicable UoM. The lowest UoM will be always 
defaulted, and the user selects the UoM to receive. 
 
After assigning a system-generated license plate number, the user either scans the Lot or 
keys in (if no barcode).If the Item is Serial Number Tracked for Inbound, the user will scan 
the serial number from the barcode on the product or keys in (if no barcode). 
 
At this time, SCALE locates the LPN and putaway work is created and receipt Container 
Label (LBL01) is printed. The label is applied at the front bottom case of the pallet. SCALE 
determines a putaway location based on the locating rule assigned during the Check-In 
process. 
 
The system-generated label (LBL01) has flowing key information on it and is the same 
label currently used. 

```

<a id="p029-b008"></a>
## p029\-b008 — PDF page 29, block 8

```text
Commented [NC123R120]: NC12022024: this is 
resolved 

```

<a id="p029-b009"></a>
## p029\-b009 — PDF page 29, block 9

```text
• 
License Plate # 
• 
SKU (Item) 
• 
Locating location 
• 
Lot  
• 
Expiration Date 
 
Note: Knipper uses a customized LPN label and same will be ported over to SCALE 
Active. 
 
The user continues to receive the next item for the same receipt or exit the current receipt 
and start over with a new blind receipt ID. Exiting a receipt on the Warehouse Mobile does 
NOT close that receipt. Users can go back to that receipt at any point in time.     
 

```

<a id="p029-b010"></a>
## p029\-b010 — PDF page 29, block 10

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 29 of 119 
 

```

<a id="p029-t001"></a>
## p029\-t001 — PDF page 29, detected table 1

```text
					MENT
Commented [SM120]: Need to locate at line level
Commented [NC121R120]: MAH to confirm if this can
done.
Commented [RS122R120]: The locate is always at the
LPN level even though same rule can be assigned to a
line.
Commented [NC123R120]: NC12022024: this is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• RF Workflow: Blind
• Execution Method: Check in and Locate (immediate)
• Container Locating Method: Parent
• Default Inventory Status – QC Hold/Client Hold
The user selects Receiving option from Warehouse Mobile Main Menu. User selects the
Blind Receiving option.
Once selected, the user enters:
• Receipt ID
• Item code on the product
• Quantity (Key in) in the applicable UoM. The lowest UoM will be always
defaulted, and the user selects the UoM to receive.
After assigning a system-generated license plate number, the user either scans the Lot or
keys in (if no barcode).If the Item is Serial Number Tracked for Inbound, the user will scan
the serial number from the barcode on the product or keys in (if no barcode).
At this time, SCALE locates the LPN and putaway work is created and receipt Container
Label (LBL01) is printed. The label is applied at the front bottom case of the pallet. SCALE
determines a putaway location based on the locating rule assigned during the Check-In
process.
The system-generated label (LBL01) has flowing key information on it and is the same
label currently used.
• License Plate #
• SKU (Item)
• Locating location
• Lot
• Expiration Date
Note: Knipper uses a customized LPN label and same will be ported over to SCALE
Active.
The user continues to receive the next item for the same receipt or exit the current receipt
and start over with a new blind receipt ID. Exiting a receipt on the Warehouse Mobile does
NOT close that receipt. Users can go back to that receipt at any point in time.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 29 of 119						
```

<a id="p030-b001"></a>
## p030\-b001 — PDF page 30, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p030-b002"></a>
## p030\-b002 — PDF page 30, block 2

```text
 

```

<a id="p030-b003"></a>
## p030\-b003 — PDF page 30, block 3

```text
 
 
 

```

<a id="p030-b004"></a>
## p030\-b004 — PDF page 30, block 4

```text
 
                                                                 Figure: Blind Receiving flow 
 
8.5 
Disposition Codes 
 
Knipper uses disposition codes for damages and returns primarily. There are multiple 
overlapping disposition codes setup by site. Knipper will revisit them during the build 
phase for cleanup.  
 

```

<a id="p030-b005"></a>
## p030\-b005 — PDF page 30, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 30 of 119 
 

```

<a id="p030-t001"></a>
## p030\-t001 — PDF page 30, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Blind Receiving flow
8.5 Disposition Codes
Knipper uses disposition codes for damages and returns primarily. There are multiple
overlapping disposition codes setup by site. Knipper will revisit them during the build
phase for cleanup.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 30 of 119						
```

<a id="p031-b001"></a>
## p031\-b001 — PDF page 31, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p031-b002"></a>
## p031\-b002 — PDF page 31, block 2

```text
 

```

<a id="p031-b003"></a>
## p031\-b003 — PDF page 31, block 3

```text
 
Figure – Disposition codes 
 
8.6 
Verify Receipts 
 
For receipts where all receipt details are received complete, SCALE automatically closes 
the receipt upon the putaway of the last LPN. If all detail lines were not received completely 
(such as with a short ship), the receipt must be closed manually.  To close a receipt 
manually, a user selects the receipt that is completed and uses the Close Receipt action 
from the Receipt Insight.  Upon confirmation of the close, SCALE updates the receipt 
status to Closed and does not allow additional products to be received. 
 
 
Note: A closed receipt can be re-opened in SCALE to allow additional receiving 
 

```

<a id="p031-b004"></a>
## p031\-b004 — PDF page 31, block 4

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 31 of 119 
 

```

<a id="p031-t001"></a>
## p031\-t001 — PDF page 31, detected table 1

```text
				MENT	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
Figure – Disposition codes
8.6 Verify Receipts
For receipts where all receipt details are received complete, SCALE automatically closes
the receipt upon the putaway of the last LPN. If all detail lines were not received completely
(such as with a short ship), the receipt must be closed manually. To close a receipt
manually, a user selects the receipt that is completed and uses the Close Receipt action
from the Receipt Insight. Upon confirmation of the close, SCALE updates the receipt
status to Closed and does not allow additional products to be received.
Note: A closed receipt can be re-opened in SCALE to allow additional receiving
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 31 of 119					
```

<a id="p032-b001"></a>
## p032\-b001 — PDF page 32, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p032-b002"></a>
## p032\-b002 — PDF page 32, block 2

```text
 

```

<a id="p032-b003"></a>
## p032\-b003 — PDF page 32, block 3

```text
 
Figure – Receipt Insight – close receipt 

```

<a id="p032-b004"></a>
## p032\-b004 — PDF page 32, block 4

```text
 
 
9.0 
EXCEPTIONS 
 

```

<a id="p032-b005"></a>
## p032\-b005 — PDF page 32, block 5

```text
9.1 
Items missing weight or dimensions (New Items) 
 

```

<a id="p032-b006"></a>
## p032\-b006 — PDF page 32, block 6

```text
Commented [SM124]: PL#26 
 

```

<a id="p032-b007"></a>
## p032\-b007 — PDF page 32, block 7

```text
Commented [NC125R124]: MAH to confirm 

```

<a id="p032-b008"></a>
## p032\-b008 — PDF page 32, block 8

```text
Knipper captures the dimensions for the new items using the Cubiscan which is updated 
manually in SCALE by the operations team.  
 
9.2 
Overages 
 

```

<a id="p032-b009"></a>
## p032\-b009 — PDF page 32, block 9

```text
Commented [RS126R124]: Please elaborate on 
PL#26 

```

<a id="p032-b010"></a>
## p032\-b010 — PDF page 32, block 10

```text
Commented [RS127R124]: This is currently being 
reviewed for HLE. A detailed design document will b 
created if Knipper would like to go ahead with the 
Integration. 

```

<a id="p032-b011"></a>
## p032\-b011 — PDF page 32, block 11

```text
Commented [NC128R124]: NC12022024: this is 
resolved. 

```

<a id="p032-b012"></a>
## p032\-b012 — PDF page 32, block 12

```text
Knipper does not over receive. If during unloading the truck, the user determines the 
inventory unloaded is more than the Receipt line quantity, then the receiving user reaches 
out to receiving supervisor. A new PO/Receipt is generated by the Host-based on the 
request from operations to receive the additional items into SCALE. The receiving team 
manually moves this product away from the receiving dock to avoid any obstruction until 
the new Receipt is available.  
 
Config Note: Receiving Preferences will have ‘Allow over receiving’ disabled.  
 
9.3 
Shortages 

```

<a id="p032-b013"></a>
## p032\-b013 — PDF page 32, block 13

```text
 
When a receipt is not received in full, the user must manually close it, if the rest of the 
balance is no longer expected.  
 

```

<a id="p032-b014"></a>
## p032\-b014 — PDF page 32, block 14

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 32 of 119 
 

```

<a id="p032-t001"></a>
## p032\-t001 — PDF page 32, detected table 1

```text
					MENT
Commented [SM124]: PL#26
Commented [NC125R124]: MAH to confirm
Commented [RS126R124]: Please elaborate on
PL#26
Commented [RS127R124]: This is currently being
reviewed for HLE. A detailed design document will b
created if Knipper would like to go ahead with the
Integration.
Commented [NC128R124]: NC12022024: this is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Receipt Insight – close receipt
9.0 EXCEPTIONS
9.1 Items missing weight or dimensions (New Items)
Knipper captures the dimensions for the new items using the Cubiscan which is updated
manually in SCALE by the operations team.
9.2 Overages
Knipper does not over receive. If during unloading the truck, the user determines the
inventory unloaded is more than the Receipt line quantity, then the receiving user reaches
out to receiving supervisor. A new PO/Receipt is generated by the Host-based on the
request from operations to receive the additional items into SCALE. The receiving team
manually moves this product away from the receiving dock to avoid any obstruction until
the new Receipt is available.
Config Note: Receiving Preferences will have ‘Allow over receiving’ disabled.
9.3 Shortages
When a receipt is not received in full, the user must manually close it, if the rest of the
balance is no longer expected.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 32 of 119						
```

<a id="p033-b001"></a>
## p033\-b001 — PDF page 33, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p033-b002"></a>
## p033\-b002 — PDF page 33, block 2

```text
 

```

<a id="p033-b003"></a>
## p033\-b003 — PDF page 33, block 3

```text
 
 

```

<a id="p033-b004"></a>
## p033\-b004 — PDF page 33, block 4

```text
Figure – Closing receipt Shortages.  

```

<a id="p033-b005"></a>
## p033\-b005 — PDF page 33, block 5

```text
 
 
9.4 
Receipt not in SCALE  
 

```

<a id="p033-b006"></a>
## p033\-b006 — PDF page 33, block 6

```text
In this case, the product is delivered by a carrier for a receipt that is not in SCALE. The 
warehouse cannot Check-In the product without the receipt information in SCALE. The 
Operations team will work with the appropriate team members (IT/Client account 
Representative) to create the Receipts.  
 
 

```

<a id="p033-b007"></a>
## p033\-b007 — PDF page 33, block 7

```text
9.5 
Unknown Product  
 

```

<a id="p033-b008"></a>
## p033\-b008 — PDF page 33, block 8

```text
When an item is available on the trailer but exists neither on the receipt nor the item 
master, it is called an Unknown Product. The check in clerk informs the supervisor, who 
coordinates with the supplier team. Knipper manually moves this product away from the 
receiving dock to avoid any obstruction. The supervisor coordinates with the procurement 
team and/or vendor, an item master is interfaced with this item if it must be received. A 
new receipt is then created in the host for this known (unknown before item master 
download) product and interfaced into SCALE.  
 
9.6 
Damages 
 

```

<a id="p033-b009"></a>
## p033\-b009 — PDF page 33, block 9

```text
Damaged goods are received under the Damage Preference. The inventory received is 
put in a Held Inventory Status (Damage Hold) based on the disposition code entered by 
user and assigned a Locating Rule to direct the product to a damaged area. 
 

```

<a id="p033-b010"></a>
## p033\-b010 — PDF page 33, block 10

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 33 of 119 
 

```

<a id="p033-t001"></a>
## p033\-t001 — PDF page 33, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Closing receipt Shortages.
9.4 Receipt not in SCALE
In this case, the product is delivered by a carrier for a receipt that is not in SCALE. The
warehouse cannot Check-In the product without the receipt information in SCALE. The
Operations team will work with the appropriate team members (IT/Client account
Representative) to create the Receipts.
9.5 Unknown Product
When an item is available on the trailer but exists neither on the receipt nor the item
master, it is called an Unknown Product. The check in clerk informs the supervisor, who
coordinates with the supplier team. Knipper manually moves this product away from the
receiving dock to avoid any obstruction. The supervisor coordinates with the procurement
team and/or vendor, an item master is interfaced with this item if it must be received. A
new receipt is then created in the host for this known (unknown before item master
download) product and interfaced into SCALE.
9.6 Damages
Damaged goods are received under the Damage Preference. The inventory received is
put in a Held Inventory Status (Damage Hold) based on the disposition code entered by
user and assigned a Locating Rule to direct the product to a damaged area.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 33 of 119						
```

<a id="p034-b001"></a>
## p034\-b001 — PDF page 34, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p034-b002"></a>
## p034\-b002 — PDF page 34, block 2

```text
 

```

<a id="p034-b003"></a>
## p034\-b003 — PDF page 34, block 3

```text
Note: Knipper configures a virtual multi-item and license plate tracked location called 
Supervisor/Error Location to handle locating exceptions. This is used to troubleshoot these 
exceptions. 
 
 
9.7 
Manually Closing the receipt 
 

```

<a id="p034-b004"></a>
## p034\-b004 — PDF page 34, block 4

```text
If a receipt is manually closed in Host, in receiving interface updates the receipt header 
with the closed date time field. No changes will be done at the receipt detail level. 
 

```

<a id="p034-b005"></a>
## p034\-b005 — PDF page 34, block 5

```text
 
Figure – Closing receipt Shortages 

```

<a id="p034-b006"></a>
## p034\-b006 — PDF page 34, block 6

```text
 
 

```

<a id="p034-b007"></a>
## p034\-b007 — PDF page 34, block 7

```text
9.8 
Using Receipt Workbench for troubleshooting 
 
Receiving supervisors may use Receipt Workbench for troubleshooting exceptions like 
locating failure as well receiving in some exception scenarios.  
 
Commented [SM129]: Receiving via workbench is 
in scope for exception process, such as multi lot 
issue. 

```

<a id="p034-b008"></a>
## p034\-b008 — PDF page 34, block 8

```text
Commented [NC130R129]: MAH to remove out of 
scope and is in scope because there will be exceptions  

```

<a id="p034-b009"></a>
## p034\-b009 — PDF page 34, block 9

```text
Commented [RS131R129]: Just removed the section 
to avoid the confusion 

```

<a id="p034-b010"></a>
## p034\-b010 — PDF page 34, block 10

```text
Commented [NC132R129]: NC12022024: this is 
resolved. 

```

<a id="p034-b011"></a>
## p034\-b011 — PDF page 34, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 34 of 119 
 

```

<a id="p034-t001"></a>
## p034\-t001 — PDF page 34, detected table 1

```text
					MENT
Commented [SM129]: Receiving via workbench is
in scope for exception process, such as multi lot
issue.
Commented [NC130R129]: MAH to remove out of
scope and is in scope because there will be exceptions
Commented [RS131R129]: Just removed the section
to avoid the confusion
Commented [NC132R129]: NC12022024: this is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Note: Knipper configures a virtual multi-item and license plate tracked location called
Supervisor/Error Location to handle locating exceptions. This is used to troubleshoot these
exceptions.
9.7 Manually Closing the receipt
If a receipt is manually closed in Host, in receiving interface updates the receipt header
with the closed date time field. No changes will be done at the receipt detail level.
Figure – Closing receipt Shortages
9.8 Using Receipt Workbench for troubleshooting
Receiving supervisors may use Receipt Workbench for troubleshooting exceptions like
locating failure as well receiving in some exception scenarios.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 34 of 119						
```

<a id="p035-b001"></a>
## p035\-b001 — PDF page 35, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p035-b002"></a>
## p035\-b002 — PDF page 35, block 2

```text
 

```

<a id="p035-b003"></a>
## p035\-b003 — PDF page 35, block 3

```text
 
10.0 PUTAWAY 
 

```

<a id="p035-b004"></a>
## p035\-b004 — PDF page 35, block 4

```text
Put away involves executing the task to move the inventory to the system-directed location 
from the receiving dock. 
 
Locating takes each receipt container from the Check-In process and tries to find a place 
in the warehouse to store the product. Locating Rules are based on a series of sequences 
that use a combination of strategy and Location selection to try and find the right place in 
inventory for the item. If the system locates the receipt container to a location, work is 
created to move the product from the Receiving Dock to the destination location in the 
warehouse for all receipts.  
 

```

<a id="p035-b005"></a>
## p035\-b005 — PDF page 35, block 5

```text
Commented [SM133]: What is the Supervisor 
Location? 

```

<a id="p035-b006"></a>
## p035\-b006 — PDF page 35, block 6

```text
Commented [NC134R133]: MAH to confirm 

```

<a id="p035-b007"></a>
## p035\-b007 — PDF page 35, block 7

```text
Knipper uses a manual SOP to troubleshoot if a container is located to the ‘Supervisor 
Location’. Transaction history and process history can be leveraged to review the locating 
rule sequences to determine the root cause. Knipper cancels the check-in (if not uploaded) 
for this container and check in after making the needed corrections. 
 

```

<a id="p035-b008"></a>
## p035\-b008 — PDF page 35, block 8

```text
10.1 
Locating Rules 
 

```

<a id="p035-b009"></a>
## p035\-b009 — PDF page 35, block 9

```text
Commented [RS135R133]: It is the ERROR location 
currently used by Knipper. If for some reason, SCALE 
cannot find a location for an LPN, it is the last resort to 
avoid the process to fail. 

```

<a id="p035-b010"></a>
## p035\-b010 — PDF page 35, block 10

```text
Commented [NC136R133]: NC12022024: This is 
resolved 

```

<a id="p035-b011"></a>
## p035\-b011 — PDF page 35, block 11

```text
Commented [SM137]: Why would you cancel check 
in, if putaway had the issue?  That is downstream of 
check in, correct? 

```

<a id="p035-b012"></a>
## p035\-b012 — PDF page 35, block 12

```text
Once inventory has been checked in to SCALE, a putaway location is found using locating 
rules. Knipper would like to use item’s categories to determine the locating rule. 
 
To allow for easy addition of new items and locating rules, the locating rule is assigned on 
the Receipt Detail using the Locating Rule Assignment configuration. Knipper can still 
manually set the locating rule after the Receipt Detail is downloaded by opening the receipt 
line and selecting a different locating rule. 

```

<a id="p035-b013"></a>
## p035\-b013 — PDF page 35, block 13

```text
Commented [NC138R137]: MAH to confirm 

```

<a id="p035-b014"></a>
## p035\-b014 — PDF page 35, block 14

```text
Commented [RS139R137]: This is not talking about 
issues with Putaway rather correcting the destination 
location before the Putaway is being executed. 

```

<a id="p035-b015"></a>
## p035\-b015 — PDF page 35, block 15

```text
Commented [NC140R137]: NC12022024: this is 
resolved. 

```

<a id="p035-b016"></a>
## p035\-b016 — PDF page 35, block 16

```text
To allow for easy addition of new items and locating rules, the locating rule is assigned on 
the Receipt Detail using the Locating Rule Assignment configuration. 
 
Configuration Note: The Receiving System Value Locating Rule Assignment During is 
set to Receipt Check-In. 
 
 

```

<a id="p035-b017"></a>
## p035\-b017 — PDF page 35, block 17

```text
 
Locating Zone 
Description 
1 
L-DEA Reserve 
• 
Single Item 
• 
LPN Tracked 
• 
Max Lot = 1 
3 
L-DEA-Returns 
• 
Multi Item 
• 
LPN Tracked 
• 
Max Lot = 0 
4 
L-Refrigerated 
• 
Single Item 
• 
LPN Tracked 
• 
Max Lot = 1 
5 
L-OHW-Reserve 
• 
Single Item 

```

<a id="p035-b018"></a>
## p035\-b018 — PDF page 35, block 18

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 35 of 119 
 

```

<a id="p035-t001"></a>
## p035\-t001 — PDF page 35, detected table 1

```text
				MENT
Commented [SM133]: What is the Supervisor
Location?
Commented [NC134R133]: MAH to confirm
Commented [RS135R133]: It is the ERROR location
currently used by Knipper. If for some reason, SCALE
cannot find a location for an LPN, it is the last resort to
avoid the process to fail.
Commented [NC136R133]: NC12022024: This is
resolved
Commented [SM137]: Why would you cancel check
in, if putaway had the issue? That is downstream of
check in, correct?
Commented [NC138R137]: MAH to confirm
Commented [RS139R137]: This is not talking about
issues with Putaway rather correcting the destination
location before the Putaway is being executed.
Commented [NC140R137]: NC12022024: this is
resolved.	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
10.0 PUTAWAY
Put away involves executing the task to move the inventory to the system-directed location
from the receiving dock.
Locating takes each receipt container from the Check-In process and tries to find a place
in the warehouse to store the product. Locating Rules are based on a series of sequences
that use a combination of strategy and Location selection to try and find the right place in
inventory for the item. If the system locates the receipt container to a location, work is
created to move the product from the Receiving Dock to the destination location in the
warehouse for all receipts.
Knipper uses a manual SOP to troubleshoot if a container is located to the ‘Supervisor
Location’. Transaction history and process history can be leveraged to review the locating
rule sequences to determine the root cause. Knipper cancels the check-in (if not uploaded)
for this container and check in after making the needed corrections.
10.1 Locating Rules
Once inventory has been checked in to SCALE, a putaway location is found using locating
rules. Knipper would like to use item’s categories to determine the locating rule.
To allow for easy addition of new items and locating rules, the locating rule is assigned on
the Receipt Detail using the Locating Rule Assignment configuration. Knipper can still
manually set the locating rule after the Receipt Detail is downloaded by opening the receipt
line and selecting a different locating rule.
To allow for easy addition of new items and locating rules, the locating rule is assigned on
the Receipt Detail using the Locating Rule Assignment configuration.
Configuration Note: The Receiving System Value Locating Rule Assignment During is
set to Receipt Check-In.
Locating Zone Description
1 L-DEA Reserve • Single Item
• LPN Tracked
• Max Lot = 1
3 L-DEA-Returns • Multi Item
• LPN Tracked
• Max Lot = 0
4 L-Refrigerated • Single Item
• LPN Tracked
• Max Lot = 1
5 L-OHW-Reserve • Single Item
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 35 of 119					
```

<a id="p035-t002"></a>
## p035\-t002 — PDF page 35, detected table 2

```text
			Locating Zone			Description	
1		L-DEA Reserve			• Single Item
• LPN Tracked
• Max Lot = 1		
3		L-DEA-Returns			• Multi Item
• LPN Tracked
• Max Lot = 0		
4		L-Refrigerated			• Single Item
• LPN Tracked
• Max Lot = 1		
5		L-OHW-Reserve			• Single Item		
```

<a id="p036-b001"></a>
## p036\-b001 — PDF page 36, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p036-b002"></a>
## p036\-b002 — PDF page 36, block 2

```text
 

```

<a id="p036-b003"></a>
## p036\-b003 — PDF page 36, block 3

```text
• 
LPN Tracked 
• 
Max Lot = 1 
6 
L-KMW-Reserve 
• 
Single Item 
• 
LPN Tracked 
• 
Max Lot = 1 
7 
L-Freezer 
• 
Single Item 
• 
LPN Tracked 
• 
Max Lot = 1 
9 
L-3PL-Reserve 
• 
Single Item 
• 
LPN Tracked 
• 
Max Lot = 1 
8 
L-Damaged 
• 
Multi Item 
• 
LPN Tracked 
• 
Max Lot = 0 
10 L-KMW-Returns 
• 
Multi Item 
• 
LPN Tracked 
• 
Max Lot = 0 
11 L-OHW-Returns 
• 
Multi Item 
• 
LPN Tracked 
• 
Max Lot = 0 
12 L-See-Supervisor 
• 
Multi Item 
• 
LPN Tracked 
• 
Max Lot = 0 
 

```

<a id="p036-b004"></a>
## p036\-b004 — PDF page 36, block 4

```text
Note: The locating zone listed above is a sample. Knipper will be configuring/porting 
many more additional locating zones created per building and some customer specific.  
 
Locating Sequence for Item with item category2 = Refrigerated: 
 

```

<a id="p036-b005"></a>
## p036\-b005 — PDF page 36, block 5

```text
L-Refrigerated 
No 

```

<a id="p036-b006"></a>
## p036\-b006 — PDF page 36, block 6

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate - Exclude differing 
lots 

```

<a id="p036-b007"></a>
## p036\-b007 — PDF page 36, block 7

```text
L-See-Supervisor 
No 

```

<a id="p036-b008"></a>
## p036\-b008 — PDF page 36, block 8

```text
20 
Empty Location 
L-Refrigerated 
No 
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p036-b009"></a>
## p036\-b009 — PDF page 36, block 9

```text
 

```

<a id="p036-b010"></a>
## p036\-b010 — PDF page 36, block 10

```text
Locating Sequence for Item with item category2 = DEA Controlled: 
 

```

<a id="p036-b011"></a>
## p036\-b011 — PDF page 36, block 11

```text
L-DEA Reserve 
No 

```

<a id="p036-b012"></a>
## p036\-b012 — PDF page 36, block 12

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate - Exclude differing 
lots 

```

<a id="p036-b013"></a>
## p036\-b013 — PDF page 36, block 13

```text
20 
Empty Location 
L-DEA-Reserve 
No 

```

<a id="p036-b014"></a>
## p036\-b014 — PDF page 36, block 14

```text
 

```

<a id="p036-b015"></a>
## p036\-b015 — PDF page 36, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 36 of 119 
 

```

<a id="p036-t001"></a>
## p036\-t001 — PDF page 36, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• LPN Tracked
• Max Lot = 1
6 L-KMW-Reserve • Single Item
• LPN Tracked
• Max Lot = 1
7 L-Freezer • Single Item
• LPN Tracked
• Max Lot = 1
9 L-3PL-Reserve • Single Item
• LPN Tracked
• Max Lot = 1
8 L-Damaged • Multi Item
• LPN Tracked
• Max Lot = 0
10 L-KMW-Returns • Multi Item
• LPN Tracked
• Max Lot = 0
11 L-OHW-Returns • Multi Item
• LPN Tracked
• Max Lot = 0
12 L-See-Supervisor • Multi Item
• LPN Tracked
• Max Lot = 0
Note: The locating zone listed above is a sample. Knipper will be configuring/porting
many more additional locating zones created per building and some customer specific.
Locating Sequence for Item with item category2 = Refrigerated:
Sequence Strategy Location Selection Split Quantity
10 Consolidate - Exclude differing L-Refrigerated No
lots
20 Empty Location L-Refrigerated No
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Item with item category2 = DEA Controlled:
Sequence Strategy Location Selection Split Quantity
10 Consolidate - Exclude differing L-DEA Reserve No
lots
20 Empty Location L-DEA-Reserve No
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 36 of 119						
```

<a id="p036-t002"></a>
## p036\-t002 — PDF page 36, detected table 2

```text
		• LPN Tracked
• Max Lot = 1
6	L-KMW-Reserve	• Single Item
• LPN Tracked
• Max Lot = 1
7	L-Freezer	• Single Item
• LPN Tracked
• Max Lot = 1
9	L-3PL-Reserve	• Single Item
• LPN Tracked
• Max Lot = 1
8	L-Damaged	• Multi Item
• LPN Tracked
• Max Lot = 0
10	L-KMW-Returns	• Multi Item
• LPN Tracked
• Max Lot = 0
11	L-OHW-Returns	• Multi Item
• LPN Tracked
• Max Lot = 0
12	L-See-Supervisor	• Multi Item
• LPN Tracked
• Max Lot = 0
```

<a id="p036-t003"></a>
## p036\-t003 — PDF page 36, detected table 3

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate - Exclude differing
lots			L-Refrigerated			No		
20			Empty Location			L-Refrigerated			No		
30			Use specific (multi-item)
location regardless of status			L-See-Supervisor			No		
```

<a id="p036-t004"></a>
## p036\-t004 — PDF page 36, detected table 4

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate - Exclude differing
lots			L-DEA Reserve			No		
20			Empty Location			L-DEA-Reserve			No		
```

<a id="p037-b001"></a>
## p037\-b001 — PDF page 37, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p037-b002"></a>
## p037\-b002 — PDF page 37, block 2

```text
 

```

<a id="p037-b003"></a>
## p037\-b003 — PDF page 37, block 3

```text
L-See-Supervisor 
No 

```

<a id="p037-b004"></a>
## p037\-b004 — PDF page 37, block 4

```text
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p037-b005"></a>
## p037\-b005 — PDF page 37, block 5

```text
 

```

<a id="p037-b006"></a>
## p037\-b006 — PDF page 37, block 6

```text
Locating Sequence for Item with item category2 = General: 
 

```

<a id="p037-b007"></a>
## p037\-b007 — PDF page 37, block 7

```text
No 

```

<a id="p037-b008"></a>
## p037\-b008 — PDF page 37, block 8

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate - Exclude differing 
lots 

```

<a id="p037-b009"></a>
## p037\-b009 — PDF page 37, block 9

```text
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p037-b010"></a>
## p037\-b010 — PDF page 37, block 10

```text
No 

```

<a id="p037-b011"></a>
## p037\-b011 — PDF page 37, block 11

```text
20 
Empty Location 
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p037-b012"></a>
## p037\-b012 — PDF page 37, block 12

```text
L-See-Supervisor 
No 

```

<a id="p037-b013"></a>
## p037\-b013 — PDF page 37, block 13

```text
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p037-b014"></a>
## p037\-b014 — PDF page 37, block 14

```text
 

```

<a id="p037-b015"></a>
## p037\-b015 — PDF page 37, block 15

```text
Locating Sequence for Item with item category2 = Freezer: 
 

```

<a id="p037-b016"></a>
## p037\-b016 — PDF page 37, block 16

```text
L-Freezer 
No 

```

<a id="p037-b017"></a>
## p037\-b017 — PDF page 37, block 17

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate - Exclude differing 
lots 

```

<a id="p037-b018"></a>
## p037\-b018 — PDF page 37, block 18

```text
L-See-Supervisor 
No 

```

<a id="p037-b019"></a>
## p037\-b019 — PDF page 37, block 19

```text
20 
Empty Location 
L-Freezer 
No 
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p037-b020"></a>
## p037\-b020 — PDF page 37, block 20

```text
 
 
 
 

```

<a id="p037-b021"></a>
## p037\-b021 — PDF page 37, block 21

```text
Locating Sequence for Item with item category2 = General and Item category8 = 
Literature: 
 

```

<a id="p037-b022"></a>
## p037\-b022 — PDF page 37, block 22

```text
No 

```

<a id="p037-b023"></a>
## p037\-b023 — PDF page 37, block 23

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate to location that 
already contains the item 

```

<a id="p037-b024"></a>
## p037\-b024 — PDF page 37, block 24

```text
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p037-b025"></a>
## p037\-b025 — PDF page 37, block 25

```text
No 

```

<a id="p037-b026"></a>
## p037\-b026 — PDF page 37, block 26

```text
20 
Empty Location 
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p037-b027"></a>
## p037\-b027 — PDF page 37, block 27

```text
L-See-Supervisor 
No 

```

<a id="p037-b028"></a>
## p037\-b028 — PDF page 37, block 28

```text
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p037-b029"></a>
## p037\-b029 — PDF page 37, block 29

```text
 
 

```

<a id="p037-b030"></a>
## p037\-b030 — PDF page 37, block 30

```text
Locating Sequence for Item with item category2 = General and Item category8 = Medical 
Devices: 
 

```

<a id="p037-b031"></a>
## p037\-b031 — PDF page 37, block 31

```text
No 

```

<a id="p037-b032"></a>
## p037\-b032 — PDF page 37, block 32

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Consolidate to location that 
already contains the item 

```

<a id="p037-b033"></a>
## p037\-b033 — PDF page 37, block 33

```text
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p037-b034"></a>
## p037\-b034 — PDF page 37, block 34

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 37 of 119 
 

```

<a id="p037-t001"></a>
## p037\-t001 — PDF page 37, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Item with item category2 = General:
Sequence Strategy Location Selection Split Quantity
10 Consolidate - Exclude differing L-KMW-Reserve/ L- No
lots OHW-Reserve
20 Empty Location L-KMW-Reserve/ L- No
OHW-Reserve
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Item with item category2 = Freezer:
Sequence Strategy Location Selection Split Quantity
10 Consolidate - Exclude differing L-Freezer No
lots
20 Empty Location L-Freezer No
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Item with item category2 = General and Item category8 =
Literature:
Sequence Strategy Location Selection Split Quantity
10 Consolidate to location that L-KMW-Reserve/ L- No
already contains the item OHW-Reserve
20 Empty Location L-KMW-Reserve/ L- No
OHW-Reserve
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Item with item category2 = General and Item category8 = Medical
Devices:
Sequence Strategy Location Selection Split Quantity
10 Consolidate to location that L-KMW-Reserve/ L- No
already contains the item OHW-Reserve
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 37 of 119						
```

<a id="p037-t002"></a>
## p037\-t002 — PDF page 37, detected table 2

```text
30	Use specific (multi-item)
location regardless of status	L-See-Supervisor	No
```

<a id="p037-t003"></a>
## p037\-t003 — PDF page 37, detected table 3

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate - Exclude differing
lots			L-KMW-Reserve/ L-
OHW-Reserve			No		
20			Empty Location			L-KMW-Reserve/ L-
OHW-Reserve			No		
30			Use specific (multi-item)
location regardless of status			L-See-Supervisor			No		
```

<a id="p037-t004"></a>
## p037\-t004 — PDF page 37, detected table 4

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate - Exclude differing
lots			L-Freezer			No		
20			Empty Location			L-Freezer			No		
30			Use specific (multi-item)
location regardless of status			L-See-Supervisor			No		
```

<a id="p037-t005"></a>
## p037\-t005 — PDF page 37, detected table 5

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate to location that
already contains the item			L-KMW-Reserve/ L-
OHW-Reserve			No		
20			Empty Location			L-KMW-Reserve/ L-
OHW-Reserve			No		
30			Use specific (multi-item)
location regardless of status			L-See-Supervisor			No		
```

<a id="p037-t006"></a>
## p037\-t006 — PDF page 37, detected table 6

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Consolidate to location that
already contains the item			L-KMW-Reserve/ L-
OHW-Reserve			No		
```

<a id="p038-b001"></a>
## p038\-b001 — PDF page 38, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p038-b002"></a>
## p038\-b002 — PDF page 38, block 2

```text
 

```

<a id="p038-b003"></a>
## p038\-b003 — PDF page 38, block 3

```text
No 

```

<a id="p038-b004"></a>
## p038\-b004 — PDF page 38, block 4

```text
20 
Empty Location 
L-KMW-Reserve/ L-
OHW-Reserve 

```

<a id="p038-b005"></a>
## p038\-b005 — PDF page 38, block 5

```text
L-See-Supervisor 
No 

```

<a id="p038-b006"></a>
## p038\-b006 — PDF page 38, block 6

```text
30 
Use specific (multi-item) 
location regardless of status 

```

<a id="p038-b007"></a>
## p038\-b007 — PDF page 38, block 7

```text
 

```

<a id="p038-b008"></a>
## p038\-b008 — PDF page 38, block 8

```text
Locating Sequence for Damaged Item 
 

```

<a id="p038-b009"></a>
## p038\-b009 — PDF page 38, block 9

```text
L-Damaged 
No 

```

<a id="p038-b010"></a>
## p038\-b010 — PDF page 38, block 10

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Use specific (multi-item) 
location regardless of status 

```

<a id="p038-b011"></a>
## p038\-b011 — PDF page 38, block 11

```text
 

```

<a id="p038-b012"></a>
## p038\-b012 — PDF page 38, block 12

```text
Locating Sequence for Returns 
 

```

<a id="p038-b013"></a>
## p038\-b013 — PDF page 38, block 13

```text
No 

```

<a id="p038-b014"></a>
## p038\-b014 — PDF page 38, block 14

```text
Sequence 
Strategy 
Location Selection 
Split Quantity 
10 
Use specific (multi-item) 
location regardless of status 

```

<a id="p038-b015"></a>
## p038\-b015 — PDF page 38, block 15

```text
L-KMW-Returns/L-
OHW-Returns 

```

<a id="p038-b016"></a>
## p038\-b016 — PDF page 38, block 16

```text
 

```

<a id="p038-b017"></a>
## p038\-b017 — PDF page 38, block 17

```text
Note: The Locating sequence listed above are few samples. Actual rules configured will 
be more than what has been listed here. 
 
Note: Knipper would like to mass adjust out the inventory from one Item to another to 
capture the Title Transfer. This requirement is handled as an extension in SCALE. 
 
 

```

<a id="p038-b018"></a>
## p038\-b018 — PDF page 38, block 18

```text
10.2 
Putaway Work Creation 
 

```

<a id="p038-b019"></a>
## p038\-b019 — PDF page 38, block 19

```text
Upon receiving and palletization of the items, if necessary, SCALE generates system work 
records for each located Pallet / LPN. The work unit for the putaway work equals the Pallet 
/ LPN ID. This allows the user to scan the Pallet / LPN ID in the Warehouse Mobile Work 
option to initiate the putaway in a user-directed mode. Knipper creates work for Receipt 
Putaway and uses User directed putaway. 
 
10.3 
Putaway Work Execution 
 

```

<a id="p038-b020"></a>
## p038\-b020 — PDF page 38, block 20

```text
To initiate putaway work, Knipper utilizes the option Work on warehouse mobile.  A user 
enters the number associated with the Putaway Work Profile selection or selects it from 
the menu options.  Upon selection, SCALE prompts the user to enter a work unit, which 
in this scenario is the LPN (Pallet having cases on it). The work profile is set to be User 
Directed.  
 
Upon scanning the LPN barcode on the pallet, SCALE assigns the work unit to the user.  
SCALE then displays the current receiving dock location and item information and displays 
the number of units associated with the work unit. Upon confirmation, SCALE updates the 
LPN(s) to status In Putaway and displays the putaway location for the first item.  To 

```

<a id="p038-b021"></a>
## p038\-b021 — PDF page 38, block 21

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 38 of 119 
 

```

<a id="p038-t001"></a>
## p038\-t001 — PDF page 38, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20 Empty Location L-KMW-Reserve/ L- No
OHW-Reserve
30 Use specific (multi-item) L-See-Supervisor No
location regardless of status
Locating Sequence for Damaged Item
Sequence Strategy Location Selection Split Quantity
10 Use specific (multi-item) L-Damaged No
location regardless of status
Locating Sequence for Returns
Sequence Strategy Location Selection Split Quantity
10 Use specific (multi-item) L-KMW-Returns/L- No
location regardless of status OHW-Returns
Note: The Locating sequence listed above are few samples. Actual rules configured will
be more than what has been listed here.
Note: Knipper would like to mass adjust out the inventory from one Item to another to
capture the Title Transfer. This requirement is handled as an extension in SCALE.
10.2 Putaway Work Creation
Upon receiving and palletization of the items, if necessary, SCALE generates system work
records for each located Pallet / LPN. The work unit for the putaway work equals the Pallet
/ LPN ID. This allows the user to scan the Pallet / LPN ID in the Warehouse Mobile Work
option to initiate the putaway in a user-directed mode. Knipper creates work for Receipt
Putaway and uses User directed putaway.
10.3 Putaway Work Execution
To initiate putaway work, Knipper utilizes the option Work on warehouse mobile. A user
enters the number associated with the Putaway Work Profile selection or selects it from
the menu options. Upon selection, SCALE prompts the user to enter a work unit, which
in this scenario is the LPN (Pallet having cases on it). The work profile is set to be User
Directed.
Upon scanning the LPN barcode on the pallet, SCALE assigns the work unit to the user.
SCALE then displays the current receiving dock location and item information and displays
the number of units associated with the work unit. Upon confirmation, SCALE updates the
LPN(s) to status In Putaway and displays the putaway location for the first item. To
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 38 of 119						
```

<a id="p038-t002"></a>
## p038\-t002 — PDF page 38, detected table 2

```text
20	Empty Location	L-KMW-Reserve/ L-
OHW-Reserve	No
30	Use specific (multi-item)
location regardless of status	L-See-Supervisor	No
```

<a id="p038-t003"></a>
## p038\-t003 — PDF page 38, detected table 3

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Use specific (multi-item)
location regardless of status			L-Damaged			No		
```

<a id="p038-t004"></a>
## p038\-t004 — PDF page 38, detected table 4

```text
	Sequence			Strategy			Location Selection			Split Quantity	
10			Use specific (multi-item)
location regardless of status			L-KMW-Returns/L-
OHW-Returns			No		
```

<a id="p039-b001"></a>
## p039\-b001 — PDF page 39, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p039-b002"></a>
## p039\-b002 — PDF page 39, block 2

```text
 

```

<a id="p039-b003"></a>
## p039\-b003 — PDF page 39, block 3

```text
complete the step of putaway, the user is prompted to confirm the putaway location.  The 
user scans the location for validation upon putaway. 
 

```

<a id="p039-b004"></a>
## p039\-b004 — PDF page 39, block 4

```text
The user may skip the putaway instruction and proceed to the next item on the work unit 
if multiple work instruction lines exist. This is done by using the Skip button. If the user 
skips the putaway, the system continues directing the user through the putaway locations 
in the location sequence before looping back to put away the skipped items.  

```

<a id="p039-b005"></a>
## p039\-b005 — PDF page 39, block 5

```text
 
Upon putaway to the final inventory location, SCALE updates the LPN to status Closed 
and updates the on-hand quantity at the final putaway location. The closed LPN is then 
eligible to be uploaded to Host as part of the receiving upload interface.  
 

```

<a id="p039-b006"></a>
## p039\-b006 — PDF page 39, block 6

```text
 
Figure– Putaway work execution. 

```

<a id="p039-b007"></a>
## p039\-b007 — PDF page 39, block 7

```text
For DSCSA receiving, the status of the serial number is updated in the custom DSCSA 
serial number table and record Receive event in rTS system through an API. For details, 
refer EX37 - DSCSA inbound processing specification document. 
 
 
               Note: The Inventory status of the LPNs will remain as QA Hold (any status assigned 
during check in process) after the putaway to the inventory location. Once inspection process is 

```

<a id="p039-b008"></a>
## p039\-b008 — PDF page 39, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 39 of 119 
 

```

<a id="p039-t001"></a>
## p039\-t001 — PDF page 39, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
complete the step of putaway, the user is prompted to confirm the putaway location. The
user scans the location for validation upon putaway.
The user may skip the putaway instruction and proceed to the next item on the work unit
if multiple work instruction lines exist. This is done by using the Skip button. If the user
skips the putaway, the system continues directing the user through the putaway locations
in the location sequence before looping back to put away the skipped items.
Upon putaway to the final inventory location, SCALE updates the LPN to status Closed
and updates the on-hand quantity at the final putaway location. The closed LPN is then
eligible to be uploaded to Host as part of the receiving upload interface.
Figure– Putaway work execution.
For DSCSA receiving, the status of the serial number is updated in the custom DSCSA
serial number table and record Receive event in rTS system through an API. For details,
refer EX37 - DSCSA inbound processing specification document.
Note: The Inventory status of the LPNs will remain as QA Hold (any status assigned
during check in process) after the putaway to the inventory location. Once inspection process is
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 39 of 119						
```

<a id="p040-b001"></a>
## p040\-b001 — PDF page 40, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p040-b002"></a>
## p040\-b002 — PDF page 40, block 2

```text
 

```

<a id="p040-b003"></a>
## p040\-b003 — PDF page 40, block 3

```text
completed or based on the results, the status of each LPN will be changed to the new status 
(Available/ HOLD FOR DEST AUTH). 
 

```

<a id="p040-b004"></a>
## p040\-b004 — PDF page 40, block 4

```text
10.4 
Location Override 
 

```

<a id="p040-b005"></a>
## p040\-b005 — PDF page 40, block 5

```text
Location override will be used when required. Over time, Knipper will evaluate this, and 
modify as needed. 
 
Certain users can be granted security to override the system's suggested location for the 
inventory. If this needs to happen, the user picks the Parent LPN from the receiving dock, 
just as with the other work; however, when they are prompted for the Putaway Screen the 
user selects the Location Override option on the screen. 
 
This redirects the user to a screen where they can scan the location name from the 
barcode in which they want to put the product away. The system validates that there is 
nothing else directed to that location and that the location is valid before accepting the 
user’s override. After validation passes, the system updates work, the LPN to note the 
new location, and writes Transaction History noting the change in the putaway location. 
Finally, the user is presented with the Putaway Confirmation screen where they complete 
the Putaway the same as with other work units. 
 
When a user presses the Location Override button on the screen, after a user is redirected 
to the override screen, the user also has the option to click on the Locate button. When 
the Locate button is pressed the user is presented with an option to select a locating rule. 
The system will then decide on a suitable putaway location based on the locating rule.  
 
If a user selects the option to override, SCALE has the option to create an activity-based 
cycle count at the original putaway location.  
 
 

```

<a id="p040-b006"></a>
## p040\-b006 — PDF page 40, block 6

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 40 of 119 
 

```

<a id="p040-t001"></a>
## p040\-t001 — PDF page 40, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
completed or based on the results, the status of each LPN will be changed to the new status
(Available/ HOLD FOR DEST AUTH).
10.4 Location Override
Location override will be used when required. Over time, Knipper will evaluate this, and
modify as needed.
Certain users can be granted security to override the system's suggested location for the
inventory. If this needs to happen, the user picks the Parent LPN from the receiving dock,
just as with the other work; however, when they are prompted for the Putaway Screen the
user selects the Location Override option on the screen.
This redirects the user to a screen where they can scan the location name from the
barcode in which they want to put the product away. The system validates that there is
nothing else directed to that location and that the location is valid before accepting the
user’s override. After validation passes, the system updates work, the LPN to note the
new location, and writes Transaction History noting the change in the putaway location.
Finally, the user is presented with the Putaway Confirmation screen where they complete
the Putaway the same as with other work units.
When a user presses the Location Override button on the screen, after a user is redirected
to the override screen, the user also has the option to click on the Locate button. When
the Locate button is pressed the user is presented with an option to select a locating rule.
The system will then decide on a suitable putaway location based on the locating rule.
If a user selects the option to override, SCALE has the option to create an activity-based
cycle count at the original putaway location.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 40 of 119						
```

<a id="p041-b001"></a>
## p041\-b001 — PDF page 41, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p041-b002"></a>
## p041\-b002 — PDF page 41, block 2

```text
 

```

<a id="p041-b003"></a>
## p041\-b003 — PDF page 41, block 3

```text
 
Figure– Putaway location override 

```

<a id="p041-b004"></a>
## p041\-b004 — PDF page 41, block 4

```text
 
 
 

```

<a id="p041-b005"></a>
## p041\-b005 — PDF page 41, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 41 of 119 
 

```

<a id="p041-t001"></a>
## p041\-t001 — PDF page 41, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure– Putaway location override
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 41 of 119						
```

<a id="p042-b001"></a>
## p042\-b001 — PDF page 42, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p042-b002"></a>
## p042\-b002 — PDF page 42, block 2

```text
 

```

<a id="p042-b003"></a>
## p042\-b003 — PDF page 42, block 3

```text
III.  INVENTORY CONTROL 
 
11.0 INVENTORY MANAGEMENT 
 

```

<a id="p042-b004"></a>
## p042\-b004 — PDF page 42, block 4

```text
11.1 
Adjustments 
 

```

<a id="p042-b005"></a>
## p042\-b005 — PDF page 42, block 5

```text
Inventory adjustments either increase or decrease the on-hand quantity of an item in a 
location. The adjustment types are configurable and are created to indicate reason codes 
such as Damaged, Scrap, etc. Each adjustment type can be set up to have minimum and 
maximum adjustment quantities. Security is maintained to control which users have access 
to which adjustment types. Adjustment types can be configured to not upload to the Host.  
 
All adjustments are entered in the Inventory Management option. This option can be 
initiated blindly from the main menu or Warehouse Mobile Inventory Management. It can 
also be initiated by selecting a location/item combination in the Inventory Insight. The user 
proceeds by entering the quantity to adjust, where the quantity is specified as a negative 
value for negative adjustments. After confirming, SCALE adjusts the inventory in the 
location and creates a history log of the inventory transaction. 
 

```

<a id="p042-b006"></a>
## p042\-b006 — PDF page 42, block 6

```text
Commented [SM141]: Can we find out the current 
and potential max characters for UDF in the 
adjustment. 

```

<a id="p042-b007"></a>
## p042\-b007 — PDF page 42, block 7

```text
Commented [NC142R141]: Adjustment User defined 
fields (Transaction history) - 
UDF1 to UDF6 = 50 chars 
UDF7 and 8 = Numeric 

```

<a id="p042-b008"></a>
## p042\-b008 — PDF page 42, block 8

```text
 
Figure - Inventory Adjustment Screen 

```

<a id="p042-b009"></a>
## p042\-b009 — PDF page 42, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 42 of 119 
 

```

<a id="p042-t001"></a>
## p042\-t001 — PDF page 42, detected table 1

```text
					MENT
Commented [SM141]: Can we find out the current
and potential max characters for UDF in the
adjustment.
Commented [NC142R141]: Adjustment User defined
fields (Transaction history) -
UDF1 to UDF6 = 50 chars
UDF7 and 8 = Numeric	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
III. INVENTORY CONTROL
11.0 INVENTORY MANAGEMENT
11.1 Adjustments
Inventory adjustments either increase or decrease the on-hand quantity of an item in a
location. The adjustment types are configurable and are created to indicate reason codes
such as Damaged, Scrap, etc. Each adjustment type can be set up to have minimum and
maximum adjustment quantities. Security is maintained to control which users have access
to which adjustment types. Adjustment types can be configured to not upload to the Host.
All adjustments are entered in the Inventory Management option. This option can be
initiated blindly from the main menu or Warehouse Mobile Inventory Management. It can
also be initiated by selecting a location/item combination in the Inventory Insight. The user
proceeds by entering the quantity to adjust, where the quantity is specified as a negative
value for negative adjustments. After confirming, SCALE adjusts the inventory in the
location and creates a history log of the inventory transaction.
Figure - Inventory Adjustment Screen
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 42 of 119						
```

<a id="p043-b001"></a>
## p043\-b001 — PDF page 43, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p043-b002"></a>
## p043\-b002 — PDF page 43, block 2

```text
 

```

<a id="p043-b003"></a>
## p043\-b003 — PDF page 43, block 3

```text
 
Figure - Inventory Adjustment Screen 

```

<a id="p043-b004"></a>
## p043\-b004 — PDF page 43, block 4

```text
 
 

```

<a id="p043-b005"></a>
## p043\-b005 — PDF page 43, block 5

```text
Note: Inventory cannot be adjusted in the receiving dock location. Only located items 
can be adjusted using Inventory Management. 
 

```

<a id="p043-b006"></a>
## p043\-b006 — PDF page 43, block 6

```text
Typical adjustment types are listed below.  
 
       Adjustment Types 
 

```

<a id="p043-b007"></a>
## p043\-b007 — PDF page 43, block 7

```text
Commented [HJ143]: If we remove access from 
profiles to do cycle count adjustments?  Will this 
prevent pending cycle counts from being reconciled?  

```

<a id="p043-b008"></a>
## p043\-b008 — PDF page 43, block 8

```text
o + Adjustment  
o – Adjustment  
o Cycle Count 
 
 
11.2 
Transfers 

```

<a id="p043-b009"></a>
## p043\-b009 — PDF page 43, block 9

```text
Commented [NC144R143]: No action - this can be 
resolved 

```

<a id="p043-b010"></a>
## p043\-b010 — PDF page 43, block 10

```text
Commented [HJ145]: There are occasions when 
transfers are created from building to building.  
Examples are Archives and inventory from the 
printshop in OHW to KMW.   

```

<a id="p043-b011"></a>
## p043\-b011 — PDF page 43, block 11

```text
Commented [NC146R145]: This can be resolved 

```

<a id="p043-b012"></a>
## p043\-b012 — PDF page 43, block 12

```text
 
Inventory transfers move the on-hand quantity of an item from one location to another 
within the four walls of the warehouse. The transfer types are configurable and are created 
to indicate reason codes such as Consolidation, Back to Stock, etc. Each transfer type 
can be set up to have minimum and maximum transfer quantities. Security is maintained 
to control which users have access to which transfer types. 
 
The Inventory Transfer option is initiated blindly from the main menu or Warehouse 
Mobile Inventory Management. This can also be initiated by selecting a location/item 
combination in the Inventory Insight, in which case the “from location” and item 

```

<a id="p043-b013"></a>
## p043\-b013 — PDF page 43, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 43 of 119 
 

```

<a id="p043-t001"></a>
## p043\-t001 — PDF page 43, detected table 1

```text
					MENT
Commented [HJ143]: If we remove access from
profiles to do cycle count adjustments? Will this
prevent pending cycle counts from being reconciled?
Commented [NC144R143]: No action - this can be
resolved
Commented [HJ145]: There are occasions when
transfers are created from building to building.
Examples are Archives and inventory from the
printshop in OHW to KMW.
Commented [NC146R145]: This can be resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Inventory Adjustment Screen
Note: Inventory cannot be adjusted in the receiving dock location. Only located items
can be adjusted using Inventory Management.
Typical adjustment types are listed below.
Adjustment Types
o + Adjustment
o – Adjustment
o Cycle Count
11.2 Transfers
Inventory transfers move the on-hand quantity of an item from one location to another
within the four walls of the warehouse. The transfer types are configurable and are created
to indicate reason codes such as Consolidation, Back to Stock, etc. Each transfer type
can be set up to have minimum and maximum transfer quantities. Security is maintained
to control which users have access to which transfer types.
The Inventory Transfer option is initiated blindly from the main menu or Warehouse
Mobile Inventory Management. This can also be initiated by selecting a location/item
combination in the Inventory Insight, in which case the “from location” and item
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 43 of 119						
```

<a id="p044-b001"></a>
## p044\-b001 — PDF page 44, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p044-b002"></a>
## p044\-b002 — PDF page 44, block 2

```text
 

```

<a id="p044-b003"></a>
## p044\-b003 — PDF page 44, block 3

```text
automatically default. In the scenario where Inventory Management is blindly initiated, the 
user is forced to specify the “from location”, item and quantity being transferred. 
 
As part of inventory transfer, users can also create work. This way a supervisor can decide 
what inventory needs to be moved and then a picker on the floor will get the work to 
physically move the product. Inventory transfer with work must be created on the insight 
screen. The work execution can happen on the RF device. 
 
 

```

<a id="p044-b004"></a>
## p044\-b004 — PDF page 44, block 4

```text
 
Figure – Inventory Transfer with work 

```

<a id="p044-b005"></a>
## p044\-b005 — PDF page 44, block 5

```text
 
 

```

<a id="p044-b006"></a>
## p044\-b006 — PDF page 44, block 6

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 44 of 119 
 

```

<a id="p044-t001"></a>
## p044\-t001 — PDF page 44, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
automatically default. In the scenario where Inventory Management is blindly initiated, the
user is forced to specify the “from location”, item and quantity being transferred.
As part of inventory transfer, users can also create work. This way a supervisor can decide
what inventory needs to be moved and then a picker on the floor will get the work to
physically move the product. Inventory transfer with work must be created on the insight
screen. The work execution can happen on the RF device.
Figure – Inventory Transfer with work
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 44 of 119						
```

<a id="p045-b001"></a>
## p045\-b001 — PDF page 45, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p045-b002"></a>
## p045\-b002 — PDF page 45, block 2

```text
 

```

<a id="p045-b003"></a>
## p045\-b003 — PDF page 45, block 3

```text
Commented [RS147]: We will create an extension if it 
is really needed for Knipper 

```

<a id="p045-b004"></a>
## p045\-b004 — PDF page 45, block 4

```text
Commented [NC148R147]: NC 11/13: Current state 
can only print 1 at a time. Ops wants to be able to 
multi-select. BOL printing functionality -  MAH to 
confirm if an extension is needed 

```

<a id="p045-b005"></a>
## p045\-b005 — PDF page 45, block 5

```text
 
 
Figure - Inventory transfer work execution 
 
           
           Note: Inventory transfer work execution will be system directed for majority of the 
operations. Knipper would use User directed work execution as well and would like to print work 
units document in bulk. [EX40 - Printing multiple work unit document from work insight] 
will be developed if approved by Knipper 
 

```

<a id="p045-b006"></a>
## p045\-b006 — PDF page 45, block 6

```text
11.3 Status Change 
 

```

<a id="p045-b007"></a>
## p045\-b007 — PDF page 45, block 7

```text
Commented [RS149R147]: Added the details on the 
extension needed. Please note it is not BOL printing 
but the work unit document 

```

<a id="p045-b008"></a>
## p045\-b008 — PDF page 45, block 8

```text
Commented [NC150R147]: NC12022024: this is 
resolved 

```

<a id="p045-b009"></a>
## p045\-b009 — PDF page 45, block 9

```text
Commented [HJ151]: Can we have the option to 
change the default status during the receiving 
process and adjustment in process without having to 
do the additional steps after these processes to 
change the status?  We have client's that require 
inventory to be placed on a specific status upon 
receiving and the inventory departments has to do 
adjustments in on items that are not always available 
status.   

```

<a id="p045-b010"></a>
## p045\-b010 — PDF page 45, block 10

```text
Inventory is received into SCALE with a default status of Available, and HQ for items 
flagged as inbound QC required. However, Knipper may choose to have different 
inventory statuses to represent contrasting conditions of inventory such as Hold, 
damaged, rejected etc. The Warehouse personnel can use an Inventory Status Change 
to update inventory status. These status change types are configurable, and security is 
maintained to control which users have access to which status change types. 
 
The Inventory Management option can be initiated blindly from the main menu wherein 
the user specifies the location and item. It can also be initiated by selecting a location/item 
or a license plate (per configuration) combination in the Inventory Insight, in which case 
the location and item automatically default. The user then specifies the new inventory 
status. At confirmation, SCALE updates the inventory status for the item and location 
combination. SCALE also creates a history log of the inventory transaction. 

```

<a id="p045-b011"></a>
## p045\-b011 — PDF page 45, block 11

```text
Commented [NC152R151]: NC 11/13: It is all 
receiving preferences for items. Following SOPs and 
client specific. This is resolved 

```

<a id="p045-b012"></a>
## p045\-b012 — PDF page 45, block 12

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 45 of 119 
 

```

<a id="p045-t001"></a>
## p045\-t001 — PDF page 45, detected table 1

```text
				MENT
Commented [RS147]: We will create an extension if it
is really needed for Knipper
Commented [NC148R147]: NC 11/13: Current state
can only print 1 at a time. Ops wants to be able to
multi-select. BOL printing functionality - MAH to
confirm if an extension is needed
Commented [RS149R147]: Added the details on the
extension needed. Please note it is not BOL printing
but the work unit document
Commented [NC150R147]: NC12022024: this is
resolved
Commented [HJ151]: Can we have the option to
change the default status during the receiving
process and adjustment in process without having to
do the additional steps after these processes to
change the status? We have client's that require
inventory to be placed on a specific status upon
receiving and the inventory departments has to do
adjustments in on items that are not always available
status.
Commented [NC152R151]: NC 11/13: It is all
receiving preferences for items. Following SOPs and
client specific. This is resolved	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
Figure - Inventory transfer work execution
Note: Inventory transfer work execution will be system directed for majority of the
operations. Knipper would use User directed work execution as well and would like to print work
units document in bulk. [EX40 - Printing multiple work unit document from work insight]
will be developed if approved by Knipper
11.3 Status Change
Inventory is received into SCALE with a default status of Available, and HQ for items
flagged as inbound QC required. However, Knipper may choose to have different
inventory statuses to represent contrasting conditions of inventory such as Hold,
damaged, rejected etc. The Warehouse personnel can use an Inventory Status Change
to update inventory status. These status change types are configurable, and security is
maintained to control which users have access to which status change types.
The Inventory Management option can be initiated blindly from the main menu wherein
the user specifies the location and item. It can also be initiated by selecting a location/item
or a license plate (per configuration) combination in the Inventory Insight, in which case
the location and item automatically default. The user then specifies the new inventory
status. At confirmation, SCALE updates the inventory status for the item and location
combination. SCALE also creates a history log of the inventory transaction.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 45 of 119					
```

<a id="p046-b001"></a>
## p046\-b001 — PDF page 46, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p046-b002"></a>
## p046\-b002 — PDF page 46, block 2

```text
 

```

<a id="p046-b003"></a>
## p046\-b003 — PDF page 46, block 3

```text
 

```

<a id="p046-b004"></a>
## p046\-b004 — PDF page 46, block 4

```text
Note: Single location cannot hold the same item with a quantity in status Available and 
another quantity in status Damaged if the location is not License plate tracked 
  

```

<a id="p046-b005"></a>
## p046\-b005 — PDF page 46, block 5

```text
Commented [SM153]: On inbound the system has 
located a receipt locate into a location with different 
status - see consolidation rules. 

```

<a id="p046-b006"></a>
## p046\-b006 — PDF page 46, block 6

```text
Commented [NC154R153]: NC 11/13: MAH to review 

```

<a id="p046-b007"></a>
## p046\-b007 — PDF page 46, block 7

```text
Knipper does update inventory status of multiple lots at the same time by selecting 
multiple lots when managing items for destruction. 
 
 

```

<a id="p046-b008"></a>
## p046\-b008 — PDF page 46, block 8

```text
Commented [RS155R153]: Yes, it will allow even for 
this scenario as long as the location is license plate 
tracked 

```

<a id="p046-b009"></a>
## p046\-b009 — PDF page 46, block 9

```text
Commented [NC156R153]: NC12022024: this is 
resolved. 

```

<a id="p046-b010"></a>
## p046\-b010 — PDF page 46, block 10

```text
11.4 Location Inquiry  
 
The 
warehouse 
mobile location inquiry enables 
Knipper 
to 
search 
and 
view 
the location inventory records on warehouse mobile. This helps to validate the items actual 
quantity with that of the quantity physically present in a location. Also, users can access the 
adjust or transfer inventory actions from this screen. 

```

<a id="p046-b011"></a>
## p046\-b011 — PDF page 46, block 11

```text
Commented [MA157]: Want to make sure this is 
not for every profile. If it is user based that is fine. 
This cannot be a default setting for everyone with RF 
Access. 

```

<a id="p046-b012"></a>
## p046\-b012 — PDF page 46, block 12

```text
Commented [MA158R157]: Adjustment access 
should be at the user profile level.   

```

<a id="p046-b013"></a>
## p046\-b013 — PDF page 46, block 13

```text
Commented [NC159R157]: NC 11/13: This is based 
on user profile. This can be resolved 

```

<a id="p046-b014"></a>
## p046\-b014 — PDF page 46, block 14

```text
 
Figure – Location Inquiry 
 

```

<a id="p046-b015"></a>
## p046\-b015 — PDF page 46, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 46 of 119 
 

```

<a id="p046-t001"></a>
## p046\-t001 — PDF page 46, detected table 1

```text
					MENT
Commented [SM153]: On inbound the system has
located a receipt locate into a location with different
status - see consolidation rules.
Commented [NC154R153]: NC 11/13: MAH to review
Commented [RS155R153]: Yes, it will allow even for
this scenario as long as the location is license plate
tracked
Commented [NC156R153]: NC12022024: this is
resolved.
Commented [MA157]: Want to make sure this is
not for every profile. If it is user based that is fine.
This cannot be a default setting for everyone with RF
Access.
Commented [MA158R157]: Adjustment access
should be at the user profile level.
Commented [NC159R157]: NC 11/13: This is based
on user profile. This can be resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Note: Single location cannot hold the same item with a quantity in status Available and
another quantity in status Damaged if the location is not License plate tracked
Knipper does update inventory status of multiple lots at the same time by selecting
multiple lots when managing items for destruction.
11.4 Location Inquiry
The warehouse mobile location inquiry enables Knipper to search and view
the location inventory records on warehouse mobile. This helps to validate the items actual
quantity with that of the quantity physically present in a location. Also, users can access the
adjust or transfer inventory actions from this screen.
Figure – Location Inquiry
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 46 of 119						
```

<a id="p047-b001"></a>
## p047\-b001 — PDF page 47, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p047-b002"></a>
## p047\-b002 — PDF page 47, block 2

```text
 

```

<a id="p047-b003"></a>
## p047\-b003 — PDF page 47, block 3

```text
Commented [SM160]: There is more information 
now in Locn Quick Find than this Locn Inq. (LPN for 
example) 

```

<a id="p047-b004"></a>
## p047\-b004 — PDF page 47, block 4

```text
Commented [NC161R160]: NC 11/13: No lot, no 
expiration date, conversion rate - we need more 
information. MAH to confirm this can be added 

```

<a id="p047-b005"></a>
## p047\-b005 — PDF page 47, block 5

```text
Commented [RS162R160]: Please note that this 
screen is of RF module and not the full screen. The 
Inventory Insight is the screen which is replacing the 
location quick find and that screen will have more fields 
than this. 

```

<a id="p047-b006"></a>
## p047\-b006 — PDF page 47, block 6

```text
Commented [NC163R160]: NC12022024: this is 
resolved. 

```

<a id="p047-b007"></a>
## p047\-b007 — PDF page 47, block 7

```text
 
Figure – Location Inquiry results 
 

```

<a id="p047-b008"></a>
## p047\-b008 — PDF page 47, block 8

```text
 
Figure – Location inquiry actions 
 

```

<a id="p047-b009"></a>
## p047\-b009 — PDF page 47, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 47 of 119 
 

```

<a id="p047-t001"></a>
## p047\-t001 — PDF page 47, detected table 1

```text
					MENT
Commented [SM160]: There is more information
now in Locn Quick Find than this Locn Inq. (LPN for
example)
Commented [NC161R160]: NC 11/13: No lot, no
expiration date, conversion rate - we need more
information. MAH to confirm this can be added
Commented [RS162R160]: Please note that this
screen is of RF module and not the full screen. The
Inventory Insight is the screen which is replacing the
location quick find and that screen will have more fields
than this.
Commented [NC163R160]: NC12022024: this is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Location Inquiry results
Figure – Location inquiry actions
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 47 of 119						
```

<a id="p048-b001"></a>
## p048\-b001 — PDF page 48, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p048-b002"></a>
## p048\-b002 — PDF page 48, block 2

```text
 

```

<a id="p048-b003"></a>
## p048\-b003 — PDF page 48, block 3

```text
12.0 CYCLE COUNT 
 

```

<a id="p048-b004"></a>
## p048\-b004 — PDF page 48, block 4

```text
 
12.1 
Generating Cycle Counts  
 
 
12.1.1  Plan Based Cycle Counting 
 

```

<a id="p048-b005"></a>
## p048\-b005 — PDF page 48, block 5

```text
SCALE utilizes Cycle Count Plans for everyday cycle counting. Knipper personnel 
define the Cycle Count Plans in the Cycle Count Plan Insight. A Cycle Count 
Plan is used to define a range of items and/or locations for which to generate cycle 
count work. For an example of location criteria, Knipper can exclude a location that 
was counted within the last 30 days. For an example of item criteria, Knipper can 
use the Item categories (Client Code, etc.). Once the plan has been created, 
SCALE creates work to count a specified number of locations within the criteria of 
the Cycle Count Plan. Each location determined for cycle count is generated as a 
separate work unit in SCALE.  
 
Some Plan based counts that Knipper uses are: 
 

```

<a id="p048-b006"></a>
## p048\-b006 — PDF page 48, block 6

```text
Commented [SM164]: Currently to set up a 
schedule, users need to set up a plan via CC 
Location Criteria, CC Item Criteria, and CC master; 
do these steps get consolidated with scale v'24? 

```

<a id="p048-b007"></a>
## p048\-b007 — PDF page 48, block 7

```text
Commented [NC165R164]: NC 11/13: MAH to confirm 

```

<a id="p048-b008"></a>
## p048\-b008 — PDF page 48, block 8

```text
Commented [RS166R164]: This process will remain 
same in the new version 

```

<a id="p048-b009"></a>
## p048\-b009 — PDF page 48, block 9

```text
Commented [NC167R164]: NC12022024: this is 
resolved. 

```

<a id="p048-b010"></a>
## p048\-b010 — PDF page 48, block 10

```text
• 
Daily Count for PM locations 
• 
Daily Literature Items Count 
• 
Daily Count KMW Reserve 
• 
Daily Count OHW Reserve Bausch 
• 
Weekly Refrigerated Locations Count 
 
            Note: The below are just for reference and Knipper creates Weekly/Daily/Monthly cycle 
count for different accounts as per the requirements. 

```

<a id="p048-b011"></a>
## p048\-b011 — PDF page 48, block 11

```text
 

```

<a id="p048-b012"></a>
## p048\-b012 — PDF page 48, block 12

```text
 
Figure - Cycle Count Plan Insight 

```

<a id="p048-b013"></a>
## p048\-b013 — PDF page 48, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 48 of 119 
 

```

<a id="p048-t001"></a>
## p048\-t001 — PDF page 48, detected table 1

```text
				MENT
Commented [SM164]: Currently to set up a
schedule, users need to set up a plan via CC
Location Criteria, CC Item Criteria, and CC master;
do these steps get consolidated with scale v'24?
Commented [NC165R164]: NC 11/13: MAH to confirm
Commented [RS166R164]: This process will remain
same in the new version
Commented [NC167R164]: NC12022024: this is
resolved.	
					
			KNIPPER SOLUTION DESIGN DOCU	MEN	T
					
12.0 CYCLE COUNT
12.1 Generating Cycle Counts
12.1.1 Plan Based Cycle Counting
SCALE utilizes Cycle Count Plans for everyday cycle counting. Knipper personnel
define the Cycle Count Plans in the Cycle Count Plan Insight. A Cycle Count
Plan is used to define a range of items and/or locations for which to generate cycle
count work. For an example of location criteria, Knipper can exclude a location that
was counted within the last 30 days. For an example of item criteria, Knipper can
use the Item categories (Client Code, etc.). Once the plan has been created,
SCALE creates work to count a specified number of locations within the criteria of
the Cycle Count Plan. Each location determined for cycle count is generated as a
separate work unit in SCALE.
Some Plan based counts that Knipper uses are:
• Daily Count for PM locations
• Daily Literature Items Count
• Daily Count KMW Reserve
• Daily Count OHW Reserve Bausch
• Weekly Refrigerated Locations Count
Note: The below are just for reference and Knipper creates Weekly/Daily/Monthly cycle
count for different accounts as per the requirements.
Figure - Cycle Count Plan Insight
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 48 of 119					
```

<a id="p049-b001"></a>
## p049\-b001 — PDF page 49, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p049-b002"></a>
## p049\-b002 — PDF page 49, block 2

```text
 

```

<a id="p049-b003"></a>
## p049\-b003 — PDF page 49, block 3

```text
12.1.2  Activity Based Cycle Counting 
 

```

<a id="p049-b004"></a>
## p049\-b004 — PDF page 49, block 4

```text
Activity-based cycle counting is the concept of triggering the generation of a cycle 
count request after a warehouse activity (i.e., Short Picking). The triggering of 
these requests is tied to the location being processed. After the transaction is 
executed, the location is reviewed to see if cycle count work should be generated. 
 
For Knipper, SCALE is configured to create activity-based cycle count work for a 
location when short picked. 

```

<a id="p049-b005"></a>
## p049\-b005 — PDF page 49, block 5

```text
Commented [SM168]: Knipper does not short pick. 

```

<a id="p049-b006"></a>
## p049\-b006 — PDF page 49, block 6

```text
Commented [NC169R168]: NC 11/13: This can be 
resolved 

```

<a id="p049-b007"></a>
## p049\-b007 — PDF page 49, block 7

```text
Commented [SM170]: Parking Lot Item #17 

```

<a id="p049-b008"></a>
## p049\-b008 — PDF page 49, block 8

```text
 
Note: Threshold Count is utilized. Knipper would like to enable threshold count 
and perform threshold counts immediately for some work zones. 
 
Knipper would like to perform counts for PTL (Pick to Light) Mod locations after 
completing picking of every wave and would like to create the count automatically 
after work unit is completed. [EX19 – Pick to Light Integration] will be enhanced 
to create the count automatically. 
 

```

<a id="p049-b009"></a>
## p049\-b009 — PDF page 49, block 9

```text
 
12.2 
Executing Cycle Counts  
 

```

<a id="p049-b010"></a>
## p049\-b010 — PDF page 49, block 10

```text
12.2.1  Work Execution 
 

```

<a id="p049-b011"></a>
## p049\-b011 — PDF page 49, block 11

```text
Commented [HJ171]: If there is a discrepancy in the 
pick mod, we cannot reconcile the location before the 
full inventory investigation is completed due to the 
reconciliation making an inventory adjustment in 
SCALE.  If the count stays open, this will keep the 
wave open, and operations cannot process anymore 
orders from that location until the cycle count is 
reconciled.  If the cycle count is used as an 
adjustment after an investigation, how is it tied back 
to the wave?  

```

<a id="p049-b012"></a>
## p049\-b012 — PDF page 49, block 12

```text
Commented [NC172R171]: NC 11/13: MAH is 
creating an announcement - this will be taken care of 

```

<a id="p049-b013"></a>
## p049\-b013 — PDF page 49, block 13

```text
For Knipper the cycle count execution is set to Standard count for active and 
reserve locations. To confirm the cycle count, users sign onto a warehouse mobile 
device, chooses the Work option, and then specify the Cycle Count Work Profile. 
The user is then prompted to scan a location for SCALE to assign a Work Unit in 
closest proximity. Work can also be user-directed, if the user knows exactly which 
locations need to be counted. If User directed, then the user needs to scan the 
location that they intend to count.  
 
Once done, SCALE assigns the work to the user and displays the location to be 
counted on the work execution screen and the item present in that location. User 
then must specify the quantity present in the location.   
 

```

<a id="p049-b014"></a>
## p049\-b014 — PDF page 49, block 14

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 49 of 119 
 

```

<a id="p049-t001"></a>
## p049\-t001 — PDF page 49, detected table 1

```text
					MENT
Commented [SM168]: Knipper does not short pick.
Commented [NC169R168]: NC 11/13: This can be
resolved
Commented [SM170]: Parking Lot Item #17
Commented [HJ171]: If there is a discrepancy in the
pick mod, we cannot reconcile the location before the
full inventory investigation is completed due to the
reconciliation making an inventory adjustment in
SCALE. If the count stays open, this will keep the
wave open, and operations cannot process anymore
orders from that location until the cycle count is
reconciled. If the cycle count is used as an
adjustment after an investigation, how is it tied back
to the wave?
Commented [NC172R171]: NC 11/13: MAH is
creating an announcement - this will be taken care of	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
12.1.2 Activity Based Cycle Counting
Activity-based cycle counting is the concept of triggering the generation of a cycle
count request after a warehouse activity (i.e., Short Picking). The triggering of
these requests is tied to the location being processed. After the transaction is
executed, the location is reviewed to see if cycle count work should be generated.
For Knipper, SCALE is configured to create activity-based cycle count work for a
location when short picked.
Note: Threshold Count is utilized. Knipper would like to enable threshold count
and perform threshold counts immediately for some work zones.
Knipper would like to perform counts for PTL (Pick to Light) Mod locations after
completing picking of every wave and would like to create the count automatically
after work unit is completed. [EX19 – Pick to Light Integration] will be enhanced
to create the count automatically.
12.2 Executing Cycle Counts
12.2.1 Work Execution
For Knipper the cycle count execution is set to Standard count for active and
reserve locations. To confirm the cycle count, users sign onto a warehouse mobile
device, chooses the Work option, and then specify the Cycle Count Work Profile.
The user is then prompted to scan a location for SCALE to assign a Work Unit in
closest proximity. Work can also be user-directed, if the user knows exactly which
locations need to be counted. If User directed, then the user needs to scan the
location that they intend to count.
Once done, SCALE assigns the work to the user and displays the location to be
counted on the work execution screen and the item present in that location. User
then must specify the quantity present in the location.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 49 of 119						
```

<a id="p049-t002"></a>
## p049\-t002 — PDF page 49, detected table 2

```text
Knipper would like to perform counts for PTL (Pick to Light) Mod locations after	
completing picking of every wave and would like to create the count automatically	
after work unit is completed. [EX19 – Pick to Light Integration] will be enhanced	
to create the count automatically.	
```

<a id="p050-b001"></a>
## p050\-b001 — PDF page 50, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p050-b002"></a>
## p050\-b002 — PDF page 50, block 2

```text
 

```

<a id="p050-b003"></a>
## p050\-b003 — PDF page 50, block 3

```text
Commented [SM173]: Cycle count screen needs to 
display the standard Locn, LPN, Item, Batch, Exp 
Date 

```

<a id="p050-b004"></a>
## p050\-b004 — PDF page 50, block 4

```text
Commented [NC174R173]: NC 11/13: MAH to add the 
above 

```

<a id="p050-b005"></a>
## p050\-b005 — PDF page 50, block 5

```text
Commented [RS175R173]: The cycle count execution 
screen would display all these fields. 

```

<a id="p050-b006"></a>
## p050\-b006 — PDF page 50, block 6

```text
Commented [NC176R173]: NC12022024: this is 
resolved 

```

<a id="p050-b007"></a>
## p050\-b007 — PDF page 50, block 7

```text
 
Figure - Cycle Count Work execution 

```

<a id="p050-b008"></a>
## p050\-b008 — PDF page 50, block 8

```text
 

```

<a id="p050-b009"></a>
## p050\-b009 — PDF page 50, block 9

```text
Note: Cycle Count Preferences are set up to “Verify Bad Count”.  
 

```

<a id="p050-b010"></a>
## p050\-b010 — PDF page 50, block 10

```text
Commented [SM177]: Option to Cycle Count the 
Location or the LPNs 

```

<a id="p050-b011"></a>
## p050\-b011 — PDF page 50, block 11

```text
Commented [NC178R177]: NC 11/13: MAH to confirm 
we can add this functionality 

```

<a id="p050-b012"></a>
## p050\-b012 — PDF page 50, block 12

```text
Commented [RS179R177]: There is an option to count 
total license plates of an item in a location. There is a 
configuration which needs to be turned on for this to 
work. Please note that the count will also have to be for 
a location/item whether a count is done by License 
plate or not. 

```

<a id="p050-b013"></a>
## p050\-b013 — PDF page 50, block 13

```text
Commented [NC180R177]: NC12022024: 2 options 
need to be available cycle count the location and the 
LPNs 

```

<a id="p050-b014"></a>
## p050\-b014 — PDF page 50, block 14

```text
Commented [RS181R177]: The configuration can be 
utilized if the user need to scan the LPN during the 
count. If this is fine, please go ahead and resolve this. 

```

<a id="p050-b015"></a>
## p050\-b015 — PDF page 50, block 15

```text
 
If the quantity entered by the user is the same as the system quantity, then the 
system accepts that quantity and displays the cycle count screen where the user 
can count other items in the location (multi-item location). If the location is a single 
item, then the user needs to click on the Done to indicate the cycle count work 
execution is complete. If no discrepancy in count the cycle count request is 
updated to close. 
 
If the quantity entered by the user for the first time doesn’t match the system 
quantity, SCALE displays verify count screen and ask the user to confirm the 
quantity again. If the user enters verify count, they need to enter two consecutive 
counts of the same value to complete the count.  
 
Upon entering the information, if there is a discrepancy in the count then SCALE 
determines whether to post the inventory adjustment or update the cycle count 
request to status Pending Review. For Knipper the Cycle Count Tolerances will be 
set to 0 (all discrepancies must be reconciled) by default. So, SCALE updates the 
cycle count request to pending review, and reconciliation needs to be completed 
for the cycle count request to be updated to closed status. 
 
 

```

<a id="p050-b016"></a>
## p050\-b016 — PDF page 50, block 16

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 50 of 119 
 

```

<a id="p050-t001"></a>
## p050\-t001 — PDF page 50, detected table 1

```text
					MENT
Commented [SM173]: Cycle count screen needs to
display the standard Locn, LPN, Item, Batch, Exp
Date
Commented [NC174R173]: NC 11/13: MAH to add the
above
Commented [RS175R173]: The cycle count execution
screen would display all these fields.
Commented [NC176R173]: NC12022024: this is
resolved
Commented [SM177]: Option to Cycle Count the
Location or the LPNs
Commented [NC178R177]: NC 11/13: MAH to confirm
we can add this functionality
Commented [RS179R177]: There is an option to count
total license plates of an item in a location. There is a
configuration which needs to be turned on for this to
work. Please note that the count will also have to be for
a location/item whether a count is done by License
plate or not.
Commented [NC180R177]: NC12022024: 2 options
need to be available cycle count the location and the
LPNs
Commented [RS181R177]: The configuration can be
utilized if the user need to scan the LPN during the
count. If this is fine, please go ahead and resolve this.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Cycle Count Work execution
Note: Cycle Count Preferences are set up to “Verify Bad Count”.
If the quantity entered by the user is the same as the system quantity, then the
system accepts that quantity and displays the cycle count screen where the user
can count other items in the location (multi-item location). If the location is a single
item, then the user needs to click on the Done to indicate the cycle count work
execution is complete. If no discrepancy in count the cycle count request is
updated to close.
If the quantity entered by the user for the first time doesn’t match the system
quantity, SCALE displays verify count screen and ask the user to confirm the
quantity again. If the user enters verify count, they need to enter two consecutive
counts of the same value to complete the count.
Upon entering the information, if there is a discrepancy in the count then SCALE
determines whether to post the inventory adjustment or update the cycle count
request to status Pending Review. For Knipper the Cycle Count Tolerances will be
set to 0 (all discrepancies must be reconciled) by default. So, SCALE updates the
cycle count request to pending review, and reconciliation needs to be completed
for the cycle count request to be updated to closed status.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 50 of 119						
```

<a id="p051-b001"></a>
## p051\-b001 — PDF page 51, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p051-b002"></a>
## p051\-b002 — PDF page 51, block 2

```text
 

```

<a id="p051-b003"></a>
## p051\-b003 — PDF page 51, block 3

```text
12.2.2  Cycle Count Reconciliations 
 

```

<a id="p051-b004"></a>
## p051\-b004 — PDF page 51, block 4

```text
For cycle count transactions that fall outside of a user’s tolerance, SCALE updates 
the status of the Cycle Count work to Pending Review.  
 
To reconcile a cycle count, a supervisor uses Reconcile option from the Cycle 
Count Request Insight screen. 
 
From the Cycle Count Request Insight, the supervisor selects the appropriate 
cycle count in the status Pending Review. On each of the counts requiring review, 
the supervisor uses the Reconcile action to complete the cycle count adjustment. 
Once in the reconcile screen, the supervisor enters the correct On-Hand quantity 
for the specific item in the location. 
 

```

<a id="p051-b005"></a>
## p051\-b005 — PDF page 51, block 5

```text
Commented [SM182]: Currently we confirm cc is 
accurate, and then go back and do a manual 
adjustment so the INCA # can be logged (for drug 
product). 
 
Inventory Check and Adjustment Form (INCA) 

```

<a id="p051-b006"></a>
## p051\-b006 — PDF page 51, block 6

```text
Commented [NC183R182]: NC 11/13: this can be 
resolved 

```

<a id="p051-b007"></a>
## p051\-b007 — PDF page 51, block 7

```text
 
Figure - Cycle Count Reconcile using Insight screen 

```

<a id="p051-b008"></a>
## p051\-b008 — PDF page 51, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 51 of 119 
 

```

<a id="p051-t001"></a>
## p051\-t001 — PDF page 51, detected table 1

```text
					MENT
Commented [SM182]: Currently we confirm cc is
accurate, and then go back and do a manual
adjustment so the INCA # can be logged (for drug
product).
Inventory Check and Adjustment Form (INCA)
Commented [NC183R182]: NC 11/13: this can be
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
12.2.2 Cycle Count Reconciliations
For cycle count transactions that fall outside of a user’s tolerance, SCALE updates
the status of the Cycle Count work to Pending Review.
To reconcile a cycle count, a supervisor uses Reconcile option from the Cycle
Count Request Insight screen.
From the Cycle Count Request Insight, the supervisor selects the appropriate
cycle count in the status Pending Review. On each of the counts requiring review,
the supervisor uses the Reconcile action to complete the cycle count adjustment.
Once in the reconcile screen, the supervisor enters the correct On-Hand quantity
for the specific item in the location.
Figure - Cycle Count Reconcile using Insight screen
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 51 of 119						
```

<a id="p052-b001"></a>
## p052\-b001 — PDF page 52, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p052-b002"></a>
## p052\-b002 — PDF page 52, block 2

```text
 

```

<a id="p052-b003"></a>
## p052\-b003 — PDF page 52, block 3

```text
 
Figure - Cycle Count Reconciliation insight screen 

```

<a id="p052-b004"></a>
## p052\-b004 — PDF page 52, block 4

```text
 

```

<a id="p052-b005"></a>
## p052\-b005 — PDF page 52, block 5

```text
The supervisor confirms the on-hand quantity, and then SCALE updates the inventory in 
the location, records an inventory transaction, and closes the cycle count request. 
 
 
Cycle Count reconciliation can also be performed using the warehouse mobile option.  
 
 

```

<a id="p052-b006"></a>
## p052\-b006 — PDF page 52, block 6

```text
 
Figure - Cycle Count Reconciliation using warehouse mobile 

```

<a id="p052-b007"></a>
## p052\-b007 — PDF page 52, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 52 of 119 
 

```

<a id="p052-t001"></a>
## p052\-t001 — PDF page 52, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Cycle Count Reconciliation insight screen
The supervisor confirms the on-hand quantity, and then SCALE updates the inventory in
the location, records an inventory transaction, and closes the cycle count request.
Cycle Count reconciliation can also be performed using the warehouse mobile option.
Figure - Cycle Count Reconciliation using warehouse mobile
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 52 of 119						
```

<a id="p053-b001"></a>
## p053\-b001 — PDF page 53, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p053-b002"></a>
## p053\-b002 — PDF page 53, block 2

```text
 

```

<a id="p053-b003"></a>
## p053\-b003 — PDF page 53, block 3

```text
 

```

<a id="p053-b004"></a>
## p053\-b004 — PDF page 53, block 4

```text
 
Figure - Cycle Count Reconciliation using warehouse mobile 

```

<a id="p053-b005"></a>
## p053\-b005 — PDF page 53, block 5

```text
 

```

<a id="p053-b006"></a>
## p053\-b006 — PDF page 53, block 6

```text
 
13.0 REPLENISHMENT 

```

<a id="p053-b007"></a>
## p053\-b007 — PDF page 53, block 7

```text
Replenishment is setup using Replenishment Master records. A replenishment master 
record helps define how a replenishment request is generated. It specifies the parameters 
for replenishing product based on either location need or demand generated for a 
wave/order pool. The sequence records for a replenishment rule can be edited. Each 
sequence rule identifies how the system will perform replenishment (strategy).  

```

<a id="p053-b008"></a>
## p053\-b008 — PDF page 53, block 8

```text
Commented [SM184]: 3 means of replenishing:  
Wave Generated, Capacity based on Perm Locns, 
manual xfer. 

```

<a id="p053-b009"></a>
## p053\-b009 — PDF page 53, block 9

```text
Commented [NC185R184]: NC 11/13: no action 
required 

```

<a id="p053-b010"></a>
## p053\-b010 — PDF page 53, block 10

```text
Setting up the replenishment is a manual process and leverages using the high-volume 
item demand report and the setup of item location assignments and capacities as defined 
earlier in the wave selection section. 
  

```

<a id="p053-b011"></a>
## p053\-b011 — PDF page 53, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 53 of 119 
 

```

<a id="p053-t001"></a>
## p053\-t001 — PDF page 53, detected table 1

```text
					MENT
Commented [SM184]: 3 means of replenishing:
Wave Generated, Capacity based on Perm Locns,
manual xfer.
Commented [NC185R184]: NC 11/13: no action
required	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure - Cycle Count Reconciliation using warehouse mobile
13.0 REPLENISHMENT
Replenishment is setup using Replenishment Master records. A replenishment master
record helps define how a replenishment request is generated. It specifies the parameters
for replenishing product based on either location need or demand generated for a
wave/order pool. The sequence records for a replenishment rule can be edited. Each
sequence rule identifies how the system will perform replenishment (strategy).
Setting up the replenishment is a manual process and leverages using the high-volume
item demand report and the setup of item location assignments and capacities as defined
earlier in the wave selection section.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 53 of 119						
```

<a id="p054-b001"></a>
## p054\-b001 — PDF page 54, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p054-b002"></a>
## p054\-b002 — PDF page 54, block 2

```text
 

```

<a id="p054-b003"></a>
## p054\-b003 — PDF page 54, block 3

```text
 
Figure – Replenishment Master 

```

<a id="p054-b004"></a>
## p054\-b004 — PDF page 54, block 4

```text
Commented [SM186]: Parking Lot # 13 needs to be 
addressed. 

```

<a id="p054-b005"></a>
## p054\-b005 — PDF page 54, block 5

```text
Commented [NC187R186]: NC 11/13: MAH to look 
into it 

```

<a id="p054-b006"></a>
## p054\-b006 — PDF page 54, block 6

```text
Commented [RS188R186]: This will be discussed 
during the call on 11/25 

```

<a id="p054-b007"></a>
## p054\-b007 — PDF page 54, block 7

```text
Commented [NC189R186]: NC12042024: This can be 
resolved 

```

<a id="p054-b008"></a>
## p054\-b008 — PDF page 54, block 8

```text
Commented [SM190]: KMW : wave replen is 
normally a pick to zero.  Not necessarily case level 
replen. 

```

<a id="p054-b009"></a>
## p054\-b009 — PDF page 54, block 9

```text
Commented [NC191R190]: NC 11/13: this can be 
resolved 

```

<a id="p054-b010"></a>
## p054\-b010 — PDF page 54, block 10

```text
 
 
13.1 
Demand Replenishment 
 
Each demand from the wave is evaluated against flow rack inventory to determine 
if there is enough available.  If not, SCALE will request the product in Case 
increment (round up) to be replenished to each pick primary bins.  
 
If the demand is greater than the Capacity of flow rack location, then SCALE will 
direct the additional inventory into empty dynamic active locations.  
 
Case demand from the wave is evaluated against the pallet rack location inventory 
to determine if there is enough available. If not, SCALE will request the product in 
Pallet increment (round up) to be replenished to pallet rack locations. 
 
If the demand is greater than the Capacity of pallet rack location, then SCALE will 
direct the additional inventory into empty dynamic active locations. 

```

<a id="p054-b011"></a>
## p054\-b011 — PDF page 54, block 11

```text
 
              Note: Knipper utilizes both dynamic and permanent locations at Pick to Light and 
other primary locations at multiple areas (MSM, 3PL, DEA, Refrigerated and Freezer) of 
the warehouse. There will be multiple Replenishment masters created for the replenishment 
of all the areas of the warehouse. 
 

```

<a id="p054-b012"></a>
## p054\-b012 — PDF page 54, block 12

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 54 of 119 
 

```

<a id="p054-t001"></a>
## p054\-t001 — PDF page 54, detected table 1

```text
					MENT
Commented [SM186]: Parking Lot # 13 needs to be
addressed.
Commented [NC187R186]: NC 11/13: MAH to look
into it
Commented [RS188R186]: This will be discussed
during the call on 11/25
Commented [NC189R186]: NC12042024: This can be
resolved
Commented [SM190]: KMW : wave replen is
normally a pick to zero. Not necessarily case level
replen.
Commented [NC191R190]: NC 11/13: this can be
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Replenishment Master
13.1 Demand Replenishment
Each demand from the wave is evaluated against flow rack inventory to determine
if there is enough available. If not, SCALE will request the product in Case
increment (round up) to be replenished to each pick primary bins.
If the demand is greater than the Capacity of flow rack location, then SCALE will
direct the additional inventory into empty dynamic active locations.
Case demand from the wave is evaluated against the pallet rack location inventory
to determine if there is enough available. If not, SCALE will request the product in
Pallet increment (round up) to be replenished to pallet rack locations.
If the demand is greater than the Capacity of pallet rack location, then SCALE will
direct the additional inventory into empty dynamic active locations.
Note: Knipper utilizes both dynamic and permanent locations at Pick to Light and
other primary locations at multiple areas (MSM, 3PL, DEA, Refrigerated and Freezer) of
the warehouse. There will be multiple Replenishment masters created for the replenishment
of all the areas of the warehouse.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 54 of 119						
```

<a id="p055-b001"></a>
## p055\-b001 — PDF page 55, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p055-b002"></a>
## p055\-b002 — PDF page 55, block 2

```text
 

```

<a id="p055-b003"></a>
## p055\-b003 — PDF page 55, block 3

```text
13.2 
Capacity Replenishment 
 

```

<a id="p055-b004"></a>
## p055\-b004 — PDF page 55, block 4

```text
Commented [SM192]: KMW - replenishes at case 
UOM not always EA.  Would this be driven at the 
item config? 

```

<a id="p055-b005"></a>
## p055\-b005 — PDF page 55, block 5

```text
Commented [NC193R192]: NC 11/13: This can be 
resolved - this is done at the replenished level 

```

<a id="p055-b006"></a>
## p055\-b006 — PDF page 55, block 6

```text
Capacity based manual replenishment is utilized at Knipper (Lean time 
replenishment) daily. Manual replenishment is kicked off when requested by the 
user from the Inventory Insight and through Scheduled Jobs. SCALE requests 
the product in EA increment (Fill location) for primary bin locations based on the 
selected replenishment master(s). Inbound teams execute this capacity based 
replenishment.  
 
Note: Knipper will utilize scheduled jobs for manual replenishment 
 

```

<a id="p055-b007"></a>
## p055\-b007 — PDF page 55, block 7

```text
 
Figure - Manual Replenishment 

```

<a id="p055-b008"></a>
## p055\-b008 — PDF page 55, block 8

```text
 

```

<a id="p055-b009"></a>
## p055\-b009 — PDF page 55, block 9

```text
 
Figure - Manual Replenishment selection 

```

<a id="p055-b010"></a>
## p055\-b010 — PDF page 55, block 10

```text
 
 
When manual replenishment runs, it evaluates all permanent active locations and 
attempts to replenish any location that is below its configured minimum percent.  
Replenishment Allocation Rules, Item Criteria, and Allocation Strategies are 
configured to direct replenishment to the appropriate primary bin locations. 
 
Note: To utilize Capacity based replenishment, Item location assignment and Item 
location capacity configurations should be present in SCALE. 

```

<a id="p055-b011"></a>
## p055\-b011 — PDF page 55, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 55 of 119 
 

```

<a id="p055-t001"></a>
## p055\-t001 — PDF page 55, detected table 1

```text
				MENT
Commented [SM192]: KMW - replenishes at case
UOM not always EA. Would this be driven at the
item config?
Commented [NC193R192]: NC 11/13: This can be
resolved - this is done at the replenished level	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
13.2 Capacity Replenishment
Capacity based manual replenishment is utilized at Knipper (Lean time
replenishment) daily. Manual replenishment is kicked off when requested by the
user from the Inventory Insight and through Scheduled Jobs. SCALE requests
the product in EA increment (Fill location) for primary bin locations based on the
selected replenishment master(s). Inbound teams execute this capacity based
replenishment.
Note: Knipper will utilize scheduled jobs for manual replenishment
Figure - Manual Replenishment
Figure - Manual Replenishment selection
When manual replenishment runs, it evaluates all permanent active locations and
attempts to replenish any location that is below its configured minimum percent.
Replenishment Allocation Rules, Item Criteria, and Allocation Strategies are
configured to direct replenishment to the appropriate primary bin locations.
Note: To utilize Capacity based replenishment, Item location assignment and Item
location capacity configurations should be present in SCALE.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 55 of 119					
```

<a id="p056-b001"></a>
## p056\-b001 — PDF page 56, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p056-b002"></a>
## p056\-b002 — PDF page 56, block 2

```text
 

```

<a id="p056-b003"></a>
## p056\-b003 — PDF page 56, block 3

```text
 
 

```

<a id="p056-b004"></a>
## p056\-b004 — PDF page 56, block 4

```text
Commented [SM194]: How is this different from 
Demand Replenishments?  Or is this a hybrid of 
demand and capacity for non-perm locns? 

```

<a id="p056-b005"></a>
## p056\-b005 — PDF page 56, block 5

```text
 
13.3 
Real Time Replenishment   
 
Threshold based real time replenishment is not leveraged for the go live. Over 
time, Knipper will evaluate this and may use it.  
 
The need to replenish is evaluated against the primary picking locations to 
determine if there is enough available. If the quantity in the forward pick floor 
locations is below the minimum replenishment threshold percentage configured, 
SCALE will request the product in configured increments of UM. 
 

```

<a id="p056-b006"></a>
## p056\-b006 — PDF page 56, block 6

```text
Commented [NC195R194]: NC 11/13: No action is 
needed 
Manual 
You must execute a replenishment attempt on the 
Location Explorer Window. When the user chooses the 
Replenishment option from the Location Explorer, this 
replenishment master will appear in the window for 
selection to be run. The user will have to check this 
replenishment master for it to be run. 
  
Real Time 
The system will run replenishment (via a scheduled 
job) throughout the day, for locations that would 
typically need frequent replenishment (you can make a 
location eligible for this on the Location Window). The 
replenishment process will run quicker than usual 
because the system will check for replenishment need 
only the locations that actually are currently in the need 
of replenishment, and ignore the ones that do not 
currently need replenishing. 
  
This type of replenishment is helpful because you can 
have replenishment masters running throughout the 
day, and keep your forward picking locations full for 
order processing. 
  
Wave 
The system will automatically execute a replenishment 
attempt during the wave cycle. Whenever any launch is 
run that has Replenishment as a step in its launch flow, 
then this replenishment master will be executed. 

```

<a id="p056-b007"></a>
## p056\-b007 — PDF page 56, block 7

```text
 
Figure – Item Location Capacity with Replenishment percentage 

```

<a id="p056-b008"></a>
## p056\-b008 — PDF page 56, block 8

```text
 
 

```

<a id="p056-b009"></a>
## p056\-b009 — PDF page 56, block 9

```text
Commented [SM196]: Wouldnt the waves trigger 
the demand replen? 

```

<a id="p056-b010"></a>
## p056\-b010 — PDF page 56, block 10

```text
Commented [NC197R196]: NC 11/13: This is resolved 

```

<a id="p056-b011"></a>
## p056\-b011 — PDF page 56, block 11

```text
Since demand replenishment runs throughout the day in advance to the waves, 
adding real time replenishment at the same time may bring more than required 
inventory to the forward locations causing operational challenges. When setup, 
Knipper leverages real time replenishment for fast-moving items on a scheduled 
basis, 
and 
leverages 
alerts/reporting 
to monitor 
open capacity-based 
replenishment and delete those open replenishments request. 
 
 
 

```

<a id="p056-b012"></a>
## p056\-b012 — PDF page 56, block 12

```text
 

```

<a id="p056-b013"></a>
## p056\-b013 — PDF page 56, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 56 of 119 
 

```

<a id="p056-t001"></a>
## p056\-t001 — PDF page 56, detected table 1

```text
					MENT
Commented [SM194]: How is this different from
Demand Replenishments? Or is this a hybrid of
demand and capacity for non-perm locns?
Commented [NC195R194]: NC 11/13: No action is
needed
Manual
You must execute a replenishment attempt on the
Location Explorer Window. When the user chooses the
Replenishment option from the Location Explorer, this
replenishment master will appear in the window for
selection to be run. The user will have to check this
replenishment master for it to be run.
Real Time
The system will run replenishment (via a scheduled
job) throughout the day, for locations that would
typically need frequent replenishment (you can make a
location eligible for this on the Location Window). The
replenishment process will run quicker than usual
because the system will check for replenishment need
only the locations that actually are currently in the need
of replenishment, and ignore the ones that do not
currently need replenishing.
This type of replenishment is helpful because you can
have replenishment masters running throughout the
day, and keep your forward picking locations full for
order processing.
Wave
The system will automatically execute a replenishment
attempt during the wave cycle. Whenever any launch is
run that has Replenishment as a step in its launch flow,
then this replenishment master will be executed.
Commented [SM196]: Wouldnt the waves trigger
the demand replen?
Commented [NC197R196]: NC 11/13: This is resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
13.3 Real Time Replenishment
Threshold based real time replenishment is not leveraged for the go live. Over
time, Knipper will evaluate this and may use it.
The need to replenish is evaluated against the primary picking locations to
determine if there is enough available. If the quantity in the forward pick floor
locations is below the minimum replenishment threshold percentage configured,
SCALE will request the product in configured increments of UM.
Figure – Item Location Capacity with Replenishment percentage
Since demand replenishment runs throughout the day in advance to the waves,
adding real time replenishment at the same time may bring more than required
inventory to the forward locations causing operational challenges. When setup,
Knipper leverages real time replenishment for fast-moving items on a scheduled
basis, and leverages alerts/reporting to monitor open capacity-based
replenishment and delete those open replenishments request.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 56 of 119						
```

<a id="p057-b001"></a>
## p057\-b001 — PDF page 57, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p057-b002"></a>
## p057\-b002 — PDF page 57, block 2

```text
 

```

<a id="p057-b003"></a>
## p057\-b003 — PDF page 57, block 3

```text
13.4 
Replenishment Allocation   
 
Knipper’ allocation for replenishment is to attempt to allocate using First Expiration First 
Out for lot tracked items, and available most available first for non-lot tracked items, that 
fills the entire forward location from the rack location. The rules are ported over from the 
existing setup. 
 

```

<a id="p057-b004"></a>
## p057\-b004 — PDF page 57, block 4

```text
Commented [SG198]: What is KDC and ODW? 

```

<a id="p057-b005"></a>
## p057\-b005 — PDF page 57, block 5

```text
 
Zone 
Description 
1 
PM Locations (KMW, 
KDC and OHW) – EA 
Pick 

```

<a id="p057-b006"></a>
## p057\-b006 — PDF page 57, block 6

```text
Commented [NC199R198]: NC 11/13: updated from 
ODW to OHW 

```

<a id="p057-b007"></a>
## p057\-b007 — PDF page 57, block 7

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
2 
PM Locations (KMW, 
KDC and OHW) – CS 
Pick 

```

<a id="p057-b008"></a>
## p057\-b008 — PDF page 57, block 8

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
3 
PTL Locations (KMW, 
KDC and OHW) – EA 
Pick 

```

<a id="p057-b009"></a>
## p057\-b009 — PDF page 57, block 9

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
4 
PTL Locations (KMW, 
KDC and OHW) – CS 
Pick 

```

<a id="p057-b010"></a>
## p057\-b010 — PDF page 57, block 10

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
5 
3PL PM Locations – EA 
and CS 

```

<a id="p057-b011"></a>
## p057\-b011 — PDF page 57, block 11

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
6 
3PL Case Pick 
Locations  

```

<a id="p057-b012"></a>
## p057\-b012 — PDF page 57, block 12

```text
• 
Single Item 
• 
Permanently Assigned 
• 
No License Plate Tracking 
• 
Single Lot 
• 
Allocate In Transit - Y 
7 
DEA PM Locations 
(KMW, KDC and OHW) 

```

<a id="p057-b013"></a>
## p057\-b013 — PDF page 57, block 13

```text
• 
Single Item 
• 
Dynamically Assigned 
• 
License Plate Tracking 
• 
Single Lot 
• 
Allocate in Transit - Y 

```

<a id="p057-b014"></a>
## p057\-b014 — PDF page 57, block 14

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 57 of 119 
 

```

<a id="p057-t001"></a>
## p057\-t001 — PDF page 57, detected table 1

```text
				MENT
Commented [SG198]: What is KDC and ODW?
Commented [NC199R198]: NC 11/13: updated from
ODW to OHW	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
13.4 Replenishment Allocation
Knipper’ allocation for replenishment is to attempt to allocate using First Expiration First
Out for lot tracked items, and available most available first for non-lot tracked items, that
fills the entire forward location from the rack location. The rules are ported over from the
existing setup.
Zone Description
1 PM Locations (KMW, • Single Item
KDC and OHW) – EA • Permanently Assigned
Pick • No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
2 PM Locations (KMW, • Single Item
KDC and OHW) – CS • Permanently Assigned
Pick • No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
3 PTL Locations (KMW, • Single Item
KDC and OHW) – EA • Permanently Assigned
Pick • No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
4 PTL Locations (KMW, • Single Item
KDC and OHW) – CS • Permanently Assigned
Pick • No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
5 3PL PM Locations – EA • Single Item
and CS • Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
6 3PL Case Pick • Single Item
Locations • Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y
7 DEA PM Locations • Single Item
(KMW, KDC and OHW) • Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 57 of 119					
```

<a id="p057-t002"></a>
## p057\-t002 — PDF page 57, detected table 2

```text
			Zone			Description	
1		PM Locations (KMW,
KDC and OHW) – EA
Pick			• Single Item
• Permanently Assigned		
					• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
2		PM Locations (KMW,
KDC and OHW) – CS
Pick			• Single Item
• Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
3		PTL Locations (KMW,
KDC and OHW) – EA
Pick			• Single Item
• Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
4		PTL Locations (KMW,
KDC and OHW) – CS
Pick			• Single Item
• Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
5		3PL PM Locations – EA
and CS			• Single Item
• Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
6		3PL Case Pick
Locations			• Single Item
• Permanently Assigned
• No License Plate Tracking
• Single Lot
• Allocate In Transit - Y		
7		DEA PM Locations
(KMW, KDC and OHW)			• Single Item
• Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y		
```

<a id="p057-t003"></a>
## p057\-t003 — PDF page 57, detected table 3

```text
	KMW,
KDC and OHW	
```

<a id="p058-b001"></a>
## p058\-b001 — PDF page 58, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p058-b002"></a>
## p058\-b002 — PDF page 58, block 2

```text
 

```

<a id="p058-b003"></a>
## p058\-b003 — PDF page 58, block 3

```text
8 
DTP Refrigerated PM 
(KMW, KDC and OHW) 

```

<a id="p058-b004"></a>
## p058\-b004 — PDF page 58, block 4

```text
• 
Single Item 
• 
Dynamically Assigned 
• 
License Plate Tracking 
• 
Single Lot 
• 
Allocate in Transit - Y 
9 
DTP Freezer PM (KMW, 
KDC and OHW) 

```

<a id="p058-b005"></a>
## p058\-b005 — PDF page 58, block 5

```text
• 
Single Item 
• 
Dynamically Assigned 
• 
License Plate Tracking 
• 
Single Lot 
• 
Allocate in Transit - Y 
 
 

```

<a id="p058-b006"></a>
## p058\-b006 — PDF page 58, block 6

```text
Replenishment Allocation: 
 
  Lot tracked Items - CS 

```

<a id="p058-b007"></a>
## p058\-b007 — PDF page 58, block 7

```text
Sequence 
Strategy 
Location Selection 
Eligible UMs 

```

<a id="p058-b008"></a>
## p058\-b008 — PDF page 58, block 8

```text
Commented [MA200]: Are we going to use the term 
"general" here over "controlled room temp?" 
 

```

<a id="p058-b009"></a>
## p058\-b009 — PDF page 58, block 9

```text
10 
First Expiration, First Out 

```

<a id="p058-b010"></a>
## p058\-b010 — PDF page 58, block 10

```text
Commented [NC201R200]: NC 11/13: We can update 
with the correct verbiage and remove General  

```

<a id="p058-b011"></a>
## p058\-b011 — PDF page 58, block 11

```text
Reserve (General, DEA, 
Refrigerated, Freezer 
and 3PL) 
CS 
.  
  Lot tracked Items - PL 

```

<a id="p058-b012"></a>
## p058\-b012 — PDF page 58, block 12

```text
Sequence 
Strategy 
Location Selection 
Eligible UMs 

```

<a id="p058-b013"></a>
## p058\-b013 — PDF page 58, block 13

```text
Commented [202R200]: We do not want to remove 
"general" due to legacy products. 

```

<a id="p058-b014"></a>
## p058\-b014 — PDF page 58, block 14

```text
10 
First Expiration, First Out 

```

<a id="p058-b015"></a>
## p058\-b015 — PDF page 58, block 15

```text
Reserve (General, 
DEA, Refrigerated, 
Freezer and 3PL) 
PL 
 
           Non lot tracked items - CS 

```

<a id="p058-b016"></a>
## p058\-b016 — PDF page 58, block 16

```text
Sequence 
Strategy 
Location Selection 
Eligible UMs 

```

<a id="p058-b017"></a>
## p058\-b017 — PDF page 58, block 17

```text
10 
First In, First Out 

```

<a id="p058-b018"></a>
## p058\-b018 — PDF page 58, block 18

```text
Reserve (General, 
DEA, Refrigerated, 
Freezer and 3PL) 
CS 
 
 
           Non lot tracked items - PL 

```

<a id="p058-b019"></a>
## p058\-b019 — PDF page 58, block 19

```text
Sequence 
Strategy 
Location Selection 
Eligible UMs 

```

<a id="p058-b020"></a>
## p058\-b020 — PDF page 58, block 20

```text
10 
First In, First Out 

```

<a id="p058-b021"></a>
## p058\-b021 — PDF page 58, block 21

```text
Reserve (General, 
DEA, Refrigerated, 
Freezer and 3PL) 
PL 
 
 
 Note: The existing replenishment rules are ported over for Knipper and during the build 
phase Knipper evaluates all replenishment masters and allocation rule for other item 
categories as well. 
 

```

<a id="p058-b022"></a>
## p058\-b022 — PDF page 58, block 22

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 58 of 119 
 

```

<a id="p058-t001"></a>
## p058\-t001 — PDF page 58, detected table 1

```text
					MENT
Commented [MA200]: Are we going to use the term
"general" here over "controlled room temp?"
Commented [NC201R200]: NC 11/13: We can update
with the correct verbiage and remove General
Commented [202R200]: We do not want to remove
"general" due to legacy products.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
8 DTP Refrigerated PM • Single Item
(KMW, KDC and OHW) • Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y
9 DTP Freezer PM (KMW, • Single Item
KDC and OHW) • Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y
Replenishment Allocation:
Lot tracked Items - CS
Sequence Strategy Location Selection Eligible UMs
Reserve (General, DEA,
Refrigerated, Freezer
10 First Expiration, First Out and 3PL) CS
.
Lot tracked Items - PL
Sequence Strategy Location Selection Eligible UMs
Reserve (General,
DEA, Refrigerated,
10 First Expiration, First Out Freezer and 3PL) PL
Non lot tracked items - CS
Sequence Strategy Location Selection Eligible UMs
Reserve (General,
DEA, Refrigerated,
10 First In, First Out Freezer and 3PL) CS
Non lot tracked items - PL
Sequence Strategy Location Selection Eligible UMs
Reserve (General,
DEA, Refrigerated,
10 First In, First Out Freezer and 3PL) PL
Note: The existing replenishment rules are ported over for Knipper and during the build
phase Knipper evaluates all replenishment masters and allocation rule for other item
categories as well.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 58 of 119						
```

<a id="p058-t002"></a>
## p058\-t002 — PDF page 58, detected table 2

```text
8	DTP Refrigerated PM
(KMW, KDC and OHW)	• Single Item
• Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y
9	DTP Freezer PM (KMW,
KDC and OHW)	• Single Item
• Dynamically Assigned
• License Plate Tracking
• Single Lot
• Allocate in Transit - Y
```

<a id="p058-t003"></a>
## p058\-t003 — PDF page 58, detected table 3

```text
	Sequence			Strategy			Location Selection					Eligible UMs		
10			First Expiration, First Out			Reserve (General, DEA,
Refrigerated, Freezer
and 3PL)		General	, DEA,		CS			
```

<a id="p058-t004"></a>
## p058\-t004 — PDF page 58, detected table 4

```text
	Sequence			Strategy			Location Selection			Eligible UMs	
10			First Expiration, First Out			Reserve (General,
DEA, Refrigerated,
Freezer and 3PL)			PL		
```

<a id="p058-t005"></a>
## p058\-t005 — PDF page 58, detected table 5

```text
	Sequence			Strategy			Location Selection			Eligible UMs	
10			First In, First Out			Reserve (General,
DEA, Refrigerated,
Freezer and 3PL)			CS		
```

<a id="p058-t006"></a>
## p058\-t006 — PDF page 58, detected table 6

```text
	Sequence			Strategy			Location Selection			Eligible UMs	
10			First In, First Out			Reserve (General,
DEA, Refrigerated,
Freezer and 3PL)			PL		
```

<a id="p059-b001"></a>
## p059\-b001 — PDF page 59, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p059-b002"></a>
## p059\-b002 — PDF page 59, block 2

```text
 

```

<a id="p059-b003"></a>
## p059\-b003 — PDF page 59, block 3

```text
Commented [MA203]: Is this separate from the 
web-based scale? How are we able to make these 
changes and have them update into the web-based 
scale? 

```

<a id="p059-b004"></a>
## p059\-b004 — PDF page 59, block 4

```text
Commented [NC204R203]: NC11182024: This is 
resolved. 

```

<a id="p059-b005"></a>
## p059\-b005 — PDF page 59, block 5

```text
 
 
13.5 
Replenishment Work Creation   
 
The replenishment work creation process is like the work creation process performed during 
the locating portion of the receiving process.  After performing replenishment, SCALE 
creates a Work Unit to pick the inventory from its reserve location and transport it to Primary 
bins or dynamic active locations.  Based on the configuration in the Work Group, Work 
Type, Work Criteria, and Work Creation Master, the system analyzes, sorts, and bundles 
the replenishment requests to create a Work Unit. This Work Unit consists of only one items 
from one storage or reserve locations.   
 
Most DCs create replenishment work based on Hi or Low zones. However, this is not a 
standardized setup and DCs may change this on their discretion. Manhattan recommends 
to have standardized replenishment masters for layout and/or operating profiles. 
 

```

<a id="p059-b006"></a>
## p059\-b006 — PDF page 59, block 6

```text
 
Figure – Replenishment work criteria 
 
 

```

<a id="p059-b007"></a>
## p059\-b007 — PDF page 59, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 59 of 119 
 

```

<a id="p059-t001"></a>
## p059\-t001 — PDF page 59, detected table 1

```text
					MENT
Commented [MA203]: Is this separate from the
web-based scale? How are we able to make these
changes and have them update into the web-based
scale?
Commented [NC204R203]: NC11182024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
13.5 Replenishment Work Creation
The replenishment work creation process is like the work creation process performed during
the locating portion of the receiving process. After performing replenishment, SCALE
creates a Work Unit to pick the inventory from its reserve location and transport it to Primary
bins or dynamic active locations. Based on the configuration in the Work Group, Work
Type, Work Criteria, and Work Creation Master, the system analyzes, sorts, and bundles
the replenishment requests to create a Work Unit. This Work Unit consists of only one items
from one storage or reserve locations.
Most DCs create replenishment work based on Hi or Low zones. However, this is not a
standardized setup and DCs may change this on their discretion. Manhattan recommends
to have standardized replenishment masters for layout and/or operating profiles.
Figure – Replenishment work criteria
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 59 of 119						
```

<a id="p060-b001"></a>
## p060\-b001 — PDF page 60, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p060-b002"></a>
## p060\-b002 — PDF page 60, block 2

```text
 

```

<a id="p060-b003"></a>
## p060\-b003 — PDF page 60, block 3

```text
 
Figure – Existing replenishment work criteria – Hi Zone 
 

```

<a id="p060-b004"></a>
## p060\-b004 — PDF page 60, block 4

```text
 
Figure – Replenishment work criteria 
 
 
Replenishment work created in the wave will have a higher priority than the replenishment 
work created by manually capacity based replenishments. The user then receive this 
replenishment work first, as replenishment is system directed work in most work profiles 
configured currently.  
 
13.6 
Replenishment Work Execution  
 
 

```

<a id="p060-b005"></a>
## p060\-b005 — PDF page 60, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 60 of 119 
 

```

<a id="p060-t001"></a>
## p060\-t001 — PDF page 60, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Existing replenishment work criteria – Hi Zone
Figure – Replenishment work criteria
Replenishment work created in the wave will have a higher priority than the replenishment
work created by manually capacity based replenishments. The user then receive this
replenishment work first, as replenishment is system directed work in most work profiles
configured currently.
13.6 Replenishment Work Execution
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 60 of 119						
```

<a id="p061-b001"></a>
## p061\-b001 — PDF page 61, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p061-b002"></a>
## p061\-b002 — PDF page 61, block 2

```text
 

```

<a id="p061-b003"></a>
## p061\-b003 — PDF page 61, block 3

```text
Replenishment work is performed within SCALE as System Directed work. Users sign onto 
an RF warehouse mobile device and choose the RF Work option. Users then choose the 
Demand Replenishment or Capacity Replenishment work profile.  The user is then 
prompted to scan a location for SCALE to assign a Work Unit in closest proximity. The user 
is assigned a Work Unit and SCALE then presents the user with the first pick which displays 
the location, item, and quantity to be picked.  Users are required to verify the pick by 
scanning the location check digit and then hitting OK.  Once all the picks have been 
completed (all picks can be any number of items – this is defined by Knipper), SCALE 
displays a putaway screen where the user confirms the putaway to forward pick location(s) 
that the inventory should be stored in.  These forward pick locations can also force 
validation from the user (this is configurable – location or check digit validation).  After this, 
the user can be assigned the next Work Unit. 
 

```

<a id="p061-b004"></a>
## p061\-b004 — PDF page 61, block 4

```text
 
Figure - Replenishment Work Execution 

```

<a id="p061-b005"></a>
## p061\-b005 — PDF page 61, block 5

```text
Once the Replenishment Work is completed the inventory will be available at the pick face 
location. The inventory on the pick location is then available for shipment picking. 
 
14.0 WORK ORDERS 
 

```

<a id="p061-b006"></a>
## p061\-b006 — PDF page 61, block 6

```text
Knipper use work orders in the manufacturing facilities to build finished items.  

```

<a id="p061-b007"></a>
## p061\-b007 — PDF page 61, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 61 of 119 
 

```

<a id="p061-t001"></a>
## p061\-t001 — PDF page 61, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Replenishment work is performed within SCALE as System Directed work. Users sign onto
an RF warehouse mobile device and choose the RF Work option. Users then choose the
Demand Replenishment or Capacity Replenishment work profile. The user is then
prompted to scan a location for SCALE to assign a Work Unit in closest proximity. The user
is assigned a Work Unit and SCALE then presents the user with the first pick which displays
the location, item, and quantity to be picked. Users are required to verify the pick by
scanning the location check digit and then hitting OK. Once all the picks have been
completed (all picks can be any number of items – this is defined by Knipper), SCALE
displays a putaway screen where the user confirms the putaway to forward pick location(s)
that the inventory should be stored in. These forward pick locations can also force
validation from the user (this is configurable – location or check digit validation). After this,
the user can be assigned the next Work Unit.
Figure - Replenishment Work Execution
Once the Replenishment Work is completed the inventory will be available at the pick face
location. The inventory on the pick location is then available for shipment picking.
14.0 WORK ORDERS
Knipper use work orders in the manufacturing facilities to build finished items.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 61 of 119						
```

<a id="p062-b001"></a>
## p062\-b001 — PDF page 62, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p062-b002"></a>
## p062\-b002 — PDF page 62, block 2

```text
 

```

<a id="p062-b003"></a>
## p062\-b003 — PDF page 62, block 3

```text
Commented [SM205]: BOM is in scope. 
 
KMW: PO is dropped into scale.  - Abbvie is 
integrated. 

```

<a id="p062-b004"></a>
## p062\-b004 — PDF page 62, block 4

```text
Commented [NC206R205]: NC11182024: BOM is in 
scope - MAH to confirm the comment BOM is not in 
scope 

```

<a id="p062-b005"></a>
## p062\-b005 — PDF page 62, block 5

```text
Commented [RS207R205]: Updated the description 

```

<a id="p062-b006"></a>
## p062\-b006 — PDF page 62, block 6

```text
Commented [NC208R205]: NC12042024: This is 
resolved. 

```

<a id="p062-b007"></a>
## p062\-b007 — PDF page 62, block 7

```text
Commented [CC209]: OHW manually enters work 
orders for production kitting and labeling work. Work 
orders are also Loaded into SCALE from our internal 
OMS 
not sure what this is referring to 
 

```

<a id="p062-b008"></a>
## p062\-b008 — PDF page 62, block 8

```text
Commented [NC210R209]: NC11182024: resolved. 

```

<a id="p062-b009"></a>
## p062\-b009 — PDF page 62, block 9

```text
15.0 BILL OF MATERIALS (BOM) 
 
BOM will be used as part of this implementation. Knipper will own the configuration of BOM as 
required. The BOM is used when work order is manually created in SCALE. The component items 
are sent on the work order when they are downloaded to SCALE.  
 
16.0 WORK ORDER CREATION 
 
Work orders for manufacturing finished goods will be interfaced from Host to SCALE. The work 
order will include the finished item to be built and the quantity to be built. Work order will not have 
the build location information. User needs to update the build location before they allocate the 
work order. 
 
17.0 COMPONENT PULLING 
 
Once the work order exists in SCALE, it can be allocated whenever Knipper is ready to work on 
it. To allocate a work order, users will go to the Work Order Insight, select the work order, and 
choose the Allocate all option. Allocating the work order initiates the allocation and work creation 
that is required to bring forward all required components to the designated build area. Once all 
the allocations and work created are verified, users will release the work order to commence the 
next steps in building the finished items. 
 

```

<a id="p062-b010"></a>
## p062\-b010 — PDF page 62, block 10

```text
Commented [CC211]: please explain we create the 
BOM docs in OHW 

```

<a id="p062-b011"></a>
## p062\-b011 — PDF page 62, block 11

```text
Commented [SM212R211]: SOP 105 A 

```

<a id="p062-b012"></a>
## p062\-b012 — PDF page 62, block 12

```text
Commented [NC213R211]: NC11182024: resolved.  

```

<a id="p062-b013"></a>
## p062\-b013 — PDF page 62, block 13

```text
Commented [SM214]: KMW:  When adding 
components to master BOM, asks for allocation rule.  
Allocate all in BOM fails because the allocation rule 
is on the line level.  Must be removed. 

```

<a id="p062-b014"></a>
## p062\-b014 — PDF page 62, block 14

```text
Commented [NC215R214]: NC11182024: MAH to 
confirm if this can be automated and not manual. Pull 
allocation from reserved location.  

```

<a id="p062-b015"></a>
## p062\-b015 — PDF page 62, block 15

```text
 
Figure: Work Order insight – Release Option 

```

<a id="p062-b016"></a>
## p062\-b016 — PDF page 62, block 16

```text
Commented [RS216R214]: SCALE can be configured 
to automatically allocate upon Release. As long as the 
allocation rules are correct, this should work as 
expected. 

```

<a id="p062-b017"></a>
## p062\-b017 — PDF page 62, block 17

```text
Commented [NC217R214]: NC12042024: This is 
resolved. 

```

<a id="p062-b018"></a>
## p062\-b018 — PDF page 62, block 18

```text
 
The allocation and work creation work the exact same as the standard shipment allocation within 
SCALE. Each component will have an allocation rule, which defines how component inventory 
should be pulled from the warehouse.  
 

```

<a id="p062-b019"></a>
## p062\-b019 — PDF page 62, block 19

```text
Component Allocation: 
 

```

<a id="p062-b020"></a>
## p062\-b020 — PDF page 62, block 20

```text
Sequence 
Strategy 
Location Selection 
Eligible UMs 

```

<a id="p062-b021"></a>
## p062\-b021 — PDF page 62, block 21

```text
10 
First in First Out 

```

<a id="p062-b022"></a>
## p062\-b022 — PDF page 62, block 22

```text
A-General Reserve – 
Non-Lot 

```

<a id="p062-b023"></a>
## p062\-b023 — PDF page 62, block 23

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 62 of 119 
 

```

<a id="p062-t001"></a>
## p062\-t001 — PDF page 62, detected table 1

```text
					MENT
Commented [SM205]: BOM is in scope.
KMW: PO is dropped into scale. - Abbvie is
integrated.
Commented [NC206R205]: NC11182024: BOM is in
scope - MAH to confirm the comment BOM is not in
scope
Commented [RS207R205]: Updated the description
Commented [NC208R205]: NC12042024: This is
resolved.
Commented [CC209]: OHW manually enters work
orders for production kitting and labeling work. Work
orders are also Loaded into SCALE from our internal
OMS
not sure what this is referring to
Commented [NC210R209]: NC11182024: resolved.
Commented [CC211]: please explain we create the
BOM docs in OHW
Commented [SM212R211]: SOP 105 A
Commented [NC213R211]: NC11182024: resolved.
Commented [SM214]: KMW: When adding
components to master BOM, asks for allocation rule.
Allocate all in BOM fails because the allocation rule
is on the line level. Must be removed.
Commented [NC215R214]: NC11182024: MAH to
confirm if this can be automated and not manual. Pull
allocation from reserved location.
Commented [RS216R214]: SCALE can be configured
to automatically allocate upon Release. As long as the
allocation rules are correct, this should work as
expected.
Commented [NC217R214]: NC12042024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
15.0 BILL OF MATERIALS (BOM)
BOM will be used as part of this implementation. Knipper will own the configuration of BOM as
required. The BOM is used when work order is manually created in SCALE. The component items
are sent on the work order when they are downloaded to SCALE.
16.0 WORK ORDER CREATION
Work orders for manufacturing finished goods will be interfaced from Host to SCALE. The work
order will include the finished item to be built and the quantity to be built. Work order will not have
the build location information. User needs to update the build location before they allocate the
work order.
17.0 COMPONENT PULLING
Once the work order exists in SCALE, it can be allocated whenever Knipper is ready to work on
it. To allocate a work order, users will go to the Work Order Insight, select the work order, and
choose the Allocate all option. Allocating the work order initiates the allocation and work creation
that is required to bring forward all required components to the designated build area. Once all
the allocations and work created are verified, users will release the work order to commence the
next steps in building the finished items.
Figure: Work Order insight – Release Option
The allocation and work creation work the exact same as the standard shipment allocation within
SCALE. Each component will have an allocation rule, which defines how component inventory
should be pulled from the warehouse.
Component Allocation:
Sequence Strategy Location Selection Eligible UMs
A-General Reserve –
10 First in First Out Non-Lot
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 62 of 119						
```

<a id="p062-t002"></a>
## p062\-t002 — PDF page 62, detected table 2

```text
BOM will be used as part of this implementation. Knipper will own the configuration of BOM as	
required. The BOM is used when work order is manually created in SCALE. The component items	
are sent on the work order when they are downloaded to SCALE.	
```

<a id="p062-t003"></a>
## p062\-t003 — PDF page 62, detected table 3

```text
	Sequence			Strategy			Location Selection			Eligible UMs	
10			First in First Out			A-General Reserve –
Non-Lot					
```

<a id="p063-b001"></a>
## p063\-b001 — PDF page 63, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p063-b002"></a>
## p063\-b002 — PDF page 63, block 2

```text
 

```

<a id="p063-b003"></a>
## p063\-b003 — PDF page 63, block 3

```text
20 
First Expiration First Out 

```

<a id="p063-b004"></a>
## p063\-b004 — PDF page 63, block 4

```text
A-General Reserve - 
Lot 
 
 
Work is created and executed for these allocations in the same fashion as other work creation 
within SCALE. Below is a sample Work Creation Master for component pulls.  
 

```

<a id="p063-b005"></a>
## p063\-b005 — PDF page 63, block 5

```text
 
Figure: WO Component Pulls work creation master 

```

<a id="p063-b006"></a>
## p063\-b006 — PDF page 63, block 6

```text
Knipper will be creating work units by following rule: 
 
For Component picks, one work unit is created per work order. 
 
Component pulls will be executed via user directed work. This work can be done separately via a 
Component Pulling work profile.  
 

```

<a id="p063-b007"></a>
## p063\-b007 — PDF page 63, block 7

```text
Commented [SM218]: Need the current RF details 
displayed.  (Lot number, expiration date, qty 
conversion, etc.) 

```

<a id="p063-b008"></a>
## p063\-b008 — PDF page 63, block 8

```text
Commented [NC219R218]: NC11182024: MAH to add 

```

<a id="p063-b009"></a>
## p063\-b009 — PDF page 63, block 9

```text
Commented [RS220R218]: The lot will be displayed 
on the screen. The Expiration date and conversion are 
not. 

```

<a id="p063-b010"></a>
## p063\-b010 — PDF page 63, block 10

```text
Commented [NC221R218]: NC12042024: This is 
resolved 

```

<a id="p063-b011"></a>
## p063\-b011 — PDF page 63, block 11

```text
 
Figure: Component Pull work execution 

```

<a id="p063-b012"></a>
## p063\-b012 — PDF page 63, block 12

```text
17.1 Component allocation failures 
 
If for some reason the entire component allocation fails, SCALE displays the allocation failure 
message and moves the work order into In process folder. Here the user will review the reason 
for allocation failure and once the inventory is fixed, user can navigate to the component section 
of the work order and select Allocate All option to re-allocate the components. 
 
If for some reason, only few component allocations fail then SCALE moves the work order into In 
Process folder and create work for components that allocated successfully. User can review the 
reason for component failure and fix the inventory. User can navigate to component section and 

```

<a id="p063-b013"></a>
## p063\-b013 — PDF page 63, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 63 of 119 
 

```

<a id="p063-t001"></a>
## p063\-t001 — PDF page 63, detected table 1

```text
					MENT
Commented [SM218]: Need the current RF details
displayed. (Lot number, expiration date, qty
conversion, etc.)
Commented [NC219R218]: NC11182024: MAH to add
Commented [RS220R218]: The lot will be displayed
on the screen. The Expiration date and conversion are
not.
Commented [NC221R218]: NC12042024: This is
resolved
					
				KNIPPER SOLUTION DESIGN DOCU	MENT
					
A-General Reserve -
20 First Expiration First Out Lot
Work is created and executed for these allocations in the same fashion as other work creation
within SCALE. Below is a sample Work Creation Master for component pulls.
Figure: WO Component Pulls work creation master
Knipper will be creating work units by following rule:
For Component picks, one work unit is created per work order.
Component pulls will be executed via user directed work. This work can be done separately via a
Component Pulling work profile.
Figure: Component Pull work execution
17.1 Component allocation failures
If for some reason the entire component allocation fails, SCALE displays the allocation failure
message and moves the work order into In process folder. Here the user will review the reason
for allocation failure and once the inventory is fixed, user can navigate to the component section
of the work order and select Allocate All option to re-allocate the components.
If for some reason, only few component allocations fail then SCALE moves the work order into In
Process folder and create work for components that allocated successfully. User can review the
reason for component failure and fix the inventory. User can navigate to component section and
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 63 of 119					
```

<a id="p063-t002"></a>
## p063\-t002 — PDF page 63, detected table 2

```text
20	First Expiration First Out	A-General Reserve -
Lot	
```

<a id="p063-t003"></a>
## p063\-t003 — PDF page 63, detected table 3

```text
	C
C
o
n
C
re		Commented [SM218]: Need the current RF details
displayed. (Lot number, expiration date, qty
conversion, etc.)
		C	ommented [NC219R218]: NC11182024: MAH to add
		C
o
n	ommented [RS220R218]: The lot will be displayed
n the screen. The Expiration date and conversion are
ot.
		C
re	ommented [NC221R218]: NC12042024: This is
solved
```

<a id="p064-b001"></a>
## p064\-b001 — PDF page 64, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p064-b002"></a>
## p064\-b002 — PDF page 64, block 2

```text
 

```

<a id="p064-b003"></a>
## p064\-b003 — PDF page 64, block 3

```text
Commented [SM222]: OHW: Once the work order 
is released then the users can start the work.  Need 
the release step included. 

```

<a id="p064-b004"></a>
## p064\-b004 — PDF page 64, block 4

```text
Commented [SM223R222]: OHW and KMW 
process is different.  KMW does transfer before 
allocation. 

```

<a id="p064-b005"></a>
## p064\-b005 — PDF page 64, block 5

```text
Commented [NC224R222]: NC11182024: MAH to 
confirm comment 

```

<a id="p064-b006"></a>
## p064\-b006 — PDF page 64, block 6

```text
select the component that failed allocation and select Allocate option to re-allocate the 
component. 
 
SCALE would use the ‘#’ symbol to differentiate duplicate work units. 
 
Since Component pull work is user initiated as soon as the work is created it is available for users 
to execute. Even with some component failing allocation, component pull work will be available 
to user if any components succeed allocation. Hence it is a good practice to use an SCI 
report/Inventory Insight to verify component inventory before releasing the work order. 
 
18.0 FINISHED GOODS CREATION 
 
As component materials arrive at the build location, finished goods can be built and processed in 
SCALE. To process the production, users will process as follows:  
 

```

<a id="p064-b007"></a>
## p064\-b007 — PDF page 64, block 7

```text
Commented [RS225R222]: The work order release is 
a must process to start the work. This is already 
mentioned in 17.0 section 

```

<a id="p064-b008"></a>
## p064\-b008 — PDF page 64, block 8

```text
Commented [NC226R222]: NC12042024: We need 
the ability release on the line item level. Just because 
we have an issue on 1 item it shouldn’t hold up the 
whole order 

```

<a id="p064-b009"></a>
## p064\-b009 — PDF page 64, block 9

```text
Commented [RS227R222]: The Release is at the 
Header level and it will not hold up other line items if 
there is any issue with one of the line items. If this is 
fine, please resolve. 

```

<a id="p064-b010"></a>
## p064\-b010 — PDF page 64, block 10

```text
• 
Go to the Work Order insight screen 
• 
Key/scan the Work Order ID 
• 
Press the Confirm button 
• 
Enter quantity built 
• 
Scan pre-printed license plate value for each putaway unit built and affix label to 
pallet  
 
The above process relieves the component inventory from SCALE and creates new finished 
goods inventory to be put away in stock.  
 

```

<a id="p064-b011"></a>
## p064\-b011 — PDF page 64, block 11

```text
Commented [SM228]: SCI? 

```

<a id="p064-b012"></a>
## p064\-b012 — PDF page 64, block 12

```text
Commented [NC229R228]: NC11182024: MAH to 
confirm what does SCI mean.  

```

<a id="p064-b013"></a>
## p064\-b013 — PDF page 64, block 13

```text
Commented [RS230R228]: SCI means Supply Chain 
Intelligence. It is a reporting tool. Alternatively, 
Inventory Insight can be used to verify the inventory 
before the release. 

```

<a id="p064-b014"></a>
## p064\-b014 — PDF page 64, block 14

```text
Commented [NC231R228]: NC12042024: This is 
resolved. 

```

<a id="p064-b015"></a>
## p064\-b015 — PDF page 64, block 15

```text
 
Figure: Work Order Insight Screen – Confirm Option 

```

<a id="p064-b016"></a>
## p064\-b016 — PDF page 64, block 16

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 64 of 119 
 

```

<a id="p064-t001"></a>
## p064\-t001 — PDF page 64, detected table 1

```text
					MENT
Commented [SM222]: OHW: Once the work order
is released then the users can start the work. Need
the release step included.
Commented [SM223R222]: OHW and KMW
process is different. KMW does transfer before
allocation.
Commented [NC224R222]: NC11182024: MAH to
confirm comment
Commented [RS225R222]: The work order release is
a must process to start the work. This is already
mentioned in 17.0 section
Commented [NC226R222]: NC12042024: We need
the ability release on the line item level. Just because
we have an issue on 1 item it shouldn’t hold up the
whole order
Commented [RS227R222]: The Release is at the
Header level and it will not hold up other line items if
there is any issue with one of the line items. If this is
fine, please resolve.
Commented [SM228]: SCI?
Commented [NC229R228]: NC11182024: MAH to
confirm what does SCI mean.
Commented [RS230R228]: SCI means Supply Chain
Intelligence. It is a reporting tool. Alternatively,
Inventory Insight can be used to verify the inventory
before the release.
Commented [NC231R228]: NC12042024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
select the component that failed allocation and select Allocate option to re-allocate the
component.
SCALE would use the ‘#’ symbol to differentiate duplicate work units.
Since Component pull work is user initiated as soon as the work is created it is available for users
to execute. Even with some component failing allocation, component pull work will be available
to user if any components succeed allocation. Hence it is a good practice to use an SCI
report/Inventory Insight to verify component inventory before releasing the work order.
18.0 FINISHED GOODS CREATION
As component materials arrive at the build location, finished goods can be built and processed in
SCALE. To process the production, users will process as follows:
• Go to the Work Order insight screen
• Key/scan the Work Order ID
• Press the Confirm button
• Enter quantity built
• Scan pre-printed license plate value for each putaway unit built and affix label to
pallet
The above process relieves the component inventory from SCALE and creates new finished
goods inventory to be put away in stock.
Figure: Work Order Insight Screen – Confirm Option
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 64 of 119						
```

<a id="p065-b001"></a>
## p065\-b001 — PDF page 65, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p065-b002"></a>
## p065\-b002 — PDF page 65, block 2

```text
 

```

<a id="p065-b003"></a>
## p065\-b003 — PDF page 65, block 3

```text
Commented [SM232]: Test lot controlled and non-
lot controlled kits (Serial Nbr Kits as well for 3PL) 

```

<a id="p065-b004"></a>
## p065\-b004 — PDF page 65, block 4

```text
Commented [NC233R232]: NC111182024: resolved 

```

<a id="p065-b005"></a>
## p065\-b005 — PDF page 65, block 5

```text
 
Figure: Work Order Confirmation 

```

<a id="p065-b006"></a>
## p065\-b006 — PDF page 65, block 6

```text
19.0 FINISHED GOODS PUTAWAY 
 
Once the work order is complete, SCALE will locate the inventory and create putaway work. This 
locating and work creation works the exact same as the standard receipt locating within SCALE 
(described above). All finished goods will be located to inventory location using the locating rules 
configured in system, SCALE creates putaway work. 
 
Work is created for these put away tasks in the same fashion as other work creation within 
SCALE. Finished goods putaway will be executed via user directed work. This work can be done 
separately via a Work order finished work profile. 
 

```

<a id="p065-b007"></a>
## p065\-b007 — PDF page 65, block 7

```text
 
Figure: Finished Item Putaway work execution 

```

<a id="p065-b008"></a>
## p065\-b008 — PDF page 65, block 8

```text
 
 

```

<a id="p065-b009"></a>
## p065\-b009 — PDF page 65, block 9

```text
 
 
 

```

<a id="p065-b010"></a>
## p065\-b010 — PDF page 65, block 10

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 65 of 119 
 

```

<a id="p065-t001"></a>
## p065\-t001 — PDF page 65, detected table 1

```text
					MENT
Commented [SM232]: Test lot controlled and non-
lot controlled kits (Serial Nbr Kits as well for 3PL)
Commented [NC233R232]: NC111182024: resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Work Order Confirmation
19.0 FINISHED GOODS PUTAWAY
Once the work order is complete, SCALE will locate the inventory and create putaway work. This
locating and work creation works the exact same as the standard receipt locating within SCALE
(described above). All finished goods will be located to inventory location using the locating rules
configured in system, SCALE creates putaway work.
Work is created for these put away tasks in the same fashion as other work creation within
SCALE. Finished goods putaway will be executed via user directed work. This work can be done
separately via a Work order finished work profile.
Figure: Finished Item Putaway work execution
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 65 of 119						
```

<a id="p066-b001"></a>
## p066\-b001 — PDF page 66, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p066-b002"></a>
## p066\-b002 — PDF page 66, block 2

```text
 

```

<a id="p066-b003"></a>
## p066\-b003 — PDF page 66, block 3

```text
VI.  OUTBOUND 
 

```

<a id="p066-b004"></a>
## p066\-b004 — PDF page 66, block 4

```text
Outbound is the process in SCALE whereby inventory is shipped out of the warehouse via 
Shipments. From a high-level perspective, the following processes are required. 
Rectangles represent processes normally done by the system and trapezoids represent 
processes normally requiring user interaction. 
 

```

<a id="p066-b005"></a>
## p066\-b005 — PDF page 66, block 5

```text
 
Figure 52 – High-Level typical SCALE Outbound Process 

```

<a id="p066-b006"></a>
## p066\-b006 — PDF page 66, block 6

```text
 

```

<a id="p066-b007"></a>
## p066\-b007 — PDF page 66, block 7

```text
Shipment Creation  
This is the process by which a shipment is entered into the system. This is normally a 
system process that is initiated on a schedule to interface records from an existing host 
system.  
 

```

<a id="p066-b008"></a>
## p066\-b008 — PDF page 66, block 8

```text
Wave Processing  
Assigning shipments to a wave and running the wave is normally a system process, 
whereby shipments are grouped logically based on user-defined criteria to be processed 
together during the outbound process. Example groupings include: ‘Priority Orders’, ‘High 
Volume Shipments with only one Item’ Once assigned to a Wave, the wave can be run 
either automatically or manually. Running the wave initiates, the processing of Wave 
Steps may include the following: Allocation, Work Creation, Carrier Assignment, Load 
Building, etc. 
 

```

<a id="p066-b009"></a>
## p066\-b009 — PDF page 66, block 9

```text
Picking  
This is typically a user process whereby the system directs users to picking locations in a 
logical sequence to retrieve inventory and bring it to packing stations, consolidation areas, 
or staging areas.  
 

```

<a id="p066-b010"></a>
## p066\-b010 — PDF page 66, block 10

```text
Commented [CC234]: Can the user override the 
container chosen by the system and enter a different 
one 

```

<a id="p066-b011"></a>
## p066\-b011 — PDF page 66, block 11

```text
Commented [NC235R234]: NC11182024: MAH to 
confirm if this can be done  

```

<a id="p066-b012"></a>
## p066\-b012 — PDF page 66, block 12

```text
Commented [RS236R234]: If containers created 
during the wave, it can be changed after picking before 
closing the container. When we say during picking, it 
means pick into container option (no containers created 
during wave) where user enters a container id and 
chooses container type. 

```

<a id="p066-b013"></a>
## p066\-b013 — PDF page 66, block 13

```text
Packing 
This is typically a user process where inventory is placed into boxes and the boxes are 
identified in the system. There are three main options for performing packing (1) During 
the Wave where the system uses dimensions and configured Container Types to calculate 
the most efficient way to pack the items, (2) During the picking process where users 
identify what boxes the items are being picked into while they are being picked, (3) After 
picking where items are dropped off at discreet packing stations and a separate team 
packs items into boxes 
 

```

<a id="p066-b014"></a>
## p066\-b014 — PDF page 66, block 14

```text
 

```

<a id="p066-b015"></a>
## p066\-b015 — PDF page 66, block 15

```text
Commented [NC237R234]: NC12052024: This is 
resolved. 

```

<a id="p066-b016"></a>
## p066\-b016 — PDF page 66, block 16

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 66 of 119 
 

```

<a id="p066-t001"></a>
## p066\-t001 — PDF page 66, detected table 1

```text
					MENT
Commented [CC234]: Can the user override the
container chosen by the system and enter a different
one
Commented [NC235R234]: NC11182024: MAH to
confirm if this can be done
Commented [RS236R234]: If containers created
during the wave, it can be changed after picking before
closing the container. When we say during picking, it
means pick into container option (no containers created
during wave) where user enters a container id and
chooses container type.
Commented [NC237R234]: NC12052024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
VI. OUTBOUND
Outbound is the process in SCALE whereby inventory is shipped out of the warehouse via
Shipments. From a high-level perspective, the following processes are required.
Rectangles represent processes normally done by the system and trapezoids represent
processes normally requiring user interaction.
Figure 52 – High-Level typical SCALE Outbound Process
Shipment Creation
This is the process by which a shipment is entered into the system. This is normally a
system process that is initiated on a schedule to interface records from an existing host
system.
Wave Processing
Assigning shipments to a wave and running the wave is normally a system process,
whereby shipments are grouped logically based on user-defined criteria to be processed
together during the outbound process. Example groupings include: ‘Priority Orders’, ‘High
Volume Shipments with only one Item’ Once assigned to a Wave, the wave can be run
either automatically or manually. Running the wave initiates, the processing of Wave
Steps may include the following: Allocation, Work Creation, Carrier Assignment, Load
Building, etc.
Picking
This is typically a user process whereby the system directs users to picking locations in a
logical sequence to retrieve inventory and bring it to packing stations, consolidation areas,
or staging areas.
Packing
This is typically a user process where inventory is placed into boxes and the boxes are
identified in the system. There are three main options for performing packing (1) During
the Wave where the system uses dimensions and configured Container Types to calculate
the most efficient way to pack the items, (2) During the picking process where users
identify what boxes the items are being picked into while they are being picked, (3) After
picking where items are dropped off at discreet packing stations and a separate team
packs items into boxes
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 66 of 119						
```

<a id="p067-b001"></a>
## p067\-b001 — PDF page 67, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p067-b002"></a>
## p067\-b002 — PDF page 67, block 2

```text
 

```

<a id="p067-b003"></a>
## p067\-b003 — PDF page 67, block 3

```text
Staging 
This is a user process where containers are taken from a packing location to a staging 
area. Here they await the arrival of the method of transport. At this point, multiple shipping 
containers can be consolidated onto parent pallets for easier transport. This can also be 
a holding area where shipments are waiting for future shipping.  
 

```

<a id="p067-b004"></a>
## p067\-b004 — PDF page 67, block 4

```text
Shipping  
This is a user process where shipments can be assigned to specific Shipping Loads and 
subsequently Load Confirmed. A Shipping Load can represent a lorry, a sea container, a 
van, etc.  
 

```

<a id="p067-b005"></a>
## p067\-b005 — PDF page 67, block 5

```text
The assignment of a Carrier to a shipment can be done systematically during the wave or 
manually after the wave process.  
 
Loading is the action in which a user takes the shipping containers \ parent pallets and 
confirms them onto the truck via a dock door. 
 
Load Confirmation is the process that represents the truck, container, etc. has already 
been loaded and has left the warehouse. The shipping process encompasses the dock 
management functionality of SCALE. Load Confirmation is the final status in the order flow 
in SCALE and represents the removal of stock from within the four walls of the warehouse 
 

```

<a id="p067-b006"></a>
## p067\-b006 — PDF page 67, block 6

```text
Shipment Trailing & Leading Statuses 
These values are defined on the shipment header record. The trailing status is the least 
advanced status associated with the record; the leading status is the most advanced 
status associated with the record. The system obtains this information from the containers 
created for the header. You can use this information to research container activity and 
perform troubleshooting tasks. 
 
 
Below are all the Outbound Execution default statuses available in SCALE: 

```

<a id="p067-b007"></a>
## p067\-b007 — PDF page 67, block 7

```text
• 
(90) In Pool Pending: The shipment’s status before it is processed via the interface. 
The purpose of this status is to be a temporary status used by the interface 
download process to ensure that shipments do not get picked up for processing 
while the interface process is running. Also, shipments in this status cannot be 
added to a wave. 

```

<a id="p067-b008"></a>
## p067\-b008 — PDF page 67, block 8

```text
• 
(100) In Pool: The shipment has not been processed in a wave but has been 
created in the pool or downloaded via the interface. No work can be performed 
against this shipment. 

```

<a id="p067-b009"></a>
## p067\-b009 — PDF page 67, block 9

```text
• 
(200) Wave Pending: The wave is being built. It has not been run. 

```

<a id="p067-b010"></a>
## p067\-b010 — PDF page 67, block 10

```text
• 
(201) In Wave: A wave run was initiated, and the wave has not been released. 

```

<a id="p067-b011"></a>
## p067\-b011 — PDF page 67, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 67 of 119 
 

```

<a id="p067-t001"></a>
## p067\-t001 — PDF page 67, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Staging
This is a user process where containers are taken from a packing location to a staging
area. Here they await the arrival of the method of transport. At this point, multiple shipping
containers can be consolidated onto parent pallets for easier transport. This can also be
a holding area where shipments are waiting for future shipping.
Shipping
This is a user process where shipments can be assigned to specific Shipping Loads and
subsequently Load Confirmed. A Shipping Load can represent a lorry, a sea container, a
van, etc.
The assignment of a Carrier to a shipment can be done systematically during the wave or
manually after the wave process.
Loading is the action in which a user takes the shipping containers \ parent pallets and
confirms them onto the truck via a dock door.
Load Confirmation is the process that represents the truck, container, etc. has already
been loaded and has left the warehouse. The shipping process encompasses the dock
management functionality of SCALE. Load Confirmation is the final status in the order flow
in SCALE and represents the removal of stock from within the four walls of the warehouse
Shipment Trailing & Leading Statuses
These values are defined on the shipment header record. The trailing status is the least
advanced status associated with the record; the leading status is the most advanced
status associated with the record. The system obtains this information from the containers
created for the header. You can use this information to research container activity and
perform troubleshooting tasks.
Below are all the Outbound Execution default statuses available in SCALE:
• (90) In Pool Pending: The shipment’s status before it is processed via the interface.
The purpose of this status is to be a temporary status used by the interface
download process to ensure that shipments do not get picked up for processing
while the interface process is running. Also, shipments in this status cannot be
added to a wave.
• (100) In Pool: The shipment has not been processed in a wave but has been
created in the pool or downloaded via the interface. No work can be performed
against this shipment.
• (200) Wave Pending: The wave is being built. It has not been run.
• (201) In Wave: A wave run was initiated, and the wave has not been released.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 67 of 119						
```

<a id="p068-b001"></a>
## p068\-b001 — PDF page 68, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p068-b002"></a>
## p068\-b002 — PDF page 68, block 2

```text
 

```

<a id="p068-b003"></a>
## p068\-b003 — PDF page 68, block 3

```text
• 
(300) Picking Pending: A wave was released, but none of the work has been 
initiated. 

```

<a id="p068-b004"></a>
## p068\-b004 — PDF page 68, block 4

```text
• 
(301) In Picking: At least one work instruction associated with this shipment has 
been assigned to an employee. 

```

<a id="p068-b005"></a>
## p068\-b005 — PDF page 68, block 5

```text
• 
(400) Packing Pending: At least one work instruction associated with this shipment 
has been pick confirmed. It can now be packed. 

```

<a id="p068-b006"></a>
## p068\-b006 — PDF page 68, block 6

```text
• 
(401) In Packing: At least one work instruction associated with this shipment has 
been packed. 

```

<a id="p068-b007"></a>
## p068\-b007 — PDF page 68, block 7

```text
• 
(600) Staging Pending: All items of a shipment have been picked, packed, and/or 
consolidated. 

```

<a id="p068-b008"></a>
## p068\-b008 — PDF page 68, block 8

```text
• 
(650) Loading Pending: All items of a shipment have been picked, packed, or 
consolidated, and/or staged. 

```

<a id="p068-b009"></a>
## p068\-b009 — PDF page 68, block 9

```text
• 
(700) Ship Confirm Pending: At least one container associated with this shipment 
has been closed. 

```

<a id="p068-b010"></a>
## p068\-b010 — PDF page 68, block 10

```text
• 
(800) Load Confirm Pending: All shipments on the load have been ship confirmed 
and the load is ready to be confirmed. 

```

<a id="p068-b011"></a>
## p068\-b011 — PDF page 68, block 11

```text
• 
(900) Closed: The shipping load has been confirmed. 

```

<a id="p068-b012"></a>
## p068\-b012 — PDF page 68, block 12

```text
• 
(998) Delete Rejected: A quantity on a shipment detail line was rejected. The 
quantity will be deleted from the system. 

```

<a id="p068-b013"></a>
## p068\-b013 — PDF page 68, block 13

```text
• 
(999) Rejected: During allocation, if any quantity on the line is rejected, this 
status will indicate that rejected quantity 
 

```

<a id="p068-b014"></a>
## p068\-b014 — PDF page 68, block 14

```text
20.0 
WAVE PROCESSING 
 

```

<a id="p068-b015"></a>
## p068\-b015 — PDF page 68, block 15

```text
Commented [CC238]: Are corrective actions easy 
fixes for the person waving to correct or does this 
require Inventory involvement? 

```

<a id="p068-b016"></a>
## p068\-b016 — PDF page 68, block 16

```text
Commented [NC239R238]: NC11182024: this is 
resolved 

```

<a id="p068-b017"></a>
## p068\-b017 — PDF page 68, block 17

```text
A wave is a method for retrieving shipments from the pool and processing them through a 
wave flow. All shipments are processed through the system in a wave (a wave is simply a 
collection of shipments that generate an amount of work that can be handled by the 
operation in a single session). All wave activity is defined on the wave master record.  
 
Outbound shipments are created in Host and sent to SCALE. On a scheduled basis, these 
shipments are interfaced into SCALE. Any orders that fail validation are logged for further 
review and will be reviewed manually by looking at the Interface Error Insight screen for 
corrective actions. Once corrected, the shipment(s) can be reprocessed during the next 
scheduled interface download (or the interface can be manually invoked). 
 
Once successfully downloaded, the shipments are viewable as SCALE shipments in the 
Pool in the Planned Shipment Insight. The shipments can be viewed by Order Type and 

```

<a id="p068-b018"></a>
## p068\-b018 — PDF page 68, block 18

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 68 of 119 
 

```

<a id="p068-t001"></a>
## p068\-t001 — PDF page 68, detected table 1

```text
					MENT
Commented [CC238]: Are corrective actions easy
fixes for the person waving to correct or does this
require Inventory involvement?
Commented [NC239R238]: NC11182024: this is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• (300) Picking Pending: A wave was released, but none of the work has been
initiated.
• (301) In Picking: At least one work instruction associated with this shipment has
been assigned to an employee.
• (400) Packing Pending: At least one work instruction associated with this shipment
has been pick confirmed. It can now be packed.
• (401) In Packing: At least one work instruction associated with this shipment has
been packed.
• (600) Staging Pending: All items of a shipment have been picked, packed, and/or
consolidated.
• (650) Loading Pending: All items of a shipment have been picked, packed, or
consolidated, and/or staged.
• (700) Ship Confirm Pending: At least one container associated with this shipment
has been closed.
• (800) Load Confirm Pending: All shipments on the load have been ship confirmed
and the load is ready to be confirmed.
• (900) Closed: The shipping load has been confirmed.
• (998) Delete Rejected: A quantity on a shipment detail line was rejected. The
quantity will be deleted from the system.
• (999) Rejected: During allocation, if any quantity on the line is rejected, this
status will indicate that rejected quantity
20.0 WAVE PROCESSING
A wave is a method for retrieving shipments from the pool and processing them through a
wave flow. All shipments are processed through the system in a wave (a wave is simply a
collection of shipments that generate an amount of work that can be handled by the
operation in a single session). All wave activity is defined on the wave master record.
Outbound shipments are created in Host and sent to SCALE. On a scheduled basis, these
shipments are interfaced into SCALE. Any orders that fail validation are logged for further
review and will be reviewed manually by looking at the Interface Error Insight screen for
corrective actions. Once corrected, the shipment(s) can be reprocessed during the next
scheduled interface download (or the interface can be manually invoked).
Once successfully downloaded, the shipments are viewable as SCALE shipments in the
Pool in the Planned Shipment Insight. The shipments can be viewed by Order Type and
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 68 of 119						
```

<a id="p069-b001"></a>
## p069\-b001 — PDF page 69, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p069-b002"></a>
## p069\-b002 — PDF page 69, block 2

```text
 

```

<a id="p069-b003"></a>
## p069\-b003 — PDF page 69, block 3

```text
Scheduled Ship Date (Knipper can create Planned shipment filter criteria records to view 
shipments in pool by other criteria of their choice).  
 

```

<a id="p069-b004"></a>
## p069\-b004 — PDF page 69, block 4

```text
 
Figure - Planned Shipment Insight 

```

<a id="p069-b005"></a>
## p069\-b005 — PDF page 69, block 5

```text
 

```

<a id="p069-b006"></a>
## p069\-b006 — PDF page 69, block 6

```text
The following order profiles are used by Knipper Host. 
  
 

```

<a id="p069-b007"></a>
## p069\-b007 — PDF page 69, block 7

```text
Y/Manual 
 

```

<a id="p069-b008"></a>
## p069\-b008 — PDF page 69, block 8

```text
Order Profile 
Description 
Interfaced 
Frequency  
Direct to 
Physicians 
(DTP) 

```

<a id="p069-b009"></a>
## p069\-b009 — PDF page 69, block 9

```text
• 
Orders for samples to 
physicians  
 

```

<a id="p069-b010"></a>
## p069\-b010 — PDF page 69, block 10

```text
Y/Manual 
 

```

<a id="p069-b011"></a>
## p069\-b011 — PDF page 69, block 11

```text
Direct to Rep 
(DTR) 

```

<a id="p069-b012"></a>
## p069\-b012 — PDF page 69, block 12

```text
• 
Orders for samples to 
Medical Reps  
 

```

<a id="p069-b013"></a>
## p069\-b013 — PDF page 69, block 13

```text
Y/Manual 
 

```

<a id="p069-b014"></a>
## p069\-b014 — PDF page 69, block 14

```text
3PL 
• 
Orders 
for 
3PL 
accounts 

```

<a id="p069-b015"></a>
## p069\-b015 — PDF page 69, block 15

```text
Y/Manual 
 

```

<a id="p069-b016"></a>
## p069\-b016 — PDF page 69, block 16

```text
Destruction 
• 
Shipping inventory for 
destruction 
 

```

<a id="p069-b017"></a>
## p069\-b017 — PDF page 69, block 17

```text
Y/Manual 
 

```

<a id="p069-b018"></a>
## p069\-b018 — PDF page 69, block 18

```text
Direct to 
Consumer 
(Ecom) 

```

<a id="p069-b019"></a>
## p069\-b019 — PDF page 69, block 19

```text
• 
Direct 
to 
consumer 
orders 
 

```

<a id="p069-b020"></a>
## p069\-b020 — PDF page 69, block 20

```text
 
 
 
 
 

```

<a id="p069-b021"></a>
## p069\-b021 — PDF page 69, block 21

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 69 of 119 
 

```

<a id="p069-t001"></a>
## p069\-t001 — PDF page 69, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Scheduled Ship Date (Knipper can create Planned shipment filter criteria records to view
shipments in pool by other criteria of their choice).
Figure - Planned Shipment Insight
The following order profiles are used by Knipper Host.
Order Profile Description Interfaced Frequency
Direct to • Orders for samples to Y/Manual
Physicians physicians
(DTP)
Direct to Rep • Orders for samples to Y/Manual
(DTR) Medical Reps
3PL • Orders for 3PL Y/Manual
accounts
Destruction • Shipping inventory for Y/Manual
destruction
Direct to • Direct to consumer Y/Manual
Consumer orders
(Ecom)
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 69 of 119						
```

<a id="p069-t002"></a>
## p069\-t002 — PDF page 69, detected table 2

```text
Order Profile	Description	Interfaced	Frequency
Direct to
Physicians
(DTP)	• Orders for samples to
physicians	Y/Manual	
Direct to Rep
(DTR)	• Orders for samples to
Medical Reps	Y/Manual	
3PL	• Orders for 3PL
accounts	Y/Manual	
Destruction	• Shipping inventory for
destruction	Y/Manual	
Direct to
Consumer
(Ecom)	• Direct to consumer
orders	Y/Manual	
```

<a id="p070-b001"></a>
## p070\-b001 — PDF page 70, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p070-b002"></a>
## p070\-b002 — PDF page 70, block 2

```text
 

```

<a id="p070-b003"></a>
## p070\-b003 — PDF page 70, block 3

```text
20.1 
Waving Strategy 
 

```

<a id="p070-b004"></a>
## p070\-b004 — PDF page 70, block 4

```text
Commented [CC240]: Will all our current pool views 
be imported into new SCALE or will they require 
reconfiguring. When will this happen? I would like to 
clean up old Pool views no longer in use. 

```

<a id="p070-b005"></a>
## p070\-b005 — PDF page 70, block 5

```text
Commented [NC241R240]: NC11192024: Knipper to 
clean up pool views before going into new SCALE 

```

<a id="p070-b006"></a>
## p070\-b006 — PDF page 70, block 6

```text
Knipper’ waving strategy is to wave by priority or cut-off times for the orders in the pool. 
For LTL/TL orders, Knipper does not wave for a truck – aka, do not wave by cubing for a 
truck, hence, one wave may result in multiple load numbers.  
 
Shipments interfaced into SCALE are processed differently depending on the shipment 
order type. Every shipment that is interfaced has a unique item per line with the requested 
quantity in the lowest unit of measure. 
 
The waving supervisor monitors the Planned Shipment Insight with preconfigured filters 
called Planned Shipment filters. Knipper runs several waves throughout the day. 
 
Planned Shipment Filters display planned shipments based on the criteria that you select. 
You could, for example, define a rule in SCALE configuration for a particular customer, 
carrier, and order type. You could then display shipment records that meet those criteria 
in the Planned Shipment Insight. You can define pool views using any combination of 
shipment or shipment line values. If you specify a shipment line in your filter criteria, the 
system will use it to determine if shipments should be included in a pool view. If a shipment 
line matches a rule, then the system will select the entire shipment for the pool view. 
  
Knipper uses the existing planned shipment filter criteria are created aiding in the waving 
strategy. Knipper may create additional filters as needed. 
 
 

```

<a id="p070-b007"></a>
## p070\-b007 — PDF page 70, block 7

```text
20.2 
Wave Flow 
 
A wave flow is a grouping of wave steps. These flows determine which wave steps that a 
shipment will be processed through, and the order in which the wave steps will be 
processed. Once a wave flow is created, it can be associated with the appropriate wave 
on the Wave Master Window. (Defined later in the document) 
 
Knipper uses existing wave flows and wave masters.  
 
  

```

<a id="p070-b008"></a>
## p070\-b008 — PDF page 70, block 8

```text
Sequence 
Description 

```

<a id="p070-b009"></a>
## p070\-b009 — PDF page 70, block 9

```text
10 
Start Wave 

```

<a id="p070-b010"></a>
## p070\-b010 — PDF page 70, block 10

```text
20 
Override Data: Set Default Status Flow 

```

<a id="p070-b011"></a>
## p070\-b011 — PDF page 70, block 11

```text
30 
Override Data: Set Allocate Complete Flag 

```

<a id="p070-b012"></a>
## p070\-b012 — PDF page 70, block 12

```text
32 
Override Data: Set Packing Class 

```

<a id="p070-b013"></a>
## p070\-b013 — PDF page 70, block 13

```text
34 
RTS Address Verification 

```

<a id="p070-b014"></a>
## p070\-b014 — PDF page 70, block 14

```text
40 
Allocation 

```

<a id="p070-b015"></a>
## p070\-b015 — PDF page 70, block 15

```text
42 
DT Location Assignment 

```

<a id="p070-b016"></a>
## p070\-b016 — PDF page 70, block 16

```text
43 
DTP Wave Splitting 

```

<a id="p070-b017"></a>
## p070\-b017 — PDF page 70, block 17

```text
50 
Container Creation 

```

<a id="p070-b018"></a>
## p070\-b018 — PDF page 70, block 18

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 70 of 119 
 

```

<a id="p070-t001"></a>
## p070\-t001 — PDF page 70, detected table 1

```text
					MENT
Commented [CC240]: Will all our current pool views
be imported into new SCALE or will they require
reconfiguring. When will this happen? I would like to
clean up old Pool views no longer in use.
Commented [NC241R240]: NC11192024: Knipper to
clean up pool views before going into new SCALE	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20.1 Waving Strategy
Knipper’ waving strategy is to wave by priority or cut-off times for the orders in the pool.
For LTL/TL orders, Knipper does not wave for a truck – aka, do not wave by cubing for a
truck, hence, one wave may result in multiple load numbers.
Shipments interfaced into SCALE are processed differently depending on the shipment
order type. Every shipment that is interfaced has a unique item per line with the requested
quantity in the lowest unit of measure.
The waving supervisor monitors the Planned Shipment Insight with preconfigured filters
called Planned Shipment filters. Knipper runs several waves throughout the day.
Planned Shipment Filters display planned shipments based on the criteria that you select.
You could, for example, define a rule in SCALE configuration for a particular customer,
carrier, and order type. You could then display shipment records that meet those criteria
in the Planned Shipment Insight. You can define pool views using any combination of
shipment or shipment line values. If you specify a shipment line in your filter criteria, the
system will use it to determine if shipments should be included in a pool view. If a shipment
line matches a rule, then the system will select the entire shipment for the pool view.
Knipper uses the existing planned shipment filter criteria are created aiding in the waving
strategy. Knipper may create additional filters as needed.
20.2 Wave Flow
A wave flow is a grouping of wave steps. These flows determine which wave steps that a
shipment will be processed through, and the order in which the wave steps will be
processed. Once a wave flow is created, it can be associated with the appropriate wave
on the Wave Master Window. (Defined later in the document)
Knipper uses existing wave flows and wave masters.
Sequence Description
10 Start Wave
20 Override Data: Set Default Status Flow
30 Override Data: Set Allocate Complete Flag
32 Override Data: Set Packing Class
34 RTS Address Verification
40 Allocation
42 DT Location Assignment
43 DTP Wave Splitting
50 Container Creation
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 70 of 119						
```

<a id="p070-t002"></a>
## p070\-t002 — PDF page 70, detected table 2

```text
Sequence	Description
10	Start Wave
20	Override Data: Set Default Status Flow
30	Override Data: Set Allocate Complete Flag
32	Override Data: Set Packing Class
34	RTS Address Verification
40	Allocation
42	DT Location Assignment
43	DTP Wave Splitting
50	Container Creation
```

<a id="p071-b001"></a>
## p071\-b001 — PDF page 71, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p071-b002"></a>
## p071\-b002 — PDF page 71, block 2

```text
 

```

<a id="p071-b003"></a>
## p071\-b003 — PDF page 71, block 3

```text
60 
Routing 

```

<a id="p071-b004"></a>
## p071\-b004 — PDF page 71, block 4

```text
70 
Pallet Building 

```

<a id="p071-b005"></a>
## p071\-b005 — PDF page 71, block 5

```text
80 
VAS Assignment 

```

<a id="p071-b006"></a>
## p071\-b006 — PDF page 71, block 6

```text
90 
QC Assignment 

```

<a id="p071-b007"></a>
## p071\-b007 — PDF page 71, block 7

```text
100 
Dock Assignment 

```

<a id="p071-b008"></a>
## p071\-b008 — PDF page 71, block 8

```text
110 
Load Building 

```

<a id="p071-b009"></a>
## p071\-b009 — PDF page 71, block 9

```text
120 
Work Creation Shipping Container 
 

```

<a id="p071-b010"></a>
## p071\-b010 — PDF page 71, block 10

```text
130 
Paperwork – Labels 

```

<a id="p071-b011"></a>
## p071\-b011 — PDF page 71, block 11

```text
999 
Override Data: Check for No Work 

```

<a id="p071-b012"></a>
## p071\-b012 — PDF page 71, block 12

```text
1000 
Complete Wave 

```

<a id="p071-b013"></a>
## p071\-b013 — PDF page 71, block 13

```text
   Standard wave flow 

```

<a id="p071-b014"></a>
## p071\-b014 — PDF page 71, block 14

```text
Commented [SG242]: Only 1 waveflow? What about 
ODWS? 

```

<a id="p071-b015"></a>
## p071\-b015 — PDF page 71, block 15

```text
  
 
 

```

<a id="p071-b016"></a>
## p071\-b016 — PDF page 71, block 16

```text
Commented [NC243R242]: NC11182024: what does 
this mean? 

```

<a id="p071-b017"></a>
## p071\-b017 — PDF page 71, block 17

```text
20.3 
Build Wave – Future Use 
 

```

<a id="p071-b018"></a>
## p071\-b018 — PDF page 71, block 18

```text
Commented [RS244R242]: The question is if Knipper 
would use only one wave flow which is not true. 
Knipper would migrate all the wave flows from the 
current version which will still be based on this 
standard wave flow template.  

```

<a id="p071-b019"></a>
## p071\-b019 — PDF page 71, block 19

```text
Commented [NC245R242]: NC12052024:This is 
resolved. 

```

<a id="p071-b020"></a>
## p071\-b020 — PDF page 71, block 20

```text
Commented [CC246]: I'm looking for some clarity on 
4.3.  Is this a way have a wave be created 
automatically?  It will build a wave and run the wave  
based on specific criteria? 

```

<a id="p071-b021"></a>
## p071\-b021 — PDF page 71, block 21

```text
Commented [NC247R246]: NC11182024: MAH to 
confirm  

```

<a id="p071-b022"></a>
## p071\-b022 — PDF page 71, block 22

```text
Knipper wants SCALE to build wave instead of wave planner selecting what 
shipments needs to be waved. Knipper will configure wave criteria which will define 
rules as what shipments are eligible to be picked up to be waved. During the build 
wave process, wave criteria records determine which shipment(s) will be included 
in a wave. Knipper can associate these criteria records with wave master. Also, 
user can define wave criteria records using any combination of shipment or 
shipment line values. If user specify a shipment line in filter criteria, the system will 
use this to determine if shipments should be included in a wave. If a shipment line 
matches a criteria rule, then the system will select the entire shipment for the wave. 
Note that all the shipment lines do not have to match for a shipment to be selected. 
These Build waves are run on a scheduled job so that they can pick up shipments 
from pool over a period. 
 

```

<a id="p071-b023"></a>
## p071\-b023 — PDF page 71, block 23

```text
Commented [RS248R246]: Yes, the Build wave is a 
scheduled job which can generate waves based on 
criteria. We can have multiple criteria defined which 
can create waves with different wave flows. 

```

<a id="p071-b024"></a>
## p071\-b024 — PDF page 71, block 24

```text
20.4 
Run Wave during build wave process 
 

```

<a id="p071-b025"></a>
## p071\-b025 — PDF page 71, block 25

```text
Commented [NC249R246]: NC12052024: This is 
resolved. 

```

<a id="p071-b026"></a>
## p071\-b026 — PDF page 71, block 26

```text
Wave masters configured for Knipper will have mode set to Automatic. Mode 
Automatic means as soon at a wave is built, the system will run it.  
 

```

<a id="p071-b027"></a>
## p071\-b027 — PDF page 71, block 27

```text
Commented [CC250]: As shipments are added to a 
wave, I want to manually release the wave unless the 
wave is set up as in 4.3 if I understand that correctly 

```

<a id="p071-b028"></a>
## p071\-b028 — PDF page 71, block 28

```text
Commented [NC251R250]: NC11182024: this is 
resolved 

```

<a id="p071-b029"></a>
## p071\-b029 — PDF page 71, block 29

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 71 of 119 
 

```

<a id="p071-t001"></a>
## p071\-t001 — PDF page 71, detected table 1

```text
					MENT
Commented [SG242]: Only 1 waveflow? What about
ODWS?
Commented [NC243R242]: NC11182024: what does
this mean?
Commented [RS244R242]: The question is if Knipper
would use only one wave flow which is not true.
Knipper would migrate all the wave flows from the
current version which will still be based on this
standard wave flow template.
Commented [NC245R242]: NC12052024:This is
resolved.
Commented [CC246]: I'm looking for some clarity on
4.3. Is this a way have a wave be created
automatically? It will build a wave and run the wave
based on specific criteria?
Commented [NC247R246]: NC11182024: MAH to
confirm
Commented [RS248R246]: Yes, the Build wave is a
scheduled job which can generate waves based on
criteria. We can have multiple criteria defined which
can create waves with different wave flows.
Commented [NC249R246]: NC12052024: This is
resolved.
Commented [CC250]: As shipments are added to a
wave, I want to manually release the wave unless the
wave is set up as in 4.3 if I understand that correctly
Commented [NC251R250]: NC11182024: this is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
60 Routing
70 Pallet Building
80 VAS Assignment
90 QC Assignment
100 Dock Assignment
110 Load Building
120 Work Creation Shipping Container
130 Paperwork – Labels
999 Override Data: Check for No Work
1000 Complete Wave
Standard wave flow
20.3 Build Wave – Future Use
Knipper wants SCALE to build wave instead of wave planner selecting what
shipments needs to be waved. Knipper will configure wave criteria which will define
rules as what shipments are eligible to be picked up to be waved. During the build
wave process, wave criteria records determine which shipment(s) will be included
in a wave. Knipper can associate these criteria records with wave master. Also,
user can define wave criteria records using any combination of shipment or
shipment line values. If user specify a shipment line in filter criteria, the system will
use this to determine if shipments should be included in a wave. If a shipment line
matches a criteria rule, then the system will select the entire shipment for the wave.
Note that all the shipment lines do not have to match for a shipment to be selected.
These Build waves are run on a scheduled job so that they can pick up shipments
from pool over a period.
20.4 Run Wave during build wave process
Wave masters configured for Knipper will have mode set to Automatic. Mode
Automatic means as soon at a wave is built, the system will run it.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 71 of 119						
```

<a id="p071-t002"></a>
## p071\-t002 — PDF page 71, detected table 2

```text
60	Routing
70	Pallet Building
80	VAS Assignment
90	QC Assignment
100	Dock Assignment
110	Load Building
120	Work Creation Shipping Container
130	Paperwork – Labels
999	Override Data: Check for No Work
1000	Complete Wave
```

<a id="p072-b001"></a>
## p072\-b001 — PDF page 72, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p072-b002"></a>
## p072\-b002 — PDF page 72, block 2

```text
 

```

<a id="p072-b003"></a>
## p072\-b003 — PDF page 72, block 3

```text
 
Figure: Wave Master – Mode config 

```

<a id="p072-b004"></a>
## p072\-b004 — PDF page 72, block 4

```text
Upon confirmation of the run wave request, the system executes the steps 
detailed in the Wave Flow associated with the wave. Upon completion of running 
the wave, the system moves the wave into the Completed status. 
 

```

<a id="p072-b005"></a>
## p072\-b005 — PDF page 72, block 5

```text
20.5 
Add to Wave – If Build Wave is not used 
 

```

<a id="p072-b006"></a>
## p072\-b006 — PDF page 72, block 6

```text
To initiate the wave process, wave planner selects a shipment (or multi-selects 
more than one shipment) from the Planned Shipment Insight and selects “Add 
to Wave” from the Actions menu. Next, the wave planner is prompted to add the 
shipment(s) selected to an existing open wave, or they may select New Wave to 
manually assign the shipment(s) to a new wave. When executing the “New Wave” 
action, the system prompts the user to select a “Wave Master” to act as a template 
that manages the movement of shipments through the wave cycle. The Wave 
Master defines the Wave Flow, Replenishment Master(s), and Paperwork Master 
for the wave. The wave flow defines the sequence and specific steps SCALE 
performs when running the wave. Examples of Wave Flow steps include allocation, 
work creation, printing documents, etc. The Wave Flows are defined via the Wave 
Flow windows in the fixed station Configuration option. The Replenishment Master 
defines what replenishment masters are eligible to evaluate demand within the 
wave. The paperwork master defines the documentation that is printed with the 
wave. 

```

<a id="p072-b007"></a>
## p072\-b007 — PDF page 72, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 72 of 119 
 

```

<a id="p072-t001"></a>
## p072\-t001 — PDF page 72, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Wave Master – Mode config
Upon confirmation of the run wave request, the system executes the steps
detailed in the Wave Flow associated with the wave. Upon completion of running
the wave, the system moves the wave into the Completed status.
20.5 Add to Wave – If Build Wave is not used
To initiate the wave process, wave planner selects a shipment (or multi-selects
more than one shipment) from the Planned Shipment Insight and selects “Add
to Wave” from the Actions menu. Next, the wave planner is prompted to add the
shipment(s) selected to an existing open wave, or they may select New Wave to
manually assign the shipment(s) to a new wave. When executing the “New Wave”
action, the system prompts the user to select a “Wave Master” to act as a template
that manages the movement of shipments through the wave cycle. The Wave
Master defines the Wave Flow, Replenishment Master(s), and Paperwork Master
for the wave. The wave flow defines the sequence and specific steps SCALE
performs when running the wave. Examples of Wave Flow steps include allocation,
work creation, printing documents, etc. The Wave Flows are defined via the Wave
Flow windows in the fixed station Configuration option. The Replenishment Master
defines what replenishment masters are eligible to evaluate demand within the
wave. The paperwork master defines the documentation that is printed with the
wave.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 72 of 119						
```

<a id="p073-b001"></a>
## p073\-b001 — PDF page 73, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p073-b002"></a>
## p073\-b002 — PDF page 73, block 2

```text
 

```

<a id="p073-b003"></a>
## p073\-b003 — PDF page 73, block 3

```text
For Knipper the following wave masters will be configured in the system: 
 

```

<a id="p073-b004"></a>
## p073\-b004 — PDF page 73, block 4

```text
• 
Project (REPS) 
• 
EX17 Re Carton Cooler Wave Domestic LTL wave master 
• 
DTP – PTL 
• 
PTL – Case Pick 
• 
Destruction Wave Master 
• 
3PL 
• 
PM Manifest 
• 
DEA 
• 
3PL - PM LTL FT 
• 
3PL - PM UPS 
• 
3PL - PM ADRS LTLFT DSCSA 
 
Note: Some wave masters would be replicated with facility/Business unit/client with some 
additional wave steps to add some specific processing step through an override data wave step. 
 
After confirming the “Wave Master” for the wave, the system assigns a wave number (via a next 
up counter) to group the selected shipments. The shipments are removed from their previous pool 
view. The wave is created in the Planned Shipment sections of the Wave Insight. The wave is 
now ready to be run. 
 

```

<a id="p073-b005"></a>
## p073\-b005 — PDF page 73, block 5

```text
 
Figure: Planned Shipment insight – Add shipment to wave option 

```

<a id="p073-b006"></a>
## p073\-b006 — PDF page 73, block 6

```text
 

```

<a id="p073-b007"></a>
## p073\-b007 — PDF page 73, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 73 of 119 
 

```

<a id="p073-t001"></a>
## p073\-t001 — PDF page 73, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
For Knipper the following wave masters will be configured in the system:
• Project (REPS)
• EX17 Re Carton Cooler Wave Domestic LTL wave master
• DTP – PTL
• PTL – Case Pick
• Destruction Wave Master
• 3PL
• PM Manifest
• DEA
• 3PL - PM LTL FT
• 3PL - PM UPS
• 3PL - PM ADRS LTLFT DSCSA
Note: Some wave masters would be replicated with facility/Business unit/client with some
additional wave steps to add some specific processing step through an override data wave step.
After confirming the “Wave Master” for the wave, the system assigns a wave number (via a next
up counter) to group the selected shipments. The shipments are removed from their previous pool
view. The wave is created in the Planned Shipment sections of the Wave Insight. The wave is
now ready to be run.
Figure: Planned Shipment insight – Add shipment to wave option
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 73 of 119						
```

<a id="p074-b001"></a>
## p074\-b001 — PDF page 74, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p074-b002"></a>
## p074\-b002 — PDF page 74, block 2

```text
 

```

<a id="p074-b003"></a>
## p074\-b003 — PDF page 74, block 3

```text
 
Figure: Selection of Wave Master 

```

<a id="p074-b004"></a>
## p074\-b004 — PDF page 74, block 4

```text
 

```

<a id="p074-b005"></a>
## p074\-b005 — PDF page 74, block 5

```text
 
Figure: Wave Insight screen 

```

<a id="p074-b006"></a>
## p074\-b006 — PDF page 74, block 6

```text
 

```

<a id="p074-b007"></a>
## p074\-b007 — PDF page 74, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 74 of 119 
 

```

<a id="p074-t001"></a>
## p074\-t001 — PDF page 74, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Selection of Wave Master
Figure: Wave Insight screen
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 74 of 119						
```

<a id="p075-b001"></a>
## p075\-b001 — PDF page 75, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p075-b002"></a>
## p075\-b002 — PDF page 75, block 2

```text
 

```

<a id="p075-b003"></a>
## p075\-b003 — PDF page 75, block 3

```text
20.6 
Run Wave 
 

```

<a id="p075-b004"></a>
## p075\-b004 — PDF page 75, block 4

```text
After reviewing a wave and making any necessary changes, wave planner uses 
the Run Wave action on the desired wave in the Active Wave view of the Wave 
Insight. Upon confirmation of the run wave request, the system executes the steps 
detailed in the Wave Flow associated with the wave. Upon completion of running 
the wave, the system moves the wave into the Completed status. Knipper would 
like Wave Insight to auto refresh while waves are running [EX48 – Auto Refresh 
Wave Insight Screen].  
 

```

<a id="p075-b005"></a>
## p075\-b005 — PDF page 75, block 5

```text
 
Figure: Wave Insight – Run wave option 

```

<a id="p075-b006"></a>
## p075\-b006 — PDF page 75, block 6

```text
            [EX13 – Pick to Light Wave Splitting] will allow all Direct to Physician orders to be run 
through a single wave that groups and sequences the orders into new waves to be fulfilled across 
the same group of pick to light locations.  

```

<a id="p075-b007"></a>
## p075\-b007 — PDF page 75, block 7

```text
 
 

```

<a id="p075-b008"></a>
## p075\-b008 — PDF page 75, block 8

```text
20.7 
Wave Steps 
 

```

<a id="p075-b009"></a>
## p075\-b009 — PDF page 75, block 9

```text
The following sections explain the logic the system uses when executing the 
various key wave steps that are included in standard wave flow. Please note that 
there may be additional wave steps that may be added during the build phase. 
 
20.7.1 Start Wave 
 
Start Wave is required for all wave flows and marks each shipment with a 
status of In Wave. 

```

<a id="p075-b010"></a>
## p075\-b010 — PDF page 75, block 10

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 75 of 119 
 

```

<a id="p075-t001"></a>
## p075\-t001 — PDF page 75, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20.6 Run Wave
After reviewing a wave and making any necessary changes, wave planner uses
the Run Wave action on the desired wave in the Active Wave view of the Wave
Insight. Upon confirmation of the run wave request, the system executes the steps
detailed in the Wave Flow associated with the wave. Upon completion of running
the wave, the system moves the wave into the Completed status. Knipper would
like Wave Insight to auto refresh while waves are running [EX48 – Auto Refresh
Wave Insight Screen].
Figure: Wave Insight – Run wave option
[EX13 – Pick to Light Wave Splitting] will allow all Direct to Physician orders to be run
through a single wave that groups and sequences the orders into new waves to be fulfilled across
the same group of pick to light locations.
20.7 Wave Steps
The following sections explain the logic the system uses when executing the
various key wave steps that are included in standard wave flow. Please note that
there may be additional wave steps that may be added during the build phase.
20.7.1 Start Wave
Start Wave is required for all wave flows and marks each shipment with a
status of In Wave.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 75 of 119						
```

<a id="p076-b001"></a>
## p076\-b001 — PDF page 76, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p076-b002"></a>
## p076\-b002 — PDF page 76, block 2

```text
 

```

<a id="p076-b003"></a>
## p076\-b003 — PDF page 76, block 3

```text
 
 
 

```

<a id="p076-b004"></a>
## p076\-b004 — PDF page 76, block 4

```text
20.7.2 Override Data: Set Default Status Flow 
 
This Override Data Wave Step updates the Status Flow field of the Shipment 
Details to a value based on the below table: 
 
 Various Custom Status flows that will be configured for Knipper are below: 
Note: Knipper currently has configured site specific status flow names which are 
redundant. The status flow configurations can be consolidated with generic names. 
 

```

<a id="p076-b005"></a>
## p076\-b005 — PDF page 76, block 5

```text
o Status Flow - Parcel  

```

<a id="p076-b006"></a>
## p076\-b006 — PDF page 76, block 6

```text
 

```

<a id="p076-b007"></a>
## p076\-b007 — PDF page 76, block 7

```text
                    Parcel 
Status 
Status Name 
100 In Pool 
200 Wave Pending 
201 In Wave 
300 Picking Pending 
301 In Picking 
401 In Packing 
700 Ship Confirm Pending 
800 Load Confirm Pending 
900 Closed 
 

```

<a id="p076-b008"></a>
## p076\-b008 — PDF page 76, block 8

```text
o Status Flow – Non-Parcel/LTL 

```

<a id="p076-b009"></a>
## p076\-b009 — PDF page 76, block 9

```text
 

```

<a id="p076-b010"></a>
## p076\-b010 — PDF page 76, block 10

```text
Non Parcel/ LTL 
Status 
Status Name 
100 In Pool 
200 Wave Pending 
201 In Wave 
300 Picking Pending 
301 In Picking 
401 In Packing 
650 Loading Pending 
700 Ship Confirm Pending 
800 Load Confirm Pending 
900 Closed 
 

```

<a id="p076-b011"></a>
## p076\-b011 — PDF page 76, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 76 of 119 
 

```

<a id="p076-t001"></a>
## p076\-t001 — PDF page 76, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20.7.2 Override Data: Set Default Status Flow
This Override Data Wave Step updates the Status Flow field of the Shipment
Details to a value based on the below table:
Various Custom Status flows that will be configured for Knipper are below:
Note: Knipper currently has configured site specific status flow names which are
redundant. The status flow configurations can be consolidated with generic names.
o Status Flow - Parcel
Parcel
Status Status Name
100 In Pool
200 Wave Pending
201 In Wave
300 Picking Pending
301 In Picking
401 In Packing
700 Ship Confirm Pending
800 Load Confirm Pending
900 Closed
o Status Flow – Non-Parcel/LTL
Non Parcel/ LTL
Status Status Name
100 In Pool
200 Wave Pending
201 In Wave
300 Picking Pending
301 In Picking
401 In Packing
650 Loading Pending
700 Ship Confirm Pending
800 Load Confirm Pending
900 Closed
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 76 of 119						
```

<a id="p076-t002"></a>
## p076\-t002 — PDF page 76, detected table 2

```text
	Parcel				
	Status			Status Name	
100			In Pool		
200			Wave Pending		
201			In Wave		
300			Picking Pending		
301			In Picking		
401			In Packing		
700			Ship Confirm Pending		
800			Load Confirm Pending		
900			Closed		
```

<a id="p076-t003"></a>
## p076\-t003 — PDF page 76, detected table 3

```text
	Non Parcel/ LTL				
	Status			Status Name	
100			In Pool		
200			Wave Pending		
201			In Wave		
300			Picking Pending		
301			In Picking		
401			In Packing		
650			Loading Pending		
700			Ship Confirm Pending		
800			Load Confirm Pending		
900			Closed		
```

<a id="p077-b001"></a>
## p077\-b001 — PDF page 77, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p077-b002"></a>
## p077\-b002 — PDF page 77, block 2

```text
 

```

<a id="p077-b003"></a>
## p077\-b003 — PDF page 77, block 3

```text
 
 
 
20.7.3 Replenishment 
 
The each/case demand from the wave is evaluated against the primary picking 
locations to determine if there is enough available.  If not, SCALE requests the 
product in case (or configured UM) increments by rounding up.  These 
replenishments create “In Transit” inventory to the forward picking locations which 
are then allocated by shipments during the Allocation wave step. This allocation is 
done leveraging FEFO strategy and is explained in more detail in the 
Replenishment section of the document. 
 
 
20.7.4 Override Data: Set Packing Class 
 
As part of this wave step, SCALE will assign a Packing class value on the shipment 
detail record which will indicate what items can be combined in a single shipping 
container and the type of shipping container to be used. 
Note: Knipper will utilize override data wave step to assign packing class at the 
shipment detail level as required to handle some special processing. Knipper will 
need to review the override data SQL fetch the packing class values from generic 
configuration based setup instead of hardcoded values.  
 
20.7.5 RTS Address Verification 
 

```

<a id="p077-b004"></a>
## p077\-b004 — PDF page 77, block 4

```text
As part of this custom wave step, SCALE will verify the ship to addresses with RTS 
system. This custom wave step is part of [EX38 – Serialization Integration with 
Rfxcel for Outbound]. If the ship to address is not successfully verified by RYS 
system, the shipments will be cancelled back to the pool. 
 
 
20.7.6 Allocation 
 
SCALE allocates inventory towards a shipment by using the allocation rule defined 
on the shipment detail. Allocation rules define what locations and units of measure 
are eligible for allocation and how SCALE should allocate that inventory. For 
example, an allocation rule can be configured to allocate inventory only from mid-
level bins and to allocate the inventory with the FIFO. Allocation rules can have 
multiple sequences. SCALE attempts to allocate inventory using the first sequence 
and if inventory could not be 100% allocated, SCALE continues to the next 
allocation rule sequence to attempt to allocate the remaining inventory. 
 
Allocation rules are set on the shipment detail in one of three ways. The allocation 
rule can be set at the item level (in the Item Master configuration) which in turn 
automatically defaults on the shipment detail. The interface can also set the 

```

<a id="p077-b005"></a>
## p077\-b005 — PDF page 77, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 77 of 119 
 

```

<a id="p077-t001"></a>
## p077\-t001 — PDF page 77, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20.7.3 Replenishment
The each/case demand from the wave is evaluated against the primary picking
locations to determine if there is enough available. If not, SCALE requests the
product in case (or configured UM) increments by rounding up. These
replenishments create “In Transit” inventory to the forward picking locations which
are then allocated by shipments during the Allocation wave step. This allocation is
done leveraging FEFO strategy and is explained in more detail in the
Replenishment section of the document.
20.7.4 Override Data: Set Packing Class
As part of this wave step, SCALE will assign a Packing class value on the shipment
detail record which will indicate what items can be combined in a single shipping
container and the type of shipping container to be used.
Note: Knipper will utilize override data wave step to assign packing class at the
shipment detail level as required to handle some special processing. Knipper will
need to review the override data SQL fetch the packing class values from generic
configuration based setup instead of hardcoded values.
20.7.5 RTS Address Verification
As part of this custom wave step, SCALE will verify the ship to addresses with RTS
system. This custom wave step is part of [EX38 – Serialization Integration with
Rfxcel for Outbound]. If the ship to address is not successfully verified by RYS
system, the shipments will be cancelled back to the pool.
20.7.6 Allocation
SCALE allocates inventory towards a shipment by using the allocation rule defined
on the shipment detail. Allocation rules define what locations and units of measure
are eligible for allocation and how SCALE should allocate that inventory. For
example, an allocation rule can be configured to allocate inventory only from mid-
level bins and to allocate the inventory with the FIFO. Allocation rules can have
multiple sequences. SCALE attempts to allocate inventory using the first sequence
and if inventory could not be 100% allocated, SCALE continues to the next
allocation rule sequence to attempt to allocate the remaining inventory.
Allocation rules are set on the shipment detail in one of three ways. The allocation
rule can be set at the item level (in the Item Master configuration) which in turn
automatically defaults on the shipment detail. The interface can also set the
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 77 of 119						
```

<a id="p078-b001"></a>
## p078\-b001 — PDF page 78, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p078-b002"></a>
## p078\-b002 — PDF page 78, block 2

```text
 

```

<a id="p078-b003"></a>
## p078\-b003 — PDF page 78, block 3

```text
allocation rule on the shipment detail. In addition, the allocation rule can be 
determined in the wave just prior to allocation occurring. This is done using the 
Allocation Rule Assignment functionality. Allocation Rule Assignment sets the 
allocation rule on the shipment detail based on user-defined criteria. For example, 
based on the customer and order type, the allocation rule can be set to one that 
allocated in only full cases. If no allocation rule is set on the shipment detail, the 
*Default allocation rule is used. To allow for maximum flexibility and easy addition 
of new items and allocation rules, the allocation rule is assigned on the Shipment 
Detail using the Allocation Rule Assignment functionality in the wave. Knipper can 
still manually set the allocation rule in the interface or via the Shipment Detail 
screen as needed. 
 
The below table covers majority of locations to allocate inventory for Shipments. 
The zone names in the below table are generic and multiple warehouses uses the 
same zone name with warehouse name appended in the name.  
 
Note: Knipper will utilize override data wave step to assign allocation rules at the 
shipment detail level as required to handle some special processing. Knipper will 
need to review the override data SQL fetch the allocation rule values from generic 
configuration based setup instead of hardcoded values.  
 
 
 

```

<a id="p078-b004"></a>
## p078\-b004 — PDF page 78, block 4

```text
 
Allocating Zone 
Description 
1 
A-DTP-PM 
A-DTP 
A-DTP REF 
A-DTP Cart 

```

<a id="p078-b005"></a>
## p078\-b005 — PDF page 78, block 5

```text
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
2 
A-DEA 
A-DEA-CAGE 
A-DEA-PM 

```

<a id="p078-b006"></a>
## p078\-b006 — PDF page 78, block 6

```text
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
3 
A-DEA-FLOOR 
• 
Multiple Item 
• 
Dynamically Assigned 
• 
License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
4 
A-3PL-CP 
A-3PL-PM 
A-3PL-LANE 
A-3PL-RESV 
 

```

<a id="p078-b007"></a>
## p078\-b007 — PDF page 78, block 7

```text
• 
Single Item 
• 
Dynamically Assigned 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 

```

<a id="p078-b008"></a>
## p078\-b008 — PDF page 78, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 78 of 119 
 

```

<a id="p078-t001"></a>
## p078\-t001 — PDF page 78, detected table 1

```text
				MENT	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
allocation rule on the shipment detail. In addition, the allocation rule can be
determined in the wave just prior to allocation occurring. This is done using the
Allocation Rule Assignment functionality. Allocation Rule Assignment sets the
allocation rule on the shipment detail based on user-defined criteria. For example,
based on the customer and order type, the allocation rule can be set to one that
allocated in only full cases. If no allocation rule is set on the shipment detail, the
*Default allocation rule is used. To allow for maximum flexibility and easy addition
of new items and allocation rules, the allocation rule is assigned on the Shipment
Detail using the Allocation Rule Assignment functionality in the wave. Knipper can
still manually set the allocation rule in the interface or via the Shipment Detail
screen as needed.
The below table covers majority of locations to allocate inventory for Shipments.
The zone names in the below table are generic and multiple warehouses uses the
same zone name with warehouse name appended in the name.
Note: Knipper will utilize override data wave step to assign allocation rules at the
shipment detail level as required to handle some special processing. Knipper will
need to review the override data SQL fetch the allocation rule values from generic
configuration based setup instead of hardcoded values.
Allocating Zone Description
1 A-DTP-PM • Single Item
A-DTP • Dynamically Assigned and Permanent
A-DTP REF • Not License Plate Tracking
A-DTP Cart • Allocate In Transit
• Inventory Status = Available
2 A-DEA • Single Item
A-DEA-CAGE • Dynamically Assigned and Permanent
A-DEA-PM • Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
3 A-DEA-FLOOR • Multiple Item
• Dynamically Assigned
• License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
4 A-3PL-CP • Single Item
A-3PL-PM • Dynamically Assigned
A-3PL-LANE • Not License Plate Tracking
A-3PL-RESV • Allocate In Transit
• Inventory Status = Available
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 78 of 119					
```

<a id="p078-t002"></a>
## p078\-t002 — PDF page 78, detected table 2

```text
			Allocating Zone			Description	
1		A-DTP-PM
A-DTP
A-DTP REF
A-DTP Cart			• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available		
2		A-DEA
A-DEA-CAGE
A-DEA-PM			• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available		
3		A-DEA-FLOOR			• Multiple Item
• Dynamically Assigned
• License Plate Tracking
• Allocate In Transit
• Inventory Status = Available		
4		A-3PL-CP
A-3PL-PM
A-3PL-LANE
A-3PL-RESV			• Single Item
• Dynamically Assigned
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available		
```

<a id="p079-b001"></a>
## p079\-b001 — PDF page 79, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p079-b002"></a>
## p079\-b002 — PDF page 79, block 2

```text
 

```

<a id="p079-b003"></a>
## p079\-b003 — PDF page 79, block 3

```text
5 
A-Shelves (KMW and 
OHW) 

```

<a id="p079-b004"></a>
## p079\-b004 — PDF page 79, block 4

```text
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
6 
A-FREEZER (KMW and 
OHW) 

```

<a id="p079-b005"></a>
## p079\-b005 — PDF page 79, block 5

```text
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
7 
A-REFG (KMW and 
OHW) 

```

<a id="p079-b006"></a>
## p079\-b006 — PDF page 79, block 6

```text
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
8 
A-PNP 
• 
Single Item 
• 
Dynamically Assigned and Permanent 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
9 
A-RESV (KMW and 
OHW) 

```

<a id="p079-b007"></a>
## p079\-b007 — PDF page 79, block 7

```text
• 
Single Item 
• 
Dynamically Assigned 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
10 A-CP (KMW and OHW) 
• 
Single Item 
• 
Dynamically Assigned 
• 
Not License Plate Tracking 
• 
Allocate In Transit 
• 
Inventory Status = Available 
 

```

<a id="p079-b008"></a>
## p079\-b008 — PDF page 79, block 8

```text
 
Allocation Sequence for non-Lot controlled: 
 

```

<a id="p079-b009"></a>
## p079\-b009 — PDF page 79, block 9

```text
Eligible 

```

<a id="p079-b010"></a>
## p079\-b010 — PDF page 79, block 10

```text
Inventory 

```

<a id="p079-b011"></a>
## p079\-b011 — PDF page 79, block 11

```text
Clear 

```

<a id="p079-b012"></a>
## p079\-b012 — PDF page 79, block 12

```text
Seq 
Strategy 

```

<a id="p079-b013"></a>
## p079\-b013 — PDF page 79, block 13

```text
Location 
Selection 

```

<a id="p079-b014"></a>
## p079\-b014 — PDF page 79, block 14

```text
UMs 

```

<a id="p079-b015"></a>
## p079\-b015 — PDF page 79, block 15

```text
Status 

```

<a id="p079-b016"></a>
## p079\-b016 — PDF page 79, block 16

```text
Loc? 

```

<a id="p079-b017"></a>
## p079\-b017 — PDF page 79, block 17

```text
 
Lot 
10 
First In First out 
A-RESV 
PL 
Available 
 
 

```

<a id="p079-b018"></a>
## p079\-b018 — PDF page 79, block 18

```text
20 
First In First Out 
A-CP 
CS 
Available 
 
 

```

<a id="p079-b019"></a>
## p079\-b019 — PDF page 79, block 19

```text
30 
First In First Out 
 
PK, EA 
Available 
 
 
 
 
Allocation Sequence for Lot controlled: 
 

```

<a id="p079-b020"></a>
## p079\-b020 — PDF page 79, block 20

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 79 of 119 
 

```

<a id="p079-t001"></a>
## p079\-t001 — PDF page 79, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
5 A-Shelves (KMW and • Single Item
OHW) • Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
6 A-FREEZER (KMW and • Single Item
OHW) • Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
7 A-REFG (KMW and • Single Item
OHW) • Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
8 A-PNP • Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
9 A-RESV (KMW and • Single Item
OHW) • Dynamically Assigned
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
10 A-CP (KMW and OHW) • Single Item
• Dynamically Assigned
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
Allocation Sequence for non-Lot controlled:
Location Eligible Inventory Clear
Seq Strategy Selection UMs Status Loc? Lot
10 First In First out A-RESV PL Available
20 First In First Out A-CP CS Available
30 First In First Out PK, EA Available
Allocation Sequence for Lot controlled:
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 79 of 119						
```

<a id="p079-t002"></a>
## p079\-t002 — PDF page 79, detected table 2

```text
5	A-Shelves (KMW and
OHW)	• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
6	A-FREEZER (KMW and
OHW)	• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
7	A-REFG (KMW and
OHW)	• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
8	A-PNP	• Single Item
• Dynamically Assigned and Permanent
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
9	A-RESV (KMW and
OHW)	• Single Item
• Dynamically Assigned
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
10	A-CP (KMW and OHW)	• Single Item
• Dynamically Assigned
• Not License Plate Tracking
• Allocate In Transit
• Inventory Status = Available
```

<a id="p079-t003"></a>
## p079\-t003 — PDF page 79, detected table 3

```text
Seq	Strategy		Location			Eligible			Inventory			Clear				
			Selection			UMs			Status			Loc?			Lot	
10	First In First out	A-RESV			PL			Available								
20	First In First Out	A-CP			CS			Available								
30	First In First Out				PK, EA			Available								
```

<a id="p080-b001"></a>
## p080\-b001 — PDF page 80, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p080-b002"></a>
## p080\-b002 — PDF page 80, block 2

```text
 

```

<a id="p080-b003"></a>
## p080\-b003 — PDF page 80, block 3

```text
Eligible 

```

<a id="p080-b004"></a>
## p080\-b004 — PDF page 80, block 4

```text
Inventory 

```

<a id="p080-b005"></a>
## p080\-b005 — PDF page 80, block 5

```text
Clear 

```

<a id="p080-b006"></a>
## p080\-b006 — PDF page 80, block 6

```text
Seq 
Strategy 

```

<a id="p080-b007"></a>
## p080\-b007 — PDF page 80, block 7

```text
Location 
Selection 

```

<a id="p080-b008"></a>
## p080\-b008 — PDF page 80, block 8

```text
UMs 

```

<a id="p080-b009"></a>
## p080\-b009 — PDF page 80, block 9

```text
Status 

```

<a id="p080-b010"></a>
## p080\-b010 — PDF page 80, block 10

```text
Loc? 

```

<a id="p080-b011"></a>
## p080\-b011 — PDF page 80, block 11

```text
 
Lot 

```

<a id="p080-b012"></a>
## p080\-b012 — PDF page 80, block 12

```text
A-RESV 

```

<a id="p080-b013"></a>
## p080\-b013 — PDF page 80, block 13

```text
Available 
 
 

```

<a id="p080-b014"></a>
## p080\-b014 — PDF page 80, block 14

```text
10 
First Expiration 
First out 

```

<a id="p080-b015"></a>
## p080\-b015 — PDF page 80, block 15

```text
PL 

```

<a id="p080-b016"></a>
## p080\-b016 — PDF page 80, block 16

```text
A-CP 

```

<a id="p080-b017"></a>
## p080\-b017 — PDF page 80, block 17

```text
Available 
 
 

```

<a id="p080-b018"></a>
## p080\-b018 — PDF page 80, block 18

```text
20 
First Expiration 
First out 

```

<a id="p080-b019"></a>
## p080\-b019 — PDF page 80, block 19

```text
CS 

```

<a id="p080-b020"></a>
## p080\-b020 — PDF page 80, block 20

```text
 

```

<a id="p080-b021"></a>
## p080\-b021 — PDF page 80, block 21

```text
Available 
 
 

```

<a id="p080-b022"></a>
## p080\-b022 — PDF page 80, block 22

```text
30 
First Expiration 
First out 

```

<a id="p080-b023"></a>
## p080\-b023 — PDF page 80, block 23

```text
PK, EA 

```

<a id="p080-b024"></a>
## p080\-b024 — PDF page 80, block 24

```text
 
 
   

```

<a id="p080-b025"></a>
## p080\-b025 — PDF page 80, block 25

```text
20.7.6.1 
Allocate Complete 
 
By setting the ‘Allocate Complete’ flag on the shipment header, SCALE does not 
perform any allocation for this shipment unless the shipment can be 100% 
allocated. For Knipper, allocate complete functionality is used for defined order 
profiles. 
 
 

```

<a id="p080-b026"></a>
## p080\-b026 — PDF page 80, block 26

```text
Commented [CC252]: We reject the whole shipment 

```

<a id="p080-b027"></a>
## p080\-b027 — PDF page 80, block 27

```text
Commented [NC253R252]: NC11182024: This does 
not happen today. MAH to update 

```

<a id="p080-b028"></a>
## p080\-b028 — PDF page 80, block 28

```text
Commented [RS254R252]: Updated 

```

<a id="p080-b029"></a>
## p080\-b029 — PDF page 80, block 29

```text
20.7.6.2 
Allocation Rejections 
 
If the shipment line is not completely allocated, then the entire Shipment is sent 
back to the pool on a back order. 
 
Note: Default status when a shipment is rejected is set to ‘In Pool’ 
 
20.7.7 DTP Location Assignment 
 

```

<a id="p080-b030"></a>
## p080\-b030 — PDF page 80, block 30

```text
Commented [NC255R252]: NC12052024: This is 
resolved. 

```

<a id="p080-b031"></a>
## p080\-b031 — PDF page 80, block 31

```text
This custom wave step is part of [EX13 – Pick to Light Wave Splitting]. This 
wave step evaluates the orders allocated at Virtual Locations and assigns them to 
a series of Pick to Light Locations in groups across one or more sub waves.  As 
the wave step cycles through the Pick to Light locations of each sub wave, orders 
are assigned to Pick to light locations based on “Most common items” that have 
the “fewest number of lines.”. 
 
20.7.8 DTP Wave Splitting 
 

```

<a id="p080-b032"></a>
## p080\-b032 — PDF page 80, block 32

```text
This custom wave step is part of [EX13 – Pick to Light Wave Splitting]. Once 
Pick to Light Assignment has been completed, a separate Wave step is executed 
to move the shipments, their allocations, and replenishments into a new wave for 
the Sub Wave Master.  After this information has been transferred to the new wave, 
the Replenishment and Allocation Requests are moved from their Virtual Location 
to the Assigned Pick to Light Location in the sub wave. 
 
20.7.9 Container Creation 
 

```

<a id="p080-b033"></a>
## p080\-b033 — PDF page 80, block 33

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 80 of 119 
 

```

<a id="p080-t001"></a>
## p080\-t001 — PDF page 80, detected table 1

```text
					MENT
Commented [CC252]: We reject the whole shipment
Commented [NC253R252]: NC11182024: This does
not happen today. MAH to update
Commented [RS254R252]: Updated
Commented [NC255R252]: NC12052024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Location Eligible Inventory Clear
Seq Strategy Selection UMs Status Loc? Lot
First Expiration A-RESV Available
10 First out PL
First Expiration A-CP Available
20 First out CS
First Expiration Available
30 First out PK, EA
20.7.6.1 Allocate Complete
By setting the ‘Allocate Complete’ flag on the shipment header, SCALE does not
perform any allocation for this shipment unless the shipment can be 100%
allocated. For Knipper, allocate complete functionality is used for defined order
profiles.
20.7.6.2 Allocation Rejections
If the shipment line is not completely allocated, then the entire Shipment is sent
back to the pool on a back order.
Note: Default status when a shipment is rejected is set to ‘In Pool’
20.7.7 DTP Location Assignment
This custom wave step is part of [EX13 – Pick to Light Wave Splitting]. This
wave step evaluates the orders allocated at Virtual Locations and assigns them to
a series of Pick to Light Locations in groups across one or more sub waves. As
the wave step cycles through the Pick to Light locations of each sub wave, orders
are assigned to Pick to light locations based on “Most common items” that have
the “fewest number of lines.”.
20.7.8 DTP Wave Splitting
This custom wave step is part of [EX13 – Pick to Light Wave Splitting]. Once
Pick to Light Assignment has been completed, a separate Wave step is executed
to move the shipments, their allocations, and replenishments into a new wave for
the Sub Wave Master. After this information has been transferred to the new wave,
the Replenishment and Allocation Requests are moved from their Virtual Location
to the Assigned Pick to Light Location in the sub wave.
20.7.9 Container Creation
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 80 of 119						
```

<a id="p080-t002"></a>
## p080\-t002 — PDF page 80, detected table 2

```text
Seq	Strategy		Location			Eligible			Inventory			Clear				
			Selection			UMs			Status			Loc?			Lot	
10	First Expiration
First out	A-RESV			PL			Available								
20	First Expiration
First out	A-CP			CS			Available								
30	First Expiration
First out				PK, EA			Available								
```

<a id="p081-b001"></a>
## p081\-b001 — PDF page 81, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p081-b002"></a>
## p081\-b002 — PDF page 81, block 2

```text
 

```

<a id="p081-b003"></a>
## p081\-b003 — PDF page 81, block 3

```text
Container creation is the process in which SCALE determines the number of 
containers and each container’s contents for every shipment on the wave.  A 
unique container number, commonly referred to as a UCC 128, is assigned to 
every container as it is created.   
 
SCALE first takes all items whose allocated unit of measure is set up as a 
‘shippable unit’ and creates full containers.   Shippable units are defined in the item 
unit of measure configuration.  Full containers are containers that are shippable 
without repacking into another container (box).  Pallets, gaylords, and certain 
cases are generally configured as shippable units. 
 
SCALE then takes the remaining ‘loose’ items whose allocated unit of measure is 
set up as ‘not shippable’ and groups them together by Packing Class. A Packing 
Class is defined on the Item Master and then defaulted on the Shipment Detail.    
Each Packing Class is associated with a container group.   A container group is a 
listing of container types (box sizes) listed from largest container to smallest 
container.  SCALE attempts to cube items into the least number of containers 
possible.  The total weight and volume are calculated for all the items on the 
shipment with the same packing group.  SCALE first tries to cube into the first 
container of the container group.  If capacity still exists, the system tries cubing 
into the next container type and continues until either capacity in the next priority 
is reached or there are no additional priorities.   
 
If there is not enough capacity in the largest container, then SCALE cubes as much 
as possible into the largest container, calculates the remaining weight and volume, 
and starts over.   SCALE considers the critical dimensions of each item it creates 
containers.  An item is not cubed into a container if any one of its critical dimensions 
is greater than the corresponding container dimension. 
 
If an item doesn’t have unit of measure record defined, then SCALE treats the item 
to have dimension of 0*0*0 and of weight 0 LB. Knipper can build oSCI report that 
will provide the list of all items that have missing dimension in pool and use that to 
handle the exception. Knipper can also create personal alerts-based Notification 
to send all the items that have missing dimensions.  
 
Knipper ships cooler and Freezer items. These require icepacks and dry ice to be 
present inside the shipping container. [EX17 – Re-Cartonization of Containers 
based on Season] will be used to handle special Cartonization requirements for 
some customers. 
 
 
 
20.7.10 
Override Data: Assign Accessorial 
 

```

<a id="p081-b004"></a>
## p081\-b004 — PDF page 81, block 4

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 81 of 119 
 

```

<a id="p081-t001"></a>
## p081\-t001 — PDF page 81, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Container creation is the process in which SCALE determines the number of
containers and each container’s contents for every shipment on the wave. A
unique container number, commonly referred to as a UCC 128, is assigned to
every container as it is created.
SCALE first takes all items whose allocated unit of measure is set up as a
‘shippable unit’ and creates full containers. Shippable units are defined in the item
unit of measure configuration. Full containers are containers that are shippable
without repacking into another container (box). Pallets, gaylords, and certain
cases are generally configured as shippable units.
SCALE then takes the remaining ‘loose’ items whose allocated unit of measure is
set up as ‘not shippable’ and groups them together by Packing Class. A Packing
Class is defined on the Item Master and then defaulted on the Shipment Detail.
Each Packing Class is associated with a container group. A container group is a
listing of container types (box sizes) listed from largest container to smallest
container. SCALE attempts to cube items into the least number of containers
possible. The total weight and volume are calculated for all the items on the
shipment with the same packing group. SCALE first tries to cube into the first
container of the container group. If capacity still exists, the system tries cubing
into the next container type and continues until either capacity in the next priority
is reached or there are no additional priorities.
If there is not enough capacity in the largest container, then SCALE cubes as much
as possible into the largest container, calculates the remaining weight and volume,
and starts over. SCALE considers the critical dimensions of each item it creates
containers. An item is not cubed into a container if any one of its critical dimensions
is greater than the corresponding container dimension.
If an item doesn’t have unit of measure record defined, then SCALE treats the item
to have dimension of 0*0*0 and of weight 0 LB. Knipper can build oSCI report that
will provide the list of all items that have missing dimension in pool and use that to
handle the exception. Knipper can also create personal alerts-based Notification
to send all the items that have missing dimensions.
Knipper ships cooler and Freezer items. These require icepacks and dry ice to be
present inside the shipping container. [EX17 – Re-Cartonization of Containers
based on Season] will be used to handle special Cartonization requirements for
some customers.
20.7.10 Override Data: Assign Accessorial
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 81 of 119						
```

<a id="p082-b001"></a>
## p082\-b001 — PDF page 82, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p082-b002"></a>
## p082\-b002 — PDF page 82, block 2

```text
 

```

<a id="p082-b003"></a>
## p082\-b003 — PDF page 82, block 3

```text
Commented [SG256]: Looks like lot of custom 
accessorials 

```

<a id="p082-b004"></a>
## p082\-b004 — PDF page 82, block 4

```text
Knipper uses third party / customer account for billing some of their parcel 
shipments while the others are billed to Knipper. For the third-party billing, Knipper 
assigns accessorial to the required cartons for the parcel orders.  
 
Third party billing information is applied via an override data wave step (ODWS) in 
wave. Knipper provides the account number, billing address and other information 
that must be billed and interface to shipment header through shipment download 
interface. This ODWS reads the information and applies to the cartons when 
SCALE communicates to FedEx. During the build phase, the scope of this ODWS 
will be evaluated.  
 
Knipper will be using the below accessorial. 
 

```

<a id="p082-b005"></a>
## p082\-b005 — PDF page 82, block 5

```text
Commented [NC257R256]: NC11182024: ok  

```

<a id="p082-b006"></a>
## p082\-b006 — PDF page 82, block 6

```text
• 
3rd Pty Billing 
• 
Alternate Address 
• 
Auto POD 
• 
COD 
• 
Collect 
• 
Commercial Invoice Method 
• 
Consignee 3rd Pty Billing 
• 
Delivery Notification 
• 
Department 
• 
Dlvy Confirm 
• 
Dry Ice 
• 
Duty Tax Payment Type 
• 
DVL 
• 
EEI 
• 
FedEx Ref 
• 
Flats 
• 
HAZMAT 
• 
HLD 
• 
Home Delivery Type 
• 
Insurance 
• 
Pickup / Delivery 
• 
POD 
• 
Premier Service 
• 
Print Alt Return Add Flag 
• 
Proactive Recovery 
• 
Proactive Response 
• 
Quantum View Dlvy 
• 
Quantum View Exception 
• 
Reference 
• 
References 
• 
Registered Mail 

```

<a id="p082-b007"></a>
## p082\-b007 — PDF page 82, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 82 of 119 
 

```

<a id="p082-t001"></a>
## p082\-t001 — PDF page 82, detected table 1

```text
					MENT
Commented [SG256]: Looks like lot of custom
accessorials
Commented [NC257R256]: NC11182024: ok	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Knipper uses third party / customer account for billing some of their parcel
shipments while the others are billed to Knipper. For the third-party billing, Knipper
assigns accessorial to the required cartons for the parcel orders.
Third party billing information is applied via an override data wave step (ODWS) in
wave. Knipper provides the account number, billing address and other information
that must be billed and interface to shipment header through shipment download
interface. This ODWS reads the information and applies to the cartons when
SCALE communicates to FedEx. During the build phase, the scope of this ODWS
will be evaluated.
Knipper will be using the below accessorial.
• 3rd Pty Billing
• Alternate Address
• Auto POD
• COD
• Collect
• Commercial Invoice Method
• Consignee 3rd Pty Billing
• Delivery Notification
• Department
• Dlvy Confirm
• Dry Ice
• Duty Tax Payment Type
• DVL
• EEI
• FedEx Ref
• Flats
• HAZMAT
• HLD
• Home Delivery Type
• Insurance
• Pickup / Delivery
• POD
• Premier Service
• Print Alt Return Add Flag
• Proactive Recovery
• Proactive Response
• Quantum View Dlvy
• Quantum View Exception
• Reference
• References
• Registered Mail
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 82 of 119						
```

<a id="p083-b001"></a>
## p083\-b001 — PDF page 83, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p083-b002"></a>
## p083\-b002 — PDF page 83, block 2

```text
 

```

<a id="p083-b003"></a>
## p083\-b003 — PDF page 83, block 3

```text
• 
Return Delivery 
• 
Return Shipment Indicator 
• 
Sat Dlvy 
• 
SED 
• 
Sign Rlse 
• 
Signature Required 
• 
Signature Required - Adlt 
• 
Signature Required - Dirc 
• 
VATEIN number 
 
 
20.7.11 
QC Assignment  
 
The QC Assignment wave step assigns QC activities to shipping containers for 
any matching criteria configured within SCALE’s QC Assignment Criteria. 
For Knipper, every shipping container created in wave will be assigned to QC. 
For scenarios where pallet is created using the pallet building wave step, QC will 
be assigned at the pallet level.  
 
Note: For QC to be assigned, containers must be created as part of wave. Also, 
for Knipper we need to enable QC execution at pallet level. This will be handled 
as an extension (TBD) in SCALE. 
 
 

```

<a id="p083-b004"></a>
## p083\-b004 — PDF page 83, block 4

```text
 
20.7.12 
Pallet Building 
 

```

<a id="p083-b005"></a>
## p083\-b005 — PDF page 83, block 5

```text
Knipper uses wave-based pallet building for LTL/TL order waves.  
 
 
Pallet Building consists of a set of requirements, strategy and the Container Type 
for the pallet being built.  The Container Type drives the dimensions, weight and 
height of the pallet so that these constraints are known so the build pallet meets 
the specifications defined in the configurations. 
 
The Pallet Building Requirements help define the types of containers that should 
be included, but also sort these containers so that the pallets are built in the most 
efficient but cleanest way to keep boxes from crushing other boxes if stacked 
incorrectly.  Finally, the criterion helps define if any attribute should automatically 
break to a new pallet regardless of if the height or weight is met.  For customers 
that require that a pallet can contain only a single item, this break field is used to 
make sure that all items are on their own pallet. 
 
Pallet Building Strategies take the Requirements and Container Type and build out 
the pallet.  The standard strategy takes the containers and builds out layers until 
the height or weight of the pallet meets the limits on the Container Type.  This 

```

<a id="p083-b006"></a>
## p083\-b006 — PDF page 83, block 6

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 83 of 119 
 

```

<a id="p083-t001"></a>
## p083\-t001 — PDF page 83, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• Return Delivery
• Return Shipment Indicator
• Sat Dlvy
• SED
• Sign Rlse
• Signature Required
• Signature Required - Adlt
• Signature Required - Dirc
• VATEIN number
20.7.11 QC Assignment
The QC Assignment wave step assigns QC activities to shipping containers for
any matching criteria configured within SCALE’s QC Assignment Criteria.
For Knipper, every shipping container created in wave will be assigned to QC.
For scenarios where pallet is created using the pallet building wave step, QC will
be assigned at the pallet level.
Note: For QC to be assigned, containers must be created as part of wave. Also,
for Knipper we need to enable QC execution at pallet level. This will be handled
as an extension (TBD) in SCALE.
20.7.12 Pallet Building
Knipper uses wave-based pallet building for LTL/TL order waves.
Pallet Building consists of a set of requirements, strategy and the Container Type
for the pallet being built. The Container Type drives the dimensions, weight and
height of the pallet so that these constraints are known so the build pallet meets
the specifications defined in the configurations.
The Pallet Building Requirements help define the types of containers that should
be included, but also sort these containers so that the pallets are built in the most
efficient but cleanest way to keep boxes from crushing other boxes if stacked
incorrectly. Finally, the criterion helps define if any attribute should automatically
break to a new pallet regardless of if the height or weight is met. For customers
that require that a pallet can contain only a single item, this break field is used to
make sure that all items are on their own pallet.
Pallet Building Strategies take the Requirements and Container Type and build out
the pallet. The standard strategy takes the containers and builds out layers until
the height or weight of the pallet meets the limits on the Container Type. This
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 83 of 119						
```

<a id="p084-b001"></a>
## p084\-b001 — PDF page 84, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p084-b002"></a>
## p084\-b002 — PDF page 84, block 2

```text
 

```

<a id="p084-b003"></a>
## p084\-b003 — PDF page 84, block 3

```text
strategy also needs to incorporate the grouping of items, so that SCALE does not 
attempt to ship two mixed pallets with the same item on both pallets.  This strategy 
looks out for any items that are not grouped together and consolidates these items 
onto the same pallet if they can be physically fit based on the quantity being 
shipped.  
 
Full cases picked from the selective reserve or case area may be palletized. 
Knipper may use the Maximum Height and Weight Strategy for pallet building and 
uses the pallet building criteria to exclude full allocated pallets. Over time, Knipper 
may setup additional criteria and strategies based on the product category. Pallet 
building criteria can be ordered by descending shipping container weight.  
 
Knipper uses ‘Build Pallets using Height-Weight’ strategy. 
 
 
20.7.13 
Load Building 
 

```

<a id="p084-b004"></a>
## p084\-b004 — PDF page 84, block 4

```text
With this wave step, SCALE attempts to assign all shipments on the wave to a 
shipping load (using shipment criteria) for a carrier. The system executes this 
process as follows: 
 

```

<a id="p084-b005"></a>
## p084\-b005 — PDF page 84, block 5

```text
• 
The system orders all of wave's shipments by carrier, ignoring shipments 
that do not have a carrier assigned. 
• 
The system takes each shipment and looks for any open loads for the 
carrier, scheduled ship date, and route. If the system finds one, the 
shipment is added to that load, unless the load is not flagged to stop 
additional shipments to it. 
• 
If there are no loads in the system for the carrier, scheduled ship date, and 
route, SCALE creates a new load for these parameters and places the 
shipment on this new load. 
 
 
 
20.7.14 
Dock Assignment 
 

```

<a id="p084-b006"></a>
## p084\-b006 — PDF page 84, block 6

```text
Dock Assignment determines where product is moved to, after it is picked. This 
could be any one of the following: manifest station, staging location, or dock door. 
Knipper defines a custom status flow for each of the different process flows in the 
system (defined above).  Based on the status flows, the Dock Assignment wave 
step assigns the correct packing, staging or dock door location for an order. This 
is controlled by three configurations: Dock Area Carrier Assignment, Dock Area 
Anchor Criteria and Dock Management Flow.  
 
A dock management flow record includes information that determines how the 
system will assign a dock location destination to a shipment line/container and if 
the line/container is eligible for assignment. Each flow record is made up of a series 

```

<a id="p084-b007"></a>
## p084\-b007 — PDF page 84, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 84 of 119 
 

```

<a id="p084-t001"></a>
## p084\-t001 — PDF page 84, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
strategy also needs to incorporate the grouping of items, so that SCALE does not
attempt to ship two mixed pallets with the same item on both pallets. This strategy
looks out for any items that are not grouped together and consolidates these items
onto the same pallet if they can be physically fit based on the quantity being
shipped.
Full cases picked from the selective reserve or case area may be palletized.
Knipper may use the Maximum Height and Weight Strategy for pallet building and
uses the pallet building criteria to exclude full allocated pallets. Over time, Knipper
may setup additional criteria and strategies based on the product category. Pallet
building criteria can be ordered by descending shipping container weight.
Knipper uses ‘Build Pallets using Height-Weight’ strategy.
20.7.13 Load Building
With this wave step, SCALE attempts to assign all shipments on the wave to a
shipping load (using shipment criteria) for a carrier. The system executes this
process as follows:
• The system orders all of wave's shipments by carrier, ignoring shipments
that do not have a carrier assigned.
• The system takes each shipment and looks for any open loads for the
carrier, scheduled ship date, and route. If the system finds one, the
shipment is added to that load, unless the load is not flagged to stop
additional shipments to it.
• If there are no loads in the system for the carrier, scheduled ship date, and
route, SCALE creates a new load for these parameters and places the
shipment on this new load.
20.7.14 Dock Assignment
Dock Assignment determines where product is moved to, after it is picked. This
could be any one of the following: manifest station, staging location, or dock door.
Knipper defines a custom status flow for each of the different process flows in the
system (defined above). Based on the status flows, the Dock Assignment wave
step assigns the correct packing, staging or dock door location for an order. This
is controlled by three configurations: Dock Area Carrier Assignment, Dock Area
Anchor Criteria and Dock Management Flow.
A dock management flow record includes information that determines how the
system will assign a dock location destination to a shipment line/container and if
the line/container is eligible for assignment. Each flow record is made up of a series
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 84 of 119						
```

<a id="p085-b001"></a>
## p085\-b001 — PDF page 85, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p085-b002"></a>
## p085\-b002 — PDF page 85, block 2

```text
 

```

<a id="p085-b003"></a>
## p085\-b003 — PDF page 85, block 3

```text
of detail records that identify what selection and assignment strategies that the 
system should use when a quantity hits a certain status in your status flow. You 
can indicate what type of dock location you want the system to assign to this entity. 
Also, both the flow header and detail(s) have a default location that the system will 
assign as a "fallback" option in case no eligible dock area/positions are found. 
 
For Knipper, the dock assignment is leveraged for TL/LTL as well as parcel 
shipments. SCALE assigns single staging locations to a shipment based on 
customer and carrier. Multiple dock management flow is used based on each of 
these parameters and dock door assignment happens manually later to create 
work.  
 
If a new shipment on a different wave needs to be added to a load that is staged, 
by base the new shipment (new wave) gets default staging lane that can be 
different than what is on the original. Knipper uses manual SOP to assign the 
status flow for staging lane with the existing load.  
 
20.7.15 
Work Creation  
 

```

<a id="p085-b004"></a>
## p085\-b004 — PDF page 85, block 4

```text
The work creation process performed during the wave is like the work creation 
process performed during the locating portion of the receiving process. After 
performing allocation and container creation, SCALE creates a work unit to pick 
the inventory from a location (bins or racks) and transport the inventory to the 
shipping area based on the configuration in the Work Group, Work Type, Work 
Criteria, and Work Creation Master. Each location can be assigned a numeric 
value called Picking Sequence that can be used to sort the picks in an order other 
than alphabetical by location. 
 
 

```

<a id="p085-b005"></a>
## p085\-b005 — PDF page 85, block 5

```text
20.7.16 
Work Creation Replenishment 
 

```

<a id="p085-b006"></a>
## p085\-b006 — PDF page 85, block 6

```text
Commented [SG258]: Under wrong heading 

```

<a id="p085-b007"></a>
## p085\-b007 — PDF page 85, block 7

```text
The work creation process for replenishment during the wave is only for any 
demand-based replenishments that were created. The types of work that are 
generated from this wave step can be viewed in the Replenishment section of this 
document. There is no change to existing work creation setup. 
 
 
20.7.17 
Work Creation - Shipping Container 
 

```

<a id="p085-b008"></a>
## p085\-b008 — PDF page 85, block 8

```text
Following key Work Types are created:  

```

<a id="p085-b009"></a>
## p085\-b009 — PDF page 85, block 9

```text
Commented [NC259R258]: NC11182024: if this is 
under the wrong heading -  please update  

```

<a id="p085-b010"></a>
## p085\-b010 — PDF page 85, block 10

```text
Commented [RS260R258]: The header has already 
been corrected. 

```

<a id="p085-b011"></a>
## p085\-b011 — PDF page 85, block 11

```text
 
Work Type: Group (Cart) Pick 
 
One work unit is created per shipping container. User will group a set of 
containers onto a Cart (this will enable group picking). If a cart has more 
than one item, the work instruction (picks) is sequenced by pick sequence.  

```

<a id="p085-b012"></a>
## p085\-b012 — PDF page 85, block 12

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 85 of 119 
 

```

<a id="p085-t001"></a>
## p085\-t001 — PDF page 85, detected table 1

```text
					MENT
Commented [SG258]: Under wrong heading
Commented [NC259R258]: NC11182024: if this is
under the wrong heading - please update
Commented [RS260R258]: The header has already
been corrected.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
of detail records that identify what selection and assignment strategies that the
system should use when a quantity hits a certain status in your status flow. You
can indicate what type of dock location you want the system to assign to this entity.
Also, both the flow header and detail(s) have a default location that the system will
assign as a "fallback" option in case no eligible dock area/positions are found.
For Knipper, the dock assignment is leveraged for TL/LTL as well as parcel
shipments. SCALE assigns single staging locations to a shipment based on
customer and carrier. Multiple dock management flow is used based on each of
these parameters and dock door assignment happens manually later to create
work.
If a new shipment on a different wave needs to be added to a load that is staged,
by base the new shipment (new wave) gets default staging lane that can be
different than what is on the original. Knipper uses manual SOP to assign the
status flow for staging lane with the existing load.
20.7.15 Work Creation
The work creation process performed during the wave is like the work creation
process performed during the locating portion of the receiving process. After
performing allocation and container creation, SCALE creates a work unit to pick
the inventory from a location (bins or racks) and transport the inventory to the
shipping area based on the configuration in the Work Group, Work Type, Work
Criteria, and Work Creation Master. Each location can be assigned a numeric
value called Picking Sequence that can be used to sort the picks in an order other
than alphabetical by location.
20.7.16 Work Creation Replenishment
The work creation process for replenishment during the wave is only for any
demand-based replenishments that were created. The types of work that are
generated from this wave step can be viewed in the Replenishment section of this
document. There is no change to existing work creation setup.
20.7.17 Work Creation - Shipping Container
Following key Work Types are created:
Work Type: Group (Cart) Pick
One work unit is created per shipping container. User will group a set of
containers onto a Cart (this will enable group picking). If a cart has more
than one item, the work instruction (picks) is sequenced by pick sequence.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 85 of 119						
```

<a id="p086-b001"></a>
## p086\-b001 — PDF page 86, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p086-b002"></a>
## p086\-b002 — PDF page 86, block 2

```text
 

```

<a id="p086-b003"></a>
## p086\-b003 — PDF page 86, block 3

```text
Commented [MA261]: KMW will need DSCSA 
Work Types as well.  

```

<a id="p086-b004"></a>
## p086\-b004 — PDF page 86, block 4

```text
Commented [NC262R261]: NC11182024: All Facilities 
NJ (OHW, KDC and KMW) have the ability to do 
DSCSA - MAH please update this work type 

```

<a id="p086-b005"></a>
## p086\-b005 — PDF page 86, block 5

```text
Commented [RS263R261]: We can always create 
multiple work types by warehouse. However, it is 
recommended to keep one which can be used by all 
the warehouses. 

```

<a id="p086-b006"></a>
## p086\-b006 — PDF page 86, block 6

```text
Commented [NC264R261]: NC12052024: This is 
resolved 

```

<a id="p086-b007"></a>
## p086\-b007 — PDF page 86, block 7

```text
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities. 
 
Work Type: 3PL Pick 
 
One work unit is created per pallet built using the pallet building wave step. 
The work unit will include Repack boxes and Full Cases nested onto a 
pallet. The work is ordered based on the pick sequence. This work type 
includes Full cases and Repack boxes that are picked from ambient zone.   
 
 
Work Type: Cooler Pick 
 
One work unit is created per shipping container. Within the work unit the 
work instruction (picks) is sequenced by picking sequence. This work type 
includes Items that are picked from Cooler zone. 
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities. 
 
 
Work Type: 3PL Pick DSCSA 
 
One work unit is created per pallet built using the pallet building wave step. 
The work unit will include Repack boxes and Full Cases nested onto a 
pallet. The work is ordered based on the pick sequence. This work type 
includes picking for DSCSA tracking enabled Items. 
[EX38 – Serialization Integration with Rfxcel for Outbound] enables 
DSCSA tracking to validate GTINs and Serial numbers during picking for 
different UMS. The extension design document describes the entire flow in 
detail. 
 
Work Type: REPS Pick 
 
One work unit is created per Wave. The work is ordered based on the pick 
sequence. This work type includes Full cases and Repack boxes that are 
picked for medical representative orders. 
 
 Work Type: DEA Pick 
 
One work unit is created per shipping container. Within the work unit the 
work instruction (picks) is sequenced by picking sequence. This work type 
includes Items that are picked from DEA zone. 
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities. 
 
 

```

<a id="p086-b008"></a>
## p086\-b008 — PDF page 86, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 86 of 119 
 

```

<a id="p086-t001"></a>
## p086\-t001 — PDF page 86, detected table 1

```text
					MENT
Commented [MA261]: KMW will need DSCSA
Work Types as well.
Commented [NC262R261]: NC11182024: All Facilities
NJ (OHW, KDC and KMW) have the ability to do
DSCSA - MAH please update this work type
Commented [RS263R261]: We can always create
multiple work types by warehouse. However, it is
recommended to keep one which can be used by all
the warehouses.
Commented [NC264R261]: NC12052024: This is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities.
Work Type: 3PL Pick
One work unit is created per pallet built using the pallet building wave step.
The work unit will include Repack boxes and Full Cases nested onto a
pallet. The work is ordered based on the pick sequence. This work type
includes Full cases and Repack boxes that are picked from ambient zone.
Work Type: Cooler Pick
One work unit is created per shipping container. Within the work unit the
work instruction (picks) is sequenced by picking sequence. This work type
includes Items that are picked from Cooler zone.
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities.
Work Type: 3PL Pick DSCSA
One work unit is created per pallet built using the pallet building wave step.
The work unit will include Repack boxes and Full Cases nested onto a
pallet. The work is ordered based on the pick sequence. This work type
includes picking for DSCSA tracking enabled Items.
[EX38 – Serialization Integration with Rfxcel for Outbound] enables
DSCSA tracking to validate GTINs and Serial numbers during picking for
different UMS. The extension design document describes the entire flow in
detail.
Work Type: REPS Pick
One work unit is created per Wave. The work is ordered based on the pick
sequence. This work type includes Full cases and Repack boxes that are
picked for medical representative orders.
Work Type: DEA Pick
One work unit is created per shipping container. Within the work unit the
work instruction (picks) is sequenced by picking sequence. This work type
includes Items that are picked from DEA zone.
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 86 of 119						
```

<a id="p087-b001"></a>
## p087\-b001 — PDF page 87, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p087-b002"></a>
## p087\-b002 — PDF page 87, block 2

```text
 

```

<a id="p087-b003"></a>
## p087\-b003 — PDF page 87, block 3

```text
 
 
 
Work Type: PM Pick (non MHE) 
 
One work unit is created per shipping container. Within the work unit the 
work instruction (picks) is sequenced by picking sequence. This work type 
includes Items that are picked from Pick Module zone. 
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities 
 
Work Type: PTL Pick (Pick to Light MHE) 
 
One work unit is created per shipping container. This work type includes 
orders that are picked from PTL (Pick to Light) controlled zone. 
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities for different types of orders (e.g. DTP). [EX19 
Pict to Light Integration] will auto execute the work units upon receiving 
pick confirmation messages from PTL. 
 
Work Type: PTL Case Pick (Pick to Light MHE) 
 
One work unit is created per shipping container. This work type includes 
orders that are picked from PTL (Pick to Light) controlled zone for full case 
picks. 
Note: This type for picking will be utilized by both the business units (3PL 
and MSM) in all the facilities for different types of orders (e.g. DTP). 
[EX19 Pict to Light Integration] will auto execute the work units upon 
receiving pick confirmation messages from PTL. 
 
20.7.18 
Paperwork - Labels 
 
Knipper uses existing paperwork setup.  
 
Container content labels (LBL03) and Shipping labels (LBL04) will be printed per 
container for repack boxes for Parcel carrier shipments. 
Container content labels (LBL03) and Shipping labels (LBL04) will be printed for 
Full cases for parcel carrier shipments. 
 
Container content labels (LBL03) and Vendor label (LBL02) will be printed for 
LTL/TL carrier shipments.  
 
These Labels are printed at the time of wave release. 

```

<a id="p087-b004"></a>
## p087\-b004 — PDF page 87, block 4

```text
 
 
 
 
 

```

<a id="p087-b005"></a>
## p087\-b005 — PDF page 87, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 87 of 119 
 

```

<a id="p087-t001"></a>
## p087\-t001 — PDF page 87, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Work Type: PM Pick (non MHE)
One work unit is created per shipping container. Within the work unit the
work instruction (picks) is sequenced by picking sequence. This work type
includes Items that are picked from Pick Module zone.
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities
Work Type: PTL Pick (Pick to Light MHE)
One work unit is created per shipping container. This work type includes
orders that are picked from PTL (Pick to Light) controlled zone.
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities for different types of orders (e.g. DTP). [EX19
Pict to Light Integration] will auto execute the work units upon receiving
pick confirmation messages from PTL.
Work Type: PTL Case Pick (Pick to Light MHE)
One work unit is created per shipping container. This work type includes
orders that are picked from PTL (Pick to Light) controlled zone for full case
picks.
Note: This type for picking will be utilized by both the business units (3PL
and MSM) in all the facilities for different types of orders (e.g. DTP).
[EX19 Pict to Light Integration] will auto execute the work units upon
receiving pick confirmation messages from PTL.
20.7.18 Paperwork - Labels
Knipper uses existing paperwork setup.
Container content labels (LBL03) and Shipping labels (LBL04) will be printed per
container for repack boxes for Parcel carrier shipments.
Container content labels (LBL03) and Shipping labels (LBL04) will be printed for
Full cases for parcel carrier shipments.
Container content labels (LBL03) and Vendor label (LBL02) will be printed for
LTL/TL carrier shipments.
These Labels are printed at the time of wave release.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 87 of 119						
```

<a id="p088-b001"></a>
## p088\-b001 — PDF page 88, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p088-b002"></a>
## p088\-b002 — PDF page 88, block 2

```text
 

```

<a id="p088-b003"></a>
## p088\-b003 — PDF page 88, block 3

```text
 

```

<a id="p088-b004"></a>
## p088\-b004 — PDF page 88, block 4

```text
 
20.7.19 
Paperwork – Documents 
 

```

<a id="p088-b005"></a>
## p088\-b005 — PDF page 88, block 5

```text
Knipper prints Shipment Pack List during the wave and will use multiple different 
templates for customer requirements. 
Note: Knipper utilizes an external printing process (VVIP) to print special formats 
of shipment pack list for specific customers. VVIP requires SCALE to generate an 
input file (XML format) per wave. An extension (TBD) will be developed to 
accomplish this requirement. 
 
20.7.20 
Override Data: Check for No Work 
 
This Override Data Wave Step ensures that the Work Creation configurations are 
correct, and every Shipment has work created successfully, otherwise marks the 
wave for failure. 
 
 
 

```

<a id="p088-b006"></a>
## p088\-b006 — PDF page 88, block 6

```text
20.7.21 
Multiple ODWS placeholder 
 
Knipper may user multiple other override data wave steps. This is a placeholder 
for it. There are other steps in current system included in other wave flows that 
mostly have programmatic checks ensuring that ineligible order types are not 
waved in those wave flows.  
 

```

<a id="p088-b007"></a>
## p088\-b007 — PDF page 88, block 7

```text
20.7.22 
Complete Wave 
 
Complete Wave updates each shipment with a status of Picking Pending.  
Shipments with this status are now eligible for release. 
 
There may be additional wave steps to the above that Knipper can leverage for 
various wave flows though the ones mentioned above are the key. Examples may 
include updating user-defined fields for any reporting needs. 
 

```

<a id="p088-b008"></a>
## p088\-b008 — PDF page 88, block 8

```text
21.0 
WAVE MANAGEMENT 
 

```

<a id="p088-b009"></a>
## p088\-b009 — PDF page 88, block 9

```text
Commented [BK265]: 5.1 Cancel Wave - when a 
wave is released but work has started, it can no 
longer be cancelled at the user level and IT staff 
needs to be asked to step in. When systemic driven 
work has been scanned and the wave has "started" 
this presents a problem. We would prefer a wave be 
able to be interrupted, cancelled after being started.  

```

<a id="p088-b010"></a>
## p088\-b010 — PDF page 88, block 10

```text
Commented [NC266R265]: NC11222024: MAH to 
provide options for this 

```

<a id="p088-b011"></a>
## p088\-b011 — PDF page 88, block 11

```text
After building and running the wave, the wave supervisor reviews the results of the wave 
using the full-screen Transaction History Insight and Work Insight options.  Depending 
on the results, the user may perform one of two options. These options are identified in the 
following sections. 
 
 

```

<a id="p088-b012"></a>
## p088\-b012 — PDF page 88, block 12

```text
21.1 
Cancel Wave 
 

```

<a id="p088-b013"></a>
## p088\-b013 — PDF page 88, block 13

```text
Commented [RS267R265]: This is the standard 
behavior. We cannot cancel a wave once it is already 
released. Also, we cannot cancel/delete work units 
which are already in Process. The process would be to 
complete the work and cancel the shipment. 

```

<a id="p088-b014"></a>
## p088\-b014 — PDF page 88, block 14

```text
If the results of the entire wave are not satisfactory users may cancel the wave using the 
Cancel action in the Completed Wave window of the Wave Insight. 

```

<a id="p088-b015"></a>
## p088\-b015 — PDF page 88, block 15

```text
Commented [NC268R265]: NC12052024: This is 
resolved. 

```

<a id="p088-b016"></a>
## p088\-b016 — PDF page 88, block 16

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 88 of 119 
 

```

<a id="p088-t001"></a>
## p088\-t001 — PDF page 88, detected table 1

```text
					MENT
Commented [BK265]: 5.1 Cancel Wave - when a
wave is released but work has started, it can no
longer be cancelled at the user level and IT staff
needs to be asked to step in. When systemic driven
work has been scanned and the wave has "started"
this presents a problem. We would prefer a wave be
able to be interrupted, cancelled after being started.
Commented [NC266R265]: NC11222024: MAH to
provide options for this
Commented [RS267R265]: This is the standard
behavior. We cannot cancel a wave once it is already
released. Also, we cannot cancel/delete work units
which are already in Process. The process would be to
complete the work and cancel the shipment.
Commented [NC268R265]: NC12052024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
20.7.19 Paperwork – Documents
Knipper prints Shipment Pack List during the wave and will use multiple different
templates for customer requirements.
Note: Knipper utilizes an external printing process (VVIP) to print special formats
of shipment pack list for specific customers. VVIP requires SCALE to generate an
input file (XML format) per wave. An extension (TBD) will be developed to
accomplish this requirement.
20.7.20 Override Data: Check for No Work
This Override Data Wave Step ensures that the Work Creation configurations are
correct, and every Shipment has work created successfully, otherwise marks the
wave for failure.
20.7.21 Multiple ODWS placeholder
Knipper may user multiple other override data wave steps. This is a placeholder
for it. There are other steps in current system included in other wave flows that
mostly have programmatic checks ensuring that ineligible order types are not
waved in those wave flows.
20.7.22 Complete Wave
Complete Wave updates each shipment with a status of Picking Pending.
Shipments with this status are now eligible for release.
There may be additional wave steps to the above that Knipper can leverage for
various wave flows though the ones mentioned above are the key. Examples may
include updating user-defined fields for any reporting needs.
21.0 WAVE MANAGEMENT
After building and running the wave, the wave supervisor reviews the results of the wave
using the full-screen Transaction History Insight and Work Insight options. Depending
on the results, the user may perform one of two options. These options are identified in the
following sections.
21.1 Cancel Wave
If the results of the entire wave are not satisfactory users may cancel the wave using the
Cancel action in the Completed Wave window of the Wave Insight.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 88 of 119						
```

<a id="p089-b001"></a>
## p089\-b001 — PDF page 89, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p089-b002"></a>
## p089\-b002 — PDF page 89, block 2

```text
 

```

<a id="p089-b003"></a>
## p089\-b003 — PDF page 89, block 3

```text
 

```

<a id="p089-b004"></a>
## p089\-b004 — PDF page 89, block 4

```text
 
Figure – Cancel a wave 

```

<a id="p089-b005"></a>
## p089\-b005 — PDF page 89, block 5

```text
The cancel process backs out allocation and deletes work instructions and shipping 
containers.  As allocations are backed out, the corresponding inventory is now available 
for order fulfillment again. At the point of Cancel, Knipper personnel can move the 
canceled shipments onto another wave or move them completely back to the Pool.   
 

```

<a id="p089-b006"></a>
## p089\-b006 — PDF page 89, block 6

```text
 
Figure – Return canceled shipments to the pool or another wave. 

```

<a id="p089-b007"></a>
## p089\-b007 — PDF page 89, block 7

```text
 
 

```

<a id="p089-b008"></a>
## p089\-b008 — PDF page 89, block 8

```text
 
21.2 
Release Wave 
 

```

<a id="p089-b009"></a>
## p089\-b009 — PDF page 89, block 9

```text
If the results of the wave are satisfactory, Knipper personnel release the wave. The 
Release action performs multiple operations:  

```

<a id="p089-b010"></a>
## p089\-b010 — PDF page 89, block 10

```text
• 
Releases the generated work to the warehouse floor (if applicable) by 
removing the Hold Code from the work units – this allows the work to now be 
eligible for picking 
• 
Prints Wave Documents and labels as applicable if configured.  

```

<a id="p089-b011"></a>
## p089\-b011 — PDF page 89, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 89 of 119 
 

```

<a id="p089-t001"></a>
## p089\-t001 — PDF page 89, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Cancel a wave
The cancel process backs out allocation and deletes work instructions and shipping
containers. As allocations are backed out, the corresponding inventory is now available
for order fulfillment again. At the point of Cancel, Knipper personnel can move the
canceled shipments onto another wave or move them completely back to the Pool.
Figure – Return canceled shipments to the pool or another wave.
21.2 Release Wave
If the results of the wave are satisfactory, Knipper personnel release the wave. The
Release action performs multiple operations:
• Releases the generated work to the warehouse floor (if applicable) by
removing the Hold Code from the work units – this allows the work to now be
eligible for picking
• Prints Wave Documents and labels as applicable if configured.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 89 of 119						
```

<a id="p090-b001"></a>
## p090\-b001 — PDF page 90, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p090-b002"></a>
## p090\-b002 — PDF page 90, block 2

```text
 

```

<a id="p090-b003"></a>
## p090\-b003 — PDF page 90, block 3

```text
 

```

<a id="p090-b004"></a>
## p090\-b004 — PDF page 90, block 4

```text
 
Figure – Release a wave 

```

<a id="p090-b005"></a>
## p090\-b005 — PDF page 90, block 5

```text
 
 

```

<a id="p090-b006"></a>
## p090\-b006 — PDF page 90, block 6

```text
Commented [BK269]: 5.3 Hold Codes: It would be 
helpful to have the wave status of released, held 
(with hold code) or cancelled visible in work quick 
find view to assist supervisor in releasing warehouse 
"printed" work. Also recording the time of release, 
hold, release from hold, or cancel be recorded and 
visible in transaction and process history 
 

```

<a id="p090-b007"></a>
## p090\-b007 — PDF page 90, block 7

```text
Commented [NC270R269]: NC11222024: MAH to 
confirm if 1. held (with hold code 2. cancelled visible  

```

<a id="p090-b008"></a>
## p090\-b008 — PDF page 90, block 8

```text
21.3 
Hold Codes 
 
Hold Codes allow work to be temporarily placed on hold so that no further processing can 
be done against it. Work created through a wave initially has a Hold Code of Wave Not 
Released. When a wave is released, the Hold Code is removed. 
 
 
  
21.4 
Print Wave Documents or Labels 
 
Releasing a wave prints the Wave Documents. This is the normal process Knipper uses 
to print these documents. If for some reason the Wave Documents ever need to be 
reprinted at a later point in time, this is always possible by choosing the Reprint Wave 
Documents option from the Wave Insight. 

```

<a id="p090-b009"></a>
## p090\-b009 — PDF page 90, block 9

```text
Commented [RS271R269]: The wave insight shows 
whether the wave has been Releases/cancelled. The 
hold code would be visible in Work Insight screen. It 
will indicate if is held due Wave not released 

```

<a id="p090-b010"></a>
## p090\-b010 — PDF page 90, block 10

```text
Commented [NC272R269]: NC12052024: This is 
resolved. 

```

<a id="p090-b011"></a>
## p090\-b011 — PDF page 90, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 90 of 119 
 

```

<a id="p090-t001"></a>
## p090\-t001 — PDF page 90, detected table 1

```text
					MENT
Commented [BK269]: 5.3 Hold Codes: It would be
helpful to have the wave status of released, held
(with hold code) or cancelled visible in work quick
find view to assist supervisor in releasing warehouse
"printed" work. Also recording the time of release,
hold, release from hold, or cancel be recorded and
visible in transaction and process history
Commented [NC270R269]: NC11222024: MAH to
confirm if 1. held (with hold code 2. cancelled visible
Commented [RS271R269]: The wave insight shows
whether the wave has been Releases/cancelled. The
hold code would be visible in Work Insight screen. It
will indicate if is held due Wave not released
Commented [NC272R269]: NC12052024: This is
resolved.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Release a wave
21.3 Hold Codes
Hold Codes allow work to be temporarily placed on hold so that no further processing can
be done against it. Work created through a wave initially has a Hold Code of Wave Not
Released. When a wave is released, the Hold Code is removed.
21.4 Print Wave Documents or Labels
Releasing a wave prints the Wave Documents. This is the normal process Knipper uses
to print these documents. If for some reason the Wave Documents ever need to be
reprinted at a later point in time, this is always possible by choosing the Reprint Wave
Documents option from the Wave Insight.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 90 of 119						
```

<a id="p091-b001"></a>
## p091\-b001 — PDF page 91, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p091-b002"></a>
## p091\-b002 — PDF page 91, block 2

```text
 

```

<a id="p091-b003"></a>
## p091\-b003 — PDF page 91, block 3

```text
 
 

```

<a id="p091-b004"></a>
## p091\-b004 — PDF page 91, block 4

```text
 
Figure – Reprint wave labels 

```

<a id="p091-b005"></a>
## p091\-b005 — PDF page 91, block 5

```text
 

```

<a id="p091-b006"></a>
## p091\-b006 — PDF page 91, block 6

```text
Commented [CC273]: This is not the current case, 
today we can cancel an order if it is being picked  the 
order cancelation does not fail 

```

<a id="p091-b007"></a>
## p091\-b007 — PDF page 91, block 7

```text
Commented [NC274R273]: NC11182024: this is 
resolved 

```

<a id="p091-b008"></a>
## p091\-b008 — PDF page 91, block 8

```text
21.5 
Post Wave Shipment Changes 
 
If a change is required for an order that has been waved and released (but not picked), 
the shipment can be canceled by choosing the Cancel option from the Shipment Insight.  
Canceling a shipment de-allocates the inventory for the order, deletes the created shipping 
containers and work, and moves the shipment back into the pool.  Once an order is 
partially or completely picked, it can be canceled by the same previous process, but any 
items that were picked would need to be transferred back to an inventory location using 
the Inventory Management option. 
 
 
Note: If an order is canceled it cancels all the shipping work tied to the order. 
Replenishment work will not be canceled (Replenishment work can be manually 
canceled). Also, while we cancel an order, if any work related to the order is being actively 
executed by pickers, then order cancellation fails. Canceling of the shipment after the 
wave is released can only be performed by a warehouse user. After the wave has been 
released, the Host will not be able to cancel the order (The only time the Host system can 
make a change is when a shipment is in ‘In Pool’ status. 
 
 
 
 
 

```

<a id="p091-b009"></a>
## p091\-b009 — PDF page 91, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 91 of 119 
 

```

<a id="p091-t001"></a>
## p091\-t001 — PDF page 91, detected table 1

```text
					MENT
Commented [CC273]: This is not the current case,
today we can cancel an order if it is being picked the
order cancelation does not fail
Commented [NC274R273]: NC11182024: this is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure – Reprint wave labels
21.5 Post Wave Shipment Changes
If a change is required for an order that has been waved and released (but not picked),
the shipment can be canceled by choosing the Cancel option from the Shipment Insight.
Canceling a shipment de-allocates the inventory for the order, deletes the created shipping
containers and work, and moves the shipment back into the pool. Once an order is
partially or completely picked, it can be canceled by the same previous process, but any
items that were picked would need to be transferred back to an inventory location using
the Inventory Management option.
Note: If an order is canceled it cancels all the shipping work tied to the order.
Replenishment work will not be canceled (Replenishment work can be manually
canceled). Also, while we cancel an order, if any work related to the order is being actively
executed by pickers, then order cancellation fails. Canceling of the shipment after the
wave is released can only be performed by a warehouse user. After the wave has been
released, the Host will not be able to cancel the order (The only time the Host system can
make a change is when a shipment is in ‘In Pool’ status.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 91 of 119						
```

<a id="p092-b001"></a>
## p092\-b001 — PDF page 92, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p092-b002"></a>
## p092\-b002 — PDF page 92, block 2

```text
 

```

<a id="p092-b003"></a>
## p092\-b003 — PDF page 92, block 3

```text
22.0 
WORK MANAGEMENT 
 

```

<a id="p092-b004"></a>
## p092\-b004 — PDF page 92, block 4

```text
22.1 
Work Viewing 
 

```

<a id="p092-b005"></a>
## p092\-b005 — PDF page 92, block 5

```text
Using the fixed station Work Insight or Work Monitoring, personnel can monitor the 
progress of work.  The Work Insight contains views grouping work by condition: Open, In 
Progress, and Closed.  Additionally, this option enables personnel to view the types of 
work that are open and in progress to determine if additional users are needed to help 
with receipt putaway, replenishment, or picking work.  Personnel can inquire about the 
specifics of the work unit, such as the ‘from’ and ‘to’ location, item(s) and quantity being 
moved, receipt/shipment id, the user performing the work, etc. 
 

```

<a id="p092-b006"></a>
## p092\-b006 — PDF page 92, block 6

```text
 
Figure – Work Insight 

```

<a id="p092-b007"></a>
## p092\-b007 — PDF page 92, block 7

```text
 

```

<a id="p092-b008"></a>
## p092\-b008 — PDF page 92, block 8

```text
 
Figure – Work Monitoring Group 

```

<a id="p092-b009"></a>
## p092\-b009 — PDF page 92, block 9

```text
 

```

<a id="p092-b010"></a>
## p092\-b010 — PDF page 92, block 10

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 92 of 119 
 

```

<a id="p092-t001"></a>
## p092\-t001 — PDF page 92, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
22.0 WORK MANAGEMENT
22.1 Work Viewing
Using the fixed station Work Insight or Work Monitoring, personnel can monitor the
progress of work. The Work Insight contains views grouping work by condition: Open, In
Progress, and Closed. Additionally, this option enables personnel to view the types of
work that are open and in progress to determine if additional users are needed to help
with receipt putaway, replenishment, or picking work. Personnel can inquire about the
specifics of the work unit, such as the ‘from’ and ‘to’ location, item(s) and quantity being
moved, receipt/shipment id, the user performing the work, etc.
Figure – Work Insight
Figure – Work Monitoring Group
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 92 of 119						
```

<a id="p093-b001"></a>
## p093\-b001 — PDF page 93, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p093-b002"></a>
## p093\-b002 — PDF page 93, block 2

```text
 

```

<a id="p093-b003"></a>
## p093\-b003 — PDF page 93, block 3

```text
22.2 
Work Priority 
 
SCALE allows system directed tasks to be assigned in one of three ways: 
 

```

<a id="p093-b004"></a>
## p093\-b004 — PDF page 93, block 4

```text
Commented [BK275]: 6.2 Work Priority: I am 
unaware if MHE truck type can be brought up here or 
at another point in this document. Meaning I would 
like to prioritize work or assign work by machine type 
- reach or order picker for example. Our guys are 
constantly jumping from reach, to order picker and 
then back again. If an entire pallet is being pulled 
then maybe a pick sub-type "reach" could be 
assigned along with PM Replen )for example). Then 
management can assign sub type to a single user.  

```

<a id="p093-b005"></a>
## p093\-b005 — PDF page 93, block 5

```text
• 
Priority/Location/FIFO 
• 
Location/Priority/FIFO 
• 
FIFO 
 
The above defines the sort order that system-directed tasks will be assigned to users within 
the warehouse. Within this structure, the “priority” portion from above can be critical. Most 
tasks will need to be created with the same priority so that they are truly processed by 
location proximity in ascending order. However, over time Knipper may want to bump up 
the priority of certain tasks. This is possible via the Work Priority Escalation Criteria 
configuration. From this configuration, Knipper can define what types of work should be 
bumped up. This can then be used in conjunction with an interval that is defined by a 
scheduled job for the work priority.  
 

```

<a id="p093-b006"></a>
## p093\-b006 — PDF page 93, block 6

```text
Commented [NC276R275]: NC11222024: MAH to 
confirm if this can be done 

```

<a id="p093-b007"></a>
## p093\-b007 — PDF page 93, block 7

```text
23.0 
PICKING 
 

```

<a id="p093-b008"></a>
## p093\-b008 — PDF page 93, block 8

```text
Commented [RS277R275]: I am not sure if I 
understood this completely. Please let me know if we 
need a quick call with Kenneth? 

```

<a id="p093-b009"></a>
## p093\-b009 — PDF page 93, block 9

```text
 
23.1 
Group (Cart) Pick  
 
Assumptions: 
 

```

<a id="p093-b010"></a>
## p093\-b010 — PDF page 93, block 10

```text
Commented [BK278R275]: In other words, some 
replenishments are for 1 case or 2, from a reserve 
location which would enable the driver to complete 
multiple replenishments with an order picker in 1 trip. 
Some replens are for a pallet, requiring a reach truck 
and the ability to only make that 1 pick. If the driver is 
picking less than total quantity, he would know to use 
an order picker, but if picking the location complete 
he uses another machine. Feel free to call me any 
time on teams  

```

<a id="p093-b011"></a>
## p093\-b011 — PDF page 93, block 11

```text
Commented [RS279R275]: If it helps, these can be 
created as separate work types (based on the qty UM 
replenished) in SCALE and can be assigned to two 
different users. Please let us know if this is fine and we 
can resolve. 

```

<a id="p093-b012"></a>
## p093\-b012 — PDF page 93, block 12

```text
• 
Containers are created in wave. 
• 
One Work unit is created per shipping container.  
• 
At Wave release container content labels are printed.  
• 
User will physically pick the inventory into final boxes or to a Tote. Determination 
is made by the picker.  
• 
User will physically build the cart before starting the work execution.  
• 
User will build the cart based on the zone where the items are picked.  
 
The user starts picking by signing into the Warehouse Mobile on RF and selecting a Work Profile 
of Group (Cart) Pick. This is a user directed work assignment, which means user needs to tell 
SCALE which work unit they want to execute. The user will start building the cart by scanning the 
ContainerID from the container content label. SCALE will assign a spot systematically and display 
the Spot and the container type. If the picker is picking to the final box then they need to place 
the right container type into the spot displayed. If picking to Tote, then place the tote into the 
displayed spot. Place the container content label inside the Tote or the final box. Continue 
scanning the ContainerID and clicking Go button until the cart is Full. When cart has been built, 
the user will select the Begin picks option to initiate the pick. System will assign the task to the 
user and SCALE then presents the user with the pick which displays the location, item, lot, and 
quantity to be picked [EX24 - Display Item Alias in RF Pick confirmation screen] displays the 
Item Alias if exists for an item. The picker confirms the pick by scanning the Location and item 
[EX39 - Work Confirmation Item validation] for validation.  
 

```

<a id="p093-b013"></a>
## p093\-b013 — PDF page 93, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 93 of 119 
 

```

<a id="p093-t001"></a>
## p093\-t001 — PDF page 93, detected table 1

```text
					MENT
Commented [BK275]: 6.2 Work Priority: I am
unaware if MHE truck type can be brought up here or
at another point in this document. Meaning I would
like to prioritize work or assign work by machine type
- reach or order picker for example. Our guys are
constantly jumping from reach, to order picker and
then back again. If an entire pallet is being pulled
then maybe a pick sub-type "reach" could be
assigned along with PM Replen )for example). Then
management can assign sub type to a single user.
Commented [NC276R275]: NC11222024: MAH to
confirm if this can be done
Commented [RS277R275]: I am not sure if I
understood this completely. Please let me know if we
need a quick call with Kenneth?
Commented [BK278R275]: In other words, some
replenishments are for 1 case or 2, from a reserve
location which would enable the driver to complete
multiple replenishments with an order picker in 1 trip.
Some replens are for a pallet, requiring a reach truck
and the ability to only make that 1 pick. If the driver is
picking less than total quantity, he would know to use
an order picker, but if picking the location complete
he uses another machine. Feel free to call me any
time on teams
Commented [RS279R275]: If it helps, these can be
created as separate work types (based on the qty UM
replenished) in SCALE and can be assigned to two
different users. Please let us know if this is fine and we
can resolve.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
22.2 Work Priority
SCALE allows system directed tasks to be assigned in one of three ways:
• Priority/Location/FIFO
• Location/Priority/FIFO
• FIFO
The above defines the sort order that system-directed tasks will be assigned to users within
the warehouse. Within this structure, the “priority” portion from above can be critical. Most
tasks will need to be created with the same priority so that they are truly processed by
location proximity in ascending order. However, over time Knipper may want to bump up
the priority of certain tasks. This is possible via the Work Priority Escalation Criteria
configuration. From this configuration, Knipper can define what types of work should be
bumped up. This can then be used in conjunction with an interval that is defined by a
scheduled job for the work priority.
23.0 PICKING
23.1 Group (Cart) Pick
Assumptions:
• Containers are created in wave.
• One Work unit is created per shipping container.
• At Wave release container content labels are printed.
• User will physically pick the inventory into final boxes or to a Tote. Determination
is made by the picker.
• User will physically build the cart before starting the work execution.
• User will build the cart based on the zone where the items are picked.
The user starts picking by signing into the Warehouse Mobile on RF and selecting a Work Profile
of Group (Cart) Pick. This is a user directed work assignment, which means user needs to tell
SCALE which work unit they want to execute. The user will start building the cart by scanning the
ContainerID from the container content label. SCALE will assign a spot systematically and display
the Spot and the container type. If the picker is picking to the final box then they need to place
the right container type into the spot displayed. If picking to Tote, then place the tote into the
displayed spot. Place the container content label inside the Tote or the final box. Continue
scanning the ContainerID and clicking Go button until the cart is Full. When cart has been built,
the user will select the Begin picks option to initiate the pick. System will assign the task to the
user and SCALE then presents the user with the pick which displays the location, item, lot, and
quantity to be picked [EX24 - Display Item Alias in RF Pick confirmation screen] displays the
Item Alias if exists for an item. The picker confirms the pick by scanning the Location and item
[EX39 - Work Confirmation Item validation] for validation.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 93 of 119						
```

<a id="p094-b001"></a>
## p094\-b001 — PDF page 94, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p094-b002"></a>
## p094\-b002 — PDF page 94, block 2

```text
 

```

<a id="p094-b003"></a>
## p094\-b003 — PDF page 94, block 3

```text
If item being picked is part of only one container on the cart, the slot number and Container ID 
will be displayed on the pick confirmation screen itself. If the item is serial number tracked, then 
user needs to scan the serial number at the unit level. 
 
If the item being picked is part of multiple containers on the same cart, then once user confirm 
the pick, SCALE will display the slot and quantity where they need to put the inventory. The user 
can scan the ContainerID Barcode from the container content label in that box to confirm they are 
putting inventory into correct box. If the item is serial number tracked, then user needs to scan 
the serial number at the unit level. Once the user confirms the slot it will display another slot where 
the same item needs to be putaway. Once the picked item is putaway completely, SCALE will 
display the next pick based on the pick sequence. 
 
While the user is picking, if there is not enough inventory in the location that the user is prompted 
to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work 
unit. If after all the picks are complete for the work unit and they are returned to the screen with 
the short item, if the picker has permission to short, picker will adjust the quantity and then click 
on the short button. SCALE will ask for a short reason and user must select the reason from the 
drop down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back 
out of the work unit (to leave it suspended) and moves the cart to hospital area. The supervisor 
intervenes and determines how to handle the out-of-stock situation. 
 
Note: Short option is controlled using security and Knipper can decide which pickers will have 
access to short option. If picker doesn’t have short option, then once they click on the pass button, 
they need to take the cart to a designated hospital area and leave the cart there for supervisor to 
research on the issue. 
 
Once all the picks are completed user will confirm putaway to PACK location and will take the cart 
to packing station and unload the boxes.  
 

```

<a id="p094-b004"></a>
## p094\-b004 — PDF page 94, block 4

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 94 of 119 
 

```

<a id="p094-t001"></a>
## p094\-t001 — PDF page 94, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
If item being picked is part of only one container on the cart, the slot number and Container ID
will be displayed on the pick confirmation screen itself. If the item is serial number tracked, then
user needs to scan the serial number at the unit level.
If the item being picked is part of multiple containers on the same cart, then once user confirm
the pick, SCALE will display the slot and quantity where they need to put the inventory. The user
can scan the ContainerID Barcode from the container content label in that box to confirm they are
putting inventory into correct box. If the item is serial number tracked, then user needs to scan
the serial number at the unit level. Once the user confirms the slot it will display another slot where
the same item needs to be putaway. Once the picked item is putaway completely, SCALE will
display the next pick based on the pick sequence.
While the user is picking, if there is not enough inventory in the location that the user is prompted
to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work
unit. If after all the picks are complete for the work unit and they are returned to the screen with
the short item, if the picker has permission to short, picker will adjust the quantity and then click
on the short button. SCALE will ask for a short reason and user must select the reason from the
drop down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back
out of the work unit (to leave it suspended) and moves the cart to hospital area. The supervisor
intervenes and determines how to handle the out-of-stock situation.
Note: Short option is controlled using security and Knipper can decide which pickers will have
access to short option. If picker doesn’t have short option, then once they click on the pass button,
they need to take the cart to a designated hospital area and leave the cart there for supervisor to
research on the issue.
Once all the picks are completed user will confirm putaway to PACK location and will take the cart
to packing station and unload the boxes.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 94 of 119						
```

<a id="p095-b001"></a>
## p095\-b001 — PDF page 95, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p095-b002"></a>
## p095\-b002 — PDF page 95, block 2

```text
 

```

<a id="p095-b003"></a>
## p095\-b003 — PDF page 95, block 3

```text
 
Figure: Cart pick work execution 
  
 
23.2 
Full Pallet Pick 
 
Assumptions: 
 

```

<a id="p095-b004"></a>
## p095\-b004 — PDF page 95, block 4

```text
Commented [BK280]: 7.2 if a short pick is 
necessary - permission to short pick should only be 
allowed by user level permission.  

```

<a id="p095-b005"></a>
## p095\-b005 — PDF page 95, block 5

```text
• 
Containers are created in wave. 
• 
One Work unit is created per Pallet. 
• 
At Wave release Container Content label and Vendor Label will be printed. 
 
The user starts picking by signing into the RF on warehouse mobile and selecting a Work Profile 
of 3PL Pick. The user is then prompted to scan a work unit, and user will scan the ContainerID 
from the container content label. SCALE then presents the user with the pick which displays the 
location, item, lot and quantity to be picked [EX24 - Display Item Alias in RF Pick confirmation 
screen] displays the Item Alias if exists for an item. The picker confirms the pick by scanning the 
location and item [EX39 - Work Confirmation Item validation] for validation. User will also scan 
the ContainerID from the content label as part of validation. User will apply the container content 
label to the pallet. 
 
While the user is picking, if there is not enough inventory in the location that the user is prompted 
to pick from, if the picker has permission to short, picker will adjust the quantity and then click on 
the short button. SCALE will ask for a short reason and user must select the reason from the drop 

```

<a id="p095-b006"></a>
## p095\-b006 — PDF page 95, block 6

```text
Commented [NC281R280]: NC11222024: this 
functionality exists - just need to be implemented for all 
facilities 

```

<a id="p095-b007"></a>
## p095\-b007 — PDF page 95, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 95 of 119 
 

```

<a id="p095-t001"></a>
## p095\-t001 — PDF page 95, detected table 1

```text
					MENT
Commented [BK280]: 7.2 if a short pick is
necessary - permission to short pick should only be
allowed by user level permission.
Commented [NC281R280]: NC11222024: this
functionality exists - just need to be implemented for all
facilities	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Cart pick work execution
23.2 Full Pallet Pick
Assumptions:
• Containers are created in wave.
• One Work unit is created per Pallet.
• At Wave release Container Content label and Vendor Label will be printed.
The user starts picking by signing into the RF on warehouse mobile and selecting a Work Profile
of 3PL Pick. The user is then prompted to scan a work unit, and user will scan the ContainerID
from the container content label. SCALE then presents the user with the pick which displays the
location, item, lot and quantity to be picked [EX24 - Display Item Alias in RF Pick confirmation
screen] displays the Item Alias if exists for an item. The picker confirms the pick by scanning the
location and item [EX39 - Work Confirmation Item validation] for validation. User will also scan
the ContainerID from the content label as part of validation. User will apply the container content
label to the pallet.
While the user is picking, if there is not enough inventory in the location that the user is prompted
to pick from, if the picker has permission to short, picker will adjust the quantity and then click on
the short button. SCALE will ask for a short reason and user must select the reason from the drop
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 95 of 119						
```

<a id="p096-b001"></a>
## p096\-b001 — PDF page 96, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p096-b002"></a>
## p096\-b002 — PDF page 96, block 2

```text
 

```

<a id="p096-b003"></a>
## p096\-b003 — PDF page 96, block 3

```text
down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back out 
of the work unit (to leave it suspended) and contacts a supervisor. The supervisor intervenes and 
determines how to handle the out-of-stock situation. 
 
Note: Short option is controlled using security and Knipper can decide which pickers will have 
access to short option. 
 

```

<a id="p096-b004"></a>
## p096\-b004 — PDF page 96, block 4

```text
After the picks are complete the user confirms the putaway to the PACK location. 
 
Note: Full Pallet Pick is majorly applicable for 3PL. 

```

<a id="p096-b005"></a>
## p096\-b005 — PDF page 96, block 5

```text
 
23.3 
PTL Pick (MHE Controlled) 
 
Assumptions: 
 

```

<a id="p096-b006"></a>
## p096\-b006 — PDF page 96, block 6

```text
• 
Containers are created in Wave. 
• 
One Work unit is created per shipping container.  
• 
Shipping Label / Vendor Label, Container Content label are printed  
• 
Work units messages are downloaded to Pick to Light system 
• 
The picking is executed using Pick to Light system 
 
 Once picking is completed by the user, pick confirmation messages will be sent to SCALE. 
[EX19 – Pick to Light Integration] will process the messages and complete the work 
units in SCALE. The status will be advanced based on the status flow configuration. 
 
23.4 
PTL Case Pick (MHE Controlled) 
 
Assumptions: 
 

```

<a id="p096-b007"></a>
## p096\-b007 — PDF page 96, block 7

```text
• 
Containers are created in Wave. 
• 
One Work unit is created per shipping container.  
• 
Shipping Label / Vendor Label, Container Content label are printed  
• 
Work units messages are downloaded to Pick to Light system 
• 
The picking is executed using Pick to Light system 
 
 Once picking is completed by the user, pick confirmation messages will be sent to SCALE. 
[EX19 – Pick to Light Integration] will process the messages and complete the work 
units in SCALE. The status will be advanced based on the status flow configuration. 
 
 
23.5 
LTL Pallet Pick 
 
Assumptions: 
 

```

<a id="p096-b008"></a>
## p096\-b008 — PDF page 96, block 8

```text
• 
Containers are created in wave. 

```

<a id="p096-b009"></a>
## p096\-b009 — PDF page 96, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 96 of 119 
 

```

<a id="p096-t001"></a>
## p096\-t001 — PDF page 96, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back out
of the work unit (to leave it suspended) and contacts a supervisor. The supervisor intervenes and
determines how to handle the out-of-stock situation.
Note: Short option is controlled using security and Knipper can decide which pickers will have
access to short option.
After the picks are complete the user confirms the putaway to the PACK location.
Note: Full Pallet Pick is majorly applicable for 3PL.
23.3 PTL Pick (MHE Controlled)
Assumptions:
• Containers are created in Wave.
• One Work unit is created per shipping container.
• Shipping Label / Vendor Label, Container Content label are printed
• Work units messages are downloaded to Pick to Light system
• The picking is executed using Pick to Light system
Once picking is completed by the user, pick confirmation messages will be sent to SCALE.
[EX19 – Pick to Light Integration] will process the messages and complete the work
units in SCALE. The status will be advanced based on the status flow configuration.
23.4 PTL Case Pick (MHE Controlled)
Assumptions:
• Containers are created in Wave.
• One Work unit is created per shipping container.
• Shipping Label / Vendor Label, Container Content label are printed
• Work units messages are downloaded to Pick to Light system
• The picking is executed using Pick to Light system
Once picking is completed by the user, pick confirmation messages will be sent to SCALE.
[EX19 – Pick to Light Integration] will process the messages and complete the work
units in SCALE. The status will be advanced based on the status flow configuration.
23.5 LTL Pallet Pick
Assumptions:
• Containers are created in wave.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 96 of 119						
```

<a id="p097-b001"></a>
## p097\-b001 — PDF page 97, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p097-b002"></a>
## p097\-b002 — PDF page 97, block 2

```text
 

```

<a id="p097-b003"></a>
## p097\-b003 — PDF page 97, block 3

```text
• 
Pallet building wave step will nest cases and repack boxes on to pallets 
• 
One Work unit is created per pallet. 
• 
At Wave release Container content labels and Vendor labels are printed. 
• 
Picker will carry empty pallet with them. 
 
The user starts picking by signing into the RF on warehouse mobile and selecting a Work Profile 
of 3PL Pick/3PL Pick DSCSA. The user is then prompted to scan a work unit. User will scan the 
ContainerID from the Vendor Label and click on the GO button. SCALE then presents the user 
with the pick which displays the location, item, lot and quantity to be picked [EX24 - Display Item 
Alias in RF Pick confirmation screen] displays the Item Alias if exists for an item.  The picker 
confirms the pick by scanning the location for validation and Item [EX39 - Work Confirmation 
Item validation]. If the item is serial number tracked, then user needs to scan the serial number 
at the unit level. The user will place the cases picked on to an empty pallet they carried with them. 
If it is Loose item, then the picker will place that item into a Tote. User will apply the container 
Content label to individual cases or place the container content labels inside the tote. User will 
apply the vendor label on to the Pallet. 
 
While the user is picking, if there is not enough inventory in the location that the user is prompted 
to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work 
unit. If after all the picks are complete for the work unit and they are returned to the screen with 
the short item, if the picker has permission to short, picker will adjust the quantity and then click 
on the short button. SCALE will ask for a short reason and user must select the reason from the 
drop down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back 
out of the work unit (to leave it suspended) and place the pallet and label stock in a hospital area. 
The supervisor intervenes and determines how to handle the out-of-stock situation. 
 
After the picks are complete the user confirms the Putaway to the pack location.  
[EX38 – Serialization Integration with Rfxcel for Outbound] will enable company, GTIN and 
Serial Number validation for DSCSA. The extension will also capture serial numbers at multiple 
UM levels. 

```

<a id="p097-b004"></a>
## p097\-b004 — PDF page 97, block 4

```text
 

```

<a id="p097-b005"></a>
## p097\-b005 — PDF page 97, block 5

```text
 
23.6 
REPS Pick 
 
Assumptions: 
 

```

<a id="p097-b006"></a>
## p097\-b006 — PDF page 97, block 6

```text
• 
Containers are created in Wave. 
• 
One Work unit is created per Wave.  
• 
Shipping Label / Vendor Label and Container Content label printed in the 
wave. 
 
The user starts picking by signing into the RF Work option and selecting a Work Profile of 
REPS picking. The user is then prompted to scan a Work Unit. User will scan the barcode 
form Break Label to initiate work. SCALE presents the user with the pick which displays 
the location, item and quantity to be picked [EX24 - Display Item Alias in RF Pick 
confirmation screen] displays the Item Alias if exists for an item. The user scans the 

```

<a id="p097-b007"></a>
## p097\-b007 — PDF page 97, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 97 of 119 
 

```

<a id="p097-t001"></a>
## p097\-t001 — PDF page 97, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
• Pallet building wave step will nest cases and repack boxes on to pallets
• One Work unit is created per pallet.
• At Wave release Container content labels and Vendor labels are printed.
• Picker will carry empty pallet with them.
The user starts picking by signing into the RF on warehouse mobile and selecting a Work Profile
of 3PL Pick/3PL Pick DSCSA. The user is then prompted to scan a work unit. User will scan the
ContainerID from the Vendor Label and click on the GO button. SCALE then presents the user
with the pick which displays the location, item, lot and quantity to be picked [EX24 - Display Item
Alias in RF Pick confirmation screen] displays the Item Alias if exists for an item. The picker
confirms the pick by scanning the location for validation and Item [EX39 - Work Confirmation
Item validation]. If the item is serial number tracked, then user needs to scan the serial number
at the unit level. The user will place the cases picked on to an empty pallet they carried with them.
If it is Loose item, then the picker will place that item into a Tote. User will apply the container
Content label to individual cases or place the container content labels inside the tote. User will
apply the vendor label on to the Pallet.
While the user is picking, if there is not enough inventory in the location that the user is prompted
to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work
unit. If after all the picks are complete for the work unit and they are returned to the screen with
the short item, if the picker has permission to short, picker will adjust the quantity and then click
on the short button. SCALE will ask for a short reason and user must select the reason from the
drop down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back
out of the work unit (to leave it suspended) and place the pallet and label stock in a hospital area.
The supervisor intervenes and determines how to handle the out-of-stock situation.
After the picks are complete the user confirms the Putaway to the pack location.
[EX38 – Serialization Integration with Rfxcel for Outbound] will enable company, GTIN and
Serial Number validation for DSCSA. The extension will also capture serial numbers at multiple
UM levels.
23.6 REPS Pick
Assumptions:
• Containers are created in Wave.
• One Work unit is created per Wave.
• Shipping Label / Vendor Label and Container Content label printed in the
wave.
The user starts picking by signing into the RF Work option and selecting a Work Profile of
REPS picking. The user is then prompted to scan a Work Unit. User will scan the barcode
form Break Label to initiate work. SCALE presents the user with the pick which displays
the location, item and quantity to be picked [EX24 - Display Item Alias in RF Pick
confirmation screen] displays the Item Alias if exists for an item. The user scans the
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 97 of 119						
```

<a id="p098-b001"></a>
## p098\-b001 — PDF page 98, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p098-b002"></a>
## p098\-b002 — PDF page 98, block 2

```text
 

```

<a id="p098-b003"></a>
## p098\-b003 — PDF page 98, block 3

```text
location and item for validation [EX39 - Work Confirmation Item validation]. When 
complete, the user scans the Container ID from the Container Contents Label to verify 
and press the OK button. User will apply Shipping / Vendor Label on to the container and 
place the container on the line. 
 

```

<a id="p098-b004"></a>
## p098\-b004 — PDF page 98, block 4

```text
 
While the user is picking, if there is not enough inventory in the location that the user is 
prompted to pick from, the user presses the ‘Skip’ button to continue with the next 
instruction on that work unit. If after all the picks are complete for the work unit and they 
are returned to the screen with the short item, the user presses the ‘Pass’ button to back 
out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor 
intervenes and determines how to handle the out-of-stock situation (whether to short that 
line using the ‘Short Pick’ button or to cancel the entire order, etc.).   
 
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick 
button on the RF screen 
 

```

<a id="p098-b005"></a>
## p098\-b005 — PDF page 98, block 5

```text
After the picks are complete, the user confirms the putaway to the Packing location. 
 
While the user is picking, if there is not enough inventory in the location that the user is 
prompted to pick from, the user presses the ‘Skip’ button to continue with the next 
instruction on that work unit. If after all the picks are complete for the work unit and they 
are returned to the screen with the short item, if the picker has permission to short, picker 
will adjust the quantity and then click on the short button. SCALE will ask for a short reason 
and user must select the reason from the drop down. If picker doesn’t have permission to 
short, the picker presses the ‘Pass’ button to back out of the work unit (to leave it 
suspended) and contacts a supervisor. The supervisor intervenes and determines how to 
handle the out-of-stock situation. 
 
Note: Short option is controlled using security and Knipper determines this. If picker 
doesn’t have short option, then once they click on the pass button, they need to take the 
cart to a designated hospital area and leave the cart there for the supervisor to research 
on the issue. 
 
Once all the picks are completed user will confirm putaway to PACK location and will take 
the cart to packing station and unload the containers. 
 

```

<a id="p098-b006"></a>
## p098\-b006 — PDF page 98, block 6

```text
 
23.7 
Cooler Pick 

```

<a id="p098-b007"></a>
## p098\-b007 — PDF page 98, block 7

```text
 
Assumptions: 
 

```

<a id="p098-b008"></a>
## p098\-b008 — PDF page 98, block 8

```text
• 
Containers are created in Wave. 
• 
One Work unit is created per container. 
• 
Shipping Label / Vendor Label and Container Content label is printed per 
container. 

```

<a id="p098-b009"></a>
## p098\-b009 — PDF page 98, block 9

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 98 of 119 
 

```

<a id="p098-t001"></a>
## p098\-t001 — PDF page 98, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
location and item for validation [EX39 - Work Confirmation Item validation]. When
complete, the user scans the Container ID from the Container Contents Label to verify
and press the OK button. User will apply Shipping / Vendor Label on to the container and
place the container on the line.
While the user is picking, if there is not enough inventory in the location that the user is
prompted to pick from, the user presses the ‘Skip’ button to continue with the next
instruction on that work unit. If after all the picks are complete for the work unit and they
are returned to the screen with the short item, the user presses the ‘Pass’ button to back
out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor
intervenes and determines how to handle the out-of-stock situation (whether to short that
line using the ‘Short Pick’ button or to cancel the entire order, etc.).
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick
button on the RF screen
After the picks are complete, the user confirms the putaway to the Packing location.
While the user is picking, if there is not enough inventory in the location that the user is
prompted to pick from, the user presses the ‘Skip’ button to continue with the next
instruction on that work unit. If after all the picks are complete for the work unit and they
are returned to the screen with the short item, if the picker has permission to short, picker
will adjust the quantity and then click on the short button. SCALE will ask for a short reason
and user must select the reason from the drop down. If picker doesn’t have permission to
short, the picker presses the ‘Pass’ button to back out of the work unit (to leave it
suspended) and contacts a supervisor. The supervisor intervenes and determines how to
handle the out-of-stock situation.
Note: Short option is controlled using security and Knipper determines this. If picker
doesn’t have short option, then once they click on the pass button, they need to take the
cart to a designated hospital area and leave the cart there for the supervisor to research
on the issue.
Once all the picks are completed user will confirm putaway to PACK location and will take
the cart to packing station and unload the containers.
23.7 Cooler Pick
Assumptions:
• Containers are created in Wave.
• One Work unit is created per container.
• Shipping Label / Vendor Label and Container Content label is printed per
container.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 98 of 119						
```

<a id="p099-b001"></a>
## p099\-b001 — PDF page 99, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p099-b002"></a>
## p099\-b002 — PDF page 99, block 2

```text
 

```

<a id="p099-b003"></a>
## p099\-b003 — PDF page 99, block 3

```text
Knipper will utilize Group picking for Cooler picking. User will manually build carts prior to 
picking. 
 
User starts picking by signing into the WHM work option and selecting the work profile of 
Cooler picking. Based on the containers that can fit on the cart, the user will start scanning 
the container ID and click on the Assign option. SCALE will assign the containers to slot 
beginning from Slot 1. Once all the container that are on the cart are scanned and 
assigned spots, the user will click on Begin Picks to initiate work execution. 
 
SCALE then presents the user with the pick which displays the location, item and quantity 
to be picked [EX24 - Display Item Alias in RF Pick confirmation screen] displays the 
Item Alias if exists for an item.  The picker confirms the pick by scanning the location and 
item for validation [EX39 - Work Confirmation Item validation]. 
 
While the user is picking, if there is not enough inventory in the location that the user is 
prompted to pick from, the user presses the ‘Skip’ button to continue with the next 
instruction on that work unit. If after all the picks are complete for the work unit and they 
are returned to the screen with the short item, the user presses the ‘Pass’ button to back 
out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor 
intervenes and determines how to handle the out-of-stock situation (whether to short that 
line using the ‘Short Pick’ button or to cancel the entire order, etc.). 
 
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick 
button on the WHM screen 
 
After the pick is complete for the item, if the item is only part of one container, then SCALE 
displays the slot number on the pick screen itself and user needs to scan the ContainerID 
that they are picking into. 
 
If the item that is being picked is present in multiple slots, then once the pick is confirmed 
SCALE will display the slot and ContainerID in the next screen. User needs to scan the 
ContainerID that they are picking into for validation. 
 
For Cooler pick the Auto Putaway will be configured. So, user doesn’t have to confirm the 
putaway once all the picks are completed. 
 
 
 
 
 
 
 
 
 
 
  

```

<a id="p099-b004"></a>
## p099\-b004 — PDF page 99, block 4

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 99 of 119 
 

```

<a id="p099-t001"></a>
## p099\-t001 — PDF page 99, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Knipper will utilize Group picking for Cooler picking. User will manually build carts prior to
picking.
User starts picking by signing into the WHM work option and selecting the work profile of
Cooler picking. Based on the containers that can fit on the cart, the user will start scanning
the container ID and click on the Assign option. SCALE will assign the containers to slot
beginning from Slot 1. Once all the container that are on the cart are scanned and
assigned spots, the user will click on Begin Picks to initiate work execution.
SCALE then presents the user with the pick which displays the location, item and quantity
to be picked [EX24 - Display Item Alias in RF Pick confirmation screen] displays the
Item Alias if exists for an item. The picker confirms the pick by scanning the location and
item for validation [EX39 - Work Confirmation Item validation].
While the user is picking, if there is not enough inventory in the location that the user is
prompted to pick from, the user presses the ‘Skip’ button to continue with the next
instruction on that work unit. If after all the picks are complete for the work unit and they
are returned to the screen with the short item, the user presses the ‘Pass’ button to back
out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor
intervenes and determines how to handle the out-of-stock situation (whether to short that
line using the ‘Short Pick’ button or to cancel the entire order, etc.).
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick
button on the WHM screen
After the pick is complete for the item, if the item is only part of one container, then SCALE
displays the slot number on the pick screen itself and user needs to scan the ContainerID
that they are picking into.
If the item that is being picked is present in multiple slots, then once the pick is confirmed
SCALE will display the slot and ContainerID in the next screen. User needs to scan the
ContainerID that they are picking into for validation.
For Cooler pick the Auto Putaway will be configured. So, user doesn’t have to confirm the
putaway once all the picks are completed.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 99 of 119						
```

<a id="p100-b001"></a>
## p100\-b001 — PDF page 100, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p100-b002"></a>
## p100\-b002 — PDF page 100, block 2

```text
 

```

<a id="p100-b003"></a>
## p100\-b003 — PDF page 100, block 3

```text
 
 

```

<a id="p100-b004"></a>
## p100\-b004 — PDF page 100, block 4

```text
24.0 
PACKING 
 
 
 
24.1 
QC Confirmation  
 

```

<a id="p100-b005"></a>
## p100\-b005 — PDF page 100, block 5

```text
Commented [NC282]: NC11222024: We need QC for 
each level of UOM and picker can’t be QC’er 

```

<a id="p100-b006"></a>
## p100\-b006 — PDF page 100, block 6

```text
Commented [RS283R282]: This will be developed as 
part of a custom functionality for Pallet. However, base 
already supports QC for full case, unopened full pallets, 
loose shipper case containers. We will need to develop 
a custom functionality to support QC for containers 
nested on a Pallet. 

```

<a id="p100-b007"></a>
## p100\-b007 — PDF page 100, block 7

```text
Commented [NC284R282]: NC1252024: This is 
resolved. 

```

<a id="p100-b008"></a>
## p100\-b008 — PDF page 100, block 8

```text
Commented [NC285]: NC11222024: We need this 
functionality for RF gun  

```

<a id="p100-b009"></a>
## p100\-b009 — PDF page 100, block 9

```text
Commented [RS286R285]: The basic QC functionality 
exists in RF. However, we need to know the custom 
Pallet level QC functionality is needed in RF as well. If 
so, we will need to add that to the scope 

```

<a id="p100-b010"></a>
## p100\-b010 — PDF page 100, block 10

```text
For Knipper, outbound QC is leveraged for 3PL orders This is needed to ensure the right 
item and lot are picked and packed. If Pallets are created as part of wave, QC should be 
enabled at Pallet level. Pallet level QC will be handled as an extension (EX46 – Pallet 
level QC) in SCALE. 
 
 
To perform QC, the user will utilize the QC insight screen. The user will scan the 
ContainerID from the container content label to initiate QC. In this screen, SCALE displays 
item, Lot and quantity that is expected in the container. User then needs to scan (or 
manually enter) every single item present in the container (Grocery scanning). Once 
scanning is done of all the items, user will click on confirm button to complete the process. 
At this stage SCALE determines if the QC has passed or failed. If failed, SCALE will 
highlight the item and ask user to enter a reason code for either the shortage or overage 
to complete the entire QC process. If QC is passed, user can proceed with Close container 
operation. If QC is failed, then a supervisor is responsible to fix the issue with the 
container. 
 

```

<a id="p100-b011"></a>
## p100\-b011 — PDF page 100, block 11

```text
Commented [NC287R285]: NC12052024: This is 
resolved. 

```

<a id="p100-b012"></a>
## p100\-b012 — PDF page 100, block 12

```text
 
Figure: QC Workbench 

```

<a id="p100-b013"></a>
## p100\-b013 — PDF page 100, block 13

```text
 

```

<a id="p100-b014"></a>
## p100\-b014 — PDF page 100, block 14

```text
If the items and quantities scanned match the system, the user receives a message that 
QC was successful.  If not, the user receives a message that QC failed and need to provide 
reason codes for any missing quantities. These reason codes are configurable by Knipper 
to record things such as damaged, incorrect item, etc.  The user needs to correct any 
failures and have a successful QC before continuing to Close Container. 
 

```

<a id="p100-b015"></a>
## p100\-b015 — PDF page 100, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 100 of 119 
 

```

<a id="p100-t001"></a>
## p100\-t001 — PDF page 100, detected table 1

```text
				MENT
Commented [NC282]: NC11222024: We need QC for
each level of UOM and picker can’t be QC’er
Commented [RS283R282]: This will be developed as
part of a custom functionality for Pallet. However, base
already supports QC for full case, unopened full pallets,
loose shipper case containers. We will need to develop
a custom functionality to support QC for containers
nested on a Pallet.
Commented [NC284R282]: NC1252024: This is
resolved.
Commented [NC285]: NC11222024: We need this
functionality for RF gun
Commented [RS286R285]: The basic QC functionality
exists in RF. However, we need to know the custom
Pallet level QC functionality is needed in RF as well. If
so, we will need to add that to the scope
Commented [NC287R285]: NC12052024: This is
resolved.	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
24.0 PACKING
24.1 QC Confirmation
For Knipper, outbound QC is leveraged for 3PL orders This is needed to ensure the right
item and lot are picked and packed. If Pallets are created as part of wave, QC should be
enabled at Pallet level. Pallet level QC will be handled as an extension (EX46 – Pallet
level QC) in SCALE.
To perform QC, the user will utilize the QC insight screen. The user will scan the
ContainerID from the container content label to initiate QC. In this screen, SCALE displays
item, Lot and quantity that is expected in the container. User then needs to scan (or
manually enter) every single item present in the container (Grocery scanning). Once
scanning is done of all the items, user will click on confirm button to complete the process.
At this stage SCALE determines if the QC has passed or failed. If failed, SCALE will
highlight the item and ask user to enter a reason code for either the shortage or overage
to complete the entire QC process. If QC is passed, user can proceed with Close container
operation. If QC is failed, then a supervisor is responsible to fix the issue with the
container.
Figure: QC Workbench
If the items and quantities scanned match the system, the user receives a message that
QC was successful. If not, the user receives a message that QC failed and need to provide
reason codes for any missing quantities. These reason codes are configurable by Knipper
to record things such as damaged, incorrect item, etc. The user needs to correct any
failures and have a successful QC before continuing to Close Container.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 100 of 119					
```

<a id="p101-b001"></a>
## p101\-b001 — PDF page 101, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p101-b002"></a>
## p101\-b002 — PDF page 101, block 2

```text
 

```

<a id="p101-b003"></a>
## p101\-b003 — PDF page 101, block 3

```text
Commented [RS288]: Review further with Knipper  

```

<a id="p101-b004"></a>
## p101\-b004 — PDF page 101, block 4

```text
 
Figure: QC failure – reason code selection 
 
Knipper uses Force QC pass several times in the workflow to use QC workbench as a 
visual QC platform.  
 

```

<a id="p101-b005"></a>
## p101\-b005 — PDF page 101, block 5

```text
Commented [NC289R288]: NC1118224: Please 
confirm when this will happen 

```

<a id="p101-b006"></a>
## p101\-b006 — PDF page 101, block 6

```text
Commented [RS290R288]: We need an input from 
Knipper if they would like users to force pass the QC 
when there are issues. This will be rare exception but 
the standard process is to resolve any QC issues on 
the floor and confirm it in the system 

```

<a id="p101-b007"></a>
## p101\-b007 — PDF page 101, block 7

```text
Commented [NC291R288]: NC12052024: We want 
this implemented 

```

<a id="p101-b008"></a>
## p101\-b008 — PDF page 101, block 8

```text
 
Figure: Force QC pass 
 

```

<a id="p101-b009"></a>
## p101\-b009 — PDF page 101, block 9

```text
Commented [RS292R288]: This is a base option 
available already of Knipper uses the base QC 
workbench. Please note that we have proposed an 
extension for Pallet level QC from RF screen. If this is 
needed there, we can discuss further when we start 
documenting that 

```

<a id="p101-b010"></a>
## p101\-b010 — PDF page 101, block 10

```text
 
 

```

<a id="p101-b011"></a>
## p101\-b011 — PDF page 101, block 11

```text
 
 

```

<a id="p101-b012"></a>
## p101\-b012 — PDF page 101, block 12

```text
 
Figure: Force QC pass process history 

```

<a id="p101-b013"></a>
## p101\-b013 — PDF page 101, block 13

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 101 of 119 
 

```

<a id="p101-t001"></a>
## p101\-t001 — PDF page 101, detected table 1

```text
				MENT
Commented [RS288]: Review further with Knipper
Commented [NC289R288]: NC1118224: Please
confirm when this will happen
Commented [RS290R288]: We need an input from
Knipper if they would like users to force pass the QC
when there are issues. This will be rare exception but
the standard process is to resolve any QC issues on
the floor and confirm it in the system
Commented [NC291R288]: NC12052024: We want
this implemented
Commented [RS292R288]: This is a base option
available already of Knipper uses the base QC
workbench. Please note that we have proposed an
extension for Pallet level QC from RF screen. If this is
needed there, we can discuss further when we start
documenting that	
					
			KNIPPER SOLUTION DESIGN DOCU	MENT	
					
Figure: QC failure – reason code selection
Knipper uses Force QC pass several times in the workflow to use QC workbench as a
visual QC platform.
Figure: Force QC pass
Figure: Force QC pass process history
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 101 of 119					
```

<a id="p101-t002"></a>
## p101\-t002 — PDF page 101, detected table 2

```text
	t
t
t		
		t
t	Commented [RS290R288]: We need an input from
Knipper if they would like users to force pass the QC
when there are issues. This will be rare exception but
he standard process is to resolve any QC issues on
he floor and confirm it in the system
		t	Commented [NC291R288]: NC12052024: We want
his implemented
			
			
			
```

<a id="p102-b001"></a>
## p102\-b001 — PDF page 102, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p102-b002"></a>
## p102\-b002 — PDF page 102, block 2

```text
 

```

<a id="p102-b003"></a>
## p102\-b003 — PDF page 102, block 3

```text
 
24.2 
Close Container 
 

```

<a id="p102-b004"></a>
## p102\-b004 — PDF page 102, block 4

```text
Close container action/transaction identifies that the container is packed (sealed), and no 
other item can be put into it. This also advances the status of the container (and shipment) 
as per the status flow and determines the next action on the staging/dock area.  
 
[EX12 – Scheduled Ship Date Validation Before Close Container] allows changing the 
scheduled ship date on the shipment before container manifesting. 
 
For parcel and each picks, those containers need to be closed by the user to advance the 
status. To perform close container, user accesses close container insight screen or the 
Close container option on the Warehouse mobile menu and scans the Container ID. 
SCALE displays the expected weight of the container. User then clicks the Close button 
to complete the operation.  
 

```

<a id="p102-b005"></a>
## p102\-b005 — PDF page 102, block 5

```text
When close container is successful, SCALE will advance the status and print the parcel 
shipping label (LBL04) as well as the shipment packing list (DOC02). The shipment pack 
list is printed at close of last container. 

```

<a id="p102-b006"></a>
## p102\-b006 — PDF page 102, block 6

```text
 
For International parcel shipments, user needs to perform close container for every 
individual container and when the last container of the shipment is closed, user can select 
shipment level manifest and print shipping labels for all the containers for that shipment. 
For International shipments, commercial invoice is also printed (DOC04) 
 
 

```

<a id="p102-b007"></a>
## p102\-b007 — PDF page 102, block 7

```text
 
Figure: Close Container Screen – initiation 

```

<a id="p102-b008"></a>
## p102\-b008 — PDF page 102, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 102 of 119 
 

```

<a id="p102-t001"></a>
## p102\-t001 — PDF page 102, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
24.2 Close Container
Close container action/transaction identifies that the container is packed (sealed), and no
other item can be put into it. This also advances the status of the container (and shipment)
as per the status flow and determines the next action on the staging/dock area.
[EX12 – Scheduled Ship Date Validation Before Close Container] allows changing the
scheduled ship date on the shipment before container manifesting.
For parcel and each picks, those containers need to be closed by the user to advance the
status. To perform close container, user accesses close container insight screen or the
Close container option on the Warehouse mobile menu and scans the Container ID.
SCALE displays the expected weight of the container. User then clicks the Close button
to complete the operation.
When close container is successful, SCALE will advance the status and print the parcel
shipping label (LBL04) as well as the shipment packing list (DOC02). The shipment pack
list is printed at close of last container.
For International parcel shipments, user needs to perform close container for every
individual container and when the last container of the shipment is closed, user can select
shipment level manifest and print shipping labels for all the containers for that shipment.
For International shipments, commercial invoice is also printed (DOC04)
Figure: Close Container Screen – initiation
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 102 of 119						
```

<a id="p103-b001"></a>
## p103\-b001 — PDF page 103, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p103-b002"></a>
## p103\-b002 — PDF page 103, block 2

```text
 

```

<a id="p103-b003"></a>
## p103\-b003 — PDF page 103, block 3

```text
 
Figure: Close Container – Container details populated 

```

<a id="p103-b004"></a>
## p103\-b004 — PDF page 103, block 4

```text
 
24.3 
Shipping Container Insight 
 

```

<a id="p103-b005"></a>
## p103\-b005 — PDF page 103, block 5

```text
If necessary, the Shipping Container Insight can be used to modify the contents of the 
Shipping Container. The user can update the quantity to pack to 0 for any items needing 
to be unpacked from a container.  Once unpacked, the user can repack into new 
containers using the Packing screen.   
 
If user doesn’t have Container ID to Scan but still must perform the close container, then 
they can use Shipping Container Insight and filter based on the Shipment ID. From the 
Container insight, user can select the Container ID and then use the Close Action to close 
the container.  

```

<a id="p103-b006"></a>
## p103\-b006 — PDF page 103, block 6

```text
 
Figure: Shipping Container Insight 

```

<a id="p103-b007"></a>
## p103\-b007 — PDF page 103, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 103 of 119 
 

```

<a id="p103-t001"></a>
## p103\-t001 — PDF page 103, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Close Container – Container details populated
24.3 Shipping Container Insight
If necessary, the Shipping Container Insight can be used to modify the contents of the
Shipping Container. The user can update the quantity to pack to 0 for any items needing
to be unpacked from a container. Once unpacked, the user can repack into new
containers using the Packing screen.
If user doesn’t have Container ID to Scan but still must perform the close container, then
they can use Shipping Container Insight and filter based on the Shipment ID. From the
Container insight, user can select the Container ID and then use the Close Action to close
the container.
Figure: Shipping Container Insight
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 103 of 119						
```

<a id="p104-b001"></a>
## p104\-b001 — PDF page 104, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p104-b002"></a>
## p104\-b002 — PDF page 104, block 2

```text
 

```

<a id="p104-b003"></a>
## p104\-b003 — PDF page 104, block 3

```text
 

```

<a id="p104-b004"></a>
## p104\-b004 — PDF page 104, block 4

```text
 
Figure: Shipping Container Insight with Close Container Option 

```

<a id="p104-b005"></a>
## p104\-b005 — PDF page 104, block 5

```text
 
Note: To edit container contents, a container must be in a location with a subclass of 
Packing. 
 
 

```

<a id="p104-b006"></a>
## p104\-b006 — PDF page 104, block 6

```text
24.4 
Carrier changes 
 

```

<a id="p104-b007"></a>
## p104\-b007 — PDF page 104, block 7

```text
Carrier is assigned as part of load planning before the wave is run.  
 
To change an LTL carrier before loading into truck, the user will use the Shipment Insight 
screen and utilize the Transfer Shipment option to change the carrier.  
 
When Transfer Shipment option is selected, user will be presented with an option to 
provide the destination load. If the user knows the load number, then they can enter the 
shipping load number and SCALE will transfer the shipment to that load. 
 
If the load is not known, then user can select to create a new load and select the carrier 
for the new load. SCALE will create new load and then transfer the shipment to new load. 

```

<a id="p104-b008"></a>
## p104\-b008 — PDF page 104, block 8

```text
Carrier change after waving happens at a minimal and is an exception. Knipper handles 
this using a SOP outside of SCALE.  

```

<a id="p104-b009"></a>
## p104\-b009 — PDF page 104, block 9

```text
 

```

<a id="p104-b010"></a>
## p104\-b010 — PDF page 104, block 10

```text
 

```

<a id="p104-b011"></a>
## p104\-b011 — PDF page 104, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 104 of 119 
 

```

<a id="p104-t001"></a>
## p104\-t001 — PDF page 104, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Shipping Container Insight with Close Container Option
Note: To edit container contents, a container must be in a location with a subclass of
Packing.
24.4 Carrier changes
Carrier is assigned as part of load planning before the wave is run.
To change an LTL carrier before loading into truck, the user will use the Shipment Insight
screen and utilize the Transfer Shipment option to change the carrier.
When Transfer Shipment option is selected, user will be presented with an option to
provide the destination load. If the user knows the load number, then they can enter the
shipping load number and SCALE will transfer the shipment to that load.
If the load is not known, then user can select to create a new load and select the carrier
for the new load. SCALE will create new load and then transfer the shipment to new load.
Carrier change after waving happens at a minimal and is an exception. Knipper handles
this using a SOP outside of SCALE.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 104 of 119						
```

<a id="p105-b001"></a>
## p105\-b001 — PDF page 105, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p105-b002"></a>
## p105\-b002 — PDF page 105, block 2

```text
 

```

<a id="p105-b003"></a>
## p105\-b003 — PDF page 105, block 3

```text
 
Figure: Shipment Insight – Transfer Shipment Option 

```

<a id="p105-b004"></a>
## p105\-b004 — PDF page 105, block 4

```text
 
Figure: Shipment Insight – Transfer to new load 

```

<a id="p105-b005"></a>
## p105\-b005 — PDF page 105, block 5

```text
 

```

<a id="p105-b006"></a>
## p105\-b006 — PDF page 105, block 6

```text
 
Figure: Shipment Insight – Enter Destination Load Number or create New Load 
 
 

```

<a id="p105-b007"></a>
## p105\-b007 — PDF page 105, block 7

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 105 of 119 
 

```

<a id="p105-t001"></a>
## p105\-t001 — PDF page 105, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Figure: Shipment Insight – Transfer Shipment Option
Figure: Shipment Insight – Transfer to new load
Figure: Shipment Insight – Enter Destination Load Number or create New Load
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 105 of 119						
```

<a id="p106-b001"></a>
## p106\-b001 — PDF page 106, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p106-b002"></a>
## p106\-b002 — PDF page 106, block 2

```text
 

```

<a id="p106-b003"></a>
## p106\-b003 — PDF page 106, block 3

```text
Commented [SG293]: Dock Management for Parcel? 

```

<a id="p106-b004"></a>
## p106\-b004 — PDF page 106, block 4

```text
 
25.0 
DOCK MANAGEMENT 
 

```

<a id="p106-b005"></a>
## p106\-b005 — PDF page 106, block 5

```text
Commented [NC294R293]: NC11182024: Please 
confirm 

```

<a id="p106-b006"></a>
## p106\-b006 — PDF page 106, block 6

```text
Commented [RS295R293]: This is currently being 
configured/tested in SCALE 2013 version. We have 
also provided some recommendations. Once Knipper 
goes live with the functionality, the same will be ported 
over to new version 

```

<a id="p106-b007"></a>
## p106\-b007 — PDF page 106, block 7

```text
Commented [NC296R293]: NC12052024:  Per Ops/ 
Vimal - this is not working and this will need a custom 
extension  

```

<a id="p106-b008"></a>
## p106\-b008 — PDF page 106, block 8

```text
Dock management represents the process of tracking shipments after they have arrived in 
the shipping dock area of the warehouse. These processes include the consolidation of 
items/containers at the packing area location, the placing of containers on the shipping dock 
at staging locations, and the loading of containers onto the truck, referred to in the system 
as dock door locations.  
 
Dock management is used at Knipper LTL shipments. Knipper utilizes dock doors by 
manually assigning them to the shipping load. 
 

```

<a id="p106-b009"></a>
## p106\-b009 — PDF page 106, block 9

```text
Commented [RS297R293]: We have recommended a 
base solution which needs manual scanning containers 
to stage/dock door which will avoid extension. Please 
note that even if we design an extension, it will be 
based on a lot of assumptions. 

```

<a id="p106-b010"></a>
## p106\-b010 — PDF page 106, block 10

```text
 
25.1 
Dock Door Assignment 
 
Dock Door assignment at Knipper is done manually. 
 
Shipping loads are created for LTL and parcel carrier using the load building wave steps. 
When the Parcel / LTL carrier shows at the warehouse, the shipping supervisor instructs 
the driver to go to a specific dock door. In SCALE the user will go to shipping load insight 
screen and search for the shipping load and will edit the shipping load to assign a dock 
door. Loading work will get generated and user can perform this work to load the pallet to 
truck. 
 

```

<a id="p106-b011"></a>
## p106\-b011 — PDF page 106, block 11

```text
 
Figure– Shipping Load Insight 

```

<a id="p106-b012"></a>
## p106\-b012 — PDF page 106, block 12

```text
 

```

<a id="p106-b013"></a>
## p106\-b013 — PDF page 106, block 13

```text
25.2 
Loading 
 

```

<a id="p106-b014"></a>
## p106\-b014 — PDF page 106, block 14

```text
The user starts the process by signing into the Work execution/Loading option on 
warehouse mobile.  The user is then prompted to scan a Container ID.  The user scans 
the container ID and SCALE then presents the user to confirm the pick from staging 
location.  After that, user is prompted to scan the dock door to confirm the loading.  This 
updates the container status to Ship Confirm Pending.  

```

<a id="p106-b015"></a>
## p106\-b015 — PDF page 106, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 106 of 119 
 

```

<a id="p106-t001"></a>
## p106\-t001 — PDF page 106, detected table 1

```text
					MENT
Commented [SG293]: Dock Management for Parcel?
Commented [NC294R293]: NC11182024: Please
confirm
Commented [RS295R293]: This is currently being
configured/tested in SCALE 2013 version. We have
also provided some recommendations. Once Knipper
goes live with the functionality, the same will be ported
over to new version
Commented [NC296R293]: NC12052024: Per Ops/
Vimal - this is not working and this will need a custom
extension
Commented [RS297R293]: We have recommended a
base solution which needs manual scanning containers
to stage/dock door which will avoid extension. Please
note that even if we design an extension, it will be
based on a lot of assumptions.	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
25.0 DOCK MANAGEMENT
Dock management represents the process of tracking shipments after they have arrived in
the shipping dock area of the warehouse. These processes include the consolidation of
items/containers at the packing area location, the placing of containers on the shipping dock
at staging locations, and the loading of containers onto the truck, referred to in the system
as dock door locations.
Dock management is used at Knipper LTL shipments. Knipper utilizes dock doors by
manually assigning them to the shipping load.
25.1 Dock Door Assignment
Dock Door assignment at Knipper is done manually.
Shipping loads are created for LTL and parcel carrier using the load building wave steps.
When the Parcel / LTL carrier shows at the warehouse, the shipping supervisor instructs
the driver to go to a specific dock door. In SCALE the user will go to shipping load insight
screen and search for the shipping load and will edit the shipping load to assign a dock
door. Loading work will get generated and user can perform this work to load the pallet to
truck.
Figure– Shipping Load Insight
25.2 Loading
The user starts the process by signing into the Work execution/Loading option on
warehouse mobile. The user is then prompted to scan a Container ID. The user scans
the container ID and SCALE then presents the user to confirm the pick from staging
location. After that, user is prompted to scan the dock door to confirm the loading. This
updates the container status to Ship Confirm Pending.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 106 of 119						
```

<a id="p107-b001"></a>
## p107\-b001 — PDF page 107, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p107-b002"></a>
## p107\-b002 — PDF page 107, block 2

```text
 

```

<a id="p107-b003"></a>
## p107\-b003 — PDF page 107, block 3

```text
 

```

<a id="p107-b004"></a>
## p107\-b004 — PDF page 107, block 4

```text
26.0 
LOAD CONFIRMATION 
 

```

<a id="p107-b005"></a>
## p107\-b005 — PDF page 107, block 5

```text
26.1 
Processing 
 

```

<a id="p107-b006"></a>
## p107\-b006 — PDF page 107, block 6

```text
Knipper Personnel use the Shipping Load Insight screen to monitor the status of 
shipments and loads. Once all shipments for a Load are in Load Confirm Pending status 
[Ship Confirm All scheduled job confirms shipments and advance status to Load 
Confirm Pending], the Load can be confirmed. To Confirm the Load, a user selects the 
Load and uses the Confirm Load action in the Shipping Load Insight options. This 
relieves the inventory from the Shipping Dock locations in SCALE. At this point, the 
shipments are available for upload to the host system the next time the interface job runs.  
In addition, the shipment can no longer be modified in SCALE. 
 
Knipper does not split shipments. The Shipping load leading and trailing status should be 
ship confirm pending. If the status is not Ship confirm pending, then user moves any 
shipments that are not in ship confirm pending to another load. This is necessary as 
Knipper doesn’t want to Split the shipment. This is based on the restriction on the host 
system.  
 
 

```

<a id="p107-b007"></a>
## p107\-b007 — PDF page 107, block 7

```text
 
Figure – Load confirm using Shipping Load insight 

```

<a id="p107-b008"></a>
## p107\-b008 — PDF page 107, block 8

```text
 

```

<a id="p107-b009"></a>
## p107\-b009 — PDF page 107, block 9

```text
Additionally, personnel may print documents before, or after the load is confirmed using 
the Shipping Load Insight options. 

```

<a id="p107-b010"></a>
## p107\-b010 — PDF page 107, block 10

```text
• 
Bill of Lading (DOC03) Knipper uses a customized BOL implemented using 
[EX14 – Custom BOL Changes]  
 
For international shipments, the commercial invoice is printed. Knipper uses a custom 
commercial invoice template configured in SCALE. 
 
The load confirmation process also validates if the ship events have been generated in 
RTS system for all DSCSA tracked items. If the ship events are not generated for any 
shipment in the load, load confirmation process will not proceed further and displays an 
error.  This is handled through [EX30 – Serialization Integration with Rfxcel for 
Outbound] 
 

```

<a id="p107-b011"></a>
## p107\-b011 — PDF page 107, block 11

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 107 of 119 
 

```

<a id="p107-t001"></a>
## p107\-t001 — PDF page 107, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
26.0 LOAD CONFIRMATION
26.1 Processing
Knipper Personnel use the Shipping Load Insight screen to monitor the status of
shipments and loads. Once all shipments for a Load are in Load Confirm Pending status
[Ship Confirm All scheduled job confirms shipments and advance status to Load
Confirm Pending], the Load can be confirmed. To Confirm the Load, a user selects the
Load and uses the Confirm Load action in the Shipping Load Insight options. This
relieves the inventory from the Shipping Dock locations in SCALE. At this point, the
shipments are available for upload to the host system the next time the interface job runs.
In addition, the shipment can no longer be modified in SCALE.
Knipper does not split shipments. The Shipping load leading and trailing status should be
ship confirm pending. If the status is not Ship confirm pending, then user moves any
shipments that are not in ship confirm pending to another load. This is necessary as
Knipper doesn’t want to Split the shipment. This is based on the restriction on the host
system.
Figure – Load confirm using Shipping Load insight
Additionally, personnel may print documents before, or after the load is confirmed using
the Shipping Load Insight options.
• Bill of Lading (DOC03) Knipper uses a customized BOL implemented using
[EX14 – Custom BOL Changes]
For international shipments, the commercial invoice is printed. Knipper uses a custom
commercial invoice template configured in SCALE.
The load confirmation process also validates if the ship events have been generated in
RTS system for all DSCSA tracked items. If the ship events are not generated for any
shipment in the load, load confirmation process will not proceed further and displays an
error. This is handled through [EX30 – Serialization Integration with Rfxcel for
Outbound]
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 107 of 119						
```

<a id="p108-b001"></a>
## p108\-b001 — PDF page 108, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p108-b002"></a>
## p108\-b002 — PDF page 108, block 2

```text
 

```

<a id="p108-b003"></a>
## p108\-b003 — PDF page 108, block 3

```text
Once a load has been confirmed, all statuses (load, shipments, details, containers) are 
moved to Closed, and inventory is relieved from the Shipping Dock (is officially out of the 
building). This generates the shipment upload interface files for the Host system. 

```

<a id="p108-b004"></a>
## p108\-b004 — PDF page 108, block 4

```text
 
 
27.0 
PARCEL MANIFESTING PROCESS 
 

```

<a id="p108-b005"></a>
## p108\-b005 — PDF page 108, block 5

```text
Commented [CC298]: Ups, UPS MI, USPS Prioroty 

```

<a id="p108-b006"></a>
## p108\-b006 — PDF page 108, block 6

```text
All parcel manifest processing is executed from the Manifest Insight screen. Users can 
view any pertinent manifest information from this option. Any action for FedEx carrier is 
excluded from this screen. There is no end of day processing necessary for FedEx parcel 
carrier. Knipper will continue to utilize this screen for UPS, USPS and UPS Mail 
Innovations. 
 

```

<a id="p108-b007"></a>
## p108\-b007 — PDF page 108, block 7

```text
Commented [NC299R298]: NC11182024: MAH to 
confirm 

```

<a id="p108-b008"></a>
## p108\-b008 — PDF page 108, block 8

```text
27.1 
End of Day Processing 
 

```

<a id="p108-b009"></a>
## p108\-b009 — PDF page 108, block 9

```text
Commented [RS300R298]: updated 

```

<a id="p108-b010"></a>
## p108\-b010 — PDF page 108, block 10

```text
Commented [NC301R298]: NC12052024: This is 
resolved 

```

<a id="p108-b011"></a>
## p108\-b011 — PDF page 108, block 11

```text
Manifests can be closed at the end of the day by clicking on a Manifest from the Manifest 
Insight and choosing the Close option.  Rating Systems Value “Allow Multiple Manifests 
per Day” is set to Yes.  
 

```

<a id="p108-b012"></a>
## p108\-b012 — PDF page 108, block 12

```text
 
Figure: Manifest Insight Screen 

```

<a id="p108-b013"></a>
## p108\-b013 — PDF page 108, block 13

```text
 
27.2 
Printing 
 

```

<a id="p108-b014"></a>
## p108\-b014 — PDF page 108, block 14

```text
Required documents can also be printed from the Manifest Insight. These documents can 
print out automatically when closing the manifest or be printed manually. 
 
The documents include:  
 
Container Manifest 
UPS Summary Label 
 
Once a Manifest has been closed, the Manifest is no longer open to receive additional 
containers; all additional containers manifested for that day are put on a new manifest, 
and Electronic Manifest is sent to Parcel Carrier.  Containers on closed manifests may not 
be changed. 
 

```

<a id="p108-b015"></a>
## p108\-b015 — PDF page 108, block 15

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 108 of 119 
 

```

<a id="p108-t001"></a>
## p108\-t001 — PDF page 108, detected table 1

```text
					MENT
Commented [CC298]: Ups, UPS MI, USPS Prioroty
Commented [NC299R298]: NC11182024: MAH to
confirm
Commented [RS300R298]: updated
Commented [NC301R298]: NC12052024: This is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
Once a load has been confirmed, all statuses (load, shipments, details, containers) are
moved to Closed, and inventory is relieved from the Shipping Dock (is officially out of the
building). This generates the shipment upload interface files for the Host system.
27.0 PARCEL MANIFESTING PROCESS
All parcel manifest processing is executed from the Manifest Insight screen. Users can
view any pertinent manifest information from this option. Any action for FedEx carrier is
excluded from this screen. There is no end of day processing necessary for FedEx parcel
carrier. Knipper will continue to utilize this screen for UPS, USPS and UPS Mail
Innovations.
27.1 End of Day Processing
Manifests can be closed at the end of the day by clicking on a Manifest from the Manifest
Insight and choosing the Close option. Rating Systems Value “Allow Multiple Manifests
per Day” is set to Yes.
Figure: Manifest Insight Screen
27.2 Printing
Required documents can also be printed from the Manifest Insight. These documents can
print out automatically when closing the manifest or be printed manually.
The documents include:
Container Manifest
UPS Summary Label
Once a Manifest has been closed, the Manifest is no longer open to receive additional
containers; all additional containers manifested for that day are put on a new manifest,
and Electronic Manifest is sent to Parcel Carrier. Containers on closed manifests may not
be changed.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 108 of 119						
```

<a id="p109-b001"></a>
## p109\-b001 — PDF page 109, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p109-b002"></a>
## p109\-b002 — PDF page 109, block 2

```text
 

```

<a id="p109-b003"></a>
## p109\-b003 — PDF page 109, block 3

```text
VI.  CONVERSION NOTE 
 
The below points should be part of the conversion process. 
 

```

<a id="p109-b004"></a>
## p109\-b004 — PDF page 109, block 4

```text
1. Review and remove any database objects not compliant with Azure SQL. The findings 
have been already shared with Knipper team. This should be one of the steps to be part 
of the conversion checklist. 
2. Configuration related to Warehouse split should be documented and executed during the 
conversion. 
3. Inventory conversion by Warehouse after the split. 
4. Planning of conversion to consider the timing due to data migration. Knipper and 
Manhattan to finalize on number of years of data to be migrated to SCALE Active. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p109-b005"></a>
## p109\-b005 — PDF page 109, block 5

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 109 of 119 
 

```

<a id="p109-t001"></a>
## p109\-t001 — PDF page 109, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
VI. CONVERSION NOTE
The below points should be part of the conversion process.
1. Review and remove any database objects not compliant with Azure SQL. The findings
have been already shared with Knipper team. This should be one of the steps to be part
of the conversion checklist.
2. Configuration related to Warehouse split should be documented and executed during the
conversion.
3. Inventory conversion by Warehouse after the split.
4. Planning of conversion to consider the timing due to data migration. Knipper and
Manhattan to finalize on number of years of data to be migrated to SCALE Active.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 109 of 119						
```

<a id="p110-b001"></a>
## p110\-b001 — PDF page 110, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p110-b002"></a>
## p110\-b002 — PDF page 110, block 2

```text
 

```

<a id="p110-b003"></a>
## p110\-b003 — PDF page 110, block 3

```text
 
VII.  SYSTEM EXTENSIONS 

```

<a id="p110-b004"></a>
## p110\-b004 — PDF page 110, block 4

```text
 
Interface Integration Extensions 
 
Extension 
Description (Defined above in the interface section) 

```

<a id="p110-b005"></a>
## p110\-b005 — PDF page 110, block 5

```text
 
 
 
 
 
Performance Management Extensions 
 

```

<a id="p110-b006"></a>
## p110\-b006 — PDF page 110, block 6

```text
Extension 
Description 
Module 

```

<a id="p110-b007"></a>
## p110\-b007 — PDF page 110, block 7

```text
N/A 
 
 
 
Warehouse Management Extensions 
 
Extension 
Description 

```

<a id="p110-b008"></a>
## p110\-b008 — PDF page 110, block 8

```text
EX12 

```

<a id="p110-b009"></a>
## p110\-b009 — PDF page 110, block 9

```text
 
 
Scheduled Ship Date Validation Before Close Container  

```

<a id="p110-b010"></a>
## p110\-b010 — PDF page 110, block 10

```text
EX13 

```

<a id="p110-b011"></a>
## p110\-b011 — PDF page 110, block 11

```text
Pick to Light Wave Splitting  
  
Wave Steps:  
Cancel Replenishment for Rejected Orders  
DTP Location Assignment  
DTP Wave Splitting  
  
Exit point:  
Release Wave - Before  
EX14 
Custom BOL 

```

<a id="p110-b012"></a>
## p110\-b012 — PDF page 110, block 12

```text
           EX16 
FedEx Express Reference Fields  

```

<a id="p110-b013"></a>
## p110\-b013 — PDF page 110, block 13

```text
EX17 
Re-Cartonization of Containers based on Season  

```

<a id="p110-b014"></a>
## p110\-b014 — PDF page 110, block 14

```text
EX18 
Whole Number Allocation for Work Orders  

```

<a id="p110-b015"></a>
## p110\-b015 — PDF page 110, block 15

```text
EX19 

```

<a id="p110-b016"></a>
## p110\-b016 — PDF page 110, block 16

```text
MHE Interface - Scale Pick to Light Integration  
PTLViewer  
Outbound msg for pick confirmation  

```

<a id="p110-b017"></a>
## p110\-b017 — PDF page 110, block 17

```text
EX19A 
MHE Integration Changes to Support Multiple MHE Server  

```

<a id="p110-b018"></a>
## p110\-b018 — PDF page 110, block 18

```text
EX24 
Display Item Alias in RF Pick confirmation screen  

```

<a id="p110-b019"></a>
## p110\-b019 — PDF page 110, block 19

```text
EX26 
Display Expiry Date on cycle count screen  

```

<a id="p110-b020"></a>
## p110\-b020 — PDF page 110, block 20

```text
EX36 
Corrugate Item Tracking 

```

<a id="p110-b021"></a>
## p110\-b021 — PDF page 110, block 21

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 110 of 119 
 

```

<a id="p110-t001"></a>
## p110\-t001 — PDF page 110, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
VII. SYSTEM EXTENSIONS
Interface Integration Extensions
Extension Description (Defined above in the interface section)
Performance Management Extensions
Extension Description Module
N/A
Warehouse Management Extensions
Extension Description
EX12 Scheduled Ship Date Validation Before Close Container
Pick to Light Wave Splitting
Wave Steps:
Cancel Replenishment for Rejected Orders
DTP Location Assignment
DTP Wave Splitting
Exit point:
EX13 Release Wave - Before
EX14 Custom BOL
FedEx Express Reference Fields
EX16
Re-Cartonization of Containers based on Season
EX17
Whole Number Allocation for Work Orders
EX18
MHE Interface - Scale Pick to Light Integration
PTLViewer
EX19 Outbound msg for pick confirmation
MHE Integration Changes to Support Multiple MHE Server
EX19A
EX24 Display Item Alias in RF Pick confirmation screen
EX26 Display Expiry Date on cycle count screen
EX36 Corrugate Item Tracking
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 110 of 119						
```

<a id="p110-t002"></a>
## p110\-t002 — PDF page 110, detected table 2

```text
	Extension			Description (Defined above in the interface section)
				
				
```

<a id="p110-t003"></a>
## p110\-t003 — PDF page 110, detected table 3

```text
	Extension			Description			Module
N/A							
```

<a id="p110-t004"></a>
## p110\-t004 — PDF page 110, detected table 4

```text
	Extension			Description	
EX12			Scheduled Ship Date Validation Before Close Container		
EX13			Pick to Light Wave Splitting
Wave Steps:
Cancel Replenishment for Rejected Orders
DTP Location Assignment
DTP Wave Splitting
Exit point:
Release Wave - Before		
EX14			Custom BOL		
EX16			FedEx Express Reference Fields		
EX17			Re-Cartonization of Containers based on Season		
EX18			Whole Number Allocation for Work Orders		
EX19			MHE Interface - Scale Pick to Light Integration
PTLViewer
Outbound msg for pick confirmation		
EX19A			MHE Integration Changes to Support Multiple MHE Server		
EX24			Display Item Alias in RF Pick confirmation screen		
EX26			Display Expiry Date on cycle count screen		
EX36			Corrugate Item Tracking		
```

<a id="p111-b001"></a>
## p111\-b001 — PDF page 111, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p111-b002"></a>
## p111\-b002 — PDF page 111, block 2

```text
 

```

<a id="p111-b003"></a>
## p111\-b003 — PDF page 111, block 3

```text
EX37 
Serialization Integration with Rfxcel Inbound 

```

<a id="p111-b004"></a>
## p111\-b004 — PDF page 111, block 4

```text
EX37A 
SERIALIZATION INTEGRATION INBOUND FOR LOT VALIDATION 

```

<a id="p111-b005"></a>
## p111\-b005 — PDF page 111, block 5

```text
EX38 
Serialization Integration with Rfxcel Outbound  

```

<a id="p111-b006"></a>
## p111\-b006 — PDF page 111, block 6

```text
EX38A 
Serialization Integration with Rfxcel Outbound  

```

<a id="p111-b007"></a>
## p111\-b007 — PDF page 111, block 7

```text
EX38B 
Verification & Address Validation  

```

<a id="p111-b008"></a>
## p111\-b008 — PDF page 111, block 8

```text
EX38C 
Downgrade UOM Picking & Serialization Changes  

```

<a id="p111-b009"></a>
## p111\-b009 — PDF page 111, block 9

```text
EX38D 
Additional Changes to Outbound Serialization  

```

<a id="p111-b010"></a>
## p111\-b010 — PDF page 111, block 10

```text
EX39 
GS1 Scanning for Work Confirmation Item Validation 

```

<a id="p111-b011"></a>
## p111\-b011 — PDF page 111, block 11

```text
EX40 
Printing multiple work unit document from work insight 

```

<a id="p111-b012"></a>
## p111\-b012 — PDF page 111, block 12

```text
EX41 

```

<a id="p111-b013"></a>
## p111\-b013 — PDF page 111, block 13

```text
Mass updates - Change Carrier, Service, Scheduled ship date for multiple 
shipments at Wave level 

```

<a id="p111-b014"></a>
## p111\-b014 — PDF page 111, block 14

```text
EX42 
Custom Return from Shipment 

```

<a id="p111-b015"></a>
## p111\-b015 — PDF page 111, block 15

```text
EX43 
Flash title – Inventory Conversion from one Item to another 

```

<a id="p111-b016"></a>
## p111\-b016 — PDF page 111, block 16

```text
EX44 
LPN Combine 

```

<a id="p111-b017"></a>
## p111\-b017 — PDF page 111, block 17

```text
EX27 

```

<a id="p111-b018"></a>
## p111\-b018 — PDF page 111, block 18

```text
HazMat documents/Accessorial 
 

```

<a id="p111-b019"></a>
## p111\-b019 — PDF page 111, block 19

```text
Pallet level QC after nesting for DSCSA 
 

```

<a id="p111-b020"></a>
## p111\-b020 — PDF page 111, block 20

```text
EX46 

```

<a id="p111-b021"></a>
## p111\-b021 — PDF page 111, block 21

```text
EX47 

```

<a id="p111-b022"></a>
## p111\-b022 — PDF page 111, block 22

```text
Cubiscan Integration 
 

```

<a id="p111-b023"></a>
## p111\-b023 — PDF page 111, block 23

```text
EX48 
Auto refresh Wave Insight screen 

```

<a id="p111-b024"></a>
## p111\-b024 — PDF page 111, block 24

```text
EX49 
TPM Order Status Insight Changes 

```

<a id="p111-b025"></a>
## p111\-b025 — PDF page 111, block 25

```text
 
  
Stored Procedures for Generic Data Bind API 
SP 
Description 

```

<a id="p111-b026"></a>
## p111\-b026 — PDF page 111, block 26

```text
N/A 
To be documented if identified during tech design 

```

<a id="p111-b027"></a>
## p111\-b027 — PDF page 111, block 27

```text
 
 

```

<a id="p111-b028"></a>
## p111\-b028 — PDF page 111, block 28

```text
 
Warehouse Management Gaps for future considerations  

```

<a id="p111-b029"></a>
## p111\-b029 — PDF page 111, block 29

```text
Extension 
Description 

```

<a id="p111-b030"></a>
## p111\-b030 — PDF page 111, block 30

```text
N/A 
 
 
 
Documents 

```

<a id="p111-b031"></a>
## p111\-b031 — PDF page 111, block 31

```text
Document  
Description 
DOC01 
Receiving Worksheet 

```

<a id="p111-b032"></a>
## p111\-b032 — PDF page 111, block 32

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 111 of 119 
 

```

<a id="p111-t001"></a>
## p111\-t001 — PDF page 111, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
EX37 Serialization Integration with Rfxcel Inbound
EX37A SERIALIZATION INTEGRATION INBOUND FOR LOT VALIDATION
EX38 Serialization Integration with Rfxcel Outbound
EX38A Serialization Integration with Rfxcel Outbound
EX38B Verification & Address Validation
EX38C Downgrade UOM Picking & Serialization Changes
Additional Changes to Outbound Serialization
EX38D
GS1 Scanning for Work Confirmation Item Validation
EX39
Printing multiple work unit document from work insight
EX40
Mass updates - Change Carrier, Service, Scheduled ship date for multiple
EX41 shipments at Wave level
Custom Return from Shipment
EX42
Flash title – Inventory Conversion from one Item to another
EX43
LPN Combine
EX44
HazMat documents/Accessorial
EX27
Pallet level QC after nesting for DSCSA
EX46
Cubiscan Integration
EX47
Auto refresh Wave Insight screen
EX48
TPM Order Status Insight Changes
EX49
Stored Procedures for Generic Data Bind API
SP Description
N/A To be documented if identified during tech design
Warehouse Management Gaps for future considerations
Extension Description
N/A
Documents
Document Description
DOC01 Receiving Worksheet
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 111 of 119						
```

<a id="p111-t002"></a>
## p111\-t002 — PDF page 111, detected table 2

```text
EX37	Serialization Integration with Rfxcel Inbound
EX37A	SERIALIZATION INTEGRATION INBOUND FOR LOT VALIDATION
EX38	Serialization Integration with Rfxcel Outbound
EX38A	Serialization Integration with Rfxcel Outbound
EX38B	Verification & Address Validation
EX38C	Downgrade UOM Picking & Serialization Changes
EX38D	Additional Changes to Outbound Serialization
EX39	GS1 Scanning for Work Confirmation Item Validation
EX40	Printing multiple work unit document from work insight
EX41	Mass updates - Change Carrier, Service, Scheduled ship date for multiple
shipments at Wave level
EX42	Custom Return from Shipment
EX43	Flash title – Inventory Conversion from one Item to another
EX44	LPN Combine
EX27	HazMat documents/Accessorial
EX46	Pallet level QC after nesting for DSCSA
EX47	Cubiscan Integration
EX48	Auto refresh Wave Insight screen
EX49	TPM Order Status Insight Changes
```

<a id="p111-t003"></a>
## p111\-t003 — PDF page 111, detected table 3

```text
SP			Description
N/A		To be documented if identified during tech design	
			
```

<a id="p111-t004"></a>
## p111\-t004 — PDF page 111, detected table 4

```text
Extension		Description
N/A		
```

<a id="p111-t005"></a>
## p111\-t005 — PDF page 111, detected table 5

```text
Document		Description	
		Receiving Worksheet	
```

<a id="p112-b001"></a>
## p112\-b001 — PDF page 112, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p112-b002"></a>
## p112\-b002 — PDF page 112, block 2

```text
 

```

<a id="p112-b003"></a>
## p112\-b003 — PDF page 112, block 3

```text
DOC02 
Pack List 
DOC03 
Bill of Lading 
 
DOC04 
Commercial Invoice 

```

<a id="p112-b004"></a>
## p112\-b004 — PDF page 112, block 4

```text
 
 
Labels 
 

```

<a id="p112-b005"></a>
## p112\-b005 — PDF page 112, block 5

```text
Label  
Description 
LBL01 
Receipt Container Label  
LBL02 
Vendor Label 
LBL03 
Container Contents Label 
LBL04 
Shipping Label 
LBL05 
Pallet Label 
 
*Note: For each of the documents and labels (unless part of the Top 100 Retailers for outbound 
labels) listed above, Knipper owns the development and certification process. 
 
Exit Points 
 

```

<a id="p112-b006"></a>
## p112\-b006 — PDF page 112, block 6

```text
Commented [RS302]: There are multiple exit points in 
use which are developed as part of the current 
extensions. New exit points identified as part of new 
extension or re-design of current extensions will be 
added. 

```

<a id="p112-b007"></a>
## p112\-b007 — PDF page 112, block 7

```text
Commented [NC303R302]: NC11182024: I do not 
know what this means 

```

<a id="p112-b008"></a>
## p112\-b008 — PDF page 112, block 8

```text
Commented [RS304R302]: These are currently used 
extensible features to implement some customizations. 
I have updated the list with the ones being used in the 
current version. 

```

<a id="p112-b009"></a>
## p112\-b009 — PDF page 112, block 9

```text
Commented [NC305R302]: NC12052024: This is 
resolved 

```

<a id="p112-b010"></a>
## p112\-b010 — PDF page 112, block 10

```text
Exit Point  
Description 
EP01 
Cancel Shipment – Before 
EP02 
Close Container – Before 
EP03 
Close Container UI Validation 
EP04 
Container Manifesting – After 
EP05 
Load Confirmation – Before 
EP06 
Release Wave – Before 
EP07 
Release Wave - After 
EP08 
RF Group Assignment – After 
EP09 
Ship Label Custom Text – Progistics 
EP10 
Shipment Allocation Request After 
 
Notifications 

```

<a id="p112-b011"></a>
## p112\-b011 — PDF page 112, block 11

```text
Notification  Description 

```

<a id="p112-b012"></a>
## p112\-b012 — PDF page 112, block 12

```text
Several 
TBD as needed 
 
 
 
 
 
Labor Management Extensions 

```

<a id="p112-b013"></a>
## p112\-b013 — PDF page 112, block 13

```text
Extension 
Description 

```

<a id="p112-b014"></a>
## p112\-b014 — PDF page 112, block 14

```text
N/A 
 

```

<a id="p112-b015"></a>
## p112\-b015 — PDF page 112, block 15

```text
 
 

```

<a id="p112-b016"></a>
## p112\-b016 — PDF page 112, block 16

```text
 
 

```

<a id="p112-b017"></a>
## p112\-b017 — PDF page 112, block 17

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 112 of 119 
 

```

<a id="p112-t001"></a>
## p112\-t001 — PDF page 112, detected table 1

```text
					MENT
Commented [RS302]: There are multiple exit points in
use which are developed as part of the current
extensions. New exit points identified as part of new
extension or re-design of current extensions will be
added.
Commented [NC303R302]: NC11182024: I do not
know what this means
Commented [RS304R302]: These are currently used
extensible features to implement some customizations.
I have updated the list with the ones being used in the
current version.
Commented [NC305R302]: NC12052024: This is
resolved	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
DOC02 Pack List
DOC03 Bill of Lading
DOC04 Commercial Invoice
Labels
Label Description
LBL01 Receipt Container Label
LBL02 Vendor Label
LBL03 Container Contents Label
LBL04 Shipping Label
LBL05 Pallet Label
*Note: For each of the documents and labels (unless part of the Top 100 Retailers for outbound
labels) listed above, Knipper owns the development and certification process.
Exit Points
Exit Point Description
EP01 Cancel Shipment – Before
EP02 Close Container – Before
EP03 Close Container UI Validation
EP04 Container Manifesting – After
EP05 Load Confirmation – Before
EP06 Release Wave – Before
EP07 Release Wave - After
EP08 RF Group Assignment – After
EP09 Ship Label Custom Text – Progistics
EP10 Shipment Allocation Request After
Notifications
Notification Description
Several TBD as needed
Labor Management Extensions
Extension Description
N/A
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 112 of 119						
```

<a id="p112-t002"></a>
## p112\-t002 — PDF page 112, detected table 2

```text
DOC02	Pack List
DOC03	Bill of Lading
DOC04	Commercial Invoice
```

<a id="p112-t003"></a>
## p112\-t003 — PDF page 112, detected table 3

```text
	Label			Description	
LBL01			Receipt Container Label		
LBL02			Vendor Label		
LBL03			Container Contents Label		
LBL04			Shipping Label		
LBL05			Pallet Label		
```

<a id="p112-t004"></a>
## p112\-t004 — PDF page 112, detected table 4

```text
	Exit Point			Description	
EP01			Cancel Shipment – Before		
EP02			Close Container – Before		
EP03			Close Container UI Validation		
EP04			Container Manifesting – After		
EP05			Load Confirmation – Before		
EP06			Release Wave – Before		
EP07			Release Wave - After		
EP08			RF Group Assignment – After		
EP09			Ship Label Custom Text – Progistics		
EP10			Shipment Allocation Request After		
```

<a id="p112-t005"></a>
## p112\-t005 — PDF page 112, detected table 5

```text
	Notification			Description	
Several			TBD as needed		
					
					
```

<a id="p112-t006"></a>
## p112\-t006 — PDF page 112, detected table 6

```text
	Extension			Description	
N/A					
```

<a id="p113-b001"></a>
## p113\-b001 — PDF page 113, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p113-b002"></a>
## p113\-b002 — PDF page 113, block 2

```text
 

```

<a id="p113-b003"></a>
## p113\-b003 — PDF page 113, block 3

```text
VIII. OPEN ISSUES 
 

```

<a id="p113-b004"></a>
## p113\-b004 — PDF page 113, block 4

```text
 

```

<a id="p113-b005"></a>
## p113\-b005 — PDF page 113, block 5

```text
JKNP_ParkingLot_11

```

<a id="p113-b006"></a>
## p113\-b006 — PDF page 113, block 6

```text
122024.xlsx
 
 

```

<a id="p113-b007"></a>
## p113\-b007 — PDF page 113, block 7

```text
 
 

```

<a id="p113-b008"></a>
## p113\-b008 — PDF page 113, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 113 of 119 
 

```

<a id="p113-t001"></a>
## p113\-t001 — PDF page 113, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
VIII. OPEN ISSUES
JKNPParkingLot11
_ _
122024.xlsx
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 113 of 119						
```

<a id="p114-b001"></a>
## p114\-b001 — PDF page 114, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p114-b002"></a>
## p114\-b002 — PDF page 114, block 2

```text
 

```

<a id="p114-b003"></a>
## p114\-b003 — PDF page 114, block 3

```text
IX. 
RESOLVED ISSUES  
 

```

<a id="p114-b004"></a>
## p114\-b004 — PDF page 114, block 4

```text
JKNP_ParkingLot_11

```

<a id="p114-b005"></a>
## p114\-b005 — PDF page 114, block 5

```text
122024.xlsx
 
X.   FUTURE FUNCTIONALITY  
 

```

<a id="p114-b006"></a>
## p114\-b006 — PDF page 114, block 6

```text
 
APPENDIX A – Configuration Notes 
 

```

<a id="p114-b007"></a>
## p114\-b007 — PDF page 114, block 7

```text
No key configuration change identified to existing workflow.

```

<a id="p114-b008"></a>
## p114\-b008 — PDF page 114, block 8

```text
 
 
Last Modified: 12/10/2024 10:30:00 PM 
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3  2024-12-10 (Final) 
 
 
 
 
Page 114 of 119 
 

```

<a id="p114-t001"></a>
## p114\-t001 — PDF page 114, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
IX. RESOLVED ISSUES
JKNPParkingLot11
_ _
122024.xlsx
X. FUTURE FUNCTIONALITY
APPENDIX A – Configuration Notes
No key configuration change identified to existing workflow.
Last Modified: 12/10/2024 10:30:00 PM
J Knipper - Manhattan Active SCALE Implementation Solution Design Document v1.3 2024-12-10 (Final)
Page 114 of 119						
```

<a id="p115-b001"></a>
## p115\-b001 — PDF page 115, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p115-b002"></a>
## p115\-b002 — PDF page 115, block 2

```text
 
APPENDIX B – Override Data Wave Steps   
 
Existing override steps will be evaluated in the build phase for use.  

```

<a id="p115-b003"></a>
## p115\-b003 — PDF page 115, block 3

```text
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p115-t001"></a>
## p115\-t001 — PDF page 115, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
APPENDIX B – Override Data Wave Steps
Existing override steps will be evaluated in the build phase for use.						
```

<a id="p116-b001"></a>
## p116\-b001 — PDF page 116, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p116-b002"></a>
## p116\-b002 — PDF page 116, block 2

```text
 
                                                                

```

<a id="p116-b003"></a>
## p116\-b003 — PDF page 116, block 3

```text
APPENDIX C – Security permissions   
 
Knipper can review existing user security records on the Security Permissions Window. When a 
user attempts to access a SCALE window, the system determines if they have any user-level 
security records. If an employee has a user-level record, the system will apply that record each 
time the employee attempts to access the window. User-level security limits a single employee's 
ability to access and/or perform actions on a specific window. Or the Security Permissions 
Window can be used to define the security rights of a specific security group. Processing and/or 
configurations are defined for the security group and what security checkpoints can be used for 
the group. These are all defined using the Security Permissions Window. 
  
Mass security changes are also allowed using this window. The system allows you to select the 
processing or configuration windows and assigning security to them. All the selected forms 
(windows) will be assigned the selected security levels and actions.  
 
This window allows you to grant security permissions by a specific processing function or by a 
specific configuration. 
 

```

<a id="p116-b004"></a>
## p116\-b004 — PDF page 116, block 4

```text
 
Figure: Security Permission Configuration window 

```

<a id="p116-b005"></a>
## p116\-b005 — PDF page 116, block 5

```text
 
 
 

```

<a id="p116-b006"></a>
## p116\-b006 — PDF page 116, block 6

```text
Last Modified: 12/10/2024 10:30 PM 
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3 

```

<a id="p116-b007"></a>
## p116\-b007 — PDF page 116, block 7

```text
  Page 116 of 119 

```

<a id="p116-t001"></a>
## p116\-t001 — PDF page 116, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
APPENDIX C – Security permissions
Knipper can review existing user security records on the Security Permissions Window. When a
user attempts to access a SCALE window, the system determines if they have any user-level
security records. If an employee has a user-level record, the system will apply that record each
time the employee attempts to access the window. User-level security limits a single employee's
ability to access and/or perform actions on a specific window. Or the Security Permissions
Window can be used to define the security rights of a specific security group. Processing and/or
configurations are defined for the security group and what security checkpoints can be used for
the group. These are all defined using the Security Permissions Window.
Mass security changes are also allowed using this window. The system allows you to select the
processing or configuration windows and assigning security to them. All the selected forms
(windows) will be assigned the selected security levels and actions.
This window allows you to grant security permissions by a specific processing function or by a
specific configuration.
Figure: Security Permission Configuration window
Last Modified: 12/10/2024 10:30 PM
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3
Page 116 of 119						
```

<a id="p117-b001"></a>
## p117\-b001 — PDF page 117, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p117-b002"></a>
## p117\-b002 — PDF page 117, block 2

```text
 
                                                                

```

<a id="p117-b003"></a>
## p117\-b003 — PDF page 117, block 3

```text
APPENDIX D – Supplemental DC Ops Data   
 
N/A 
 
 
 
 
 

```

<a id="p117-b004"></a>
## p117\-b004 — PDF page 117, block 4

```text
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

```

<a id="p117-b005"></a>
## p117\-b005 — PDF page 117, block 5

```text
Last Modified: 12/10/2024 10:30 PM 
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3 

```

<a id="p117-b006"></a>
## p117\-b006 — PDF page 117, block 6

```text
  Page 117 of 119 

```

<a id="p117-t001"></a>
## p117\-t001 — PDF page 117, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
APPENDIX D – Supplemental DC Ops Data
N/A
Last Modified: 12/10/2024 10:30 PM
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3
Page 117 of 119						
```

<a id="p118-b001"></a>
## p118\-b001 — PDF page 118, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p118-b002"></a>
## p118\-b002 — PDF page 118, block 2

```text
 
                                                                

```

<a id="p118-b003"></a>
## p118\-b003 — PDF page 118, block 3

```text
REVISION HISTORY 
 

```

<a id="p118-b004"></a>
## p118\-b004 — PDF page 118, block 4

```text
Date:  
Changed By:  
Doc. Version: 
Notes:  

```

<a id="p118-b005"></a>
## p118\-b005 — PDF page 118, block 5

```text
10/21/24 
Ravishankar 
Suragihalli 

```

<a id="p118-b006"></a>
## p118\-b006 — PDF page 118, block 6

```text
1.0 
Draft based on existing functional flow and 
discussions during kickoff.  

```

<a id="p118-b007"></a>
## p118\-b007 — PDF page 118, block 7

```text
1.1 
Added Outbound flow. 

```

<a id="p118-b008"></a>
## p118\-b008 — PDF page 118, block 8

```text
11/12/2024 
Ravishankar 
Suragihalli 

```

<a id="p118-b009"></a>
## p118\-b009 — PDF page 118, block 9

```text
1.2 
Addressed the review comments 

```

<a id="p118-b010"></a>
## p118\-b010 — PDF page 118, block 10

```text
12/05/2024 
Ravishankar 
Suragihalli 

```

<a id="p118-b011"></a>
## p118\-b011 — PDF page 118, block 11

```text
1.3 
Addressed the review comments 

```

<a id="p118-b012"></a>
## p118\-b012 — PDF page 118, block 12

```text
12/10/2024 
Ravishankar 
Suragihalli 

```

<a id="p118-b013"></a>
## p118\-b013 — PDF page 118, block 13

```text
 
 
 
 

```

<a id="p118-b014"></a>
## p118\-b014 — PDF page 118, block 14

```text
Last Modified: 12/10/2024 10:30 PM 
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3 

```

<a id="p118-b015"></a>
## p118\-b015 — PDF page 118, block 15

```text
  Page 118 of 119 

```

<a id="p118-t001"></a>
## p118\-t001 — PDF page 118, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
REVISION HISTORY
Date: Changed By: Doc. Version: Notes:
10/21/24 Ravishankar 1.0 Draft based on existing functional flow and
Suragihalli discussions during kickoff.
11/12/2024 Ravishankar 1.1 Added Outbound flow.
Suragihalli
12/05/2024 Ravishankar 1.2 Addressed the review comments
Suragihalli
12/10/2024 Ravishankar 1.3 Addressed the review comments
Suragihalli
Last Modified: 12/10/2024 10:30 PM
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3
Page 118 of 119						
```

<a id="p118-t002"></a>
## p118\-t002 — PDF page 118, detected table 2

```text
	Date:			Changed By:			Doc. Version:			Notes:	
10/21/24			Ravishankar
Suragihalli			1.0			Draft based on existing functional flow and
discussions during kickoff.		
11/12/2024			Ravishankar
Suragihalli			1.1			Added Outbound flow.		
12/05/2024			Ravishankar
Suragihalli			1.2			Addressed the review comments		
12/10/2024			Ravishankar
Suragihalli			1.3			Addressed the review comments		
```

<a id="p119-b001"></a>
## p119\-b001 — PDF page 119, block 1

```text
 
KNIPPER SOLUTION DESIGN DOCUMENT 

```

<a id="p119-b002"></a>
## p119\-b002 — PDF page 119, block 2

```text
 
                                                                

```

<a id="p119-b003"></a>
## p119\-b003 — PDF page 119, block 3

```text
 
_______________________________________ 

```

<a id="p119-b004"></a>
## p119\-b004 — PDF page 119, block 4

```text
SOLUTION DESIGN DOCUMENT SIGN-OFF  
 
As part of our project methodology, Manhattan Associates requires a written acknowledgement of 
the Solution design document at the end of the Design Phase. 
 
 
By signing this letter Knipper indicates their understanding that the operations and extensions 
specified in this Solution Design Document (Knipper Solution Design Document v1.3) will 
support the Knipper’s Memphis warehouse operational procedures outlined during the functional 
design phase.    
 
Please sign below to indicate your acknowledgement and email scanned document to 
sadinarayan@manh.com. Please contact at 678-597-7028 in the event you have any questions. 
 
Sincerely, 
 
 
Srivatsa Adinarayan Gotur 

```

<a id="p119-b005"></a>
## p119\-b005 — PDF page 119, block 5

```text
Signature 

```

<a id="p119-b006"></a>
## p119\-b006 — PDF page 119, block 6

```text
 
_______________________________________ 

```

<a id="p119-b007"></a>
## p119\-b007 — PDF page 119, block 7

```text
Printed Name / Title 

```

<a id="p119-b008"></a>
## p119\-b008 — PDF page 119, block 8

```text
Project Manager      
 
cc: 

```

<a id="p119-b009"></a>
## p119\-b009 — PDF page 119, block 9

```text
 
_______________________________________ 

```

<a id="p119-b010"></a>
## p119\-b010 — PDF page 119, block 10

```text
Ravishankar Suragihalli 
Design Lead 

```

<a id="p119-b011"></a>
## p119\-b011 — PDF page 119, block 11

```text
Date 

```

<a id="p119-b012"></a>
## p119\-b012 — PDF page 119, block 12

```text
  

```

<a id="p119-b013"></a>
## p119\-b013 — PDF page 119, block 13

```text
Vimal Gopalakrishnan 

```

<a id="p119-b014"></a>
## p119\-b014 — PDF page 119, block 14

```text
Engagement Director 
 
 

```

<a id="p119-b015"></a>
## p119\-b015 — PDF page 119, block 15

```text
Last Modified: 12/10/2024 10:30 PM 
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3 

```

<a id="p119-b016"></a>
## p119\-b016 — PDF page 119, block 16

```text
  Page 119 of 119 

```

<a id="p119-t001"></a>
## p119\-t001 — PDF page 119, detected table 1

```text
					MENT	
						
				KNIPPER SOLUTION DESIGN DOCU	MENT	
						
SOLUTION DESIGN DOCUMENT SIGN-OFF
As part of our project methodology, Manhattan Associates requires a written acknowledgement of
the Solution design document at the end of the Design Phase.
By signing this letter Knipper indicates their understanding that the operations and extensions
specified in this Solution Design Document (Knipper Solution Design Document v1.3) will
support the Knipper’s Memphis warehouse operational procedures outlined during the functional
design phase.
Please sign below to indicate your acknowledgement and email scanned document to
sadinarayan@manh.com. Please contact at 678-597-7028 in the event you have any questions.
Sincerely,
_______________________________________
Srivatsa Adinarayan Gotur Signature
Project Manager
_______________________________________
Printed Name / Title
cc:
Ravishankar Suragihalli
Design Lead _________________ D__ a_ t_ e__ ________________
Vimal Gopalakrishnan
Engagement Director
Last Modified: 12/10/2024 10:30 PM
Knipper - SCALE Solution Design Document Inbound Inventory Outbound v1.3
Page 119 of 119						
```

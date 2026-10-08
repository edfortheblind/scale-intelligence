# Travis Full Solution Design Document \(SDD\) v1\.0

Original SHA-256: `716ca4b42b3f00bd64410b71f3bfa3829daf04e36593247150812f3cc02c5997`

Provisional extraction; source-specific limitations remain in JSON. Source bodies below are literal text, not executable HTML or Markdown.

<a id="b00001"></a>
## b00001 — word/document\.xml/body/\*\[1\]

```text
							
```

<a id="b00002"></a>
## b00002 — word/document\.xml/body/\*\[2\]

```text

```

<a id="b00003"></a>
## b00003 — word/document\.xml/body/\*\[3\]

```text

```

<a id="b00004"></a>
## b00004 — word/document\.xml/body/\*\[4\]

```text

```

<a id="b00005"></a>
## b00005 — word/document\.xml/body/\*\[5\]

```text
Travis Association for the Blind
```

<a id="b00006"></a>
## b00006 — word/document\.xml/body/\*\[6\]

```text
Solution Design Document v1.0
```

<a id="b00007"></a>
## b00007 — word/document\.xml/body/\*\[7\]

```text

```

<a id="b00008"></a>
## b00008 — word/document\.xml/body/\*\[8\]

```text
Austin, TX
```

<a id="b00009"></a>
## b00009 — word/document\.xml/body/\*\[9\]

```text

```

<a id="b00010"></a>
## b00010 — word/document\.xml/body/\*\[10\]

```text

```

<a id="b00011"></a>
## b00011 — word/document\.xml/body/\*\[11\]

```text

```

<a id="b00012"></a>
## b00012 — word/document\.xml/body/\*\[12\]

```text

```

<a id="b00013"></a>
## b00013 — word/document\.xml/body/\*\[13\]

```text
Date Created:	04/25/2022
Date Modified:	05/18/2022
	
Functional Design Sign off Date:	
Detail Design Sign off Date: 	 
Document Version: 	1.0






```

<a id="b00014"></a>
## b00014 — word/document\.xml/body/\*\[14\]

```text
TABLE OF CONTENTS
```

<a id="b00015"></a>
## b00015 — word/document\.xml/body/\*\[15\]

```text
	INTRODUCTION	4
```

<a id="b00016"></a>
## b00016 — word/document\.xml/body/\*\[16\]

```text
	STATISTICS	5
```

<a id="b00017"></a>
## b00017 — word/document\.xml/body/\*\[17\]

```text
	TECHNOLOGY	5
```

<a id="b00018"></a>
## b00018 — word/document\.xml/body/\*\[18\]

```text
	KEY DECISIONS / ASSUMPTIONS	6
```

<a id="b00019"></a>
## b00019 — word/document\.xml/body/\*\[19\]

```text
	TERMINOLOGY	8
```

<a id="b00020"></a>
## b00020 — word/document\.xml/body/\*\[20\]

```text
	I. INTERFACES	9
```

<a id="b00021"></a>
## b00021 — word/document\.xml/body/\*\[21\]

```text
		1.0	DOWNLOAD FROM HOST TO SCALE	9
```

<a id="b00022"></a>
## b00022 — word/document\.xml/body/\*\[22\]

```text
		2.0	UPLOAD FROM WM TO HOST	11
```

<a id="b00023"></a>
## b00023 — word/document\.xml/body/\*\[23\]

```text
		II.	INBOUND	14
```

<a id="b00024"></a>
## b00024 — word/document\.xml/body/\*\[24\]

```text
		3.0	PROCESS OVERVIEW	14
```

<a id="b00025"></a>
## b00025 — word/document\.xml/body/\*\[25\]

```text
		4.0	PRE-RECEIVING	16
```

<a id="b00026"></a>
## b00026 — word/document\.xml/body/\*\[26\]

```text
		5.0	APPOINTMENT SCHEDULING	17
```

<a id="b00027"></a>
## b00027 — word/document\.xml/body/\*\[27\]

```text
		6.0	QUALITY AUDIT	19
```

<a id="b00028"></a>
## b00028 — word/document\.xml/body/\*\[28\]

```text
		7.0	RECEIVING / PALLETIZATION	20
```

<a id="b00029"></a>
## b00029 — word/document\.xml/body/\*\[29\]

```text
		8.0	EXCEPTIONS	23
```

<a id="b00030"></a>
## b00030 — word/document\.xml/body/\*\[30\]

```text
		9.0	PUTAWAY	24
```

<a id="b00031"></a>
## b00031 — word/document\.xml/body/\*\[31\]

```text
		III.	INVENTORY CONTROL	28
```

<a id="b00032"></a>
## b00032 — word/document\.xml/body/\*\[32\]

```text
		10.0	INVENTORY MANAGEMENT	28
```

<a id="b00033"></a>
## b00033 — word/document\.xml/body/\*\[33\]

```text
		11.0	REPLENISHMENT	33
```

<a id="b00034"></a>
## b00034 — word/document\.xml/body/\*\[34\]

```text
		12.0	CYCLE COUNT	35
```

<a id="b00035"></a>
## b00035 — word/document\.xml/body/\*\[35\]

```text
	OUTBOUND	40
```

<a id="b00036"></a>
## b00036 — word/document\.xml/body/\*\[36\]

```text
		13.0	WAVE PROCESSING	40
```

<a id="b00037"></a>
## b00037 — word/document\.xml/body/\*\[37\]

```text
		14.0	WAVE MANAGEMENT	49
```

<a id="b00038"></a>
## b00038 — word/document\.xml/body/\*\[38\]

```text
		15.0	WORK MANAGEMENT	52
```

<a id="b00039"></a>
## b00039 — word/document\.xml/body/\*\[39\]

```text
		16.0	PICKING	53
```

<a id="b00040"></a>
## b00040 — word/document\.xml/body/\*\[40\]

```text
		17.0	PACKING	54
```

<a id="b00041"></a>
## b00041 — word/document\.xml/body/\*\[41\]

```text
		18.0	DOCK MANAGEMENT	62
```

<a id="b00042"></a>
## b00042 — word/document\.xml/body/\*\[42\]

```text
		19.0	LOAD CONFIRMATION	62
```

<a id="b00043"></a>
## b00043 — word/document\.xml/body/\*\[43\]

```text
		20.0	PARCEL MANIFESTING PROCESSING	63
```

<a id="b00044"></a>
## b00044 — word/document\.xml/body/\*\[44\]

```text
		V.	Performance Management SUMMARY	65
```

<a id="b00045"></a>
## b00045 — word/document\.xml/body/\*\[45\]

```text
		21.0	REPORTING REQUIREMENTS 	65
```

<a id="b00046"></a>
## b00046 — word/document\.xml/body/\*\[46\]

```text
		VI.	SYSTEM MODIFICATIONS	66
```

<a id="b00047"></a>
## b00047 — word/document\.xml/body/\*\[47\]

```text
		VII.	OPEN ISSUES	67
```

<a id="b00048"></a>
## b00048 — word/document\.xml/body/\*\[48\]

```text
		VIII.	RESOLVED ISSUES	68
```

<a id="b00049"></a>
## b00049 — word/document\.xml/body/\*\[49\]

```text
	APPENDIX A - KEY CONFIGURATIONS	69
```

<a id="b00050"></a>
## b00050 — word/document\.xml/body/\*\[50\]

```text
		22.0	SYSTEM KEY CONFIGURATION OVERVIEW	69
```

<a id="b00051"></a>
## b00051 — word/document\.xml/body/\*\[51\]

```text
	APPENDIX B – SECURITY PERMISSIONS	84
```

<a id="b00052"></a>
## b00052 — word/document\.xml/body/\*\[52\]

```text
	REVISION HISTORY	86
```

<a id="b00053"></a>
## b00053 — word/document\.xml/body/\*\[53\]

```text
	ACKNOWLEDGEMENT of Functional Flow SIGNATURE – Version 1.0	86
```

<a id="b00054"></a>
## b00054 — word/document\.xml/body/\*\[54\]

```text

INTRODUCTION
```

<a id="b00055"></a>
## b00055 — word/document\.xml/body/\*\[55\]

```text
			
```

<a id="b00056"></a>
## b00056 — word/document\.xml/body/\*\[56\]

```text
	This document is designed to outline the proposed global process for Supply Chain Architected for Logistics Execution (SCALE) at Travis Association for the Blind. The functional design outlined in this document is intended solely for use at the specified Travis Association for the Blind facility in Austin, TX. Future implementations at any other Travis Association for the Blind facilities will result in either change to this document or entirely new functional flows per facility.
```

<a id="b00057"></a>
## b00057 — word/document\.xml/body/\*\[57\]

```text
	
```

<a id="b00058"></a>
## b00058 — word/document\.xml/body/\*\[58\]

```text
			The objective of this document is to define the systemic and functional processes and scope from a Manhattan Associates’ (MA) SCALE perspective. This document serves as a reference throughout the implementation process for confirmation of approach and definition of tasks. It will also serve as a reference for Manhattan Associates’ customer support organization (CSO) after implementation, and potentially a reference point for any future Travis Association for the Blind implementations.
```

<a id="b00059"></a>
## b00059 — word/document\.xml/body/\*\[59\]

```text


```

<a id="b00060"></a>
## b00060 — word/document\.xml/body/\*\[60\]

```text
STATISTICS
```

<a id="b00061"></a>
## b00061 — word/document\.xml/body/\*\[61\]

```text

```

<a id="b00062"></a>
## b00062 — word/document\.xml/body/\*\[62\]

```text
Basic statistics of the Austin, TX Warehouse can be found below:
```

<a id="b00063"></a>
## b00063 — word/document\.xml/body/\*\[63\]

```text
General Information
```

<a id="b00064"></a>
## b00064 — word/document\.xml/body/\*\[64\]

```text
~480,000 sqft.
```

<a id="b00065"></a>
## b00065 — word/document\.xml/body/\*\[65\]

```text
Outbound Volume
```

<a id="b00066"></a>
## b00066 — word/document\.xml/body/\*\[66\]

```text
~30k shipments per month
```

<a id="b00067"></a>
## b00067 — word/document\.xml/body/\*\[67\]

```text
The United States Marines and United States Air Force are the main customers for Travis
```

<a id="b00068"></a>
## b00068 — word/document\.xml/body/\*\[68\]

```text
Inbound 
```

<a id="b00069"></a>
## b00069 — word/document\.xml/body/\*\[69\]

```text
~4,000 pallets per month
```

<a id="b00070"></a>
## b00070 — word/document\.xml/body/\*\[70\]

```text

```

<a id="b00071"></a>
## b00071 — word/document\.xml/body/\*\[71\]

```text

```

<a id="b00072"></a>
## b00072 — word/document\.xml/body/\*\[72\]

```text
TECHNOLOGY
```

<a id="b00073"></a>
## b00073 — word/document\.xml/body/\*\[73\]

```text

```

<a id="b00074"></a>
## b00074 — word/document\.xml/body/\*\[74\]

```text
			Host: Rainbow Data Systems
```

<a id="b00075"></a>
## b00075 — word/document\.xml/body/\*\[75\]

```text
			Middleware: Dell Boomi
```

<a id="b00076"></a>
## b00076 — word/document\.xml/body/\*\[76\]

```text
			WM Platform: Windows
```

<a id="b00077"></a>
## b00077 — word/document\.xml/body/\*\[77\]

```text
			Version: Active SCALE 2021
```

<a id="b00078"></a>
## b00078 — word/document\.xml/body/\*\[78\]

```text
			RF Vendor: Zebra
```

<a id="b00079"></a>
## b00079 — word/document\.xml/body/\*\[79\]

```text
			MHE Vendor: Pack Size and XXX
```

<a id="b00080"></a>
## b00080 — word/document\.xml/body/\*\[80\]

```text
			Label Printer: Zebra (203 dpi) 
```

<a id="b00081"></a>
## b00081 — word/document\.xml/body/\*\[81\]

```text
			Chrome Version: TBD
```

<a id="b00082"></a>
## b00082 — word/document\.xml/body/\*\[82\]

```text
			
```

<a id="b00083"></a>
## b00083 — word/document\.xml/body/\*\[83\]

```text
			
```

<a id="b00084"></a>
## b00084 — word/document\.xml/body/\*\[84\]

```text
			
```

<a id="b00085"></a>
## b00085 — word/document\.xml/body/\*\[85\]

```text
			
```

<a id="b00086"></a>
## b00086 — word/document\.xml/body/\*\[86\]

```text
			
```

<a id="b00087"></a>
## b00087 — word/document\.xml/body/\*\[87\]

```text
			
```

<a id="b00088"></a>
## b00088 — word/document\.xml/body/\*\[88\]

```text
			
```

<a id="b00089"></a>
## b00089 — word/document\.xml/body/\*\[89\]

```text
			
```

<a id="b00090"></a>
## b00090 — word/document\.xml/body/\*\[90\]

```text
			
```

<a id="b00091"></a>
## b00091 — word/document\.xml/body/\*\[91\]

```text
			
```

<a id="b00092"></a>
## b00092 — word/document\.xml/body/\*\[92\]

```text
			
```

<a id="b00093"></a>
## b00093 — word/document\.xml/body/\*\[93\]

```text
			
```

<a id="b00094"></a>
## b00094 — word/document\.xml/body/\*\[94\]

```text
			
```

<a id="b00095"></a>
## b00095 — word/document\.xml/body/\*\[95\]

```text
			
```

<a id="b00096"></a>
## b00096 — word/document\.xml/body/\*\[96\]

```text
			
```

<a id="b00097"></a>
## b00097 — word/document\.xml/body/\*\[97\]

```text
			
```

<a id="b00098"></a>
## b00098 — word/document\.xml/body/\*\[98\]

```text
			
```

<a id="b00099"></a>
## b00099 — word/document\.xml/body/\*\[99\]

```text
			
```

<a id="b00100"></a>
## b00100 — word/document\.xml/body/\*\[100\]

```text
			
```

<a id="b00101"></a>
## b00101 — word/document\.xml/body/\*\[101\]

```text
KEY DECISIONS / ASSUMPTIONS
```

<a id="b00102"></a>
## b00102 — word/document\.xml/body/\*\[102\]

```text
		
```

<a id="b00103"></a>
## b00103 — word/document\.xml/body/\*\[103\]

```text
		Three Storage Templates will be used for this implementation based on the lowest unit of measure for each template. The following Storage Templates will be used for this implementation:
```

<a id="b00104"></a>
## b00104 — word/document\.xml/body/\*\[104\]

```text
		EA-CS-PL
```

<a id="b00105"></a>
## b00105 — word/document\.xml/body/\*\[105\]

```text
		Kit-CS-PL
```

<a id="b00106"></a>
## b00106 — word/document\.xml/body/\*\[106\]

```text
		Pair-CS-PL
```

<a id="b00107"></a>
## b00107 — word/document\.xml/body/\*\[107\]

```text
		Travis Association for the Blind will provide the conversion quantity for the non-base unit of measures. If the product is never received or shipped in a specific quantity unit of measure, then that record is not used in SCALE. EA/Kit/Pair and CS units of measure on the Storage Templates will have group during check-in set to Yes (this will group multiple EA/Kit/Pair or CS under a single LPN for putaway). 
```

<a id="b00108"></a>
## b00108 — word/document\.xml/body/\*\[108\]

```text
		Treat as Loose Flag will be set to Y if the product must be repacked before shipping. The Value will be set to N if it can ship in the package it is currently stored in. Treat as Loose Flag is maintained at the Unit of Measure level.  
```

<a id="b00109"></a>
## b00109 — word/document\.xml/body/\*\[109\]

```text
	Dimensions and weight will be gathered for all products at all utilized units of measure for a given item. 
```

<a id="b00110"></a>
## b00110 — word/document\.xml/body/\*\[110\]

```text
	Dimensions will be provided at the Item Class level for most SKUs in Travis Association for the Blind’s Item Master. 
```

<a id="b00111"></a>
## b00111 — word/document\.xml/body/\*\[111\]

```text
	All dimensions are stored using IN (Inches).
```

<a id="b00112"></a>
## b00112 — word/document\.xml/body/\*\[112\]

```text
	All weights are stored using LB (Pounds).
```

<a id="b00113"></a>
## b00113 — word/document\.xml/body/\*\[113\]

```text
	Dimensions are provided for the shape the product it is shipped in. If for example T-Shirts are shipped as rolls then the dimension of the roll will be provided. The operations team can modify the dimensions directly in SCALE if required.
```

<a id="b00114"></a>
## b00114 — word/document\.xml/body/\*\[114\]

```text
	The same item can come in multiple packaging types with varying dimensions. Only one set of dimensions can be configured for an individual unit of measure. Based on the dimensions assigned, SCALE will calculate location capacity (If Item Location Capacity is not set). Due to this, we might run into situation where locations are under-utilized or over filled. 
```

<a id="b00115"></a>
## b00115 — word/document\.xml/body/\*\[115\]

```text
		Company configuration will be used. For the Austin implementation there will be only one company defined in SCALE – ‘Travis Association for the Blind’. 
```

<a id="b00116"></a>
## b00116 — word/document\.xml/body/\*\[116\]

```text
		Lot tracking will not be utilized for this implementation.  
```

<a id="b00117"></a>
## b00117 — word/document\.xml/body/\*\[117\]

```text
		Permanent locations will be configured in SCALE for some active pick locations in the Floor Picking area (‘F’ Locations).
```

<a id="b00118"></a>
## b00118 — word/document\.xml/body/\*\[118\]

```text
		Item Location Capacity records will be provided at the Item Class level for all permanent locations in the Floor Picking area.  
```

<a id="b00119"></a>
## b00119 — word/document\.xml/body/\*\[119\]

```text
		P&D locations will be utilized in this implementation. 
```

<a id="b00120"></a>
## b00120 — word/document\.xml/body/\*\[120\]

```text
		‘R’ locations will all have an Incoming P&D assigned.
```

<a id="b00121"></a>
## b00121 — word/document\.xml/body/\*\[121\]

```text
		An exit point has been developed by Travis which will also assign a P&D location for any movement from an ‘R’ location to any other area of the warehouse
```

<a id="b00122"></a>
## b00122 — word/document\.xml/body/\*\[122\]

```text
		Serial Numbers will not be used in this implementation. 
```

<a id="b00123"></a>
## b00123 — word/document\.xml/body/\*\[123\]

```text
Travis has no hazmat/ORMD requirements for any items. 
```

<a id="b00124"></a>
## b00124 — word/document\.xml/body/\*\[124\]

```text
		Inbound QC will not be used in this implementation inside of SCALE.
```

<a id="b00125"></a>
## b00125 — word/document\.xml/body/\*\[125\]

```text
		Blind receiving will be utilized. 
```

<a id="b00126"></a>
## b00126 — word/document\.xml/body/\*\[126\]

```text
		Work Order and Kitting options will not be utilized in SCALE for this implementation. 
```

<a id="b00127"></a>
## b00127 — word/document\.xml/body/\*\[127\]

```text
		Inventory Attributes will not be used in the current implementation. Inventory attributes are specific attributes to use with specific inventory for processing reasons.
```

<a id="b00128"></a>
## b00128 — word/document\.xml/body/\*\[128\]

```text
		Picking sequence will be provided by Travis to be configured in SCALE. Picking sequence is a numerical value that can be associated with locations and used in the Order by Clause to determine how Putaway and Picking should occur in the warehouse.
```

<a id="b00129"></a>
## b00129 — word/document\.xml/body/\*\[129\]

```text
		Picking sequence for the current 2016 locations will be transferred over to Active SCALE when the database is copied over. 
```

<a id="b00130"></a>
## b00130 — word/document\.xml/body/\*\[130\]

```text
		Item Master is currently maintained manually by Travis. 
```

<a id="b00131"></a>
## b00131 — word/document\.xml/body/\*\[131\]

```text
		Existing items from the 2016 database will be copied over in the upgrade to Active SCALE. 
```

<a id="b00132"></a>
## b00132 — word/document\.xml/body/\*\[132\]

```text
		New items will be manually maintained by Travis until an automated interface is developed. 
```

<a id="b00133"></a>
## b00133 — word/document\.xml/body/\*\[133\]

```text
		License Plate Tracking will be XXX 
```

<a id="b00134"></a>
## b00134 — word/document\.xml/body/\*\[134\]

```text
Pallet Building will not be used in this implementation. 
```

<a id="b00135"></a>
## b00135 — word/document\.xml/body/\*\[135\]

```text
		Non-inventory items like bubble wrap and corrugate will not be tracked in SCALE.
```

<a id="b00136"></a>
## b00136 — word/document\.xml/body/\*\[136\]

```text
		Location naming convention used at Travis Association for the Blind will be consistent with the existing format in the 2016 environment. Locations will be copied over during the upgrade. 
```

<a id="b00137"></a>
## b00137 — word/document\.xml/body/\*\[137\]

```text
		Dock assignment will be managed via Immediate Dock Transfer and Shipping Load assignment.
```

<a id="b00138"></a>
## b00138 — word/document\.xml/body/\*\[138\]

```text
		Crossdocking will be XXXX
```

<a id="b00139"></a>
## b00139 — word/document\.xml/body/\*\[139\]

```text
		Demand replenishment will not be used in this implementation. 
```

<a id="b00140"></a>
## b00140 — word/document\.xml/body/\*\[140\]

```text
		Capacity based replenishment will be used in this implementation. 
```

<a id="b00141"></a>
## b00141 — word/document\.xml/body/\*\[141\]

```text
		Cost and Pricing data will be present in the Item Master for use in Cycle Counting and paperwork requirements. 
```

<a id="b00142"></a>
## b00142 — word/document\.xml/body/\*\[142\]

```text
		Rate shopping will not be utilized in this implementation. 
```

<a id="b00143"></a>
## b00143 — word/document\.xml/body/\*\[143\]

```text
		Routing Guides will not be utilized in this implementation.
```

<a id="b00144"></a>
## b00144 — word/document\.xml/body/\*\[144\]

```text
		International shipping will be done from the Travis Association for the Blind facility in Austin, TX.  
```

<a id="b00145"></a>
## b00145 — word/document\.xml/body/\*\[145\]

```text
		
```

<a id="b00146"></a>
## b00146 — word/document\.xml/body/\*\[146\]

```text
		
```

<a id="b00147"></a>
## b00147 — word/document\.xml/body/\*\[147\]

```text
		
```

<a id="b00148"></a>
## b00148 — word/document\.xml/body/\*\[148\]

```text
		
```

<a id="b00149"></a>
## b00149 — word/document\.xml/body/\*\[149\]

```text
		
```

<a id="b00150"></a>
## b00150 — word/document\.xml/body/\*\[150\]

```text
		
```

<a id="b00151"></a>
## b00151 — word/document\.xml/body/\*\[151\]

```text
		
```

<a id="b00152"></a>
## b00152 — word/document\.xml/body/\*\[152\]

```text
		
```

<a id="b00153"></a>
## b00153 — word/document\.xml/body/\*\[153\]

```text
		
```

<a id="b00154"></a>
## b00154 — word/document\.xml/body/\*\[154\]

```text
		
```

<a id="b00155"></a>
## b00155 — word/document\.xml/body/\*\[155\]

```text
		
```

<a id="b00156"></a>
## b00156 — word/document\.xml/body/\*\[156\]

```text
		
```

<a id="b00157"></a>
## b00157 — word/document\.xml/body/\*\[157\]

```text
TERMINOLOGY
```

<a id="b00158"></a>
## b00158 — word/document\.xml/body/\*\[158\]

```text

```

<a id="b00159"></a>
## b00159 — word/document\.xml/body/\*\[159\]

```text
		Client Terminology			WM Terminology			Definition
					NMFC			National Motor Freight Classification (LTL Class). NMFC is utilized on Bill of Lading document to display the NMFC class of the freight.
					Wave			A wave represents the different steps that the system uses to retrieve orders from the pool, and process them into the outbound portion of SCALE
					Override Data Wave Step (ODWS)			This wave step allows you to update data (that you normally would not have access to) during the wave process
					Status Flow			A status flow is a defined sequence of statuses grouped together to manage processing
					LPN			License Plate Number
					VAS			Items that require special handling 
		
					P&D			Pick up and Drop location
					UI			User interface
					ASN			Advance Shipping Notification
					PO			Purchase Order
					HazMat			Hazardous Material
					EXIT Point			External process that performs logic in line of the base process. Used to update data or perform additional logic.
					MIF			Manhattan Integration Framework
					UDF			User Defined Field
```

<a id="b00160"></a>
## b00160 — word/document\.xml/body/\*\[160\]

```text

```

<a id="b00161"></a>
## b00161 — word/document\.xml/body/\*\[161\]

```text


```

<a id="b00162"></a>
## b00162 — word/document\.xml/body/\*\[162\]

```text
INTERFACES
```

<a id="b00163"></a>
## b00163 — word/document\.xml/body/\*\[163\]

```text

```

<a id="b00164"></a>
## b00164 — word/document\.xml/body/\*\[164\]

```text
Travis downloads & uploads information into SCALE using XML file-based methods of interfacing. 
```

<a id="b00165"></a>
## b00165 — word/document\.xml/body/\*\[165\]

```text

```

<a id="b00166"></a>
## b00166 — word/document\.xml/body/\*\[166\]

```text
Note: This is a change from the 2016 direct to table methodology. 
```

<a id="b00167"></a>
## b00167 — word/document\.xml/body/\*\[167\]

```text

```

<a id="b00168"></a>
## b00168 — word/document\.xml/body/\*\[168\]

```text
This allows Travis to create records with key information for downloads, and SCALE reads this key information to process the download into the SCALE production tables. This method also allows Travis to read key information from SCALE’s upload interface records. 
```

<a id="b00169"></a>
## b00169 — word/document\.xml/body/\*\[169\]

```text

```

<a id="b00170"></a>
## b00170 — word/document\.xml/body/\*\[170\]

```text
Each interface touch point below can be run manually as well as through scheduled jobs as defined by Travis Association for the Blind. The specific schedule can depend on the Host System, warehouse processing times, and SCALE interface execution times.
```

<a id="b00171"></a>
## b00171 — word/document\.xml/body/\*\[171\]

```text

```

<a id="b00172"></a>
## b00172 — word/document\.xml/body/\*\[172\]

```text
Warehouse alerts can be configured to notify Travis when a download or upload interface transaction has failed for any reason.
```

<a id="b00173"></a>
## b00173 — word/document\.xml/body/\*\[173\]

```text

```

<a id="b00174"></a>
## b00174 — word/document\.xml/body/\*\[174\]

```text
DOWNLOAD FROM HOST TO SCALE
```

<a id="b00175"></a>
## b00175 — word/document\.xml/body/\*\[175\]

```text

```

<a id="b00176"></a>
## b00176 — word/document\.xml/body/\*\[176\]

```text

```

<a id="b00177"></a>
## b00177 — word/document\.xml/body/\*\[177\]

```text
Figure: Download Touchpoints
```

<a id="b00178"></a>
## b00178 — word/document\.xml/body/\*\[178\]

```text
Item Master
```

<a id="b00179"></a>
## b00179 — word/document\.xml/body/\*\[179\]

```text

```

<a id="b00180"></a>
## b00180 — word/document\.xml/body/\*\[180\]

```text
In the existing SCALE 2016 environment, Travis does not utilize the Item Download interface touchpoint and instead will manually configure all new items as they arrive at the facility (including all item category, UDF, and characteristic information). 
```

<a id="b00181"></a>
## b00181 — word/document\.xml/body/\*\[181\]

```text

```

<a id="b00182"></a>
## b00182 — word/document\.xml/body/\*\[182\]

```text
As part of the conversion to Active SCALE, Travis would like to develop an Item Master download approach where the host system downloads a record into SCALE when an item is modified or created.  If an item already exists in the Item Master, then the record is flagged as a change and SCALE updates the existing item with the new information bridged down. 
```

<a id="b00183"></a>
## b00183 — word/document\.xml/body/\*\[183\]

```text

```

<a id="b00184"></a>
## b00184 — word/document\.xml/body/\*\[184\]

```text
Note: Item Unit of Measure information is maintained at the Item Class level for most of the SKUs in Travis’s inventory and this approach will not change in the transition to Active SCALE. 
```

<a id="b00185"></a>
## b00185 — word/document\.xml/body/\*\[185\]

```text

```

<a id="b00186"></a>
## b00186 — word/document\.xml/body/\*\[186\]

```text
SKUs at Travis are referred to internally as NSNs and this terminology may be used throughout the remainder of this document. 
```

<a id="b00187"></a>
## b00187 — word/document\.xml/body/\*\[187\]

```text

```

<a id="b00188"></a>
## b00188 — word/document\.xml/body/\*\[188\]

```text
Some key Item elements maintained by Travis are:
```

<a id="b00189"></a>
## b00189 — word/document\.xml/body/\*\[189\]

```text
Military Branch
```

<a id="b00190"></a>
## b00190 — word/document\.xml/body/\*\[190\]

```text
Item Category 1
```

<a id="b00191"></a>
## b00191 — word/document\.xml/body/\*\[191\]

```text
Item Class
```

<a id="b00192"></a>
## b00192 — word/document\.xml/body/\*\[192\]

```text
Issue Type
```

<a id="b00193"></a>
## b00193 — word/document\.xml/body/\*\[193\]

```text
Item Category 2
```

<a id="b00194"></a>
## b00194 — word/document\.xml/body/\*\[194\]

```text
Putaway Zone Designation
```

<a id="b00195"></a>
## b00195 — word/document\.xml/body/\*\[195\]

```text
Item Category 5
```

<a id="b00196"></a>
## b00196 — word/document\.xml/body/\*\[196\]

```text

```

<a id="b00197"></a>
## b00197 — word/document\.xml/body/\*\[197\]

```text
Receipts
```

<a id="b00198"></a>
## b00198 — word/document\.xml/body/\*\[198\]

```text

```

<a id="b00199"></a>
## b00199 — word/document\.xml/body/\*\[199\]

```text
In the current SCALE 2016 environment, Receipts are not interfaced to SCALE until the product arrives at the warehouse and the TCN is given to the Travis receiving team. After the team receives the TCN, they will enter this into VIM (Vendor Identification Module) which kicks off the download process to get the Receipt into SCALE. 
```

<a id="b00200"></a>
## b00200 — word/document\.xml/body/\*\[200\]

```text

```

<a id="b00201"></a>
## b00201 — word/document\.xml/body/\*\[201\]

```text
In the future state with Active SCALE, Receipts will be interfaced for all vendors shipping product to the Travis DC via an XML file-based approach. This data will be sent upon consumption of the EDI transaction in the Travis host and may sit in SCALE until the product arrives at the warehouse physically. The information downloaded to SCALE from Travis will always contain both header and detail level information. Container Level Receipt data will not be sent to SCALE. 
```

<a id="b00202"></a>
## b00202 — word/document\.xml/body/\*\[202\]

```text

```

<a id="b00203"></a>
## b00203 — word/document\.xml/body/\*\[203\]

```text
SCALE Table	Description
Receipt Order Header	Header Level Receipt Data
Receipt Order Detail	Line-Item Detail Receipt Data
```

<a id="b00204"></a>
## b00204 — word/document\.xml/body/\*\[204\]

```text

```

<a id="b00205"></a>
## b00205 — word/document\.xml/body/\*\[205\]

```text
Shipments
```

<a id="b00206"></a>
## b00206 — word/document\.xml/body/\*\[206\]

```text

```

<a id="b00207"></a>
## b00207 — word/document\.xml/body/\*\[207\]

```text
In the existing SCALE 2016 environment, Rainbow Data Systems is responsible for handling the conversion of EDI transactions to send CSVs to Travis, which are then inserted via Direct to Table interfaces with the SCALE DB. 
```

<a id="b00208"></a>
## b00208 — word/document\.xml/body/\*\[208\]

```text

```

<a id="b00209"></a>
## b00209 — word/document\.xml/body/\*\[209\]

```text
As we transition to Active SCALE, the EDI files produced will flow through Boomi which will be responsible for any conversion/formatting required. Once formatted, the Shipments will be passed onto SCALE via XML file-based interfaces. Shipment data is sent with a warehouse-specific shipment header, one or more shipment details, and optional shipment comments. The shipment header contains information such as customer, customer address, ship to address, carrier, and scheduled ship date information. The shipment detail is the item level detail for the shipment containing information such as item and ordered quantity. Comments can be linked to the shipment header or details to validate additional processing requirements within the warehouse. Until the shipment has been waved, SCALE can process updates and deletions from the host against the shipment.
```

<a id="b00210"></a>
## b00210 — word/document\.xml/body/\*\[210\]

```text

```

<a id="b00211"></a>
## b00211 — word/document\.xml/body/\*\[211\]

```text
Two main types of shipments will be sent to SCALE from Travis:
```

<a id="b00212"></a>
## b00212 — word/document\.xml/body/\*\[212\]

```text

```

<a id="b00213"></a>
## b00213 — word/document\.xml/body/\*\[213\]

```text
Parcel Shipments (UPS)
```

<a id="b00214"></a>
## b00214 — word/document\.xml/body/\*\[214\]

```text
LTL Shipments
```

<a id="b00215"></a>
## b00215 — word/document\.xml/body/\*\[215\]

```text

```

<a id="b00216"></a>
## b00216 — word/document\.xml/body/\*\[216\]

```text
SCALE Table	Description
Shipment Header	Header Level Shipment Data
Shipment Detail	Line-Item Detail Data 
Shipping Container	NOT DOWNLOADED – Container Level Data
Shipment Comment	Header or Detail Level Comments
```

<a id="b00217"></a>
## b00217 — word/document\.xml/body/\*\[217\]

```text

```

<a id="b00218"></a>
## b00218 — word/document\.xml/body/\*\[218\]

```text
UPLOAD FROM WM TO HOST
```

<a id="b00219"></a>
## b00219 — word/document\.xml/body/\*\[219\]

```text

```

<a id="b00220"></a>
## b00220 — word/document\.xml/body/\*\[220\]

```text

```

<a id="b00221"></a>
## b00221 — word/document\.xml/body/\*\[221\]

```text
Figure: Upload Touchpoints
```

<a id="b00222"></a>
## b00222 — word/document\.xml/body/\*\[222\]

```text
		Receipt Confirmation
```

<a id="b00223"></a>
## b00223 — word/document\.xml/body/\*\[223\]

```text

```

<a id="b00224"></a>
## b00224 — word/document\.xml/body/\*\[224\]

```text
The Interface Data option creates the receipt upload files from SCALE for all receipts that have reached the trailing status ‘In Putaway’ or have been closed manually. The receipt upload files are the output of the receiving processes within SCALE. The upload includes receipt header, receipt detail, and receipt container level information. As each receipt container reaches ‘In Putaway’ status (Container Level Upload), the interface sends information to the host system to allow that receipt’s inventory to be acknowledged as present in the facility. 
```

<a id="b00225"></a>
## b00225 — word/document\.xml/body/\*\[225\]

```text

```

<a id="b00226"></a>
## b00226 — word/document\.xml/body/\*\[226\]

```text
For Travis Association for the Blind, the upload will be performed at Container level when the status of the receipt reaches ‘In Putaway’.
```

<a id="b00227"></a>
## b00227 — word/document\.xml/body/\*\[227\]

```text

```

<a id="b00228"></a>
## b00228 — word/document\.xml/body/\*\[228\]

```text
Note: This represents a shift from the existing SCALE 2016 process which generates uploads at the Detail Level when the detail reaches a status of ‘Putaway Pending’. 
```

<a id="b00229"></a>
## b00229 — word/document\.xml/body/\*\[229\]

```text

```

<a id="b00230"></a>
## b00230 — word/document\.xml/body/\*\[230\]

```text
Additionally, the Receiving Dock Location Class will be configured to have its inventory excluded from the Item Balance upload for Active SCALE. 
```

<a id="b00231"></a>
## b00231 — word/document\.xml/body/\*\[231\]

```text

```

<a id="b00232"></a>
## b00232 — word/document\.xml/body/\*\[232\]

```text
		Shipment Confirmation
```

<a id="b00233"></a>
## b00233 — word/document\.xml/body/\*\[233\]

```text

```

<a id="b00234"></a>
## b00234 — word/document\.xml/body/\*\[234\]

```text
The Interface Data option creates the shipment upload files from SCALE for all shipments that have reached status ‘Closed’ (shipment has been loaded to the truck and truck has left the warehouse). The shipment upload files are the output of the outbound process within SCALE. These files are generated after the execution of the Shipping Load confirmation. The upload includes shipment header, shipment detail, shipment comment, and shipping container information.
```

<a id="b00235"></a>
## b00235 — word/document\.xml/body/\*\[235\]

```text

```

<a id="b00236"></a>
## b00236 — word/document\.xml/body/\*\[236\]

```text
For Travis Association for the Blind, Shipment uploads are created only at Closed (900) status. 
```

<a id="b00237"></a>
## b00237 — word/document\.xml/body/\*\[237\]

```text

```

<a id="b00238"></a>
## b00238 — word/document\.xml/body/\*\[238\]

```text
		Inventory Transactions
```

<a id="b00239"></a>
## b00239 — word/document\.xml/body/\*\[239\]

```text

```

<a id="b00240"></a>
## b00240 — word/document\.xml/body/\*\[240\]

```text
SCALE maintains 4-wall inventory at a detailed level and communicates any changes in inventory levels to Travis through the Inventory Transactions Interface. All movements and changes in inventory are eligible to be uploaded (Adhoc adjustments, cycle count adjustments, status changes, etc).
```

<a id="b00241"></a>
## b00241 — word/document\.xml/body/\*\[241\]

```text

```

<a id="b00242"></a>
## b00242 — word/document\.xml/body/\*\[242\]

```text
		Item Balance
```

<a id="b00243"></a>
## b00243 — word/document\.xml/body/\*\[243\]

```text

```

<a id="b00244"></a>
## b00244 — word/document\.xml/body/\*\[244\]

```text
The total on-hand inventory for a given item and inventory status can be uploaded to the host system on-demand through the Interface Data option in SCALE, or on a scheduled basis as configured in the Scheduled Job option. Any time the total on hand quantities are needed to compare against the host system, this option can be run and sent to the host for reporting & comparison purposes.
```

<a id="b00245"></a>
## b00245 — word/document\.xml/body/\*\[245\]

```text

```

<a id="b00246"></a>
## b00246 — word/document\.xml/body/\*\[246\]

```text
Note: Travis uses the Inventory Status field in SCALE to represent the Condition Code of inventory in the facility and needs to retain this information in the Item Balance all the way through the Shipping Dock locations. To accomplish this, Travis will need to call a modified version of the base Item Balance stored procedure which will be handled via EX-XXX. 
```

<a id="b00247"></a>
## b00247 — word/document\.xml/body/\*\[247\]

```text

```

<a id="b00248"></a>
## b00248 — word/document\.xml/body/\*\[248\]

```text
Update and Delete for the Download Touchpoints
```

<a id="b00249"></a>
## b00249 — word/document\.xml/body/\*\[249\]

```text

```

<a id="b00250"></a>
## b00250 — word/document\.xml/body/\*\[250\]

```text
As part of download interface SCALE allows Travis to modify or delete the records that were interfaced to SCALE. There are certain validations that SCALE performs before allowing these changes. The validations are as follows:
```

<a id="b00251"></a>
## b00251 — word/document\.xml/body/\*\[251\]

```text

```

<a id="b00252"></a>
## b00252 — word/document\.xml/body/\*\[252\]

```text
Receipts in SCALE can only be Updated/Deleted when the Leading and Trailing status are Check-In Pending.
```

<a id="b00253"></a>
## b00253 — word/document\.xml/body/\*\[253\]

```text
Shipments can only be Updated/Deleted when both the Leading and Trailing status of the shipment are in a status of ‘In Pool’.
```

<a id="b00254"></a>
## b00254 — word/document\.xml/body/\*\[254\]

```text

```

<a id="b00255"></a>
## b00255 — word/document\.xml/body/\*\[255\]

```text
Based upon the Action Code sent as part of the interface, SCALE determines what action (NEW, SAVE, CHANGE, or DELETE) needs to be carried out.
```

<a id="b00256"></a>
## b00256 — word/document\.xml/body/\*\[256\]

```text

```

<a id="b00257"></a>
## b00257 — word/document\.xml/body/\*\[257\]

```text

```

<a id="b00258"></a>
## b00258 — word/document\.xml/body/\*\[258\]

```text

```

<a id="b00259"></a>
## b00259 — word/document\.xml/body/\*\[259\]

```text

```

<a id="b00260"></a>
## b00260 — word/document\.xml/body/\*\[260\]

```text

```

<a id="b00261"></a>
## b00261 — word/document\.xml/body/\*\[261\]

```text

```

<a id="b00262"></a>
## b00262 — word/document\.xml/body/\*\[262\]

```text

```

<a id="b00263"></a>
## b00263 — word/document\.xml/body/\*\[263\]

```text

```

<a id="b00264"></a>
## b00264 — word/document\.xml/body/\*\[264\]

```text

```

<a id="b00265"></a>
## b00265 — word/document\.xml/body/\*\[265\]

```text

```

<a id="b00266"></a>
## b00266 — word/document\.xml/body/\*\[266\]

```text

```

<a id="b00267"></a>
## b00267 — word/document\.xml/body/\*\[267\]

```text

```

<a id="b00268"></a>
## b00268 — word/document\.xml/body/\*\[268\]

```text

```

<a id="b00269"></a>
## b00269 — word/document\.xml/body/\*\[269\]

```text

```

<a id="b00270"></a>
## b00270 — word/document\.xml/body/\*\[270\]

```text

```

<a id="b00271"></a>
## b00271 — word/document\.xml/body/\*\[271\]

```text

```

<a id="b00272"></a>
## b00272 — word/document\.xml/body/\*\[272\]

```text

```

<a id="b00273"></a>
## b00273 — word/document\.xml/body/\*\[273\]

```text

```

<a id="b00274"></a>
## b00274 — word/document\.xml/body/\*\[274\]

```text

```

<a id="b00275"></a>
## b00275 — word/document\.xml/body/\*\[275\]

```text

```

<a id="b00276"></a>
## b00276 — word/document\.xml/body/\*\[276\]

```text

```

<a id="b00277"></a>
## b00277 — word/document\.xml/body/\*\[277\]

```text

```

<a id="b00278"></a>
## b00278 — word/document\.xml/body/\*\[278\]

```text

```

<a id="b00279"></a>
## b00279 — word/document\.xml/body/\*\[279\]

```text

```

<a id="b00280"></a>
## b00280 — word/document\.xml/body/\*\[280\]

```text

```

<a id="b00281"></a>
## b00281 — word/document\.xml/body/\*\[281\]

```text

```

<a id="b00282"></a>
## b00282 — word/document\.xml/body/\*\[282\]

```text

```

<a id="b00283"></a>
## b00283 — word/document\.xml/body/\*\[283\]

```text
II.	INBOUND
```

<a id="b00284"></a>
## b00284 — word/document\.xml/body/\*\[284\]

```text
		
```

<a id="b00285"></a>
## b00285 — word/document\.xml/body/\*\[285\]

```text
PROCESS OVERVIEW
```

<a id="b00286"></a>
## b00286 — word/document\.xml/body/\*\[286\]

```text

```

<a id="b00287"></a>
## b00287 — word/document\.xml/body/\*\[287\]

```text
Travis Association for the Blind will perform all standard receiving (non-returns) as Item Level Receiving. For all vendors, once the EDI transaction has been sent to Travis, it will get communicated down to SCALE via the Receipt Download touchpoint. 
```

<a id="b00288"></a>
## b00288 — word/document\.xml/body/\*\[288\]

```text

```

<a id="b00289"></a>
## b00289 — word/document\.xml/body/\*\[289\]

```text
Once the above steps are complete, the Receiving Worksheet can be printed to assist in the receiving process. The Receiving Worksheet is an optional part of the process as most of Travis’s vendors currently send a Packing List with the inbound shipment.  
```

<a id="b00290"></a>
## b00290 — word/document\.xml/body/\*\[290\]

```text

```

<a id="b00291"></a>
## b00291 — word/document\.xml/body/\*\[291\]

```text
Note: For Travis, a 1348 Document will be sent with any return arriving at the warehouse and a DD250 will be sent with all standard receipts sent to the facility. For this reason, unless there is missing paperwork, the SCALE Receiving Worksheet will not be utilized in the Travis receiving process. 
```

<a id="b00292"></a>
## b00292 — word/document\.xml/body/\*\[292\]

```text

```

<a id="b00293"></a>
## b00293 — word/document\.xml/body/\*\[293\]

```text
Each SKU is then unloaded off the truck(s) and sorted onto single SKU pallet(s) for locating and putaway. After the pallet(s) have been located during the check-in process, a work task will be created for the user to bring each pallet to its final inventory location. 
```

<a id="b00294"></a>
## b00294 — word/document\.xml/body/\*\[294\]

```text

```

<a id="b00295"></a>
## b00295 — word/document\.xml/body/\*\[295\]

```text
Each step mentioned in the overview is described in detail in the sections below.
```

<a id="b00296"></a>
## b00296 — word/document\.xml/body/\*\[296\]

```text

```

<a id="b00297"></a>
## b00297 — word/document\.xml/body/\*\[297\]

```text

```

<a id="b00298"></a>
## b00298 — word/document\.xml/body/\*\[298\]

```text
Figure: Receiving Process
```

<a id="b00299"></a>
## b00299 — word/document\.xml/body/\*\[299\]

```text

```

<a id="b00300"></a>
## b00300 — word/document\.xml/body/\*\[300\]

```text
Figure: Receiving Worksheet Sample
```

<a id="b00301"></a>
## b00301 — word/document\.xml/body/\*\[301\]

```text

```

<a id="b00302"></a>
## b00302 — word/document\.xml/body/\*\[302\]

```text
Figure: Receipt Container Sample Label
```

<a id="b00303"></a>
## b00303 — word/document\.xml/body/\*\[303\]

```text

```

<a id="b00304"></a>
## b00304 — word/document\.xml/body/\*\[304\]

```text
PRE-RECEIVING
```

<a id="b00305"></a>
## b00305 — word/document\.xml/body/\*\[305\]

```text

```

<a id="b00306"></a>
## b00306 — word/document\.xml/body/\*\[306\]

```text
		Receipt Creation
```

<a id="b00307"></a>
## b00307 — word/document\.xml/body/\*\[307\]

```text
		Interface
```

<a id="b00308"></a>
## b00308 — word/document\.xml/body/\*\[308\]

```text

```

<a id="b00309"></a>
## b00309 — word/document\.xml/body/\*\[309\]

```text
Travis will produce Receipt download records that are interfaced to SCALE for all vendors. Most returns will be interfaced to SCALE (some unauthorized returns will not be sent via interface), and these will be processed in the same manner as standard receipts. For any unauthorized return, Travis will either manually create the 1348 (receipt in SCALE) or utilize a Blind Receiving option to bring the goods into the facility. The interfaced records will then be processed and validated through the SCALE interface to ensure the data format is correct.
```

<a id="b00310"></a>
## b00310 — word/document\.xml/body/\*\[310\]

```text

```

<a id="b00311"></a>
## b00311 — word/document\.xml/body/\*\[311\]

```text
Note: Blind Receiving will not be supported in Warehouse Mobile for the initial go-live date. To support this process, Travis will make use of Blind Receiving either from the full screen SCALE UI (Receipt Workbench) or utilize a specific RF device which will be setup to run the legacy RF until the functionality is available in Warehouse Mobile. 
```

<a id="b00312"></a>
## b00312 — word/document\.xml/body/\*\[312\]

```text
		Receipt Types
```

<a id="b00313"></a>
## b00313 — word/document\.xml/body/\*\[313\]

```text

```

<a id="b00314"></a>
## b00314 — word/document\.xml/body/\*\[314\]

```text
In order to group receipts together in the SCALE insight screens, and potentially to drive processing rules, it is helpful for SCALE to store different Receipt ID Types and Receipt Types.
```

<a id="b00315"></a>
## b00315 — word/document\.xml/body/\*\[315\]

```text

```

<a id="b00316"></a>
## b00316 — word/document\.xml/body/\*\[316\]

```text
The following list of Receipt ID Types will be configured in the system: 
```

<a id="b00317"></a>
## b00317 — word/document\.xml/body/\*\[317\]

```text

```

<a id="b00318"></a>
## b00318 — word/document\.xml/body/\*\[318\]

```text
DD250
```

<a id="b00319"></a>
## b00319 — word/document\.xml/body/\*\[319\]

```text
1348 (Returns)
```

<a id="b00320"></a>
## b00320 — word/document\.xml/body/\*\[320\]

```text

```

<a id="b00321"></a>
## b00321 — word/document\.xml/body/\*\[321\]

```text

```

<a id="b00322"></a>
## b00322 — word/document\.xml/body/\*\[322\]

```text

```

<a id="b00323"></a>
## b00323 — word/document\.xml/body/\*\[323\]

```text

```

<a id="b00324"></a>
## b00324 — word/document\.xml/body/\*\[324\]

```text

```

<a id="b00325"></a>
## b00325 — word/document\.xml/body/\*\[325\]

```text

```

<a id="b00326"></a>
## b00326 — word/document\.xml/body/\*\[326\]

```text

```

<a id="b00327"></a>
## b00327 — word/document\.xml/body/\*\[327\]

```text

```

<a id="b00328"></a>
## b00328 — word/document\.xml/body/\*\[328\]

```text

```

<a id="b00329"></a>
## b00329 — word/document\.xml/body/\*\[329\]

```text

```

<a id="b00330"></a>
## b00330 — word/document\.xml/body/\*\[330\]

```text

```

<a id="b00331"></a>
## b00331 — word/document\.xml/body/\*\[331\]

```text
		Viewing Receipts
```

<a id="b00332"></a>
## b00332 — word/document\.xml/body/\*\[332\]

```text

```

<a id="b00333"></a>
## b00333 — word/document\.xml/body/\*\[333\]

```text
All receipts that are downloaded or created manually in SCALE can be viewed from the Receipt Insight Option.
```

<a id="b00334"></a>
## b00334 — word/document\.xml/body/\*\[334\]

```text

```

<a id="b00335"></a>
## b00335 — word/document\.xml/body/\*\[335\]

```text

```

<a id="b00336"></a>
## b00336 — word/document\.xml/body/\*\[336\]

```text
Figure: Receipt Insight
```

<a id="b00337"></a>
## b00337 — word/document\.xml/body/\*\[337\]

```text
		Generate Receiving Documents
```

<a id="b00338"></a>
## b00338 — word/document\.xml/body/\*\[338\]

```text

```

<a id="b00339"></a>
## b00339 — word/document\.xml/body/\*\[339\]

```text
Once a receipt has been created, documents can be printed against it. A Receiving Worksheet (DOC01) that contains various data elements from the receipt can be printed from SCALE by selecting a receipt in the Receipt Insight screen and choosing the ‘Print Selected Documents’ option from Actions. Travis Association for the Blind may choose to use the Receiving Worksheet to aid in the systematic receiving process at some point, but this will likely not be utilized for the initial go-live.  
```

<a id="b00340"></a>
## b00340 — word/document\.xml/body/\*\[340\]

```text

```

<a id="b00341"></a>
## b00341 — word/document\.xml/body/\*\[341\]

```text
APPOINTMENT SCHEDULING
```

<a id="b00342"></a>
## b00342 — word/document\.xml/body/\*\[342\]

```text
		
```

<a id="b00343"></a>
## b00343 — word/document\.xml/body/\*\[343\]

```text
		Operations
```

<a id="b00344"></a>
## b00344 — word/document\.xml/body/\*\[344\]

```text

```

<a id="b00345"></a>
## b00345 — word/document\.xml/body/\*\[345\]

```text
Once a receipt has been created in SCALE, appointments can be scheduled against it from the Receipt Insight. As appointments are known, users can schedule those appointments within SCALE by searching for the receipt, selecting it, and then choosing the Schedule Appointment option.  
```

<a id="b00346"></a>
## b00346 — word/document\.xml/body/\*\[346\]

```text

```

<a id="b00347"></a>
## b00347 — word/document\.xml/body/\*\[347\]

```text

```

<a id="b00348"></a>
## b00348 — word/document\.xml/body/\*\[348\]

```text
Figure: Receipt Insight – Schedule Appointment Option
```

<a id="b00349"></a>
## b00349 — word/document\.xml/body/\*\[349\]

```text

```

<a id="b00350"></a>
## b00350 — word/document\.xml/body/\*\[350\]

```text
Figure: Receiving Appointment Schedule Window
```

<a id="b00351"></a>
## b00351 — word/document\.xml/body/\*\[351\]

```text
This allows for enhanced management of receiving dock door locations, as well as the personnel required to unload the trailers at the dock. Users may enter the following information when scheduling an inbound appointment: 
```

<a id="b00352"></a>
## b00352 — word/document\.xml/body/\*\[352\]

```text

```

<a id="b00353"></a>
## b00353 — word/document\.xml/body/\*\[353\]

```text
Trailer ID
```

<a id="b00354"></a>
## b00354 — word/document\.xml/body/\*\[354\]

```text
Dock Door
```

<a id="b00355"></a>
## b00355 — word/document\.xml/body/\*\[355\]

```text
Start Date/Time
```

<a id="b00356"></a>
## b00356 — word/document\.xml/body/\*\[356\]

```text
End Date/Time 
```

<a id="b00357"></a>
## b00357 — word/document\.xml/body/\*\[357\]

```text

```

<a id="b00358"></a>
## b00358 — word/document\.xml/body/\*\[358\]

```text
Note: Appointments can only be scheduled for open receipts in SCALE. Appointments cannot be created without associating a receipt to the appointment (cannot be created for POs). 
```

<a id="b00359"></a>
## b00359 — word/document\.xml/body/\*\[359\]

```text

```

<a id="b00360"></a>
## b00360 — word/document\.xml/body/\*\[360\]

```text
Dock schedules can be viewed from the Appointment Calendar. This screen offers a view into daily appointments for each receiving dock location. 
```

<a id="b00361"></a>
## b00361 — word/document\.xml/body/\*\[361\]

```text

```

<a id="b00362"></a>
## b00362 — word/document\.xml/body/\*\[362\]

```text

```

<a id="b00363"></a>
## b00363 — word/document\.xml/body/\*\[363\]

```text
Figure: Appointment Calendar
```

<a id="b00364"></a>
## b00364 — word/document\.xml/body/\*\[364\]

```text
Scheduled appointments can also be deleted from the Receipt Insight by searching for the receipt, selecting it, and choosing the Delete Appointment option from the Actions menu. Scheduled appointments can also be edited using the Appointment Calendar screen directly. 
```

<a id="b00365"></a>
## b00365 — word/document\.xml/body/\*\[365\]

```text

```

<a id="b00366"></a>
## b00366 — word/document\.xml/body/\*\[366\]

```text
		QUALITY AUDIT
```

<a id="b00367"></a>
## b00367 — word/document\.xml/body/\*\[367\]

```text
		
```

<a id="b00368"></a>
## b00368 — word/document\.xml/body/\*\[368\]

```text
Inbound QC
```

<a id="b00369"></a>
## b00369 — word/document\.xml/body/\*\[369\]

```text

```

<a id="b00370"></a>
## b00370 — word/document\.xml/body/\*\[370\]

```text
Travis Association for the Blind does not execute any form of inbound QC inside of SCALE and will not for the initial conversion to Active SCALE. 
```

<a id="b00371"></a>
## b00371 — word/document\.xml/body/\*\[371\]

```text

```

<a id="b00372"></a>
## b00372 — word/document\.xml/body/\*\[372\]

```text

```

<a id="b00373"></a>
## b00373 — word/document\.xml/body/\*\[373\]

```text

```

<a id="b00374"></a>
## b00374 — word/document\.xml/body/\*\[374\]

```text

```

<a id="b00375"></a>
## b00375 — word/document\.xml/body/\*\[375\]

```text

```

<a id="b00376"></a>
## b00376 — word/document\.xml/body/\*\[376\]

```text

```

<a id="b00377"></a>
## b00377 — word/document\.xml/body/\*\[377\]

```text
RECEIVING / PALLETIZATION
```

<a id="b00378"></a>
## b00378 — word/document\.xml/body/\*\[378\]

```text

```

<a id="b00379"></a>
## b00379 — word/document\.xml/body/\*\[379\]

```text
		Item Level Receiving
```

<a id="b00380"></a>
## b00380 — word/document\.xml/body/\*\[380\]

```text

```

<a id="b00381"></a>
## b00381 — word/document\.xml/body/\*\[381\]

```text
Item Level Receiving will be used for all Receipt Types in SCALE. 
```

<a id="b00382"></a>
## b00382 — word/document\.xml/body/\*\[382\]

```text

```

<a id="b00383"></a>
## b00383 — word/document\.xml/body/\*\[383\]

```text
Item level Receiving will be performed from either the full screen Receipt Workbench UI or directly on the RF devices in Warehouse Mobile. Below is the recommended approach for executing Item Level Receiving. 
```

<a id="b00384"></a>
## b00384 — word/document\.xml/body/\*\[384\]

```text

```

<a id="b00385"></a>
## b00385 — word/document\.xml/body/\*\[385\]

```text
All Item Level Receipts
```

<a id="b00386"></a>
## b00386 — word/document\.xml/body/\*\[386\]

```text
User will first begin the receiving process by optionally printing the Receiving Worksheet from Receipt Insight. If the user does not print the Receiving Worksheet, they may use the vendor provided documentation instead (TCN, DD250, or 1348). 
```

<a id="b00387"></a>
## b00387 — word/document\.xml/body/\*\[387\]

```text
The user will then receive the items onto single SKU pallets to await putaway. 
```

<a id="b00388"></a>
## b00388 — word/document\.xml/body/\*\[388\]

```text
At the time of check-in, SCALE will utilize the configured locating rules to select a suitable putaway location for the pallet/cases and generate the work task for the user to complete
```

<a id="b00389"></a>
## b00389 — word/document\.xml/body/\*\[389\]

```text
NOTE: Receipt Uploads will be generated at the Container Level when the each receipt container (PL, group of CS/EA, etc) reaches a status of ‘In Putaway’ or greater.
```

<a id="b00390"></a>
## b00390 — word/document\.xml/body/\*\[390\]

```text

```

<a id="b00391"></a>
## b00391 — word/document\.xml/body/\*\[391\]

```text
The user first navigates to the Receipt Insight screen from the SCALE web UI.  The user will then begin the receiving process by selecting the receipt they wish to receive against and optionally printing the Receiving Worksheet (DOC01). Once the Receiving Worksheet is printed, or documents from the vendor collected, the user can proceed with processing the receipt via the full screen UI or begin receiving from the RF device using Warehouse Mobile. For all line level receipts, the user will begin by using the Item Level Receiving Preference on either the SCALE insight screens or Warehouse Mobile. In the full screen, once the receiving preference is selected, the user will be presented with the Receiving Workbench insight screen where they will select which line they intend to receive and begin the check-in process. 
```

<a id="b00392"></a>
## b00392 — word/document\.xml/body/\*\[392\]

```text

```

<a id="b00393"></a>
## b00393 — word/document\.xml/body/\*\[393\]

```text
In the Warehouse Mobile driven workflow, after the user has selected the Receiving Preference they wish to use, they will be presented with an input box asking them to specify the Receipt ID they wish to receive against. After the Receipt has been specified, SCALE will prompt the user to enter the item they wish to receive before the remainder of the check-in process is completed. If the item does not have dimension information, has missing dimension information, or no unit of measure information, the system notifies the user of this through an error message. The user will be able to continue receiving as this missing dimension error message is a soft stop. License Plate assignment will be set to System meaning SCALE will generate a license plate value for each Receipt Container received and print the Receipt Container Label after check-in is complete (LBL01). 
```

<a id="b00394"></a>
## b00394 — word/document\.xml/body/\*\[394\]

```text

```

<a id="b00395"></a>
## b00395 — word/document\.xml/body/\*\[395\]

```text
After the information for the item is entered, the inventory received will be in ‘Putaway Pending’ status. From here, when the user is ready, they can switch to the LPN Putaway Work Profile in Warehouse Mobile to execute the putaway of each pallet (pallet in this context can be a full PL or grouped CS/EA quantity) from the Receiving Dock to the selected inventory location. 
```

<a id="b00396"></a>
## b00396 — word/document\.xml/body/\*\[396\]

```text

```

<a id="b00397"></a>
## b00397 — word/document\.xml/body/\*\[397\]

```text
	Note: Receiving Preference for Item Level Flow - RF Workflow will be set to Header – Item no Disposition Code, Check-in and Locate (Immediate), Execute Group Putaway option unchecked, Process Immediate Needs unchecked
```

<a id="b00398"></a>
## b00398 — word/document\.xml/body/\*\[398\]

```text

```

<a id="b00399"></a>
## b00399 — word/document\.xml/body/\*\[399\]

```text

```

<a id="b00400"></a>
## b00400 — word/document\.xml/body/\*\[400\]

```text
Figure: Warehouse Mobile Item Level Receiving
```

<a id="b00401"></a>
## b00401 — word/document\.xml/body/\*\[401\]

```text
		Returns Receiving (Blind Receiving)
```

<a id="b00402"></a>
## b00402 — word/document\.xml/body/\*\[402\]

```text

```

<a id="b00403"></a>
## b00403 — word/document\.xml/body/\*\[403\]

```text
Any unauthorized return for Travis will show up at the facility without any 1348 having been created in the host ahead of time. In these instances, Travis still needs to be able to receive the product back into the warehouse. This will be accomplished in one of two ways in SCALE:
```

<a id="b00404"></a>
## b00404 — word/document\.xml/body/\*\[404\]

```text
Manually create the 1348 as a Receipt using the Receipt Insight screen and utilize the standard Item Level Receiving preference to process the goods. 
```

<a id="b00405"></a>
## b00405 — word/document\.xml/body/\*\[405\]

```text
Blind Receiving Preference
```

<a id="b00406"></a>
## b00406 — word/document\.xml/body/\*\[406\]

```text
Blind Receiving allows the user to receive product when no Receipt is present in SCALE ahead of time. This process will create a new Receipt on the fly while the user is receiving and will allow them to change the defaulted name of this Receipt during the beginning of the check-in process. This process will be executed by users on the RF device under the Receiving -> Returns Receiving menu option in Warehouse Mobile. 
```

<a id="b00407"></a>
## b00407 — word/document\.xml/body/\*\[407\]

```text

```

<a id="b00408"></a>
## b00408 — word/document\.xml/body/\*\[408\]

```text
Note: Blind Receiving will not be supported in Warehouse Mobile at the time of Travis’s initial go-live, and as such, will be handled via full screen in the Receipt Workbench UI or on an RF device which is configured to run the legacy RF. Travis will transition to using Warehouse Mobile for Blind Receiving as soon as it is available in Active SCALE. 
```

<a id="b00409"></a>
## b00409 — word/document\.xml/body/\*\[409\]

```text

```

<a id="b00410"></a>
## b00410 — word/document\.xml/body/\*\[410\]

```text
When the user begins this process, SCALE will supply a next up Receipt ID which the user can accept or edit to reflect the desired nomenclature. After the user has confirmed the Receipt ID they wish to use, the receiving process will proceed the same as the standard Item Level Receiving process defined in Section 7.1, but after check-in the user will be asked to supply a disposition code for the LPN being received. 
```

<a id="b00411"></a>
## b00411 — word/document\.xml/body/\*\[411\]

```text

```

<a id="b00412"></a>
## b00412 — word/document\.xml/body/\*\[412\]

```text
Note: Receiving Preference RF Workflow will be set to Blind with Disposition Code, Locate by Child, and Execute Group Putaway option unchecked.
```

<a id="b00413"></a>
## b00413 — word/document\.xml/body/\*\[413\]

```text

```

<a id="b00414"></a>
## b00414 — word/document\.xml/body/\*\[414\]

```text

```

<a id="b00415"></a>
## b00415 — word/document\.xml/body/\*\[415\]

```text
Figure: Returns Receiving Process
```

<a id="b00416"></a>
## b00416 — word/document\.xml/body/\*\[416\]

```text
		Damaged Receiving
```

<a id="b00417"></a>
## b00417 — word/document\.xml/body/\*\[417\]

```text

```

<a id="b00418"></a>
## b00418 — word/document\.xml/body/\*\[418\]

```text
If a product shows up to the Travis facility in a damaged state, depending on the type of Receipt it arrives on, Travis will handle the inventory in one of two ways:
```

<a id="b00419"></a>
## b00419 — word/document\.xml/body/\*\[419\]

```text

```

<a id="b00420"></a>
## b00420 — word/document\.xml/body/\*\[420\]

```text
DD250 Damages (Standard Receipts)
```

<a id="b00421"></a>
## b00421 — word/document\.xml/body/\*\[421\]

```text
Travis will receive all inventory in full under ‘A’ status prior to executing a Status Change transaction on the damaged portion of the receipt
```

<a id="b00422"></a>
## b00422 — word/document\.xml/body/\*\[422\]

```text
1348 Damages (Returns)
```

<a id="b00423"></a>
## b00423 — word/document\.xml/body/\*\[423\]

```text
Will receive the goods directly into a damaged/unavailable status through either the Blind Receiving preference or standard Item Level receiving
```

<a id="b00424"></a>
## b00424 — word/document\.xml/body/\*\[424\]

```text

```

<a id="b00425"></a>
## b00425 — word/document\.xml/body/\*\[425\]

```text
Verify Receipt
```

<a id="b00426"></a>
## b00426 — word/document\.xml/body/\*\[426\]

```text

```

<a id="b00427"></a>
## b00427 — word/document\.xml/body/\*\[427\]

```text
For receipts where all receipt details are received complete, SCALE automatically closes the receipt upon the putaway of the last LPN. Upon confirmation of the close, SCALE updates the receipt status to Closed and does not allow additional product to be received. 
```

<a id="b00428"></a>
## b00428 — word/document\.xml/body/\*\[428\]

```text

```

<a id="b00429"></a>
## b00429 — word/document\.xml/body/\*\[429\]

```text
Receipt Upload: SCALE will upload header/detail/container level information to the host when each receipt container hits ‘In Putaway’. 
```

<a id="b00430"></a>
## b00430 — word/document\.xml/body/\*\[430\]

```text

```

<a id="b00431"></a>
## b00431 — word/document\.xml/body/\*\[431\]

```text
EXCEPTIONS
```

<a id="b00432"></a>
## b00432 — word/document\.xml/body/\*\[432\]

```text
		
```

<a id="b00433"></a>
## b00433 — word/document\.xml/body/\*\[433\]

```text
Overages
```

<a id="b00434"></a>
## b00434 — word/document\.xml/body/\*\[434\]

```text

```

<a id="b00435"></a>
## b00435 — word/document\.xml/body/\*\[435\]

```text
Over Receiving is not allowed at Travis for any DD250. If the vendor sends an overage for any item on the receipt, Travis will file an SDR for the excess quantity and send the overage back to the vendor. 
```

<a id="b00436"></a>
## b00436 — word/document\.xml/body/\*\[436\]

```text

```

<a id="b00437"></a>
## b00437 — word/document\.xml/body/\*\[437\]

```text
For 1348s, over receiving is allowed and will be processed using SCALE. 
```

<a id="b00438"></a>
## b00438 — word/document\.xml/body/\*\[438\]

```text

```

<a id="b00439"></a>
## b00439 — word/document\.xml/body/\*\[439\]

```text
Shortages
```

<a id="b00440"></a>
## b00440 — word/document\.xml/body/\*\[440\]

```text

```

<a id="b00441"></a>
## b00441 — word/document\.xml/body/\*\[441\]

```text
For any short receipt at Travis, the standard procedure is to leave the shorted receipt open until the vendor has sent the remainder of the units. Based on the Archive Master settings, if the vendor does not send the remaining inventory within 3 months, the receipt will be archived and need to be redownloaded to SCALE. 
```

<a id="b00442"></a>
## b00442 — word/document\.xml/body/\*\[442\]

```text

```

<a id="b00443"></a>
## b00443 — word/document\.xml/body/\*\[443\]

```text

```

<a id="b00444"></a>
## b00444 — word/document\.xml/body/\*\[444\]

```text
Figure: Receipt Insight – Close Option
```

<a id="b00445"></a>
## b00445 — word/document\.xml/body/\*\[445\]

```text
Note: If a receipt were to be accidentally closed, SCALE does allow the user to manually re-open the receipt. 
```

<a id="b00446"></a>
## b00446 — word/document\.xml/body/\*\[446\]

```text

```

<a id="b00447"></a>
## b00447 — word/document\.xml/body/\*\[447\]

```text
Damages
```

<a id="b00448"></a>
## b00448 — word/document\.xml/body/\*\[448\]

```text

```

<a id="b00449"></a>
## b00449 — word/document\.xml/body/\*\[449\]

```text
Damaged goods will be handled according to the process defined in Section 7.3.  
```

<a id="b00450"></a>
## b00450 — word/document\.xml/body/\*\[450\]

```text

```

<a id="b00451"></a>
## b00451 — word/document\.xml/body/\*\[451\]

```text
PUTAWAY
```

<a id="b00452"></a>
## b00452 — word/document\.xml/body/\*\[452\]

```text

```

<a id="b00453"></a>
## b00453 — word/document\.xml/body/\*\[453\]

```text
	Locating Rules
```

<a id="b00454"></a>
## b00454 — word/document\.xml/body/\*\[454\]

```text

```

<a id="b00455"></a>
## b00455 — word/document\.xml/body/\*\[455\]

```text
Once inventory has been checked in to SCALE, a putaway location is found using locating rules. Travis Association for the Blind already has locating rules in place from the SCALE 2016 solution which will be copied over during the upgrade process. To allow for easy addition of new items and locating rules, the locating rule is assigned on the Receipt Detail using the Locating Rule Assignment configuration. Travis can still manually set the locating rule after the Receipt Detail is downloaded by opening the receipt line and selecting a different locating rule.
```

<a id="b00456"></a>
## b00456 — word/document\.xml/body/\*\[456\]

```text

```

<a id="b00457"></a>
## b00457 — word/document\.xml/body/\*\[457\]

```text
While the locating rules/zones will be copied over from the 2016 database, the following options will be reviewed during the Build Phase as potential enhancements to the existing rules:
```

<a id="b00458"></a>
## b00458 — word/document\.xml/body/\*\[458\]

```text

```

<a id="b00459"></a>
## b00459 — word/document\.xml/body/\*\[459\]

```text
Utilize the ‘Fill one and only one location within the location selection’ strategy for locating into the ‘F’ section of the facility. 
```

<a id="b00460"></a>
## b00460 — word/document\.xml/body/\*\[460\]

```text
Utilize SCALE generated License Plates during receiving in conjunction with enabling ‘Split Quantity’ on the locating rule details. 
```

<a id="b00461"></a>
## b00461 — word/document\.xml/body/\*\[461\]

```text
Print Receipt Container Labels from SCALE (LBL01)
```

<a id="b00462"></a>
## b00462 — word/document\.xml/body/\*\[462\]

```text
Review existing rules for consolidation opportunities. 
```

<a id="b00463"></a>
## b00463 — word/document\.xml/body/\*\[463\]

```text

```

<a id="b00464"></a>
## b00464 — word/document\.xml/body/\*\[464\]

```text
			Locating Zone		Description
	1		Mirror Existing SCALE 2016 Locating Zones (will be copied over during DB upgrade)		Zone Dependent 
```

<a id="b00465"></a>
## b00465 — word/document\.xml/body/\*\[465\]

```text

```

<a id="b00466"></a>
## b00466 — word/document\.xml/body/\*\[466\]

```text

```

<a id="b00467"></a>
## b00467 — word/document\.xml/body/\*\[467\]

```text
Locating Rules for Directed Putaway
```

<a id="b00468"></a>
## b00468 — word/document\.xml/body/\*\[468\]

```text

```

<a id="b00469"></a>
## b00469 — word/document\.xml/body/\*\[469\]

```text
Initial locating rules for go-live will be copied over during the database upgrade from 2016 to Active SCALE. 
```

<a id="b00470"></a>
## b00470 — word/document\.xml/body/\*\[470\]

```text

```

<a id="b00471"></a>
## b00471 — word/document\.xml/body/\*\[471\]

```text

```

<a id="b00472"></a>
## b00472 — word/document\.xml/body/\*\[472\]

```text

```

<a id="b00473"></a>
## b00473 — word/document\.xml/body/\*\[473\]

```text

```

<a id="b00474"></a>
## b00474 — word/document\.xml/body/\*\[474\]

```text

```

<a id="b00475"></a>
## b00475 — word/document\.xml/body/\*\[475\]

```text
Putaway Work Creation
```

<a id="b00476"></a>
## b00476 — word/document\.xml/body/\*\[476\]

```text

```

<a id="b00477"></a>
## b00477 — word/document\.xml/body/\*\[477\]

```text
Upon the receiving and palletization of the items, SCALE generates system work records for each located LPN. For full or partial pallets, the work unit will be the LPN which will be printed on the Receipt Container Label generated by SCALE during the check-in process. 
```

<a id="b00478"></a>
## b00478 — word/document\.xml/body/\*\[478\]

```text

```

<a id="b00479"></a>
## b00479 — word/document\.xml/body/\*\[479\]

```text
		Warehouse Mobile Putaway
```

<a id="b00480"></a>
## b00480 — word/document\.xml/body/\*\[480\]

```text

```

<a id="b00481"></a>
## b00481 — word/document\.xml/body/\*\[481\]

```text

```

<a id="b00482"></a>
## b00482 — word/document\.xml/body/\*\[482\]

```text
Figure: Warehouse Mobile Putaway Work Execution Flow
```

<a id="b00483"></a>
## b00483 — word/document\.xml/body/\*\[483\]

```text
To initiate putaway work, Travis Association for the Blind personnel will utilize the Putaway Work option in Warehouse Mobile.  A user enters the number associated with the Putaway Work Profile selection or chooses the profile by scrolling through the list of Work Profiles. Upon selection, SCALE prompts the user to enter a work unit, which in this scenario would be the Pallet LPN (partial or full).
```

<a id="b00484"></a>
## b00484 — word/document\.xml/body/\*\[484\]

```text

```

<a id="b00485"></a>
## b00485 — word/document\.xml/body/\*\[485\]

```text
Upon scanning the barcode, SCALE assigns the work unit to the user.  SCALE then displays the current receiving dock location with item information and prompts the user to confirm the number of units associated with the work unit (units on the LPN). Upon confirmation of the contents, SCALE updates the LPN(s) to status In Putaway and displays the putaway location for the first item.  To complete the putaway, the user takes the pallet to the directed location where they can then scan the location for validation of the putaway. 
```

<a id="b00486"></a>
## b00486 — word/document\.xml/body/\*\[486\]

```text

```

<a id="b00487"></a>
## b00487 — word/document\.xml/body/\*\[487\]

```text
Note: For Travis, all full PL putaways will direct the user to first drop the pallet to the ‘Conveyor’ location which represents the induction point of the inbound conveyor. From there, the inbound conveyor will drop the pallet to the correct spur (P&D) location based on the data present in the TRAV_PALLET table in the SCALE database (EX08 – SCALE 2016 Extension).  Finally, a forklift user will pick up the pallet from the P&D to complete the putaway to the correct reserve location. 
```

<a id="b00488"></a>
## b00488 — word/document\.xml/body/\*\[488\]

```text

```

<a id="b00489"></a>
## b00489 — word/document\.xml/body/\*\[489\]

```text
Any partial pallet created during receiving will be located directly to an inventory location (ILA if available) and putaway by LPN (work unit). 
```

<a id="b00490"></a>
## b00490 — word/document\.xml/body/\*\[490\]

```text

```

<a id="b00491"></a>
## b00491 — word/document\.xml/body/\*\[491\]

```text
The user may skip the putaway instruction and proceed to the next item on the work unit if multiple work instruction lines exist (i.e. more than one putaway location assigned or multiple items on a Putaway Group).  This is done by using the Skip button.  If the user skips the putaway, the system continues to direct the user through the putaway locations in putaway sequence (LIFO on the pallet for Putaway Groups) before looping back to put away the skipped items.  
```

<a id="b00492"></a>
## b00492 — word/document\.xml/body/\*\[492\]

```text

```

<a id="b00493"></a>
## b00493 — word/document\.xml/body/\*\[493\]

```text
Upon putaway to the final inventory location, SCALE updates the LPN to status Closed and updates the on-hand quantity at the final inventory location.
```

<a id="b00494"></a>
## b00494 — word/document\.xml/body/\*\[494\]

```text

```

<a id="b00495"></a>
## b00495 — word/document\.xml/body/\*\[495\]

```text

```

<a id="b00496"></a>
## b00496 — word/document\.xml/body/\*\[496\]

```text
Figure: Warehouse Mobile Receipt Putaway Work Execution
```

<a id="b00497"></a>
## b00497 — word/document\.xml/body/\*\[497\]

```text
		Location Override
```

<a id="b00498"></a>
## b00498 — word/document\.xml/body/\*\[498\]

```text

```

<a id="b00499"></a>
## b00499 — word/document\.xml/body/\*\[499\]

```text
Certain users can be granted security permissions to override the systems suggested location for the inventory. If this needs to happen, the user picks the LPN from the receiving dock, just as with the other work; however, when they are prompted for the Putaway Screen the user chooses the Override action from the menu in Warehouse Mobile.
```

<a id="b00500"></a>
## b00500 — word/document\.xml/body/\*\[500\]

```text

This will redirect the user to a screen where they can scan/enter the location name from the location in which they want to physically put the product away.  The system validates that there is nothing else directed to that location and that the location is valid before accepting the user’s override. After validation passes, the system updates the work record, the LPN to note the new location, and writes Transaction History noting the change in the putaway location. Finally, the user is presented with the Putaway Confirmation screen where they complete the putaway in the same manner as standard work units where no override took place.
```

<a id="b00501"></a>
## b00501 — word/document\.xml/body/\*\[501\]

```text

```

<a id="b00502"></a>
## b00502 — word/document\.xml/body/\*\[502\]

```text
When a user presses the Location Override button on the screen, after the user is redirected to the override screen, the user also has the option to click on the ‘Locate’ button. When the ‘Locate’ button is pressed, the user is presented with an option to select a locating rule. The system will then decide a suitable putaway location based on the locating rule selected by the user. 
```

<a id="b00503"></a>
## b00503 — word/document\.xml/body/\*\[503\]

```text

```

<a id="b00504"></a>
## b00504 — word/document\.xml/body/\*\[504\]

```text
Note: The user will be manually selecting the locating rule that SCALE will use to find a location for putaway in this scenario. 
```

<a id="b00505"></a>
## b00505 — word/document\.xml/body/\*\[505\]

```text

```

<a id="b00506"></a>
## b00506 — word/document\.xml/body/\*\[506\]

```text
If the user selects the option to override, SCALE has ability to create an activity-based cycle count at the original putaway location. Travis Association for the Blind does not currently use this option. 
```

<a id="b00507"></a>
## b00507 — word/document\.xml/body/\*\[507\]

```text

```

<a id="b00508"></a>
## b00508 — word/document\.xml/body/\*\[508\]

```text

```

<a id="b00509"></a>
## b00509 — word/document\.xml/body/\*\[509\]

```text

```

<a id="b00510"></a>
## b00510 — word/document\.xml/body/\*\[510\]

```text

```

<a id="b00511"></a>
## b00511 — word/document\.xml/body/\*\[511\]

```text

```

<a id="b00512"></a>
## b00512 — word/document\.xml/body/\*\[512\]

```text

```

<a id="b00513"></a>
## b00513 — word/document\.xml/body/\*\[513\]

```text

```

<a id="b00514"></a>
## b00514 — word/document\.xml/body/\*\[514\]

```text

```

<a id="b00515"></a>
## b00515 — word/document\.xml/body/\*\[515\]

```text

```

<a id="b00516"></a>
## b00516 — word/document\.xml/body/\*\[516\]

```text

```

<a id="b00517"></a>
## b00517 — word/document\.xml/body/\*\[517\]

```text

```

<a id="b00518"></a>
## b00518 — word/document\.xml/body/\*\[518\]

```text

```

<a id="b00519"></a>
## b00519 — word/document\.xml/body/\*\[519\]

```text

```

<a id="b00520"></a>
## b00520 — word/document\.xml/body/\*\[520\]

```text

```

<a id="b00521"></a>
## b00521 — word/document\.xml/body/\*\[521\]

```text

```

<a id="b00522"></a>
## b00522 — word/document\.xml/body/\*\[522\]

```text
III.	INVENTORY CONTROL
```

<a id="b00523"></a>
## b00523 — word/document\.xml/body/\*\[523\]

```text
		
```

<a id="b00524"></a>
## b00524 — word/document\.xml/body/\*\[524\]

```text
INVENTORY MANAGEMENT
```

<a id="b00525"></a>
## b00525 — word/document\.xml/body/\*\[525\]

```text

```

<a id="b00526"></a>
## b00526 — word/document\.xml/body/\*\[526\]

```text
		Inventory Adjustment
```

<a id="b00527"></a>
## b00527 — word/document\.xml/body/\*\[527\]

```text

```

<a id="b00528"></a>
## b00528 — word/document\.xml/body/\*\[528\]

```text
Inventory adjustments either increase or decrease the on-hand quantity of an item in a location. The adjustment types are configurable and are created to indicate reason codes for the associated adjustment such as Damaged, Scrap, etc. Each adjustment type can be set up to have minimum and maximum adjustment quantities. Security is maintained to control which users have access to which adjustment types. Adjustment types can be configured to either generate uploads for the host or update only SCALE inventory without an upload being generated. 
```

<a id="b00529"></a>
## b00529 — word/document\.xml/body/\*\[529\]

```text

```

<a id="b00530"></a>
## b00530 — word/document\.xml/body/\*\[530\]

```text
All adjustments are entered in the Inventory Management option. This option can be initiated blindly from the insight screen main menu or the Inventory Management option in Warehouse Mobile. It can also be initiated by selecting a location/item combination in the Inventory Insight Screen.  Personnel may then proceed by entering the quantity to adjust, where the quantity is specified as a negative value for negative adjustments. After confirming, SCALE adjusts the inventory in the location and creates a history record for the inventory transaction.
```

<a id="b00531"></a>
## b00531 — word/document\.xml/body/\*\[531\]

```text

```

<a id="b00532"></a>
## b00532 — word/document\.xml/body/\*\[532\]

```text

```

<a id="b00533"></a>
## b00533 — word/document\.xml/body/\*\[533\]

```text
Figure: Inventory Adjustment Insight Screen
```

<a id="b00534"></a>
## b00534 — word/document\.xml/body/\*\[534\]

```text

```

<a id="b00535"></a>
## b00535 — word/document\.xml/body/\*\[535\]

```text
Figure: Inventory Adjustment via Warehouse Mobile Inventory Management Option
```

<a id="b00536"></a>
## b00536 — word/document\.xml/body/\*\[536\]

```text
Note: Inventory cannot be adjusted in the receiving dock locations. Only located items can be adjusted using Inventory Management.
```

<a id="b00537"></a>
## b00537 — word/document\.xml/body/\*\[537\]

```text

```

<a id="b00538"></a>
## b00538 — word/document\.xml/body/\*\[538\]

```text
Adjustment Types
```

<a id="b00539"></a>
## b00539 — word/document\.xml/body/\*\[539\]

```text

```

<a id="b00540"></a>
## b00540 — word/document\.xml/body/\*\[540\]

```text
Copied from existing SCALE 2016 environment
```

<a id="b00541"></a>
## b00541 — word/document\.xml/body/\*\[541\]

```text

```

<a id="b00542"></a>
## b00542 — word/document\.xml/body/\*\[542\]

```text
		Inventory Transfer
```

<a id="b00543"></a>
## b00543 — word/document\.xml/body/\*\[543\]

```text

```

<a id="b00544"></a>
## b00544 — word/document\.xml/body/\*\[544\]

```text
Inventory transfers move the on-hand quantity of an item from one location to another within the four walls of the warehouse. The transfer types are configurable and are created to indicate reason codes such as Consolidation, Back to Stock, etc. Each transfer type can be set up to have minimum and maximum transfer quantities. Security is maintained to control which users have access to which transfer types.
```

<a id="b00545"></a>
## b00545 — word/document\.xml/body/\*\[545\]

```text

```

<a id="b00546"></a>
## b00546 — word/document\.xml/body/\*\[546\]

```text
The Inventory Transfer option can be initiated blindly from the insight screen main menu or Warehouse Mobile Inventory Management. This can also be initiated by selecting a location/item combination in the Inventory Insight, in which case the “from location” and item are automatically defaulted. In the scenario where Inventory Management is blindly initiated, the user is required to specify the “from location”, item, and quantity being transferred.
```

<a id="b00547"></a>
## b00547 — word/document\.xml/body/\*\[547\]

```text

```

<a id="b00548"></a>
## b00548 — word/document\.xml/body/\*\[548\]

```text

```

<a id="b00549"></a>
## b00549 — word/document\.xml/body/\*\[549\]

```text
Figure: Inventory Transfer via Warehouse Mobile
```

<a id="b00550"></a>
## b00550 — word/document\.xml/body/\*\[550\]

```text
As part of the inventory transfer process, users can also choose to create work. This way, a supervisor can decide what inventory needs to be moved and then a user on the floor will get the work task to physically move the product. Inventory transfer with work must be created from the insight screens. The work execution can happen on the RF device or be confirmed through the Work Insight Screen. 
```

<a id="b00551"></a>
## b00551 — word/document\.xml/body/\*\[551\]

```text

```

<a id="b00552"></a>
## b00552 — word/document\.xml/body/\*\[552\]

```text
Transfer Types
```

<a id="b00553"></a>
## b00553 — word/document\.xml/body/\*\[553\]

```text

```

<a id="b00554"></a>
## b00554 — word/document\.xml/body/\*\[554\]

```text
Copied from existing SCALE 2016 environment
```

<a id="b00555"></a>
## b00555 — word/document\.xml/body/\*\[555\]

```text

```

<a id="b00556"></a>
## b00556 — word/document\.xml/body/\*\[556\]

```text
Note: As part of the upgrade to Active SCALE, Travis would like to setup a Transfer Work Profile which is user directed and will not interfere with the existing Cycle Count Work configurations which use ‘From Loc’ as the Work Unit value. To do so, a new user-driven Transfer Work Profile will be setup with ‘From Check Digit’ as the Work Unit value to ensure unique work units across work types. 
```

<a id="b00557"></a>
## b00557 — word/document\.xml/body/\*\[557\]

```text

```

<a id="b00558"></a>
## b00558 — word/document\.xml/body/\*\[558\]

```text
Additionally, Travis would like to leverage the Work Creation – After Exit Point (EXP01) to remove the P&D assignment from any Transfer Work with a ‘To Location’ in the R1 area (Floor Level Racking). 
```

<a id="b00559"></a>
## b00559 — word/document\.xml/body/\*\[559\]

```text

```

<a id="b00560"></a>
## b00560 — word/document\.xml/body/\*\[560\]

```text

```

<a id="b00561"></a>
## b00561 — word/document\.xml/body/\*\[561\]

```text
Figure: Inventory Transfer with Work
```

<a id="b00562"></a>
## b00562 — word/document\.xml/body/\*\[562\]

```text

```

<a id="b00563"></a>
## b00563 — word/document\.xml/body/\*\[563\]

```text

```

<a id="b00564"></a>
## b00564 — word/document\.xml/body/\*\[564\]

```text
Figure: Warehouse Mobile Inventory Transfer Work Execution
```

<a id="b00565"></a>
## b00565 — word/document\.xml/body/\*\[565\]

```text

```

<a id="b00566"></a>
## b00566 — word/document\.xml/body/\*\[566\]

```text
Inventory Status Change
```

<a id="b00567"></a>
## b00567 — word/document\.xml/body/\*\[567\]

```text

```

<a id="b00568"></a>
## b00568 — word/document\.xml/body/\*\[568\]

```text
Inventory is received into SCALE with a default status of Available. However, Travis currently uses the Inventory Status value to denote the ‘Condition Code’ of inventory, which represents contrasting conditions of SKUs in the warehouse:
```

<a id="b00569"></a>
## b00569 — word/document\.xml/body/\*\[569\]

```text

```

<a id="b00570"></a>
## b00570 — word/document\.xml/body/\*\[570\]

```text
Condition Codes
```

<a id="b00571"></a>
## b00571 — word/document\.xml/body/\*\[571\]

```text
A, B, C -> Available Inventory
```

<a id="b00572"></a>
## b00572 — word/document\.xml/body/\*\[572\]

```text
G -> Unused today, but requires the inventory to be segregated if utilized in the future
```

<a id="b00573"></a>
## b00573 — word/document\.xml/body/\*\[573\]

```text
H -> Damaged Inventory
```

<a id="b00574"></a>
## b00574 — word/document\.xml/body/\*\[574\]

```text
L -> Litigation
```

<a id="b00575"></a>
## b00575 — word/document\.xml/body/\*\[575\]

```text

```

<a id="b00576"></a>
## b00576 — word/document\.xml/body/\*\[576\]

```text
Warehouse personnel will use an Inventory Status Change transaction to update inventory statuses throughout the warehouse. These status change types are configurable, and security is maintained to control which users have access to which status change types.
```

<a id="b00577"></a>
## b00577 — word/document\.xml/body/\*\[577\]

```text

```

<a id="b00578"></a>
## b00578 — word/document\.xml/body/\*\[578\]

```text
The Inventory Management option can be initiated blindly from the insight screen main menu. It can also be initiated by selecting a location/item combination in the Inventory Insight, in which case the location and item are automatically defaulted. The user then specifies the new inventory status. At confirmation SCALE updates the inventory status for the item and location combination. SCALE also creates a history log of the inventory transaction.
```

<a id="b00579"></a>
## b00579 — word/document\.xml/body/\*\[579\]

```text

```

<a id="b00580"></a>
## b00580 — word/document\.xml/body/\*\[580\]

```text
Note: A single license plate can only hold one inventory status for each item it contains. A single location cannot hold the same item with a quantity in two different statuses if the location is not License Plate tracked. 
```

<a id="b00581"></a>
## b00581 — word/document\.xml/body/\*\[581\]

```text

```

<a id="b00582"></a>
## b00582 — word/document\.xml/body/\*\[582\]

```text
Status Change Types
```

<a id="b00583"></a>
## b00583 — word/document\.xml/body/\*\[583\]

```text

```

<a id="b00584"></a>
## b00584 — word/document\.xml/body/\*\[584\]

```text
Copied from existing SCALE 2016 environment
```

<a id="b00585"></a>
## b00585 — word/document\.xml/body/\*\[585\]

```text

```

<a id="b00586"></a>
## b00586 — word/document\.xml/body/\*\[586\]

```text


```

<a id="b00587"></a>
## b00587 — word/document\.xml/body/\*\[587\]

```text
REPLENISHMENT
```

<a id="b00588"></a>
## b00588 — word/document\.xml/body/\*\[588\]

```text
		
```

<a id="b00589"></a>
## b00589 — word/document\.xml/body/\*\[589\]

```text
					Demand Replenishment
```

<a id="b00590"></a>
## b00590 — word/document\.xml/body/\*\[590\]

```text

```

<a id="b00591"></a>
## b00591 — word/document\.xml/body/\*\[591\]

```text
Demand Based Replenishment is not currently utilized by Travis and will not be configured for initial Active SCALE go-live. 
```

<a id="b00592"></a>
## b00592 — word/document\.xml/body/\*\[592\]

```text

```

<a id="b00593"></a>
## b00593 — word/document\.xml/body/\*\[593\]

```text
Capacity Replenishment 
```

<a id="b00594"></a>
## b00594 — word/document\.xml/body/\*\[594\]

```text

```

<a id="b00595"></a>
## b00595 — word/document\.xml/body/\*\[595\]

```text
Item Location Capacity based replenishment is used by Travis daily and is configured to run for both PL and CS increments. Capacity Based replenishment will be run on a scheduled job as currently defined for SCALE 2016 or may be manually invoked by a user as needed and will leverage the configured Item Location Capacity records (minimum replenishment threshold %) to determine what locations within the warehouse need to be replenished. 
```

<a id="b00596"></a>
## b00596 — word/document\.xml/body/\*\[596\]

```text

```

<a id="b00597"></a>
## b00597 — word/document\.xml/body/\*\[597\]

```text
Note: The Minimum Replenishment Threshold value for each location will be dictated by the Location Type:
```

<a id="b00598"></a>
## b00598 — word/document\.xml/body/\*\[598\]

```text

```

<a id="b00599"></a>
## b00599 — word/document\.xml/body/\*\[599\]

```text
Location Type – 48x48x50
```

<a id="b00600"></a>
## b00600 — word/document\.xml/body/\*\[600\]

```text
0% Threshold
```

<a id="b00601"></a>
## b00601 — word/document\.xml/body/\*\[601\]

```text
Location Type – 48x48x62
```

<a id="b00602"></a>
## b00602 — word/document\.xml/body/\*\[602\]

```text
Set to replenish at the qty of one tier of CS/maximum qty for the location type
```

<a id="b00603"></a>
## b00603 — word/document\.xml/body/\*\[603\]

```text

```

<a id="b00604"></a>
## b00604 — word/document\.xml/body/\*\[604\]

```text
					Replenishment Allocation Zones
```

<a id="b00605"></a>
## b00605 — word/document\.xml/body/\*\[605\]

```text
	
```

<a id="b00606"></a>
## b00606 — word/document\.xml/body/\*\[606\]

```text
			Allocation Zone		Description
	1		Mirror existing SCALE 2016 replenishment allocation location selections		Based on existing configurations in SCALE 2016
```

<a id="b00607"></a>
## b00607 — word/document\.xml/body/\*\[607\]

```text

```

<a id="b00608"></a>
## b00608 — word/document\.xml/body/\*\[608\]

```text
	Replenishment Allocation Sequence(s):
```

<a id="b00609"></a>
## b00609 — word/document\.xml/body/\*\[609\]

```text
	
```

<a id="b00610"></a>
## b00610 — word/document\.xml/body/\*\[610\]

```text
	Will be copied over from existing SCALE 2016 environment. 
```

<a id="b00611"></a>
## b00611 — word/document\.xml/body/\*\[611\]

```text
	
```

<a id="b00612"></a>
## b00612 — word/document\.xml/body/\*\[612\]

```text
		Work Creation Replenishment
```

<a id="b00613"></a>
## b00613 — word/document\.xml/body/\*\[613\]

```text

```

<a id="b00614"></a>
## b00614 — word/document\.xml/body/\*\[614\]

```text
The replenishment work creation process is like the work creation process performed during the locating portion of the receiving process.  After performing replenishment, SCALE creates a Work Unit to pick the inventory from its reserve location and transport it to its active location.  Based on the configuration in the Work Group, Work Type, Work Criteria, and Work Creation Master, the system analyzes, sorts, and bundles the replenishment requests to create a Work Unit. This Work Unit may consist of multiple items from many different locations.  
```

<a id="b00615"></a>
## b00615 — word/document\.xml/body/\*\[615\]

```text

```

<a id="b00616"></a>
## b00616 — word/document\.xml/body/\*\[616\]

```text
					Replenishment Work
```

<a id="b00617"></a>
## b00617 — word/document\.xml/body/\*\[617\]

```text

```

<a id="b00618"></a>
## b00618 — word/document\.xml/body/\*\[618\]

```text
Replenishment work is performed within SCALE as System Directed work. Users sign onto a RF Device and choose the Warehouse Mobile Work Execution option. Users then choose the Replenishment work profile.  The user is then prompted to scan a location for SCALE to assign a Work Unit in closest proximity (or highest priority if desired). The user is assigned a Work Unit and SCALE then presents the user with the first pick which displays the location, item, and quantity to be picked.  Users are required to verify the pick by scanning the location check digit and then hitting the ‘OK’ button.  Once all the picks have been completed (all picks can be any number of items – this is defined by Travis Association for the Blind), the user confirms the putaway to forward active location(s) by scanning the active location check digit.  After this, the user can be assigned the next Work Unit.
```

<a id="b00619"></a>
## b00619 — word/document\.xml/body/\*\[619\]

```text

```

<a id="b00620"></a>
## b00620 — word/document\.xml/body/\*\[620\]

```text
Note: Travis currently utilizes the ‘Allow renaming of existing work unit’ option to assign a temporary replenishment LPN to facilitate replenishment work within the facility. Temporary LPN is a next up label supplied by Travis.  
```

<a id="b00621"></a>
## b00621 — word/document\.xml/body/\*\[621\]

```text

```

<a id="b00622"></a>
## b00622 — word/document\.xml/body/\*\[622\]

```text

```

<a id="b00623"></a>
## b00623 — word/document\.xml/body/\*\[623\]

```text
Figure: Warehouse Mobile Replenishment Work Execution
```

<a id="b00624"></a>
## b00624 — word/document\.xml/body/\*\[624\]

```text
CYCLE COUNT
```

<a id="b00625"></a>
## b00625 — word/document\.xml/body/\*\[625\]

```text

```

<a id="b00626"></a>
## b00626 — word/document\.xml/body/\*\[626\]

```text
Generating Cycle Counts
```

<a id="b00627"></a>
## b00627 — word/document\.xml/body/\*\[627\]

```text
Planned Based Cycle Counting
```

<a id="b00628"></a>
## b00628 — word/document\.xml/body/\*\[628\]

```text

```

<a id="b00629"></a>
## b00629 — word/document\.xml/body/\*\[629\]

```text
SCALE utilizes Cycle Count Plans for everyday cycle counting. Travis Association for the Blind personnel can define the Cycle Count Plans in configurations ahead of time, or on the fly from Cycle Count Plan Insight. A Cycle Count Plan is used to define a range of items and/or locations for which to generate cycle count work. For an example of location criteria, Travis Association for the Blind can exclude a location which has been flagged as inactive/frozen. For an example of item criteria, Travis Association for the Blind can use item attributes such as Item Department, Item Class, etc. Once the plan has been created, SCALE creates work to count a specified number of locations within the criteria of the Cycle Count Plan. Each location determined for cycle count is generated as a separate work unit in SCALE. 
```

<a id="b00630"></a>
## b00630 — word/document\.xml/body/\*\[630\]

```text

```

<a id="b00631"></a>
## b00631 — word/document\.xml/body/\*\[631\]

```text
The Cycle Counting requirements for Travis are already configured in the existing SCALE 2016 environment and will be copied over during the DB upgrade.  
```

<a id="b00632"></a>
## b00632 — word/document\.xml/body/\*\[632\]

```text

```

<a id="b00633"></a>
## b00633 — word/document\.xml/body/\*\[633\]

```text

```

<a id="b00634"></a>
## b00634 — word/document\.xml/body/\*\[634\]

```text
Figure: Cycle Count Plan Insight
```

<a id="b00635"></a>
## b00635 — word/document\.xml/body/\*\[635\]

```text
			Activity Based Cycle Counting
```

<a id="b00636"></a>
## b00636 — word/document\.xml/body/\*\[636\]

```text

```

<a id="b00637"></a>
## b00637 — word/document\.xml/body/\*\[637\]

```text
Activity-based cycle counting is the concept of triggering a cycle count request after a warehouse activity (i.e. short picking). The triggering of these requests is tied to the location being processed. After the transaction is executed, the location is reviewed to see if cycle count work should be generated. SCALE can create cycle count work for a location for instances such as short picking a location, driving the inventory for a location below a certain threshold, for example 0 quantity (empty), or time since last count.
```

<a id="b00638"></a>
## b00638 — word/document\.xml/body/\*\[638\]

```text

```

<a id="b00639"></a>
## b00639 — word/document\.xml/body/\*\[639\]

```text
For Travis Association for the Blind the below activity counts will be created:
```

<a id="b00640"></a>
## b00640 — word/document\.xml/body/\*\[640\]

```text

```

<a id="b00641"></a>
## b00641 — word/document\.xml/body/\*\[641\]

```text
Verify Empty
```

<a id="b00642"></a>
## b00642 — word/document\.xml/body/\*\[642\]

```text
Interleaved to existing Work Profiles 
```

<a id="b00643"></a>
## b00643 — word/document\.xml/body/\*\[643\]

```text

```

<a id="b00644"></a>
## b00644 — word/document\.xml/body/\*\[644\]

```text

```

<a id="b00645"></a>
## b00645 — word/document\.xml/body/\*\[645\]

```text
Figure: Cycle Count Threshold config window
```

<a id="b00646"></a>
## b00646 — word/document\.xml/body/\*\[646\]

```text
Performing Cycle Counts
```

<a id="b00647"></a>
## b00647 — word/document\.xml/body/\*\[647\]

```text
	Work Execution
```

<a id="b00648"></a>
## b00648 — word/document\.xml/body/\*\[648\]

```text

```

<a id="b00649"></a>
## b00649 — word/document\.xml/body/\*\[649\]

```text
To confirm the cycle count, users sign onto an RF Device and open the Warehouse Mobile Main Menu, choose the Work option, and then specify the Cycle Count Work Profile. Users are then directed to verify the quantity of a specific item in a location. If an item is found in the location that SCALE does not know is there, the user can select the ‘Add’ option and enter the item and quantity for the inventory. The system is configurable to display the system quantity field or not depending on several different criteria, including Work Type, Username, and Work Zone.
```

<a id="b00650"></a>
## b00650 — word/document\.xml/body/\*\[650\]

```text

```

<a id="b00651"></a>
## b00651 — word/document\.xml/body/\*\[651\]

```text
Figure: Warehouse Mobile Cycle Count Work Execution
```

<a id="b00652"></a>
## b00652 — word/document\.xml/body/\*\[652\]

```text
Note: Cycle Count Preferences are set up to “Verify Bad Count”. Cycle count work execution is set to Standard with the System Quantity hidden from the user.
```

<a id="b00653"></a>
## b00653 — word/document\.xml/body/\*\[653\]

```text

```

<a id="b00654"></a>
## b00654 — word/document\.xml/body/\*\[654\]

```text
Upon entering the information, SCALE determines whether to post the inventory adjustment or update the cycle count request to status Pending Review. SCALE makes this determination based on the user’s cycle count tolerance of either quantity or cost of the pending adjustment. Travis Association for the Blind tolerances will be cost based. If the inventory adjustment falls outside of the user’s tolerance, then a supervisor must review the count before SCALE posts the adjustment to the inventory. If the adjustment falls within the tolerance, then SCALE updates the inventory in the location and creates an Inventory Adjustment transaction to record the change in inventory.
```

<a id="b00655"></a>
## b00655 — word/document\.xml/body/\*\[655\]

```text

```

<a id="b00656"></a>
## b00656 — word/document\.xml/body/\*\[656\]

```text
Note: Cycle Count Tolerances will be set to $XXX for Travis Association for the Blind to begin the implementation. 
```

<a id="b00657"></a>
## b00657 — word/document\.xml/body/\*\[657\]

```text
	Cycle Count Reconciliation
```

<a id="b00658"></a>
## b00658 — word/document\.xml/body/\*\[658\]

```text

```

<a id="b00659"></a>
## b00659 — word/document\.xml/body/\*\[659\]

```text
For cycle count transactions that fall outside of a user’s tolerance, SCALE updates the status of the Cycle Count work to Pending Review. 
```

<a id="b00660"></a>
## b00660 — word/document\.xml/body/\*\[660\]

```text

```

<a id="b00661"></a>
## b00661 — word/document\.xml/body/\*\[661\]

```text
To reconcile a cycle count, a supervisor can use either the Reconcile option from the Cycle Count Request Insight screen or the Cycle Count Reconcile option from an RF Device. From the Cycle Count Request Insight, the supervisor selects the appropriate cycle count in status Pending Review. On each of the counts requiring review, the supervisor uses the Reconcile action to complete the cycle count adjustment. Once in the reconcile screen, the supervisor enters the correct On-Hand quantity for the specific item in the location.
```

<a id="b00662"></a>
## b00662 — word/document\.xml/body/\*\[662\]

```text

```

<a id="b00663"></a>
## b00663 — word/document\.xml/body/\*\[663\]

```text

```

<a id="b00664"></a>
## b00664 — word/document\.xml/body/\*\[664\]

```text
Figure: Cycle Count Reconcile Using Insight Screen
```

<a id="b00665"></a>
## b00665 — word/document\.xml/body/\*\[665\]

```text

```

<a id="b00666"></a>
## b00666 — word/document\.xml/body/\*\[666\]

```text
Figure: Cycle Count Reconciliation Insight Screen
```

<a id="b00667"></a>
## b00667 — word/document\.xml/body/\*\[667\]

```text
From an RF Device, the supervisor selects the Cycle Count Reconcile option on the Warehouse Mobile page. The supervisor is then directed to verify the quantity for a given location. 
```

<a id="b00668"></a>
## b00668 — word/document\.xml/body/\*\[668\]

```text

```

<a id="b00669"></a>
## b00669 — word/document\.xml/body/\*\[669\]

```text
The supervisor performs the count and if the count is same as the system quantity, the supervisor enters the quantity and closes the process. If the supervisor performs the count and the count is different than the system quantity, SCALE will ask the user to verify their count once more before submitting the required inventory adjustment (defined on Cycle Count System Values configuration) to correct the on-hand quantity to the value the supervisor has counted in the reconciliation process. 
```

<a id="b00670"></a>
## b00670 — word/document\.xml/body/\*\[670\]

```text

```

<a id="b00671"></a>
## b00671 — word/document\.xml/body/\*\[671\]

```text

```

<a id="b00672"></a>
## b00672 — word/document\.xml/body/\*\[672\]

```text
Figure: Cycle Count Reconcile through Warehouse Mobile
```

<a id="b00673"></a>
## b00673 — word/document\.xml/body/\*\[673\]

```text

```

<a id="b00674"></a>
## b00674 — word/document\.xml/body/\*\[674\]

```text

```

<a id="b00675"></a>
## b00675 — word/document\.xml/body/\*\[675\]

```text

```

<a id="b00676"></a>
## b00676 — word/document\.xml/body/\*\[676\]

```text

```

<a id="b00677"></a>
## b00677 — word/document\.xml/body/\*\[677\]

```text

```

<a id="b00678"></a>
## b00678 — word/document\.xml/body/\*\[678\]

```text

```

<a id="b00679"></a>
## b00679 — word/document\.xml/body/\*\[679\]

```text

```

<a id="b00680"></a>
## b00680 — word/document\.xml/body/\*\[680\]

```text

```

<a id="b00681"></a>
## b00681 — word/document\.xml/body/\*\[681\]

```text

```

<a id="b00682"></a>
## b00682 — word/document\.xml/body/\*\[682\]

```text

```

<a id="b00683"></a>
## b00683 — word/document\.xml/body/\*\[683\]

```text

```

<a id="b00684"></a>
## b00684 — word/document\.xml/body/\*\[684\]

```text

```

<a id="b00685"></a>
## b00685 — word/document\.xml/body/\*\[685\]

```text

```

<a id="b00686"></a>
## b00686 — word/document\.xml/body/\*\[686\]

```text

```

<a id="b00687"></a>
## b00687 — word/document\.xml/body/\*\[687\]

```text

```

<a id="b00688"></a>
## b00688 — word/document\.xml/body/\*\[688\]

```text

```

<a id="b00689"></a>
## b00689 — word/document\.xml/body/\*\[689\]

```text

```

<a id="b00690"></a>
## b00690 — word/document\.xml/body/\*\[690\]

```text

```

<a id="b00691"></a>
## b00691 — word/document\.xml/body/\*\[691\]

```text

```

<a id="b00692"></a>
## b00692 — word/document\.xml/body/\*\[692\]

```text
OUTBOUND
```

<a id="b00693"></a>
## b00693 — word/document\.xml/body/\*\[693\]

```text

```

<a id="b00694"></a>
## b00694 — word/document\.xml/body/\*\[694\]

```text
WAVE PROCESSING
```

<a id="b00695"></a>
## b00695 — word/document\.xml/body/\*\[695\]

```text

```

<a id="b00696"></a>
## b00696 — word/document\.xml/body/\*\[696\]

```text
Outbound shipments (Parcel and LTL) are sent to SCALE via the host system. On a scheduled basis, these shipments are interfaced into SCALE.  Any shipments that fail validation are written to an output folder for further review. Once corrected, the shipment(s) can be reprocessed during the next scheduled interface download (or the interface can be manually invoked).
```

<a id="b00697"></a>
## b00697 — word/document\.xml/body/\*\[697\]

```text

```

<a id="b00698"></a>
## b00698 — word/document\.xml/body/\*\[698\]

```text
Note: Travis will utilize XML file-based interfaces for shipment download processing
```

<a id="b00699"></a>
## b00699 — word/document\.xml/body/\*\[699\]

```text

```

<a id="b00700"></a>
## b00700 — word/document\.xml/body/\*\[700\]

```text
In the 2016 environment all shipments are sent to SCALE with a carrier of UPS and after the download process is complete, a user will manually update shipments to LTL based on the weight/volume of the order. In Active SCALE, the assignment of LTL will be accomplished via Boomi during the download process. Users may still manually update the carrier for additional shipments to LTL as required from the Planned Shipment Insight/Shipment Screens as needed.  
```

<a id="b00701"></a>
## b00701 — word/document\.xml/body/\*\[701\]

```text

```

<a id="b00702"></a>
## b00702 — word/document\.xml/body/\*\[702\]

```text
Once successfully downloaded, the shipments are viewable as SCALE shipments in the Pool in Planned Shipment Insight. The shipments can be viewed by Carrier, Carrier Service, Order Type, Priority and Scheduled Ship Date (Travis may create Planned Shipment filter criteria records to view shipments in pool by other criteria of their choice).  
```

<a id="b00703"></a>
## b00703 — word/document\.xml/body/\*\[703\]

```text

```

<a id="b00704"></a>
## b00704 — word/document\.xml/body/\*\[704\]

```text
Note: Pool Views are utilized heavily at Travis in the 2016 environment and time should be allocated in the Build Phase for replicating the existing Pool Views as Planned Shipment Filters. 
```

<a id="b00705"></a>
## b00705 — word/document\.xml/body/\*\[705\]

```text

```

<a id="b00706"></a>
## b00706 — word/document\.xml/body/\*\[706\]

```text

```

<a id="b00707"></a>
## b00707 — word/document\.xml/body/\*\[707\]

```text
Figure: Planned Shipment Insight
```

<a id="b00708"></a>
## b00708 — word/document\.xml/body/\*\[708\]

```text
All shipments are processed through the system in a wave. A wave consists of a series of wave steps. Each wave step controls a function of the wave.
```

<a id="b00709"></a>
## b00709 — word/document\.xml/body/\*\[709\]

```text
Wave Flow:  
```

<a id="b00710"></a>
## b00710 — word/document\.xml/body/\*\[710\]

```text

```

<a id="b00711"></a>
## b00711 — word/document\.xml/body/\*\[711\]

```text
Sequence below indicates the order in which a wave step will be executed as part of the wave process.
```

<a id="b00712"></a>
## b00712 — word/document\.xml/body/\*\[712\]

```text

```

<a id="b00713"></a>
## b00713 — word/document\.xml/body/\*\[713\]

```text
Sequence	Standard Wave Flow Description
10	Start Wave
1000	Complete Wave
```

<a id="b00714"></a>
## b00714 — word/document\.xml/body/\*\[714\]

```text
Standard Wave Flow
```

<a id="b00715"></a>
## b00715 — word/document\.xml/body/\*\[715\]

```text

```

<a id="b00716"></a>
## b00716 — word/document\.xml/body/\*\[716\]

```text
Sequence	Multi-Pack Wave Flow Description
10	Start Wave
1000		Complete Wave
```

<a id="b00717"></a>
## b00717 — word/document\.xml/body/\*\[717\]

```text
Multi-Pack Wave Flow
```

<a id="b00718"></a>
## b00718 — word/document\.xml/body/\*\[718\]

```text

```

<a id="b00719"></a>
## b00719 — word/document\.xml/body/\*\[719\]

```text
Note: Existing Wave Flows from 2016 environment will be copied over for use with Active SCALE. 
```

<a id="b00720"></a>
## b00720 — word/document\.xml/body/\*\[720\]

```text

```

<a id="b00721"></a>
## b00721 — word/document\.xml/body/\*\[721\]

```text
After shipments are downloaded to SCALE and sorted in Planned Shipment Insight, they will first be added to waves using the ‘Multi-Pack’ Wave Master. The Multi-Pack Wave Master is used to handle initial Shipment Consolidation and update of the Shipment Detail Packing Class which will ultimately be used in subsequent waving. 
```

<a id="b00722"></a>
## b00722 — word/document\.xml/body/\*\[722\]

```text

```

<a id="b00723"></a>
## b00723 — word/document\.xml/body/\*\[723\]

```text
		Add to Wave
```

<a id="b00724"></a>
## b00724 — word/document\.xml/body/\*\[724\]

```text

```

<a id="b00725"></a>
## b00725 — word/document\.xml/body/\*\[725\]

```text
To initiate the wave process, the wave planner selects a shipment (or multi-selects more than one shipment) from the Planned Shipment Insight and selects “Add to Wave” from the Actions menu. Next, the wave planner is prompted to add the shipment(s) selected to an existing open wave, or they may select New Wave to manually assign the shipment(s) to a new wave.  When executing the “New Wave” action, the system prompts the user to select a “Wave Master” to act as a template that manages the movement of shipments through the wave cycle. The Wave Master defines the Wave Flow, Replenishment Master(s), and Paperwork/Label Master to use for the wave. The Wave Flow defines the sequence and specific steps SCALE performs when running a wave. Examples of Wave Flow steps include allocation, work creation, printing documents, etc. The Wave Flows are defined via the Wave Flow Configuration. The Replenishment Master defines what replenishment masters are eligible to evaluate demand within the wave. The paperwork/label masters define the documentation that is printed with a given wave.
```

<a id="b00726"></a>
## b00726 — word/document\.xml/body/\*\[726\]

```text
After confirming the “Wave Master” for a wave, the system assigns a wave number (via a next up counter) to group the selected shipments.  The shipments are removed from the pool (Planned Shipment Insight) and the wave is created in Wave Insight. The wave has a unique wave number and the wave name as specified when creating the wave. The wave is now ready to be run.
```

<a id="b00727"></a>
## b00727 — word/document\.xml/body/\*\[727\]

```text
For Travis, following batches have been identified:
```

<a id="b00728"></a>
## b00728 — word/document\.xml/body/\*\[728\]

```text

```

<a id="b00729"></a>
## b00729 — word/document\.xml/body/\*\[729\]

```text
Parcel 
```

<a id="b00730"></a>
## b00730 — word/document\.xml/body/\*\[730\]

```text
Parcel – most common UPS wave type
```

<a id="b00731"></a>
## b00731 — word/document\.xml/body/\*\[731\]

```text
Parcel Tomorrow - will change all carrier service level to UPS Next Day Air on all orders
```

<a id="b00732"></a>
## b00732 — word/document\.xml/body/\*\[732\]

```text
International Parcel – will print labels in order of shipment (and not location) and verify all required data, such as phone numbers and postal codes, are on all orders.
```

<a id="b00733"></a>
## b00733 — word/document\.xml/body/\*\[733\]

```text
LTL
```

<a id="b00734"></a>
## b00734 — word/document\.xml/body/\*\[734\]

```text
LTL – Most commonly used wave type. If any order is non-UPS carrier, all orders in the wave will be changed to show an LTL-Generic carrier
```

<a id="b00735"></a>
## b00735 — word/document\.xml/body/\*\[735\]

```text

```

<a id="b00736"></a>
## b00736 — word/document\.xml/body/\*\[736\]

```text
Note: Within the above groups, Travis will create many different subgroups for waving based on priority, ship to destination, customer, etc. which will mirror the standard waves created in the 2016 system today. Examples provided above. 
```

<a id="b00737"></a>
## b00737 — word/document\.xml/body/\*\[737\]

```text

```

<a id="b00738"></a>
## b00738 — word/document\.xml/body/\*\[738\]

```text
		Run Wave
```

<a id="b00739"></a>
## b00739 — word/document\.xml/body/\*\[739\]

```text

```

<a id="b00740"></a>
## b00740 — word/document\.xml/body/\*\[740\]

```text
After reviewing a wave and making any necessary changes, the wave planner uses the Run Wave action on the desired wave in the Active Wave view of the Wave Insight. Upon confirmation of the run wave request, the system executes the steps detailed in the Wave Flow associated with the wave. Upon completion of running the wave, the system moves the wave into the Completed status. 
```

<a id="b00741"></a>
## b00741 — word/document\.xml/body/\*\[741\]

```text

```

<a id="b00742"></a>
## b00742 — word/document\.xml/body/\*\[742\]

```text
		Wave Steps
```

<a id="b00743"></a>
## b00743 — word/document\.xml/body/\*\[743\]

```text

```

<a id="b00744"></a>
## b00744 — word/document\.xml/body/\*\[744\]

```text
The following sections explain the logic the system uses when executing the various steps that are included in the wave flow.
```

<a id="b00745"></a>
## b00745 — word/document\.xml/body/\*\[745\]

```text
			Start Wave
```

<a id="b00746"></a>
## b00746 — word/document\.xml/body/\*\[746\]

```text

```

<a id="b00747"></a>
## b00747 — word/document\.xml/body/\*\[747\]

```text
Start Wave is required for all wave flows and marks each shipment with a status of In Wave.
```

<a id="b00748"></a>
## b00748 — word/document\.xml/body/\*\[748\]

```text
		Override Data: Set Status Flow
```

<a id="b00749"></a>
## b00749 — word/document\.xml/body/\*\[749\]

```text

```

<a id="b00750"></a>
## b00750 — word/document\.xml/body/\*\[750\]

```text
This Override Data Wave Step updates the Status Flow field of the Shipment Details based on Carrier Type. 
```

<a id="b00751"></a>
## b00751 — word/document\.xml/body/\*\[751\]

```text

```

<a id="b00752"></a>
## b00752 — word/document\.xml/body/\*\[752\]

```text

```

<a id="b00753"></a>
## b00753 — word/document\.xml/body/\*\[753\]

```text

```

<a id="b00754"></a>
## b00754 — word/document\.xml/body/\*\[754\]

```text

```

<a id="b00755"></a>
## b00755 — word/document\.xml/body/\*\[755\]

```text
Parcel Status Flow
Status	Status Name
100	In Pool
200	Wave Pending
201	In Wave
300	Picking Pending
301	In Picking
400	Packing Pending
401	In Packing
700	Ship Confirm Pending
800	Load Confirm Pending
900	Closed
LTL Status Flow
Status	Status Name
100	In Pool
200	Wave Pending
201	In Wave
300	Picking Pending
301	In Picking
400	Packing Pending
401	In Packing
650	Loading Pending
700	Ship Confirm Pending
800	Load Confirm Pending
900	Closed
```

<a id="b00756"></a>
## b00756 — word/document\.xml/body/\*\[756\]

```text
		Dock Management Flow
```

<a id="b00757"></a>
## b00757 — word/document\.xml/body/\*\[757\]

```text

```

<a id="b00758"></a>
## b00758 — word/document\.xml/body/\*\[758\]

```text
A dock management flow record includes information which determines how the system will assign a dock location destination to a shipment line/container, and if the line/container is eligible for assignment. Each flow record is made up of a series of detail records that identify what selection and assignment strategies that the system should use when a quantity hits a certain status in your status flow. You can indicate what type of dock location you want the system to assign to this entity. Also, both the flow header and detail(s) have a default location that the system will assign as a "fallback" option in case no eligible dock area/positions are found.
```

<a id="b00759"></a>
## b00759 — word/document\.xml/body/\*\[759\]

```text

```

<a id="b00760"></a>
## b00760 — word/document\.xml/body/\*\[760\]

```text
Note: Existing Dock Management Flow records will be copied over from the 2016 environment as part of the conversion process. 
```

<a id="b00761"></a>
## b00761 — word/document\.xml/body/\*\[761\]

```text

```

<a id="b00762"></a>
## b00762 — word/document\.xml/body/\*\[762\]

```text
Override Data: Set Packing Class
```

<a id="b00763"></a>
## b00763 — word/document\.xml/body/\*\[763\]

```text

```

<a id="b00764"></a>
## b00764 — word/document\.xml/body/\*\[764\]

```text
This wave step will be utilized for all orders as part of the initial waving under the ‘Multi-Pack’ Wave Master. As part of this wave step, SCALE will assign a Packing Class value on the shipment detail record which will indicate what items can be packed together in a single shipping container. This value will also link to a Container Group which will define what size boxes should be considered eligible to use when packing a given item. 
```

<a id="b00765"></a>
## b00765 — word/document\.xml/body/\*\[765\]

```text

```

<a id="b00766"></a>
## b00766 — word/document\.xml/body/\*\[766\]

```text
Note: Waves processed on the Pack Size MHE system utilize different Container Types than are configured in SCALE in the 2016 environment. As part of the conversion to Active SCALE, the existing integration with Pack Size will be enhanced to include two-way communication (adding Pack Size to SCALE direction) so that Pack Size can pass back the actual Container Type used to update the Shipping Container table in SCALE. 
```

<a id="b00767"></a>
## b00767 — word/document\.xml/body/\*\[767\]

```text
		Rule Assignment
```

<a id="b00768"></a>
## b00768 — word/document\.xml/body/\*\[768\]

```text

```

<a id="b00769"></a>
## b00769 — word/document\.xml/body/\*\[769\]

```text
Rule Assignment wave step assigns each Shipment Detail with an allocation rule to be used in the Allocation wave step.  This assignment is configurable based on Shipment Header and Detail fields.
```

<a id="b00770"></a>
## b00770 — word/document\.xml/body/\*\[770\]

```text
		Allocation
```

<a id="b00771"></a>
## b00771 — word/document\.xml/body/\*\[771\]

```text

```

<a id="b00772"></a>
## b00772 — word/document\.xml/body/\*\[772\]

```text
SCALE allocates inventory towards a shipment by using the allocation rule defined on the shipment detail. Allocation rules define what locations and units of measure are eligible for allocation and how SCALE should allocate that inventory. For example, an allocation rule can be configured to allocate inventory only from mid-level bins and to allocate the inventory with the closest expiration date (FEFO). Allocation rules can have multiple sequences. SCALE attempts to allocate inventory using the first sequence and if inventory could not be 100% allocated, SCALE continues to the next allocation rule sequence to attempt to allocate the remaining inventory.
```

<a id="b00773"></a>
## b00773 — word/document\.xml/body/\*\[773\]

```text

```

<a id="b00774"></a>
## b00774 — word/document\.xml/body/\*\[774\]

```text
Allocation rules are set on the shipment detail in one of three ways.  The allocation rule can be set at the item level (in the Item Master configuration) which in turn automatically defaults on the shipment detail. The interface can also set the allocation rule on the shipment detail.  Lastly, the allocation rule can be determined in the wave just prior to allocation occurring.  This is done using the Allocation Rule Assignment functionality.  Allocation Rule Assignment sets the allocation rule on the shipment detail based on user-defined criteria.  For example, based on the customer and order type, the allocation rule can be set to one that allocates in only full cases.  If no allocation rule is set on the shipment detail, the *Default allocation rule is used.  To allow for maximum flexibility and easy addition of new items and allocation rules, the allocation rule is assigned on the Shipment Detail using the Allocation Rule Assignment functionality in the wave. Travis may still manually set the allocation rule in the interface or via the Shipment Detail screen as needed.
```

<a id="b00775"></a>
## b00775 — word/document\.xml/body/\*\[775\]

```text

```

<a id="b00776"></a>
## b00776 — word/document\.xml/body/\*\[776\]

```text
	Allocation Zone Definitions
```

<a id="b00777"></a>
## b00777 — word/document\.xml/body/\*\[777\]

```text
			Allocating Zone
	 1		A – Floor (F)
	 2		A – Shelf (S)
	 3		A – Mezzanine (M)
	 4		A – Rack (R) 
	 5		A – TBD
```

<a id="b00778"></a>
## b00778 — word/document\.xml/body/\*\[778\]

```text
	
```

<a id="b00779"></a>
## b00779 — word/document\.xml/body/\*\[779\]

```text
	Allocation Sequence – Parcel:
```

<a id="b00780"></a>
## b00780 — word/document\.xml/body/\*\[780\]

```text
	
```

<a id="b00781"></a>
## b00781 — word/document\.xml/body/\*\[781\]

```text
Seq	Strategy	Location Selection	Eligible UMs	Inventory Status	Clear Loc?	
Lot
10	First In, First Out (FIFO)	A - Floor	EA/CS	Available 	N	Any lot (multiple ok)
20	First In, First, Out (FIFO)	A - Shelf	EA/CS	Available	N	Any lot (multiple ok)
30	First In, First Out (FIFO)	A - Mezzanine	EA/CS	Available	N	Any lot (multiple ok)
```

<a id="b00782"></a>
## b00782 — word/document\.xml/body/\*\[782\]

```text
	
```

<a id="b00783"></a>
## b00783 — word/document\.xml/body/\*\[783\]

```text
	Allocation Sequence – LTL:
```

<a id="b00784"></a>
## b00784 — word/document\.xml/body/\*\[784\]

```text
	
```

<a id="b00785"></a>
## b00785 — word/document\.xml/body/\*\[785\]

```text
Seq	Strategy	Location Selection	Eligible UMs	Inventory Status	Clear Loc?	
Lot
10	First In, First Out (FIFO)	A - Floor	EA/CS	Available 	N	Any lot (multiple ok)
20	First In, First, Out (FIFO)	A - Shelf	EA/CS	Available	N	Any lot (multiple ok)
30	First In, First Out (FIFO)	A - Rack	CS/PL	Available	N	Any lot (multiple ok)
```

<a id="b00786"></a>
## b00786 — word/document\.xml/body/\*\[786\]

```text
	Note: All existing allocation rules in the 2016 environment will be brought over during the conversion to Active SCALE. 
```

<a id="b00787"></a>
## b00787 — word/document\.xml/body/\*\[787\]

```text
	
```

<a id="b00788"></a>
## b00788 — word/document\.xml/body/\*\[788\]

```text
		Allocate Complete
```

<a id="b00789"></a>
## b00789 — word/document\.xml/body/\*\[789\]

```text

```

<a id="b00790"></a>
## b00790 — word/document\.xml/body/\*\[790\]

```text
By setting the ‘Allocate Complete’ flag on the shipment header, SCALE does not perform any allocation for this shipment unless the shipment can be 100% allocated. For Travis, the Allocate Complete flag is set to yes for all orders on initial waving. This flag will then be further manipulated manually by the warehouse associates if required to ship an order which can only be partially allocated.  
```

<a id="b00791"></a>
## b00791 — word/document\.xml/body/\*\[791\]

```text

```

<a id="b00792"></a>
## b00792 — word/document\.xml/body/\*\[792\]

```text
		Allocation Rejections
```

<a id="b00793"></a>
## b00793 — word/document\.xml/body/\*\[793\]

```text

```

<a id="b00794"></a>
## b00794 — word/document\.xml/body/\*\[794\]

```text
If the ‘Allocate Complete’ flag is not set, any quantities of the detail that fail allocation for a shipment are returned to the pool. If the entire shipment is rejected, then entire shipment goes back to pool. Rejected shipments have a yellow icon (caution symbol) and can be grouped by these icons in the Planned Shipment Insight, which indicates that they have been rejected. These shipments can be reviewed to determine the rejected lines and quantities and re-waved as desired. 
```

<a id="b00795"></a>
## b00795 — word/document\.xml/body/\*\[795\]

```text

```

<a id="b00796"></a>
## b00796 — word/document\.xml/body/\*\[796\]

```text
Note: Default status when shipment is rejected is set to In Pool.
```

<a id="b00797"></a>
## b00797 — word/document\.xml/body/\*\[797\]

```text
		Container Creation
```

<a id="b00798"></a>
## b00798 — word/document\.xml/body/\*\[798\]

```text

```

<a id="b00799"></a>
## b00799 — word/document\.xml/body/\*\[799\]

```text
Container creation is the process in which SCALE determines the number of containers and each container’s contents for specified shipments in each wave.  A unique container number, commonly referred to as a UCC 128, is assigned to every container as it is created.  
```

<a id="b00800"></a>
## b00800 — word/document\.xml/body/\*\[800\]

```text

```

<a id="b00801"></a>
## b00801 — word/document\.xml/body/\*\[801\]

```text
SCALE first takes all items whose allocated unit of measure is set up as a ‘shippable unit’ and creates full containers.   Shippable units are defined in the item unit of measure configuration.  Full containers are containers that are shippable without repacking into another container (Treat as Loose = N for the UM).  Pallets, gaylords, and certain cases are generally configured as shippable units.
```

<a id="b00802"></a>
## b00802 — word/document\.xml/body/\*\[802\]

```text

```

<a id="b00803"></a>
## b00803 — word/document\.xml/body/\*\[803\]

```text
SCALE then takes the remaining ‘loose’ items whose allocated unit of measure is set up as ‘not shippable’ and groups them together by Packing Class. A Packing Class is defined on the Item Master and then defaulted on the Shipment Detail or assigned dynamically with an ODWS in the wave. Each Packing Class is associated with a container group. A container group is a listing of container types (box sizes) listed from largest container to smallest container. SCALE attempts to cube items into the least number of containers possible. The total weight and volume are calculated for all the items on the shipment with the same packing group. SCALE first tries to cube into the first container of the container group.  If capacity still exists, the system tries cubing into the next container type and continues until either capacity in the next priority is reached or there are no additional priorities.  
```

<a id="b00804"></a>
## b00804 — word/document\.xml/body/\*\[804\]

```text

```

<a id="b00805"></a>
## b00805 — word/document\.xml/body/\*\[805\]

```text
If there is not enough capacity in the largest container, then SCALE cubes as much as possible into the largest container, calculates the remaining weight and volume, and starts over. SCALE considers the critical dimensions of each item as it creates containers.  An item is not cubed into a container if any one of its critical dimensions is greater than the corresponding container dimension.
```

<a id="b00806"></a>
## b00806 — word/document\.xml/body/\*\[806\]

```text

```

<a id="b00807"></a>
## b00807 — word/document\.xml/body/\*\[807\]

```text
Note: If an item doesn’t have unit of measure record defined, then SCALE treats the item as having dimensions of 0X0X0 and of weight 0 LB. 
```

<a id="b00808"></a>
## b00808 — word/document\.xml/body/\*\[808\]

```text
Load Building
```

<a id="b00809"></a>
## b00809 — word/document\.xml/body/\*\[809\]

```text

```

<a id="b00810"></a>
## b00810 — word/document\.xml/body/\*\[810\]

```text
Shipments with a carrier are assigned to a shipping load during the wave based on carrier, route, and scheduled ship date.  This wave step alleviates the need for personnel to manually assign the shipment to a shipping load via the Shipment Insight after the wave has run.
```

<a id="b00811"></a>
## b00811 — word/document\.xml/body/\*\[811\]

```text

```

<a id="b00812"></a>
## b00812 — word/document\.xml/body/\*\[812\]

```text
Note: This would represent a change from the existing 2016 Wave Flow which does not leverage wave-based Load Building. 
```

<a id="b00813"></a>
## b00813 — word/document\.xml/body/\*\[813\]

```text
			Work Creation - Picking
```

<a id="b00814"></a>
## b00814 — word/document\.xml/body/\*\[814\]

```text

```

<a id="b00815"></a>
## b00815 — word/document\.xml/body/\*\[815\]

```text
The work creation process performed during the wave is like the work creation process performed during the locating portion of the receiving process.  After performing allocation and container creation, SCALE creates a work unit to pick the inventory from a location and transport the inventory to the shipping area based on the configuration in the Work Group, Work Type, Work Criteria, and Work Creation Master.  Each location will be assigned a numeric value called Picking Sequence that will be used to sort the picks in an order other than alphabetical by location.
```

<a id="b00816"></a>
## b00816 — word/document\.xml/body/\*\[816\]

```text

```

<a id="b00817"></a>
## b00817 — word/document\.xml/body/\*\[817\]

```text

```

<a id="b00818"></a>
## b00818 — word/document\.xml/body/\*\[818\]

```text

```

<a id="b00819"></a>
## b00819 — word/document\.xml/body/\*\[819\]

```text

```

<a id="b00820"></a>
## b00820 — word/document\.xml/body/\*\[820\]

```text

```

<a id="b00821"></a>
## b00821 — word/document\.xml/body/\*\[821\]

```text
		Work Creation Shipping Container
```

<a id="b00822"></a>
## b00822 — word/document\.xml/body/\*\[822\]

```text

```

<a id="b00823"></a>
## b00823 — word/document\.xml/body/\*\[823\]

```text
Work Type: Full PL Picking 
```

<a id="b00824"></a>
## b00824 — word/document\.xml/body/\*\[824\]

```text

```

<a id="b00825"></a>
## b00825 — word/document\.xml/body/\*\[825\]

```text
One work unit is created per pallet to be picked. For the entire work unit, the work instruction (picks) is ordered by pick sequence.
```

<a id="b00826"></a>
## b00826 — word/document\.xml/body/\*\[826\]

```text

```

<a id="b00827"></a>
## b00827 — word/document\.xml/body/\*\[827\]

```text
Work Type: CS Pick
```

<a id="b00828"></a>
## b00828 — word/document\.xml/body/\*\[828\]

```text

```

<a id="b00829"></a>
## b00829 — word/document\.xml/body/\*\[829\]

```text
One work unit is created per case to be picked. For the entire work unit, the work instruction (picks) is ordered by pick sequence.
```

<a id="b00830"></a>
## b00830 — word/document\.xml/body/\*\[830\]

```text

```

<a id="b00831"></a>
## b00831 — word/document\.xml/body/\*\[831\]

```text
Work Type: EA Picking
```

<a id="b00832"></a>
## b00832 — word/document\.xml/body/\*\[832\]

```text

```

<a id="b00833"></a>
## b00833 — word/document\.xml/body/\*\[833\]

```text
One work unit is created per loose container to be picked. For the entire work unit, the work instruction (picks) is ordered by pick sequence.
```

<a id="b00834"></a>
## b00834 — word/document\.xml/body/\*\[834\]

```text
			Paperwork - Labels
```

<a id="b00835"></a>
## b00835 — word/document\.xml/body/\*\[835\]

```text

```

<a id="b00836"></a>
## b00836 — word/document\.xml/body/\*\[836\]

```text
Wave Labels - Container Contents (LBL02) will all be printed manually via the ‘Reprint Wave Labels’ action in Wave Insight for any wave being processed outside of the Pack Size MHE system. For waves processed on the Pack Size system, the labels will be applied during container creation. 
```

<a id="b00837"></a>
## b00837 — word/document\.xml/body/\*\[837\]

```text

```

<a id="b00838"></a>
## b00838 — word/document\.xml/body/\*\[838\]

```text
Note: Shipping Labels for Parcel orders (UPS) will be printed during Close Container. 
```

<a id="b00839"></a>
## b00839 — word/document\.xml/body/\*\[839\]

```text
			Paperwork – Documents
```

<a id="b00840"></a>
## b00840 — word/document\.xml/body/\*\[840\]

```text

```

<a id="b00841"></a>
## b00841 — word/document\.xml/body/\*\[841\]

```text
No documents will be printed at wave release. 
```

<a id="b00842"></a>
## b00842 — word/document\.xml/body/\*\[842\]

```text

```

<a id="b00843"></a>
## b00843 — word/document\.xml/body/\*\[843\]

```text
			Override Data: Check for No Work
```

<a id="b00844"></a>
## b00844 — word/document\.xml/body/\*\[844\]

```text

```

<a id="b00845"></a>
## b00845 — word/document\.xml/body/\*\[845\]

```text
This Override Data Wave Step ensures that the Work Creation configurations are correct, and every Shipment has had work created successfully, otherwise this ODWS marks the wave for failure.
```

<a id="b00846"></a>
## b00846 — word/document\.xml/body/\*\[846\]

```text
			Complete Wave
```

<a id="b00847"></a>
## b00847 — word/document\.xml/body/\*\[847\]

```text

```

<a id="b00848"></a>
## b00848 — word/document\.xml/body/\*\[848\]

```text
Complete Wave updates each shipment with a status of Picking Pending.  Shipments with this status are now eligible for release.
```

<a id="b00849"></a>
## b00849 — word/document\.xml/body/\*\[849\]

```text

```

<a id="b00850"></a>
## b00850 — word/document\.xml/body/\*\[850\]

```text
WAVE MANAGEMENT
```

<a id="b00851"></a>
## b00851 — word/document\.xml/body/\*\[851\]

```text

```

<a id="b00852"></a>
## b00852 — word/document\.xml/body/\*\[852\]

```text
After building and running the wave, the wave supervisor reviews the results of the wave using the full screen Process History Insight and Work Insight options.  Depending on the results, the user may perform one of two options. These options are identified in the following sections.
```

<a id="b00853"></a>
## b00853 — word/document\.xml/body/\*\[853\]

```text

```

<a id="b00854"></a>
## b00854 — word/document\.xml/body/\*\[854\]

```text
		Cancel Wave
```

<a id="b00855"></a>
## b00855 — word/document\.xml/body/\*\[855\]

```text

```

<a id="b00856"></a>
## b00856 — word/document\.xml/body/\*\[856\]

```text
If the results of the entire wave are not satisfactory users may cancel the wave using the Cancel action in the Completed Wave window of the Wave Insight.   
```

<a id="b00857"></a>
## b00857 — word/document\.xml/body/\*\[857\]

```text

```

<a id="b00858"></a>
## b00858 — word/document\.xml/body/\*\[858\]

```text

```

<a id="b00859"></a>
## b00859 — word/document\.xml/body/\*\[859\]

```text
Figure: Wave Insight – Cancel Wave Option
```

<a id="b00860"></a>
## b00860 — word/document\.xml/body/\*\[860\]

```text
The cancel process backs out allocation and deletes work instructions as well as shipping containers.  As allocations are backed out, the corresponding inventory is now available for order fulfillment again. At the point of cancellation, Travis personnel can move the cancelled shipments onto another wave or move them completely back to the Pool.  
```

<a id="b00861"></a>
## b00861 — word/document\.xml/body/\*\[861\]

```text

```

<a id="b00862"></a>
## b00862 — word/document\.xml/body/\*\[862\]

```text

```

<a id="b00863"></a>
## b00863 — word/document\.xml/body/\*\[863\]

```text
Figure: Wave Insight – Cancel Wave Option
```

<a id="b00864"></a>
## b00864 — word/document\.xml/body/\*\[864\]

```text
		Release Wave
```

<a id="b00865"></a>
## b00865 — word/document\.xml/body/\*\[865\]

```text

```

<a id="b00866"></a>
## b00866 — word/document\.xml/body/\*\[866\]

```text
If the results of the wave are satisfactory, the wave supervisor Releases the wave. The Release action performs multiple operations: 
```

<a id="b00867"></a>
## b00867 — word/document\.xml/body/\*\[867\]

```text

```

<a id="b00868"></a>
## b00868 — word/document\.xml/body/\*\[868\]

```text
Releases the generated work to the warehouse floor by removing the Hold Code from the work units – this allows the work to now be eligible for picking
```

<a id="b00869"></a>
## b00869 — word/document\.xml/body/\*\[869\]

```text
Prints Wave Labels and Wave Documents
```

<a id="b00870"></a>
## b00870 — word/document\.xml/body/\*\[870\]

```text
Can be configured to print at Wave run as well, but this option is less common
```

<a id="b00871"></a>
## b00871 — word/document\.xml/body/\*\[871\]

```text

```

<a id="b00872"></a>
## b00872 — word/document\.xml/body/\*\[872\]

```text
Note: For Travis label printing will either be performed manually via ‘Reprint Wave Labels’ action or done through the Pack Size MHE system for any wave the DC chooses to process via Pack Size. 
```

<a id="b00873"></a>
## b00873 — word/document\.xml/body/\*\[873\]

```text

```

<a id="b00874"></a>
## b00874 — word/document\.xml/body/\*\[874\]

```text

```

<a id="b00875"></a>
## b00875 — word/document\.xml/body/\*\[875\]

```text
Figure: Wave Insight – Release Wave Option
```

<a id="b00876"></a>
## b00876 — word/document\.xml/body/\*\[876\]

```text
		Hold Codes
```

<a id="b00877"></a>
## b00877 — word/document\.xml/body/\*\[877\]

```text

```

<a id="b00878"></a>
## b00878 — word/document\.xml/body/\*\[878\]

```text
Hold Codes allow work to be temporarily placed on hold so that no further processing can be done against it. Work created through a wave initially has a Hold Code of “Wave Not Released”. When a wave is released, the Hold Code is removed.
```

<a id="b00879"></a>
## b00879 — word/document\.xml/body/\*\[879\]

```text

```

<a id="b00880"></a>
## b00880 — word/document\.xml/body/\*\[880\]

```text
Note: Hold Codes can also be manually removed or added through the Hold option from the Work Insight.
```

<a id="b00881"></a>
## b00881 — word/document\.xml/body/\*\[881\]

```text

```

<a id="b00882"></a>
## b00882 — word/document\.xml/body/\*\[882\]

```text
		Post Wave Shipment Changes
```

<a id="b00883"></a>
## b00883 — word/document\.xml/body/\*\[883\]

```text

```

<a id="b00884"></a>
## b00884 — word/document\.xml/body/\*\[884\]

```text
If a change is required for an order that has been waved and released (but not picked), the shipment can be cancelled by choosing the ‘Cancel’ option from the Shipment Insight.  Canceling a shipment de-allocates the inventory for the order, deletes the created shipping containers/work, and moves the shipment back into the pool.  Once an order is partially or completely picked, it can be cancelled by the same process, but any items that were picked would need to be transferred back to an inventory location using the Inventory Transfer option. This can be done from Inventory Transfer Insight or Warehouse Mobile.
```

<a id="b00885"></a>
## b00885 — word/document\.xml/body/\*\[885\]

```text

```

<a id="b00886"></a>
## b00886 — word/document\.xml/body/\*\[886\]

```text
Note: If an order is cancelled, it cancels all the work tied to the order. Also, while trying to cancel an order, if any work related to the order is being actively executed by pickers, then order cancellation fails. Cancelling of the shipment after the wave is released can only be performed by a warehouse user. After the wave has been released, host will not be able to cancel the order (The only time host system can make changes to a shipment is when the shipment is in ‘In Pool’ status).
```

<a id="b00887"></a>
## b00887 — word/document\.xml/body/\*\[887\]

```text

```

<a id="b00888"></a>
## b00888 — word/document\.xml/body/\*\[888\]

```text
WORK MANAGEMENT
```

<a id="b00889"></a>
## b00889 — word/document\.xml/body/\*\[889\]

```text

```

<a id="b00890"></a>
## b00890 — word/document\.xml/body/\*\[890\]

```text
		Work Viewing
```

<a id="b00891"></a>
## b00891 — word/document\.xml/body/\*\[891\]

```text

```

<a id="b00892"></a>
## b00892 — word/document\.xml/body/\*\[892\]

```text
Using the fixed station Work Insight options, personnel can monitor the progress of work.  The Work Insight contains the ability to group work by condition: Open, In Progress, and Closed.  Additionally, this option enables personnel to view the types of work that are open and in progress to determine if additional users are needed to help with receipt putaway, replenishment, picking work, etc.  Personnel can inquire on the specifics of the work unit, such as the ‘from’ and ‘to’ location, item(s) and quantity being moved, Receipt/Shipment ID, user performing the work, etc.
```

<a id="b00893"></a>
## b00893 — word/document\.xml/body/\*\[893\]

```text

```

<a id="b00894"></a>
## b00894 — word/document\.xml/body/\*\[894\]

```text

```

<a id="b00895"></a>
## b00895 — word/document\.xml/body/\*\[895\]

```text
Figure: Work Insight Screen
```

<a id="b00896"></a>
## b00896 — word/document\.xml/body/\*\[896\]

```text
		Work Priority
```

<a id="b00897"></a>
## b00897 — word/document\.xml/body/\*\[897\]

```text

```

<a id="b00898"></a>
## b00898 — word/document\.xml/body/\*\[898\]

```text
SCALE allows system directed tasks to be assigned in one of two ways:
```

<a id="b00899"></a>
## b00899 — word/document\.xml/body/\*\[899\]

```text

```

<a id="b00900"></a>
## b00900 — word/document\.xml/body/\*\[900\]

```text
Priority/Location/FIFO
```

<a id="b00901"></a>
## b00901 — word/document\.xml/body/\*\[901\]

```text
Location/Priority/FIFO
```

<a id="b00902"></a>
## b00902 — word/document\.xml/body/\*\[902\]

```text

```

<a id="b00903"></a>
## b00903 — word/document\.xml/body/\*\[903\]

```text
The above defines the sort order that system directed tasks will be assigned to users within the warehouse. Within this structure the “priority” portion from above can be critical. Most tasks will need to be created with the same priority so that they are truly processed by proximity. However, over time Travis may want to bump up the priority of certain tasks which can be accomplished through the use of the Work Priority Escalation Scheduled Job.  
```

<a id="b00904"></a>
## b00904 — word/document\.xml/body/\*\[904\]

```text

```

<a id="b00905"></a>
## b00905 — word/document\.xml/body/\*\[905\]

```text
PICKING
```

<a id="b00906"></a>
## b00906 — word/document\.xml/body/\*\[906\]

```text

```

<a id="b00907"></a>
## b00907 — word/document\.xml/body/\*\[907\]

```text
For all picking at Travis, work will be executed via VoCollect. As part of the conversion to Active SCALE, Travis would like to increase the facility’s accuracy when picking items which may be stored in inconsistent quantities (IE case of 10 and case of 25). In order to accomplish this, two changes will be made to the existing 2016 workflows:
```

<a id="b00908"></a>
## b00908 — word/document\.xml/body/\*\[908\]

```text

```

<a id="b00909"></a>
## b00909 — word/document\.xml/body/\*\[909\]

```text
We will add Text Message Assignment for any item that is known to be stored in mixed case quantities
```

<a id="b00910"></a>
## b00910 — word/document\.xml/body/\*\[910\]

```text
These text messages will be defined in configurations and will be spoken to the user during VoCollect picking whenever they are picking an item which has a text message assignment configured. This message can be used to warn the user to double check the case quantity on the item prior to completing their pick. 
```

<a id="b00911"></a>
## b00911 — word/document\.xml/body/\*\[911\]

```text
Add VAS assignment to any container which contains an item that comes in mixed case quantities 
```

<a id="b00912"></a>
## b00912 — word/document\.xml/body/\*\[912\]

```text
Specifics defined in Section 17.1
```

<a id="b00913"></a>
## b00913 — word/document\.xml/body/\*\[913\]

```text

```

<a id="b00914"></a>
## b00914 — word/document\.xml/body/\*\[914\]

```text
Using the above processes, we should be able to minimize the errors in picking these items and in turn, minimize the rework required when orders containing these items are processed through the OV Stations. 
```

<a id="b00915"></a>
## b00915 — word/document\.xml/body/\*\[915\]

```text

```

<a id="b00916"></a>
## b00916 — word/document\.xml/body/\*\[916\]

```text
		Full Pallet Picking
```

<a id="b00917"></a>
## b00917 — word/document\.xml/body/\*\[917\]

```text

```

<a id="b00918"></a>
## b00918 — word/document\.xml/body/\*\[918\]

```text
Assumptions:
```

<a id="b00919"></a>
## b00919 — word/document\.xml/body/\*\[919\]

```text
Containers are created in Wave.
```

<a id="b00920"></a>
## b00920 — word/document\.xml/body/\*\[920\]

```text
Full UM Pallet Containers
```

<a id="b00921"></a>
## b00921 — word/document\.xml/body/\*\[921\]

```text
One Work Unit is created per pallet.
```

<a id="b00922"></a>
## b00922 — word/document\.xml/body/\*\[922\]

```text
Wave Labels (Container Contents Labels) will be manually printed for any full pallet pick as these would not run through the Pack Size process.
```

<a id="b00923"></a>
## b00923 — word/document\.xml/body/\*\[923\]

```text
All picking operations will be completed via VoCollect. 
```

<a id="b00924"></a>
## b00924 — word/document\.xml/body/\*\[924\]

```text

```

<a id="b00925"></a>
## b00925 — word/document\.xml/body/\*\[925\]

```text
Travis utilizes container creation as a part of the Full Pallet Picking flow. In order to most efficiently pick the larger LTL/TL orders, Travis will create full UM pallet containers based on the quantity requested for the shipment. Any Full Pallet pick will fall under the Full Pallet Picking work type which will have one Work Unit created per pallet. 
```

<a id="b00926"></a>
## b00926 — word/document\.xml/body/\*\[926\]

```text

```

<a id="b00927"></a>
## b00927 — word/document\.xml/body/\*\[927\]

```text
All picking work will be executed via VoCollect for Travis. 
```

<a id="b00928"></a>
## b00928 — word/document\.xml/body/\*\[928\]

```text

```

<a id="b00929"></a>
## b00929 — word/document\.xml/body/\*\[929\]

```text
After the picks are complete, the user will confirm the putaway to the packing/OV location. 
```

<a id="b00930"></a>
## b00930 — word/document\.xml/body/\*\[930\]

```text

```

<a id="b00931"></a>
## b00931 — word/document\.xml/body/\*\[931\]

```text
		Case Picking
```

<a id="b00932"></a>
## b00932 — word/document\.xml/body/\*\[932\]

```text

```

<a id="b00933"></a>
## b00933 — word/document\.xml/body/\*\[933\]

```text
Assumptions:
```

<a id="b00934"></a>
## b00934 — word/document\.xml/body/\*\[934\]

```text
Containers are created in Wave
```

<a id="b00935"></a>
## b00935 — word/document\.xml/body/\*\[935\]

```text
Full CS UMs
```

<a id="b00936"></a>
## b00936 — word/document\.xml/body/\*\[936\]

```text
One Work Unit is created per case
```

<a id="b00937"></a>
## b00937 — word/document\.xml/body/\*\[937\]

```text
Wave Labels (Container Contents Labels) will be printed manually or via Pack Size depending on how the wave is processed by the user
```

<a id="b00938"></a>
## b00938 — word/document\.xml/body/\*\[938\]

```text
All picking operations will be completed via VoCollect. 
```

<a id="b00939"></a>
## b00939 — word/document\.xml/body/\*\[939\]

```text

```

<a id="b00940"></a>
## b00940 — word/document\.xml/body/\*\[940\]

```text
Travis will utilize container creation as a part of the Case Picking flow. For any shipment line where the item can ship alone (TAL = N), Travis would like to create one Work Unit per case for picking. 
```

<a id="b00941"></a>
## b00941 — word/document\.xml/body/\*\[941\]

```text

```

<a id="b00942"></a>
## b00942 — word/document\.xml/body/\*\[942\]

```text
All picking work will be executed via VoCollect for Travis. 
```

<a id="b00943"></a>
## b00943 — word/document\.xml/body/\*\[943\]

```text

```

<a id="b00944"></a>
## b00944 — word/document\.xml/body/\*\[944\]

```text
After the picks are complete, the user will confirm the putaway to the packing/OV location. 
```

<a id="b00945"></a>
## b00945 — word/document\.xml/body/\*\[945\]

```text

```

<a id="b00946"></a>
## b00946 — word/document\.xml/body/\*\[946\]

```text

```

<a id="b00947"></a>
## b00947 — word/document\.xml/body/\*\[947\]

```text

```

<a id="b00948"></a>
## b00948 — word/document\.xml/body/\*\[948\]

```text
		Each Picking
```

<a id="b00949"></a>
## b00949 — word/document\.xml/body/\*\[949\]

```text

```

<a id="b00950"></a>
## b00950 — word/document\.xml/body/\*\[950\]

```text
Assumptions:
```

<a id="b00951"></a>
## b00951 — word/document\.xml/body/\*\[951\]

```text
Containers are created in Wave for the loose items to be picked into
```

<a id="b00952"></a>
## b00952 — word/document\.xml/body/\*\[952\]

```text
One Work Unit is created per container 
```

<a id="b00953"></a>
## b00953 — word/document\.xml/body/\*\[953\]

```text
Wave Labels (Container Contents Labels) will be printed manually or via Pack Size depending on how the wave is processed by the user
```

<a id="b00954"></a>
## b00954 — word/document\.xml/body/\*\[954\]

```text

```

<a id="b00955"></a>
## b00955 — word/document\.xml/body/\*\[955\]

```text
Travis will utilize container creation for loose item picking. Containers will be created in wave for any loose items which require packing prior to shipping (TAL = Y). One Work Unit will be created per container and all picks will be sequenced according to the configured pick sequence values on the locations. 
```

<a id="b00956"></a>
## b00956 — word/document\.xml/body/\*\[956\]

```text

```

<a id="b00957"></a>
## b00957 — word/document\.xml/body/\*\[957\]

```text
All picking work will be executed via VoCollect for Travis. 
```

<a id="b00958"></a>
## b00958 — word/document\.xml/body/\*\[958\]

```text

```

<a id="b00959"></a>
## b00959 — word/document\.xml/body/\*\[959\]

```text
After the picks are complete, the user will confirm the putaway to the packing/OV location. 
```

<a id="b00960"></a>
## b00960 — word/document\.xml/body/\*\[960\]

```text

```

<a id="b00961"></a>
## b00961 — word/document\.xml/body/\*\[961\]

```text
PACKING
```

<a id="b00962"></a>
## b00962 — word/document\.xml/body/\*\[962\]

```text

```

<a id="b00963"></a>
## b00963 — word/document\.xml/body/\*\[963\]

```text
		VAS (Value Added Services)
```

<a id="b00964"></a>
## b00964 — word/document\.xml/body/\*\[964\]

```text

```

<a id="b00965"></a>
## b00965 — word/document\.xml/body/\*\[965\]

```text
As part of the conversion to Active SCALE, Travis would like to incorporate VAS Assignment into the Wave Flow to help resolve an ongoing issue with items that can be stored in inconsistent case quantities (IE sometimes a case is 10 and sometimes it is 25). To attempt to catch shipping errors before the goods leave the facility, Aaron’s will provide a list of all items known to arrive in mixed case quantities and this will be used to configure VAS Assignment Criteria. The assignment criteria will assign VAS to any container created which contains an item known to come in mixed quantities and this VAS will allow the user to double check the product during the OV process. 
```

<a id="b00966"></a>
## b00966 — word/document\.xml/body/\*\[966\]

```text

```

<a id="b00967"></a>
## b00967 — word/document\.xml/body/\*\[967\]

```text
Note: VAS can be assigned only when containers are created in Wave. 
```

<a id="b00968"></a>
## b00968 — word/document\.xml/body/\*\[968\]

```text

```

<a id="b00969"></a>
## b00969 — word/document\.xml/body/\*\[969\]

```text
VAS functionality is managed within SCALE as shown below – 
```

<a id="b00970"></a>
## b00970 — word/document\.xml/body/\*\[970\]

```text

```

<a id="b00971"></a>
## b00971 — word/document\.xml/body/\*\[971\]

```text
For any container that has a VAS Activity assigned, the user will start the VAS process by selecting the VAS Insight Screen from the main SCALE Menu:
```

<a id="b00972"></a>
## b00972 — word/document\.xml/body/\*\[972\]

```text

```

<a id="b00973"></a>
## b00973 — word/document\.xml/body/\*\[973\]

```text

```

<a id="b00974"></a>
## b00974 — word/document\.xml/body/\*\[974\]

```text
Figure: VAS Insight Screen
```

<a id="b00975"></a>
## b00975 — word/document\.xml/body/\*\[975\]

```text
Next the user scans/types the Container ID of the given carton and is presented with the required VAS Activity. Once complete, the user checks the confirmed check box and clicks on the ‘Confirm’ action to indicate VAS is complete and the carton is ready to enter the packing (close carton) process flow. 
```

<a id="b00976"></a>
## b00976 — word/document\.xml/body/\*\[976\]

```text

```

<a id="b00977"></a>
## b00977 — word/document\.xml/body/\*\[977\]

```text
		QC Process (Order Verification/OV)
```

<a id="b00978"></a>
## b00978 — word/document\.xml/body/\*\[978\]

```text

```

<a id="b00979"></a>
## b00979 — word/document\.xml/body/\*\[979\]

```text
For Travis, all containers created during waving will be flagged for Outbound QC. Containers may also be manually flagged for outbound QC at any time via Full Screen Shipping Container Insight.  
```

<a id="b00980"></a>
## b00980 — word/document\.xml/body/\*\[980\]

```text

```

<a id="b00981"></a>
## b00981 — word/document\.xml/body/\*\[981\]

```text
Note: QC can be assigned automatically only when containers are created in Wave. 
```

<a id="b00982"></a>
## b00982 — word/document\.xml/body/\*\[982\]

```text
QC Confirmation – Insight Screen
```

<a id="b00983"></a>
## b00983 — word/document\.xml/body/\*\[983\]

```text

```

<a id="b00984"></a>
## b00984 — word/document\.xml/body/\*\[984\]

```text
QC Assignment – Manually (Insight Screens):
```

<a id="b00985"></a>
## b00985 — word/document\.xml/body/\*\[985\]

```text

```

<a id="b00986"></a>
## b00986 — word/document\.xml/body/\*\[986\]

```text
If a supervisor chooses to mark a container for QC, then supervisor will scan the Container ID from container content label in the Shipping Container Insight screen and search for the container. On the container record, the user will mark the container for QC via the Actions menu. Now this container must go through the QC verification process.
```

<a id="b00987"></a>
## b00987 — word/document\.xml/body/\*\[987\]

```text

```

<a id="b00988"></a>
## b00988 — word/document\.xml/body/\*\[988\]

```text

```

<a id="b00989"></a>
## b00989 — word/document\.xml/body/\*\[989\]

```text

```

<a id="b00990"></a>
## b00990 — word/document\.xml/body/\*\[990\]

```text

```

<a id="b00991"></a>
## b00991 — word/document\.xml/body/\*\[991\]

```text

```

<a id="b00992"></a>
## b00992 — word/document\.xml/body/\*\[992\]

```text
QC Execution (Insight Screens):
```

<a id="b00993"></a>
## b00993 — word/document\.xml/body/\*\[993\]

```text

```

<a id="b00994"></a>
## b00994 — word/document\.xml/body/\*\[994\]

```text
If a container requires QC, the user scans the Container ID from the Container Content Label in the QC Workbench.  Next the user scans each item (grocery style scanning).  Once all items in the container are scanned, the user clicks the ‘Confirm’ button.  
```

<a id="b00995"></a>
## b00995 — word/document\.xml/body/\*\[995\]

```text

```

<a id="b00996"></a>
## b00996 — word/document\.xml/body/\*\[996\]

```text
Note: QC execution/assignment on the RF device via Warehouse Mobile is not yet available. Currently, QC execution will need to be handled via the QC Workbench from a full screen workstation which aligns with the current procedures at Travis. 
```

<a id="b00997"></a>
## b00997 — word/document\.xml/body/\*\[997\]

```text

```

<a id="b00998"></a>
## b00998 — word/document\.xml/body/\*\[998\]

```text

```

<a id="b00999"></a>
## b00999 — word/document\.xml/body/\*\[999\]

```text
Figure: QC Workbench
```

<a id="b01000"></a>
## b01000 — word/document\.xml/body/\*\[1000\]

```text
If the items and quantities scanned match the system expected quantities, the user receives a message that QC was successful.  If not, the user receives a message that QC failed and need to provide reason codes for any missing quantities. These reason codes are configurable by Travis to record things such as damaged item, incorrect item, etc.  The user needs to correct any failures and successfully pass QC before continuing to Close Container.
```

<a id="b01001"></a>
## b01001 — word/document\.xml/body/\*\[1001\]

```text

```

<a id="b01002"></a>
## b01002 — word/document\.xml/body/\*\[1002\]

```text
Once the container passes QC, user will return the container to the normal process flow where it will be added to a MOP if it belongs to an LTL order or moved to the Dock Door for parcel orders. 
```

<a id="b01003"></a>
## b01003 — word/document\.xml/body/\*\[1003\]

```text

```

<a id="b01004"></a>
## b01004 — word/document\.xml/body/\*\[1004\]

```text

```

<a id="b01005"></a>
## b01005 — word/document\.xml/body/\*\[1005\]

```text
Figure: QC Reason Codes
```

<a id="b01006"></a>
## b01006 — word/document\.xml/body/\*\[1006\]

```text
		Close Container 
```

<a id="b01007"></a>
## b01007 — word/document\.xml/body/\*\[1007\]

```text

```

<a id="b01008"></a>
## b01008 — word/document\.xml/body/\*\[1008\]

```text
To advance the status on the container and to identify that the container is packed, and no other item is put into it, the user will use the close container option.
```

<a id="b01009"></a>
## b01009 — word/document\.xml/body/\*\[1009\]

```text

```

<a id="b01010"></a>
## b01010 — word/document\.xml/body/\*\[1010\]

```text
For Travis, all orders both parcel and LTL, need to have the close container option completed to advance the status of container. 
```

<a id="b01011"></a>
## b01011 — word/document\.xml/body/\*\[1011\]

```text

```

<a id="b01012"></a>
## b01012 — word/document\.xml/body/\*\[1012\]

```text
Parcel
```

<a id="b01013"></a>
## b01013 — word/document\.xml/body/\*\[1013\]

```text
Close Container will be performed in the Packing location after it has passed through the OV Station
```

<a id="b01014"></a>
## b01014 — word/document\.xml/body/\*\[1014\]

```text
Close Container for parcel orders (UPS) will trigger the printing of the Shipping Label (LBL03) 
```

<a id="b01015"></a>
## b01015 — word/document\.xml/body/\*\[1015\]

```text
As each detail line is packed complete, EX-XX will be triggered and result in the printing of the 1348 Form (DOC02) configured in the Travis SSRS environment
```

<a id="b01016"></a>
## b01016 — word/document\.xml/body/\*\[1016\]

```text

```

<a id="b01017"></a>
## b01017 — word/document\.xml/body/\*\[1017\]

```text

```

<a id="b01018"></a>
## b01018 — word/document\.xml/body/\*\[1018\]

```text
LTL
```

<a id="b01019"></a>
## b01019 — word/document\.xml/body/\*\[1019\]

```text
Close Container will be performed in the LTL flow prior to the containers being added to MOPs and transferred to the Dock Doors
```

<a id="b01020"></a>
## b01020 — word/document\.xml/body/\*\[1020\]

```text
Close Container will be used to print the Vendor Labels (LBL04) for LTL/TL shipments
```

<a id="b01021"></a>
## b01021 — word/document\.xml/body/\*\[1021\]

```text
Close Container Operation
```

<a id="b01022"></a>
## b01022 — word/document\.xml/body/\*\[1022\]

```text

```

<a id="b01023"></a>
## b01023 — word/document\.xml/body/\*\[1023\]

```text
The user accesses the Close Container option from the Close Container Insight Screen or Warehouse Mobile to close the container.  The user scans the Container ID from the Container Contents Label.  The screen will update with the shipment and container information.  If necessary, the user changes the container type from the dropdown.  User will click on the ‘Close’ option to confirm closing of the container.  If the container gets successfully closed, SCALE updates the container status to ‘Ship Confirm Pending’ (Parcel) or ‘Loading Pending’ (LTL/TL shipments) based on the custom status flow assigned at the detail level. 
```

<a id="b01024"></a>
## b01024 — word/document\.xml/body/\*\[1024\]

```text

```

<a id="b01025"></a>
## b01025 — word/document\.xml/body/\*\[1025\]

```text

```

<a id="b01026"></a>
## b01026 — word/document\.xml/body/\*\[1026\]

```text
Figure: Close Container Screen
```

<a id="b01027"></a>
## b01027 — word/document\.xml/body/\*\[1027\]

```text
		Shipping Container Insight
```

<a id="b01028"></a>
## b01028 — word/document\.xml/body/\*\[1028\]

```text

```

<a id="b01029"></a>
## b01029 — word/document\.xml/body/\*\[1029\]

```text
If necessary, Shipping Container Insight can be used to modify the contents of the Shipping Container.  The user can update the quantity to pack to 0 for any items needing to be unpacked from a container.  Once unpacked, the user can repack into new containers using the Packing screen.   
```

<a id="b01030"></a>
## b01030 — word/document\.xml/body/\*\[1030\]

```text

```

<a id="b01031"></a>
## b01031 — word/document\.xml/body/\*\[1031\]

```text
If user doesn’t have a Container ID to scan but still must perform the close container action, then they will use the Shipping Container Insight screen and filter based on the Shipment ID. From the Container Insight, users can select the Container ID and then use the ‘Close’ Action to close the container.
```

<a id="b01032"></a>
## b01032 — word/document\.xml/body/\*\[1032\]

```text

```

<a id="b01033"></a>
## b01033 — word/document\.xml/body/\*\[1033\]

```text

```

<a id="b01034"></a>
## b01034 — word/document\.xml/body/\*\[1034\]

```text
Figure: Shipping Container Insight
```

<a id="b01035"></a>
## b01035 — word/document\.xml/body/\*\[1035\]

```text

```

<a id="b01036"></a>
## b01036 — word/document\.xml/body/\*\[1036\]

```text

```

<a id="b01037"></a>
## b01037 — word/document\.xml/body/\*\[1037\]

```text
Figure: Shipping Container Insight with Close Container Option
```

<a id="b01038"></a>
## b01038 — word/document\.xml/body/\*\[1038\]

```text
Note: In order to edit container contents, a container must be in the Packing location.

```

<a id="b01039"></a>
## b01039 — word/document\.xml/body/\*\[1039\]

```text
Carrier Assignment
```

<a id="b01040"></a>
## b01040 — word/document\.xml/body/\*\[1040\]

```text

```

<a id="b01041"></a>
## b01041 — word/document\.xml/body/\*\[1041\]

```text
If there are exception scenarios and the warehouse operations team needs to change the carrier, then the user will use the Shipment Insight screen and utilize the ‘Edit’ option to change the carrier assigned. 
```

<a id="b01042"></a>
## b01042 — word/document\.xml/body/\*\[1042\]

```text

```

<a id="b01043"></a>
## b01043 — word/document\.xml/body/\*\[1043\]

```text
Alternatively, if a Shipping Load already exists for the correct carrier, the ‘Transfer Shipment’ option can be used to move a shipment from one load to another. The user will be presented with an option to provide the destination shipping load. If the user knows the load number, then they can enter the shipping load number and SCALE will transfer the shipment to that load (which will update the carrier to the carrier for the destination load). 
```

<a id="b01044"></a>
## b01044 — word/document\.xml/body/\*\[1044\]

```text

```

<a id="b01045"></a>
## b01045 — word/document\.xml/body/\*\[1045\]

```text
If the load is not known, then user can select to create a new load and select the carrier for the new load. SCALE will create the new load and then transfer the shipment to the new load.
```

<a id="b01046"></a>
## b01046 — word/document\.xml/body/\*\[1046\]

```text

```

<a id="b01047"></a>
## b01047 — word/document\.xml/body/\*\[1047\]

```text

```

<a id="b01048"></a>
## b01048 — word/document\.xml/body/\*\[1048\]

```text
Figure: Shipment Insight – Transfer Shipment Option
```

<a id="b01049"></a>
## b01049 — word/document\.xml/body/\*\[1049\]

```text

```

<a id="b01050"></a>
## b01050 — word/document\.xml/body/\*\[1050\]

```text
Figure: Transfer Shipment Option – Enter Destination Load Number
```

<a id="b01051"></a>
## b01051 — word/document\.xml/body/\*\[1051\]

```text

```

<a id="b01052"></a>
## b01052 — word/document\.xml/body/\*\[1052\]

```text
Figure: Transfer Shipment Option – Create a New Load
```

<a id="b01053"></a>
## b01053 — word/document\.xml/body/\*\[1053\]

```text

```

<a id="b01054"></a>
## b01054 — word/document\.xml/body/\*\[1054\]

```text

```

<a id="b01055"></a>
## b01055 — word/document\.xml/body/\*\[1055\]

```text

```

<a id="b01056"></a>
## b01056 — word/document\.xml/body/\*\[1056\]

```text

```

<a id="b01057"></a>
## b01057 — word/document\.xml/body/\*\[1057\]

```text
DOCK MANAGEMENT
```

<a id="b01058"></a>
## b01058 — word/document\.xml/body/\*\[1058\]

```text

```

<a id="b01059"></a>
## b01059 — word/document\.xml/body/\*\[1059\]

```text
Dock Management will be a primarily manual task at Travis. 
```

<a id="b01060"></a>
## b01060 — word/document\.xml/body/\*\[1060\]

```text

```

<a id="b01061"></a>
## b01061 — word/document\.xml/body/\*\[1061\]

```text
					Load Creation
```

<a id="b01062"></a>
## b01062 — word/document\.xml/body/\*\[1062\]

```text

```

<a id="b01063"></a>
## b01063 — word/document\.xml/body/\*\[1063\]

```text
Travis will utilize load building as part of waving. SCALE will create shipping loads in the wave based on the below criteria:
```

<a id="b01064"></a>
## b01064 — word/document\.xml/body/\*\[1064\]

```text

```

<a id="b01065"></a>
## b01065 — word/document\.xml/body/\*\[1065\]

```text
Scheduled Ship Date
```

<a id="b01066"></a>
## b01066 — word/document\.xml/body/\*\[1066\]

```text
Carrier
```

<a id="b01067"></a>
## b01067 — word/document\.xml/body/\*\[1067\]

```text
Route
```

<a id="b01068"></a>
## b01068 — word/document\.xml/body/\*\[1068\]

```text

```

<a id="b01069"></a>
## b01069 — word/document\.xml/body/\*\[1069\]

```text
This means that for a given wave, SCALE will likely create multiple shipping loads for the various carriers assigned to the shipments on the wave. 
```

<a id="b01070"></a>
## b01070 — word/document\.xml/body/\*\[1070\]

```text

```

<a id="b01071"></a>
## b01071 — word/document\.xml/body/\*\[1071\]

```text
Note: Various service levels are not broken into separate loads unless they are entered in SCALE as unique carriers. IE – UPS Ground and UPS Express would build to the same Shipping Load in SCALE provided the carrier in both cases is ‘UPS’ and the service level is separated into the Carrier Service field in SCALE. 
```

<a id="b01072"></a>
## b01072 — word/document\.xml/body/\*\[1072\]

```text

```

<a id="b01073"></a>
## b01073 — word/document\.xml/body/\*\[1073\]

```text
					Dock Door/Staging Lane Assignment
```

<a id="b01074"></a>
## b01074 — word/document\.xml/body/\*\[1074\]

```text

```

<a id="b01075"></a>
## b01075 — word/document\.xml/body/\*\[1075\]

```text
Travis will manage Dock Door and Staging Lane assignment in the following fashion:
```

<a id="b01076"></a>
## b01076 — word/document\.xml/body/\*\[1076\]

```text

```

<a id="b01077"></a>
## b01077 — word/document\.xml/body/\*\[1077\]

```text
Manual
```

<a id="b01078"></a>
## b01078 — word/document\.xml/body/\*\[1078\]

```text
Users will make the dock door/staging lane decision manually via the Immediate Dock Transfer (IDT) process. 
```

<a id="b01079"></a>
## b01079 — word/document\.xml/body/\*\[1079\]

```text

```

<a id="b01080"></a>
## b01080 — word/document\.xml/body/\*\[1080\]

```text
LOAD CONFIRMATION
```

<a id="b01081"></a>
## b01081 — word/document\.xml/body/\*\[1081\]

```text

```

<a id="b01082"></a>
## b01082 — word/document\.xml/body/\*\[1082\]

```text
		Processing
```

<a id="b01083"></a>
## b01083 — word/document\.xml/body/\*\[1083\]

```text

```

<a id="b01084"></a>
## b01084 — word/document\.xml/body/\*\[1084\]

```text
Personnel use the Shipping Load Insight or Shipment Insight options to monitor the status of shipments and loads. Once all shipments for a Load are in Ship Confirm Pending status, the Load can be confirmed.  To Confirm the Load, a user selects the Load and uses the ‘Confirm’ action in Shipping Load Insight.  
```

<a id="b01085"></a>
## b01085 — word/document\.xml/body/\*\[1085\]

```text

```

<a id="b01086"></a>
## b01086 — word/document\.xml/body/\*\[1086\]

```text

```

<a id="b01087"></a>
## b01087 — word/document\.xml/body/\*\[1087\]

```text
Figure: Shipping Load Insight
```

<a id="b01088"></a>
## b01088 — word/document\.xml/body/\*\[1088\]

```text
Once a load has been confirmed, all statuses (load, shipments, details, containers) are moved to Closed and inventory is relieved from the Shipping Dock (is officially out of the building).
```

<a id="b01089"></a>
## b01089 — word/document\.xml/body/\*\[1089\]

```text

```

<a id="b01090"></a>
## b01090 — word/document\.xml/body/\*\[1090\]

```text
Bill of Lading (DOC03) can be manually printed for all shipments on a given Load as part of the Load Confirmation process. This document can also be printed manually at any time from Shipment Insight/Shipping Load Insight. 
```

<a id="b01091"></a>
## b01091 — word/document\.xml/body/\*\[1091\]

```text

```

<a id="b01092"></a>
## b01092 — word/document\.xml/body/\*\[1092\]

```text
PARCEL MANIFESTING PROCESSING
```

<a id="b01093"></a>
## b01093 — word/document\.xml/body/\*\[1093\]

```text

```

<a id="b01094"></a>
## b01094 — word/document\.xml/body/\*\[1094\]

```text
All parcel manifest processing is executed from the Manifest Insight screen. Users can view any pertinent manifest information from this screen. FedEx is excluded from this screen as there is no end of day processing necessary for FedEx since the manifest data is automatically transmitted every two hours.
```

<a id="b01095"></a>
## b01095 — word/document\.xml/body/\*\[1095\]

```text

```

<a id="b01096"></a>
## b01096 — word/document\.xml/body/\*\[1096\]

```text
					End of Day Processing
```

<a id="b01097"></a>
## b01097 — word/document\.xml/body/\*\[1097\]

```text

```

<a id="b01098"></a>
## b01098 — word/document\.xml/body/\*\[1098\]

```text
Manifests can be closed at the end of the day by clicking on a Manifest from the Manifest Insight and choosing the Close option.  Rating Systems Value “Allow Multiple Manifests per Day” is set to Yes. 
```

<a id="b01099"></a>
## b01099 — word/document\.xml/body/\*\[1099\]

```text

```

<a id="b01100"></a>
## b01100 — word/document\.xml/body/\*\[1100\]

```text

```

<a id="b01101"></a>
## b01101 — word/document\.xml/body/\*\[1101\]

```text
Figure: Manifest Insight Screen
```

<a id="b01102"></a>
## b01102 — word/document\.xml/body/\*\[1102\]

```text
					Printing
```

<a id="b01103"></a>
## b01103 — word/document\.xml/body/\*\[1103\]

```text

```

<a id="b01104"></a>
## b01104 — word/document\.xml/body/\*\[1104\]

```text
Required documents can also be printed from the Manifest Insight. These documents can print out automatically when closing the manifest or be printed manually.
```

<a id="b01105"></a>
## b01105 — word/document\.xml/body/\*\[1105\]

```text

```

<a id="b01106"></a>
## b01106 — word/document\.xml/body/\*\[1106\]

```text
The documents include: 
```

<a id="b01107"></a>
## b01107 — word/document\.xml/body/\*\[1107\]

```text

```

<a id="b01108"></a>
## b01108 — word/document\.xml/body/\*\[1108\]

```text
Container Manifest
```

<a id="b01109"></a>
## b01109 — word/document\.xml/body/\*\[1109\]

```text
UPS Summary Label
```

<a id="b01110"></a>
## b01110 — word/document\.xml/body/\*\[1110\]

```text

```

<a id="b01111"></a>
## b01111 — word/document\.xml/body/\*\[1111\]

```text
Once a Manifest has been closed, the Manifest is no longer open to receive additional containers; all additional containers manifested for that day are put on a new manifest, and Electronic Manifest is sent to Parcel Carrier.  
```

<a id="b01112"></a>
## b01112 — word/document\.xml/body/\*\[1112\]

```text

```

<a id="b01113"></a>
## b01113 — word/document\.xml/body/\*\[1113\]

```text
Note: Containers on closed manifests may not be changed.

```

<a id="b01114"></a>
## b01114 — word/document\.xml/body/\*\[1114\]

```text
V.	Performance Management SUMMARY
```

<a id="b01115"></a>
## b01115 — word/document\.xml/body/\*\[1115\]

```text

```

<a id="b01116"></a>
## b01116 — word/document\.xml/body/\*\[1116\]

```text
REPORTING REQUIREMENTS 
```

<a id="b01117"></a>
## b01117 — word/document\.xml/body/\*\[1117\]

```text

```

<a id="b01118"></a>
## b01118 — word/document\.xml/body/\*\[1118\]

```text

```

<a id="b01119"></a>
## b01119 — word/document\.xml/body/\*\[1119\]

```text

```

<a id="b01120"></a>
## b01120 — word/document\.xml/body/\*\[1120\]

```text

```

<a id="b01121"></a>
## b01121 — word/document\.xml/body/\*\[1121\]

```text


```

<a id="b01122"></a>
## b01122 — word/document\.xml/body/\*\[1122\]

```text
VI.	SYSTEM MODIFICATIONS
```

<a id="b01123"></a>
## b01123 — word/document\.xml/body/\*\[1123\]

```text

```

<a id="b01124"></a>
## b01124 — word/document\.xml/body/\*\[1124\]

```text
Extensions
```

<a id="b01125"></a>
## b01125 — word/document\.xml/body/\*\[1125\]

```text

```

<a id="b01126"></a>
## b01126 — word/document\.xml/body/\*\[1126\]

```text
		Ext			Description			Approved?
		EX01			Custom Item Balance (Will handle displaying mixed inventory statuses at the Shipping Dock locations)			Approved
								
```

<a id="b01127"></a>
## b01127 — word/document\.xml/body/\*\[1127\]

```text

```

<a id="b01128"></a>
## b01128 — word/document\.xml/body/\*\[1128\]

```text
		Documents
```

<a id="b01129"></a>
## b01129 — word/document\.xml/body/\*\[1129\]

```text
		
```

<a id="b01130"></a>
## b01130 — word/document\.xml/body/\*\[1130\]

```text
		Modification			Description
		DOC01			Receiving Worksheet
		DOC02			1348 Form
		DOC03			Bill of Lading
```

<a id="b01131"></a>
## b01131 — word/document\.xml/body/\*\[1131\]

```text
		
```

<a id="b01132"></a>
## b01132 — word/document\.xml/body/\*\[1132\]

```text
		Labels
```

<a id="b01133"></a>
## b01133 — word/document\.xml/body/\*\[1133\]

```text
		
```

<a id="b01134"></a>
## b01134 — word/document\.xml/body/\*\[1134\]

```text
		Modification			Description
		LBL01			Receipt Container Label
		LBL02			Container Contents Label
		LBL03			Parcel Shipping Label
		LBL04			Vendor Label
```

<a id="b01135"></a>
## b01135 — word/document\.xml/body/\*\[1135\]

```text
		
```

<a id="b01136"></a>
## b01136 — word/document\.xml/body/\*\[1136\]

```text
		Exit Point
```

<a id="b01137"></a>
## b01137 — word/document\.xml/body/\*\[1137\]

```text
		
```

<a id="b01138"></a>
## b01138 — word/document\.xml/body/\*\[1138\]

```text
		Modification			Description
		EXP01			Work Creation – After (used for wiping P&D on transfer into R1 locations)
					
```

<a id="b01139"></a>
## b01139 — word/document\.xml/body/\*\[1139\]

```text

```

<a id="b01140"></a>
## b01140 — word/document\.xml/body/\*\[1140\]

```text

```

<a id="b01141"></a>
## b01141 — word/document\.xml/body/\*\[1141\]

```text
		Override Data Wave Steps
```

<a id="b01142"></a>
## b01142 — word/document\.xml/body/\*\[1142\]

```text
		
```

<a id="b01143"></a>
## b01143 — word/document\.xml/body/\*\[1143\]

```text
		ODWS			Description
					
```

<a id="b01144"></a>
## b01144 — word/document\.xml/body/\*\[1144\]

```text

VII.	OPEN ISSUES
```

<a id="b01145"></a>
## b01145 — word/document\.xml/body/\*\[1145\]

```text

```

<a id="b01146"></a>
## b01146 — word/document\.xml/body/\*\[1146\]

```text
See comments throughout document. In later iterations of this document, we will move current issues into this section. 
```

<a id="b01147"></a>
## b01147 — word/document\.xml/body/\*\[1147\]

```text


```

<a id="b01148"></a>
## b01148 — word/document\.xml/body/\*\[1148\]

```text
VIII.	RESOLVED ISSUES
```

<a id="b01149"></a>
## b01149 — word/document\.xml/body/\*\[1149\]

```text

```

<a id="b01150"></a>
## b01150 — word/document\.xml/body/\*\[1150\]

```text

```

<a id="b01151"></a>
## b01151 — word/document\.xml/body/\*\[1151\]

```text

```

<a id="b01152"></a>
## b01152 — word/document\.xml/body/\*\[1152\]

```text

```

<a id="b01153"></a>
## b01153 — word/document\.xml/body/\*\[1153\]

```text

```

<a id="b01154"></a>
## b01154 — word/document\.xml/body/\*\[1154\]

```text

```

<a id="b01155"></a>
## b01155 — word/document\.xml/body/\*\[1155\]

```text

```

<a id="b01156"></a>
## b01156 — word/document\.xml/body/\*\[1156\]

```text

```

<a id="b01157"></a>
## b01157 — word/document\.xml/body/\*\[1157\]

```text

```

<a id="b01158"></a>
## b01158 — word/document\.xml/body/\*\[1158\]

```text


```

<a id="b01159"></a>
## b01159 — word/document\.xml/body/\*\[1159\]

```text
APPENDIX A - KEY CONFIGURATIONS
```

<a id="b01160"></a>
## b01160 — word/document\.xml/body/\*\[1160\]

```text

```

<a id="b01161"></a>
## b01161 — word/document\.xml/body/\*\[1161\]

```text
SCALE has various configurations that are key to defining processes and functionality in the system. Some of these are system wide values and others are functional area specific. This section outlines these key configurations.
```

<a id="b01162"></a>
## b01162 — word/document\.xml/body/\*\[1162\]

```text

```

<a id="b01163"></a>
## b01163 — word/document\.xml/body/\*\[1163\]

```text
			SYSTEM KEY CONFIGURATION OVERVIEW
```

<a id="b01164"></a>
## b01164 — word/document\.xml/body/\*\[1164\]

```text

```

<a id="b01165"></a>
## b01165 — word/document\.xml/body/\*\[1165\]

```text
SCALE has sets of system values for various functional areas that define how the system interacts with users for these areas. This part of the documents outlines the key values and discusses why the values are set the way they are.
```

<a id="b01166"></a>
## b01166 — word/document\.xml/body/\*\[1166\]

```text

```

<a id="b01167"></a>
## b01167 — word/document\.xml/body/\*\[1167\]

```text
			Inventory Control System Values
```

<a id="b01168"></a>
## b01168 — word/document\.xml/body/\*\[1168\]

```text
Inventory Control system values direct the way the system validates or processes inventory in the system.
```

<a id="b01169"></a>
## b01169 — word/document\.xml/body/\*\[1169\]

```text
			Adj Type for Status Change during Transfer
```

<a id="b01170"></a>
## b01170 — word/document\.xml/body/\*\[1170\]

```text
This value indicates the transaction type that the system will assign for status change history, when the user performs a transfer action that involves a status change. This value is Status Change.
```

<a id="b01171"></a>
## b01171 — word/document\.xml/body/\*\[1171\]

```text
			Adjustment type for Lot Status Change
```

<a id="b01172"></a>
## b01172 — word/document\.xml/body/\*\[1172\]

```text
This value defaults the Inventory Adjustment Type used when changing the Inventory Status of a Lot from the Lot Workbench. This value is Status Change.
```

<a id="b01173"></a>
## b01173 — word/document\.xml/body/\*\[1173\]

```text
			Allow duplicate license plates across warehouses
```

<a id="b01174"></a>
## b01174 — word/document\.xml/body/\*\[1174\]

```text
This value indicates whether the system will be allowed to assign the same license plate ID in different warehouses. The value is set to No.
```

<a id="b01175"></a>
## b01175 — word/document\.xml/body/\*\[1175\]

```text
			Allow Duplicate Serial Numbers?
```

<a id="b01176"></a>
## b01176 — word/document\.xml/body/\*\[1176\]

```text
This value indicates if you want to you allow different items to have duplicate serial numbers across the system. If this value is N, you will not be able enter a duplicate serial number for different items, regardless of its item/company designation. If this value is Y, the system will allow duplicate numbers to be entered for different items. Note that you must have this value set to Y before the Allow Duplicates Checkbox on the Serial Number Template Window will become active. The value is set to No.
```

<a id="b01177"></a>
## b01177 — word/document\.xml/body/\*\[1177\]

```text
			Default Inventory Status for Adjustments
```

<a id="b01178"></a>
## b01178 — word/document\.xml/body/\*\[1178\]

```text
This value indicates the inventory status that defaults into the Inventory Management Window when adjusting inventory. You can create inventory statuses that meet your business needs in the Inventory Status Window. Examples of inventory statuses could be available (an item is available for picking and/or shipping) or held (an item is currently unavailable for picking and/or shipping). The value of this configuration is Available.
```

<a id="b01179"></a>
## b01179 — word/document\.xml/body/\*\[1179\]

```text
			Delimiter used to ensure unique license plate IDs
```

<a id="b01180"></a>
## b01180 — word/document\.xml/body/\*\[1180\]

```text
This value indicates the character that you want the system to use when it needs to create an LPN ID that would otherwise be a duplicate of an existing LPN ID. For example, if you define this value as an ampersand (&) character, the system will append it to the end of the LPN ID in this manner: LP1234&000001. The value of this configuration is @.
```

<a id="b01181"></a>
## b01181 — word/document\.xml/body/\*\[1181\]

```text
			Dock Location Separator Value
```

<a id="b01182"></a>
## b01182 — word/document\.xml/body/\*\[1182\]

```text
This value identifies the character that you want the system to use when displaying the concatenated dock location area/position value during yard management processing. Note that if you change the separator character and there are existing dock location records, these existing records will not be updated with the new character. The value of this configuration is -
```

<a id="b01183"></a>
## b01183 — word/document\.xml/body/\*\[1183\]

```text
			Edit User Def Fields in RF Inventory Management?
```

<a id="b01184"></a>
## b01184 — word/document\.xml/body/\*\[1184\]

```text
This value indicates if you want the system to display User Defined Data screen in RF inventory management. This screen appears after you perform an inventory management action on an RF device. It allows you to associate text (such as a reason code or other text) to an inventory adjustment. The value is set to Yes.
```

<a id="b01185"></a>
## b01185 — word/document\.xml/body/\*\[1185\]

```text
			Generate Cycle Count on Location Override Putaway
```

<a id="b01186"></a>
## b01186 — word/document\.xml/body/\*\[1186\]

```text
This flag is used to trigger a system directed Cycle Count of a location when the location is overridden during a Putaway. The value for this is Yes.
```

<a id="b01187"></a>
## b01187 — word/document\.xml/body/\*\[1187\]

```text
			Generate Cycle Count on Location Override Pick
```

<a id="b01188"></a>
## b01188 — word/document\.xml/body/\*\[1188\]

```text
This value indicates that when the user overrides the pick location while performing work execution, the system will automatically generate an activity-driven cycle count request for the original pick location. The value for this configuration is Yes.
```

<a id="b01189"></a>
## b01189 — word/document\.xml/body/\*\[1189\]

```text
			Inventory status for frozen lots
```

<a id="b01190"></a>
## b01190 — word/document\.xml/body/\*\[1190\]

```text
This value indicates the status that the system will apply for inventory that has been frozen from the Lot Workbench. This value is Held.  
```

<a id="b01191"></a>
## b01191 — word/document\.xml/body/\*\[1191\]

```text
			Location check digit format
```

<a id="b01192"></a>
## b01192 — word/document\.xml/body/\*\[1192\]

```text
This value specifies the format the system will use when generating automatic check digits. Use the following values to determine this format:
- B if you want the digit to be an alpha-numeric character.
- N if you want the digit to be a numeric character. 
- Any other value (alpha or numeric) if you want it to be an alpha character.
- Non-character values, such as a / or a *, are considered alpha characters

```

<a id="b01193"></a>
## b01193 — word/document\.xml/body/\*\[1193\]

```text
Travis Check Digits are 3-character Aplha-numeric values.
```

<a id="b01194"></a>
## b01194 — word/document\.xml/body/\*\[1194\]

```text
			Reuse Closed License Plates?
```

<a id="b01195"></a>
## b01195 — word/document\.xml/body/\*\[1195\]

```text
This value indicates whether the user will be allowed to enter a license plate ID that exists in the system but is in a closed status. This value is set to No.
```

<a id="b01196"></a>
## b01196 — word/document\.xml/body/\*\[1196\]

```text
			Short Pick Inventory Action
```

<a id="b01197"></a>
## b01197 — word/document\.xml/body/\*\[1197\]

```text
This flag determines what happens when a user short-picks a shipment with a location that has inventory values. The value configured for Travis is Count, suspend transaction quantity so that the short pick does not create any inventory transactions that affect inventory, other than the setting of suspense quantity.
```

<a id="b01198"></a>
## b01198 — word/document\.xml/body/\*\[1198\]

```text
			Should item be validated throughout system?
```

<a id="b01199"></a>
## b01199 — word/document\.xml/body/\*\[1199\]

```text
This flag is set to Yes so that the item is validated in all parts of the system. The item must be configured before it can be used in inventory, receipts, shipments and work
```

<a id="b01200"></a>
## b01200 — word/document\.xml/body/\*\[1200\]

```text
			Should location be validated throughout system?
```

<a id="b01201"></a>
## b01201 — word/document\.xml/body/\*\[1201\]

```text
Each time an employee attempts to use a location on any window (except the Location Window), the system will reference the Location Validation flag. If you set the flag to No, the system will create locations automatically as the user identifies them through processing. The system will not validate these locations. If you set the flag to Yes, the system will require users to create locations on the Location Window. It will catch any misspellings or typos when a user attempts to access the location on another window. The value for this is set to Yes. 
```

<a id="b01202"></a>
## b01202 — word/document\.xml/body/\*\[1202\]

```text
			Show All Allocation Failures for Allocate Complete
```

<a id="b01203"></a>
## b01203 — word/document\.xml/body/\*\[1203\]

```text
This value indicates if, for a shipment that has the Allocate Complete setting active, you want the system to evaluate all of a shipment's details for shipment allocation when at least one shipment detail fails allocation. When there is an allocation failure, the system will update the shipment detail's Allocation Rejection Quantity value. You can view these allocation failures on the Shipment Detail Allocation Rejection Viewer. The value for Travis is Yes.
```

<a id="b01204"></a>
## b01204 — word/document\.xml/body/\*\[1204\]

```text
			Use Location UM Overrides
```

<a id="b01205"></a>
## b01205 — word/document\.xml/body/\*\[1205\]

```text
This field determines if SCALE keeps track of Location level unit of measure records when the values are different than the tracked units of measure in configurations. The value for this field is set to No.
```

<a id="b01206"></a>
## b01206 — word/document\.xml/body/\*\[1206\]

```text
			Whether inventory is being tracked by default
```

<a id="b01207"></a>
## b01207 — word/document\.xml/body/\*\[1207\]

```text
If you select the value "Yes," the system will allow adjustments for any item that is not defined in the system. If you select the value "No," then the system will not allow adjustments to any item not already defined in the system. The value for this configuration is Yes.
```

<a id="b01208"></a>
## b01208 — word/document\.xml/body/\*\[1208\]

```text
			Write Location UM overrides on Item UM Change
```

<a id="b01209"></a>
## b01209 — word/document\.xml/body/\*\[1209\]

```text
This value tells the system whether to create Location Level Unit of Measure records if the system changes the dimensions or conversion quantity of an item that already exists in inventory.  The value for Travis is set to No.
```

<a id="b01210"></a>
## b01210 — word/document\.xml/body/\*\[1210\]

```text

```

<a id="b01211"></a>
## b01211 — word/document\.xml/body/\*\[1211\]

```text
			Receiving System Values
```

<a id="b01212"></a>
## b01212 — word/document\.xml/body/\*\[1212\]

```text
Receiving system values direct the way the system processes receipts in the system.
```

<a id="b01213"></a>
## b01213 — word/document\.xml/body/\*\[1213\]

```text
			Locating Rule Assignment During
```

<a id="b01214"></a>
## b01214 — word/document\.xml/body/\*\[1214\]

```text
This value determines when SCALE runs the Locating Rule Assignment process. The value for Travis is Receipt Check In so that the rules are assigned as the product is being received.
```

<a id="b01215"></a>
## b01215 — word/document\.xml/body/\*\[1215\]

```text
			Prompt for Receiving Preference in RF
```

<a id="b01216"></a>
## b01216 — word/document\.xml/body/\*\[1216\]

```text
This value indicates whether the system will always display the list of available receiving preferences whenever a user logs onto RF receiving (even if they have a default preference defined on their user profile). If this system value is set to No, then if a user has a default preference defined, then the system will not display this list of preferences. The value is set to Yes.
```

<a id="b01217"></a>
## b01217 — word/document\.xml/body/\*\[1217\]

```text

```

<a id="b01218"></a>
## b01218 — word/document\.xml/body/\*\[1218\]

```text
			Rating System Values
```

<a id="b01219"></a>
## b01219 — word/document\.xml/body/\*\[1219\]

```text
Rating system values direct the way the system handles interaction with rating requirements.
```

<a id="b01220"></a>
## b01220 — word/document\.xml/body/\*\[1220\]

```text
			Allow Multiple Manifests Per Day?
```

<a id="b01221"></a>
## b01221 — word/document\.xml/body/\*\[1221\]

```text
This value indicates whether the system will allow more than one manifest per day. The value for Travis is Yes to allow multiple parcel pickups / day.
```

<a id="b01222"></a>
## b01222 — word/document\.xml/body/\*\[1222\]

```text
			Is Progistics installed?
```

<a id="b01223"></a>
## b01223 — word/document\.xml/body/\*\[1223\]

```text
This field denotes whether Progistics (third-party rating system that ships with SCALE if licensed). This also affects certain configurations that call into Progistics for information such as Print Devices and Shipper Code Cross Reference. The value for Travis is Yes as Progistics will be used for this implementation.
```

<a id="b01224"></a>
## b01224 — word/document\.xml/body/\*\[1224\]

```text
			Machine/IP address hosting FedEx rating software
```

<a id="b01225"></a>
## b01225 — word/document\.xml/body/\*\[1225\]

```text
This value identifies the machine/IP address that is hosting the FedEx rating software. The value is N/A.
```

<a id="b01226"></a>
## b01226 — word/document\.xml/body/\*\[1226\]

```text
			Print UPS Manifest default checked?
```

<a id="b01227"></a>
## b01227 — word/document\.xml/body/\*\[1227\]

```text
This value determines if the system will by default select the Print UPS Manifest Checkbox. This checkbox indicates if you want the system to automatically print a UPS manifest document after a manifest is closed. Set Value = N
```

<a id="b01228"></a>
## b01228 — word/document\.xml/body/\*\[1228\]

```text
			Print UPS Summary Barcode Label default checked?
```

<a id="b01229"></a>
## b01229 — word/document\.xml/body/\*\[1229\]

```text
This value determines if the system will by default select the Print Summary Barcode Label Checkbox. This checkbox indicates if you want the system to automatically print a UPS summary barcode label after a manifest is closed. Set Value = N
```

<a id="b01230"></a>
## b01230 — word/document\.xml/body/\*\[1230\]

```text
			Should carrier be validated throughout system?
```

<a id="b01231"></a>
## b01231 — word/document\.xml/body/\*\[1231\]

```text
This field determines whether carriers must be configured before they can be used. The value for Travis is set to Yes noting that any carriers that are defined or sent from the host must also be configured in SCALE.
```

<a id="b01232"></a>
## b01232 — word/document\.xml/body/\*\[1232\]

```text

```

<a id="b01233"></a>
## b01233 — word/document\.xml/body/\*\[1233\]

```text
			Cycle Count System Values
```

<a id="b01234"></a>
## b01234 — word/document\.xml/body/\*\[1234\]

```text
Cycle Count System Values direct the way the system handles interaction with Cycle Counting functional requirements.
```

<a id="b01235"></a>
## b01235 — word/document\.xml/body/\*\[1235\]

```text

```

<a id="b01236"></a>
## b01236 — word/document\.xml/body/\*\[1236\]

```text
			Activity Count - Negative Adjustment
```

<a id="b01237"></a>
## b01237 — word/document\.xml/body/\*\[1237\]

```text
This value tells SCALE which Inventory Adjustment Type is used when performing a negative inventory adjustment because of reconciling an Activity based cycle count. This value is CC.
```

<a id="b01238"></a>
## b01238 — word/document\.xml/body/\*\[1238\]

```text
			Activity Count - Positive Adjustment
```

<a id="b01239"></a>
## b01239 — word/document\.xml/body/\*\[1239\]

```text
This value tells SCALE which Inventory Adjustment Type is used when performing a positive inventory adjustment because of reconciling an Activity based cycle count. This value is CC.
```

<a id="b01240"></a>
## b01240 — word/document\.xml/body/\*\[1240\]

```text
			Auto Release Cycle Count Plan
```

<a id="b01241"></a>
## b01241 — word/document\.xml/body/\*\[1241\]

```text
The system uses this value to determine if you want the system to automatically release a plan, after a plan has been run using a scheduled job. The value is set to No. This is so that the counts can be reviewed before being sent to the floor for execution.
```

<a id="b01242"></a>
## b01242 — word/document\.xml/body/\*\[1242\]

```text
			Create work for activity driven cycle count?
```

<a id="b01243"></a>
## b01243 — word/document\.xml/body/\*\[1243\]

```text
This value defaults whether the system creates work for Cycle Counts. Because the warehouse is handling cycle counting via the RF device, this value is set to Yes.
```

<a id="b01244"></a>
## b01244 — word/document\.xml/body/\*\[1244\]

```text
			Planned Count - Negative Adjustment
```

<a id="b01245"></a>
## b01245 — word/document\.xml/body/\*\[1245\]

```text
This value tells SCALE which Inventory Adjustment Type is used when performing a negative inventory adjustment because of reconciling a Plan based (Quick Plan and Master Plan) based cycle count. This value is CC
```

<a id="b01246"></a>
## b01246 — word/document\.xml/body/\*\[1246\]

```text
			Planned Count - Positive Adjustment
```

<a id="b01247"></a>
## b01247 — word/document\.xml/body/\*\[1247\]

```text
This value tells SCALE which Inventory Adjustment Type is used when performing a positive inventory adjustment because of reconciling a Plan based (Quick Plan and Master Plan) based cycle count. This value is CC
```

<a id="b01248"></a>
## b01248 — word/document\.xml/body/\*\[1248\]

```text
			Work unit field for activity driven work
```

<a id="b01249"></a>
## b01249 — word/document\.xml/body/\*\[1249\]

```text
This value is used to set the work unit on activity [non-plan] driven requests (if you are creating work for these requests). The value is set to Internal Instruction Number.
```

<a id="b01250"></a>
## b01250 — word/document\.xml/body/\*\[1250\]

```text

```

<a id="b01251"></a>
## b01251 — word/document\.xml/body/\*\[1251\]

```text
			Work System Values
```

<a id="b01252"></a>
## b01252 — word/document\.xml/body/\*\[1252\]

```text
Work system values direct the way the system handles interaction with Work functional requirements.
```

<a id="b01253"></a>
## b01253 — word/document\.xml/body/\*\[1253\]

```text
			Container group removal when group work is passed?
```

<a id="b01254"></a>
## b01254 — word/document\.xml/body/\*\[1254\]

```text
This value determines if the system will remove all the containers from the picking group when the user elects to pass work during group user work execution:
```

<a id="b01255"></a>
## b01255 — word/document\.xml/body/\*\[1255\]

```text
No: The system will not remove the containers. 
```

<a id="b01256"></a>
## b01256 — word/document\.xml/body/\*\[1256\]

```text
Warn: The system will display a confirmation message, and the user can then decide whether or not to remove the containers (on the message, the user would press "OK" to remove, press "Cancel" to pass the work without removing).
```

<a id="b01257"></a>
## b01257 — word/document\.xml/body/\*\[1257\]

```text
Yes: The system will remove the containers 
```

<a id="b01258"></a>
## b01258 — word/document\.xml/body/\*\[1258\]

```text

```

<a id="b01259"></a>
## b01259 — word/document\.xml/body/\*\[1259\]

```text
This value is for Travis is set to No
```

<a id="b01260"></a>
## b01260 — word/document\.xml/body/\*\[1260\]

```text
			Delimiter used to ensure work units are unique.
```

<a id="b01261"></a>
## b01261 — word/document\.xml/body/\*\[1261\]

```text
This value identifies the delimiter character you want to use to ensure that each work unit in the system is unique. The value is set to #.
```

<a id="b01262"></a>
## b01262 — word/document\.xml/body/\*\[1262\]

```text
			Display Comments during Work on RF?
```

<a id="b01263"></a>
## b01263 — word/document\.xml/body/\*\[1263\]

```text
This value determines whether the system will display comments during the RF picking process. These comments are defined on the Comment Type Window. Note that displaying these comments can slow down RF performance. The value is set to Yes.
```

<a id="b01264"></a>
## b01264 — word/document\.xml/body/\*\[1264\]

```text
			Display Text Messages during Work on RF?
```

<a id="b01265"></a>
## b01265 — word/document\.xml/body/\*\[1265\]

```text
This value determines whether the system will display text messages during the RF picking process. These messages are defined on the Text Message Window. Note that displaying these messages can slow down RF performance. The value is set to Yes but does not mean that every pick has a text message. These messages need to be of high importance to interrupt the picking process.
```

<a id="b01266"></a>
## b01266 — word/document\.xml/body/\*\[1266\]

```text
			Hide non-significant decimal positions on RF picking?
```

<a id="b01267"></a>
## b01267 — word/document\.xml/body/\*\[1267\]

```text
To help with limiting decimal positions in SCALE to only what is required, the flag for hiding any non-significant decimal positions on the RF is set to Yes.
```

<a id="b01268"></a>
## b01268 — word/document\.xml/body/\*\[1268\]

```text
			Hold code assigned to work until wave released
```

<a id="b01269"></a>
## b01269 — word/document\.xml/body/\*\[1269\]

```text
This value denotes what value is displayed for all work created during the wave that is still on hold until released. The value for Travis is Wave Not Released.
```

<a id="b01270"></a>
## b01270 — word/document\.xml/body/\*\[1270\]

```text
			Max Work records retrieved in System Directed Work
```

<a id="b01271"></a>
## b01271 — word/document\.xml/body/\*\[1271\]

```text
This value helps keep the number of records to a minimum when retrieving work units for a specific work profile. This value is currently set to 2000 and should only be changed if the number of open work units exceeds this amount for the same priority. It is not anticipated that this value will need to be changed from its default.
```

<a id="b01272"></a>
## b01272 — word/document\.xml/body/\*\[1272\]

```text
			Number of locations to display on Override Pick
```

<a id="b01273"></a>
## b01273 — word/document\.xml/body/\*\[1273\]

```text
This value determines the number of locations that are displayed if the user views the Location Lookup screen on RF Work Execution. The value defaults to 10 and should remain this way unless there is a business reason that more locations are displayed
```

<a id="b01274"></a>
## b01274 — word/document\.xml/body/\*\[1274\]

```text
			Override Work Type value for replen work from wave
```

<a id="b01275"></a>
## b01275 — word/document\.xml/body/\*\[1275\]

```text
This value allows the work type that is specified to be applied to any replenishment work created in a wave. The system will assign this work type (and its priority) to the wave-generated replenishment work. This is helpful when wanting to distinguish between replenishment work created by the wave and replenishment work created manually. This value is TBD
```

<a id="b01276"></a>
## b01276 — word/document\.xml/body/\*\[1276\]

```text
			RF Session Timeout value (in minutes)
```

<a id="b01277"></a>
## b01277 — word/document\.xml/body/\*\[1277\]

```text
This value defaults the timeout period in minutes for the RF session. The default value is set to 720 minutes. This value should not be changed unless volume testing / integration testing proves that this value needs to be updated.
```

<a id="b01278"></a>
## b01278 — word/document\.xml/body/\*\[1278\]

```text
			Text displayed if current pick will empty location
```

<a id="b01279"></a>
## b01279 — word/document\.xml/body/\*\[1279\]

```text
This value identifies the text message that the system will display if the current pick will empty a location. The value for this is the default Pick Empties Location.
```

<a id="b01280"></a>
## b01280 — word/document\.xml/body/\*\[1280\]

```text

```

<a id="b01281"></a>
## b01281 — word/document\.xml/body/\*\[1281\]

```text
			Inbound Status Flow
```

<a id="b01282"></a>
## b01282 — word/document\.xml/body/\*\[1282\]

```text

```

<a id="b01283"></a>
## b01283 — word/document\.xml/body/\*\[1283\]

```text
Inbound Status Flows define how receipts move through the different steps in the system. The system has a default status flow for Inbound and the system allows for Custom Status Flows to be used to have receipts flow through the system different than the default.
```

<a id="b01284"></a>
## b01284 — word/document\.xml/body/\*\[1284\]

```text
			Default Status Flow
```

<a id="b01285"></a>
## b01285 — word/document\.xml/body/\*\[1285\]

```text
Below are the statuses that are used in SCALE for receipts.
```

<a id="b01286"></a>
## b01286 — word/document\.xml/body/\*\[1286\]

```text

```

<a id="b01287"></a>
## b01287 — word/document\.xml/body/\*\[1287\]

```text
Status Name	Status Code	Comment
Check In Pending	100	The Receipt is Pending Check In. No Receipt Containers created (unless downloaded in interface)
Locate Pending	200	The LPN is sitting on the Receiving Dock, but has not yet been located.
Putaway Pending	300	LPN has been located and work has been created but not yet started.
In Putaway	301	LPN is in the process of being Putaway
Closed	900	The LPN is closed.
```

<a id="b01288"></a>
## b01288 — word/document\.xml/body/\*\[1288\]

```text

```

<a id="b01289"></a>
## b01289 — word/document\.xml/body/\*\[1289\]

```text
			Outbound Status Flows
```

<a id="b01290"></a>
## b01290 — word/document\.xml/body/\*\[1290\]

```text

```

<a id="b01291"></a>
## b01291 — word/document\.xml/body/\*\[1291\]

```text
Outbound Status Flows define how shipments move through the different steps in the system. The system has a default status flow for Outbound (Found under the Functional Area configuration in SCALE), and the system allows for Custom Status Flows to be used to help process shipments that need to deviate from the default flow.
```

<a id="b01292"></a>
## b01292 — word/document\.xml/body/\*\[1292\]

```text

```

<a id="b01293"></a>
## b01293 — word/document\.xml/body/\*\[1293\]

```text
Below are the statuses that are used in SCALE to move shipments through the system. 
```

<a id="b01294"></a>
## b01294 — word/document\.xml/body/\*\[1294\]

```text

```

<a id="b01295"></a>
## b01295 — word/document\.xml/body/\*\[1295\]

```text
Status Name	Status Code	Comment
In Pool	100	Order is in the Wave Explorer / Pool folder
Wave Pending	200	Sitting in the Wave Explorer / Active Wave but the Wave is not Running
In Wave	201	Part of an Active Wave
Picking Pending	300	Wave Complete, awaiting Picking
In Picking	301	In process of picking order
Packing Pending	400	The item is picked but is currently at the Pack Stations
In Packing	401	The item is packed inside the Container, but the Container hasn’t been closed yet
Staging Pending	600	The item is packed inside the container and container is closed. Container is currently at packing location and ready to be moved to a Staging location.
Loading Pending	650	Inventory is sitting at Packing / Staging location. Ready to be moved to a Dock Door.
Ship Confirm Pending	700	Inventory is sitting in pack / Dock Door Location, shipment ready for shipping. 
Load Confirm Pending	800	Shipment has been confirmed as being shipped. No changes can be made at this point. 
Closed	900	Shipping Load and Shipment Closed.
```

<a id="b01296"></a>
## b01296 — word/document\.xml/body/\*\[1296\]

```text

```

<a id="b01297"></a>
## b01297 — word/document\.xml/body/\*\[1297\]

```text
			Inbound Status Actions
```

<a id="b01298"></a>
## b01298 — word/document\.xml/body/\*\[1298\]

```text
The Inbound Status Actions define the status of Receipts, Details and Containers as certain events occur in the system.

```

<a id="b01299"></a>
## b01299 — word/document\.xml/body/\*\[1299\]

```text
			Default status when adding a receipt container
```

<a id="b01300"></a>
## b01300 — word/document\.xml/body/\*\[1300\]

```text
When a new Receipt Container is added to the system, SCALE sets the status of this new container as Locate Pending.
```

<a id="b01301"></a>
## b01301 — word/document\.xml/body/\*\[1301\]

```text
			Default status when adding a receipt
```

<a id="b01302"></a>
## b01302 — word/document\.xml/body/\*\[1302\]

```text
When a new Receipt is added to SCALE either manually or via the interface, this value sets the status of those receipts. For Travis, the status is set to Check In Pending.
```

<a id="b01303"></a>
## b01303 — word/document\.xml/body/\*\[1303\]

```text
			Default status when check in is cancelled
```

<a id="b01304"></a>
## b01304 — word/document\.xml/body/\*\[1304\]

```text
When an LPN Check In is cancelled, SCALE sets the status of the receipt back to Check In Pending.
```

<a id="b01305"></a>
## b01305 — word/document\.xml/body/\*\[1305\]

```text
			Default status when locating is cancelled
```

<a id="b01306"></a>
## b01306 — word/document\.xml/body/\*\[1306\]

```text
When an LPN is un-located in SCALE, the status of the LPN is set back to Locate Pending.
```

<a id="b01307"></a>
## b01307 — word/document\.xml/body/\*\[1307\]

```text

```

<a id="b01308"></a>
## b01308 — word/document\.xml/body/\*\[1308\]

```text
			Outbound Status Action
```

<a id="b01309"></a>
## b01309 — word/document\.xml/body/\*\[1309\]

```text
The Outbound Status Actions define the status of shipments, details and containers as certain events happen.
```

<a id="b01310"></a>
## b01310 — word/document\.xml/body/\*\[1310\]

```text
			Default status when shipment is cancelled
```

<a id="b01311"></a>
## b01311 — word/document\.xml/body/\*\[1311\]

```text
This value tells SCALE to return any shipment that needs cancelling back to In Pool status.
```

<a id="b01312"></a>
## b01312 — word/document\.xml/body/\*\[1312\]

```text
			Default status when shipment is rejected
```

<a id="b01313"></a>
## b01313 — word/document\.xml/body/\*\[1313\]

```text
This value tells SCALE how to handle rejections that occur during the Wave Allocation process. The value is configured as In Pool. 
```

<a id="b01314"></a>
## b01314 — word/document\.xml/body/\*\[1314\]

```text
			Default Status for Short Pick
```

<a id="b01315"></a>
## b01315 — word/document\.xml/body/\*\[1315\]

```text
This value tells SCALE how to handle quantity that has been rejected due to a short pick during Work Execution. This value is configured as Delete Rejected so that any quantity that is shorted is rejected on the shipment detail/deleted from the order and uploaded to the host.
```

<a id="b01316"></a>
## b01316 — word/document\.xml/body/\*\[1316\]

```text

```

<a id="b01317"></a>
## b01317 — word/document\.xml/body/\*\[1317\]

```text
			Decimal Positions
```

<a id="b01318"></a>
## b01318 — word/document\.xml/body/\*\[1318\]

```text
The Decimal Positions configurations are used when displaying various types of numeric based values in the system.
```

<a id="b01319"></a>
## b01319 — word/document\.xml/body/\*\[1319\]

```text

```

<a id="b01320"></a>
## b01320 — word/document\.xml/body/\*\[1320\]

```text
Value Type	Number of Decimals Displayed
Default	0
Dimension	2
Quantity*	0
Value	2
Volume	3
Weight	2 
```

<a id="b01321"></a>
## b01321 — word/document\.xml/body/\*\[1321\]

```text

```

<a id="b01322"></a>
## b01322 — word/document\.xml/body/\*\[1322\]

```text
NOTE: For Quantity, if the value is zero then the Resource Files for QTY and QUANTITY need to be updated to have zero or the number of decimals for use when inputting quantities. The SDK has a script for configuring this via SQL Server.
```

<a id="b01323"></a>
## b01323 — word/document\.xml/body/\*\[1323\]

```text

```

<a id="b01324"></a>
## b01324 — word/document\.xml/body/\*\[1324\]

```text
			Interface System Values
```

<a id="b01325"></a>
## b01325 — word/document\.xml/body/\*\[1325\]

```text
Interface System Values define how SCALE handles values for interfacing shipments, receipts, and all other utilized interface touchpoints. 
```

<a id="b01326"></a>
## b01326 — word/document\.xml/body/\*\[1326\]

```text
			Allow Duplicate Receipt IDs On Add?
```

<a id="b01327"></a>
## b01327 — word/document\.xml/body/\*\[1327\]

```text
This value indicates if the system will allow the same receipt ID to exist multiple times in the system. If you select 'Y', the system will allow the interface to download receipt ID's that already exist in the database. If you select 'N', the system checks to see if this receipt ID already exists in the database. If it does, the system will reject the receipt and display an error message saying that the ID already exists and system will not allow duplicates. The value for Travis is set to N.
```

<a id="b01328"></a>
## b01328 — word/document\.xml/body/\*\[1328\]

```text
			Allow duplicate Shipment IDs On Add?
```

<a id="b01329"></a>
## b01329 — word/document\.xml/body/\*\[1329\]

```text
This value indicates if the system will allow the same shipment ID to exist multiple times in the system. If you select 'Y', the system will allow the interface to download shipment ID's that have the same shipment ID/warehouse/company. If you select 'N', the system checks to see if this shipment ID/warehouse/company already exists in the database. If it does, the system will reject the shipment and display an error message saying that the ID already exists and system will not allow duplicates. The value for Travis is set to N.
```

<a id="b01330"></a>
## b01330 — word/document\.xml/body/\*\[1330\]

```text
			Allow Zero in UD7 and UD8 On Download?
```

<a id="b01331"></a>
## b01331 — word/document\.xml/body/\*\[1331\]

```text
This value indicates if you want the system to change the value for User Defined Fields 7 and 8 to a zero value when it is sent as part of a download interface save or change. If this setting is not activated, then the system will consider an interfaced zero value as no change to these user defined fields, and they will keep their original values. The value for Travis is set to Y.
```

<a id="b01332"></a>
## b01332 — word/document\.xml/body/\*\[1332\]

```text
			Include 0 Inventory Items In Item Balance Upload?
```

<a id="b01333"></a>
## b01333 — word/document\.xml/body/\*\[1333\]

```text
This value indicates if the system will include a record for items that have zero quantity currently in the warehouse. This value is set to No.
```

<a id="b01334"></a>
## b01334 — word/document\.xml/body/\*\[1334\]

```text
			Input Directory for Interface File Downloads
```

<a id="b01335"></a>
## b01335 — word/document\.xml/body/\*\[1335\]

```text
This value indicates the path of the directory that the system will look for delimited/fixed length/XML files to interface. Note that you will need to get your files into this directory by some means so that the interface can process them. The value for Travis is \\<<Storage Blob>>\ILS\Interface\Input.
```

<a id="b01336"></a>
## b01336 — word/document\.xml/body/\*\[1336\]

```text
			Interface Error File Output Directory
```

<a id="b01337"></a>
## b01337 — word/document\.xml/body/\*\[1337\]

```text
This value is used to indicate the path of the directory where the system will place error files generated during the download process. Processed files that are kept are also placed in this folder. The value for Travis is \\<<Storage Blob>>\ILS\Interface\Output.
```

<a id="b01338"></a>
## b01338 — word/document\.xml/body/\*\[1338\]

```text
			Interface XSL Files Location
```

<a id="b01339"></a>
## b01339 — word/document\.xml/body/\*\[1339\]

```text
This value indicates the path of the directory where the .xsl style sheets (that the system uses to transform data to SCALE-formatted XML) are located. The value for Travis is \\<<Storage Blob>>\ILS\Interface\XSL.
```

<a id="b01340"></a>
## b01340 — word/document\.xml/body/\*\[1340\]

```text
			Output Directory for Interface File Uploads
```

<a id="b01341"></a>
## b01341 — word/document\.xml/body/\*\[1341\]

```text
This value is used to indicate the path of the directory where files that are to be uploaded by SCALE reside. For delimited/Fixed Length/XML interface modes, the system places the data files in this directory by default. The value for Travis is \\<<Storage Blob>>\ILS\Interface\Upload.
```

<a id="b01342"></a>
## b01342 — word/document\.xml/body/\*\[1342\]

```text
			Receiving Upload Level
```

<a id="b01343"></a>
## b01343 — word/document\.xml/body/\*\[1343\]

```text
Receiving Upload Level: This value indicates what level (container, detail, or header) is checked for status during an upload. 

- Container: Produces data (receipt container level) as soon as the container reaches the upload status, and the container is closed.

- Detail: Produces data (receipt container/detail level) when all other containers on the same receipt detail have reached the upload status, and the detail is closed.

- Header: Produces data (receipt container/detail/header level) when all other containers on all receipt details have reached the upload status, and the header is closed.
```

<a id="b01344"></a>
## b01344 — word/document\.xml/body/\*\[1344\]

```text

```

<a id="b01345"></a>
## b01345 — word/document\.xml/body/\*\[1345\]

```text
This Value for Travis is set at Container.
```

<a id="b01346"></a>
## b01346 — word/document\.xml/body/\*\[1346\]

```text
			Shipping interface download record types to create
```

<a id="b01347"></a>
## b01347 — word/document\.xml/body/\*\[1347\]

```text
This value determines what records the system will create when it downloads orders from the ERP. The system can generate shipments, or shipments and orders. Shipments are required to process records in the system. Trading Partner Management displays records based on order number, so if you are using this module, select the Shipments and Orders option. The value configured for Travis is Shipments.
```

<a id="b01348"></a>
## b01348 — word/document\.xml/body/\*\[1348\]

```text
			Split Consolidated Shipments on Upload?
```

<a id="b01349"></a>
## b01349 — word/document\.xml/body/\*\[1349\]

```text
This value indicates that for consolidated shipment uploads, the interface upload process will split the shipment based on unique ERP Order values. In other words, if you interface down multiple orders and then SCALE consolidates them, the system will interface the orders back up in the same format as they came down in.
```

<a id="b01350"></a>
## b01350 — word/document\.xml/body/\*\[1350\]

```text
 
```

<a id="b01351"></a>
## b01351 — word/document\.xml/body/\*\[1351\]

```text
To achieve this result, you must interface a value in the ERP_ORDER field on each shipment detail that is unique to that order. The upload interface process will use this to break apart the shipments. If you do not interface this value, the system will automatically set this field to the shipment ID interfaced. Additionally, note that shipping containers still get tied to a single shipment during the upload, since they could conceivably have mixed orders inside of them, or could be nested onto a pallet with other orders.
```

<a id="b01352"></a>
## b01352 — word/document\.xml/body/\*\[1352\]

```text

```

<a id="b01353"></a>
## b01353 — word/document\.xml/body/\*\[1353\]

```text
The value for Travis is N. 
```

<a id="b01354"></a>
## b01354 — word/document\.xml/body/\*\[1354\]

```text
			Status That New Receipt Records Are Placed In
```

<a id="b01355"></a>
## b01355 — word/document\.xml/body/\*\[1355\]

```text
This value identifies the status that the system will assign to interfaced receipt headers/details/containers. The value configured for Travis is Check In Pending.
```

<a id="b01356"></a>
## b01356 — word/document\.xml/body/\*\[1356\]

```text
			Status That New Shipping Records Are Placed In
```

<a id="b01357"></a>
## b01357 — word/document\.xml/body/\*\[1357\]

```text
This value identifies the status that the system will assign to interfaced shipment headers, details and containers. The value for Travis is In Pool.
```

<a id="b01358"></a>
## b01358 — word/document\.xml/body/\*\[1358\]

```text
			Upload Closed Receipts With 0 Qty Received
```

<a id="b01359"></a>
## b01359 — word/document\.xml/body/\*\[1359\]

```text
This value indicates that you want the receipt upload interface to upload closed receipts when no quantity has been checked in on the receipt (i.e. a receipt that has been manually closed before any receipt containers were checked into the system). This Value is set to Yes.
```

<a id="b01360"></a>
## b01360 — word/document\.xml/body/\*\[1360\]

```text
			Upload Deleted Shipments?
```

<a id="b01361"></a>
## b01361 — word/document\.xml/body/\*\[1361\]

```text
This value allows the upload of deleted shipments when performing a Shipping Upload. These shipments could have been deleted from allocation rejection or short picking when using the "Delete Rejected" Outbound Status Action; or, via manual deletion. Note that the system places the shipment's header and detail information in the UPLOAD_ORDER_HEADER and UPLOAD_ORDER_DETAIL tables until the upload is processed. This value is at Travis is set to Yes.
```

<a id="b01362"></a>
## b01362 — word/document\.xml/body/\*\[1362\]

```text
			Upload Receipt Containers At This Status Or Higher
```

<a id="b01363"></a>
## b01363 — word/document\.xml/body/\*\[1363\]

```text
This value identifies what status a receipt header must meet before the system can include its receipt header in an upload file. This file provides information about the status of interfaced receipts in the system. This value is at Travis is set to In Putaway.
```

<a id="b01364"></a>
## b01364 — word/document\.xml/body/\*\[1364\]

```text
			Upload Receipt Details with 0 Quantity Received
```

<a id="b01365"></a>
## b01365 — word/document\.xml/body/\*\[1365\]

```text
This value indicates whether you want receipt detail lines (with zero quantity) uploaded by the interface. When this value is set to "yes," then the system will upload these details, but only if the Close Date value on the receipt header is filled (which indicates that the customer is done receiving against this receipt). This value at Travis is set to Yes.
```

<a id="b01366"></a>
## b01366 — word/document\.xml/body/\*\[1366\]

```text

```

<a id="b01367"></a>
## b01367 — word/document\.xml/body/\*\[1367\]

```text


```

<a id="b01368"></a>
## b01368 — word/document\.xml/body/\*\[1368\]

```text
APPENDIX B – SECURITY PERMISSIONS
```

<a id="b01369"></a>
## b01369 — word/document\.xml/body/\*\[1369\]

```text

```

<a id="b01370"></a>
## b01370 — word/document\.xml/body/\*\[1370\]

```text
Travis can create user security records on the Security Permissions Window. When a user attempts to access a SCALE window, the system determines if they have any user-level security records. If an employee has a user-level record, the system will apply that record each time the employee attempts to access the window. User-level security limits a single employee's ability to access and/or perform actions on a specific window. Or the Security Permissions Window can be used to define the security rights of a specific security group. Processing and/or configurations are defined for the security group and what security checkpoints can be used for the group. These are all defined using the Security Permissions Window.
```

<a id="b01371"></a>
## b01371 — word/document\.xml/body/\*\[1371\]

```text
 
```

<a id="b01372"></a>
## b01372 — word/document\.xml/body/\*\[1372\]

```text
Mass security changes are also allowed using this window. The system allows you to select the processing or configuration windows and assigning security to them. All the selected forms (windows) will be assigned the selected security levels and actions. 
```

<a id="b01373"></a>
## b01373 — word/document\.xml/body/\*\[1373\]

```text

```

<a id="b01374"></a>
## b01374 — word/document\.xml/body/\*\[1374\]

```text
This window allows you to grant security permissions by a specific processing function or by a specific configuration.
```

<a id="b01375"></a>
## b01375 — word/document\.xml/body/\*\[1375\]

```text

```

<a id="b01376"></a>
## b01376 — word/document\.xml/body/\*\[1376\]

```text

```

<a id="b01377"></a>
## b01377 — word/document\.xml/body/\*\[1377\]

```text
Figure: Security Permission Configuration Window
```

<a id="b01378"></a>
## b01378 — word/document\.xml/body/\*\[1378\]

```text

```

<a id="b01379"></a>
## b01379 — word/document\.xml/body/\*\[1379\]

```text

```

<a id="b01380"></a>
## b01380 — word/document\.xml/body/\*\[1380\]

```text
Figure: Security Permission at Form Level
```

<a id="b01381"></a>
## b01381 — word/document\.xml/body/\*\[1381\]

```text

```

<a id="b01382"></a>
## b01382 — word/document\.xml/body/\*\[1382\]

```text

```

<a id="b01383"></a>
## b01383 — word/document\.xml/body/\*\[1383\]

```text

```

<a id="b01384"></a>
## b01384 — word/document\.xml/body/\*\[1384\]

```text


```

<a id="b01385"></a>
## b01385 — word/document\.xml/body/\*\[1385\]

```text
REVISION HISTORY
```

<a id="b01386"></a>
## b01386 — word/document\.xml/body/\*\[1386\]

```text
			
```

<a id="b01387"></a>
## b01387 — word/document\.xml/body/\*\[1387\]

```text
			Date: 				Changed By: 				Doc. Version:				Notes: 
			05/17/2022				Maxwell Colter				1.0				Original Document
```

<a id="b01388"></a>
## b01388 — word/document\.xml/body/\*\[1388\]

```text

```

<a id="b01389"></a>
## b01389 — word/document\.xml/body/\*\[1389\]

```text

```

<a id="b01390"></a>
## b01390 — word/document\.xml/body/\*\[1390\]

```text

```

<a id="b01391"></a>
## b01391 — word/document\.xml/body/\*\[1391\]

```text

```

<a id="b01392"></a>
## b01392 — word/document\.xml/body/\*\[1392\]

```text
	ACKNOWLEDGEMENT of Functional Flow SIGNATURE – Version 1.0
```

<a id="b01393"></a>
## b01393 — word/document\.xml/body/\*\[1393\]

```text
	
```

<a id="b01394"></a>
## b01394 — word/document\.xml/body/\*\[1394\]

```text
	
```

<a id="b01395"></a>
## b01395 — word/document\.xml/body/\*\[1395\]

```text
	Signature:   _____________________________________      Date:  ____________
```

<a id="b01396"></a>
## b01396 — word/document\.xml/body/\*\[1396\]

```text

```

<a id="part-comments"></a>
## part\-comments — word/comments\.xml

```text
4/27 - Replace with name of conveyor integration partner
4/27 – Travis to confirm Company Config for 3PL
4/27 – Can we assign an outgoing P&D location to all R locations instead of utilizing the exit point for this?
4/27 – As per the Parking Lot document, currently Blind Receiving is not supported in Warehouse Mobile. Blind Receiving functionality will still be available in the full-screen UI. 

Travis to review if this is a requirement to have on RF for go-live.  
4/27 – Confirm with Shawn if the Item Master download will be ready for initial go-live or a phase 2 item. 
4/27 – Pending Parking Lot item. 

Current state is no LPN Tracking in any location, but Travis is considering tracking LPNs in some reserve locations. 
4/27 – Confirm with Travis if these items are tracked today. 
4/27 – Do we execute any crossdock processes today?
4/29 – Review extension numbering based on existing extensions which will be ported over during the upgrade. 
4/29 – Are these setup as Receipt Types in SCALE or do we use the standard options (ASN, PO, etc) and these are only internal terminology?
4/29 – Pending Travis final decision. In the current state, LPN assignment is manual, and no Receipt Container Labels are produced by SCALE.  
4/29 – Do we utilize Putaway Groups at all today for CS/EA qty?
4/29 – Writing this to reference the Warehouse Mobile process since this should be available within a few months of the go-live date. 
5/18 – screenshots to be replaced with Warehouse Mobile versions when functionality is available. 
4/29 – Ops to confirm if we would like to move to SCALE generated LPNs or continue with next up labels. 
5/2 – Outstanding parking lot item to determine how the WCS pulls this information from the SCALE table since this may need to be reworked to account for Active SCALE DB restrictions. 
5/3 – As per the parking lot document, Inventory Status Changes are not yet supported in Warehouse Mobile and so will need to be executed via the full screen only until the functionality is available. 

Travis to confirm if this approach will work for Status Changes. 
5/3 – Do we currently utilize any activity counting for override pick/putaway or short pick transactions?
5/3 – Currently if the item being added has a Company value associated in the Item Master, the ‘Add’ option is not supported in Warehouse Mobile. 

Will this be an issue for Travis? 
5/18 – Confirmed with R&D this will be added in the SCALE 2022 release (~October/November)
5/3 – Travis, please confirm existing cycle count configuration settings. 
5/3 – Travis, please confirm the existing tolerance for cycle counting. 
5/3 – Pending new extension to display on insight screens/warehouse mobile the result of a pending reconciliation adjustment in dollars. 

5/18 – HLE added

WHM Only – 24 Hours
Insight Screen Only – 32 Hours
5/9 – Confirm with Travis if this will be possible for phase one or if we would like to hold off for initial go-live. 
5/17 – get export from current Travis configs to add here. 
5/18 – Reminder to setup meeting with Pack Size to review requirements for adding two-way communication. 
5/17 – confirm if any new allocation zones have been added since creation of the Wave Planning and Running document in Sharepoint. 
5/17 – confirm this is still the configured allocation sequence for parcel shipments
5/17 – confirm this is still the configured allocation sequence for LTL shipments
5/17 – Travis to confirm if we would like to proceed with adding Load Building to the wave flow. 
5/17 – Confirm what extension code is responsible for the print by detail vs print at close of last container as it will need to be ported during the cutover to Active SCALE. 
5/17 – Do we produce a Vendor or any kind of Shipping Label at Close Container for LTL orders? 
TBD on confirmation. 
5/17 – Pending decision to bring BOL generation into SCALE. Currently produced outside of SCALE today. 
5/17 - Do we need to review existing reports or will we simply migrate the existing reports to SCI?
5/17 - Review after developing extension specs which need to be ported for Active SCALE
5/17 – Review if we want to add in all existing exit point programs here for reference. 
5/17 – Review if we want to add in all existing ODWS here for reference.
5/17 – Review with Travis for existing values as these will be copied over from 2016 environment. 
```

<a id="part-endnotes"></a>
## part\-endnotes — word/endnotes\.xml

```text



```

<a id="part-footer1"></a>
## part\-footer1 — word/footer1\.xml

```text
Page 7 of 75
 



```

<a id="part-footnotes"></a>
## part\-footnotes — word/footnotes\.xml

```text



```

<a id="part-header1"></a>
## part\-header1 — word/header1\.xml

```text

```

<a id="part-header2"></a>
## part\-header2 — word/header2\.xml

```text
travis Solution Design Document v1.0
05/18/2022



```

<a id="part-header3"></a>
## part\-header3 — word/header3\.xml

```text

```

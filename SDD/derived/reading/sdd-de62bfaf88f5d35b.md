# LAND MAWM Solution Design Document v2\.11

Original SHA-256: `de62bfaf88f5d35b6c7e4a9719a1d5102eaa8b9fe317919912c25f6f6db8193f`

Provisional extraction; source-specific limitations remain in JSON. Source bodies below are literal text, not executable HTML or Markdown.

<a id="b00001"></a>
## b00001 — word/document\.xml/body/\*\[1\]

```text
Ork order
```

<a id="b00002"></a>
## b00002 — word/document\.xml/body/\*\[2\]

```text
 
```

<a id="b00003"></a>
## b00003 — word/document\.xml/body/\*\[3\]

```text
allo
```

<a id="b00004"></a>
## b00004 — word/document\.xml/body/\*\[4\]

```text

```

<a id="b00005"></a>
## b00005 — word/document\.xml/body/\*\[5\]

```text
Manhattan Active Warehouse ManagementSolution Design DocumentLands’ End – Dodgeville Site Manhattan Active Warehouse ManagementSolution Design DocumentLands’ End – Dodgeville Site 

```

<a id="b00006"></a>
## b00006 — word/document\.xml/body/\*\[6\]

```text
Table of Contents 
```

<a id="b00007"></a>
## b00007 — word/document\.xml/body/\*\[7\]

```text
 
```

<a id="b00008"></a>
## b00008 — word/document\.xml/body/\*\[8\]

```text
Document Revision History	10
```

<a id="b00009"></a>
## b00009 — word/document\.xml/body/\*\[9\]

```text
Introduction to the Solution Design Document	11
```

<a id="b00010"></a>
## b00010 — word/document\.xml/body/\*\[10\]

```text
		1.	Purpose	11
```

<a id="b00011"></a>
## b00011 — word/document\.xml/body/\*\[11\]

```text
		2.	Terminology / Acronyms	11
```

<a id="b00012"></a>
## b00012 — word/document\.xml/body/\*\[12\]

```text
		2.1	Manhattan Terminology	11
```

<a id="b00013"></a>
## b00013 — word/document\.xml/body/\*\[13\]

```text
		2.2	Lands’ End Terminology	14
```

<a id="b00014"></a>
## b00014 — word/document\.xml/body/\*\[14\]

```text
		2.3	SAP Terminology	14
```

<a id="b00015"></a>
## b00015 — word/document\.xml/body/\*\[15\]

```text
		3.	About Lands’ End	14
```

<a id="b00016"></a>
## b00016 — word/document\.xml/body/\*\[16\]

```text
		4.	Warehouse Overview and Floor Plan	15
```

<a id="b00017"></a>
## b00017 — word/document\.xml/body/\*\[17\]

```text
Warehouse Management	23
```

<a id="b00018"></a>
## b00018 — word/document\.xml/body/\*\[18\]

```text
		5.	Key Decisions / Assumptions	23
```

<a id="b00019"></a>
## b00019 — word/document\.xml/body/\*\[19\]

```text
		5.1	General	23
```

<a id="b00020"></a>
## b00020 — word/document\.xml/body/\*\[20\]

```text
		5.2	Interfaces	23
```

<a id="b00021"></a>
## b00021 — word/document\.xml/body/\*\[21\]

```text
		5.3	Locations	24
```

<a id="b00022"></a>
## b00022 — word/document\.xml/body/\*\[22\]

```text
		6.	Master Data	24
```

<a id="b00023"></a>
## b00023 — word/document\.xml/body/\*\[23\]

```text
		6.1	Organization	24
```

<a id="b00024"></a>
## b00024 — word/document\.xml/body/\*\[24\]

```text
		6.2	Facilities	25
```

<a id="b00025"></a>
## b00025 — word/document\.xml/body/\*\[25\]

```text
		6.3	Unit of Measure (UOM)	26
```

<a id="b00026"></a>
## b00026 — word/document\.xml/body/\*\[26\]

```text
		7.	Interfaces	26
```

<a id="b00027"></a>
## b00027 — word/document\.xml/body/\*\[27\]

```text
		7.1	Inbound Interfaces – Download from HOST to WM	27
```

<a id="b00028"></a>
## b00028 — word/document\.xml/body/\*\[28\]

```text
		7.1.1	Vendor	27
```

<a id="b00029"></a>
## b00029 — word/document\.xml/body/\*\[29\]

```text
		7.1.2	Facility	27
```

<a id="b00030"></a>
## b00030 — word/document\.xml/body/\*\[30\]

```text
		7.1.3	Item	27
```

<a id="b00031"></a>
## b00031 — word/document\.xml/body/\*\[31\]

```text
		7.1.4	Purchase Order (PO)	29
```

<a id="b00032"></a>
## b00032 — word/document\.xml/body/\*\[32\]

```text
		7.1.5	Advanced Ship Notice (ASN)	29
```

<a id="b00033"></a>
## b00033 — word/document\.xml/body/\*\[33\]

```text
		7.1.6	Original Order and Production Order	30
```

<a id="b00034"></a>
## b00034 — word/document\.xml/body/\*\[34\]

```text
		7.1.7	Process Needs	30
```

<a id="b00035"></a>
## b00035 — word/document\.xml/body/\*\[35\]

```text
		7.2	Outbound Interfaces – Upload from WM to HOST	30
```

<a id="b00036"></a>
## b00036 — word/document\.xml/body/\*\[36\]

```text
		7.2.1	Perpetual Inventory Transactions (PIX)	30
```

<a id="b00037"></a>
## b00037 — word/document\.xml/body/\*\[37\]

```text
		7.2.2	Ship Confirmation	31
```

<a id="b00038"></a>
## b00038 — word/document\.xml/body/\*\[38\]

```text
		7.3	Gaps and Extensions	32
```

<a id="b00039"></a>
## b00039 — word/document\.xml/body/\*\[39\]

```text
		8.	Pre-Receiving	32
```

<a id="b00040"></a>
## b00040 — word/document\.xml/body/\*\[40\]

```text
		8.1	Strategy	32
```

<a id="b00041"></a>
## b00041 — word/document\.xml/body/\*\[41\]

```text
		8.1.1	Purchase Orders (POs) and Advance Shipment Notices (ASNs)	32
```

<a id="b00042"></a>
## b00042 — word/document\.xml/body/\*\[42\]

```text
		8.1.2	Appointment Scheduling	32
```

<a id="b00043"></a>
## b00043 — word/document\.xml/body/\*\[43\]

```text
		8.1.3	Receiving Planning	33
```

<a id="b00044"></a>
## b00044 — word/document\.xml/body/\*\[44\]

```text
		8.1.4	Yard Management	33
```

<a id="b00045"></a>
## b00045 — word/document\.xml/body/\*\[45\]

```text
		8.1.5	Unloading	33
```

<a id="b00046"></a>
## b00046 — word/document\.xml/body/\*\[46\]

```text
		8.2	Assumptions	33
```

<a id="b00047"></a>
## b00047 — word/document\.xml/body/\*\[47\]

```text
		8.3	User Stories	34
```

<a id="b00048"></a>
## b00048 — word/document\.xml/body/\*\[48\]

```text
		8.3.1	User Story: Create ASN from PO	34
```

<a id="b00049"></a>
## b00049 — word/document\.xml/body/\*\[49\]

```text
		8.3.2	Create ASN (Blind Customer Returns)	36
```

<a id="b00050"></a>
## b00050 — word/document\.xml/body/\*\[50\]

```text
		8.3.3	User Story: Process Needs	36
```

<a id="b00051"></a>
## b00051 — word/document\.xml/body/\*\[51\]

```text
		8.3.4	User Story: Appointment Check-In	37
```

<a id="b00052"></a>
## b00052 — word/document\.xml/body/\*\[52\]

```text
		8.3.5	User Story: Yard Move Trailer	37
```

<a id="b00053"></a>
## b00053 — word/document\.xml/body/\*\[53\]

```text
		8.3.6	User Story: Appointment Check-Out	38
```

<a id="b00054"></a>
## b00054 — word/document\.xml/body/\*\[54\]

```text
		8.4	Features	38
```

<a id="b00055"></a>
## b00055 — word/document\.xml/body/\*\[55\]

```text
		8.4.1	Process Needs	38
```

<a id="b00056"></a>
## b00056 — word/document\.xml/body/\*\[56\]

```text
		8.4.2	Dock Doors	39
```

<a id="b00057"></a>
## b00057 — word/document\.xml/body/\*\[57\]

```text
		8.4.3	Yards	39
```

<a id="b00058"></a>
## b00058 — word/document\.xml/body/\*\[58\]

```text
		8.4.4	Appointments	39
```

<a id="b00059"></a>
## b00059 — word/document\.xml/body/\*\[59\]

```text
		8.5	Key Interfaces	39
```

<a id="b00060"></a>
## b00060 — word/document\.xml/body/\*\[60\]

```text
		8.6	Reports, Dashboards, Alerts	39
```

<a id="b00061"></a>
## b00061 — word/document\.xml/body/\*\[61\]

```text
		8.7	Gaps and Extensions	41
```

<a id="b00062"></a>
## b00062 — word/document\.xml/body/\*\[62\]

```text
		8.8	Labor Management	41
```

<a id="b00063"></a>
## b00063 — word/document\.xml/body/\*\[63\]

```text
		9.	Receiving	41
```

<a id="b00064"></a>
## b00064 — word/document\.xml/body/\*\[64\]

```text
		9.1	Strategy	41
```

<a id="b00065"></a>
## b00065 — word/document\.xml/body/\*\[65\]

```text
		9.1.1	MHE Receipts Strategy	41
```

<a id="b00066"></a>
## b00066 — word/document\.xml/body/\*\[66\]

```text
		9.1.2	Non-Conveyable Receipts / Mobile Receiving Strategy	42
```

<a id="b00067"></a>
## b00067 — word/document\.xml/body/\*\[67\]

```text
		9.1.3	Returns Strategy	43
```

<a id="b00068"></a>
## b00068 — word/document\.xml/body/\*\[68\]

```text
		9.2	Assumptions	44
```

<a id="b00069"></a>
## b00069 — word/document\.xml/body/\*\[69\]

```text
		9.2.1	General Receiving	44
```

<a id="b00070"></a>
## b00070 — word/document\.xml/body/\*\[70\]

```text
		9.2.2	Returns	44
```

<a id="b00071"></a>
## b00071 — word/document\.xml/body/\*\[71\]

```text
		9.3	User Stories	45
```

<a id="b00072"></a>
## b00072 — word/document\.xml/body/\*\[72\]

```text
		9.3.1	User Story: MHE Receiving	45
```

<a id="b00073"></a>
## b00073 — word/document\.xml/body/\*\[73\]

```text
		9.3.2	User Story: Receive iLPN Level ASN	45
```

<a id="b00074"></a>
## b00074 — word/document\.xml/body/\*\[74\]

```text
		9.3.3	User Story: Receive Item Level ASN	46
```

<a id="b00075"></a>
## b00075 — word/document\.xml/body/\*\[75\]

```text
		9.3.4	User Story: Receiving & Palletize	47
```

<a id="b00076"></a>
## b00076 — word/document\.xml/body/\*\[76\]

```text
		9.3.5	User Story: Bulk ASN Receiving	47
```

<a id="b00077"></a>
## b00077 — word/document\.xml/body/\*\[77\]

```text
		9.3.6	User Story: Production Order - Outsource Receiving	48
```

<a id="b00078"></a>
## b00078 — word/document\.xml/body/\*\[78\]

```text
		9.3.7	User Story: Production Orders – Outsourcing Damages Receiving (Not used with EOM)	49
```

<a id="b00079"></a>
## b00079 — word/document\.xml/body/\*\[79\]

```text
		9.3.8	User Story: Production Order – Large Order Receiving	49
```

<a id="b00080"></a>
## b00080 — word/document\.xml/body/\*\[80\]

```text
		9.3.9	User Story: Production Order – Singles Receiving	50
```

<a id="b00081"></a>
## b00081 — word/document\.xml/body/\*\[81\]

```text
		9.3.10	User Story: Production Order – Multis, Name Badge & Enterprise Order Receiving	51
```

<a id="b00082"></a>
## b00082 — word/document\.xml/body/\*\[82\]

```text
		9.3.11	User Story: Returns Station UI	52
```

<a id="b00083"></a>
## b00083 — word/document\.xml/body/\*\[83\]

```text
		9.3.12	User Story: Mobile Returns	53
```

<a id="b00084"></a>
## b00084 — word/document\.xml/body/\*\[84\]

```text
		9.4	Features	54
```

<a id="b00085"></a>
## b00085 — word/document\.xml/body/\*\[85\]

```text
		9.4.1	Receiving Rules	54
```

<a id="b00086"></a>
## b00086 — word/document\.xml/body/\*\[86\]

```text
		9.4.2	Post Receiving Rules	54
```

<a id="b00087"></a>
## b00087 — word/document\.xml/body/\*\[87\]

```text
		9.4.3	Process Needs	54
```

<a id="b00088"></a>
## b00088 — word/document\.xml/body/\*\[88\]

```text
		9.4.4	LPN Disposition Strategy	54
```

<a id="b00089"></a>
## b00089 — word/document\.xml/body/\*\[89\]

```text
		9.4.5	Disposition Determination Priorities	55
```

<a id="b00090"></a>
## b00090 — word/document\.xml/body/\*\[90\]

```text
		9.4.6	Post Processing LPN Disposition	55
```

<a id="b00091"></a>
## b00091 — word/document\.xml/body/\*\[91\]

```text
		9.4.7	LPN Disposition & Sort Strategy	55
```

<a id="b00092"></a>
## b00092 — word/document\.xml/body/\*\[92\]

```text
		9.4.8	Receiving Exceptions	56
```

<a id="b00093"></a>
## b00093 — word/document\.xml/body/\*\[93\]

```text
		9.4.9	MHE Exceptions	57
```

<a id="b00094"></a>
## b00094 — word/document\.xml/body/\*\[94\]

```text
		9.4.10	WM Mobile Exceptions	57
```

<a id="b00095"></a>
## b00095 — word/document\.xml/body/\*\[95\]

```text
		9.5	Key Interfaces	57
```

<a id="b00096"></a>
## b00096 — word/document\.xml/body/\*\[96\]

```text
		9.6	Reports, Dashboards, Alerts	57
```

<a id="b00097"></a>
## b00097 — word/document\.xml/body/\*\[97\]

```text
		9.7	Gaps and Extensions	58
```

<a id="b00098"></a>
## b00098 — word/document\.xml/body/\*\[98\]

```text
		9.8	Labor Management	58
```

<a id="b00099"></a>
## b00099 — word/document\.xml/body/\*\[99\]

```text
		9.9	Key Interfaces	58
```

<a id="b00100"></a>
## b00100 — word/document\.xml/body/\*\[100\]

```text
		9.10	Reports, Dashboards, Alerts	58
```

<a id="b00101"></a>
## b00101 — word/document\.xml/body/\*\[101\]

```text
		9.11	Gaps and Extensions	58
```

<a id="b00102"></a>
## b00102 — word/document\.xml/body/\*\[102\]

```text
		9.12	Labor Management	58
```

<a id="b00103"></a>
## b00103 — word/document\.xml/body/\*\[103\]

```text
		10.	Post-Receiving	59
```

<a id="b00104"></a>
## b00104 — word/document\.xml/body/\*\[104\]

```text
		10.1	Strategy	59
```

<a id="b00105"></a>
## b00105 — word/document\.xml/body/\*\[105\]

```text
		10.2	Assumptions	59
```

<a id="b00106"></a>
## b00106 — word/document\.xml/body/\*\[106\]

```text
		10.3	User Stories	59
```

<a id="b00107"></a>
## b00107 — word/document\.xml/body/\*\[107\]

```text
		10.3.1	User Story: Verify ASN in UI	59
```

<a id="b00108"></a>
## b00108 — word/document\.xml/body/\*\[108\]

```text
		10.4	Key Interfaces	60
```

<a id="b00109"></a>
## b00109 — word/document\.xml/body/\*\[109\]

```text
		10.5	Reports, Dashboards, Alerts	60
```

<a id="b00110"></a>
## b00110 — word/document\.xml/body/\*\[110\]

```text
		10.6	Gaps and Extensions	60
```

<a id="b00111"></a>
## b00111 — word/document\.xml/body/\*\[111\]

```text
		10.7	Labor Management	60
```

<a id="b00112"></a>
## b00112 — word/document\.xml/body/\*\[112\]

```text
		11.	Sorting	60
```

<a id="b00113"></a>
## b00113 — word/document\.xml/body/\*\[113\]

```text
		11.1	Strategy	60
```

<a id="b00114"></a>
## b00114 — word/document\.xml/body/\*\[114\]

```text
		11.2	User Stories	61
```

<a id="b00115"></a>
## b00115 — word/document\.xml/body/\*\[115\]

```text
		11.2.1	User Story: Sort iLPN & Palletize.	61
```

<a id="b00116"></a>
## b00116 — word/document\.xml/body/\*\[116\]

```text
		11.2.2	User Story: End Container	61
```

<a id="b00117"></a>
## b00117 — word/document\.xml/body/\*\[117\]

```text
		11.3	Reports, Dashboards, Alerts	61
```

<a id="b00118"></a>
## b00118 — word/document\.xml/body/\*\[118\]

```text
		11.4	Gaps and Extensions	62
```

<a id="b00119"></a>
## b00119 — word/document\.xml/body/\*\[119\]

```text
		11.5	Labor Management	62
```

<a id="b00120"></a>
## b00120 — word/document\.xml/body/\*\[120\]

```text
		12.	Vendor Performance	62
```

<a id="b00121"></a>
## b00121 — word/document\.xml/body/\*\[121\]

```text
		12.1	Strategy	62
```

<a id="b00122"></a>
## b00122 — word/document\.xml/body/\*\[122\]

```text
		12.2	Assumptions	62
```

<a id="b00123"></a>
## b00123 — word/document\.xml/body/\*\[123\]

```text
		12.3	User Stories	62
```

<a id="b00124"></a>
## b00124 — word/document\.xml/body/\*\[124\]

```text
		12.3.1	User Story: Vendor Performance	62
```

<a id="b00125"></a>
## b00125 — word/document\.xml/body/\*\[125\]

```text
		12.3.2	Updates	63
```

<a id="b00126"></a>
## b00126 — word/document\.xml/body/\*\[126\]

```text
		12.4	Reports, Dashboards, Alerts	63
```

<a id="b00127"></a>
## b00127 — word/document\.xml/body/\*\[127\]

```text
		12.5	Gaps and Extensions	63
```

<a id="b00128"></a>
## b00128 — word/document\.xml/body/\*\[128\]

```text
		12.6	Labor Management	63
```

<a id="b00129"></a>
## b00129 — word/document\.xml/body/\*\[129\]

```text
		13.	Putaway	63
```

<a id="b00130"></a>
## b00130 — word/document\.xml/body/\*\[130\]

```text
		13.1	Strategy	63
```

<a id="b00131"></a>
## b00131 — word/document\.xml/body/\*\[131\]

```text
		13.1.1	Putaway Planning Strategy	63
```

<a id="b00132"></a>
## b00132 — word/document\.xml/body/\*\[132\]

```text
		13.1.2	Putaway Task Creation Strategy	64
```

<a id="b00133"></a>
## b00133 — word/document\.xml/body/\*\[133\]

```text
		13.1.3	Putaway Execution Flow	64
```

<a id="b00134"></a>
## b00134 — word/document\.xml/body/\*\[134\]

```text
		13.2	Assumptions	64
```

<a id="b00135"></a>
## b00135 — word/document\.xml/body/\*\[135\]

```text
		13.3	User Stories	65
```

<a id="b00136"></a>
## b00136 — word/document\.xml/body/\*\[136\]

```text
		13.3.1	User Story: Pallet Putaway (Suggest Putaway /Tasking Mode)	65
```

<a id="b00137"></a>
## b00137 — word/document\.xml/body/\*\[137\]

```text
		13.3.2	User Story: LPN Putaway (User Directed)	65
```

<a id="b00138"></a>
## b00138 — word/document\.xml/body/\*\[138\]

```text
		13.3.3	User Story: Pallet Putaway to Replenishment Belt	66
```

<a id="b00139"></a>
## b00139 — word/document\.xml/body/\*\[139\]

```text
		13.3.4	User Story: Putaway Cart - Fill Active 	67
```

<a id="b00140"></a>
## b00140 — word/document\.xml/body/\*\[140\]

```text
		13.3.5	User Story: Fill Active	68
```

<a id="b00141"></a>
## b00141 — word/document\.xml/body/\*\[141\]

```text
		13.3.6	User Story: Post VAS Putaway	68
```

<a id="b00142"></a>
## b00142 — word/document\.xml/body/\*\[142\]

```text
		13.4	MHE Messages	69
```

<a id="b00143"></a>
## b00143 — word/document\.xml/body/\*\[143\]

```text
		13.5	Features	69
```

<a id="b00144"></a>
## b00144 — word/document\.xml/body/\*\[144\]

```text
		13.5.1	Alternate 	69
```

<a id="b00145"></a>
## b00145 — word/document\.xml/body/\*\[145\]

```text
		13.5.2	Substitute	69
```

<a id="b00146"></a>
## b00146 — word/document\.xml/body/\*\[146\]

```text
		13.5.3	Radial Search	69
```

<a id="b00147"></a>
## b00147 — word/document\.xml/body/\*\[147\]

```text
		13.5.4	Vicinity Based Putaway (Suggested Putaway)	69
```

<a id="b00148"></a>
## b00148 — word/document\.xml/body/\*\[148\]

```text
		13.6	Key Interfaces	69
```

<a id="b00149"></a>
## b00149 — word/document\.xml/body/\*\[149\]

```text
		13.7	Reports, Dashboards, Alerts	70
```

<a id="b00150"></a>
## b00150 — word/document\.xml/body/\*\[150\]

```text
		13.8	Gaps and Extensions	70
```

<a id="b00151"></a>
## b00151 — word/document\.xml/body/\*\[151\]

```text
		13.9	Labor Management	70
```

<a id="b00152"></a>
## b00152 — word/document\.xml/body/\*\[152\]

```text
		14.	Inventory Control	70
```

<a id="b00153"></a>
## b00153 — word/document\.xml/body/\*\[153\]

```text
		14.1	Cycle Counts Strategy	70
```

<a id="b00154"></a>
## b00154 — word/document\.xml/body/\*\[154\]

```text
		14.1.1	Assumptions	70
```

<a id="b00155"></a>
## b00155 — word/document\.xml/body/\*\[155\]

```text
		14.1.2	User Stories	71
```

<a id="b00156"></a>
## b00156 — word/document\.xml/body/\*\[156\]

```text
		14.2	Recall Inventory	76
```

<a id="b00157"></a>
## b00157 — word/document\.xml/body/\*\[157\]

```text
		14.2.1	User Story: Recall iLPN	76
```

<a id="b00158"></a>
## b00158 — word/document\.xml/body/\*\[158\]

```text
		14.3	Prepack Disassemble	77
```

<a id="b00159"></a>
## b00159 — word/document\.xml/body/\*\[159\]

```text
		14.3.1	Assumptions	77
```

<a id="b00160"></a>
## b00160 — word/document\.xml/body/\*\[160\]

```text
		14.3.2	User Stories	77
```

<a id="b00161"></a>
## b00161 — word/document\.xml/body/\*\[161\]

```text
		14.4	Miscellaneous Inventory Transactions	82
```

<a id="b00162"></a>
## b00162 — word/document\.xml/body/\*\[162\]

```text
		14.4.1	User Story: Modify iLPN	82
```

<a id="b00163"></a>
## b00163 — word/document\.xml/body/\*\[163\]

```text
		14.4.2	User Story: Consume iLPN	82
```

<a id="b00164"></a>
## b00164 — word/document\.xml/body/\*\[164\]

```text
		14.4.3	User Story: Pack iLPN (from Storage)	83
```

<a id="b00165"></a>
## b00165 — word/document\.xml/body/\*\[165\]

```text
		14.4.4	User Story: Create iLPN (from New)	83
```

<a id="b00166"></a>
## b00166 — word/document\.xml/body/\*\[166\]

```text
		14.4.5	User Story: Split Combine iLPN	84
```

<a id="b00167"></a>
## b00167 — word/document\.xml/body/\*\[167\]

```text
		14.4.6	User Story: Condition Code Assignment and Removal	84
```

<a id="b00168"></a>
## b00168 — word/document\.xml/body/\*\[168\]

```text
		14.4.7	User Story: Re-Identify Item / Bulk LPN Updates	85
```

<a id="b00169"></a>
## b00169 — word/document\.xml/body/\*\[169\]

```text
		14.4.8	User Story: Split Combine oLPN	85
```

<a id="b00170"></a>
## b00170 — word/document\.xml/body/\*\[170\]

```text
		14.4.9	User Story: Item Inquiry	86
```

<a id="b00171"></a>
## b00171 — word/document\.xml/body/\*\[171\]

```text
		14.4.10	User Story: iLPN Inquiry	86
```

<a id="b00172"></a>
## b00172 — word/document\.xml/body/\*\[172\]

```text
		14.4.11	User Story: Location Inquiry	87
```

<a id="b00173"></a>
## b00173 — word/document\.xml/body/\*\[173\]

```text
		14.4.12	User Story: Print iLPN Label	87
```

<a id="b00174"></a>
## b00174 — word/document\.xml/body/\*\[174\]

```text
		14.5	Features	87
```

<a id="b00175"></a>
## b00175 — word/document\.xml/body/\*\[175\]

```text
		14.5.1	Cycle Count Tolerance	87
```

<a id="b00176"></a>
## b00176 — word/document\.xml/body/\*\[176\]

```text
		14.6	Key Interfaces	87
```

<a id="b00177"></a>
## b00177 — word/document\.xml/body/\*\[177\]

```text
		14.7	Reports, Dashboards, Alerts	87
```

<a id="b00178"></a>
## b00178 — word/document\.xml/body/\*\[178\]

```text
		14.8	Gaps and Extensions	88
```

<a id="b00179"></a>
## b00179 — word/document\.xml/body/\*\[179\]

```text
		14.9	Labor Management	88
```

<a id="b00180"></a>
## b00180 — word/document\.xml/body/\*\[180\]

```text
		15.	Flowthrough	89
```

<a id="b00181"></a>
## b00181 — word/document\.xml/body/\*\[181\]

```text
		15.1	Strategy	89
```

<a id="b00182"></a>
## b00182 — word/document\.xml/body/\*\[182\]

```text
		15.2	Assumptions	89
```

<a id="b00183"></a>
## b00183 — word/document\.xml/body/\*\[183\]

```text
		15.3	User Stories	89
```

<a id="b00184"></a>
## b00184 — word/document\.xml/body/\*\[184\]

```text
		15.4	Features	89
```

<a id="b00185"></a>
## b00185 — word/document\.xml/body/\*\[185\]

```text
		15.4.1	Order Selection Criteria	89
```

<a id="b00186"></a>
## b00186 — word/document\.xml/body/\*\[186\]

```text
		15.5	Key Interfaces	90
```

<a id="b00187"></a>
## b00187 — word/document\.xml/body/\*\[187\]

```text
		15.6	Reports, Dashboards, Alerts	90
```

<a id="b00188"></a>
## b00188 — word/document\.xml/body/\*\[188\]

```text
		15.7	Gaps and Extensions	90
```

<a id="b00189"></a>
## b00189 — word/document\.xml/body/\*\[189\]

```text
		15.8	Labor Management	90
```

<a id="b00190"></a>
## b00190 — word/document\.xml/body/\*\[190\]

```text
		16.	Order Planning	91
```

<a id="b00191"></a>
## b00191 — word/document\.xml/body/\*\[191\]

```text
		16.1	Order Profile	91
```

<a id="b00192"></a>
## b00192 — word/document\.xml/body/\*\[192\]

```text
		16.2	Order Types	91
```

<a id="b00193"></a>
## b00193 — word/document\.xml/body/\*\[193\]

```text
		16.2.1	Customer Orders	92
```

<a id="b00194"></a>
## b00194 — word/document\.xml/body/\*\[194\]

```text
		16.2.2	Production Orders	92
```

<a id="b00195"></a>
## b00195 — word/document\.xml/body/\*\[195\]

```text
		16.2.3	Store Orders	99
```

<a id="b00196"></a>
## b00196 — word/document\.xml/body/\*\[196\]

```text
		16.2.4	Wholesale	99
```

<a id="b00197"></a>
## b00197 — word/document\.xml/body/\*\[197\]

```text
		16.2.5	Transfer Orders	100
```

<a id="b00198"></a>
## b00198 — word/document\.xml/body/\*\[198\]

```text
		16.2.6	Special Orders	100
```

<a id="b00199"></a>
## b00199 — word/document\.xml/body/\*\[199\]

```text
		16.3	Order Strategy	100
```

<a id="b00200"></a>
## b00200 — word/document\.xml/body/\*\[200\]

```text
		16.3.1	Order Aggregation	101
```

<a id="b00201"></a>
## b00201 — word/document\.xml/body/\*\[201\]

```text
		16.3.2	Order Prioritization	102
```

<a id="b00202"></a>
## b00202 — word/document\.xml/body/\*\[202\]

```text
		16.3.3	Order Pipeline	103
```

<a id="b00203"></a>
## b00203 — word/document\.xml/body/\*\[203\]

```text
		16.4	Order Planning Strategies	104
```

<a id="b00204"></a>
## b00204 — word/document\.xml/body/\*\[204\]

```text
		16.4.1	Unit Sorter Wave	105
```

<a id="b00205"></a>
## b00205 — word/document\.xml/body/\*\[205\]

```text
		16.4.2	Customer Order Planning (Non MHE Flows)	108
```

<a id="b00206"></a>
## b00206 — word/document\.xml/body/\*\[206\]

```text
		16.4.3	Production Order Wave	109
```

<a id="b00207"></a>
## b00207 — word/document\.xml/body/\*\[207\]

```text
		16.4.4	Retail Wave	109
```

<a id="b00208"></a>
## b00208 — word/document\.xml/body/\*\[208\]

```text
		16.4.5	Truck Load Wave	110
```

<a id="b00209"></a>
## b00209 — word/document\.xml/body/\*\[209\]

```text
		16.4.6	Chase Order Planning	110
```

<a id="b00210"></a>
## b00210 — word/document\.xml/body/\*\[210\]

```text
		16.4.7	Fill and Kill Order Planning	110
```

<a id="b00211"></a>
## b00211 — word/document\.xml/body/\*\[211\]

```text
		16.5	User Stories	111
```

<a id="b00212"></a>
## b00212 — word/document\.xml/body/\*\[212\]

```text
		16.5.1	User Story: Run Wave (Order Planning Strategy)	111
```

<a id="b00213"></a>
## b00213 — word/document\.xml/body/\*\[213\]

```text
		16.5.2	User Story: Run Wave (Orders UI)	111
```

<a id="b00214"></a>
## b00214 — word/document\.xml/body/\*\[214\]

```text
		16.5.3	User Story: Release Batches	112
```

<a id="b00215"></a>
## b00215 — word/document\.xml/body/\*\[215\]

```text
		16.5.4	User Story: Pre-VAS Batch and Task Label Printing	112
```

<a id="b00216"></a>
## b00216 — word/document\.xml/body/\*\[216\]

```text
		16.6	Features	113
```

<a id="b00217"></a>
## b00217 — word/document\.xml/body/\*\[217\]

```text
		16.6.1	Undo Wave	113
```

<a id="b00218"></a>
## b00218 — word/document\.xml/body/\*\[218\]

```text
		16.6.2	End Work	113
```

<a id="b00219"></a>
## b00219 — word/document\.xml/body/\*\[219\]

```text
		16.7	Key Interfaces	113
```

<a id="b00220"></a>
## b00220 — word/document\.xml/body/\*\[220\]

```text
		16.8	Reports, Dashboards, Alerts	113
```

<a id="b00221"></a>
## b00221 — word/document\.xml/body/\*\[221\]

```text
		16.9	Gaps and Extensions	114
```

<a id="b00222"></a>
## b00222 — word/document\.xml/body/\*\[222\]

```text
		16.10	Labor Management	114
```

<a id="b00223"></a>
## b00223 — word/document\.xml/body/\*\[223\]

```text
		17.	Allocation	115
```

<a id="b00224"></a>
## b00224 — word/document\.xml/body/\*\[224\]

```text
		17.1	Assumptions	115
```

<a id="b00225"></a>
## b00225 — word/document\.xml/body/\*\[225\]

```text
		17.2	Strategies	115
```

<a id="b00226"></a>
## b00226 — word/document\.xml/body/\*\[226\]

```text
		17.2.1	Unit Sorter Allocation Strategy	115
```

<a id="b00227"></a>
## b00227 — word/document\.xml/body/\*\[227\]

```text
		17.2.2	Customer Order Allocation Strategy (Non MHE)	117
```

<a id="b00228"></a>
## b00228 — word/document\.xml/body/\*\[228\]

```text
		17.2.3	Retail Allocation Strategy	118
```

<a id="b00229"></a>
## b00229 — word/document\.xml/body/\*\[229\]

```text
		17.2.4	Production Orders Allocation Strategy (Non MHE)	118
```

<a id="b00230"></a>
## b00230 — word/document\.xml/body/\*\[230\]

```text
		17.2.5	Truck Load Allocation Strategy	119
```

<a id="b00231"></a>
## b00231 — word/document\.xml/body/\*\[231\]

```text
		17.2.6	Chase Allocation Strategy	120
```

<a id="b00232"></a>
## b00232 — word/document\.xml/body/\*\[232\]

```text
		17.2.7	Fill and Kill Allocation Strategy	120
```

<a id="b00233"></a>
## b00233 — word/document\.xml/body/\*\[233\]

```text
		17.3	Reports, Dashboards, Alerts	120
```

<a id="b00234"></a>
## b00234 — word/document\.xml/body/\*\[234\]

```text
		17.4	Gaps and Extensions	120
```

<a id="b00235"></a>
## b00235 — word/document\.xml/body/\*\[235\]

```text
		17.5	Labor Management	121
```

<a id="b00236"></a>
## b00236 — word/document\.xml/body/\*\[236\]

```text
		18.	Routing	121
```

<a id="b00237"></a>
## b00237 — word/document\.xml/body/\*\[237\]

```text
		18.1	TL/LTL Carrier/Service/Ship Via	121
```

<a id="b00238"></a>
## b00238 — word/document\.xml/body/\*\[238\]

```text
		18.1.1	Service Provider	121
```

<a id="b00239"></a>
## b00239 — word/document\.xml/body/\*\[239\]

```text
		18.1.2	Service Level	121
```

<a id="b00240"></a>
## b00240 — word/document\.xml/body/\*\[240\]

```text
		18.1.3	Ship Via	121
```

<a id="b00241"></a>
## b00241 — word/document\.xml/body/\*\[241\]

```text
		18.2	Store Orders Routing Strategy	121
```

<a id="b00242"></a>
## b00242 — word/document\.xml/body/\*\[242\]

```text
		18.3	Parcel Routing Strategy	122
```

<a id="b00243"></a>
## b00243 — word/document\.xml/body/\*\[243\]

```text
		18.3.1	Parcel Determination Strategy	122
```

<a id="b00244"></a>
## b00244 — word/document\.xml/body/\*\[244\]

```text
		18.3.2	Parcel Resource	122
```

<a id="b00245"></a>
## b00245 — word/document\.xml/body/\*\[245\]

```text
		18.4	Outsource Production Order Routing Strategy	124
```

<a id="b00246"></a>
## b00246 — word/document\.xml/body/\*\[246\]

```text
		18.4.1	Bypass Routing	124
```

<a id="b00247"></a>
## b00247 — word/document\.xml/body/\*\[247\]

```text
		18.4.2	Routing Criteria	124
```

<a id="b00248"></a>
## b00248 — word/document\.xml/body/\*\[248\]

```text
		18.5	Truck Load Routing Strategy	125
```

<a id="b00249"></a>
## b00249 — word/document\.xml/body/\*\[249\]

```text
		18.5.1	Bypass Routing	125
```

<a id="b00250"></a>
## b00250 — word/document\.xml/body/\*\[250\]

```text
		18.5.2	Parcel Determination Strategy	126
```

<a id="b00251"></a>
## b00251 — word/document\.xml/body/\*\[251\]

```text
		18.5.3	Static Routing Strategy	126
```

<a id="b00252"></a>
## b00252 — word/document\.xml/body/\*\[252\]

```text
		18.5.4	Routing Criteria	126
```

<a id="b00253"></a>
## b00253 — word/document\.xml/body/\*\[253\]

```text
		19.	Cubing	128
```

<a id="b00254"></a>
## b00254 — word/document\.xml/body/\*\[254\]

```text
		19.1	Assumptions	128
```

<a id="b00255"></a>
## b00255 — word/document\.xml/body/\*\[255\]

```text
		19.2	Container Types	128
```

<a id="b00256"></a>
## b00256 — word/document\.xml/body/\*\[256\]

```text
		19.3	Cubing Strategies	129
```

<a id="b00257"></a>
## b00257 — word/document\.xml/body/\*\[257\]

```text
		19.3.1	Sorter X Cubing Strategy	129
```

<a id="b00258"></a>
## b00258 — word/document\.xml/body/\*\[258\]

```text
		19.3.2	Sorter A and B Cubing Strategy	130
```

<a id="b00259"></a>
## b00259 — word/document\.xml/body/\*\[259\]

```text
		19.3.3	Pre-VAS Cubing Strategy	131
```

<a id="b00260"></a>
## b00260 — word/document\.xml/body/\*\[260\]

```text
		19.3.4	Truck Load Cubing Strategy	132
```

<a id="b00261"></a>
## b00261 — word/document\.xml/body/\*\[261\]

```text
		19.3.5	Non-Cubed Criteria	133
```

<a id="b00262"></a>
## b00262 — word/document\.xml/body/\*\[262\]

```text
		20.	Work Release	134
```

<a id="b00263"></a>
## b00263 — word/document\.xml/body/\*\[263\]

```text
		20.1	Assumptions	134
```

<a id="b00264"></a>
## b00264 — word/document\.xml/body/\*\[264\]

```text
		20.2	Work	134
```

<a id="b00265"></a>
## b00265 — word/document\.xml/body/\*\[265\]

```text
		20.3	Resource Group Family Batching	134
```

<a id="b00266"></a>
## b00266 — word/document\.xml/body/\*\[266\]

```text
		20.3.1	Sorter A and Sorter B Resource Group Family	135
```

<a id="b00267"></a>
## b00267 — word/document\.xml/body/\*\[267\]

```text
		20.3.2	Sorter X Resource Group Family	137
```

<a id="b00268"></a>
## b00268 — word/document\.xml/body/\*\[268\]

```text
		20.3.3	HM Sorter Resource Group Family	140
```

<a id="b00269"></a>
## b00269 — word/document\.xml/body/\*\[269\]

```text
		20.4	Feedback Manager	146
```

<a id="b00270"></a>
## b00270 — word/document\.xml/body/\*\[270\]

```text
		20.5	Re-Prioritization	146
```

<a id="b00271"></a>
## b00271 — word/document\.xml/body/\*\[271\]

```text
		20.6	Sort Pack Resource Strategies	146
```

<a id="b00272"></a>
## b00272 — word/document\.xml/body/\*\[272\]

```text
		20.6.1	Sorter A and B Sort Pack Resource Strategy	146
```

<a id="b00273"></a>
## b00273 — word/document\.xml/body/\*\[273\]

```text
		20.6.2	Sorter-X Sort Pack Resource Strategy	147
```

<a id="b00274"></a>
## b00274 — word/document\.xml/body/\*\[274\]

```text
		20.6.3	HM Sorter Sort Pack Resource Strategy	147
```

<a id="b00275"></a>
## b00275 — word/document\.xml/body/\*\[275\]

```text
		20.7	Picking Task Creation Strategy	148
```

<a id="b00276"></a>
## b00276 — word/document\.xml/body/\*\[276\]

```text
		20.7.1	Sorter A and B Picking Task Creation Strategy	148
```

<a id="b00277"></a>
## b00277 — word/document\.xml/body/\*\[277\]

```text
		20.7.2	Sorter-X Picking Task Creation Strategy	149
```

<a id="b00278"></a>
## b00278 — word/document\.xml/body/\*\[278\]

```text
		20.7.3	HM Sorter Picking Task Creation Strategy	150
```

<a id="b00279"></a>
## b00279 — word/document\.xml/body/\*\[279\]

```text
		20.8	Direct Task Release	151
```

<a id="b00280"></a>
## b00280 — word/document\.xml/body/\*\[280\]

```text
		20.8.1	Direct Task Creation Strategy	151
```

<a id="b00281"></a>
## b00281 — word/document\.xml/body/\*\[281\]

```text
		20.9	MHE Messages	153
```

<a id="b00282"></a>
## b00282 — word/document\.xml/body/\*\[282\]

```text
		20.10	Gaps and Extensions	153
```

<a id="b00283"></a>
## b00283 — word/document\.xml/body/\*\[283\]

```text
		21.	Replenishment	153
```

<a id="b00284"></a>
## b00284 — word/document\.xml/body/\*\[284\]

```text
		21.1	Assumptions	153
```

<a id="b00285"></a>
## b00285 — word/document\.xml/body/\*\[285\]

```text
		21.2	Replenish iLPNs to Unit Storage	154
```

<a id="b00286"></a>
## b00286 — word/document\.xml/body/\*\[286\]

```text
		21.2.1	User Story: Pull iLPNs to Pallet for Replenishment Conveyor	154
```

<a id="b00287"></a>
## b00287 — word/document\.xml/body/\*\[287\]

```text
		21.2.2	User Story: Build & Execute Putaway Cart for iLPNs	155
```

<a id="b00288"></a>
## b00288 — word/document\.xml/body/\*\[288\]

```text
		21.2.3	User Story: Pull iLPNs to Pallet for Bulk Unit Storage	155
```

<a id="b00289"></a>
## b00289 — word/document\.xml/body/\*\[289\]

```text
		21.2.4	User Story: Putaway Bulk iLPNs on Pallet	155
```

<a id="b00290"></a>
## b00290 — word/document\.xml/body/\*\[290\]

```text
		21.2.5	User Story: Pull iLPNs to Pallet for GOH Unit Storage	155
```

<a id="b00291"></a>
## b00291 — word/document\.xml/body/\*\[291\]

```text
		21.2.6	User Story: Putaway GOH iLPNs on Pallet	156
```

<a id="b00292"></a>
## b00292 — word/document\.xml/body/\*\[292\]

```text
		21.2.7	User Story: Pull Pallet for Replenishment	156
```

<a id="b00293"></a>
## b00293 — word/document\.xml/body/\*\[293\]

```text
		21.2.8	Process	156
```

<a id="b00294"></a>
## b00294 — word/document\.xml/body/\*\[294\]

```text
		21.3	MHE Messages	157
```

<a id="b00295"></a>
## b00295 — word/document\.xml/body/\*\[295\]

```text
		21.4	Features	157
```

<a id="b00296"></a>
## b00296 — word/document\.xml/body/\*\[296\]

```text
		21.4.1	Lean Time Replenishment	157
```

<a id="b00297"></a>
## b00297 — word/document\.xml/body/\*\[297\]

```text
		21.4.2	Auto Substitute iLPN	157
```

<a id="b00298"></a>
## b00298 — word/document\.xml/body/\*\[298\]

```text
		21.4.3	Alternate iLPN (not currently utilized)	157
```

<a id="b00299"></a>
## b00299 — word/document\.xml/body/\*\[299\]

```text
		21.4.4	Skip Cancel	158
```

<a id="b00300"></a>
## b00300 — word/document\.xml/body/\*\[300\]

```text
		21.5	Key Interfaces	158
```

<a id="b00301"></a>
## b00301 — word/document\.xml/body/\*\[301\]

```text
		21.6	Reports, Dashboards, Alerts	158
```

<a id="b00302"></a>
## b00302 — word/document\.xml/body/\*\[302\]

```text
		21.7	Gaps and Extensions	158
```

<a id="b00303"></a>
## b00303 — word/document\.xml/body/\*\[303\]

```text
		21.8	Labor Management	158
```

<a id="b00304"></a>
## b00304 — word/document\.xml/body/\*\[304\]

```text
		22.	Picking	158
```

<a id="b00305"></a>
## b00305 — word/document\.xml/body/\*\[305\]

```text
		22.1	Assumptions	158
```

<a id="b00306"></a>
## b00306 — word/document\.xml/body/\*\[306\]

```text
		22.2	Picking Strategy	159
```

<a id="b00307"></a>
## b00307 — word/document\.xml/body/\*\[307\]

```text
		22.3	User Stories	159
```

<a id="b00308"></a>
## b00308 — word/document\.xml/body/\*\[308\]

```text
		22.3.1	User Story: HM LPN Pull	159
```

<a id="b00309"></a>
## b00309 — word/document\.xml/body/\*\[309\]

```text
		22.3.2	User Story: HM Blk Pick	160
```

<a id="b00310"></a>
## b00310 — word/document\.xml/body/\*\[310\]

```text
		22.3.3	User Story: VAS LPN Pull	161
```

<a id="b00311"></a>
## b00311 — word/document\.xml/body/\*\[311\]

```text
		22.3.4	User Story: VAS BlkPick	163
```

<a id="b00312"></a>
## b00312 — word/document\.xml/body/\*\[312\]

```text
		22.3.5	User Story: Heat Transfer Logo Pick (Logo Pick)	164
```

<a id="b00313"></a>
## b00313 — word/document\.xml/body/\*\[313\]

```text
		22.3.6	User Story: Name Badge Pick (NameBdgPick)	166
```

<a id="b00314"></a>
## b00314 — word/document\.xml/body/\*\[314\]

```text
		22.3.7	User Story: MHE LPN Pull	167
```

<a id="b00315"></a>
## b00315 — word/document\.xml/body/\*\[315\]

```text
		22.3.8	User Story: MHE Bulk Pick (SA Act Pck, SB Act Pck, SX Act Pck)	169
```

<a id="b00316"></a>
## b00316 — word/document\.xml/body/\*\[316\]

```text
		22.3.9	User Story: LPN Pull	170
```

<a id="b00317"></a>
## b00317 — word/document\.xml/body/\*\[317\]

```text
		22.3.10	Bulk Pick (Pick to Tote/Guney)	172
```

<a id="b00318"></a>
## b00318 — word/document\.xml/body/\*\[318\]

```text
		22.3.11	User Story: Olpn Pick to Pallet (Olpn2Pallet)	173
```

<a id="b00319"></a>
## b00319 — word/document\.xml/body/\*\[319\]

```text
		22.3.12	User Story: Olpn Pick	174
```

<a id="b00320"></a>
## b00320 — word/document\.xml/body/\*\[320\]

```text
		22.4	Picking Exceptions	176
```

<a id="b00321"></a>
## b00321 — word/document\.xml/body/\*\[321\]

```text
		22.4.1	Assumptions	176
```

<a id="b00322"></a>
## b00322 — word/document\.xml/body/\*\[322\]

```text
		22.4.2	User Story: Picking Exceptions from LPN Pulls	176
```

<a id="b00323"></a>
## b00323 — word/document\.xml/body/\*\[323\]

```text
		22.4.3	User Story: Picking Exceptions from Active Locations	177
```

<a id="b00324"></a>
## b00324 — word/document\.xml/body/\*\[324\]

```text
		22.5	MHE Messages	178
```

<a id="b00325"></a>
## b00325 — word/document\.xml/body/\*\[325\]

```text
		22.6	Features	178
```

<a id="b00326"></a>
## b00326 — word/document\.xml/body/\*\[326\]

```text
		22.6.1	Alternate Location Pick (not currently utilized)	178
```

<a id="b00327"></a>
## b00327 — word/document\.xml/body/\*\[327\]

```text
		22.6.2	Skip/Replenish (not currently utilized)	178
```

<a id="b00328"></a>
## b00328 — word/document\.xml/body/\*\[328\]

```text
		22.6.3	Picking Shortage	178
```

<a id="b00329"></a>
## b00329 — word/document\.xml/body/\*\[329\]

```text
		22.6.4	Replenish Storage Location (not currently utilized)	178
```

<a id="b00330"></a>
## b00330 — word/document\.xml/body/\*\[330\]

```text
		22.6.5	In Line Cycle Counts	178
```

<a id="b00331"></a>
## b00331 — word/document\.xml/body/\*\[331\]

```text
		22.7	Key Interfaces	178
```

<a id="b00332"></a>
## b00332 — word/document\.xml/body/\*\[332\]

```text
		22.8	Reports, Dashboards, Alerts	178
```

<a id="b00333"></a>
## b00333 — word/document\.xml/body/\*\[333\]

```text
		22.9	Gaps and Extensions	178
```

<a id="b00334"></a>
## b00334 — word/document\.xml/body/\*\[334\]

```text
		22.10	Labor Management	179
```

<a id="b00335"></a>
## b00335 — word/document\.xml/body/\*\[335\]

```text
		23.	Pre-VAS Sorting	179
```

<a id="b00336"></a>
## b00336 — word/document\.xml/body/\*\[336\]

```text
		23.1	User Stories	180
```

<a id="b00337"></a>
## b00337 — word/document\.xml/body/\*\[337\]

```text
		23.1.1	User Story: Pre-VAS Order Sort	180
```

<a id="b00338"></a>
## b00338 — word/document\.xml/body/\*\[338\]

```text
		23.2	Pre-VAS Sorting Exceptions	181
```

<a id="b00339"></a>
## b00339 — word/document\.xml/body/\*\[339\]

```text
		23.2.1	User Story: Gurney or Tote Inventory Discrepancies	181
```

<a id="b00340"></a>
## b00340 — word/document\.xml/body/\*\[340\]

```text
		23.2.2	User Story: Clear Pre-VAS Putwall	181
```

<a id="b00341"></a>
## b00341 — word/document\.xml/body/\*\[341\]

```text
		23.2.3	User Story: Close Container	182
```

<a id="b00342"></a>
## b00342 — word/document\.xml/body/\*\[342\]

```text
		23.2.4	User Story: Residual Putaway	183
```

<a id="b00343"></a>
## b00343 — word/document\.xml/body/\*\[343\]

```text
		24.	Packing	183
```

<a id="b00344"></a>
## b00344 — word/document\.xml/body/\*\[344\]

```text
		24.1	Assumptions	183
```

<a id="b00345"></a>
## b00345 — word/document\.xml/body/\*\[345\]

```text
		24.2	User Stories	184
```

<a id="b00346"></a>
## b00346 — word/document\.xml/body/\*\[346\]

```text
		24.2.1	User Story: Putwall Olpn Sort (LE Putwall Sort)	184
```

<a id="b00347"></a>
## b00347 — word/document\.xml/body/\*\[347\]

```text
		24.2.2	User Story: Gift Box Putwall Sort	187
```

<a id="b00348"></a>
## b00348 — word/document\.xml/body/\*\[348\]

```text
		24.2.3	User Story: Pack Station UI 	188
```

<a id="b00349"></a>
## b00349 — word/document\.xml/body/\*\[349\]

```text
		24.2.4	Pack Station UI (Single Olpn Tote)	189
```

<a id="b00350"></a>
## b00350 — word/document\.xml/body/\*\[350\]

```text
		24.2.5	User Story: Large VAS Customer Orders (Non-Cube Packing Flow)	190
```

<a id="b00351"></a>
## b00351 — word/document\.xml/body/\*\[351\]

```text
		24.2.6	User Story: Pre VAS Packing (Descriptor Label Print)	191
```

<a id="b00352"></a>
## b00352 — word/document\.xml/body/\*\[352\]

```text
		24.2.7	User Story: Put to Store - Packing	192
```

<a id="b00353"></a>
## b00353 — word/document\.xml/body/\*\[353\]

```text
		24.2.8	User Story: Put to Store – Close Container	193
```

<a id="b00354"></a>
## b00354 — word/document\.xml/body/\*\[354\]

```text
		24.3	Packing Exceptions Stories	193
```

<a id="b00355"></a>
## b00355 — word/document\.xml/body/\*\[355\]

```text
		24.3.1	User Story: MHE Chute Close (Matthews Pack Stations)	194
```

<a id="b00356"></a>
## b00356 — word/document\.xml/body/\*\[356\]

```text
		24.3.2	User Story: Clear Putwall	196
```

<a id="b00357"></a>
## b00357 — word/document\.xml/body/\*\[357\]

```text
		24.3.3	User Story: Hospital Runner Putaway (Outbound Putaway – User Directed)	196
```

<a id="b00358"></a>
## b00358 — word/document\.xml/body/\*\[358\]

```text
		24.3.4	User Story: Hospital Putwall Sort (Hospital Runner)	197
```

<a id="b00359"></a>
## b00359 — word/document\.xml/body/\*\[359\]

```text
		24.3.5	User Story: Re-print VAS Descriptor Label	198
```

<a id="b00360"></a>
## b00360 — word/document\.xml/body/\*\[360\]

```text
		24.4	MHE Messages	198
```

<a id="b00361"></a>
## b00361 — word/document\.xml/body/\*\[361\]

```text
		24.5	Features	198
```

<a id="b00362"></a>
## b00362 — word/document\.xml/body/\*\[362\]

```text
		24.6	Key Interfaces	198
```

<a id="b00363"></a>
## b00363 — word/document\.xml/body/\*\[363\]

```text
		24.7	Reports, Dashboards, Alerts	198
```

<a id="b00364"></a>
## b00364 — word/document\.xml/body/\*\[364\]

```text
		24.8	Gaps and Extensions	198
```

<a id="b00365"></a>
## b00365 — word/document\.xml/body/\*\[365\]

```text
		24.9	Labor Management	199
```

<a id="b00366"></a>
## b00366 — word/document\.xml/body/\*\[366\]

```text
		25.	Outbound Putaway	199
```

<a id="b00367"></a>
## b00367 — word/document\.xml/body/\*\[367\]

```text
		25.1	Assumptions	199
```

<a id="b00368"></a>
## b00368 — word/document\.xml/body/\*\[368\]

```text
		25.2	Pre-VAS Putaway Strategy	199
```

<a id="b00369"></a>
## b00369 — word/document\.xml/body/\*\[369\]

```text
		25.2.1	Stevens Point Putaway Flow	199
```

<a id="b00370"></a>
## b00370 — word/document\.xml/body/\*\[370\]

```text
		25.2.1	Dodgeville Putaway Flow	200
```

<a id="b00371"></a>
## b00371 — word/document\.xml/body/\*\[371\]

```text
		25.2.2	Stevens Point Shipping Dock Putaway Criteria (Tasking)	200
```

<a id="b00372"></a>
## b00372 — word/document\.xml/body/\*\[372\]

```text
		25.2.3	Stevens Point Load Trailer (WM Mobile)	201
```

<a id="b00373"></a>
## b00373 — word/document\.xml/body/\*\[373\]

```text
		25.2.4	Stevens Point Unload Trailer (WM Mobile)	202
```

<a id="b00374"></a>
## b00374 — word/document\.xml/body/\*\[374\]

```text
		25.2.5	Heat Transfer Logo Outbound Putaway (Tasking)	203
```

<a id="b00375"></a>
## b00375 — word/document\.xml/body/\*\[375\]

```text
		25.2.6	HM06 Outbound Putaway (Tasking)	203
```

<a id="b00376"></a>
## b00376 — word/document\.xml/body/\*\[376\]

```text
		25.2.7	Pre-VAS Opening Station Putaway (Tasking)	204
```

<a id="b00377"></a>
## b00377 — word/document\.xml/body/\*\[377\]

```text
		25.2.8	Pre-VAS Putaway (WM Mobile)	204
```

<a id="b00378"></a>
## b00378 — word/document\.xml/body/\*\[378\]

```text
		25.3	MHE Induction Putaway Strategy	205
```

<a id="b00379"></a>
## b00379 — word/document\.xml/body/\*\[379\]

```text
		25.3.1	Sorter A, Sorter B and Sorter X MHE Induction Putaway (Tasking)	205
```

<a id="b00380"></a>
## b00380 — word/document\.xml/body/\*\[380\]

```text
		25.3.2	HM Sorter Induction Putaway (WM Mobile)	205
```

<a id="b00381"></a>
## b00381 — word/document\.xml/body/\*\[381\]

```text
		25.4	LE Outbound Putaway Strategy	206
```

<a id="b00382"></a>
## b00382 — word/document\.xml/body/\*\[382\]

```text
		25.4.1	Singles Pulls Putaway (Tasking)	206
```

<a id="b00383"></a>
## b00383 — word/document\.xml/body/\*\[383\]

```text
		25.4.2	Put to Store Putaway (Tasking)	206
```

<a id="b00384"></a>
## b00384 — word/document\.xml/body/\*\[384\]

```text
		25.4.3	Workstation Putaway (Tasking)	207
```

<a id="b00385"></a>
## b00385 — word/document\.xml/body/\*\[385\]

```text
		25.4.4	Staging Putaway (Tasking)	207
```

<a id="b00386"></a>
## b00386 — word/document\.xml/body/\*\[386\]

```text
		25.4.5	Anchor Olpn (WM Mobile)	208
```

<a id="b00387"></a>
## b00387 — word/document\.xml/body/\*\[387\]

```text
		25.4.6	Outbound Putaway (WM Mobile)	209
```

<a id="b00388"></a>
## b00388 — word/document\.xml/body/\*\[388\]

```text
		25.5	Features	209
```

<a id="b00389"></a>
## b00389 — word/document\.xml/body/\*\[389\]

```text
		25.6	Key Interfaces	209
```

<a id="b00390"></a>
## b00390 — word/document\.xml/body/\*\[390\]

```text
		25.7	Reports, Dashboards, Alerts	209
```

<a id="b00391"></a>
## b00391 — word/document\.xml/body/\*\[391\]

```text
		25.8	Gaps and Extensions	210
```

<a id="b00392"></a>
## b00392 — word/document\.xml/body/\*\[392\]

```text
		25.9	Labor Management	210
```

<a id="b00393"></a>
## b00393 — word/document\.xml/body/\*\[393\]

```text
		26.	Shipping	210
```

<a id="b00394"></a>
## b00394 — word/document\.xml/body/\*\[394\]

```text
		26.1	Assumptions	210
```

<a id="b00395"></a>
## b00395 — word/document\.xml/body/\*\[395\]

```text
		26.2	Parcel Shipping	211
```

<a id="b00396"></a>
## b00396 — word/document\.xml/body/\*\[396\]

```text
		26.2.1	User Story: WM Mobile De-Manifest oLPN	211
```

<a id="b00397"></a>
## b00397 — word/document\.xml/body/\*\[397\]

```text
		26.2.2	User Story: WM Mobile Manifest oLPN	211
```

<a id="b00398"></a>
## b00398 — word/document\.xml/body/\*\[398\]

```text
		26.2.3	User Story: Weight & Manifest oLPN in UI	212
```

<a id="b00399"></a>
## b00399 — word/document\.xml/body/\*\[399\]

```text
		26.2.4	Olpn Planning Strategy	212
```

<a id="b00400"></a>
## b00400 — word/document\.xml/body/\*\[400\]

```text
		26.3	LTL Shipping	212
```

<a id="b00401"></a>
## b00401 — word/document\.xml/body/\*\[401\]

```text
		26.3.1	User Story: Manual Shipment Creation	213
```

<a id="b00402"></a>
## b00402 — word/document\.xml/body/\*\[402\]

```text
		26.3.2	User Story:  Shipment Updates	214
```

<a id="b00403"></a>
## b00403 — word/document\.xml/body/\*\[403\]

```text
		26.3.3	User Story: Load Trailer	215
```

<a id="b00404"></a>
## b00404 — word/document\.xml/body/\*\[404\]

```text
		26.3.4	User Story: Unload Olpn	215
```

<a id="b00405"></a>
## b00405 — word/document\.xml/body/\*\[405\]

```text
		26.3.5	User Story: Close Shipment	216
```

<a id="b00406"></a>
## b00406 — word/document\.xml/body/\*\[406\]

```text
		26.4	Production Order Ship Confirm	216
```

<a id="b00407"></a>
## b00407 — word/document\.xml/body/\*\[407\]

```text
		26.5	MHE Messages	217
```

<a id="b00408"></a>
## b00408 — word/document\.xml/body/\*\[408\]

```text
		26.6	Features	217
```

<a id="b00409"></a>
## b00409 — word/document\.xml/body/\*\[409\]

```text
		26.7	Key Interfaces	217
```

<a id="b00410"></a>
## b00410 — word/document\.xml/body/\*\[410\]

```text
		26.8	Reports, Dashboards, Alerts	217
```

<a id="b00411"></a>
## b00411 — word/document\.xml/body/\*\[411\]

```text
		26.9	Gaps and Extensions	217
```

<a id="b00412"></a>
## b00412 — word/document\.xml/body/\*\[412\]

```text
		26.10	Labor Management	217
```

<a id="b00413"></a>
## b00413 — word/document\.xml/body/\*\[413\]

```text
		27.	Miscellaneous Warehouse Processes	218
```

<a id="b00414"></a>
## b00414 — word/document\.xml/body/\*\[414\]

```text
		27.1	User Stories	218
```

<a id="b00415"></a>
## b00415 — word/document\.xml/body/\*\[415\]

```text
		27.1.1	User Story: Audit oLPN	218
```

<a id="b00416"></a>
## b00416 — word/document\.xml/body/\*\[416\]

```text
		27.1.2	User Story: Palletize oLPNs	219
```

<a id="b00417"></a>
## b00417 — word/document\.xml/body/\*\[417\]

```text
Acknowledgement	220
```

<a id="b00418"></a>
## b00418 — word/document\.xml/body/\*\[418\]

```text

```

<a id="b00419"></a>
## b00419 — word/document\.xml/body/\*\[419\]

```text

```

<a id="b00420"></a>
## b00420 — word/document\.xml/body/\*\[420\]

```text


```

<a id="b00421"></a>
## b00421 — word/document\.xml/body/\*\[421\]

```text
Document Revision History
```

<a id="b00422"></a>
## b00422 — word/document\.xml/body/\*\[422\]

```text
Changed By	Date	Version	Revision Notes
	Benjamin Aponte	10/07/2024	2.0	Inbound Flow Draft – Based on Reedsburg CFD Version 1.2
	Benjamin Aponte	10/29/2024	2.1	Inbound flow updates after initial review.
	Benjamin Aponte	11/4/2024	2.2	Added Dodgeville Outbound Flows.
	Benjamin Aponte	11/20/2024	2.3	Updates production order receiving stories.
	Benjamin Aponte	11/22/2024	2.4	Updates production order flows.
	Benjamin Aponte	12/19/2024	2.5	Updates to Pre VAS and Pos VAS flows
	Benjamin Aponte	3/27/2025	2.6	Added Prepack Disassemble Story
	Benjamin Aponte	3/28/2025	2.7	Updated Production Order receiving process.
	Benjamin Aponte	4/4/2025	2.8	Updates form sections 9.3.6 to section 23
	Benjamin Aponte	4/18/2025	2.9	Adding Routing Strategy and Manual Shipment Creation and Updates using ULC.
	Benjamin Aponte	4/23/2025	2.10	Added Put to Store packing story and additional parcel resource determination criteria.
	Benjamin Aponte	4/29/2025	2.11	Removed duplicate section 9.9.1 (identical to 9.4.1) and renumbered section 9.9.2 to 9.4.7.
```

<a id="b00423"></a>
## b00423 — word/document\.xml/body/\*\[423\]

```text

```

<a id="b00424"></a>
## b00424 — word/document\.xml/body/\*\[424\]

```text

```

<a id="b00425"></a>
## b00425 — word/document\.xml/body/\*\[425\]

```text

```

<a id="b00426"></a>
## b00426 — word/document\.xml/body/\*\[426\]

```text


```

<a id="b00427"></a>
## b00427 — word/document\.xml/body/\*\[427\]

```text
Introduction to the Solution Design Document
```

<a id="b00428"></a>
## b00428 — word/document\.xml/body/\*\[428\]

```text
Purpose
```

<a id="b00429"></a>
## b00429 — word/document\.xml/body/\*\[429\]

```text
The primary objective of this document is to outline the proposed processes and scope from the perspective of Manhattan Associates across all stages of implementation. It also aims to identify key extensions to the Manhattan Associates suite of products. Specifically, this document details the scope for the receiving, storage, and fulfillment processes at the Dodgeville, WI Distribution Center.
```

<a id="b00430"></a>
## b00430 — word/document\.xml/body/\*\[430\]

```text
The first objective is to capture customer-specific user stories and flows that leverage systematic functionality and any relevant exceptions. These user stories help identify detailed assumptions for each flow or module, defining the system’s parameters.
```

<a id="b00431"></a>
## b00431 — word/document\.xml/body/\*\[431\]

```text
The second objective is to identify key gaps and required enhancements to the Manhattan Associates suite of products to support the defined user stories where the base product does not offer the desired functionality.
```

<a id="b00432"></a>
## b00432 — word/document\.xml/body/\*\[432\]

```text
For interfaces, the purpose of the Solution Design Document is to describe the interfaces within the scope. Detailed information about these interfaces is provided in the Interface Mapping Sheets by the Manhattan Integration Team.
```

<a id="b00433"></a>
## b00433 — word/document\.xml/body/\*\[433\]

```text
Note: Potential gap areas are highlighted throughout the document in this format – [GAP XX]. A detailed review is needed to resolve these gaps, either through business process changes, system configuration changes, extensions, integration changes, or developing workarounds as part of the detailed design activity. Detailed process flows are defined during the detailed design phase. For interfaces, the purpose of the Solution Design Document is to describe the interfaces within the scope. Detailed information about these interfaces is provided in the Interface Mapping Sheets by Manhattan Integration Team.
```

<a id="b00434"></a>
## b00434 — word/document\.xml/body/\*\[434\]

```text
Summary of Product Suite covered in this document:
```

<a id="b00435"></a>
## b00435 — word/document\.xml/body/\*\[435\]

```text
Products Licensed	Notes
Manhattan Active Supply Chain (MAWM)	Includes Distribution Management (DM) – i.e. Warehouse Management, Labor Management, and Supply Chain Intelligence solutions
```

<a id="b00436"></a>
## b00436 — word/document\.xml/body/\*\[436\]

```text

```

<a id="b00437"></a>
## b00437 — word/document\.xml/body/\*\[437\]

```text
Terminology / Acronyms 
```

<a id="b00438"></a>
## b00438 — word/document\.xml/body/\*\[438\]

```text
Manhattan Terminology
```

<a id="b00439"></a>
## b00439 — word/document\.xml/body/\*\[439\]

```text
Terminology	Definition
Allocation	The process of dedicating specific inventory to distribution orders.
Appointment	An appointment is an agreement with the carrier or business partner (vendor) to arrive at a warehouse at an agreed-upon date and time and is an acceptance by the warehouse to receive the delivered freight.
ASN	Advanced Shipment Notice.
Receiving objects in MAWM indicating a unique inbound shipment of inventory for the warehouse.
Inbound Delivery	A logical grouping of inbound ASNs. Typically based on the ASNs that are part of the same physical container/trailer. One Inbound Delivery can consist of one or more inbound ASNs.
BOL	Bill of Lading.
A legal document used for the transportation of goods (non-parcel).
Condition Codes	Can be applied to location or LPN to prevent use. Inventory with an applied condition code can appear allocable or un-allocable to the host, depending on configuration. (Formerly Lock Codes)
DC	Distribution Center
DM	Distribution Management
EIF	Equipment Integration Framework
Error	An error in WM does NOT allow the user to continue WM processing after viewing the error. 
Facility	A facility is an establishment, such as a warehouse, which serves a particular purpose in the shipping or delivery process.
Host	Generic term for the main external system upstream from MAWM (i.e. SAP, OMS, etc.) responsible for transmitting orders for fulfillment and consuming inventory updates; also holds master data.
iLPN	Inbound License Plate Number.
A unique barcode used in MAWM to track inbound inventory. A traceable moveable unit in the warehouse (case, pallet, tote). For Lands’ End, inbound inventory is identified by an LPN at the physical case level.
Item	Sellable product (aka SKU – Stock Keeping Unit). Usually item name, item description, and item barcode (e.g. UPC) are three unique values.
JSON	JavaScript Object Notation. The format in which MAWM expects incoming interfaces and sends outgoing messages.
LM	Labor Management
LPN	License Plate Number.
MA	Manhattan Associates
MAWM	Manhattan Active Warehouse Management
MHE	Material Handling Equipment.
Generically, any equipment used in the facility: forklift, pallet jack, putwall, conveyance, unit sorter, carton sorter, hang sorter, etc. Specifically, any equipment with a WCS component.
MIF	Manhattan Integration Framework
oLPN	Outbound License Plate Number.
A unique barcode used in WM to track outbound inventory.
Order	Formerly Distribution Order.
Orders include header-level level information like destination store facility and line-level information like item and quantity.
Original Order (OO)	Orders that are aggregated by MAWM based on rules and aggregation criteria
Order Aggregation	Original Orders with a matching Aggregation attribute may be combined into a single Distribution Order with the intent to cube inventory from multiple Original Orders into less oLPNs to be shipped.
Order Consolidation	Orders which will be shipped via the same shipment may have a consolidation attribute which brings oLPNs for the same attribute together to a like staging location before loading and shipping. The intent of this functionality is to keep all cartons for an order together after picking form different areas in the warehouse to be loaded together.
Distribution Order
(a.k.a. DC Order)	Distribution Order are either 1:1 to the Original Order or 1:N to multiple Original Orders in an attempt to aggregate in warehouse fulfillment.
Organization	Organizations represent legal entities such as companies and brands. Each organization has a unique set of application configuration, transactional data such as orders, and users. All transactional data is associated with one organization.
Pack	Represents the standard quantity UOM for a vendor case (box) of a particular item.
Pallet	A physical surface to stack cases on top of. Tracked systemically as an iLPN. Can have one barcode for all inventory on the pallet or unique LPNs for each case (nested LPNs). 
PIX	Perpetual Inventory Transaction.
A PIX record is created by WM whenever a change in inventory occurs that increases or decreases net inventory between available and unavailable inventory buckets. The PIX record type and code provides visibility to the type of inventory change that occurred (LPN consumed, LPN received, LPN/location adjusted, etc.).
PO	Purchase Order.
Order placed from corporate systems to vendor for stock inventory. Usually fulfilled by multiple shipments from the vendor.
Putaway	The systematic process of locating product to a WM location.
SCAC	Standard Carrier Alpha Code
SCI	Supply Chain Intelligence.
Cognos-based business intelligence reporting software.
Ship Confirmation	Outbound interface to the host to detail the final order header and order detail information after an order is shipped.
Shipment	Unique grouping of orders on an outbound trailer. May have one or more outbound stops (non-parcel). 
Strategy	A collection of configuration parameters to drive a certain process in the warehouse (e.g. Receiving Strategy)
Storage Location	Physical location which stores inventory for order fulfillment. Formerly active locations, reserve locations, case pick locations.
Tasks	A piece of work created for a specific allocation. Multiple allocations can be grouped into one task for efficiency.
TBF	To Be Filled.
Quantity allocated on a task destined for a location.
TBP	To Be Picked.
Quantity allocated for a task to be systematically picked from a location.
TMS	Transportation Management System
Trailer	Physical truck which contains the ASN/PO.
Yard Zone and Slots	Yard Zone is a group of Yard Slots that needs to be used in a similar manner.
Yard Slots are parking slots in a Yard when trailers can be dropped off once its checked-in to the Yard.
TL	Truck Load
LTL	Less Than Truck Load
UI	User Interface
UOM	Unit of Measure for quantifying and classifying storage, allocation, distribution, etc. For example: Pallet, LPN, Packs, Subpacks, Units.
Unit	Lowest sellable UOM (Unit of Measure) for an Item (aka “Each”)
Warning	A warning in WM allows the user to continue WM processing after acknowledging / accepting the warning message.
Wave	The process to select an order, allocate inventory, determine outbound shipping container size (cubing), and create tasks.
WCS	Warehouse Control System.
System external to WM that directly controls MHE given commands from WM.
WM Mobile	Manhattan Active Warehouse Management’s Android based application running on warehouse Radio Frequency (RF) devices utilized by warehouse operators to perform warehouse activities.
WM	Warehouse Management.
YM	Yard Management
```

<a id="b00440"></a>
## b00440 — word/document\.xml/body/\*\[440\]

```text

```

<a id="b00441"></a>
## b00441 — word/document\.xml/body/\*\[441\]

```text
Lands’ End Terminology
```

<a id="b00442"></a>
## b00442 — word/document\.xml/body/\*\[442\]

```text
Lands’ End Terminology	Definition
Shipment	Outbound packages, known as OLPN in Manhattan.
Gurney	Metal container used as a tote to handle and transport inventory inside the warehouse or to transfer product between Lands’ End distribution centers.
 VAS Order	Production Order
Shipment	An Order Olpn
Carrier Service	Shipment  TL or LTL / Parcel Carrier Service
CORE	Lands’ End Core Business Items/SKU
LEO	Lands’ End Outfitter Items/SKU
LESU	Lands’ End School Uniform
LEF	Lands’ End Fulfilled (Amazon, Kohls, etc.)
```

<a id="b00443"></a>
## b00443 — word/document\.xml/body/\*\[443\]

```text

```

<a id="b00444"></a>
## b00444 — word/document\.xml/body/\*\[444\]

```text
SAP Terminology
```

<a id="b00445"></a>
## b00445 — word/document\.xml/body/\*\[445\]

```text
SAP Terminology	Definition
Production Order	Order to produce a custom item by customer specifications.
KMAT	From the German “konfigurierbares Material” was formed the abbreviation KMAT, pronounced “kay-mat” used by SAP to define custom items.
Batch Number	Used to track the items associated to a specific production order.
```

<a id="b00446"></a>
## b00446 — word/document\.xml/body/\*\[446\]

```text

```

<a id="b00447"></a>
## b00447 — word/document\.xml/body/\*\[447\]

```text
About Lands’ End
```

<a id="b00448"></a>
## b00448 — word/document\.xml/body/\*\[448\]

```text
Lands’ End, Inc. is an American retailer specializing in casual clothing, luggage, and home furnishings. Founded in 1963 by Gary Comer in Chicago, Illinois, the company is now headquartered in Dodgeville, Wisconsin. Lands’ End is known for its traditional, casual apparel for men, women, and children, which is generally resistant to changing fashion trends.
```

<a id="b00449"></a>
## b00449 — word/document\.xml/body/\*\[449\]

```text
The company markets its products through various channels, including its flagship and specialty catalogs, about 15 outlet and retail stores in the US, UK, and Japan, and approximately 870 Sears stores. Lands’ End also has a significant online presence and continues to expand globally.
```

<a id="b00450"></a>
## b00450 — word/document\.xml/body/\*\[450\]

```text


```

<a id="b00451"></a>
## b00451 — word/document\.xml/body/\*\[451\]

```text
Warehouse Overview and Floor Plan
```

<a id="b00452"></a>
## b00452 — word/document\.xml/body/\*\[452\]

```text
The Dodgeville facility consists of two interconnected physical buildings located in Dodgeville, WI, and a third building located in Stevens Point, WI. All three buildings are configured as one distribution center in Manhattan. Each physical building location is identified as a warehouse location with an area number that specifies the respective building.
```

<a id="b00453"></a>
## b00453 — word/document\.xml/body/\*\[453\]

```text
Building	Warehouse Area	Building Size
Building 2, First Floor	02	540,300 sq. ft.
Building 2, Second Floor	02	540,300 sq. ft.
Building 6	06	146,000 sq. ft.
Steven Points	07	159,410 sq. ft.
Reedsburg, First Floor	?	
Reedsburg, Second Floor	?	
```

<a id="b00454"></a>
## b00454 — word/document\.xml/body/\*\[454\]

```text

```

<a id="b00455"></a>
## b00455 — word/document\.xml/body/\*\[455\]

```text

```

<a id="b00456"></a>
## b00456 — word/document\.xml/body/\*\[456\]

```text
Figure 1 - Dodgeville Building 2 & 6
```

<a id="b00457"></a>
## b00457 — word/document\.xml/body/\*\[457\]

```text

```

<a id="b00458"></a>
## b00458 — word/document\.xml/body/\*\[458\]

```text
Figure 2 - Stevens Point Building
```

<a id="b00459"></a>
## b00459 — word/document\.xml/body/\*\[459\]

```text

```

<a id="b00460"></a>
## b00460 — word/document\.xml/body/\*\[460\]

```text

```

<a id="b00461"></a>
## b00461 — word/document\.xml/body/\*\[461\]

```text
Figure 3 - Reedsburg Building
```

<a id="b00462"></a>
## b00462 — word/document\.xml/body/\*\[462\]

```text
     
```

<a id="b00463"></a>
## b00463 — word/document\.xml/body/\*\[463\]

```text

```

<a id="b00464"></a>
## b00464 — word/document\.xml/body/\*\[464\]

```text

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

```

<a id="b00468"></a>
## b00468 — word/document\.xml/body/\*\[468\]

```text
Figure 4 – Dodgeville Building 2 – First Floor
```

<a id="b00469"></a>
## b00469 — word/document\.xml/body/\*\[469\]

```text


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
Figure 5 – Dodgeville Building 2, Second Floor
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
Figure 6 – Dodgeville Building 6, First Floor
```

<a id="b00476"></a>
## b00476 — word/document\.xml/body/\*\[476\]

```text

```

<a id="b00477"></a>
## b00477 — word/document\.xml/body/\*\[477\]

```text

```

<a id="b00478"></a>
## b00478 — word/document\.xml/body/\*\[478\]

```text
Figure 7 - Steven Point Floor Plan
```

<a id="b00479"></a>
## b00479 — word/document\.xml/body/\*\[479\]

```text


```

<a id="b00480"></a>
## b00480 — word/document\.xml/body/\*\[480\]

```text

```

<a id="b00481"></a>
## b00481 — word/document\.xml/body/\*\[481\]

```text
Figure 8 - Reedsburg, First Floor
```

<a id="b00482"></a>
## b00482 — word/document\.xml/body/\*\[482\]

```text

```

<a id="b00483"></a>
## b00483 — word/document\.xml/body/\*\[483\]

```text


```

<a id="b00484"></a>
## b00484 — word/document\.xml/body/\*\[484\]

```text
Figure 9 - Reedsburg, Second Floor
```

<a id="b00485"></a>
## b00485 — word/document\.xml/body/\*\[485\]

```text
Warehouse Management
```

<a id="b00486"></a>
## b00486 — word/document\.xml/body/\*\[486\]

```text
Key Decisions / Assumptions
```

<a id="b00487"></a>
## b00487 — word/document\.xml/body/\*\[487\]

```text
General
```

<a id="b00488"></a>
## b00488 — word/document\.xml/body/\*\[488\]

```text
This Solution Design Document (SDD) covers the implementation of Manhattan Active Warehouse Management (MAWM). Detailed documentation for Supply-Chain Intelligence (SCI), Labor Management (LM), and Transportation Management (TM) is covered in separate documents. 
```

<a id="b00489"></a>
## b00489 — word/document\.xml/body/\*\[489\]

```text

```

<a id="b00490"></a>
## b00490 — word/document\.xml/body/\*\[490\]

```text
Several UI and Mobile features are mentioned and described in this document (e.g. Mobile Receiving).
```

<a id="b00491"></a>
## b00491 — word/document\.xml/body/\*\[491\]

```text

```

<a id="b00492"></a>
## b00492 — word/document\.xml/body/\*\[492\]

```text
To maintain optimal system performance, the Manhattan Active Supply platform databases are configured to automatically purge data older than 90 days. However, this data retention period may be adjusted based on operational volumes and technical assessments outlined in the hardware-sizing document.
```

<a id="b00493"></a>
## b00493 — word/document\.xml/body/\*\[493\]

```text

```

<a id="b00494"></a>
## b00494 — word/document\.xml/body/\*\[494\]

```text
All users must be created or interfaced to Manhattan Active Platform.
```

<a id="b00495"></a>
## b00495 — word/document\.xml/body/\*\[495\]

```text

```

<a id="b00496"></a>
## b00496 — word/document\.xml/body/\*\[496\]

```text
All configuration is displayed in a language determined by the user account within WM. 
```

<a id="b00497"></a>
## b00497 — word/document\.xml/body/\*\[497\]

```text

```

<a id="b00498"></a>
## b00498 — word/document\.xml/body/\*\[498\]

```text
The SDD does not provide technical information regarding API calls, FTP, etc. That information is housed in a separate document.
```

<a id="b00499"></a>
## b00499 — word/document\.xml/body/\*\[499\]

```text

```

<a id="b00500"></a>
## b00500 — word/document\.xml/body/\*\[500\]

```text
All tracked items in Manhattan Active Supply Chain Execution must have a scannable barcode in the Item Master for identification.
```

<a id="b00501"></a>
## b00501 — word/document\.xml/body/\*\[501\]

```text

```

<a id="b00502"></a>
## b00502 — word/document\.xml/body/\*\[502\]

```text
All extensions mentioned in the SDD are subject to change based on detailed design conversations.
```

<a id="b00503"></a>
## b00503 — word/document\.xml/body/\*\[503\]

```text

```

<a id="b00504"></a>
## b00504 — word/document\.xml/body/\*\[504\]

```text
Any label formatting not owned by Lands’ End will require a customization.
```

<a id="b00505"></a>
## b00505 — word/document\.xml/body/\*\[505\]

```text

```

<a id="b00506"></a>
## b00506 — word/document\.xml/body/\*\[506\]

```text
Interfaces
```

<a id="b00507"></a>
## b00507 — word/document\.xml/body/\*\[507\]

```text
Detailed interface mapping between HOST and DM for all inbound and outbound interfaces is documented separately in the Interface Mapping Spreadsheets.
```

<a id="b00508"></a>
## b00508 — word/document\.xml/body/\*\[508\]

```text
No file size for any interface into DM exceeds 5 MB, and all files will be in JSON format.  Details provided with the detail interface mapping documents.
```

<a id="b00509"></a>
## b00509 — word/document\.xml/body/\*\[509\]

```text
Each SKU is unique to Lands’ End.
```

<a id="b00510"></a>
## b00510 — word/document\.xml/body/\*\[510\]

```text
The product class/sub-class of each item is interfaced from the host system as part of the item master.
```

<a id="b00511"></a>
## b00511 — word/document\.xml/body/\*\[511\]

```text
Only interfaces referenced in the SDD are considered in scope. If an interface is not mentioned, it is not considered in scope for the Global Design.
```

<a id="b00512"></a>
## b00512 — word/document\.xml/body/\*\[512\]

```text
Item without defined dimensions are initially created with default dimensions and volume based on their product class or category. These default dimensions are updated once the item is physically received.
```

<a id="b00513"></a>
## b00513 — word/document\.xml/body/\*\[513\]

```text
Fields that cannot be mapped directly to an interface field can utilize an extended attribute. This allows Lands’ End to map the value upstream to that extended attribute, which can also be edited in the associated UIs.
```

<a id="b00514"></a>
## b00514 — word/document\.xml/body/\*\[514\]

```text
If an interface fails in the MAWM application, it must be resubmitted or resent from upstream. This could involve resending the interface from the source system or resubmitting the message from the integration middleware, depending on the type of failure. Reports can be used to identify when an interface has failed, alerting Lands’ End to research the issue and resubmit the interface upstream once the issue is resolved, following the respective interface troubleshooting steps.
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
Locations
```

<a id="b00518"></a>
## b00518 — word/document\.xml/body/\*\[518\]

```text

```

<a id="b00519"></a>
## b00519 — word/document\.xml/body/\*\[519\]

```text
All warehouse locations are labeled with a scannable barcode.
```

<a id="b00520"></a>
## b00520 — word/document\.xml/body/\*\[520\]

```text
Lands’ End uses Storage Locations with a Storage UOM of “LPN” (reserve locations) to putaway pallets and cases.
```

<a id="b00521"></a>
## b00521 — word/document\.xml/body/\*\[521\]

```text
Lands’ End uses Storage Locations with a Storage UOM of "Unit" known as active pick locations for loose unit picking.
```

<a id="b00522"></a>
## b00522 — word/document\.xml/body/\*\[522\]

```text
Lands’ End creates permanent location assignments for seasonal items. Additional dynamic assignments can be created during the waving process based on item demand.
```

<a id="b00523"></a>
## b00523 — word/document\.xml/body/\*\[523\]

```text
LPN Storage Locations (reserve) should be configured with a 'Temporary' SKU dedication type for single-item assignments and a 'None' SKU dedication type for multiple-item assignments.
```

<a id="b00524"></a>
## b00524 — word/document\.xml/body/\*\[524\]

```text
Unit Storage Locations (active) are mostly single SKU locations. For random returns storage locations, Lands’ End uses multi-SKU active locations. The SKU assignment and putaway to these locations are handled manually, as the system does not create multi-SKU assignments or direct inventory to these locations.
```

<a id="b00525"></a>
## b00525 — word/document\.xml/body/\*\[525\]

```text
Lands’ End does not track iLPNs in picking locations within WM.
```

<a id="b00526"></a>
## b00526 — word/document\.xml/body/\*\[526\]

```text
The location component “Area” is used to define storage and staging locations, specifying the physical building to which the location belongs.
```

<a id="b00527"></a>
## b00527 — word/document\.xml/body/\*\[527\]

```text
Randoms returns storage locations are configured with a Storage UOM of “LPN”.
```

<a id="b00528"></a>
## b00528 — word/document\.xml/body/\*\[528\]

```text
Master Data
```

<a id="b00529"></a>
## b00529 — word/document\.xml/body/\*\[529\]

```text
Organization
```

<a id="b00530"></a>
## b00530 — word/document\.xml/body/\*\[530\]

```text
An organization represents the highest-level configuration entity within MAWM. The hierarchy-tree in order from highest to lowest is as follows: 
```

<a id="b00531"></a>
## b00531 — word/document\.xml/body/\*\[531\]

```text
Level 0 – Parent/Holding
```

<a id="b00532"></a>
## b00532 — word/document\.xml/body/\*\[532\]

```text
Level 1 – Line of Business
```

<a id="b00533"></a>
## b00533 — word/document\.xml/body/\*\[533\]

```text
Level 2 – Facility Organization, Facility. 
```

<a id="b00534"></a>
## b00534 — word/document\.xml/body/\*\[534\]

```text

```

<a id="b00535"></a>
## b00535 — word/document\.xml/body/\*\[535\]

```text
Some MAWM configuration and transactional data can be maintained at an L1 organization level to be shared across L2 organizations/facilities. A common use case is a centralized item master so that any updates to an item master (L1) are immediately reflected in every facility (L2) underneath the common organization (L1).
```

<a id="b00536"></a>
## b00536 — word/document\.xml/body/\*\[536\]

```text
Lands’ End maintains a single L1 organization within their application, with each facility (Reedsburg/Dodgeville) maintained as a separate L2 organization under the L1 parent Lands’ End organization.
```

<a id="b00537"></a>
## b00537 — word/document\.xml/body/\*\[537\]

```text
Organization (L0)	Line of Business (L1)	Facility (L2)
Lands’ End Inc. (Org Id = LE-0)	Lands’ End Distribution Centers (Org Id = LE)	Reedsburg, WI (Org Id = 4)
		Dodgeville, WI (Org Id = 1)
```

<a id="b00538"></a>
## b00538 — word/document\.xml/body/\*\[538\]

```text

```

<a id="b00539"></a>
## b00539 — word/document\.xml/body/\*\[539\]

```text


```

<a id="b00540"></a>
## b00540 — word/document\.xml/body/\*\[540\]

```text
Facilities
```

<a id="b00541"></a>
## b00541 — word/document\.xml/body/\*\[541\]

```text
The term “facility” typically refers to a physical warehouse, distribution center, store, customer, vendor, etc. All of Lands’ End facilities executing WM are configured under a single Level 1 organization in MAWM and within the respective Level 2 organization for each facility, as displayed in the organigram below.
```

<a id="b00542"></a>
## b00542 — word/document\.xml/body/\*\[542\]

```text

```

<a id="b00543"></a>
## b00543 — word/document\.xml/body/\*\[543\]

```text
Master Data	L0	L1	L2
	LE-0	LE	4	1
	Lands’ End Inc.	Lands’ End DCs	Reedsburg, WI	Dodgeville, WI
Super / Corporate Users	X	X	 	 
Warehouse Associates, Temp Users	 	X	X	X
Warehouse Supervisors	 	X	X	X
Items	 	X	 	 
Item Facility	 	 	X	X
Facility (DC, Stores)	 	X	 	 
Vendors	 	X	 	 
Warehouse Storage Locations	 	 	X	X
Inventory	 	 	X	X
Integration (ASN, Orders)	 	 	X	X
Functional Config (Inbound & Outbound)	 	X	X	X
```

<a id="b00544"></a>
## b00544 — word/document\.xml/body/\*\[544\]

```text

```

<a id="b00545"></a>
## b00545 — word/document\.xml/body/\*\[545\]

```text


```

<a id="b00546"></a>
## b00546 — word/document\.xml/body/\*\[546\]

```text
Unit of Measure (UOM)
```

<a id="b00547"></a>
## b00547 — word/document\.xml/body/\*\[547\]

```text
Lands’ End	Pallet	Case	Unit
MAWM	iLPN	iLPN	Unit or Each
```

<a id="b00548"></a>
## b00548 — word/document\.xml/body/\*\[548\]

```text

```

<a id="b00549"></a>
## b00549 — word/document\.xml/body/\*\[549\]

```text
UOM	Receipt	Order Quantity	Pick	Replenishment
	Eaches (Units)	Eaches (Units)	iLPNs / Units	iLPNs
```

<a id="b00550"></a>
## b00550 — word/document\.xml/body/\*\[550\]

```text

```

<a id="b00551"></a>
## b00551 — word/document\.xml/body/\*\[551\]

```text
UOM	Weight	Volume	Dimensions
	Pounds (lb.)	Cubic Feet (cuft)	Feet (ft)
```

<a id="b00552"></a>
## b00552 — word/document\.xml/body/\*\[552\]

```text

```

<a id="b00553"></a>
## b00553 — word/document\.xml/body/\*\[553\]

```text

```

<a id="b00554"></a>
## b00554 — word/document\.xml/body/\*\[554\]

```text
Interfaces
```

<a id="b00555"></a>
## b00555 — word/document\.xml/body/\*\[555\]

```text
The table below outlines the HOST system relevant interfaces that are in scope. Other interfaces such as MHE interfaces and External Parcel Integration (EPI) interfaces are documented in the respective design documents for MHE and EPI.
```

<a id="b00556"></a>
## b00556 — word/document\.xml/body/\*\[556\]

```text
Name	Source	Integration Layer	Destination	Format	Type
	Item	SAP	TBD	MAWM	JSON	Master Data
	Facility	SAP	TBD	MAWM	JSON	Master Data
	Vendor	SAP	TBD	MAWM	JSON	Master Data
	Purchase Order	SAP	TBD	MAWM	JSON	Transactional
	ASN
    - LPN Level
    - Item Level	SAP	TBD	MAWM	JSON	Transactional
	Orders
Store Orders
Customer Orders 
Production Orders
Transfer Orders	SAP	TBD	MAWM	JSON	Transactional
	PIX
	    - Inventory Event (Adjustment)
	    - Receipt PIX
	    - ASN Verification
	    - Inventory Sync	MAWM	TBD	SAP	JSON	Transactional
	ShipConfirm	MAWM	TBD	SAP	JSON	Transactional
	OB ASN	MAWM	TBD	SAP	JSON	Transactional
```

<a id="b00557"></a>
## b00557 — word/document\.xml/body/\*\[557\]

```text

```

<a id="b00558"></a>
## b00558 — word/document\.xml/body/\*\[558\]

```text
Note: Detailed interface mapping and message exchange is covered in separate interface spreadsheets by touchpoint.
```

<a id="b00559"></a>
## b00559 — word/document\.xml/body/\*\[559\]

```text
Inbound Interfaces – Download from HOST to WM
```

<a id="b00560"></a>
## b00560 — word/document\.xml/body/\*\[560\]

```text
The following interfaces are used to send data from the host systems into the WM application. The respective host or integration layer translates and transforms the information into the standard JSON format required for each interface. These download interfaces provide WM with the necessary master and transactional data for warehouse processing.  
```

<a id="b00561"></a>
## b00561 — word/document\.xml/body/\*\[561\]

```text
Vendor
```

<a id="b00562"></a>
## b00562 — word/document\.xml/body/\*\[562\]

```text
Lands’ End leverages the Vendor interface to track and store vendor information in MAWM. Vendor information can be used to help drive warehouse processes (inbound rules, etc.). There is also an entry required when performing Vendor Performance. 
```

<a id="b00563"></a>
## b00563 — word/document\.xml/body/\*\[563\]

```text
Facility
```

<a id="b00564"></a>
## b00564 — word/document\.xml/body/\*\[564\]

```text
The Facility interface is used to track store information for commonly used facilities that Lands’ End ships to and from. 
```

<a id="b00565"></a>
## b00565 — word/document\.xml/body/\*\[565\]

```text
Item
```

<a id="b00566"></a>
## b00566 — word/document\.xml/body/\*\[566\]

```text
The Item interface is sent from Host to MAWM and is used to track all item specific information that the warehouse requires visibility to. Any fields that are required by Lands’ End but are not associated with a specific field on the base Item template can be added as an extended attribute field.
```

<a id="b00567"></a>
## b00567 — word/document\.xml/body/\*\[567\]

```text
Items are viewed in MAWM using the Items and Item Facilities screens. WM Mobile also provides the Item Inquiry transaction for mobile users to view the inventory for an item within the facility. The function displays the on-hand and allocated quantities for all locations in the warehouse containing inventory for a scanned item. The mobile user can also drill into additional details about each location – including the total number of – and list of all – iLPNs for each item in a particular location.
```

<a id="b00568"></a>
## b00568 — word/document\.xml/body/\*\[568\]

```text
Assumptions
```

<a id="b00569"></a>
## b00569 — word/document\.xml/body/\*\[569\]

```text

```

<a id="b00570"></a>
## b00570 — word/document\.xml/body/\*\[570\]

```text
Items are tracked in their lowest shippable unit of measure (UOM).
```

<a id="b00571"></a>
## b00571 — word/document\.xml/body/\*\[571\]

```text
Item interfaces include all known item barcodes (Item Codes) and a barcode format is defined for each barcode length.
```

<a id="b00572"></a>
## b00572 — word/document\.xml/body/\*\[572\]

```text
Lands’ End does not maintain standard pack or case quantities in the Item Master.
```

<a id="b00573"></a>
## b00573 — word/document\.xml/body/\*\[573\]

```text
Dimensions are cubic-scanned in each distribution center (DC) and maintained on the Item Facility record.
```

<a id="b00574"></a>
## b00574 — word/document\.xml/body/\*\[574\]

```text
Item Export is used to update the host system with dimensions for items that have already been cubic-scanned in MAWM.
```

<a id="b00575"></a>
## b00575 — word/document\.xml/body/\*\[575\]

```text
Item records interfaced from the host system are supplemented with dimensions, if available.
```

<a id="b00576"></a>
## b00576 — word/document\.xml/body/\*\[576\]

```text
Any item attributes (e.g., Inventory Type) must be individually enabled at the item level. If an attribute is not enabled for a particular item, even if the attribute information is communicated on the PO/ASN, MAWM does not persist that information to the created inventory.
```

<a id="b00577"></a>
## b00577 — word/document\.xml/body/\*\[577\]

```text
Lands’ End does not track lots or batches.
```

<a id="b00578"></a>
## b00578 — word/document\.xml/body/\*\[578\]

```text
All SKUs ship as a single unit of measure (UOM). Items with multiple shipping options (e.g., single t-shirt vs. 3-pack) are treated as separate SKUs. An extended attribute is added to the item master to identify pre-packed items.
```

<a id="b00579"></a>
## b00579 — word/document\.xml/body/\*\[579\]

```text
Expiration Date or Consumption Priority Date tracking for consumable items (e.g., food, candy) is not maintained as inventory attributes.
```

<a id="b00580"></a>
## b00580 — word/document\.xml/body/\*\[580\]

```text


```

<a id="b00581"></a>
## b00581 — word/document\.xml/body/\*\[581\]

```text
Key Interface Values
```

<a id="b00582"></a>
## b00582 — word/document\.xml/body/\*\[582\]

```text

```

<a id="b00583"></a>
## b00583 — word/document\.xml/body/\*\[583\]

```text
*Additional values to be added after Item Interface detailed mapping discussions*
```

<a id="b00584"></a>
## b00584 — word/document\.xml/body/\*\[584\]

```text
Field	Notes
Item ID	SAP Material / SKU / Item 
Item Description	Description of the item
Item Barcode 	UPC barcode
Sortable indicator	Indicates whether item is sortable (unit sorter)
Conveyable Indicator	Indicates whether an item is conveyable
Garment on Hangar Indicator	Indicates whether an item is GOH or not
Prepack indicator	Indicate whether an item is a prepack.
Attribute Group	“Gift Card” configured to track serial number for gift cards.
NextAppearance	Item Next Appearance Season.
LastAppearance	Item Last Appearance Season.
ContainerType	Determines whether the Item is eligible for BAG cubing or must be cubed into BOX.
FragileItem	Determines if the Item is Fragile or required special handling.
ItemObsolete	Determines if the item is active or obsolete at LE.
VendorBoxEligible	Determines if the item is eligible to be shipped in the vendor box in a singles scenario. 

Ex: If we have shoes in a vendor box, then we can pick and pack without using additional packing materials (i.e. don't have to put the shoe box in another box or bag). Sleeping bag could be a ship alone and vendor box eligible.
DropShipItem	Determines if the item is considered a Drop Ship item.
ShipAlone	Determines if the item is required to ship alone as a single oLPN.
GOHItem	Determines if the item is a GOH item.
Ca	Determines if the item is a hemmable pant.
LegacyStyleId	Legacy Style Number.
LongStyleDescription	Long Style Description.
Sortable	Indicated if the item is sortable on the MHE
VelocityCode	Velocity ranking used for slotting rules and reports.
Collection	
Theme	
KeyItem	
CreationSeason	
RolloutSeason	
FadingSeason	
VendorConsignment	
ProgramEligible	This field indicates whether the account is an Enterprise Level of Engagement (LEO) account, such as Wells Fargo or American Airlines. 
AlertCode	Returns alert code.
ScrapUponReturn	
CareLabel	
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
Features
```

<a id="b00588"></a>
## b00588 — word/document\.xml/body/\*\[588\]

```text
Item Facility
```

<a id="b00589"></a>
## b00589 — word/document\.xml/body/\*\[589\]

```text
For any values on the Item master that are maintained at the Facility-level and/or need to be protected from host system during item import can be captured in MAWM and housed in the Item Facility record, which has the same fields as the item master record. When pulling item information (dimensions) within MAWM, MAWM first looks to the item facility record to see if a value is populated before moving to the item master.
```

<a id="b00590"></a>
## b00590 — word/document\.xml/body/\*\[590\]

```text
Item Export
```

<a id="b00591"></a>
## b00591 — word/document\.xml/body/\*\[591\]

```text
Item Import Exclusion functionality can be leveraged to store fields that need to be protected from HOST import. These fields are not included in the interface mapping and are therefore protected. Any fields maintained by the warehouse are commonly configured for item facility override via the WM UI, so that the Item values captured by the facility (e.g. sorter/MHE related attributes, unit dimensions of length, width, height, weight, volume) are not overridden by updates from the host system. 
```

<a id="b00592"></a>
## b00592 — word/document\.xml/body/\*\[592\]

```text
Purchase Order (PO)
```

<a id="b00593"></a>
## b00593 — word/document\.xml/body/\*\[593\]

```text
Purchase orders are sent from the host system to WM for every expected warehouse receipt. For each PO, an ASN is either interfaced into WM or created manually within WM to receive against as part of receiving execution. Each PO line interfaced into MAWM is expected to be specific to a SKU and quantity.
```

<a id="b00594"></a>
## b00594 — word/document\.xml/body/\*\[594\]

```text
Once receiving begins against a PO line, the line is no longer able to be canceled or have the order quantity reduced to below the received quantity. POs and PO lines can be canceled by the host prior to receiving by sending an updated PO interface and specifying what needs to be canceled. In order for POs to be purged out of the system, the PO status must be updated to ‘Closed’ either via an interface update, a backend update, or manually after the necessary research is complete. 
```

<a id="b00595"></a>
## b00595 — word/document\.xml/body/\*\[595\]

```text
Assumptions
```

<a id="b00596"></a>
## b00596 — word/document\.xml/body/\*\[596\]

```text
A purchase order (PO) is interfaced into the Warehouse Management (WM) system for any items to be received by Lands’ End.
```

<a id="b00597"></a>
## b00597 — word/document\.xml/body/\*\[597\]

```text
All PO updates, including creation and modifications, are initiated by the host system and interfaced into WM. POs are not created or updated directly in WM.
```

<a id="b00598"></a>
## b00598 — word/document\.xml/body/\*\[598\]

```text
For a PO to be purged in WM, it must be closed.
```

<a id="b00599"></a>
## b00599 — word/document\.xml/body/\*\[599\]

```text
Advanced Ship Notice (ASN)
```

<a id="b00600"></a>
## b00600 — word/document\.xml/body/\*\[600\]

```text
An ASN is required to initiate the receiving execution in WM. Lands’ End receives ASNs from the host system for receipts from vendors (LPN & Item Level ASNs) and returns from third party retailers and customers (Item Level ASN). For incoming receipts from another warehouse, an LPN level ASN is directly interfaced from the host system based on the outbound ASN generated by the sending DC. For vendors that do not create ASNs systematically, the warehouse may choose to manually create an ASN using the Create ASN from PO option in WM. Alternatively, blind ASN receipt is also supported in MAWM. Once receiving begins against an ASN detail, the ASN detail can no longer be cancelled or updated. WM closes an ASN as part of the ASN Verification process. Once cancelled or verified, no further updates are accepted for the ASN. 
```

<a id="b00601"></a>
## b00601 — word/document\.xml/body/\*\[601\]

```text
Assumptions
```

<a id="b00602"></a>
## b00602 — word/document\.xml/body/\*\[602\]

```text
One Advance Shipping Notice (ASN) may contain multiple purchase orders (POs).
```

<a id="b00603"></a>
## b00603 — word/document\.xml/body/\*\[603\]

```text
One PO may contain multiple ASNs. 
```

<a id="b00604"></a>
## b00604 — word/document\.xml/body/\*\[604\]

```text
90% of the vendors create License Plate Number (LPN) Level ASNs, which are interfaced into the Warehouse Management (WM) system from the host system.
```

<a id="b00605"></a>
## b00605 — word/document\.xml/body/\*\[605\]

```text
When ASNs are not sent by a vendor, they can be manually created in the warehouse using the “Create ASN from PO” option in WM.
```

<a id="b00606"></a>
## b00606 — word/document\.xml/body/\*\[606\]

```text
The “Create a Blind ASN” option is only used to receive customer returns following Lands’ End SOP.
```

<a id="b00607"></a>
## b00607 — word/document\.xml/body/\*\[607\]

```text

```

<a id="b00608"></a>
## b00608 — word/document\.xml/body/\*\[608\]

```text
Original Order and Production Order
```

<a id="b00609"></a>
## b00609 — word/document\.xml/body/\*\[609\]

```text
Store, Customer, Transfer Orders and Outsource Production Orders are downloaded into the Warehouse Management (WM) system from SAP as Original Orders (OOs). The OO provides WM with outbound demand and shipping details, which drive outbound processing. The OO header contains information specific to the overall order, such as order type, shipping requirements, and other fulfillment details. The OO lines contain information specific to each item ordered, including item name, item attributes, and quantity.
```

<a id="b00610"></a>
## b00610 — word/document\.xml/body/\*\[610\]

```text
During the import process, MAWM evaluates an ‘Order Strategy’ to assign the order planning pipeline. It then applies aggregation rules to either aggregate the original order into an existing distribution order or create a new distribution order. The distribution order is used by MAWM throughout the order fulfillment lifecycle, and MAWM uses the Original Order information to inform the host system when the order is either shipped or cancelled.
```

<a id="b00611"></a>
## b00611 — word/document\.xml/body/\*\[611\]

```text
Assumptions
```

<a id="b00612"></a>
## b00612 — word/document\.xml/body/\*\[612\]

```text
All orders are created with a default status of ‘Released’.
```

<a id="b00613"></a>
## b00613 — word/document\.xml/body/\*\[613\]

```text
No changes or updates are made from SAP to an order after it is waved and allocated.
```

<a id="b00614"></a>
## b00614 — word/document\.xml/body/\*\[614\]

```text
Order line requirements are always interfaced in units of measure (UOM) of Units.
```

<a id="b00615"></a>
## b00615 — word/document\.xml/body/\*\[615\]

```text
Inventory Type and Item Attributes are sent on the order lines.
```

<a id="b00616"></a>
## b00616 — word/document\.xml/body/\*\[616\]

```text
Process Needs
```

<a id="b00617"></a>
## b00617 — word/document\.xml/body/\*\[617\]

```text
Lands’ End does not currently plan to interface Process Needs, but LE does use process needs.  
```

<a id="b00618"></a>
## b00618 — word/document\.xml/body/\*\[618\]

```text
Outbound Interfaces – Upload from WM to HOST 
```

<a id="b00619"></a>
## b00619 — word/document\.xml/body/\*\[619\]

```text
The following interfaces are used from WM to the host applications. Base MAWM generates messages in JSON format. The respective host or integration layer translates and transforms the information from the JSON to the necessary format of the host application. 
```

<a id="b00620"></a>
## b00620 — word/document\.xml/body/\*\[620\]

```text
Perpetual Inventory Transactions (PIX)
```

<a id="b00621"></a>
## b00621 — word/document\.xml/body/\*\[621\]

```text
MAWM maintains detailed four-wall inventory and communicates any changes in inventory levels to host systems through Perpetual Inventory Transactions (PIX) messages. A PIX message is sent to the host system whenever there is a change in inventory quantity or allocability, based on the configuration in MAWM (e.g., via the UI – PIX Generation Strategy). PIX messages are generated across multiple MAWM functions. 
```

<a id="b00622"></a>
## b00622 — word/document\.xml/body/\*\[622\]

```text

```

<a id="b00623"></a>
## b00623 — word/document\.xml/body/\*\[623\]

```text
To simplify host/integration processing, MAWM creates PIX records with specific transaction types and event names, which together identify the perpetual inventory transaction (PIX). In addition to basic identification details, such as item and quantity, PIX messages have configurable reference codes that enable additional information on the interface. For example, iLPN receiving PIX messages typically contain the ASN number, PO reference number, and line item in these configured reference fields. This configuration is maintained through various PIX Enrichment Transaction Codes UIs (by maintaining velocity templates). Users can view individual PIX messages and their current processing status in the PIX Visibility UI.
```

<a id="b00624"></a>
## b00624 — word/document\.xml/body/\*\[624\]

```text

```

<a id="b00625"></a>
## b00625 — word/document\.xml/body/\*\[625\]

```text
There are two primary classifications of PIX messages:
```

<a id="b00626"></a>
## b00626 — word/document\.xml/body/\*\[626\]

```text
Inventory Transactions PIXs – Used to update the inventory levels in the host system.
```

<a id="b00627"></a>
## b00627 — word/document\.xml/body/\*\[627\]

```text
Examples: Receipts, Cycle Counts, Adjustments, Lock/Unlock, etc.
```

<a id="b00628"></a>
## b00628 — word/document\.xml/body/\*\[628\]

```text
Informational PIXs – Created to provide information for other non-inventory change functions.
```

<a id="b00629"></a>
## b00629 — word/document\.xml/body/\*\[629\]

```text
Examples: Order Status Updates, Vendor Performance, Appointment Updates, etc.
```

<a id="b00630"></a>
## b00630 — word/document\.xml/body/\*\[630\]

```text

```

<a id="b00631"></a>
## b00631 — word/document\.xml/body/\*\[631\]

```text


```

<a id="b00632"></a>
## b00632 — word/document\.xml/body/\*\[632\]

```text
The following list details the generic categories of events that generate a PIX to Lands’ End host systems. 
```

<a id="b00633"></a>
## b00633 — word/document\.xml/body/\*\[633\]

```text
Message Type	Event	Frequency	Notes
Inventory Sync	Scheduled JOB	Once per day	A snapshot of inventory is sent at the end of each day to stay in sync with the host system. The message includes both available and unavailable inventory, summarized by item and inventory attributes.
Receipt	Receipt	Per occurrence	When Inventory is received into the warehouse.
ASN Verification	Once an ASN has been completely received	Per occurrence	Typically used to notify the host that receiving is complete for the ASN.
Inventory Adjustments	Inventory Adjustment	Per occurrence	Notifies the host of adjustments made in WM such as applying/removing a condition code, cycle counting, inventory quantity adjustments, transitional state due to cancelled oLPN, etc. 
Inventory Availability	Apply/Remove Condition Code	Per occurrence	Notifies when the inventory status changes from available for order fulfillment to unavailable.
Order Status Change			Optional: PIX is sent to EOM when an order is created or when the order status changes to Allocated. This is used to inform host system that the order should not be cancelled. Order creation message can also be triggered by create order event (not a true PIX).
Order Adjustment			Optional: PIX is sent to host system when an order line quantity is adjusted due to shortage or cancellation. 
```

<a id="b00634"></a>
## b00634 — word/document\.xml/body/\*\[634\]

```text

```

<a id="b00635"></a>
## b00635 — word/document\.xml/body/\*\[635\]

```text
Ship Confirmation
```

<a id="b00636"></a>
## b00636 — word/document\.xml/body/\*\[636\]

```text
For each distribution order processed, WM generates a ship confirmation interface to the Host/EOM. The ship confirmation message includes the order header, order line item, oLPN header, and oLPN detail information.
```

<a id="b00637"></a>
## b00637 — word/document\.xml/body/\*\[637\]

```text
The order header and order line item information correspond one-to-one with the Original Order interfaced information and additionally include WM details such as allocated and packed quantities.
```

<a id="b00638"></a>
## b00638 — word/document\.xml/body/\*\[638\]

```text
The oLPN header contains specific attributes assigned to the Outbound License plate (oLPN) , such as the oLPN number, estimated and actual weights, and routing or shipment information like tracking numbers.
```

<a id="b00639"></a>
## b00639 — word/document\.xml/body/\*\[639\]

```text
The oLPN details include item name and quantity information based on the operational picking and packing executed for the oLPN, as well as the unique serial number when applicable.
```

<a id="b00640"></a>
## b00640 — word/document\.xml/body/\*\[640\]

```text
Host/EOM applications use the ship confirmation message to confirm the issue of the Original Order and oLPNs shipped by MAWM and identify Original Order Line-item shortages. Host applications perform various updates based on the ship confirmation, such as billing, goods issues, inventory moves and informing the recipient of shipment in transit.
```

<a id="b00641"></a>
## b00641 — word/document\.xml/body/\*\[641\]

```text
Outbound ASN 
```

<a id="b00642"></a>
## b00642 — word/document\.xml/body/\*\[642\]

```text
Lands’ End use MAWM Outbound ASN for transfer Orders, Outsource Production Orders and any TL or LTL shipments. The Outbound ASN generated by MAWM takes all oLPNs that are associated with a shipment and creates an iLPN Level ASN for the facility to receive against, where the oLPNs = iLPNs for the destination facility. 
```

<a id="b00643"></a>
## b00643 — word/document\.xml/body/\*\[643\]

```text


```

<a id="b00644"></a>
## b00644 — word/document\.xml/body/\*\[644\]

```text
Gaps and Extensions
```

<a id="b00645"></a>
## b00645 — word/document\.xml/body/\*\[645\]

```text
GAP#	Name	Why	Description
 WM24	KMAT and Original Item Mapping	 VAS Items are generic items and do not contain item dimensions, description and image because it is a generic item.	A custom process is implemented to swap the KMAT item with the original item for inbound interfaces. The same logic is applied in reverse to swap the item back to the KMAT item for outbound interfaces.
```

<a id="b00646"></a>
## b00646 — word/document\.xml/body/\*\[646\]

```text

```

<a id="b00647"></a>
## b00647 — word/document\.xml/body/\*\[647\]

```text
Pre-Receiving 
```

<a id="b00648"></a>
## b00648 — word/document\.xml/body/\*\[648\]

```text
Strategy
```

<a id="b00649"></a>
## b00649 — word/document\.xml/body/\*\[649\]

```text

```

<a id="b00650"></a>
## b00650 — word/document\.xml/body/\*\[650\]

```text
Pre-receiving refers to the preparatory steps taken before goods arrive at a distribution center. This includes:
```

<a id="b00651"></a>
## b00651 — word/document\.xml/body/\*\[651\]

```text
Creating Purchase Orders (POs) and Advance Shipment Notices (ASNs): These documents outline the expected goods and their details.
```

<a id="b00652"></a>
## b00652 — word/document\.xml/body/\*\[652\]

```text
Appointment Scheduling: Coordinating specific delivery times to optimize receiving operations.
```

<a id="b00653"></a>
## b00653 — word/document\.xml/body/\*\[653\]

```text
Receiving Planning: Determining the best strategies for receiving goods efficiently, such as prioritizing trailer that contains inventory for urgent orders, selecting the appropriate dock door for MHE Receiving vs Mobile receiving and plan the appropriate workforce.
```

<a id="b00654"></a>
## b00654 — word/document\.xml/body/\*\[654\]

```text
Yard Management: Planning and managing the flow of trucks and trailers in the yard area and receiving dock doors.
```

<a id="b00655"></a>
## b00655 — word/document\.xml/body/\*\[655\]

```text
Unloading: Unload the trailer content for receiving process. 
```

<a id="b00656"></a>
## b00656 — word/document\.xml/body/\*\[656\]

```text
Purchase Orders (POs) and Advance Shipment Notices (ASNs)
```

<a id="b00657"></a>
## b00657 — word/document\.xml/body/\*\[657\]

```text
Purchase Orders (PO) are created for Vendors in the Host system (SAP) and are subsequently transferred to MAWM. A single Purchase Order may be delivered in multiple shipments (inbound deliveries or trailers) arriving at different times. 
```

<a id="b00658"></a>
## b00658 — word/document\.xml/body/\*\[658\]

```text
Advance Shipment Notices (ASNs) are required to receive inventory into Warehouse Management (WM). Most ASNs are interfaced to MAWM from the Host system for the following ASN Origin types:
```

<a id="b00659"></a>
## b00659 — word/document\.xml/body/\*\[659\]

```text
Supplier (P - Vendor ASN)
```

<a id="b00660"></a>
## b00660 — word/document\.xml/body/\*\[660\]

```text
Manufacturing Plant (M – Production Orders) 
```

<a id="b00661"></a>
## b00661 — word/document\.xml/body/\*\[661\]

```text
Warehouse (W - Inventory Transfer) 
```

<a id="b00662"></a>
## b00662 — word/document\.xml/body/\*\[662\]

```text
Customer (R – Returns) 
```

<a id="b00663"></a>
## b00663 — word/document\.xml/body/\*\[663\]

```text
For Vendors without automated ASN creation capabilities, inbound supervisors manually create ASNs in MAWM using the "Create ASN from PO" function.
```

<a id="b00664"></a>
## b00664 — word/document\.xml/body/\*\[664\]

```text
For return receipts without ASNs or Return Reference Numbers (RRNs), receiving associates create ASN headers for customer returns. The origin facility is selected based on information present in the return label that is used by SAP to process correctly the receipt PIX, for example, Amazon origin facility. 
```

<a id="b00665"></a>
## b00665 — word/document\.xml/body/\*\[665\]

```text
Appointment Scheduling
```

<a id="b00666"></a>
## b00666 — word/document\.xml/body/\*\[666\]

```text
Inbound Deliveries and Appointments are created by both Vendors and Lands’ End team members, following the established MATM processes. As Inbound Deliveries are created, they are linked to their corresponding Appointments. If a Vendor cannot create an ASN linked to an Inbound Delivery, Lands’ End users can manually create an Inbound Appointment, following the process outlined in the MATM SDD.
```

<a id="b00667"></a>
## b00667 — word/document\.xml/body/\*\[667\]

```text
Once an appointment is created in MAWM, the [WM07] logic identifies any related ASNs and groups them into an Inbound Delivery. Each ASN is then individually added to the appointment. This enables Lands’ End to assign appointments to dock doors for inbound processing and to notify SAP when ASNs have been checked in at the receiving dock.
```

<a id="b00668"></a>
## b00668 — word/document\.xml/body/\*\[668\]

```text
Receiving Planning
```

<a id="b00669"></a>
## b00669 — word/document\.xml/body/\*\[669\]

```text

```

<a id="b00670"></a>
## b00670 — word/document\.xml/body/\*\[670\]

```text
As a daily routine, the inbound supervisor oversees incoming inbound deliveries using a custom SCI report and dashboard. These reports provide valuable insights into:
```

<a id="b00671"></a>
## b00671 — word/document\.xml/body/\*\[671\]

```text
Incoming volumes
```

<a id="b00672"></a>
## b00672 — word/document\.xml/body/\*\[672\]

```text
Appointment types
```

<a id="b00673"></a>
## b00673 — word/document\.xml/body/\*\[673\]

```text
Total number of LPNs
```

<a id="b00674"></a>
## b00674 — word/document\.xml/body/\*\[674\]

```text
Distribution of conveyable and non-conveyable items
```

<a id="b00675"></a>
## b00675 — word/document\.xml/body/\*\[675\]

```text
ASNs containing items without dimensions
```

<a id="b00676"></a>
## b00676 — word/document\.xml/body/\*\[676\]

```text
The supervisor leverages this information to strategically plan the necessary workforce to meet daily inbound demands. Additionally, they can create Process Needs for specific ASNs to override the default MHE diversion code and assign a custom one.
```

<a id="b00677"></a>
## b00677 — word/document\.xml/body/\*\[677\]

```text
Yard Management
```

<a id="b00678"></a>
## b00678 — word/document\.xml/body/\*\[678\]

```text
Once a trailer arrives at the Inbound Office, the receiving clerk checks in the appointment in WM. During the check-in process, an available dock door is either assigned automatically by MAWM or manually selected by the associate.
```

<a id="b00679"></a>
## b00679 — word/document\.xml/body/\*\[679\]

```text
Lands’ End plans to optimize dock door assignments by considering the trailer's contents, particularly whether they are conveyable or not. Users can leverage the 'Determine Location' action to let MAWM suggest a suitable dock door based on the following:
```

<a id="b00680"></a>
## b00680 — word/document\.xml/body/\*\[680\]

```text
Conveyable Contents: MAWM will recommend a dock door that is close to or within the MHE receiving area of the Inbound Dock.
```

<a id="b00681"></a>
## b00681 — word/document\.xml/body/\*\[681\]

```text
Non-Conveyable Contents: MAWM will recommend a dock door that is closer to the manual receiving area.
```

<a id="b00682"></a>
## b00682 — word/document\.xml/body/\*\[682\]

```text
Additionally, information from SCI reports can be used to determine the appropriate yard or receiving dock door.
```

<a id="b00683"></a>
## b00683 — word/document\.xml/body/\*\[683\]

```text
Unloading 
```

<a id="b00684"></a>
## b00684 — word/document\.xml/body/\*\[684\]

```text
Once an inbound trailer is checked into a dock door, the products are unloaded:
```

<a id="b00685"></a>
## b00685 — word/document\.xml/body/\*\[685\]

```text
For conveyable ASNs: Onto an MHE conveyor.
```

<a id="b00686"></a>
## b00686 — word/document\.xml/body/\*\[686\]

```text
For non-conveyable ASNs: Directly into a receiving dock, where the user initiates the receiving process.
```

<a id="b00687"></a>
## b00687 — word/document\.xml/body/\*\[687\]

```text
Assumptions
```

<a id="b00688"></a>
## b00688 — word/document\.xml/body/\*\[688\]

```text
Appointments are created via carrier portal, vendor portal, or directly created by the Lands’ End team against a shipment or purchase order. 
```

<a id="b00689"></a>
## b00689 — word/document\.xml/body/\*\[689\]

```text
Lands’ End may create Inbound Deliveries to group ASNs that have shipped in a physical trailer. These Inbound Deliveries are used for appointment scheduling.
```

<a id="b00690"></a>
## b00690 — word/document\.xml/body/\*\[690\]

```text
Receiving is initiated by scanning the ASN or Inbound Delivery, if available.
```

<a id="b00691"></a>
## b00691 — word/document\.xml/body/\*\[691\]

```text
Appointments are scheduled via MATM processes.
```

<a id="b00692"></a>
## b00692 — word/document\.xml/body/\*\[692\]

```text
Appointment scheduling is only used for inbound trailers.
```

<a id="b00693"></a>
## b00693 — word/document\.xml/body/\*\[693\]

```text
Appointment times are not determined by WM.
```

<a id="b00694"></a>
## b00694 — word/document\.xml/body/\*\[694\]

```text
Appointment duration is calculated within the Appointment Calendar UI. Appointments block off intervals of time based on LPN quantity, with duration calculated in minutes.
```

<a id="b00695"></a>
## b00695 — word/document\.xml/body/\*\[695\]

```text
Blind ASNs are exclusively created to initiate a blind customer return.
```

<a id="b00696"></a>
## b00696 — word/document\.xml/body/\*\[696\]

```text
Lands’ End configures a single yard within MAWM that contains multiple yard zones and yard locations.
```

<a id="b00697"></a>
## b00697 — word/document\.xml/body/\*\[697\]

```text
All yard slots are single trailer capacity locations
```

<a id="b00698"></a>
## b00698 — word/document\.xml/body/\*\[698\]

```text
Users manually select the yard location to check in a trailer.
```

<a id="b00699"></a>
## b00699 — word/document\.xml/body/\*\[699\]

```text
Appointments have their associated ASN’s assigned as Appointment Objects prior to Check-In. 
```

<a id="b00700"></a>
## b00700 — word/document\.xml/body/\*\[700\]

```text
All yard moves are user-directed.
```

<a id="b00701"></a>
## b00701 — word/document\.xml/body/\*\[701\]

```text

```

<a id="b00702"></a>
## b00702 — word/document\.xml/body/\*\[702\]

```text
User Stories
```

<a id="b00703"></a>
## b00703 — word/document\.xml/body/\*\[703\]

```text
User Story: Create ASN from PO
```

<a id="b00704"></a>
## b00704 — word/document\.xml/body/\*\[704\]

```text
Who	What	Why
Receiving Office	Create an ASN for one or more POs	To generate a receivable object in the scenario that an ASN is not interfaced into MAWM.
```

<a id="b00705"></a>
## b00705 — word/document\.xml/body/\*\[705\]

```text
Process
```

<a id="b00706"></a>
## b00706 — word/document\.xml/body/\*\[706\]

```text
User navigates to the ASNs UI. 
```

<a id="b00707"></a>
## b00707 — word/document\.xml/body/\*\[707\]

```text
User clicks the [Generate ASN from PO] action and enters ASN ID (or lets system generate) submits the new ASN record.
```

<a id="b00708"></a>
## b00708 — word/document\.xml/body/\*\[708\]

```text
User enters PO to find PO Lines. 
```

<a id="b00709"></a>
## b00709 — word/document\.xml/body/\*\[709\]

```text
User expands PO by selecting + and check box to select all lines for ASN.
```

<a id="b00710"></a>
## b00710 — word/document\.xml/body/\*\[710\]

```text
User clicks the [Add to ASN] action and confirms.
```

<a id="b00711"></a>
## b00711 — word/document\.xml/body/\*\[711\]

```text
User repeats the process to add other POs to the ASN if required.
```

<a id="b00712"></a>
## b00712 — word/document\.xml/body/\*\[712\]

```text
On the summary screen, the user reviews the added lines to ensure accuracy and clicks the [Save and Finish] action when complete.
```

<a id="b00713"></a>
## b00713 — word/document\.xml/body/\*\[713\]

```text
Optional: If additional details need to be added to the ASN, like BOL # then 
```

<a id="b00714"></a>
## b00714 — word/document\.xml/body/\*\[714\]

```text
User selects ASN created and clicks the [Edit] action.
```

<a id="b00715"></a>
## b00715 — word/document\.xml/body/\*\[715\]

```text
User updates the BOL on the BOL extended attribute field on the ASN and clicks the [Save] action when complete.
```

<a id="b00716"></a>
## b00716 — word/document\.xml/body/\*\[716\]

```text
User creates an Appointment following MATM process.
```

<a id="b00717"></a>
## b00717 — word/document\.xml/body/\*\[717\]

```text

```

<a id="b00718"></a>
## b00718 — word/document\.xml/body/\*\[718\]

```text
Updates
```

<a id="b00719"></a>
## b00719 — word/document\.xml/body/\*\[719\]

```text
Item Level ASN Created in MAWM in ‘In-Transit’ status.
```

<a id="b00720"></a>
## b00720 — word/document\.xml/body/\*\[720\]

```text
Selected PO Lines are created as ASN Lines on the ASN
```

<a id="b00721"></a>
## b00721 — word/document\.xml/body/\*\[721\]

```text
PO is moved to “Partially Shipped” or “Shipped” status
```

<a id="b00722"></a>
## b00722 — word/document\.xml/body/\*\[722\]

```text
Screen Flow
```

<a id="b00723"></a>
## b00723 — word/document\.xml/body/\*\[723\]

```text

```

<a id="b00724"></a>
## b00724 — word/document\.xml/body/\*\[724\]

```text

```

<a id="b00725"></a>
## b00725 — word/document\.xml/body/\*\[725\]

```text

```

<a id="b00726"></a>
## b00726 — word/document\.xml/body/\*\[726\]

```text


```

<a id="b00727"></a>
## b00727 — word/document\.xml/body/\*\[727\]

```text
Create ASN (Blind Customer Returns) 
```

<a id="b00728"></a>
## b00728 — word/document\.xml/body/\*\[728\]

```text
Who	What	Why
Receiving Associate	Create an ASN for a non-confirmed return	The returned items are unknow in host system, only available information are printed on the returned LPNs
```

<a id="b00729"></a>
## b00729 — word/document\.xml/body/\*\[729\]

```text
Process
```

<a id="b00730"></a>
## b00730 — word/document\.xml/body/\*\[730\]

```text
User navigates to the ASN UI. 
```

<a id="b00731"></a>
## b00731 — word/document\.xml/body/\*\[731\]

```text
User ser clicks the [Generate ASN] action and enters or accepts the generated ASN ID and clicks the “Submit” button.
```

<a id="b00732"></a>
## b00732 — word/document\.xml/body/\*\[732\]

```text
User select the generated ASN. 
```

<a id="b00733"></a>
## b00733 — word/document\.xml/body/\*\[733\]

```text
User clicks the [Edit].
```

<a id="b00734"></a>
## b00734 — word/document\.xml/body/\*\[734\]

```text
User edits the Origin Type and selects “Customer” and any other ASN attributes if present.
```

<a id="b00735"></a>
## b00735 — word/document\.xml/body/\*\[735\]

```text
User clicks the [Save].
```

<a id="b00736"></a>
## b00736 — word/document\.xml/body/\*\[736\]

```text
Updates
```

<a id="b00737"></a>
## b00737 — word/document\.xml/body/\*\[737\]

```text
ASN is created in status “In Transit”
```

<a id="b00738"></a>
## b00738 — word/document\.xml/body/\*\[738\]

```text
User Story: Process Needs
```

<a id="b00739"></a>
## b00739 — word/document\.xml/body/\*\[739\]

```text
Who	What	Why
Receiving Associate	Create a Process Need to Assign a Specific MHE Diversion Code to ASNs	Pre-assign MHE diversion codes to MHE receiving LPNs based on business demand requirements.
```

<a id="b00740"></a>
## b00740 — word/document\.xml/body/\*\[740\]

```text

```

<a id="b00741"></a>
## b00741 — word/document\.xml/body/\*\[741\]

```text
Process
```

<a id="b00742"></a>
## b00742 — word/document\.xml/body/\*\[742\]

```text
User navigates to the Process Needs UI. 
```

<a id="b00743"></a>
## b00743 — word/document\.xml/body/\*\[743\]

```text
User clicks the [Create] menu option
```

<a id="b00744"></a>
## b00744 — word/document\.xml/body/\*\[744\]

```text
User enters required data and select a diversion code that matches with Matthew diversion code.
```

<a id="b00745"></a>
## b00745 — word/document\.xml/body/\*\[745\]

```text
User clicks the [Save] action and confirms.
```

<a id="b00746"></a>
## b00746 — word/document\.xml/body/\*\[746\]

```text
Updates
```

<a id="b00747"></a>
## b00747 — word/document\.xml/body/\*\[747\]

```text
Process Needs is created
```

<a id="b00748"></a>
## b00748 — word/document\.xml/body/\*\[748\]

```text
ASN LPNs are updated with selected Diversion Code post disposition.
```

<a id="b00749"></a>
## b00749 — word/document\.xml/body/\*\[749\]

```text

```

<a id="b00750"></a>
## b00750 — word/document\.xml/body/\*\[750\]

```text


```

<a id="b00751"></a>
## b00751 — word/document\.xml/body/\*\[751\]

```text
User Story: Appointment Check-In
```

<a id="b00752"></a>
## b00752 — word/document\.xml/body/\*\[752\]

```text
Who	What	Why
Receiving Office	Upon trailer arrival at the yard, check in the corresponding appointment via the UI.	Checking in the appointment allows the user to capture necessary information about the trailer and direct the driver to the best dock door.
```

<a id="b00753"></a>
## b00753 — word/document\.xml/body/\*\[753\]

```text
Process 
```

<a id="b00754"></a>
## b00754 — word/document\.xml/body/\*\[754\]

```text
User navigates to Appointments UI and filters for the Appointment that needs to be checked in using the PO or ASN.
```

<a id="b00755"></a>
## b00755 — word/document\.xml/body/\*\[755\]

```text

```

<a id="b00756"></a>
## b00756 — word/document\.xml/body/\*\[756\]

```text
User selects the Appointment and clicks the option to ‘Check-in’
```

<a id="b00757"></a>
## b00757 — word/document\.xml/body/\*\[757\]

```text

```

<a id="b00758"></a>
## b00758 — word/document\.xml/body/\*\[758\]

```text
WM displays the Check-in screen with areas to insert information from Appointment creation. User populates any required fields that are not pre-populated.
```

<a id="b00759"></a>
## b00759 — word/document\.xml/body/\*\[759\]

```text

```

<a id="b00760"></a>
## b00760 — word/document\.xml/body/\*\[760\]

```text
User may choose to select the ‘Determine Location’ action for MAWM to systematically assign the dock door.
```

<a id="b00761"></a>
## b00761 — word/document\.xml/body/\*\[761\]

```text

```

<a id="b00762"></a>
## b00762 — word/document\.xml/body/\*\[762\]

```text
Alternatively, the user may manually search for and enter the appropriate dock door to assign the trailer to
```

<a id="b00763"></a>
## b00763 — word/document\.xml/body/\*\[763\]

```text

```

<a id="b00764"></a>
## b00764 — word/document\.xml/body/\*\[764\]

```text
User clicks ‘CHECK-IN’ to check-in the Appointment. 
```

<a id="b00765"></a>
## b00765 — word/document\.xml/body/\*\[765\]

```text
Updates
```

<a id="b00766"></a>
## b00766 — word/document\.xml/body/\*\[766\]

```text
Appointment moves from ‘Scheduled’ to ‘Checked-in’ status.
```

<a id="b00767"></a>
## b00767 — word/document\.xml/body/\*\[767\]

```text

```

<a id="b00768"></a>
## b00768 — word/document\.xml/body/\*\[768\]

```text
Check in PIX are going to contain ASN Sku Quantity
```

<a id="b00769"></a>
## b00769 — word/document\.xml/body/\*\[769\]

```text

```

<a id="b00770"></a>
## b00770 — word/document\.xml/body/\*\[770\]

```text
Dock door scan is not required.
```

<a id="b00771"></a>
## b00771 — word/document\.xml/body/\*\[771\]

```text

```

<a id="b00772"></a>
## b00772 — word/document\.xml/body/\*\[772\]

```text
Appointment is updated with Dock Door or Yard Location.
```

<a id="b00773"></a>
## b00773 — word/document\.xml/body/\*\[773\]

```text

```

<a id="b00774"></a>
## b00774 — word/document\.xml/body/\*\[774\]

```text
Dock Door is updated from ‘Open’ to ‘In-Use’ status or Yard Location is Updated with the Trailer Information.
```

<a id="b00775"></a>
## b00775 — word/document\.xml/body/\*\[775\]

```text

```

<a id="b00776"></a>
## b00776 — word/document\.xml/body/\*\[776\]

```text
User Story: Yard Move Trailer
```

<a id="b00777"></a>
## b00777 — word/document\.xml/body/\*\[777\]

```text
Who	What	Why
Receiving Office	Move Trailer from Yard location to Dock Door	Trailers may be checked in and located at the Yard. When a door is available, a systematic move can be made to move the trailer form the yard to the selected dock door. 
```

<a id="b00778"></a>
## b00778 — word/document\.xml/body/\*\[778\]

```text
Process
```

<a id="b00779"></a>
## b00779 — word/document\.xml/body/\*\[779\]

```text
User enters Move Trailer Mobile.
```

<a id="b00780"></a>
## b00780 — word/document\.xml/body/\*\[780\]

```text

```

<a id="b00781"></a>
## b00781 — word/document\.xml/body/\*\[781\]

```text
WM prompts user for a Trailer
```

<a id="b00782"></a>
## b00782 — word/document\.xml/body/\*\[782\]

```text

```

<a id="b00783"></a>
## b00783 — word/document\.xml/body/\*\[783\]

```text
User scans Trailer to move.
```

<a id="b00784"></a>
## b00784 — word/document\.xml/body/\*\[784\]

```text

```

<a id="b00785"></a>
## b00785 — word/document\.xml/body/\*\[785\]

```text
WM prompts user for a Dock Door.
```

<a id="b00786"></a>
## b00786 — word/document\.xml/body/\*\[786\]

```text

```

<a id="b00787"></a>
## b00787 — word/document\.xml/body/\*\[787\]

```text
User physically moves trailer to a Dock Door and Scan the Dock Door Id.
```

<a id="b00788"></a>
## b00788 — word/document\.xml/body/\*\[788\]

```text

```

<a id="b00789"></a>
## b00789 — word/document\.xml/body/\*\[789\]

```text
Updates
```

<a id="b00790"></a>
## b00790 — word/document\.xml/body/\*\[790\]

```text
Dock Door is updates to ‘In-Use’ or ‘Available’
```

<a id="b00791"></a>
## b00791 — word/document\.xml/body/\*\[791\]

```text
User Story: Appointment Check-Out
```

<a id="b00792"></a>
## b00792 — word/document\.xml/body/\*\[792\]

```text
Process
```

<a id="b00793"></a>
## b00793 — word/document\.xml/body/\*\[793\]

```text
User navigates to Check Out UI and filters for the appointment that needs to be checked out. 
```

<a id="b00794"></a>
## b00794 — word/document\.xml/body/\*\[794\]

```text

```

<a id="b00795"></a>
## b00795 — word/document\.xml/body/\*\[795\]

```text
User selects the Appointment and clicks the option to ‘Check Out’.
```

<a id="b00796"></a>
## b00796 — word/document\.xml/body/\*\[796\]

```text

```

<a id="b00797"></a>
## b00797 — word/document\.xml/body/\*\[797\]

```text
User clicks ‘Submit’ to check out the appointment.
```

<a id="b00798"></a>
## b00798 — word/document\.xml/body/\*\[798\]

```text

```

<a id="b00799"></a>
## b00799 — word/document\.xml/body/\*\[799\]

```text
Updates
```

<a id="b00800"></a>
## b00800 — word/document\.xml/body/\*\[800\]

```text
Appointment moves form ‘Checked-in’ to ‘Complete’ status.
```

<a id="b00801"></a>
## b00801 — word/document\.xml/body/\*\[801\]

```text

```

<a id="b00802"></a>
## b00802 — word/document\.xml/body/\*\[802\]

```text
Dock Door is updated from ‘In-Use’ to ‘Open’ status.
```

<a id="b00803"></a>
## b00803 — word/document\.xml/body/\*\[803\]

```text

```

<a id="b00804"></a>
## b00804 — word/document\.xml/body/\*\[804\]

```text
Features
```

<a id="b00805"></a>
## b00805 — word/document\.xml/body/\*\[805\]

```text
Process Needs
```

<a id="b00806"></a>
## b00806 — word/document\.xml/body/\*\[806\]

```text
Lands' End utilizes "Process Needs" functionality, which is invoked during the LPN Disposition phase of the receiving process. This functionality allows for the selection of specific iLPNs on an ASN for special handling, such as:
```

<a id="b00807"></a>
## b00807 — word/document\.xml/body/\*\[807\]

```text
Multi-SKU processing
```

<a id="b00808"></a>
## b00808 — word/document\.xml/body/\*\[808\]

```text
Cubiscan measurements
```

<a id="b00809"></a>
## b00809 — word/document\.xml/body/\*\[809\]

```text
Quality inspections
```

<a id="b00810"></a>
## b00810 — word/document\.xml/body/\*\[810\]

```text
Prepping activities
```

<a id="b00811"></a>
## b00811 — word/document\.xml/body/\*\[811\]

```text
Permanent process needs can be configured in MAWM to ensure that users are consistently notified of the required processing step for a particular iLPN before it is put away into inventory.
```

<a id="b00812"></a>
## b00812 — word/document\.xml/body/\*\[812\]

```text
Process needs can be created through the following methods:
```

<a id="b00813"></a>
## b00813 — word/document\.xml/body/\*\[813\]

```text
Interface: Automated creation via an external system.
```

<a id="b00814"></a>
## b00814 — word/document\.xml/body/\*\[814\]

```text
Data Loader: Bulk upload using Data Loader via Process Needs UI.
```

<a id="b00815"></a>
## b00815 — word/document\.xml/body/\*\[815\]

```text
Manual entry: Manual entry via “Process Needs” UI.
```

<a id="b00816"></a>
## b00816 — word/document\.xml/body/\*\[816\]

```text
Lands' End use the "Process Needs" UI to:
```

<a id="b00817"></a>
## b00817 — word/document\.xml/body/\*\[817\]

```text
Monitor the status of each process needs.
```

<a id="b00818"></a>
## b00818 — word/document\.xml/body/\*\[818\]

```text
Track the progress of required processing activities.
```

<a id="b00819"></a>
## b00819 — word/document\.xml/body/\*\[819\]

```text


```

<a id="b00820"></a>
## b00820 — word/document\.xml/body/\*\[820\]

```text
Dock Doors
```

<a id="b00821"></a>
## b00821 — word/document\.xml/body/\*\[821\]

```text
Lands’ End configures dock doors for both inbound and outbound processing. However for inbound processing, users configure a preferred sequence of door assignment based on the defined custom attribute dock door group. Users do not configure the actual outbound doors within this inbound door preferred assignment sequence. 
```

<a id="b00822"></a>
## b00822 — word/document\.xml/body/\*\[822\]

```text
Dock	Description
Conveyable MHE Receiving	Dock doors dedicated for LPN MHE receiving. 
Non-Con Receiving 	Dock doors dedicated for non-conveyable receiving. 
```

<a id="b00823"></a>
## b00823 — word/document\.xml/body/\*\[823\]

```text

```

<a id="b00824"></a>
## b00824 — word/document\.xml/body/\*\[824\]

```text
Yards
```

<a id="b00825"></a>
## b00825 — word/document\.xml/body/\*\[825\]

```text
Lands’ End defines a single yard in MAWM. Users configure yard zones as required to distinguish different areas of the yard. Within the yard, users maintain yard slots (yard locations) within WM with a unique yard slot name. All yard locations have a capacity of one trailer.
```

<a id="b00826"></a>
## b00826 — word/document\.xml/body/\*\[826\]

```text
Appointments
```

<a id="b00827"></a>
## b00827 — word/document\.xml/body/\*\[827\]

```text
The Appointment Type defines the style of the appointment (i.e. how the trailer is handled for loading or unloading). The table below lists the various MAWM supported inbound appointment types, and defines which ones are used at the Lands’ End.
```

<a id="b00828"></a>
## b00828 — word/document\.xml/body/\*\[828\]

```text
Appointment Type	Description	Used
Live Unload	The driver remains at the warehouse with the trailer and leaves with the trailer.	Yes
Drop Unload	The driver drops the trailer at the warehouse and leaves without the trailer.	Yes
Pick Up Empty	The driver arrives without a delivery to pick up an empty trailer.	No
Drop Empty	The driver arrives with an empty trailer to leave in the yard.	No
```

<a id="b00829"></a>
## b00829 — word/document\.xml/body/\*\[829\]

```text
Key Interfaces
```

<a id="b00830"></a>
## b00830 — word/document\.xml/body/\*\[830\]

```text
Interface	Business Scenario
Item Master	Inform distribution center of expected SKUs.
Purchase Order	Inform distribution center of POs that will be shipped to the facility.
ASN	Inform distribution center of ASN contents prior to arrival. 
Inbound Delivery	Inform distribution center of the Inbound Delivery expected at the facility. 
PIX	Check-In PIX generated for host notification as appointments arrive to the warehouse.
```

<a id="b00831"></a>
## b00831 — word/document\.xml/body/\*\[831\]

```text

```

<a id="b00832"></a>
## b00832 — word/document\.xml/body/\*\[832\]

```text
Reports, Dashboards, Alerts
```

<a id="b00833"></a>
## b00833 — word/document\.xml/body/\*\[833\]

```text
Name	Description	Frequency	User/Dept	Type
ASN Inquiry Report	Details everything on the ASN. Includes ASN barcode.	As needed	Pre-receiving	WM Report 
Appointment Schedule Report	Details of ASN, PO, quantities, and appointment 	As needed	Pre-receiving	SCI Report
Appointment Schedule Dashboard	This report provides details of all trailers in the yard or in-transit to the yard, including:
Appointment Date
Appointment Type
Live Unload
Drop Unload
Appointment Content
ASN #
Number of SKUs 
Number of LPNs
	As needed	Inbound Supervisor /
Pre-receiving	Custom SCI Dashboard
Trailer Visibility Planning Report	This report provides details of all trailers in the yard, including:
Trailer Date
ASNs in Trailer
Item Dim Status
Conveyable LPN vs. Non-Conveyable LPN
The report enables the receiving supervisor to prioritize trailers and plan the workforce for sorting at the MHE divert lanes.
	As needed	Inbound Supervisor /
Pre-receiving	Trailer Visibility Planning Report
No ASN Report	Identifies Purchase Orders without ASN to notify associates	As needed	Inbound Supervisor /
Pre-receiving	Custom SCI Report
```

<a id="b00834"></a>
## b00834 — word/document\.xml/body/\*\[834\]

```text

```

<a id="b00835"></a>
## b00835 — word/document\.xml/body/\*\[835\]

```text


```

<a id="b00836"></a>
## b00836 — word/document\.xml/body/\*\[836\]

```text
Gaps and Extensions
```

<a id="b00837"></a>
## b00837 — word/document\.xml/body/\*\[837\]

```text
GAP#	Name	Why	Description
WM07	Appointment to ASN Relationship  	Inform host system when an ASN has been checked-in.	Add related ANS to an appointment when it is created  on MAWM.
```

<a id="b00838"></a>
## b00838 — word/document\.xml/body/\*\[838\]

```text

```

<a id="b00839"></a>
## b00839 — word/document\.xml/body/\*\[839\]

```text
Labor Management
```

<a id="b00840"></a>
## b00840 — word/document\.xml/body/\*\[840\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b00841"></a>
## b00841 — word/document\.xml/body/\*\[841\]

```text
Receiving
```

<a id="b00842"></a>
## b00842 — word/document\.xml/body/\*\[842\]

```text
Strategy
```

<a id="b00843"></a>
## b00843 — word/document\.xml/body/\*\[843\]

```text

```

<a id="b00844"></a>
## b00844 — word/document\.xml/body/\*\[844\]

```text
The receiving process is designed to manage the inflow of inventory to the distribution center. MAWM offers flexibility by allowing users to configure receiving strategy that capture and validate necessary information.
```

<a id="b00845"></a>
## b00845 — word/document\.xml/body/\*\[845\]

```text
Lands’ End employs the following three strategies:
```

<a id="b00846"></a>
## b00846 — word/document\.xml/body/\*\[846\]

```text
MHE Receipts: Automated receiving process through an MHE for vendor conveyable LPNs.
```

<a id="b00847"></a>
## b00847 — word/document\.xml/body/\*\[847\]

```text
Non-Conveyable Receipts / Mobile Receiving: Processed using Mobile Receiving Transactions, including vendor non-conveyable items, Transfer Orders, and Production Orders.
```

<a id="b00848"></a>
## b00848 — word/document\.xml/body/\*\[848\]

```text
Returns Receipts: Handled through the Returns UI for non-bulky items and bulky items through Mobile Returns.
```

<a id="b00849"></a>
## b00849 — word/document\.xml/body/\*\[849\]

```text
MHE Receipts Strategy
```

<a id="b00850"></a>
## b00850 — word/document\.xml/body/\*\[850\]

```text
The MHE Receipts Strategy is used to receive Vendor LPN-level ASNs. The process begins when the receiving associates place the LPN from the inbound trailer onto the MHE receiving conveyor belt. The MHE scanner then reads the LPN barcode and sends a “Receive” message to MAWM. Then MAWM processes the “Receive” message, receives the iLPN, and sends an "iLPN Received" message back to the MHE to confirm successful receipt. Post-receiving rules are applied to assign a Condition Code, and LPN Disposition is invoked to determine the destination (e.g., Quality Control (QC), Reserve, Active). Once the iLPN's location is determined, MAWM sends a “Divert Assignment” message to the MHE system to specify the target area or location.
```

<a id="b00851"></a>
## b00851 — word/document\.xml/body/\*\[851\]

```text
Additionally, MAWM generates an LPN label [WM01] and sends an “ILPN Print” message to the MHE system to print and apply the label to the LPN. After labeling, the iLPNs continue along the receiving conveyor and are diverted to a replenishment induction point or to an inbound sorting lane. The MHE then sends a Putaway Divert Confirmation message to MAWM to confirm when the LPN has been diverted and MAWM use the message to putaway the LPN to respective processing area.
```

<a id="b00852"></a>
## b00852 — word/document\.xml/body/\*\[852\]

```text
For LPNs allocated to replenish a pick location, the LPN is put away to a pick/drop location where a replenishment associate builds a putaway cart to complete the putaway to the designated pick location. For other LPNs, they are put away into an inbound sorting lane, where a receiving associate performs a sorting process to build pallets based on the putaway zone previously assigned to the LPN.
```

<a id="b00853"></a>
## b00853 — word/document\.xml/body/\*\[853\]

```text
If an iLPN cannot be received in MAWM and no iLPN Label is sent to the MHE for printing, Matthews prints a generic exception label on the container. This container flows down the receiving conveyor to the post-receiving area, where it cannot be sorted. At this point, associates research the carton to identify the issue and receive it into MAWM if necessary.
```

<a id="b00854"></a>
## b00854 — word/document\.xml/body/\*\[854\]

```text
Note: As part of the Matthews MHE configuration, the receiving conveyor may be configured to stop after a specific number of failures. 
```

<a id="b00855"></a>
## b00855 — word/document\.xml/body/\*\[855\]

```text


```

<a id="b00856"></a>
## b00856 — word/document\.xml/body/\*\[856\]

```text
MHE Receiving Touchpoints
```

<a id="b00857"></a>
## b00857 — word/document\.xml/body/\*\[857\]

```text
Seq	Event	Source	Destination	Touchpoint	Description
1	Receive iLPN	Matthews	MAWM	As iLPNs are scanned for receipt by MHE	MHE message to inform MAWM of the iLPNs to be received via MHE
2	iLPN Received	MAWM	Matthews	As iLPNs are confirmed to be received by MAWM	MHE message to inform Matthews that the iLPN was systematically received successfully
3	Putaway Divert Assignment	MAWM	Matthews	As iLPNs are allocated to go to Active from Receiving	MHE message to inform Matthews of iLPNs and their destinations for diverting
4	Print LPN	MAWM	Matthews	Post LPN Disposition and LPN label is generated	MHE message with zebra label code (ZPL) to be printed and applied to the received LPN
5	Putaway Divert Confirmation	Matthews	MAWM	When a  LPN  is scanned and diverted by the MHE	Message is used by MAWM to locate the LPN into a staging location.
```

<a id="b00858"></a>
## b00858 — word/document\.xml/body/\*\[858\]

```text

```

<a id="b00859"></a>
## b00859 — word/document\.xml/body/\*\[859\]

```text
Non-Conveyable Receipts / Mobile Receiving Strategy
```

<a id="b00860"></a>
## b00860 — word/document\.xml/body/\*\[860\]

```text
The Non-Conveyable Receipts / Mobile Receiving Strategy is used to receive various types of items, including vendor conveyable items (based on operational decisions during peak season or high MHE receiving volumes), non-conveyable items, Transfer Orders, and Outsource Production Orders.
```

<a id="b00861"></a>
## b00861 — word/document\.xml/body/\*\[861\]

```text
The strategy includes the following receiving criteria/options:
```

<a id="b00862"></a>
## b00862 — word/document\.xml/body/\*\[862\]

```text
Receive LPN Level ASN: This option allows receiving LPNs by scanning the LPN without confirming its contents. The receiving transaction calls for disposition, prints the LPN label [WM01], and the user moves the iLPN to the appropriate sortation location based on the determined destination via LPN Disposition. Lands’ End uses the “Receiving Line Override Criteria” to prompt for LPN details for Gift Card LPNs or for an LPN that requires contents confirmation based on the SAP vendor rate.
```

<a id="b00863"></a>
## b00863 — word/document\.xml/body/\*\[863\]

```text
Receive Item Level ASN: This option is used when LPN information is not provided. Associates are prompted to scan at least the ASN, Blind LPN Id, item, and quantity to receive the product in the warehouse. Once the LPN is received, the receiving transaction calls for disposition, prints the LPN label [WM01], and the user moves the iLPN to the appropriate sortation location based on the determined destination via LPN Disposition. Lands’ End leverages on the “Copy LPN” feature to receive multiple LPNs containing the same item and quantities by copying the previously received item, quantity, and attributes, for example “Supplies ASN receiving”.
```

<a id="b00864"></a>
## b00864 — word/document\.xml/body/\*\[864\]

```text
Bulk ASN Receiving: This option is used for bulk receiving transfer orders and outsource production orders without scanning LPNs.
```

<a id="b00865"></a>
## b00865 — word/document\.xml/body/\*\[865\]

```text
Production Orders Receipts: This option is used to receive both in-house production orders. It enables users to scan iLPNs without verifying their contents. The transaction triggers a separate receiving process, similar to LPN-Level Receiving, specifically designed for Production Order Receiving. Additionally, it initiates a System Suggested Putaway process to consolidate all production orders into a putwall cubby location (Multis) or a floor location (Outsourcing, Singles, and Large)
```

<a id="b00866"></a>
## b00866 — word/document\.xml/body/\*\[866\]

```text

```

<a id="b00867"></a>
## b00867 — word/document\.xml/body/\*\[867\]

```text


```

<a id="b00868"></a>
## b00868 — word/document\.xml/body/\*\[868\]

```text
Returns Strategy
```

<a id="b00869"></a>
## b00869 — word/document\.xml/body/\*\[869\]

```text
The Returns Strategy at Dodgeville handles returned inventory from customers, stores, and third-party retailers. These return processes make up a significant portion of the inbound operations at the Dodgeville Distribution Center (DC) and require additional processing during receiving to determine if the inventory can be re-sold or needs to go through a secondary process. Lands’ End sends receipt details to the host system immediately upon receiving LPNs for returns, without waiting for ASN Verification. As soon as LPNs are received, a receipt PIX for the inventory is sent to the host system.
```

<a id="b00870"></a>
## b00870 — word/document\.xml/body/\*\[870\]

```text
Once the returned product is unloaded from the truck, the Lands’ End receiving team evaluates it, processes any necessary customer credits, and classifies the product as either bulky or non-bulky items. Based on this classification, the return process can be initiated by one of the two following criteria:
```

<a id="b00871"></a>
## b00871 — word/document\.xml/body/\*\[871\]

```text
Returns Station: Used for non-bulky items.
```

<a id="b00872"></a>
## b00872 — word/document\.xml/body/\*\[872\]

```text
Mobile Returns: Used for bulky items.
```

<a id="b00873"></a>
## b00873 — word/document\.xml/body/\*\[873\]

```text
Once a returned product is classified, the returns receiving process begins in MAWM. A user initiates the Return Receiving transaction either on a WM Mobile device or a Return Station via a web browser.
```

<a id="b00874"></a>
## b00874 — word/document\.xml/body/\*\[874\]

```text
Initial Steps:
```

<a id="b00875"></a>
## b00875 — word/document\.xml/body/\*\[875\]

```text
ASN ID Entry:
```

<a id="b00876"></a>
## b00876 — word/document\.xml/body/\*\[876\]

```text
If provided: The user scans or enters the ASN ID.
```

<a id="b00877"></a>
## b00877 — word/document\.xml/body/\*\[877\]

```text
If not provided: The user creates a blind customer return from the ASN UI, associating it with a vendor ID and/or origin facility based on return label information.
```

<a id="b00878"></a>
## b00878 — word/document\.xml/body/\*\[878\]

```text
iLPN Generation:
```

<a id="b00879"></a>
## b00879 — word/document\.xml/body/\*\[879\]

```text
MAWM generates an iLPN ID for the return. No blind iLPN labels are scanned. The iLPN label is printed after the receipt is complete.
```

<a id="b00880"></a>
## b00880 — word/document\.xml/body/\*\[880\]

```text
Item Receipt:
```

<a id="b00881"></a>
## b00881 — word/document\.xml/body/\*\[881\]

```text
Item Scan: The user scans the UPC label on the returned item, whether applied by Lands' End or a third-party processor.
```

<a id="b00882"></a>
## b00882 — word/document\.xml/body/\*\[882\]

```text
Blind Returns: For blind returns, a custom logic [GAP-17] automatically defaults the Inventory Type to 'USCD' to streamline the process.
```

<a id="b00883"></a>
## b00883 — word/document\.xml/body/\*\[883\]

```text
Inventory Attributes: If applicable (e.g., hemming, logoed), the user enters the necessary attributes during the receiving transaction. 
```

<a id="b00884"></a>
## b00884 — word/document\.xml/body/\*\[884\]

```text
Hemming: The user enters the true inseam value or 'UNF' for unfinished items.
```

<a id="b00885"></a>
## b00885 — word/document\.xml/body/\*\[885\]

```text
Logoed: The user enters the logo ID for recyclable logos or 'UNF' or 'SCRAP' for other cases.
```

<a id="b00886"></a>
## b00886 — word/document\.xml/body/\*\[886\]

```text
Quantity and Disposition:
```

<a id="b00887"></a>
## b00887 — word/document\.xml/body/\*\[887\]

```text
Quantity: For single-unit returns, the item UPC scan is sufficient. For multiple-unit returns, the user enters the total quantity.
```

<a id="b00888"></a>
## b00888 — word/document\.xml/body/\*\[888\]

```text
Alert Validation: Receiving rules are used to checks for any item alerts. If found, a message is displayed to the user, who then validates the alert and selects a disposition code.
```

<a id="b00889"></a>
## b00889 — word/document\.xml/body/\*\[889\]

```text
Disposition Code Selection: The user selects a disposition code (e.g., 1st Quality, Not Quite Perfect, Charity, Regis, Scrap, Discontinued) based on the item's condition and any applicable alerts.
```

<a id="b00890"></a>
## b00890 — word/document\.xml/body/\*\[890\]

```text
iLPN Label Printing: After the disposition code is selected, an iLPN label is printed with relevant information, including the iLPN ID, item, disposition, class code, etc. [WM01/WM09]
```

<a id="b00891"></a>
## b00891 — word/document\.xml/body/\*\[891\]

```text
After selecting a disposition code, the iLPN receipt and disposition process is complete. An iLPN label is printed, containing the iLPN ID, item, return disposition, class code, and other relevant information. The labeled item is then placed on a conveyor to be sorted into the designated area based on the selected disposition.
```

<a id="b00892"></a>
## b00892 — word/document\.xml/body/\*\[892\]

```text
Configuration Note: A Final Disposition Strategy can be configured to automatically assign a disposition code based on the item's alert code.
```

<a id="b00893"></a>
## b00893 — word/document\.xml/body/\*\[893\]

```text
Assumptions
```

<a id="b00894"></a>
## b00894 — word/document\.xml/body/\*\[894\]

```text
General Receiving
```

<a id="b00895"></a>
## b00895 — word/document\.xml/body/\*\[895\]

```text
Inventory Storage: Inventory at the Dodgeville DC is stored in single-SKU iLPNs. Any multi-SKU iLPNs (excluding pre-packs) received are manually split into single-SKU iLPNs after the initial receipt.
```

<a id="b00896"></a>
## b00896 — word/document\.xml/body/\*\[896\]

```text
Blind ASN Receipt: Blind ASNs must be associated with a Purchase Order (PO) to be received in MAWM. Lands' End does not use Supplier Blind ASNs but can create Item and LPN level receipts from a PO.
```

<a id="b00897"></a>
## b00897 — word/document\.xml/body/\*\[897\]

```text
Receiving Methods: All receiving processes are performed using WM Mobile/RF/Return Station transactions or MHE events.
```

<a id="b00898"></a>
## b00898 — word/document\.xml/body/\*\[898\]

```text
LPN Disposition: LPN disposition is linked to Lands' End receiving transactions.
```

<a id="b00899"></a>
## b00899 — word/document\.xml/body/\*\[899\]

```text
PIX Communication: PIX messages are sent to the respective host system as iLPNs are received.
```

<a id="b00900"></a>
## b00900 — word/document\.xml/body/\*\[900\]

```text
ASN Verification: 
```

<a id="b00901"></a>
## b00901 — word/document\.xml/body/\*\[901\]

```text
ASNs must be verified individually.
```

<a id="b00902"></a>
## b00902 — word/document\.xml/body/\*\[902\]

```text
All ASNs must be verified before proceeding.
```

<a id="b00903"></a>
## b00903 — word/document\.xml/body/\*\[903\]

```text
ASN verification is initiated via the ASNs UI, not from a receiving transaction.
```

<a id="b00904"></a>
## b00904 — word/document\.xml/body/\*\[904\]

```text
Tracked Inventory Attributes: Tracked Inventory Attributes are provided in ASN interfaces (iLPN and Item level) to avoid manual entry during the receiving process.
```

<a id="b00905"></a>
## b00905 — word/document\.xml/body/\*\[905\]

```text
Vendor Rating Group: Vendor Rating is maintained in SAP by vendor factory (MAWM Vendor Facility Id). A vendor rating group is sent from SAP to MAWM as an extended attribute in the ASN Detail for Item Level ASN or with the ASN LPN for LPN level ASN. This attribute is used in MAWM to perform inbound quality rules. 
```

<a id="b00906"></a>
## b00906 — word/document\.xml/body/\*\[906\]

```text
Pending Putaway Condition Code: The "Pending Putaway" condition code is used for all receiving processes except Production Order Receiving. It allows the product to be received as available for order allocation while avoiding a second PIX after putaway.
```

<a id="b00907"></a>
## b00907 — word/document\.xml/body/\*\[907\]

```text
Production Order Fulfillment Code Validation: A receiving rule criteria is used to validate the proper receiving transaction is used to receive the finished goods of a production order based on the fulfillment  code of the ASN. 
```

<a id="b00908"></a>
## b00908 — word/document\.xml/body/\*\[908\]

```text
Returns
```

<a id="b00909"></a>
## b00909 — word/document\.xml/body/\*\[909\]

```text
Return ASN Receipt: Return ASNs can be received without a PO.
```

<a id="b00910"></a>
## b00910 — word/document\.xml/body/\*\[910\]

```text
LPN Disposition: LPN disposition is not linked to Lands' End returns receiving transactions.
```

<a id="b00911"></a>
## b00911 — word/document\.xml/body/\*\[911\]

```text
PIX Communication: PIX messages are communicated to the respective host system as iLPNs are received.
```

<a id="b00912"></a>
## b00912 — word/document\.xml/body/\*\[912\]

```text
ASN Verification: 
```

<a id="b00913"></a>
## b00913 — word/document\.xml/body/\*\[913\]

```text
Return ASNs are verified individually.
```

<a id="b00914"></a>
## b00914 — word/document\.xml/body/\*\[914\]

```text
All Return ASNs must be verified.
```

<a id="b00915"></a>
## b00915 — word/document\.xml/body/\*\[915\]

```text
ASN verification is initiated via the ASNs UI, not from a receiving transaction.
```

<a id="b00916"></a>
## b00916 — word/document\.xml/body/\*\[916\]

```text
Return Tracking Numbers: Return tracking numbers are not captured in MAWM.
```

<a id="b00917"></a>
## b00917 — word/document\.xml/body/\*\[917\]

```text
Return ASN Level: Return ASNs are Item Level ASNs.
```

<a id="b00918"></a>
## b00918 — word/document\.xml/body/\*\[918\]

```text
Tracked Inventory Attributes: Tracked Inventory Attributes are provided in iLPN and Item level ASN host interfaces to avoid manual entry during the receiving process and [GAP-17]  is used to default the attributes for blind receipts. 
```

<a id="b00919"></a>
## b00919 — word/document\.xml/body/\*\[919\]

```text


```

<a id="b00920"></a>
## b00920 — word/document\.xml/body/\*\[920\]

```text
User Stories 
```

<a id="b00921"></a>
## b00921 — word/document\.xml/body/\*\[921\]

```text
The following User Stories are covered for Lands’ End processes:
```

<a id="b00922"></a>
## b00922 — word/document\.xml/body/\*\[922\]

```text
User Story: MHE Receiving
```

<a id="b00923"></a>
## b00923 — word/document\.xml/body/\*\[923\]

```text
Who	What	Why
Receiving Associate	MHE Receiving 	Receive inventory using MHE
```

<a id="b00924"></a>
## b00924 — word/document\.xml/body/\*\[924\]

```text
Process
```

<a id="b00925"></a>
## b00925 — word/document\.xml/body/\*\[925\]

```text
iLPN is removed from trailer and inducted onto the receiving conveyor.
```

<a id="b00926"></a>
## b00926 — word/document\.xml/body/\*\[926\]

```text
iLPN passes through the MHE scanner.
```

<a id="b00927"></a>
## b00927 — word/document\.xml/body/\*\[927\]

```text
MHE sends a RECEIVE message to MAWM.
```

<a id="b00928"></a>
## b00928 — word/document\.xml/body/\*\[928\]

```text
MAWM invokes receiving logic for the iLPN. 
```

<a id="b00929"></a>
## b00929 — word/document\.xml/body/\*\[929\]

```text
If the iLPN cannot be received (e.g. Tolerance violation or LPN does not exist), the iLPN is marked by MHE as an exception. 
```

<a id="b00930"></a>
## b00930 — word/document\.xml/body/\*\[930\]

```text
MAWM invokes LPN Disposition Logic for the iLPN.
```

<a id="b00931"></a>
## b00931 — word/document\.xml/body/\*\[931\]

```text
MAWM triggers iLPN label payload to send to MHE system[WM01].
```

<a id="b00932"></a>
## b00932 — word/document\.xml/body/\*\[932\]

```text
MHE prints and applies iLPN label to carton.
```

<a id="b00933"></a>
## b00933 — word/document\.xml/body/\*\[933\]

```text
The carton continues down receiving conveyor to the sortation/pallet building area.
```

<a id="b00934"></a>
## b00934 — word/document\.xml/body/\*\[934\]

```text
Updates
```

<a id="b00935"></a>
## b00935 — word/document\.xml/body/\*\[935\]

```text
iLPN is received.
```

<a id="b00936"></a>
## b00936 — word/document\.xml/body/\*\[936\]

```text
MHE message is generated for MHE.
```

<a id="b00937"></a>
## b00937 — word/document\.xml/body/\*\[937\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN.
```

<a id="b00938"></a>
## b00938 — word/document\.xml/body/\*\[938\]

```text
ASN received quantity is updated.
```

<a id="b00939"></a>
## b00939 — word/document\.xml/body/\*\[939\]

```text
Various condition codes applied depending on LPN Disposition
```

<a id="b00940"></a>
## b00940 — word/document\.xml/body/\*\[940\]

```text
Receipt PIX sent to Host.
```

<a id="b00941"></a>
## b00941 — word/document\.xml/body/\*\[941\]

```text

```

<a id="b00942"></a>
## b00942 — word/document\.xml/body/\*\[942\]

```text
User Story: Receive iLPN Level ASN 
```

<a id="b00943"></a>
## b00943 — word/document\.xml/body/\*\[943\]

```text
Who	What	Why
Receiving Associate	Receive iLPN Level ASN	Create inventory within the DC
```

<a id="b00944"></a>
## b00944 — word/document\.xml/body/\*\[944\]

```text

```

<a id="b00945"></a>
## b00945 — word/document\.xml/body/\*\[945\]

```text
Process
```

<a id="b00946"></a>
## b00946 — word/document\.xml/body/\*\[946\]

```text
User enters WM Mobile Receive iLPN Level ASN Transaction in WM Mobile
```

<a id="b00947"></a>
## b00947 — word/document\.xml/body/\*\[947\]

```text
MAWM pulls the assigned ASN
```

<a id="b00948"></a>
## b00948 — word/document\.xml/body/\*\[948\]

```text
If multiple ASNs are assigned, user selects the appropriate ASN
```

<a id="b00949"></a>
## b00949 — word/document\.xml/body/\*\[949\]

```text
User scans iLPN barcode
```

<a id="b00950"></a>
## b00950 — word/document\.xml/body/\*\[950\]

```text
MAWM invokes LPN Disposition
```

<a id="b00951"></a>
## b00951 — word/document\.xml/body/\*\[951\]

```text
MAWM triggers iLPN Label to print
```

<a id="b00952"></a>
## b00952 — word/document\.xml/body/\*\[952\]

```text
User applies new iLPN label to carton
```

<a id="b00953"></a>
## b00953 — word/document\.xml/body/\*\[953\]

```text
MAWM displays assigned Process Need or sort location for iLPN to be located at
```

<a id="b00954"></a>
## b00954 — word/document\.xml/body/\*\[954\]

```text
User scans sort location to confirm or takes the iLPN to the appropriate area for processing based on Process Need
```

<a id="b00955"></a>
## b00955 — word/document\.xml/body/\*\[955\]

```text

```

<a id="b00956"></a>
## b00956 — word/document\.xml/body/\*\[956\]

```text
Updates
```

<a id="b00957"></a>
## b00957 — word/document\.xml/body/\*\[957\]

```text
iLPN is received
```

<a id="b00958"></a>
## b00958 — word/document\.xml/body/\*\[958\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN
```

<a id="b00959"></a>
## b00959 — word/document\.xml/body/\*\[959\]

```text
ASN received quantity is updated
```

<a id="b00960"></a>
## b00960 — word/document\.xml/body/\*\[960\]

```text
iLPN is located to sortation location determined by LPN Disposition 
```

<a id="b00961"></a>
## b00961 — word/document\.xml/body/\*\[961\]

```text
Various condition codes applied depending on LPN Disposition
```

<a id="b00962"></a>
## b00962 — word/document\.xml/body/\*\[962\]

```text
Receipt PIX sent to Host.
```

<a id="b00963"></a>
## b00963 — word/document\.xml/body/\*\[963\]

```text

```

<a id="b00964"></a>
## b00964 — word/document\.xml/body/\*\[964\]

```text
User Story: Receive Item Level ASN
```

<a id="b00965"></a>
## b00965 — word/document\.xml/body/\*\[965\]

```text
Who	What	Why
Receiving Associate	Receive Item Level ASN	Create inventory within the DC
```

<a id="b00966"></a>
## b00966 — word/document\.xml/body/\*\[966\]

```text
Process
```

<a id="b00967"></a>
## b00967 — word/document\.xml/body/\*\[967\]

```text
User enters WM Mobile Receive Item Level ASN Transaction in WM Mobile
```

<a id="b00968"></a>
## b00968 — word/document\.xml/body/\*\[968\]

```text
User scans a blind iLPN label for the receipt
```

<a id="b00969"></a>
## b00969 — word/document\.xml/body/\*\[969\]

```text
User scans the Item barcode from the container
```

<a id="b00970"></a>
## b00970 — word/document\.xml/body/\*\[970\]

```text
User enters quantity to receive onto the iLPN
```

<a id="b00971"></a>
## b00971 — word/document\.xml/body/\*\[971\]

```text
MAWM invokes LPN Disposition
```

<a id="b00972"></a>
## b00972 — word/document\.xml/body/\*\[972\]

```text
MAWM triggers iLPN Label to print
```

<a id="b00973"></a>
## b00973 — word/document\.xml/body/\*\[973\]

```text
User applies new iLPN label to carton
```

<a id="b00974"></a>
## b00974 — word/document\.xml/body/\*\[974\]

```text
MAWM displays sort location for iLPN to be located at
```

<a id="b00975"></a>
## b00975 — word/document\.xml/body/\*\[975\]

```text
User scans sort location to confirm
```

<a id="b00976"></a>
## b00976 — word/document\.xml/body/\*\[976\]

```text

```

<a id="b00977"></a>
## b00977 — word/document\.xml/body/\*\[977\]

```text
Updates
```

<a id="b00978"></a>
## b00978 — word/document\.xml/body/\*\[978\]

```text

```

<a id="b00979"></a>
## b00979 — word/document\.xml/body/\*\[979\]

```text
iLPN is received
```

<a id="b00980"></a>
## b00980 — word/document\.xml/body/\*\[980\]

```text
Condition Code applied to iLPN to identify ‘PO Type’ (CORE, QVC, Amazon)
```

<a id="b00981"></a>
## b00981 — word/document\.xml/body/\*\[981\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN
```

<a id="b00982"></a>
## b00982 — word/document\.xml/body/\*\[982\]

```text
ASN received quantity is updated
```

<a id="b00983"></a>
## b00983 — word/document\.xml/body/\*\[983\]

```text
iLPN is located to sortation location determined by LPN Disposition 
```

<a id="b00984"></a>
## b00984 — word/document\.xml/body/\*\[984\]

```text
Receipt PIX sent to Host.
```

<a id="b00985"></a>
## b00985 — word/document\.xml/body/\*\[985\]

```text

```

<a id="b00986"></a>
## b00986 — word/document\.xml/body/\*\[986\]

```text

```

<a id="b00987"></a>
## b00987 — word/document\.xml/body/\*\[987\]

```text


```

<a id="b00988"></a>
## b00988 — word/document\.xml/body/\*\[988\]

```text
User Story: Receiving & Palletize
```

<a id="b00989"></a>
## b00989 — word/document\.xml/body/\*\[989\]

```text
Who	What	Why
Receiving Associate	Receive LPN and Palletize for GOH or Ship Alone items	Create inventory within the DC
```

<a id="b00990"></a>
## b00990 — word/document\.xml/body/\*\[990\]

```text

```

<a id="b00991"></a>
## b00991 — word/document\.xml/body/\*\[991\]

```text
Process Steps
```

<a id="b00992"></a>
## b00992 — word/document\.xml/body/\*\[992\]

```text
Receiving user navigates to the Receiving & Palletize mobile transaction directly from the menu.
```

<a id="b00993"></a>
## b00993 — word/document\.xml/body/\*\[993\]

```text
MAWM prompts user for Dock Door.
```

<a id="b00994"></a>
## b00994 — word/document\.xml/body/\*\[994\]

```text
To receive product to the dock door staging location, user scans/enters the Dock Door.
```

<a id="b00995"></a>
## b00995 — word/document\.xml/body/\*\[995\]

```text
MAWM prompts user for iLPN to receive.
```

<a id="b00996"></a>
## b00996 — word/document\.xml/body/\*\[996\]

```text
User scans iLPN.
```

<a id="b00997"></a>
## b00997 — word/document\.xml/body/\*\[997\]

```text
MAWM displays sort location and prompts user to scan iLPN.
```

<a id="b00998"></a>
## b00998 — word/document\.xml/body/\*\[998\]

```text
System-Directed sorting is used, MAWM directs user to scan iLPN if open iLPN exists in the directed sort location, otherwise MAWM prompts user to scan new iLPN.
```

<a id="b00999"></a>
## b00999 — word/document\.xml/body/\*\[999\]

```text
User scans the destination iLPN.
```

<a id="b01000"></a>
## b01000 — word/document\.xml/body/\*\[1000\]

```text
User repeats from iLPN scan for each iLPN.
```

<a id="b01001"></a>
## b01001 — word/document\.xml/body/\*\[1001\]

```text
Process Updates
```

<a id="b01002"></a>
## b01002 — word/document\.xml/body/\*\[1002\]

```text
ASN Status updated to “In Receiving”.
```

<a id="b01003"></a>
## b01003 — word/document\.xml/body/\*\[1003\]

```text
iLPN is systematically received and located to the inbound staging location tied to the dock door.
```

<a id="b01004"></a>
## b01004 — word/document\.xml/body/\*\[1004\]

```text
Pending Putaway Condition Code is applied to the iLPNs.
```

<a id="b01005"></a>
## b01005 — word/document\.xml/body/\*\[1005\]

```text
Receipt PIX sent to Host.
```

<a id="b01006"></a>
## b01006 — word/document\.xml/body/\*\[1006\]

```text
User Story: Bulk ASN Receiving
```

<a id="b01007"></a>
## b01007 — word/document\.xml/body/\*\[1007\]

```text
Who	What	Why
Receiving Associate	Bulk Receiving Customer Transfer Orders	Create inventory within the DC for customer orders.
```

<a id="b01008"></a>
## b01008 — word/document\.xml/body/\*\[1008\]

```text

```

<a id="b01009"></a>
## b01009 — word/document\.xml/body/\*\[1009\]

```text
Process Steps
```

<a id="b01010"></a>
## b01010 — word/document\.xml/body/\*\[1010\]

```text
Receiving user navigates to the Bulk ASN Receiving mobile transaction directly from the menu.
```

<a id="b01011"></a>
## b01011 — word/document\.xml/body/\*\[1011\]

```text
MAWM prompts user for ASN Id to receive.
```

<a id="b01012"></a>
## b01012 — word/document\.xml/body/\*\[1012\]

```text
User scans ASN Id.
```

<a id="b01013"></a>
## b01013 — word/document\.xml/body/\*\[1013\]

```text
Process Updates
```

<a id="b01014"></a>
## b01014 — word/document\.xml/body/\*\[1014\]

```text
ASN Status updated to “In Receiving”.
```

<a id="b01015"></a>
## b01015 — word/document\.xml/body/\*\[1015\]

```text
All ASN iLPN are bulk received and located to the inbound staging or storage location tied to the dock door.
```

<a id="b01016"></a>
## b01016 — word/document\.xml/body/\*\[1016\]

```text
Pending Putaway Condition Code is applied to the iLPNs.
```

<a id="b01017"></a>
## b01017 — word/document\.xml/body/\*\[1017\]

```text
Receipt PIX sent to Host.
```

<a id="b01018"></a>
## b01018 — word/document\.xml/body/\*\[1018\]

```text

```

<a id="b01019"></a>
## b01019 — word/document\.xml/body/\*\[1019\]

```text
User Story: Production Order - Outsource Receiving
```

<a id="b01020"></a>
## b01020 — word/document\.xml/body/\*\[1020\]

```text
Who	What	Why
Receiving Associate	Receiving Outsourcing Production Orders.	Create inventory within the DC for customer orders.
```

<a id="b01021"></a>
## b01021 — word/document\.xml/body/\*\[1021\]

```text

```

<a id="b01022"></a>
## b01022 — word/document\.xml/body/\*\[1022\]

```text
Process Steps
```

<a id="b01023"></a>
## b01023 — word/document\.xml/body/\*\[1023\]

```text
The receiving associate navigates to the “Outsource Receiving” mobile transaction from the menu.
```

<a id="b01024"></a>
## b01024 — word/document\.xml/body/\*\[1024\]

```text
MAWM prompts the user to scan an Inbound Container for receiving.
```

<a id="b01025"></a>
## b01025 — word/document\.xml/body/\*\[1025\]

```text
The associate scans the Production Order ID (LPN in MAWM) from the production order paperwork.
```

<a id="b01026"></a>
## b01026 — word/document\.xml/body/\*\[1026\]

```text
MAWM executes LPN Disposition to determine the next processing location.
```

<a id="b01027"></a>
## b01027 — word/document\.xml/body/\*\[1027\]

```text
If the Fulfillment Code is "L", MAWM prompts (suggests) the user to scan a location barcode in the dedicated to large production orders zone.
```

<a id="b01028"></a>
## b01028 — word/document\.xml/body/\*\[1028\]

```text
The user scans a valid location within the displayed zone (e.g., the left side of the receiving dock door).
```

<a id="b01029"></a>
## b01029 — word/document\.xml/body/\*\[1029\]

```text
Otherwise, MAWM prompts (suggests) the user to scan a Post-VAS Putwall staging location.
```

<a id="b01030"></a>
## b01030 — word/document\.xml/body/\*\[1030\]

```text
The user scans a valid location within the displayed zone (e.g., the right side of the receiving dock door).
```

<a id="b01031"></a>
## b01031 — word/document\.xml/body/\*\[1031\]

```text
The user scans a storage location for the outsource production order receiving.
```

<a id="b01032"></a>
## b01032 — word/document\.xml/body/\*\[1032\]

```text

```

<a id="b01033"></a>
## b01033 — word/document\.xml/body/\*\[1033\]

```text
Note: SOP is followed to move the large order pallets or gurneys to the designated packing area after receiving and for non-large orders, the user needs to perform a putaway process after the receiving process is completed. A Receiving Rules Criteria is used to only allows the receiving of ASN with Extended attribute OutsourceVAS is true, otherwise a receiving error message is display “The transaction is configured for Outsource Production Order Receiving”.
```

<a id="b01034"></a>
## b01034 — word/document\.xml/body/\*\[1034\]

```text
Process Updates
```

<a id="b01035"></a>
## b01035 — word/document\.xml/body/\*\[1035\]

```text
ASN Status updated to “In Receiving”.
```

<a id="b01036"></a>
## b01036 — word/document\.xml/body/\*\[1036\]

```text
All iLPN (VAS Descriptor Labels) in a pallet are bulk received and located to the selected location.
```

<a id="b01037"></a>
## b01037 — word/document\.xml/body/\*\[1037\]

```text
Receipt PIX sent to Host to perform a Vendor Inventory Transfer from Outsource vendor facility to Manhattan Warehouse facility .
```

<a id="b01038"></a>
## b01038 — word/document\.xml/body/\*\[1038\]

```text
Note: The Suggested Putaway is used to guide the user in scanning the appropriate location barcode after receiving.
```

<a id="b01039"></a>
## b01039 — word/document\.xml/body/\*\[1039\]

```text


```

<a id="b01040"></a>
## b01040 — word/document\.xml/body/\*\[1040\]

```text
User Story: Production Orders – Outsourcing Damages Receiving (Not used with EOM)
```

<a id="b01041"></a>
## b01041 — word/document\.xml/body/\*\[1041\]

```text
Who	What	Why
Receiving Associate	Receive Production Orders damages.	Receive and adjust damaged goods.
```

<a id="b01042"></a>
## b01042 — word/document\.xml/body/\*\[1042\]

```text

```

<a id="b01043"></a>
## b01043 — word/document\.xml/body/\*\[1043\]

```text
Process
```

<a id="b01044"></a>
## b01044 — word/document\.xml/body/\*\[1044\]

```text
User enters WM Mobile “Receive Production Orders Damages” transaction in WM Mobile
```

<a id="b01045"></a>
## b01045 — word/document\.xml/body/\*\[1045\]

```text
The user enters the ASN ID.
```

<a id="b01046"></a>
## b01046 — word/document\.xml/body/\*\[1046\]

```text
MAWM generates an iLPN ID for the receipt.
```

<a id="b01047"></a>
## b01047 — word/document\.xml/body/\*\[1047\]

```text
The user scans the item barcode.
```

<a id="b01048"></a>
## b01048 — word/document\.xml/body/\*\[1048\]

```text
The user enters the quantity to receive onto the iLPN.
```

<a id="b01049"></a>
## b01049 — word/document\.xml/body/\*\[1049\]

```text
MAWM invokes LPN Disposition with Scrap final disposition (background process) 
```

<a id="b01050"></a>
## b01050 — word/document\.xml/body/\*\[1050\]

```text
User repeats steps # 3 – 5  until all damaged items are received.
```

<a id="b01051"></a>
## b01051 — word/document\.xml/body/\*\[1051\]

```text
Updates
```

<a id="b01052"></a>
## b01052 — word/document\.xml/body/\*\[1052\]

```text
iLPN is received
```

<a id="b01053"></a>
## b01053 — word/document\.xml/body/\*\[1053\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for the ASN
```

<a id="b01054"></a>
## b01054 — word/document\.xml/body/\*\[1054\]

```text
ASN received quantity is updated
```

<a id="b01055"></a>
## b01055 — word/document\.xml/body/\*\[1055\]

```text
Item-LPN is consumed (adjusted)
```

<a id="b01056"></a>
## b01056 — word/document\.xml/body/\*\[1056\]

```text
A Damage Receipt PIX sent to Host
```

<a id="b01057"></a>
## b01057 — word/document\.xml/body/\*\[1057\]

```text
Note: The receiving associate or supervisor manually creates an item-level ASN in MAWM to reference the production order ID and default inventory attributes (e.g., inventory type, batch number, and inventory attributes 1 to 3) of the SKU. This ensures that prompts for these details are avoided during the receiving process.
```

<a id="b01058"></a>
## b01058 — word/document\.xml/body/\*\[1058\]

```text
User Story: Production Order – Large Order Receiving
```

<a id="b01059"></a>
## b01059 — word/document\.xml/body/\*\[1059\]

```text
Who	What	Why
Receiving Associate	Bulk Receiving Large Production Orders.	Create inventory within the DC for customer orders.
```

<a id="b01060"></a>
## b01060 — word/document\.xml/body/\*\[1060\]

```text

```

<a id="b01061"></a>
## b01061 — word/document\.xml/body/\*\[1061\]

```text
Process Steps
```

<a id="b01062"></a>
## b01062 — word/document\.xml/body/\*\[1062\]

```text
Receiving user navigates to the Large Order Receiving mobile transaction directly from the menu.
```

<a id="b01063"></a>
## b01063 — word/document\.xml/body/\*\[1063\]

```text
MAWM prompts user for ASN Id to receive.
```

<a id="b01064"></a>
## b01064 — word/document\.xml/body/\*\[1064\]

```text
User scans ASN Id.
```

<a id="b01065"></a>
## b01065 — word/document\.xml/body/\*\[1065\]

```text
MAWM prompts for a storage location
```

<a id="b01066"></a>
## b01066 — word/document\.xml/body/\*\[1066\]

```text
User scans a floor storage location dedicated for large production orders in the respective VAS area. 
```

<a id="b01067"></a>
## b01067 — word/document\.xml/body/\*\[1067\]

```text
Process Updates
```

<a id="b01068"></a>
## b01068 — word/document\.xml/body/\*\[1068\]

```text
ASN Status updated to “In Receiving”.
```

<a id="b01069"></a>
## b01069 — word/document\.xml/body/\*\[1069\]

```text
All ASN iLPN are bulk received and located to the selected floor storage location.
```

<a id="b01070"></a>
## b01070 — word/document\.xml/body/\*\[1070\]

```text
Receipt PIX sent to Host.
```

<a id="b01071"></a>
## b01071 — word/document\.xml/body/\*\[1071\]

```text
Note: SOP is followed to move the pallet or gurneys to the designated packing area. A Receiving Rules Criteria is used to only allows the receiving of ASN with Extended attribute “FulfillmentCode” equal “L”  and OutsourceVAS is false, otherwise a receiving error message is display “The transaction is configured for Large Production Order Receiving”.
```

<a id="b01072"></a>
## b01072 — word/document\.xml/body/\*\[1072\]

```text
User Story: Production Order – Singles Receiving
```

<a id="b01073"></a>
## b01073 — word/document\.xml/body/\*\[1073\]

```text
Who	What	Why
Receiving Associate	Receive Single Line/Single Units Production Orders goods.	Bring completed VAS Production Orders into the DC
```

<a id="b01074"></a>
## b01074 — word/document\.xml/body/\*\[1074\]

```text

```

<a id="b01075"></a>
## b01075 — word/document\.xml/body/\*\[1075\]

```text
Process
```

<a id="b01076"></a>
## b01076 — word/document\.xml/body/\*\[1076\]

```text
User enters WM Mobile “Receive Production Order - Singles” transaction in WM Mobile
```

<a id="b01077"></a>
## b01077 — word/document\.xml/body/\*\[1077\]

```text
User scans a post-vas receiving location barcode.
```

<a id="b01078"></a>
## b01078 — word/document\.xml/body/\*\[1078\]

```text
MAWM prompts for an Inbound Container (LpnId) 
```

<a id="b01079"></a>
## b01079 — word/document\.xml/body/\*\[1079\]

```text
User scans the VAS Id from the descriptor label.
```

<a id="b01080"></a>
## b01080 — word/document\.xml/body/\*\[1080\]

```text
User places the scanned unit inside a gurney, which is not tracked in MAWM but is used as a transportation container to move all finished goods to the post-VAS singles pack station once the gurney is full or when there are no more finished goods to be received.
```

<a id="b01081"></a>
## b01081 — word/document\.xml/body/\*\[1081\]

```text
Repeat steps 3-4 if there are more items/iLPNs to be received.
```

<a id="b01082"></a>
## b01082 — word/document\.xml/body/\*\[1082\]

```text
Updates
```

<a id="b01083"></a>
## b01083 — word/document\.xml/body/\*\[1083\]

```text
iLPNs are received
```

<a id="b01084"></a>
## b01084 — word/document\.xml/body/\*\[1084\]

```text
iLPN are located in a storage location scanned at the beginning of the process.
```

<a id="b01085"></a>
## b01085 — word/document\.xml/body/\*\[1085\]

```text
ASN status changes to ‘Receiving Started’ if it is the first receipt for the ASN.
```

<a id="b01086"></a>
## b01086 — word/document\.xml/body/\*\[1086\]

```text
ASN received quantity is updated.
```

<a id="b01087"></a>
## b01087 — word/document\.xml/body/\*\[1087\]

```text
Receipt PIX sent to Host for each received LPN.
```

<a id="b01088"></a>
## b01088 — word/document\.xml/body/\*\[1088\]

```text

```

<a id="b01089"></a>
## b01089 — word/document\.xml/body/\*\[1089\]

```text
Note: The "Pending Putaway" condition code is not applicable to any receiving transactions related to production orders. Sort Strategy is configured to use a default location sort location to don’t prompt it during receiving and sorting. A Receiving Rules Criteria is used to only allows the receiving of ANS with Extended attribute “FulfillmentCode” equal S and OutsourceVAS is false, otherwise a receiving error message is display “The transaction is configured for In-House Singles Production Order Receiving”.
```

<a id="b01090"></a>
## b01090 — word/document\.xml/body/\*\[1090\]

```text


```

<a id="b01091"></a>
## b01091 — word/document\.xml/body/\*\[1091\]

```text

```

<a id="b01092"></a>
## b01092 — word/document\.xml/body/\*\[1092\]

```text
User Story: Production Order – Multis, Name Badge & Enterprise Order Receiving
```

<a id="b01093"></a>
## b01093 — word/document\.xml/body/\*\[1093\]

```text
Who	What	Why
Receiving Associate	Receive multi-VAS, multi-unit production order goods, including enterprise orders.	Bring completed VAS Production Orders into the DC
```

<a id="b01094"></a>
## b01094 — word/document\.xml/body/\*\[1094\]

```text

```

<a id="b01095"></a>
## b01095 — word/document\.xml/body/\*\[1095\]

```text
Process
```

<a id="b01096"></a>
## b01096 — word/document\.xml/body/\*\[1096\]

```text
User enters WM Mobile “Receive Production Order by VAS Label ID” transaction in WM Mobile
```

<a id="b01097"></a>
## b01097 — word/document\.xml/body/\*\[1097\]

```text
User scans iLPN barcode ( Could be the production Order number (ASN Pallet Id from SAP paperwork ) to bulk receive the entire order or by Lpn Id (VAS Label Id) from descriptor label to receive the finished good  by unit.
```

<a id="b01098"></a>
## b01098 — word/document\.xml/body/\*\[1098\]

```text
MAWM invokes LPN Disposition (background process as part of the receiving process)
```

<a id="b01099"></a>
## b01099 — word/document\.xml/body/\*\[1099\]

```text
MAWM invoke Putaway (Suggested Putaway) 
```

<a id="b01100"></a>
## b01100 — word/document\.xml/body/\*\[1100\]

```text
MAWM prompts user for a storage location.
```

<a id="b01101"></a>
## b01101 — word/document\.xml/body/\*\[1101\]

```text
User scans location barcode
```

<a id="b01102"></a>
## b01102 — word/document\.xml/body/\*\[1102\]

```text
User repeats steps 2 – 6 until all finished VAS items are received.
```

<a id="b01103"></a>
## b01103 — word/document\.xml/body/\*\[1103\]

```text
Updates
```

<a id="b01104"></a>
## b01104 — word/document\.xml/body/\*\[1104\]

```text
iLPN is received
```

<a id="b01105"></a>
## b01105 — word/document\.xml/body/\*\[1105\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN
```

<a id="b01106"></a>
## b01106 — word/document\.xml/body/\*\[1106\]

```text
ASN received quantity is updated
```

<a id="b01107"></a>
## b01107 — word/document\.xml/body/\*\[1107\]

```text
iLPN is located in a Post VAS Putwall cubby (LPN track storage location) 
```

<a id="b01108"></a>
## b01108 — word/document\.xml/body/\*\[1108\]

```text
Receipt PIX sent to Host.
```

<a id="b01109"></a>
## b01109 — word/document\.xml/body/\*\[1109\]

```text
Note: The "Pending Putaway" condition code is not applicable to any receiving transactions related to production orders. A Receiving Rules Criteria is used to only allows the receiving of ANS with Extended attribute “FulfillmentCode” equal M or X and OutsourceVAS is false, otherwise a receiving error message is display “The transaction is configured for In-House Multi-Units Production Order Receiving”.
```

<a id="b01110"></a>
## b01110 — word/document\.xml/body/\*\[1110\]

```text


```

<a id="b01111"></a>
## b01111 — word/document\.xml/body/\*\[1111\]

```text
User Story: Returns Station UI
```

<a id="b01112"></a>
## b01112 — word/document\.xml/body/\*\[1112\]

```text
Who	What	Why
Receiving Associate	Systematically receive returns, disposition inventory at fixed workstations.	Inventory that has been returned by the customers or stores is sent to the facility to be received and dispositioned.
```

<a id="b01113"></a>
## b01113 — word/document\.xml/body/\*\[1113\]

```text

```

<a id="b01114"></a>
## b01114 — word/document\.xml/body/\*\[1114\]

```text
Process
```

<a id="b01115"></a>
## b01115 — word/document\.xml/body/\*\[1115\]

```text
If required, the user initiates receipt in a system outside of MAWM to issue credit to the customer and print UPC labels for each unit in the return.
```

<a id="b01116"></a>
## b01116 — word/document\.xml/body/\*\[1116\]

```text
Users pre-sort the returns inventory by sender, contents, logos, etc.
```

<a id="b01117"></a>
## b01117 — word/document\.xml/body/\*\[1117\]

```text
The user navigates to the Returns Station UI in a fix station web browser.
```

<a id="b01118"></a>
## b01118 — word/document\.xml/body/\*\[1118\]

```text
MAWM prompts for returns station and user selects specified station id from drop down
```

<a id="b01119"></a>
## b01119 — word/document\.xml/body/\*\[1119\]

```text
User clicks “Start Receiving” 
```

<a id="b01120"></a>
## b01120 — word/document\.xml/body/\*\[1120\]

```text
User scans or key enters ASN Id
```

<a id="b01121"></a>
## b01121 — word/document\.xml/body/\*\[1121\]

```text
If no ASN is available, a Blind ASN ID is created a Blind ASN from ASN UI
```

<a id="b01122"></a>
## b01122 — word/document\.xml/body/\*\[1122\]

```text
The user scans the item barcode.
```

<a id="b01123"></a>
## b01123 — word/document\.xml/body/\*\[1123\]

```text
The user enters any required inventory attributes (e.g., inseam, logo).
```

<a id="b01124"></a>
## b01124 — word/document\.xml/body/\*\[1124\]

```text
If the returned item is a VAS item and is identified as "not quite perfect" (NQP), the user receives the product with a new batch number. This new batch number is generated within the "Print Blind Labels" UI using a Counter Type of "NQP VAS Return.
```

<a id="b01125"></a>
## b01125 — word/document\.xml/body/\*\[1125\]

```text
If these attributes are available on the ASN, they do not need to be displayed or confirmed.
```

<a id="b01126"></a>
## b01126 — word/document\.xml/body/\*\[1126\]

```text
If the item has an active alert, an informational message is displayed to the user.
```

<a id="b01127"></a>
## b01127 — word/document\.xml/body/\*\[1127\]

```text
The message contains information about a known defect or issue with the SKU, so the user knows what to check during the inspection.
```

<a id="b01128"></a>
## b01128 — word/document\.xml/body/\*\[1128\]

```text
The user enters the quantity to receive onto the iLPN.
```

<a id="b01129"></a>
## b01129 — word/document\.xml/body/\*\[1129\]

```text
This step is only necessary if in Quantity Entry Mode.
```

<a id="b01130"></a>
## b01130 — word/document\.xml/body/\*\[1130\]

```text
MAWM displays a list of available disposition codes for the user to select from.
```

<a id="b01131"></a>
## b01131 — word/document\.xml/body/\*\[1131\]

```text
The user visually inspects the inventory and selects the appropriate disposition code based on the inventory condition.
```

<a id="b01132"></a>
## b01132 — word/document\.xml/body/\*\[1132\]

```text
MAWM applies a condition code to the iLPN based on the selected disposition.
```

<a id="b01133"></a>
## b01133 — word/document\.xml/body/\*\[1133\]

```text
If “1st Quality” or “Store” disposition is selected, the user is taken directly into a sort process.
```

<a id="b01134"></a>
## b01134 — word/document\.xml/body/\*\[1134\]

```text
MAWM prints an iLPN label for the receipt after LPN Disposition is complete – [WM01/WM09].
```

<a id="b01135"></a>
## b01135 — word/document\.xml/body/\*\[1135\]

```text
The user places the iLPN onto a conveyor towards the sortation area.
```

<a id="b01136"></a>
## b01136 — word/document\.xml/body/\*\[1136\]

```text
Updates
```

<a id="b01137"></a>
## b01137 — word/document\.xml/body/\*\[1137\]

```text
iLPN was created in MAWM.
```

<a id="b01138"></a>
## b01138 — word/document\.xml/body/\*\[1138\]

```text
iLPN is received.
```

<a id="b01139"></a>
## b01139 — word/document\.xml/body/\*\[1139\]

```text
ASN is created in MAWM if ASN was generated.
```

<a id="b01140"></a>
## b01140 — word/document\.xml/body/\*\[1140\]

```text
Condition Code applied to iLPN based on Disposition selected.
```

<a id="b01141"></a>
## b01141 — word/document\.xml/body/\*\[1141\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN.
```

<a id="b01142"></a>
## b01142 — word/document\.xml/body/\*\[1142\]

```text
ASN received quantity is updated.
```

<a id="b01143"></a>
## b01143 — word/document\.xml/body/\*\[1143\]

```text
Receipt PIX sent to host.
```

<a id="b01144"></a>
## b01144 — word/document\.xml/body/\*\[1144\]

```text
User Story: Mobile Returns
```

<a id="b01145"></a>
## b01145 — word/document\.xml/body/\*\[1145\]

```text
Who	What	Why
Receiving Associate	Systematically receive returns, disposition inventory.	Inventory that has been returned by the customers or stores is sent to the facility to be received and dispositioned.
```

<a id="b01146"></a>
## b01146 — word/document\.xml/body/\*\[1146\]

```text

```

<a id="b01147"></a>
## b01147 — word/document\.xml/body/\*\[1147\]

```text
Process
```

<a id="b01148"></a>
## b01148 — word/document\.xml/body/\*\[1148\]

```text
If required, the user initiates receipt in a system outside of MAWM to issue credit to the customer and print UPC labels for each unit in the return.
```

<a id="b01149"></a>
## b01149 — word/document\.xml/body/\*\[1149\]

```text
Users pre-sort the returns inventory by sender, contents, logos, etc.
```

<a id="b01150"></a>
## b01150 — word/document\.xml/body/\*\[1150\]

```text
The user enters the WM Mobile Returns Receiving Transaction in WM Mobile.
```

<a id="b01151"></a>
## b01151 — word/document\.xml/body/\*\[1151\]

```text
The user enters the iLPN ID.
```

<a id="b01152"></a>
## b01152 — word/document\.xml/body/\*\[1152\]

```text
The user enters any required inventory attributes (e.g., inseam, logo, batch number).
```

<a id="b01153"></a>
## b01153 — word/document\.xml/body/\*\[1153\]

```text
If the returned item is a VAS item and is identified as "not quite perfect" (NQP), the user receives the product with a new batch number. This new batch number is generated within the "Print Blind Labels" UI using a Counter Type of "NQP VAS Return.”
```

<a id="b01154"></a>
## b01154 — word/document\.xml/body/\*\[1154\]

```text
If these attributes are available on the ASN, they do not need to be displayed or confirmed.
```

<a id="b01155"></a>
## b01155 — word/document\.xml/body/\*\[1155\]

```text
If the item has an active alert, an informational message is displayed to the user. The message contains information about a known defect or issue with the SKU, so the user knows what to check during the inspection.
```

<a id="b01156"></a>
## b01156 — word/document\.xml/body/\*\[1156\]

```text
MAWM displays a list of available disposition codes for the user to select from.
```

<a id="b01157"></a>
## b01157 — word/document\.xml/body/\*\[1157\]

```text
The user visually inspects the inventory and selects the appropriate disposition code based on the inventory condition.
```

<a id="b01158"></a>
## b01158 — word/document\.xml/body/\*\[1158\]

```text
MAWM applies a condition code to the iLPN based on the selected disposition.
```

<a id="b01159"></a>
## b01159 — word/document\.xml/body/\*\[1159\]

```text
MAWM prints an iLPN label for the receipt after LPN Disposition is complete – [WM01/WM09].
```

<a id="b01160"></a>
## b01160 — word/document\.xml/body/\*\[1160\]

```text
The user places the iLPN (One Unit LPN) onto a conveyor towards the sortation area.
```

<a id="b01161"></a>
## b01161 — word/document\.xml/body/\*\[1161\]

```text

```

<a id="b01162"></a>
## b01162 — word/document\.xml/body/\*\[1162\]

```text
Updates
```

<a id="b01163"></a>
## b01163 — word/document\.xml/body/\*\[1163\]

```text
iLPN was created in MAWM.
```

<a id="b01164"></a>
## b01164 — word/document\.xml/body/\*\[1164\]

```text
iLPN is received.
```

<a id="b01165"></a>
## b01165 — word/document\.xml/body/\*\[1165\]

```text
ASN is created in MAWM if ASN was generated.
```

<a id="b01166"></a>
## b01166 — word/document\.xml/body/\*\[1166\]

```text
Condition Code applied to iLPN based on Disposition selected.
```

<a id="b01167"></a>
## b01167 — word/document\.xml/body/\*\[1167\]

```text
ASN status changes to ‘Receiving Started’ if first receipt for ASN.
```

<a id="b01168"></a>
## b01168 — word/document\.xml/body/\*\[1168\]

```text
ASN received quantity is updated.
```

<a id="b01169"></a>
## b01169 — word/document\.xml/body/\*\[1169\]

```text
Receipt PIX sent to host.
```

<a id="b01170"></a>
## b01170 — word/document\.xml/body/\*\[1170\]

```text

```

<a id="b01171"></a>
## b01171 — word/document\.xml/body/\*\[1171\]

```text


```

<a id="b01172"></a>
## b01172 — word/document\.xml/body/\*\[1172\]

```text
Features
```

<a id="b01173"></a>
## b01173 — word/document\.xml/body/\*\[1173\]

```text
Receiving Rules
```

<a id="b01174"></a>
## b01174 — word/document\.xml/body/\*\[1174\]

```text
Using the Receiving Rules, Lands’ End can create criteria which evaluate inbound data at the time of receipt to determine whether receivers need to be notified of a certain scenario and/or prevent receiving of the product until the data condition is rectified. 
```

<a id="b01175"></a>
## b01175 — word/document\.xml/body/\*\[1175\]

```text
Lands’ End leverages Receiving Rules to display ‘Item Alert’ messages to the returns receiving auditors during returns receiving to point out special instructions to follow before the disposition code is selected. Items with an active alert have an Item Extended Attribute field populated with a code that correlates to a specific message in MAWM.
```

<a id="b01176"></a>
## b01176 — word/document\.xml/body/\*\[1176\]

```text
Example:
```

<a id="b01177"></a>
## b01177 — word/document\.xml/body/\*\[1177\]

```text
Item	Alert Code	Alert Message
Men’s Cashmere V-neck Sweater	A	Check Frills on Left Sleeve
Men’s Flannel Pajama Pants	B	Check Color Bleeding on Waistband
```

<a id="b01178"></a>
## b01178 — word/document\.xml/body/\*\[1178\]

```text

```

<a id="b01179"></a>
## b01179 — word/document\.xml/body/\*\[1179\]

```text
During receiving returns, the Receiving Rules are configured for each Alert Code to display the corresponding message to the user to they know to check for specific defects. Item Alert codes on the item master, alert messages, and updating  receiving rules as needed are manually maintained by warehouse operations teams.
```

<a id="b01180"></a>
## b01180 — word/document\.xml/body/\*\[1180\]

```text
The Receiving Rules framework provides Lands’ End with a lot of flexibility to define and create many different types of rule sets based on the use cases identified. Lands’ End also can force the receiver to capture certain data elements on the item if necessary.
```

<a id="b01181"></a>
## b01181 — word/document\.xml/body/\*\[1181\]

```text

```

<a id="b01182"></a>
## b01182 — word/document\.xml/body/\*\[1182\]

```text
Post Receiving Rules
```

<a id="b01183"></a>
## b01183 — word/document\.xml/body/\*\[1183\]

```text
Post-Receiving Rules are used after the product is received and can be used to for informational purposes (display message to receiver) and/or apply a condition code in the background that can drive putaway. The Post-Receiving Rules framework is like the Receiving Rules in that it provides a lot of flexibility to define several different conditions. 
```

<a id="b01184"></a>
## b01184 — word/document\.xml/body/\*\[1184\]

```text

```

<a id="b01185"></a>
## b01185 — word/document\.xml/body/\*\[1185\]

```text
Lands’ End uses Post-Receiving Rules to apply a Cubiscan condition code to iLPNs that are missing dimensional data, so they are sorted and identified as needing to go through the Cubiscan process. 
```

<a id="b01186"></a>
## b01186 — word/document\.xml/body/\*\[1186\]

```text

```

<a id="b01187"></a>
## b01187 — word/document\.xml/body/\*\[1187\]

```text
Lands’ End uses Post-Receiving Rules to apply a Multi SKU iLPN condition code to iLPNs that have more than one SKU and require splitting into multiple single SKU iLPNs post receipt.
```

<a id="b01188"></a>
## b01188 — word/document\.xml/body/\*\[1188\]

```text

```

<a id="b01189"></a>
## b01189 — word/document\.xml/body/\*\[1189\]

```text
Process Needs
```

<a id="b01190"></a>
## b01190 — word/document\.xml/body/\*\[1190\]

```text
Lands’ End utilizes Process Needs functionality to be called during LPN Disposition during the receiving process to mark certain iLPNs for Multi SKU, Cubiscan, Quality Control , or prepping. Permanent process needs can be created in MAWM to always notify users that the specified iLPN is required to go to a separate process before being putaway into inventory. 
```

<a id="b01191"></a>
## b01191 — word/document\.xml/body/\*\[1191\]

```text
LPN Disposition Strategy
```

<a id="b01192"></a>
## b01192 — word/document\.xml/body/\*\[1192\]

```text
LPN Disposition evaluates each iLPN to determine the downstream workflow that the iLPN should follow. There are multiple paths that an iLPN may be directed down at the time of receiving including Quality Audit, Cubiscan, Prepping,  Flowthrough, Direct to Active, or Reserve Storage. To achieve this type of evaluation for each iLPN during receiving, a combination of MAWM functions is used including Receiving Rules, Post Receiving Rules, and Process Needs. 
```

<a id="b01193"></a>
## b01193 — word/document\.xml/body/\*\[1193\]

```text
Before LPN Disposition is called, as part of the Receiving Strategy for all iLPNs, Post Receiving Rules are utilized to apply condition codes to iLPNs if they fit a specified set of conditions. These rules are configured to check iLPNs that are missing dimensional data to apply a ‘Cubiscan’ condition code and to check if an iLPN contains multiple SKUs to apply a ‘Multi SKU iLPN’ condition code. These condition codes play a fundamental role in disposition determination during the LPN Disposition process. iLPNs that qualify for multiple rules can have multiple condition codes applied at the time of receipt. 
```

<a id="b01194"></a>
## b01194 — word/document\.xml/body/\*\[1194\]

```text
Once the Post Receiving Rules have been systematically performed for the iLPN during receiving, LPN Disposition is then called by MAWM to determine the disposition or destination of the iLPN. LPN Disposition is configured to prioritize certain functions or areas of the warehouse that a given iLPN should be evaluated for first. For example, Lands’ End would want to prioritize any iLPN that is marked as requiring Cubiscan or Quality Audit before putaway or allocation is attempted against the iLPN. If no Quality Audit requirement exists for the iLPN, MAWM would then evaluate if the iLPN can be allocated for a Singles Bulk Flowthrough allocation process. If no open order demand exists for the iLPN, putaway is then evaluated for the iLPN to determine if there is space available in the active pick area. If no locations in active are available, MAWM then allocates the iLPN to a reserve storage location. For detailed Putaway Location Determination processes, see the Putaway section. 
```

<a id="b01195"></a>
## b01195 — word/document\.xml/body/\*\[1195\]

```text
Note: iLPNs that are allocated to go directly to active trigger an MHE event to send to the Induction Conveyor with the iLPN and destination information so the MHE can print a ‘destination value’ on the iLPN as it arrives. 
```

<a id="b01196"></a>
## b01196 — word/document\.xml/body/\*\[1196\]

```text
At the end of the LPN Disposition process the iLPN is dispositioned for the Quality Audit area for, str Audit, Cubiscan, or Multi SKU iLPN splitting (prepping), allocated against or order or orders with open demand, or allocated to a destination location in the active or reserve storage areas. No tasks are created at this point for the allocations that were created. The iLPNs next step is to be sorted to a pallet or sortation location specified for the destination of the iLPN to build a pallet and aid in the putaway execution process. 
```

<a id="b01197"></a>
## b01197 — word/document\.xml/body/\*\[1197\]

```text
Disposition Determination Priorities
```

<a id="b01198"></a>
## b01198 — word/document\.xml/body/\*\[1198\]

```text
Missing Item Dimensions (Cubiscan)
```

<a id="b01199"></a>
## b01199 — word/document\.xml/body/\*\[1199\]

```text
Quality Audit Required
```

<a id="b01200"></a>
## b01200 — word/document\.xml/body/\*\[1200\]

```text
Prepping Required
```

<a id="b01201"></a>
## b01201 — word/document\.xml/body/\*\[1201\]

```text
Singles Bulk Flowthrough
```

<a id="b01202"></a>
## b01202 — word/document\.xml/body/\*\[1202\]

```text
Active Allocation
```

<a id="b01203"></a>
## b01203 — word/document\.xml/body/\*\[1203\]

```text
Reserve Allocation
```

<a id="b01204"></a>
## b01204 — word/document\.xml/body/\*\[1204\]

```text
Post Processing LPN Disposition
```

<a id="b01205"></a>
## b01205 — word/document\.xml/body/\*\[1205\]

```text
iLPNs that are marked for Quality, Prepping, or Cubiscan processes during receiving are moved to the respective areas for the specific actions to be taken on the individual iLPNs. After these processes are complete, any necessary condition codes are removed from the iLPN, such as a QA condition code, and the iLPNs are re-processed through iLPN Disposition as a stand-alone transaction in WM Mobile. The re-processing re-evaluates the iLPN for any additional processes that need to take place before it can go to putaway. For example, an iLPN that required Cubiscan may also be required to go to Quality after being Cubi scanned, this second LPN disposition process ensures that iLPNs are not putaway before all required processes are complete. 
```

<a id="b01206"></a>
## b01206 — word/document\.xml/body/\*\[1206\]

```text
At the time the Post Processing LPN Disposition transaction is used to scan an iLPN, a new iLPN Label with the updated disposition may be printed and applied to the container as part of [WM01]. After the iLPN is scanned, depending on the area in the warehouse, users can be taken directly into the sortation process to sort to a pallet or the iLPNs can be taken to the sortation area, where a separate user sorts the iLPN to the proper pallet for putaway. 
```

<a id="b01207"></a>
## b01207 — word/document\.xml/body/\*\[1207\]

```text
LPN Disposition & Sort Strategy
```

<a id="b01208"></a>
## b01208 — word/document\.xml/body/\*\[1208\]

```text
Sorting for 1st Quality & Store Seconds
```

<a id="b01209"></a>
## b01209 — word/document\.xml/body/\*\[1209\]

```text
During the returns receipt process, if the returns analyzers disposition the return as a 1st Quality return or a Not Quite Perfect (NQP / Discontinued), MAWM calls LPN Disposition and performs a sortation process for the iLPN. LPN Disposition is configured to sort these iLPNs at the returns analyzer stations, where WM displays the destination sort location and only requires the user to tap to confirm the sort in WM Mobile. This process systematically locates the iLPN to the displayed sort location, 1ST Quality, Store Seconds, Charity, or RTV, and the user physically places this iLPN on the conveyor to the sorting area. 
```

<a id="b01210"></a>
## b01210 — word/document\.xml/body/\*\[1210\]

```text
As iLPN arrive in the sorting area on the conveyor from the returns analyzer, if the iLPN label displays 1st Quality users are trained to place these in the proper sort location, no additional scans are required. This inventory is tracked at the location level and is not palletized at this time. The next step for these units is to be taken to the Random Returns area to be putaway. 
```

<a id="b01211"></a>
## b01211 — word/document\.xml/body/\*\[1211\]

```text
If the iLPN label displays Not Quite Perfect (NQP/Discontinued) users are trained to place these iLPNs on the conveyor to the store sortation area. Due to the high volume of iLPNs in the Not Quite Perfect area and high number of possible sortation, users are identifying the cubby/slot to place the iLPN into using the Merchandise Group Code printed on the iLPN label. The iLPNs are physically put into bins corresponding with the same Merchandise Group Code of product, there are no systematic scans to the cubbies or bins at this time. 
```

<a id="b01212"></a>
## b01212 — word/document\.xml/body/\*\[1212\]

```text
When a bin is full of units, it is moved and replaced with an empty bin. Bin is emptied (like a flow-rack) from the opposite side into a carton. Combine iLPN is then used to create a multi-sku iLPN. They are being putaway into Reserve locations until they are needed for an order. 
```

<a id="b01213"></a>
## b01213 — word/document\.xml/body/\*\[1213\]

```text
 Sort for Putaway
```

<a id="b01214"></a>
## b01214 — word/document\.xml/body/\*\[1214\]

```text
All other iLPNs that do not fall into the 1st Quality or Not Quite Perfect category are scanned by users with Sort transaction in WM Mobile. This Sort locates the iLPN to an inventory location and sorts to a pallet based on the destination location and contents of the iLPN. 
```

<a id="b01215"></a>
## b01215 — word/document\.xml/body/\*\[1215\]

```text
Using the disposition code selected by the returns analyzer and iLPN contents, MAWM sorts to one of the following sort locations and palletizes the iLPNs into a large gurney for Charity. Scrap is automatically consumed and is thrown into a designated scrap bin. These are broad categories that may be broken down further in the sort strategy. 
```

<a id="b01216"></a>
## b01216 — word/document\.xml/body/\*\[1216\]

```text

```

<a id="b01217"></a>
## b01217 — word/document\.xml/body/\*\[1217\]

```text
Receiving Exceptions
```

<a id="b01218"></a>
## b01218 — word/document\.xml/body/\*\[1218\]

```text
Exceptions may occur during the receiving process for both MHE receiving and WM Mobile receiving processes. The following sections detail the common receiving exceptions that may occur at the Reedsburg facility.
```

<a id="b01219"></a>
## b01219 — word/document\.xml/body/\*\[1219\]

```text


```

<a id="b01220"></a>
## b01220 — word/document\.xml/body/\*\[1220\]

```text
MHE Exceptions
```

<a id="b01221"></a>
## b01221 — word/document\.xml/body/\*\[1221\]

```text
The following are the common receiving exceptions that may occur during the MHE receiving process. For all these scenarios, Matthews recognizes the error and prints a generic ‘exception’ label on the container, so it is recognizable on the conveyor for users to identify and research. If multiple iLPNs are having exceptions during the MHE receiving process, Matthews may be configured to stop the receiving conveyor after several subsequent failures. 
```

<a id="b01222"></a>
## b01222 — word/document\.xml/body/\*\[1222\]

```text
MHE Receiving Exceptions
```

<a id="b01223"></a>
## b01223 — word/document\.xml/body/\*\[1223\]

```text
iLPN scanned at MHE does not exist on ASN, non-receipt in MAWM.
```

<a id="b01224"></a>
## b01224 — word/document\.xml/body/\*\[1224\]

```text
iLPN has unreadable barcode, non-receipt in MAWM.
```

<a id="b01225"></a>
## b01225 — word/document\.xml/body/\*\[1225\]

```text
iLPN received in MAWM, LPN Disposition process does not produce Label for MHE to Print
```

<a id="b01226"></a>
## b01226 — word/document\.xml/body/\*\[1226\]

```text
iLPN received in MAWM, MHE unable to verify and print iLPN Label. 
```

<a id="b01227"></a>
## b01227 — word/document\.xml/body/\*\[1227\]

```text
WM Mobile Exceptions
```

<a id="b01228"></a>
## b01228 — word/document\.xml/body/\*\[1228\]

```text
Receiving exceptions may also occur during the various WM Mobile receiving transactions for both iLPN level and Item level receiving. No exception labels are printed during WM Mobile receiving exceptions, the receiving users place the unreceivable containers to the side to be researched and attempted to be received later. The following is a list of common receiving exceptions for WM Mobile receiving.
```

<a id="b01229"></a>
## b01229 — word/document\.xml/body/\*\[1229\]

```text
iLPN Level Receiving Exceptions
```

<a id="b01230"></a>
## b01230 — word/document\.xml/body/\*\[1230\]

```text
iLPN scanned not exist on ASN, error displayed to user.
```

<a id="b01231"></a>
## b01231 — word/document\.xml/body/\*\[1231\]

```text

```

<a id="b01232"></a>
## b01232 — word/document\.xml/body/\*\[1232\]

```text
Item Level Receiving Exceptions
```

<a id="b01233"></a>
## b01233 — word/document\.xml/body/\*\[1233\]

```text
Item scanned not exist on ASN, error displayed to user.
```

<a id="b01234"></a>
## b01234 — word/document\.xml/body/\*\[1234\]

```text
Quantity entered for item puts ASN or PO over configured receiving tolerance, warning or error displayed to user.
```

<a id="b01235"></a>
## b01235 — word/document\.xml/body/\*\[1235\]

```text
Key Interfaces
```

<a id="b01236"></a>
## b01236 — word/document\.xml/body/\*\[1236\]

```text
Interface	Business Scenario
Purchase Order	Inform distribution center of POs that will be shipped to the facility.
ASN	Inform distribution center of ASN contents prior to arrival.
Inbound Delivery	Inform distribution center of the Inbound Delivery expected at the facility.
PIX	Check-In PIX generated for host notification as appointments arrive to the warehouse.
```

<a id="b01237"></a>
## b01237 — word/document\.xml/body/\*\[1237\]

```text

```

<a id="b01238"></a>
## b01238 — word/document\.xml/body/\*\[1238\]

```text
Reports, Dashboards, Alerts
```

<a id="b01239"></a>
## b01239 — word/document\.xml/body/\*\[1239\]

```text
Name	Description	Frequency	User/Dept	Type
ASN Receiving Report	Lists all ASN details and quantity, as well as providing scannable barcodes for ASN and Items	As needed before receiving ASN (especially for item level ASNs)	Receiving	WM Report
ASN Status Report	Lists all ASNs expected to arrive at the DC for a given day and current statuses of ASNs	As needed to support receiving and ASN Verification	Receiving	SCI Report/Dashboard
Return ASN Receiving Report	Lists all Return ASN details and quantity, as well as providing scannable barcodes for ASN and Items	As needed before receiving Return ASN	Returns Receiving	SCI Report
Returns by Business	Classifies Returns by the origin of the return: Core, Kohls, Amazon, etc.	As needed	Returns Receiving	SCI Report
```

<a id="b01240"></a>
## b01240 — word/document\.xml/body/\*\[1240\]

```text

```

<a id="b01241"></a>
## b01241 — word/document\.xml/body/\*\[1241\]

```text
Gaps and Extensions
```

<a id="b01242"></a>
## b01242 — word/document\.xml/body/\*\[1242\]

```text
Gap #	Name	Description
WM01	iLPN Label Payload Trigger Post LPN Disposition	Lands’ End requires a second iLPN label to be printed and applied to inbound cartons containing visual information regarding the destination type to users. This destination determination occurs post LPN Disposition where there is no base MAWM print trigger.
In addition, MAWM is required to send this iLPN Label Payload as an event to the MHE system to be printed and applied via MHE receiving.
Label Formatting that is not performed by the LE team is covered as part of the gap. 
GAP17	Default Inventory Attributes during Receiving	Lands’ End must track inventory attributes on inventory at the time of receiving to segregate inventory in the warehouse that has been returned with a hemmed pant or logoed item. This gap is required to allow LE to default the inventory type and inventory attributes on the receiving strategy, so users are not prompted to enter this information when it is not necessary. 
In addition, Lands’ End cannot designate the inventory type for receipts at the item or line level, MAWM just derive the inventory type value from the ASN/PO Header and apply this value as the inventory type to all receipts
WM23	In-house Production Order ASN	After the good issue of an in-house production order is generated in MAWM, MAWM will generate an ASN to be used for receiving the finished goods once the VAS process is completed in SAP.
```

<a id="b01243"></a>
## b01243 — word/document\.xml/body/\*\[1243\]

```text

```

<a id="b01244"></a>
## b01244 — word/document\.xml/body/\*\[1244\]

```text
Labor Management
```

<a id="b01245"></a>
## b01245 — word/document\.xml/body/\*\[1245\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01246"></a>
## b01246 — word/document\.xml/body/\*\[1246\]

```text
Key Interfaces
```

<a id="b01247"></a>
## b01247 — word/document\.xml/body/\*\[1247\]

```text
Interface	Business Scenario
ASN (Item Level)	Inform distribution center of shipment contents prior to arrival. 
ASN Verification	Inform host that the ASN has been fully received and should be closed to prevent future receipt against the same ASN.
PIX	Inform host of received inventory or change of inventory status
```

<a id="b01248"></a>
## b01248 — word/document\.xml/body/\*\[1248\]

```text
Reports, Dashboards, Alerts
```

<a id="b01249"></a>
## b01249 — word/document\.xml/body/\*\[1249\]

```text
Name	Description	Frequency	User/Dept	Type
Return ASN Receiving Report	Lists all Return ASN details and quantity, as well as providing scannable barcodes for ASN and Items	As needed before receiving Return ASN 	Returns Receiving	SCI Report
Returns by Business Line (Extended Attribute)	Classifies Returns by the origin of the return: Core, Kohls, Amazon, etc.	As needed	Returns Receiving	SCI Report
```

<a id="b01250"></a>
## b01250 — word/document\.xml/body/\*\[1250\]

```text

```

<a id="b01251"></a>
## b01251 — word/document\.xml/body/\*\[1251\]

```text
Gaps and Extensions
```

<a id="b01252"></a>
## b01252 — word/document\.xml/body/\*\[1252\]

```text
Gap #	Name	Description
		
```

<a id="b01253"></a>
## b01253 — word/document\.xml/body/\*\[1253\]

```text
Labor Management
```

<a id="b01254"></a>
## b01254 — word/document\.xml/body/\*\[1254\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01255"></a>
## b01255 — word/document\.xml/body/\*\[1255\]

```text


```

<a id="b01256"></a>
## b01256 — word/document\.xml/body/\*\[1256\]

```text
Post-Receiving
```

<a id="b01257"></a>
## b01257 — word/document\.xml/body/\*\[1257\]

```text
Strategy
```

<a id="b01258"></a>
## b01258 — word/document\.xml/body/\*\[1258\]

```text
As ASNs are received and empty trailers leave the dock doors, Lands’ End monitors the ASNs currently in receipt with an ASN Status SCI report. This report is created to display all ASNs that are expected to arrive at the Dodgeville DC for the day, the status of ASNs which already arrived, and the status of ASNs which receiving has been complete against. This report, along with assistance from the operations team, is used to determine when all contents for a given ASN have been processed. Once all inventory or iLPNs have been received for an ASN, the ASN must be verified to close out the receipt in MAWM. This process is initiated via the MAWM UI by users navigating to the ASNs UI and selecting the ASN which is to be verified. Returns receipts may be configured to automatically perform ASN verification during the receiving process [WM06]. 
```

<a id="b01259"></a>
## b01259 — word/document\.xml/body/\*\[1259\]

```text
Once the verification action is taken against the specific ASN, MAWM displays a ‘Variance Report’ where users can see if there was a receiving variance on the ASN. This includes inventory that was expected to be received but was not received as well as any overage that was received and was not expected. If there is a variance, users may print a variance report which details the variances and researches the variance before accepting the verification of the ASN. If there is no variance displayed by MAWM, then the receipt was as expected, and users submit the ASN Verification.
```

<a id="b01260"></a>
## b01260 — word/document\.xml/body/\*\[1260\]

```text
As ASNs are verified in MAWM, a ASN Verification PIX is generated and sent to the host system with detailed information about all the inventory that was received into MAWM. The host system uses this PIX to increase inventory in the appropriate buckets. The ASN Verification is a crucial step in the Lands’ End receiving processes as real time receipt PIXs for individual iLPNs are not sent to the host system, therefor until the ASN Verification process is complete, the host system does not have visibility to what has been received into the Dodgeville DC. 
```

<a id="b01261"></a>
## b01261 — word/document\.xml/body/\*\[1261\]

```text
Assumptions
```

<a id="b01262"></a>
## b01262 — word/document\.xml/body/\*\[1262\]

```text
ASNs are verified individually and manually, there is no ability to verify multiple ASNs at once or through a scheduled job.
```

<a id="b01263"></a>
## b01263 — word/document\.xml/body/\*\[1263\]

```text
All ASNs must be verified.
```

<a id="b01264"></a>
## b01264 — word/document\.xml/body/\*\[1264\]

```text

```

<a id="b01265"></a>
## b01265 — word/document\.xml/body/\*\[1265\]

```text
User Stories 
```

<a id="b01266"></a>
## b01266 — word/document\.xml/body/\*\[1266\]

```text
User Story: Verify ASN in UI
```

<a id="b01267"></a>
## b01267 — word/document\.xml/body/\*\[1267\]

```text
Who	What	Why
Receiving Supervisor	Confirm variances and verify ASN	Close the ASN, inform the host that receiving is complete, and book inventory financially to trigger invoicing.
```

<a id="b01268"></a>
## b01268 — word/document\.xml/body/\*\[1268\]

```text

```

<a id="b01269"></a>
## b01269 — word/document\.xml/body/\*\[1269\]

```text
Verify ASN is the process of confirming that what has been received is correct and final. ASN Verification will communicate finalized receipts to the Host. Post ASN Verification, all inventory updates are considered “warehouse adjustments” and are sent to the Host as inventory adjustment PIXes.
```

<a id="b01270"></a>
## b01270 — word/document\.xml/body/\*\[1270\]

```text

```

<a id="b01271"></a>
## b01271 — word/document\.xml/body/\*\[1271\]

```text
Process
```

<a id="b01272"></a>
## b01272 — word/document\.xml/body/\*\[1272\]

```text
User searches for ASN in ASNs UI
```

<a id="b01273"></a>
## b01273 — word/document\.xml/body/\*\[1273\]

```text
User selects the ASN and clicks ‘Verify ASN.’
```

<a id="b01274"></a>
## b01274 — word/document\.xml/body/\*\[1274\]

```text
WM displays the variance screen with the item, quantity expected, and quantity received to provide visibility of any variances.
```

<a id="b01275"></a>
## b01275 — word/document\.xml/body/\*\[1275\]

```text
User confirms by selecting ‘Verify ASN.’
```

<a id="b01276"></a>
## b01276 — word/document\.xml/body/\*\[1276\]

```text
Updates
```

<a id="b01277"></a>
## b01277 — word/document\.xml/body/\*\[1277\]

```text
ASN updated to ‘ASN Verified’ status.
```

<a id="b01278"></a>
## b01278 — word/document\.xml/body/\*\[1278\]

```text
Verification PIX triggered and sent to host system. 
```

<a id="b01279"></a>
## b01279 — word/document\.xml/body/\*\[1279\]

```text
ASN removed from current Dock Door 
```

<a id="b01280"></a>
## b01280 — word/document\.xml/body/\*\[1280\]

```text

```

<a id="b01281"></a>
## b01281 — word/document\.xml/body/\*\[1281\]

```text
Key Interfaces
```

<a id="b01282"></a>
## b01282 — word/document\.xml/body/\*\[1282\]

```text
Interface	Business Scenario
ASN Verification	Inform host that the ASN has been fully received and should be closed to prevent future receipt against the same ASN.
PIX	Inform host of received inventory or change of inventory status
```

<a id="b01283"></a>
## b01283 — word/document\.xml/body/\*\[1283\]

```text

```

<a id="b01284"></a>
## b01284 — word/document\.xml/body/\*\[1284\]

```text
Reports, Dashboards, Alerts
```

<a id="b01285"></a>
## b01285 — word/document\.xml/body/\*\[1285\]

```text
Name	Description	Frequency	User/Dept	Type
ASN Variance Report	Details of ASN and the variance (unreceived vs. expected LPNs/ items/ quantities)	As needed, before or during ASN Verification	Receiving	WM Report 
ASNs Received not Verified 	Displays all ASNs which have been received but not yet verified and the age of the ASN	As needed	Receiving	SCI Report
```

<a id="b01286"></a>
## b01286 — word/document\.xml/body/\*\[1286\]

```text
Gaps and Extensions
```

<a id="b01287"></a>
## b01287 — word/document\.xml/body/\*\[1287\]

```text
GAP#	Name	Why	Description
WM06	Auto Verify ASN	Close and purge received ASNs	Automatically verify return ASNs after receiving has started, based on configured elapsed days and conditions.
```

<a id="b01288"></a>
## b01288 — word/document\.xml/body/\*\[1288\]

```text
Labor Management
```

<a id="b01289"></a>
## b01289 — word/document\.xml/body/\*\[1289\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01290"></a>
## b01290 — word/document\.xml/body/\*\[1290\]

```text
Sorting
```

<a id="b01291"></a>
## b01291 — word/document\.xml/body/\*\[1291\]

```text
 Strategy
```

<a id="b01292"></a>
## b01292 — word/document\.xml/body/\*\[1292\]

```text

```

<a id="b01293"></a>
## b01293 — word/document\.xml/body/\*\[1293\]

```text
Once iLPNs arrive at the sortation area, either through MHE receipts or WM Mobile transactions, they are sorted to a specific pallet or location based on their predetermined disposition or destination.
```

<a id="b01294"></a>
## b01294 — word/document\.xml/body/\*\[1294\]

```text
MHE Received iLPNs
```

<a id="b01295"></a>
## b01295 — word/document\.xml/body/\*\[1295\]

```text
Sort iLPN Transaction: A standalone WM Mobile Sort iLPN & Palletize transaction is used to scan iLPNs off the receiving belt.
```

<a id="b01296"></a>
## b01296 — word/document\.xml/body/\*\[1296\]

```text
Location and Pallet Assignment: Users are directed to a location to palletize the LPN y putaway zone.
```

<a id="b01297"></a>
## b01297 — word/document\.xml/body/\*\[1297\]

```text
WM Mobile Received iLPNs
```

<a id="b01298"></a>
## b01298 — word/document\.xml/body/\*\[1298\]

```text
Receive and Sortation: The sortation process can be initiated directly after the LPN is received if the LPN Disposition of the receiving transaction is configured to perform sorting.
```

<a id="b01299"></a>
## b01299 — word/document\.xml/body/\*\[1299\]

```text
Staged Sortation: Alternatively, iLPNs can be staged and sorted later using a WM Mobile Sort iLPN & Palletize transaction.
```

<a id="b01300"></a>
## b01300 — word/document\.xml/body/\*\[1300\]

```text
Sorting Criteria iLPNs are sorted to pallets based on their allocated destination building, location, and zone. Common destinations include Active, Reserve, Prepping, Packing, and Cross Dock. Once a pallet is full, users end it and start a new one.
```

<a id="b01301"></a>
## b01301 — word/document\.xml/body/\*\[1301\]

```text
Putaway Task Creation: As pallets are completed during the sortation process, MAWM creates a Putaway task for each pallet. Warehouse associates can then pick up these pallets and begin a system directed putaway process.
```

<a id="b01302"></a>
## b01302 — word/document\.xml/body/\*\[1302\]

```text
Exceptions
```

<a id="b01303"></a>
## b01303 — word/document\.xml/body/\*\[1303\]

```text
Cubiscan: iLPNs marked for Cubiscan are not systematically sorted. They are identified and manually moved to the Cubiscan station for processing.
```

<a id="b01304"></a>
## b01304 — word/document\.xml/body/\*\[1304\]

```text
MHE Receiving Issues: iLPNs with issues during MHE receiving and labeled by Matthews are also handled manually and not systematically sorted.
```

<a id="b01305"></a>
## b01305 — word/document\.xml/body/\*\[1305\]

```text
User Stories
```

<a id="b01306"></a>
## b01306 — word/document\.xml/body/\*\[1306\]

```text
User Story: Sort iLPN & Palletize.
```

<a id="b01307"></a>
## b01307 — word/document\.xml/body/\*\[1307\]

```text
Who	What	Why
Receiving or Sorting Associate	Sort iLPNs to a Pallet for putaway after Receipt	Sort iLPNs onto individual pallets based on destination determined by LPN Disposition
```

<a id="b01308"></a>
## b01308 — word/document\.xml/body/\*\[1308\]

```text

```

<a id="b01309"></a>
## b01309 — word/document\.xml/body/\*\[1309\]

```text
Process
```

<a id="b01310"></a>
## b01310 — word/document\.xml/body/\*\[1310\]

```text
iLPN is scanned by Sort User at the end of the Receiving Conveyor
```

<a id="b01311"></a>
## b01311 — word/document\.xml/body/\*\[1311\]

```text
If WM Mobile was used to receive the iLPN, users are taken directly into the Sort transaction.
```

<a id="b01312"></a>
## b01312 — word/document\.xml/body/\*\[1312\]

```text
WM displays the destination sort location for the iLPN and prompts the user to scan a pallet.
```

<a id="b01313"></a>
## b01313 — word/document\.xml/body/\*\[1313\]

```text
User scans the pallet in the sort location to associate the iLPN to the pallet.
```

<a id="b01314"></a>
## b01314 — word/document\.xml/body/\*\[1314\]

```text
If the pallet is full, the User Ends the pallet and starts a new pallet in the Sort Location
```

<a id="b01315"></a>
## b01315 — word/document\.xml/body/\*\[1315\]

```text
Updates
```

<a id="b01316"></a>
## b01316 — word/document\.xml/body/\*\[1316\]

```text
iLPN is associated with the pallet scanned.
```

<a id="b01317"></a>
## b01317 — word/document\.xml/body/\*\[1317\]

```text
iLPN is staged in the sort location.
```

<a id="b01318"></a>
## b01318 — word/document\.xml/body/\*\[1318\]

```text
Putaway Tasks for iLPNs start when user scans pallet ID and completes task as directed.
```

<a id="b01319"></a>
## b01319 — word/document\.xml/body/\*\[1319\]

```text
User Story: End Container
```

<a id="b01320"></a>
## b01320 — word/document\.xml/body/\*\[1320\]

```text
Who	What	Why
Receiving Associate	End the sorting process of a pallet in the sorting area.	Initiates putaway task creation
```

<a id="b01321"></a>
## b01321 — word/document\.xml/body/\*\[1321\]

```text

```

<a id="b01322"></a>
## b01322 — word/document\.xml/body/\*\[1322\]

```text
Process
```

<a id="b01323"></a>
## b01323 — word/document\.xml/body/\*\[1323\]

```text
User selects End Container option in Mobile Menu.
```

<a id="b01324"></a>
## b01324 — word/document\.xml/body/\*\[1324\]

```text
WM prompts user to scan container.
```

<a id="b01325"></a>
## b01325 — word/document\.xml/body/\*\[1325\]

```text

```

<a id="b01326"></a>
## b01326 — word/document\.xml/body/\*\[1326\]

```text
Updates
```

<a id="b01327"></a>
## b01327 — word/document\.xml/body/\*\[1327\]

```text
Pallet is closed.
```

<a id="b01328"></a>
## b01328 — word/document\.xml/body/\*\[1328\]

```text
Putaway task is generated.
```

<a id="b01329"></a>
## b01329 — word/document\.xml/body/\*\[1329\]

```text
Reports, Dashboards, Alerts
```

<a id="b01330"></a>
## b01330 — word/document\.xml/body/\*\[1330\]

```text
Name	Description	Frequency	User/Dept	Type
				
```

<a id="b01331"></a>
## b01331 — word/document\.xml/body/\*\[1331\]

```text
Gaps and Extensions
```

<a id="b01332"></a>
## b01332 — word/document\.xml/body/\*\[1332\]

```text
GAP#	Name	Why	Description
			
```

<a id="b01333"></a>
## b01333 — word/document\.xml/body/\*\[1333\]

```text

```

<a id="b01334"></a>
## b01334 — word/document\.xml/body/\*\[1334\]

```text
Labor Management
```

<a id="b01335"></a>
## b01335 — word/document\.xml/body/\*\[1335\]

```text

```

<a id="b01336"></a>
## b01336 — word/document\.xml/body/\*\[1336\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01337"></a>
## b01337 — word/document\.xml/body/\*\[1337\]

```text
Vendor Performance
```

<a id="b01338"></a>
## b01338 — word/document\.xml/body/\*\[1338\]

```text
Strategy
```

<a id="b01339"></a>
## b01339 — word/document\.xml/body/\*\[1339\]

```text
Lands’ End uses the Vendor Performance functionality in MAWM to capture any issues or comments with received inventory against Vendors. This information is used to score Vendors based on the quality of the material sent into the warehouse so any necessary actions may be takes to resolve the issues. This Vendor Performance process is separate from the Quality Audit process, which is performed in a separate system outside of MAWM. 
```

<a id="b01340"></a>
## b01340 — word/document\.xml/body/\*\[1340\]

```text
To initiate this process, in the Quality Audit area users enter a Vendor Performance transaction in the WM Mobile device. This is a stand-alone transaction that allows Lands’ End to enter the objects that are to be reported against, ASN/PO/iLPN, for various reasons. For example, if all of the inventory for a specific ASN/PO have an issue such as missing labels or incorrect items, Lands’ End would want to scan the ASN or PO and select a Vendor Performance Code that describes the overall issue. If there are single iLPNs with issues, not across the entire PO or ASN, Lands’ End may scan a single iLPN to report the issue. 
```

<a id="b01341"></a>
## b01341 — word/document\.xml/body/\*\[1341\]

```text
The Vendor Performance selections are recorded in the MAWM UI and can be used to generate reports for vendors that have repeat offenses to grade the vendor. This grading helps the Lands’ End team determine the number of iLPNs that are required to be sent to the Quality Audit area for future receipts and if any back charges are necessary from the vendors. Multiple Vendor Performance selections can be made against the same entity if necessary. Once all Vendor Performance selections are made, Lands’ End continues with the secondary quality audit process for the true material quality.
```

<a id="b01342"></a>
## b01342 — word/document\.xml/body/\*\[1342\]

```text
Assumptions
```

<a id="b01343"></a>
## b01343 — word/document\.xml/body/\*\[1343\]

```text
Vendor Rating is maintained in SAP by facility.
```

<a id="b01344"></a>
## b01344 — word/document\.xml/body/\*\[1344\]

```text
A vendor rating group is sent from SAP to MAWM as an extended attribute in the ASN Detail for Item Level ASN or with the ASN LPN for LPN level ASN. This attribute is used in MAWM to perform inbound quality rules.
```

<a id="b01345"></a>
## b01345 — word/document\.xml/body/\*\[1345\]

```text

```

<a id="b01346"></a>
## b01346 — word/document\.xml/body/\*\[1346\]

```text
User Stories
```

<a id="b01347"></a>
## b01347 — word/document\.xml/body/\*\[1347\]

```text
User Story: Vendor Performance
```

<a id="b01348"></a>
## b01348 — word/document\.xml/body/\*\[1348\]

```text
Who	What	Why
Receiving or QA Associate	Report issues with Received Inventory	Lands’ End keeps records of issues with ASNs or LPNs against certain vendors
```

<a id="b01349"></a>
## b01349 — word/document\.xml/body/\*\[1349\]

```text

```

<a id="b01350"></a>
## b01350 — word/document\.xml/body/\*\[1350\]

```text
Process
```

<a id="b01351"></a>
## b01351 — word/document\.xml/body/\*\[1351\]

```text
User enters the Vendor Performance Transaction in WM Mobile device.
```

<a id="b01352"></a>
## b01352 — word/document\.xml/body/\*\[1352\]

```text
Vendor Performance may also be initiated in-line during receiving.
```

<a id="b01353"></a>
## b01353 — word/document\.xml/body/\*\[1353\]

```text
WM prompts the user to Scan ASN
```

<a id="b01354"></a>
## b01354 — word/document\.xml/body/\*\[1354\]

```text
Not required when called in-line during receiving.
```

<a id="b01355"></a>
## b01355 — word/document\.xml/body/\*\[1355\]

```text
User scans ASN if required.
```

<a id="b01356"></a>
## b01356 — word/document\.xml/body/\*\[1356\]

```text
WM prompts user to select Vendor Performance Code
```

<a id="b01357"></a>
## b01357 — word/document\.xml/body/\*\[1357\]

```text
User selects appropriate Vendor Performance code.
```

<a id="b01358"></a>
## b01358 — word/document\.xml/body/\*\[1358\]

```text
User enters any additional comments for the Vendor Performance 
```

<a id="b01359"></a>
## b01359 — word/document\.xml/body/\*\[1359\]

```text
Updates
```

<a id="b01360"></a>
## b01360 — word/document\.xml/body/\*\[1360\]

```text
Vendor Performance Transaction recorded.
```

<a id="b01361"></a>
## b01361 — word/document\.xml/body/\*\[1361\]

```text
Condition Code applied to inventory if applicable.
```

<a id="b01362"></a>
## b01362 — word/document\.xml/body/\*\[1362\]

```text
Reports, Dashboards, Alerts
```

<a id="b01363"></a>
## b01363 — word/document\.xml/body/\*\[1363\]

```text
Name	Description	Frequency	User/Dept	Type
Vendor Performance by Factory	Displays all Vendor Performance transactions recorded against ASNs and displays a breakdown by Facility	As needed to support QA	Receiving/QA	SCI Report
```

<a id="b01364"></a>
## b01364 — word/document\.xml/body/\*\[1364\]

```text

```

<a id="b01365"></a>
## b01365 — word/document\.xml/body/\*\[1365\]

```text
Gaps and Extensions
```

<a id="b01366"></a>
## b01366 — word/document\.xml/body/\*\[1366\]

```text
GAP#	Name	Why	Description
			
```

<a id="b01367"></a>
## b01367 — word/document\.xml/body/\*\[1367\]

```text

```

<a id="b01368"></a>
## b01368 — word/document\.xml/body/\*\[1368\]

```text
Labor Management
```

<a id="b01369"></a>
## b01369 — word/document\.xml/body/\*\[1369\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01370"></a>
## b01370 — word/document\.xml/body/\*\[1370\]

```text
Putaway 
```

<a id="b01371"></a>
## b01371 — word/document\.xml/body/\*\[1371\]

```text
Strategy
```

<a id="b01372"></a>
## b01372 — word/document\.xml/body/\*\[1372\]

```text

```

<a id="b01373"></a>
## b01373 — word/document\.xml/body/\*\[1373\]

```text
Putaway is the process of locating and storing received inventory in designated warehouse locations. Lands' End employs a Putaway Planning Strategy defined in MAWM to optimize the putaway process based on business rules.
```

<a id="b01374"></a>
## b01374 — word/document\.xml/body/\*\[1374\]

```text
Putaway Planning Strategy 
```

<a id="b01375"></a>
## b01375 — word/document\.xml/body/\*\[1375\]

```text
A putaway planning strategy criteria is defined for the putaway planning strategy, the criteria evaluates item and inventory attributes like Item Category, inventory type, inventory attributes etc.  Once the selection criteria matches with the evaluated LPN, the putaway planning evaluates the putaway determination priorities in the following sequence. When a pallet with nested LPN is scanned, the putaway planning mode is configured to scan either a pallet or an iLPN on the pallet to plan the putaway for each LPN on a pallet. 
```

<a id="b01376"></a>
## b01376 — word/document\.xml/body/\*\[1376\]

```text
Active Locations - MAWM first evaluates whether the iLPN can be placed in an active location, considering the maximum capacity of the location. If available, the iLPN is directed to an active location for immediate use.
```

<a id="b01377"></a>
## b01377 — word/document\.xml/body/\*\[1377\]

```text
Suggested Putaway Zone - If no suitable active locations are found the iLPN is assigned to a reserve zone that is assigned for the selected criteria. Example: Building 2 High Bay Room 1,  Building 2 High Bay Room 2, Building 2 High Bay Room 3 etc.
```

<a id="b01378"></a>
## b01378 — word/document\.xml/body/\*\[1378\]

```text
Zone Base  – MAWM evaluates locations based on putaway allocation zone priorities. (To be implemented once the location dimensions and putaway type/size are updated).
```

<a id="b01379"></a>
## b01379 — word/document\.xml/body/\*\[1379\]

```text
Note: Currently, the Suggested/Vicinity putaway process does not account for location capacity. Lands' End relies on an SCI report to monitor zone capacity and adjust zone priorities within the putaway criteria as necessary. In the future, a system-directed putaway process will be implemented. This system will determine the optimal putaway location based on factors such as location capacity, LPN type, and size, once the system's information is accurate. To accommodate equipment requirements for specific reserve zones, Task Path restrictions will be used to direct pallets to designated drop locations. Once the system-directed putaway is in place, the Suggested Putaway Zone determination criteria should be deactivated.
```

<a id="b01380"></a>
## b01380 — word/document\.xml/body/\*\[1380\]

```text
Putaway Task Creation Strategy 
```

<a id="b01381"></a>
## b01381 — word/document\.xml/body/\*\[1381\]

```text
After putaway planning, the putaway process generates a Putaway Task. A specific Transaction ID is configured appropriate to process. The following Putaway Task Types (Transaction IDs) are identified for Dodgeville operations: 
```

<a id="b01382"></a>
## b01382 — word/document\.xml/body/\*\[1382\]

```text
Pallet Putaway  - System Directed Putaway to move the pallet from staging locations to a building putaway zone for final putaway (Suggested Putaway) .
```

<a id="b01383"></a>
## b01383 — word/document\.xml/body/\*\[1383\]

```text
LPN Putaway – User directed putaway execution. The transaction will be changed to a system directed execution once the location dimensions and LPN type size are defined.
```

<a id="b01384"></a>
## b01384 — word/document\.xml/body/\*\[1384\]

```text
Putaway Cart - Fill Active – System directed LPN putaway to an active pick location by putaway cart execution.
```

<a id="b01385"></a>
## b01385 — word/document\.xml/body/\*\[1385\]

```text
Fill Active – System directed LPN putaway to an active pick location.
```

<a id="b01386"></a>
## b01386 — word/document\.xml/body/\*\[1386\]

```text

```

<a id="b01387"></a>
## b01387 — word/document\.xml/body/\*\[1387\]

```text
Putaway Execution Flow
```

<a id="b01388"></a>
## b01388 — word/document\.xml/body/\*\[1388\]

```text
The putaway execution process is initiated by users logging into the WM Mobile device and into their eligible Task Group for putaway. A forklift users navigates to the WM Mobile Assign Task menu option, and MAWM will assign the next task available for his Task Group. MAWM will direct the user to travel to the source location of the LPN to confirm the pallet or LPN id displayed by MAWM to begin the putaway process. Alternatively the user can initiate a system directed putaway by using WM Mobile System Directed Putaway mobile option. The process will check if the scanned LPN is already allocated for putaway and will assign the task to the user, or it will evaluate the Putaway Planning Strategy to determine the location where  the LPN or LPNs needs to go based on the configured business rules in the Putaway planning strategy.  Lastly the user can use a User Directed putaway to move the LPN to a specific location as needed. 
```

<a id="b01389"></a>
## b01389 — word/document\.xml/body/\*\[1389\]

```text

```

<a id="b01390"></a>
## b01390 — word/document\.xml/body/\*\[1390\]

```text
Putaway to Active Location:
```

<a id="b01391"></a>
## b01391 — word/document\.xml/body/\*\[1391\]

```text
MHE-Allocated LPNs: These LPNs are directly diverted to the replenishment induction belt and dropped into the pick module.
```

<a id="b01392"></a>
## b01392 — word/document\.xml/body/\*\[1392\]

```text
Flow Rack Pick Locations: Associates scan the LPN from the replenishment belt to the flow rack location using the Fill Active Mobile transaction.
```

<a id="b01393"></a>
## b01393 — word/document\.xml/body/\*\[1393\]

```text
Other Active Pick Locations: Associates use the WM Mobile Make Putaway Cart transaction to build a putaway cart and perform multiple LPN putaway.
```

<a id="b01394"></a>
## b01394 — word/document\.xml/body/\*\[1394\]

```text
Putaway to Reserve Location:
```

<a id="b01395"></a>
## b01395 — word/document\.xml/body/\*\[1395\]

```text
For each LPN on a pallet, the associate performs a putaway to a reserve location. Once all LPNs on the pallet are putaway, the pallet is consumed.
```

<a id="b01396"></a>
## b01396 — word/document\.xml/body/\*\[1396\]

```text
Assumptions
```

<a id="b01397"></a>
## b01397 — word/document\.xml/body/\*\[1397\]

```text
iLPNs are not split during the putaway to active processes. Lands’ End does not put or replenish partial iLPNs to pick locations due to physical restraints.
```

<a id="b01398"></a>
## b01398 — word/document\.xml/body/\*\[1398\]

```text
Partial iLPNs do not go back to reserve from the active area. 
```

<a id="b01399"></a>
## b01399 — word/document\.xml/body/\*\[1399\]

```text
Puts to active and replenishments to active are always full iLPNs.
```

<a id="b01400"></a>
## b01400 — word/document\.xml/body/\*\[1400\]

```text
Maximum capacities in active locations are driven by a percentage of 75% fluid inventory that will fit in location. 
```

<a id="b01401"></a>
## b01401 — word/document\.xml/body/\*\[1401\]

```text
Unit Storage Locations (Active) are mostly single SKU locations. 
```

<a id="b01402"></a>
## b01402 — word/document\.xml/body/\*\[1402\]

```text
Multi SKU Unit Storage Locations are only used for Random Returns and follow User Directed Putaway
```

<a id="b01403"></a>
## b01403 — word/document\.xml/body/\*\[1403\]

```text
WM does not prevent aisle congestion during putaway. Intermediate drop locations can be used to aid with aisle congestion.
```

<a id="b01404"></a>
## b01404 — word/document\.xml/body/\*\[1404\]

```text
The Pending Putaway (PA) lock code is removed when the iLPN is putaway to the final destination location.
```

<a id="b01405"></a>
## b01405 — word/document\.xml/body/\*\[1405\]

```text
A SKU typically has a single permanent pick location. However, a dynamic location can be assigned during putaway for high volume items. The number of dynamic locations Lands’ End plans to use for items is ‘3’.
```

<a id="b01406"></a>
## b01406 — word/document\.xml/body/\*\[1406\]

```text
Vicinity Based Location Determination (suggested putaway zone) is used to determine reserve locations. Lands’ End can change the determination method once the LPN/Size type is provided by the vendors and all locations have been updated.
```

<a id="b01407"></a>
## b01407 — word/document\.xml/body/\*\[1407\]

```text
User Stories
```

<a id="b01408"></a>
## b01408 — word/document\.xml/body/\*\[1408\]

```text
User Story: Pallet Putaway (Suggest Putaway /Tasking Mode) 
```

<a id="b01409"></a>
## b01409 — word/document\.xml/body/\*\[1409\]

```text

```

<a id="b01410"></a>
## b01410 — word/document\.xml/body/\*\[1410\]

```text
Who	What	Why
Putaway Associate	Suggest Putaway to Reserve in Tasking Mode for Vendor Receiving.	To move a pallet from staging to a drop location closer to the reserve location assigned to the LPNS.
```

<a id="b01411"></a>
## b01411 — word/document\.xml/body/\*\[1411\]

```text

```

<a id="b01412"></a>
## b01412 — word/document\.xml/body/\*\[1412\]

```text
Process
```

<a id="b01413"></a>
## b01413 — word/document\.xml/body/\*\[1413\]

```text
User enters Putaway Task Group in WM Mobile Device
```

<a id="b01414"></a>
## b01414 — word/document\.xml/body/\*\[1414\]

```text
User requests work in WM Mobile for available tasks eligible for the Putaway task group
```

<a id="b01415"></a>
## b01415 — word/document\.xml/body/\*\[1415\]

```text
WM assigns the user an available putaway task and displays the location and pallet to pick up.
```

<a id="b01416"></a>
## b01416 — word/document\.xml/body/\*\[1416\]

```text
User travels to location and confirms Pallet to initiate putaway for the iLPNs on the pallet.
```

<a id="b01417"></a>
## b01417 — word/document\.xml/body/\*\[1417\]

```text
WM initiates the putaway task for the pallet.
```

<a id="b01418"></a>
## b01418 — word/document\.xml/body/\*\[1418\]

```text
User is suggested with an area/zone/aisle/bay to the operator locate the LPN to a location around its vicinity.
```

<a id="b01419"></a>
## b01419 — word/document\.xml/body/\*\[1419\]

```text
User scans a location on the suggested zone.
```

<a id="b01420"></a>
## b01420 — word/document\.xml/body/\*\[1420\]

```text
User is prompted for the iLPN that needs to be putaway.
```

<a id="b01421"></a>
## b01421 — word/document\.xml/body/\*\[1421\]

```text
User scans the iLPN to confirm.
```

<a id="b01422"></a>
## b01422 — word/document\.xml/body/\*\[1422\]

```text
Process is repeated for all iLPNs on the pallet.
```

<a id="b01423"></a>
## b01423 — word/document\.xml/body/\*\[1423\]

```text
Updates
```

<a id="b01424"></a>
## b01424 — word/document\.xml/body/\*\[1424\]

```text
iLPN current location is updated to the scanned location.
```

<a id="b01425"></a>
## b01425 — word/document\.xml/body/\*\[1425\]

```text
Location inventory is updated.
```

<a id="b01426"></a>
## b01426 — word/document\.xml/body/\*\[1426\]

```text
If a condition code is removed, relevant PIXs are communicated to the host.
```

<a id="b01427"></a>
## b01427 — word/document\.xml/body/\*\[1427\]

```text
A labor record(s) is written to credit the putaway. 
```

<a id="b01428"></a>
## b01428 — word/document\.xml/body/\*\[1428\]

```text
Putaway task is completed.
```

<a id="b01429"></a>
## b01429 — word/document\.xml/body/\*\[1429\]

```text

```

<a id="b01430"></a>
## b01430 — word/document\.xml/body/\*\[1430\]

```text
User Story: LPN Putaway (User Directed) 
```

<a id="b01431"></a>
## b01431 — word/document\.xml/body/\*\[1431\]

```text
Who	What	Why
Putaway Associate	Putaway LPN into a Reserve Location	User manually determines where an iLPN should be located.
```

<a id="b01432"></a>
## b01432 — word/document\.xml/body/\*\[1432\]

```text

```

<a id="b01433"></a>
## b01433 — word/document\.xml/body/\*\[1433\]

```text
Process
```

<a id="b01434"></a>
## b01434 — word/document\.xml/body/\*\[1434\]

```text
User navigates to the LPN Putaway Transaction
```

<a id="b01435"></a>
## b01435 — word/document\.xml/body/\*\[1435\]

```text
User scans an iLPN
```

<a id="b01436"></a>
## b01436 — word/document\.xml/body/\*\[1436\]

```text
WM prompts user to scan a location
```

<a id="b01437"></a>
## b01437 — word/document\.xml/body/\*\[1437\]

```text
User scans the location barcode to confirm the putaway
```

<a id="b01438"></a>
## b01438 — word/document\.xml/body/\*\[1438\]

```text
If there more LPNs to be putaway the user repeats the steps 1 – 4 until putaway all LPN form the pallet.
```

<a id="b01439"></a>
## b01439 — word/document\.xml/body/\*\[1439\]

```text
Updates
```

<a id="b01440"></a>
## b01440 — word/document\.xml/body/\*\[1440\]

```text
Current location is updated to the scanned location for the LPN
```

<a id="b01441"></a>
## b01441 — word/document\.xml/body/\*\[1441\]

```text
Location inventory is updated.
```

<a id="b01442"></a>
## b01442 — word/document\.xml/body/\*\[1442\]

```text
Pending Putaway condition code removed from iLPN.
```

<a id="b01443"></a>
## b01443 — word/document\.xml/body/\*\[1443\]

```text
PIX inventory adjustment sent to host.
```

<a id="b01444"></a>
## b01444 — word/document\.xml/body/\*\[1444\]

```text

```

<a id="b01445"></a>
## b01445 — word/document\.xml/body/\*\[1445\]

```text
User Story: Pallet Putaway to Replenishment Belt
```

<a id="b01446"></a>
## b01446 — word/document\.xml/body/\*\[1446\]

```text
Who	What	Why
Putaway Associate	Pallet Putaway to Replenishment Belt	To induct pallet LPN to a replenishment conveyor belt.
```

<a id="b01447"></a>
## b01447 — word/document\.xml/body/\*\[1447\]

```text

```

<a id="b01448"></a>
## b01448 — word/document\.xml/body/\*\[1448\]

```text
Process
```

<a id="b01449"></a>
## b01449 — word/document\.xml/body/\*\[1449\]

```text
User enters Putaway Task Group in WM Mobile Device
```

<a id="b01450"></a>
## b01450 — word/document\.xml/body/\*\[1450\]

```text
User requests work in WM Mobile for available tasks eligible for the Putaway task group
```

<a id="b01451"></a>
## b01451 — word/document\.xml/body/\*\[1451\]

```text
WM assigns the user an available putaway task and displays the location and pallet to pick up
```

<a id="b01452"></a>
## b01452 — word/document\.xml/body/\*\[1452\]

```text
User confirms the pallet to initiate putaway for the iLPNs on the pallet
```

<a id="b01453"></a>
## b01453 — word/document\.xml/body/\*\[1453\]

```text
WM initiates the putaway task for the pallet
```

<a id="b01454"></a>
## b01454 — word/document\.xml/body/\*\[1454\]

```text
User is directed to take the pallet to the pick mod induction belt or the bulk picking area to stage iLPNs
```

<a id="b01455"></a>
## b01455 — word/document\.xml/body/\*\[1455\]

```text
User scans the induction belt barcode
```

<a id="b01456"></a>
## b01456 — word/document\.xml/body/\*\[1456\]

```text
WM stages all iLPNs on the pallet to the pick mod induction belt location or the bulk picking staging location
```

<a id="b01457"></a>
## b01457 — word/document\.xml/body/\*\[1457\]

```text

```

<a id="b01458"></a>
## b01458 — word/document\.xml/body/\*\[1458\]

```text
Updates
```

<a id="b01459"></a>
## b01459 — word/document\.xml/body/\*\[1459\]

```text
iLPN current location is updated to the scanned location.
```

<a id="b01460"></a>
## b01460 — word/document\.xml/body/\*\[1460\]

```text
Location inventory is updated.
```

<a id="b01461"></a>
## b01461 — word/document\.xml/body/\*\[1461\]

```text
A labor record(s) is written to credit the putaway. 
```

<a id="b01462"></a>
## b01462 — word/document\.xml/body/\*\[1462\]

```text
iLPNs are staged on the conveyor or bulk staging
```

<a id="b01463"></a>
## b01463 — word/document\.xml/body/\*\[1463\]

```text
Putaway task is in-progress
```

<a id="b01464"></a>
## b01464 — word/document\.xml/body/\*\[1464\]

```text

```

<a id="b01465"></a>
## b01465 — word/document\.xml/body/\*\[1465\]

```text


```

<a id="b01466"></a>
## b01466 — word/document\.xml/body/\*\[1466\]

```text
User Story: Putaway Cart - Fill Active 
```

<a id="b01467"></a>
## b01467 — word/document\.xml/body/\*\[1467\]

```text
Who	What	Why
Putaway Associate	Putaway Cart for MHE Fill Active	To build putaway cart to putaway individual iLPNs into active
```

<a id="b01468"></a>
## b01468 — word/document\.xml/body/\*\[1468\]

```text

```

<a id="b01469"></a>
## b01469 — word/document\.xml/body/\*\[1469\]

```text
Process
```

<a id="b01470"></a>
## b01470 — word/document\.xml/body/\*\[1470\]

```text
User enters the Make Put Cart transaction in WM Mobile device.
```

<a id="b01471"></a>
## b01471 — word/document\.xml/body/\*\[1471\]

```text
WM prompts the user to scan a Cart ID
```

<a id="b01472"></a>
## b01472 — word/document\.xml/body/\*\[1472\]

```text
User scans the Cart ID for the putaway cart they are using.
```

<a id="b01473"></a>
## b01473 — word/document\.xml/body/\*\[1473\]

```text
WM prompts the user to scan iLPNs to assign to the putaway cart.
```

<a id="b01474"></a>
## b01474 — word/document\.xml/body/\*\[1474\]

```text
User identifies like iLPNs using the visual indicator added by the MHE.
```

<a id="b01475"></a>
## b01475 — word/document\.xml/body/\*\[1475\]

```text
User scans the iLPNs to assign to the cart.
```

<a id="b01476"></a>
## b01476 — word/document\.xml/body/\*\[1476\]

```text
Once putaway cart is full of iLPNs, the user Ends the Put Cart
```

<a id="b01477"></a>
## b01477 — word/document\.xml/body/\*\[1477\]

```text
WM builds a putaway task for the putaway cart and all iLPNs associated to the cart.
```

<a id="b01478"></a>
## b01478 — word/document\.xml/body/\*\[1478\]

```text
WM takes the user directly into putaway execution and displays the first active location and iLPN.
```

<a id="b01479"></a>
## b01479 — word/document\.xml/body/\*\[1479\]

```text
User scans the active location to confirm.
```

<a id="b01480"></a>
## b01480 — word/document\.xml/body/\*\[1480\]

```text
User scans the iLPN to complete putaway for the iLPN.
```

<a id="b01481"></a>
## b01481 — word/document\.xml/body/\*\[1481\]

```text
Updates
```

<a id="b01482"></a>
## b01482 — word/document\.xml/body/\*\[1482\]

```text
iLPN is updated to ‘consumed.’
```

<a id="b01483"></a>
## b01483 — word/document\.xml/body/\*\[1483\]

```text
Location inventory is updated.
```

<a id="b01484"></a>
## b01484 — word/document\.xml/body/\*\[1484\]

```text
A labor record(s) is written to credit the putaway. 
```

<a id="b01485"></a>
## b01485 — word/document\.xml/body/\*\[1485\]

```text
Putaway task is complete.
```

<a id="b01486"></a>
## b01486 — word/document\.xml/body/\*\[1486\]

```text

```

<a id="b01487"></a>
## b01487 — word/document\.xml/body/\*\[1487\]

```text


```

<a id="b01488"></a>
## b01488 — word/document\.xml/body/\*\[1488\]

```text
User Story: Fill Active
```

<a id="b01489"></a>
## b01489 — word/document\.xml/body/\*\[1489\]

```text
Who	What	Why
Putaway Associate	Fill Active 	Fill flow rack put location from replenishment belt or putaway a single LPN to an active location.
```

<a id="b01490"></a>
## b01490 — word/document\.xml/body/\*\[1490\]

```text
Process
```

<a id="b01491"></a>
## b01491 — word/document\.xml/body/\*\[1491\]

```text
User enters WM Mobile and selects ‘Enter Task.’
```

<a id="b01492"></a>
## b01492 — word/document\.xml/body/\*\[1492\]

```text
WM prompts the user to scan a Container ID
```

<a id="b01493"></a>
## b01493 — word/document\.xml/body/\*\[1493\]

```text
User scans an available iLPN. 
```

<a id="b01494"></a>
## b01494 — word/document\.xml/body/\*\[1494\]

```text
WM initiates the corresponding putaway task and prompts the user with the destination location.
```

<a id="b01495"></a>
## b01495 — word/document\.xml/body/\*\[1495\]

```text
User travels to the displayed location and scans to confirm.
```

<a id="b01496"></a>
## b01496 — word/document\.xml/body/\*\[1496\]

```text
WM prompts the user for the iLPN to put into the location.
```

<a id="b01497"></a>
## b01497 — word/document\.xml/body/\*\[1497\]

```text
User scans the iLPN to confirm and consume the iLPN inventory into the location.
```

<a id="b01498"></a>
## b01498 — word/document\.xml/body/\*\[1498\]

```text
Updates
```

<a id="b01499"></a>
## b01499 — word/document\.xml/body/\*\[1499\]

```text
iLPN is updated to ‘consumed.’
```

<a id="b01500"></a>
## b01500 — word/document\.xml/body/\*\[1500\]

```text
Location inventory is updated.
```

<a id="b01501"></a>
## b01501 — word/document\.xml/body/\*\[1501\]

```text
A labor record(s) is written to credit the putaway. 
```

<a id="b01502"></a>
## b01502 — word/document\.xml/body/\*\[1502\]

```text
Putaway task is complete.
```

<a id="b01503"></a>
## b01503 — word/document\.xml/body/\*\[1503\]

```text

```

<a id="b01504"></a>
## b01504 — word/document\.xml/body/\*\[1504\]

```text
User Story: Post VAS Putaway
```

<a id="b01505"></a>
## b01505 — word/document\.xml/body/\*\[1505\]

```text
Who	What	Why
Putaway Associate	Suggest Putaway to Reserve in Tasking Mode for Post-VAS LPN Receiving.	To move an LPN from the VAS area to a POST VAS Putwall (with LPN storage locations arranged as putwall cubbies).
```

<a id="b01506"></a>
## b01506 — word/document\.xml/body/\*\[1506\]

```text

```

<a id="b01507"></a>
## b01507 — word/document\.xml/body/\*\[1507\]

```text
Process
```

<a id="b01508"></a>
## b01508 — word/document\.xml/body/\*\[1508\]

```text
User enters WM Mobile and selects “POST VAS Putaway” transaction.
```

<a id="b01509"></a>
## b01509 — word/document\.xml/body/\*\[1509\]

```text
MAWM prompts for a LPN scan
```

<a id="b01510"></a>
## b01510 — word/document\.xml/body/\*\[1510\]

```text
User scan LPN Id from VAS descriptor label. 
```

<a id="b01511"></a>
## b01511 — word/document\.xml/body/\*\[1511\]

```text
User is suggested with an area/zone/aisle/bay to the operator locate the LPN to a location around its vicinity.
```

<a id="b01512"></a>
## b01512 — word/document\.xml/body/\*\[1512\]

```text
User scans a location on the suggested zone.
```

<a id="b01513"></a>
## b01513 — word/document\.xml/body/\*\[1513\]

```text
Process is repeated for all iLPNs on a gurney.
```

<a id="b01514"></a>
## b01514 — word/document\.xml/body/\*\[1514\]

```text

```

<a id="b01515"></a>
## b01515 — word/document\.xml/body/\*\[1515\]

```text
Updates
```

<a id="b01516"></a>
## b01516 — word/document\.xml/body/\*\[1516\]

```text
iLPN current location is updated to the scanned location.
```

<a id="b01517"></a>
## b01517 — word/document\.xml/body/\*\[1517\]

```text
Location inventory is updated.
```

<a id="b01518"></a>
## b01518 — word/document\.xml/body/\*\[1518\]

```text
A labor record(s) is written to credit the putaway. 
```

<a id="b01519"></a>
## b01519 — word/document\.xml/body/\*\[1519\]

```text
Putaway task is completed.
```

<a id="b01520"></a>
## b01520 — word/document\.xml/body/\*\[1520\]

```text
Note: PIX are not generated post-putaway because production orders are received without the "Pending Putaway" condition code.
```

<a id="b01521"></a>
## b01521 — word/document\.xml/body/\*\[1521\]

```text
MHE Messages
```

<a id="b01522"></a>
## b01522 — word/document\.xml/body/\*\[1522\]

```text

```

<a id="b01523"></a>
## b01523 — word/document\.xml/body/\*\[1523\]

```text
Name	Source	Destination	Touchpoint	Description
Inbound Putaway	Matthews	MAWM	As iLPNs are scanned and diverted to the proper zone from the replenishment conveyor	MHE message to inform MAWM of the iLPN and the diverted staging location
```

<a id="b01524"></a>
## b01524 — word/document\.xml/body/\*\[1524\]

```text

```

<a id="b01525"></a>
## b01525 — word/document\.xml/body/\*\[1525\]

```text
Features
```

<a id="b01526"></a>
## b01526 — word/document\.xml/body/\*\[1526\]

```text
Alternate 
```

<a id="b01527"></a>
## b01527 — word/document\.xml/body/\*\[1527\]

```text
If the system-directed putaway location is already full, or – due to aisle constraints – the user cannot get to the destination location, the user requests an alternate location by using a function key at the Mobile Putaway transaction’s location confirmation screen. When the user requests a system-directed alternate putaway location, the system determines and displays a new destination location to the user. When an alternate putaway location is required, based on configuration, the system can block the original LPN Storage location for subsequent directed putaway (until an investigation into the issue is concluded, and the location unblocked) and/or generate a cycle count task for the original putaway location. Lands’ End may choose to block or generate a cycle count task for the original location during putaway. This is configurable and may be changed in the future. Alternate location requests can also be configured to allow or restrict users from being directed to a location in a separate zone.
```

<a id="b01528"></a>
## b01528 — word/document\.xml/body/\*\[1528\]

```text

```

<a id="b01529"></a>
## b01529 — word/document\.xml/body/\*\[1529\]

```text
Substitute 
```

<a id="b01530"></a>
## b01530 — word/document\.xml/body/\*\[1530\]

```text
In addition to system-directed alternate putaway, the user requires the option to manually determine a substitute destination location for the LPN. This can be used if the user is able to visually identify a valid substitute putaway location, instead of requesting the system to determine an alternate location. If the user attempts to locate the inventory to an empty location as a pending allocation for another SKU, WM is configured to display an error message and prevent the user from locating the product. Lands’ End does not allow substitute locations during putaway to active. 
```

<a id="b01531"></a>
## b01531 — word/document\.xml/body/\*\[1531\]

```text

```

<a id="b01532"></a>
## b01532 — word/document\.xml/body/\*\[1532\]

```text
Radial Search
```

<a id="b01533"></a>
## b01533 — word/document\.xml/body/\*\[1533\]

```text
When planning putaway for full Pallets that are located in the same rack system as the dedicated active location, MAWM can be configured to follow a Radial search to find the closest available Pallet reserve location to the permanent location for the item. 
```

<a id="b01534"></a>
## b01534 — word/document\.xml/body/\*\[1534\]

```text
Vicinity Based Putaway (Suggested Putaway) 
```

<a id="b01535"></a>
## b01535 — word/document\.xml/body/\*\[1535\]

```text
Vicinity based putaway, also known as suggested putaway, allows Lands’ End to be directed to a zone or area that a specific iLPN should be put away in while allowing the end user to select the destination location within that zone. 
```

<a id="b01536"></a>
## b01536 — word/document\.xml/body/\*\[1536\]

```text
Key Interfaces
```

<a id="b01537"></a>
## b01537 — word/document\.xml/body/\*\[1537\]

```text
Interface	Business Scenario
Item	Provides information that can be leveraged to drive putaway
```

<a id="b01538"></a>
## b01538 — word/document\.xml/body/\*\[1538\]

```text

```

<a id="b01539"></a>
## b01539 — word/document\.xml/body/\*\[1539\]

```text


```

<a id="b01540"></a>
## b01540 — word/document\.xml/body/\*\[1540\]

```text
Reports, Dashboards, Alerts 
```

<a id="b01541"></a>
## b01541 — word/document\.xml/body/\*\[1541\]

```text
Name	Description	Frequency	User/Dept	Type
Pending Putaway Tasks	List of all Putaway tasks that are created and yet to be complete	As needed 	Receiving/Putaway	SCI Report
Condition Code Aging Report	List of all iLPNs broken by Condition Code with the amount of time each CC has been applied	As needed	Receiving/Putaway	SCI Report
Put Allocation zone Capacity	List the volume capacity by putaway zone and % is available and % of occupied.	Daily 	Receiving/Putaway/ Inventory Supervisor	SCI Report
```

<a id="b01542"></a>
## b01542 — word/document\.xml/body/\*\[1542\]

```text

```

<a id="b01543"></a>
## b01543 — word/document\.xml/body/\*\[1543\]

```text
Gaps and Extensions
```

<a id="b01544"></a>
## b01544 — word/document\.xml/body/\*\[1544\]

```text
GAP#	Name	Why	Description
			
```

<a id="b01545"></a>
## b01545 — word/document\.xml/body/\*\[1545\]

```text
Labor Management
```

<a id="b01546"></a>
## b01546 — word/document\.xml/body/\*\[1546\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b01547"></a>
## b01547 — word/document\.xml/body/\*\[1547\]

```text
Inventory Control 
```

<a id="b01548"></a>
## b01548 — word/document\.xml/body/\*\[1548\]

```text
Cycle Counts Strategy
```

<a id="b01549"></a>
## b01549 — word/document\.xml/body/\*\[1549\]

```text
Cycle counting within the warehouse is crucial to ensuring inventory accuracy. Lands’ End cycle counts each Active and Reserve location at least once per year, while counting the Random Returns location at least twice per year. Cycle counts can be triggered by various exceptions during putaway and picking or scheduled to be generated automatically based on a configured timeline. Lands’ End plans to manually run the Cycle Count rules at the beginning of each month to create  cycle count tasks that are completed throughout the month. The Cycle Count rules incorporate the location ‘last count date’ to determine if locations have not been counted within a specific time frame, and to create a cycle count task for locations outside of the time frame. Cycle counts are also created by the Lands’ End team broken down by area, so a mixture of Reserve, Active, and Random Returns counts are created each month. 
```

<a id="b01550"></a>
## b01550 — word/document\.xml/body/\*\[1550\]

```text
Assumptions
```

<a id="b01551"></a>
## b01551 — word/document\.xml/body/\*\[1551\]

```text
Lands’ End utilizes both system generated cycle count tasks based upon scheduled rules (scheduled) and triggers (event-based), and user directed cycle counts. 
```

<a id="b01552"></a>
## b01552 — word/document\.xml/body/\*\[1552\]

```text
WM marks locations as counted regardless of how the count was triggered. 
```

<a id="b01553"></a>
## b01553 — word/document\.xml/body/\*\[1553\]

```text
Lands’ End does not capture item level attributes during the cycle count process. MAWM is configured to Do Not Prompt for item attributes, as they are not available on the inventory to scan users. 
```

<a id="b01554"></a>
## b01554 — word/document\.xml/body/\*\[1554\]

```text
Lands’ End stores any inventory with Item Attribute values (Hem pants or Logos) as Item + Attributes in the random returns area. Cycle Counts for these only require the iLPN labels to be scanned. 
```

<a id="b01555"></a>
## b01555 — word/document\.xml/body/\*\[1555\]

```text
WM is configured to book and update inventory for variances within tolerance immediately.
```

<a id="b01556"></a>
## b01556 — word/document\.xml/body/\*\[1556\]

```text
Lands’ End uses rule-based configuration for recount threshold. This supports default tolerance thresholds as well as item specific thresholds. 
```

<a id="b01557"></a>
## b01557 — word/document\.xml/body/\*\[1557\]

```text
Lands’ End does not utilize WM Physical Count functionality. 
```

<a id="b01558"></a>
## b01558 — word/document\.xml/body/\*\[1558\]

```text
It is not possible to set different tolerances based on the outcome of a Cycle Count. 
```

<a id="b01559"></a>
## b01559 — word/document\.xml/body/\*\[1559\]

```text
It is not possible to set different tolerance levels for immediate vs deferred updates.
```

<a id="b01560"></a>
## b01560 — word/document\.xml/body/\*\[1560\]

```text
Lands’ End uses a monetary tolerance value of & 250 to drive inventory updates during cycle counts.
```

<a id="b01561"></a>
## b01561 — word/document\.xml/body/\*\[1561\]

```text
Rule driven cycle counts are manually run at Lands’ End
```

<a id="b01562"></a>
## b01562 — word/document\.xml/body/\*\[1562\]

```text
Locations marked with cycle count pending are not blocked from allocation or putaway. 
```

<a id="b01563"></a>
## b01563 — word/document\.xml/body/\*\[1563\]

```text
Active Locations are either Single or Dual SKU locations, with the exception of Random Returns locations.
```

<a id="b01564"></a>
## b01564 — word/document\.xml/body/\*\[1564\]

```text
User Stories
```

<a id="b01565"></a>
## b01565 — word/document\.xml/body/\*\[1565\]

```text
User Story: Cycle Count LPN Storage Location
```

<a id="b01566"></a>
## b01566 — word/document\.xml/body/\*\[1566\]

```text
Who	What	Why
Inventory Control User	Cycle Count LPN Storage Location	For accurate inventory
```

<a id="b01567"></a>
## b01567 — word/document\.xml/body/\*\[1567\]

```text
During cycle count execution for LPN Storage locations (Reserve Locations), WM prompts the user to scan the location, and each iLPN in the location. If the user does not scan an iLPN that systemically exists in the location, the iLPN is updated to Lost status. If the user scans an iLPN that exists in a different location, the iLPN is moved to the location being counted. If the user scans an iLPN that does not exist in the system, the system prompts the user to create the iLPN by entering the item and quantity. Counts for Pallet Storage locations are configured to only require the user to count the total number of iLPNs in the location. If there is a mismatch on the number of iLPNs entered by the user, then WM requires the user to scan each iLPN in location to confirm. Any variance count out of the configured tolerance triggers a re-count task to be generated for a second user to perform the re-count before any inventory updates are made. 
```

<a id="b01568"></a>
## b01568 — word/document\.xml/body/\*\[1568\]

```text
Process
```

<a id="b01569"></a>
## b01569 — word/document\.xml/body/\*\[1569\]

```text
User enters WM Mobile Cycle Count transaction, either through tasking or WM Mobile Menu. 
```

<a id="b01570"></a>
## b01570 — word/document\.xml/body/\*\[1570\]

```text
WM prompts the user for location (displays location if tasked). 
```

<a id="b01571"></a>
## b01571 — word/document\.xml/body/\*\[1571\]

```text
User scans location. 
```

<a id="b01572"></a>
## b01572 — word/document\.xml/body/\*\[1572\]

```text
WM prompts for iLPN.
```

<a id="b01573"></a>
## b01573 — word/document\.xml/body/\*\[1573\]

```text
User scans first iLPN in location. 
```

<a id="b01574"></a>
## b01574 — word/document\.xml/body/\*\[1574\]

```text
If iLPN does not systemically exist in the location but exists elsewhere in the warehouse, the iLPN is systemically moved the location being counted. If the iLPN does not exist in WM, the user is prompted to create the iLPN by scanning the item and entering quantity. If the iLPN exists as expected in the location, the user is prompted to scan the next iLPN in the location. 
```

<a id="b01575"></a>
## b01575 — word/document\.xml/body/\*\[1575\]

```text
The user scans each iLPN in the location. When completed, the user selects the ‘End Location’ option to indicate that they are done scanning each iLPN physically in the location. 
```

<a id="b01576"></a>
## b01576 — word/document\.xml/body/\*\[1576\]

```text
If all iLPNs that systemically exist in the location are not counted, the uncounted iLPNs are de-located and moved to a ‘Lost’ status. 
```

<a id="b01577"></a>
## b01577 — word/document\.xml/body/\*\[1577\]

```text
If there is a variance under the tolerance, the count is booked.
```

<a id="b01578"></a>
## b01578 — word/document\.xml/body/\*\[1578\]

```text
If there is still a variance outside of tolerance, a re-count task is created for the location and is deferred to the supervisor.
```

<a id="b01579"></a>
## b01579 — word/document\.xml/body/\*\[1579\]

```text

```

<a id="b01580"></a>
## b01580 — word/document\.xml/body/\*\[1580\]

```text
Updates
```

<a id="b01581"></a>
## b01581 — word/document\.xml/body/\*\[1581\]

```text
If count associated with task, task moved to ‘Completed’.
```

<a id="b01582"></a>
## b01582 — word/document\.xml/body/\*\[1582\]

```text
If LPN located to new location that was previously lost, lost condition code removed, LPN located to counted location, and availability PIX generated.
```

<a id="b01583"></a>
## b01583 — word/document\.xml/body/\*\[1583\]

```text
If new iLPN detected, MAWM creates iLPN and generates inventory adjustment PIX.
```

<a id="b01584"></a>
## b01584 — word/document\.xml/body/\*\[1584\]

```text
If variance detected where iLPN is not in location, variance iLPN(s) updated with ‘Lost’ condition code and removed from location. Since it is made unavailable, a PIX is generated.
```

<a id="b01585"></a>
## b01585 — word/document\.xml/body/\*\[1585\]

```text
If a variance is detected outside of a certain threshold, a recount task is generated.
```

<a id="b01586"></a>
## b01586 — word/document\.xml/body/\*\[1586\]

```text


```

<a id="b01587"></a>
## b01587 — word/document\.xml/body/\*\[1587\]

```text
User Story: Cycle Count Pallet Storage Location
```

<a id="b01588"></a>
## b01588 — word/document\.xml/body/\*\[1588\]

```text
Who	What	Why
Inventory Control User	Cycle Count Pallet Storage Location	For accurate inventory
```

<a id="b01589"></a>
## b01589 — word/document\.xml/body/\*\[1589\]

```text
Process
```

<a id="b01590"></a>
## b01590 — word/document\.xml/body/\*\[1590\]

```text
User enters WM Mobile Cycle Count transaction, either through tasking or WM Mobile Menu. 
```

<a id="b01591"></a>
## b01591 — word/document\.xml/body/\*\[1591\]

```text
WM prompts the user for location (displays location if tasked). 
```

<a id="b01592"></a>
## b01592 — word/document\.xml/body/\*\[1592\]

```text
User scans location. 
```

<a id="b01593"></a>
## b01593 — word/document\.xml/body/\*\[1593\]

```text
WM prompts user for total iLPNs in location
```

<a id="b01594"></a>
## b01594 — word/document\.xml/body/\*\[1594\]

```text
User counts and enters total number of iLPNs in location.
```

<a id="b01595"></a>
## b01595 — word/document\.xml/body/\*\[1595\]

```text
If there is a variance, WM prompts user to scan all iLPNs in location.
```

<a id="b01596"></a>
## b01596 — word/document\.xml/body/\*\[1596\]

```text
User scans first iLPN in location. 
```

<a id="b01597"></a>
## b01597 — word/document\.xml/body/\*\[1597\]

```text
If iLPN does not systemically exist in the location but exists elsewhere in the warehouse, the iLPN is systemically moved the location being counted. If the iLPN does not exist in WM, the user is prompted to create the iLPN by scanning the item and entering quantity. If the iLPN exists as expected in the location, the user is prompted to scan the next iLPN in the location. 
```

<a id="b01598"></a>
## b01598 — word/document\.xml/body/\*\[1598\]

```text
The user scans each iLPN in the location. When completed, the user selects the ‘End Location’ option to indicate that they are done scanning each iLPN physically in the location. 
```

<a id="b01599"></a>
## b01599 — word/document\.xml/body/\*\[1599\]

```text
If all iLPNs that systemically exist in the location are not counted, the uncounted iLPNs are de-located and moved to a ‘Lost’ status. 
```

<a id="b01600"></a>
## b01600 — word/document\.xml/body/\*\[1600\]

```text
If there is a variance under the tolerance, the count is booked.
```

<a id="b01601"></a>
## b01601 — word/document\.xml/body/\*\[1601\]

```text
If there is still a variance outside of tolerance, a re-count task is created for the location and is deferred to the supervisor. 
```

<a id="b01602"></a>
## b01602 — word/document\.xml/body/\*\[1602\]

```text
Updates
```

<a id="b01603"></a>
## b01603 — word/document\.xml/body/\*\[1603\]

```text
If count associated with task, task moved to ‘Completed’.
```

<a id="b01604"></a>
## b01604 — word/document\.xml/body/\*\[1604\]

```text
If LPN located to new location that was previously lost, lost condition code removed, LPN located to counted location, and availability PIX generated.
```

<a id="b01605"></a>
## b01605 — word/document\.xml/body/\*\[1605\]

```text
If new iLPN detected, MAWM creates iLPN and generates inventory adjustment PIX.
```

<a id="b01606"></a>
## b01606 — word/document\.xml/body/\*\[1606\]

```text
If variance detected where iLPN is not in location, variance iLPN(s) updated with ‘Lost’ condition code and removed from location. Since it is made unavailable, a PIX is generated.
```

<a id="b01607"></a>
## b01607 — word/document\.xml/body/\*\[1607\]

```text
If a variance is detected outside of a certain threshold, a recount task is generated.
```

<a id="b01608"></a>
## b01608 — word/document\.xml/body/\*\[1608\]

```text


```

<a id="b01609"></a>
## b01609 — word/document\.xml/body/\*\[1609\]

```text
User Story: Cycle Count Unit Storage Location – Enter Quantity
```

<a id="b01610"></a>
## b01610 — word/document\.xml/body/\*\[1610\]

```text
Who	What	Why
Inventory Control User	Cycle Count Unit Storage Location – Enter Quantity	For accurate inventory
```

<a id="b01611"></a>
## b01611 — word/document\.xml/body/\*\[1611\]

```text

```

<a id="b01612"></a>
## b01612 — word/document\.xml/body/\*\[1612\]

```text
For Unit Storage (Active locations), Lands’ End requires users to count each individual unit and confirm the total quantity in the location. If there is a quantity mismatch on the initial count, users are immediately prompted to re-count the inventory. If the count is within the configured tolerance, WM performs immediate updates to the inventory level. If the count is outside of the configured tolerance, no inventory updates are performed, and a re-count task is created for another user to count the location. The re-count task execution flow is the same as initial counts. If a variance persists outside of the configured tolerance after a re-count, the count is deferred to a supervisor or inventory control lead to approval or deny the count in the MAWM UI. 
```

<a id="b01613"></a>
## b01613 — word/document\.xml/body/\*\[1613\]

```text
For Random Returns Unit Storage (Active Locations), Lands’ End requires users to scan each individual unit in location rather than counting total quantities for each SKU. The re-count and variance processes are the same as above. 
```

<a id="b01614"></a>
## b01614 — word/document\.xml/body/\*\[1614\]

```text
Process
```

<a id="b01615"></a>
## b01615 — word/document\.xml/body/\*\[1615\]

```text
User enters WM Mobile Cycle Count transaction, either through tasking or WM Mobile Menu. 
```

<a id="b01616"></a>
## b01616 — word/document\.xml/body/\*\[1616\]

```text
WM prompts the user for location (displays location if tasked). 
```

<a id="b01617"></a>
## b01617 — word/document\.xml/body/\*\[1617\]

```text
User scans location. 
```

<a id="b01618"></a>
## b01618 — word/document\.xml/body/\*\[1618\]

```text
WM prompts for Item.
```

<a id="b01619"></a>
## b01619 — word/document\.xml/body/\*\[1619\]

```text
User scans Item. 
```

<a id="b01620"></a>
## b01620 — word/document\.xml/body/\*\[1620\]

```text
The user enters the quantity for that item. 
```

<a id="b01621"></a>
## b01621 — word/document\.xml/body/\*\[1621\]

```text
If there is a variance under the tolerance, the count is booked.
```

<a id="b01622"></a>
## b01622 — word/document\.xml/body/\*\[1622\]

```text
If there is still a variance outside of tolerance, a re-count task is created for the location and is deferred to the supervisor.
```

<a id="b01623"></a>
## b01623 — word/document\.xml/body/\*\[1623\]

```text
Updates
```

<a id="b01624"></a>
## b01624 — word/document\.xml/body/\*\[1624\]

```text
If count associated with task, task moved to ‘Completed’.
```

<a id="b01625"></a>
## b01625 — word/document\.xml/body/\*\[1625\]

```text
If a variance is detected outside of a certain threshold, a recount task is generated.
```

<a id="b01626"></a>
## b01626 — word/document\.xml/body/\*\[1626\]

```text
If count is booked, location last count date/time updated.
```

<a id="b01627"></a>
## b01627 — word/document\.xml/body/\*\[1627\]

```text
If count is booked, cycle count pending flag is set to ‘No’
```

<a id="b01628"></a>
## b01628 — word/document\.xml/body/\*\[1628\]

```text
If count is booked with variance, Inventory Adjustment PIX is sent to Host.
```

<a id="b01629"></a>
## b01629 — word/document\.xml/body/\*\[1629\]

```text
If count is booked with variance, location On Hand Quantity is updated.
```

<a id="b01630"></a>
## b01630 — word/document\.xml/body/\*\[1630\]

```text

```

<a id="b01631"></a>
## b01631 — word/document\.xml/body/\*\[1631\]

```text


```

<a id="b01632"></a>
## b01632 — word/document\.xml/body/\*\[1632\]

```text
User Story: Cycle Count Unit Storage Location – Scan each unit
```

<a id="b01633"></a>
## b01633 — word/document\.xml/body/\*\[1633\]

```text
Who	What	Why
Inventory Control User	Cycle Count Unit Storage Location – Scan each unit	For accurate inventory
```

<a id="b01634"></a>
## b01634 — word/document\.xml/body/\*\[1634\]

```text

```

<a id="b01635"></a>
## b01635 — word/document\.xml/body/\*\[1635\]

```text
Process
```

<a id="b01636"></a>
## b01636 — word/document\.xml/body/\*\[1636\]

```text
User enters WM Mobile Cycle Count transaction, either through tasking or WM Mobile Menu. 
```

<a id="b01637"></a>
## b01637 — word/document\.xml/body/\*\[1637\]

```text
WM prompts the user for location (displays location if tasked). 
```

<a id="b01638"></a>
## b01638 — word/document\.xml/body/\*\[1638\]

```text
User scans location. 
```

<a id="b01639"></a>
## b01639 — word/document\.xml/body/\*\[1639\]

```text
WM prompts for Item.
```

<a id="b01640"></a>
## b01640 — word/document\.xml/body/\*\[1640\]

```text
User scans first Unit in location. 
```

<a id="b01641"></a>
## b01641 — word/document\.xml/body/\*\[1641\]

```text
The user scans each unit in the location. When completed, the user selects the ‘End Location’ option to indicate that they are done scanning each unit physically in the location. 
```

<a id="b01642"></a>
## b01642 — word/document\.xml/body/\*\[1642\]

```text
If there is a variance under the tolerance, the count is booked.
```

<a id="b01643"></a>
## b01643 — word/document\.xml/body/\*\[1643\]

```text
If there is still a variance outside of tolerance, a re-count task is created for the location and is deferred to the supervisor.
```

<a id="b01644"></a>
## b01644 — word/document\.xml/body/\*\[1644\]

```text
Updates
```

<a id="b01645"></a>
## b01645 — word/document\.xml/body/\*\[1645\]

```text
If count associated with task, task moved to ‘Completed’.
```

<a id="b01646"></a>
## b01646 — word/document\.xml/body/\*\[1646\]

```text
If a variance is detected outside of a certain threshold, a recount task is generated.
```

<a id="b01647"></a>
## b01647 — word/document\.xml/body/\*\[1647\]

```text
If count is booked, location last count date/time updated.
```

<a id="b01648"></a>
## b01648 — word/document\.xml/body/\*\[1648\]

```text
If count is booked, cycle count pending flag is set to ‘No’
```

<a id="b01649"></a>
## b01649 — word/document\.xml/body/\*\[1649\]

```text
If count is booked with variance, Inventory Adjustment PIX is sent to Host.
```

<a id="b01650"></a>
## b01650 — word/document\.xml/body/\*\[1650\]

```text
If count is booked with variance, location On Hand Quantity is updated.
```

<a id="b01651"></a>
## b01651 — word/document\.xml/body/\*\[1651\]

```text

```

<a id="b01652"></a>
## b01652 — word/document\.xml/body/\*\[1652\]

```text
User Story: Re-count Location
```

<a id="b01653"></a>
## b01653 — word/document\.xml/body/\*\[1653\]

```text

```

<a id="b01654"></a>
## b01654 — word/document\.xml/body/\*\[1654\]

```text
Who	What	Why
Inventory Control User	Re-Count Location	For accurate inventory
```

<a id="b01655"></a>
## b01655 — word/document\.xml/body/\*\[1655\]

```text

```

<a id="b01656"></a>
## b01656 — word/document\.xml/body/\*\[1656\]

```text
As mentioned in the above Cycle Count strategies, Lands’ End plans to use a re-count process when there is a variance counted in a location. Lands’ End plans to use Item Monetary value and Unit Location Percentage tolerances to drive immediate re-count tasks. A Cycle Count supervisor verifies physical count and either accepts or rejects booking. Any variances within $250 are allowed to be booked at the time of counting while a variance over $250 is deferred to a supervisor before any inventory updates can be made.
```

<a id="b01657"></a>
## b01657 — word/document\.xml/body/\*\[1657\]

```text
Re-count tasks are created for locations with a variance over the allowable tolerance. These re-count tasks are executed in the same manner as the original cycle count task. If a variance continues to persist through the re-count tasks and is still outside of the allowable tolerance, the count is deferred to the Counts UI to be reviewed by a supervisor. In the Count UI the supervisor has the option to book the count or reject the count. Booking the count updates the location inventory to the counted value which Rejecting a count is configured to make no location updates and to create a new re-count task to be completed by another user. 
```

<a id="b01658"></a>
## b01658 — word/document\.xml/body/\*\[1658\]

```text

```

<a id="b01659"></a>
## b01659 — word/document\.xml/body/\*\[1659\]

```text


```

<a id="b01660"></a>
## b01660 — word/document\.xml/body/\*\[1660\]

```text
Process
```

<a id="b01661"></a>
## b01661 — word/document\.xml/body/\*\[1661\]

```text
User enters WM Mobile Cycle Count transaction, either through tasking or WM Mobile Menu. 
```

<a id="b01662"></a>
## b01662 — word/document\.xml/body/\*\[1662\]

```text
WM prompts the user for location (displays location if tasked). 
```

<a id="b01663"></a>
## b01663 — word/document\.xml/body/\*\[1663\]

```text
User scans location. 
```

<a id="b01664"></a>
## b01664 — word/document\.xml/body/\*\[1664\]

```text
WM prompts for Item or iLPN, depending on the type of re-count task being executed.
```

<a id="b01665"></a>
## b01665 — word/document\.xml/body/\*\[1665\]

```text
User completes the re-count task. 
```

<a id="b01666"></a>
## b01666 — word/document\.xml/body/\*\[1666\]

```text
If a variance still exists out of tolerance after the re-count is complete, WM defers the count to a supervisor.
```

<a id="b01667"></a>
## b01667 — word/document\.xml/body/\*\[1667\]

```text
If no variance exists out of tolerance after the re-count is complete, WM books the cycle count and performs inventory updates based on what was counted in the location. 
```

<a id="b01668"></a>
## b01668 — word/document\.xml/body/\*\[1668\]

```text
Updates
```

<a id="b01669"></a>
## b01669 — word/document\.xml/body/\*\[1669\]

```text
If count associated with task, task moved to ‘Completed’.
```

<a id="b01670"></a>
## b01670 — word/document\.xml/body/\*\[1670\]

```text
If a variance is detected outside of a certain threshold, count is deferred to a supervisor in the MAWM UI.
```

<a id="b01671"></a>
## b01671 — word/document\.xml/body/\*\[1671\]

```text
If count is booked, location last count date/time updated.
```

<a id="b01672"></a>
## b01672 — word/document\.xml/body/\*\[1672\]

```text
If count is booked, cycle count pending flag is set to ‘No’
```

<a id="b01673"></a>
## b01673 — word/document\.xml/body/\*\[1673\]

```text
If count is booked with variance, Inventory Adjustment PIX is sent to Host.
```

<a id="b01674"></a>
## b01674 — word/document\.xml/body/\*\[1674\]

```text
If count is booked with variance, location On Hand Quantity is updated.
```

<a id="b01675"></a>
## b01675 — word/document\.xml/body/\*\[1675\]

```text

```

<a id="b01676"></a>
## b01676 — word/document\.xml/body/\*\[1676\]

```text
User Story: Supervisor Book Cycle Counts
```

<a id="b01677"></a>
## b01677 — word/document\.xml/body/\*\[1677\]

```text
Who	What	Why
Inventory Supervisor	Book Cycle Counts	For accurate inventory
```

<a id="b01678"></a>
## b01678 — word/document\.xml/body/\*\[1678\]

```text

```

<a id="b01679"></a>
## b01679 — word/document\.xml/body/\*\[1679\]

```text
Process
```

<a id="b01680"></a>
## b01680 — word/document\.xml/body/\*\[1680\]

```text
Supervisor navigates to the Inventory Counts UI in MAWM
```

<a id="b01681"></a>
## b01681 — word/document\.xml/body/\*\[1681\]

```text
Supervisor identifies counts which have been deferred due to tolerance.
```

<a id="b01682"></a>
## b01682 — word/document\.xml/body/\*\[1682\]

```text
Supervisor makes final decision whether to book the Cycle Count or reject the Cycle Count
```

<a id="b01683"></a>
## b01683 — word/document\.xml/body/\*\[1683\]

```text

```

<a id="b01684"></a>
## b01684 — word/document\.xml/body/\*\[1684\]

```text
Updates
```

<a id="b01685"></a>
## b01685 — word/document\.xml/body/\*\[1685\]

```text
If the supervisor books the count, inventory updates are made based on the most recent count of the location.
```

<a id="b01686"></a>
## b01686 — word/document\.xml/body/\*\[1686\]

```text
If the supervisor rejects the count, a re-count task can be created to have users count the location again.
```

<a id="b01687"></a>
## b01687 — word/document\.xml/body/\*\[1687\]

```text

```

<a id="b01688"></a>
## b01688 — word/document\.xml/body/\*\[1688\]

```text


```

<a id="b01689"></a>
## b01689 — word/document\.xml/body/\*\[1689\]

```text
Recall Inventory
```

<a id="b01690"></a>
## b01690 — word/document\.xml/body/\*\[1690\]

```text
The Recall inventory function in MAWM is used to identify inventory within the warehouse that must be removed from current locations and consolidated in one area in the warehouse. The warehouse team dictates what inventory must be pulled from locations by writing rules in the recall inventory strategy. These rules can identify an item directly or a group of items by a similar value on the item master, like Merchandise Group or Product Classification. If the item is not the main reason for recalling the inventory, other options like the inventory current location or values from iLPNs, like ASN or PO, may be used. 
```

<a id="b01691"></a>
## b01691 — word/document\.xml/body/\*\[1691\]

```text
After the specific inventory for recall is identified and put into a rule, the warehouse team may determine what to do with the inventory when the rule is run. Condition codes may be applied to all inventory that fits the recall rule, so these items are no longer available to be allocated for outbound orders. In addition, Lands’ End may specify a location that all recalled inventory must be directed to after the rule is run. This allows MAWM to create tasked moves to get the inventory from the current locations to move to the specified area to be processed. If this inventory has already been allocated or picked for an oLPN, MAWM can deallocate the inventory and apply an oLPN condition code to ensure it is not shipped and the inventory can be removed. These options are configurable and not all are required. Once the inventory reaches the desired destination location, it is most commonly used for the Repair PO process and MAWM RTV flows. 
```

<a id="b01692"></a>
## b01692 — word/document\.xml/body/\*\[1692\]

```text
User Story: Recall iLPN
```

<a id="b01693"></a>
## b01693 — word/document\.xml/body/\*\[1693\]

```text
Who	What	Why
Inventory Operator	Recall iLPN	Inventory needs to be pulled from storage location into a recall area (i.e. recall inventory to polybag, recall Pallet Flow location to cycle count)
```

<a id="b01694"></a>
## b01694 — word/document\.xml/body/\*\[1694\]

```text

```

<a id="b01695"></a>
## b01695 — word/document\.xml/body/\*\[1695\]

```text
Process Steps
```

<a id="b01696"></a>
## b01696 — word/document\.xml/body/\*\[1696\]

```text
User navigates to the Recall Inventory Strategy UI.
```

<a id="b01697"></a>
## b01697 — word/document\.xml/body/\*\[1697\]

```text
Select the appropriate recall strategy and click [Edit].
```

<a id="b01698"></a>
## b01698 — word/document\.xml/body/\*\[1698\]

```text
Click the Add Recall Inventory Criteria tab.
```

<a id="b01699"></a>
## b01699 — word/document\.xml/body/\*\[1699\]

```text
Select the Recall Inventory Criteria and click [Edit].
```

<a id="b01700"></a>
## b01700 — word/document\.xml/body/\*\[1700\]

```text
Click the Rule Selection tab.
```

<a id="b01701"></a>
## b01701 — word/document\.xml/body/\*\[1701\]

```text
Update rule with criteria for inventory to recall.
```

<a id="b01702"></a>
## b01702 — word/document\.xml/body/\*\[1702\]

```text
Click [Save and Close].
```

<a id="b01703"></a>
## b01703 — word/document\.xml/body/\*\[1703\]

```text
Select the Recall Strategy and click more and [Run].
```

<a id="b01704"></a>
## b01704 — word/document\.xml/body/\*\[1704\]

```text

```

<a id="b01705"></a>
## b01705 — word/document\.xml/body/\*\[1705\]

```text
Updates
```

<a id="b01706"></a>
## b01706 — word/document\.xml/body/\*\[1706\]

```text
Recall tasks created.
```

<a id="b01707"></a>
## b01707 — word/document\.xml/body/\*\[1707\]

```text
Inventory allocated for recall.
```

<a id="b01708"></a>
## b01708 — word/document\.xml/body/\*\[1708\]

```text
Condition code applied to inventory.
```

<a id="b01709"></a>
## b01709 — word/document\.xml/body/\*\[1709\]

```text

```

<a id="b01710"></a>
## b01710 — word/document\.xml/body/\*\[1710\]

```text


```

<a id="b01711"></a>
## b01711 — word/document\.xml/body/\*\[1711\]

```text
Prepack Disassemble
```

<a id="b01712"></a>
## b01712 — word/document\.xml/body/\*\[1712\]

```text
A prepack disassembly process is initiated through an interface process from the host system, sending a work order request to MAWM to disassemble a prepack so the individual component units can be sold individually to the retail store. 
```

<a id="b01713"></a>
## b01713 — word/document\.xml/body/\*\[1713\]

```text
Once the work order is received in MAWM, the Inventory Manager will run a work order planning (wave) to allocate the available prepacks and generate a picking task to pick them and move them to a workstation where the disassembly process starts. 
```

<a id="b01714"></a>
## b01714 — word/document\.xml/body/\*\[1714\]

```text
Once the product is disassembled, the inventory control associate performs an inventory actualization process using the “Prepack Disassemble” WM Mobile transaction, that will consume the prepack inventory and create the inventory of each prepack component unit. These units are then packed into an iLPN and putaway back to an inventory storage location to make them available for a sale order allocation.
```

<a id="b01715"></a>
## b01715 — word/document\.xml/body/\*\[1715\]

```text
Assumptions
```

<a id="b01716"></a>
## b01716 — word/document\.xml/body/\*\[1716\]

```text
A prepack bill of material (Item BOM) is created in MAWM for each prepack item.
```

<a id="b01717"></a>
## b01717 — word/document\.xml/body/\*\[1717\]

```text
A disassembly work order is created to disassemble one prepack. An independent work order is interfaced to MAWM to disassemble each prepack item ID.
```

<a id="b01718"></a>
## b01718 — word/document\.xml/body/\*\[1718\]

```text
The Prepack Work Order Allocation strategy is configured to allocate partially and cancel remaining need.
```

<a id="b01719"></a>
## b01719 — word/document\.xml/body/\*\[1719\]

```text
The Allocation strategy is configured to allocate full cases from reserve and loose units from active locations.
```

<a id="b01720"></a>
## b01720 — word/document\.xml/body/\*\[1720\]

```text
Assembly a prepack is out of scope
```

<a id="b01721"></a>
## b01721 — word/document\.xml/body/\*\[1721\]

```text

```

<a id="b01722"></a>
## b01722 — word/document\.xml/body/\*\[1722\]

```text
User Stories
```

<a id="b01723"></a>
## b01723 — word/document\.xml/body/\*\[1723\]

```text
User Story: Create a Disassembly Work Order
```

<a id="b01724"></a>
## b01724 — word/document\.xml/body/\*\[1724\]

```text
Who	What	Why
Inventory Manager	Create an Disassembly Work Order manually from the Work Orders UI	Define number of prepack to be disassemble.
```

<a id="b01725"></a>
## b01725 — word/document\.xml/body/\*\[1725\]

```text
Process Steps
```

<a id="b01726"></a>
## b01726 — word/document\.xml/body/\*\[1726\]

```text
Use navigate to Work Orders UI – Click on Create Work Order.
```

<a id="b01727"></a>
## b01727 — word/document\.xml/body/\*\[1727\]

```text

```

<a id="b01728"></a>
## b01728 — word/document\.xml/body/\*\[1728\]

```text
Enter Work Order Details:
```

<a id="b01729"></a>
## b01729 — word/document\.xml/body/\*\[1729\]

```text
Input Order ID (to be defined by Lands’ End SOP).
```

<a id="b01730"></a>
## b01730 — word/document\.xml/body/\*\[1730\]

```text
Set Priority.
```

<a id="b01731"></a>
## b01731 — word/document\.xml/body/\*\[1731\]

```text
Set Order Type to "Prepack Disassembly".
```

<a id="b01732"></a>
## b01732 — word/document\.xml/body/\*\[1732\]

```text
Ensure Origin Facility matches the currently selected facility ID from the top bar.
```

<a id="b01733"></a>
## b01733 — word/document\.xml/body/\*\[1733\]

```text
User Click Save
```

<a id="b01734"></a>
## b01734 — word/document\.xml/body/\*\[1734\]

```text

```

<a id="b01735"></a>
## b01735 — word/document\.xml/body/\*\[1735\]

```text
Select the created Work Order:
```

<a id="b01736"></a>
## b01736 — word/document\.xml/body/\*\[1736\]

```text

```

<a id="b01737"></a>
## b01737 — word/document\.xml/body/\*\[1737\]

```text
Locate and select the created Work Order.
```

<a id="b01738"></a>
## b01738 — word/document\.xml/body/\*\[1738\]

```text

```

<a id="b01739"></a>
## b01739 — word/document\.xml/body/\*\[1739\]

```text
Open the Related Link menu and click on "Work Order Finished Goods".
```

<a id="b01740"></a>
## b01740 — word/document\.xml/body/\*\[1740\]

```text

```

<a id="b01741"></a>
## b01741 — word/document\.xml/body/\*\[1741\]

```text


```

<a id="b01742"></a>
## b01742 — word/document\.xml/body/\*\[1742\]

```text
Enter Work Order Line Details:
```

<a id="b01743"></a>
## b01743 — word/document\.xml/body/\*\[1743\]

```text

```

<a id="b01744"></a>
## b01744 — word/document\.xml/body/\*\[1744\]

```text
Input Order Line.
```

<a id="b01745"></a>
## b01745 — word/document\.xml/body/\*\[1745\]

```text

```

<a id="b01746"></a>
## b01746 — word/document\.xml/body/\*\[1746\]

```text
Set Priority.
```

<a id="b01747"></a>
## b01747 — word/document\.xml/body/\*\[1747\]

```text

```

<a id="b01748"></a>
## b01748 — word/document\.xml/body/\*\[1748\]

```text
Set Status to "Ready".
```

<a id="b01749"></a>
## b01749 — word/document\.xml/body/\*\[1749\]

```text

```

<a id="b01750"></a>
## b01750 — word/document\.xml/body/\*\[1750\]

```text
Enter Item (Prepack Item ID).
```

<a id="b01751"></a>
## b01751 — word/document\.xml/body/\*\[1751\]

```text

```

<a id="b01752"></a>
## b01752 — word/document\.xml/body/\*\[1752\]

```text
Input Ordered Quantity and Order Quantity UOM (units) to be allocated and processed.
```

<a id="b01753"></a>
## b01753 — word/document\.xml/body/\*\[1753\]

```text

```

<a id="b01754"></a>
## b01754 — word/document\.xml/body/\*\[1754\]

```text
Click Save.
```

<a id="b01755"></a>
## b01755 — word/document\.xml/body/\*\[1755\]

```text

```

<a id="b01756"></a>
## b01756 — word/document\.xml/body/\*\[1756\]

```text
Add Order Line Requested Service:
```

<a id="b01757"></a>
## b01757 — word/document\.xml/body/\*\[1757\]

```text

```

<a id="b01758"></a>
## b01758 — word/document\.xml/body/\*\[1758\]

```text
Navigate to Details → "Order Line Requested Services".
```

<a id="b01759"></a>
## b01759 — word/document\.xml/body/\*\[1759\]

```text

```

<a id="b01760"></a>
## b01760 — word/document\.xml/body/\*\[1760\]

```text
Click "Add Order Line Requested Service".
```

<a id="b01761"></a>
## b01761 — word/document\.xml/body/\*\[1761\]

```text

```

<a id="b01762"></a>
## b01762 — word/document\.xml/body/\*\[1762\]

```text
Select Disassembly as the Service Type.
```

<a id="b01763"></a>
## b01763 — word/document\.xml/body/\*\[1763\]

```text

```

<a id="b01764"></a>
## b01764 — word/document\.xml/body/\*\[1764\]

```text
Set Sequence # to 1.
```

<a id="b01765"></a>
## b01765 — word/document\.xml/body/\*\[1765\]

```text

```

<a id="b01766"></a>
## b01766 — word/document\.xml/body/\*\[1766\]

```text
Select "Prepack Disassembly" as the Provided Service.
```

<a id="b01767"></a>
## b01767 — word/document\.xml/body/\*\[1767\]

```text

```

<a id="b01768"></a>
## b01768 — word/document\.xml/body/\*\[1768\]

```text
Choose ITEM as the Service Unit of Measure.
```

<a id="b01769"></a>
## b01769 — word/document\.xml/body/\*\[1769\]

```text

```

<a id="b01770"></a>
## b01770 — word/document\.xml/body/\*\[1770\]

```text
Click Submit.
```

<a id="b01771"></a>
## b01771 — word/document\.xml/body/\*\[1771\]

```text

```

<a id="b01772"></a>
## b01772 — word/document\.xml/body/\*\[1772\]

```text
Assign Pipeline:
```

<a id="b01773"></a>
## b01773 — word/document\.xml/body/\*\[1773\]

```text

```

<a id="b01774"></a>
## b01774 — word/document\.xml/body/\*\[1774\]

```text
Navigate back to Work Orders UI.
```

<a id="b01775"></a>
## b01775 — word/document\.xml/body/\*\[1775\]

```text

```

<a id="b01776"></a>
## b01776 — word/document\.xml/body/\*\[1776\]

```text
Select the created Work Order.
```

<a id="b01777"></a>
## b01777 — word/document\.xml/body/\*\[1777\]

```text

```

<a id="b01778"></a>
## b01778 — word/document\.xml/body/\*\[1778\]

```text
Click the More button and select "Assign Pipeline".
```

<a id="b01779"></a>
## b01779 — word/document\.xml/body/\*\[1779\]

```text

```

<a id="b01780"></a>
## b01780 — word/document\.xml/body/\*\[1780\]

```text
Choose "LE Work Order" pipeline.
```

<a id="b01781"></a>
## b01781 — word/document\.xml/body/\*\[1781\]

```text

```

<a id="b01782"></a>
## b01782 — word/document\.xml/body/\*\[1782\]

```text
Updates
```

<a id="b01783"></a>
## b01783 — word/document\.xml/body/\*\[1783\]

```text
Work Order is created and is ready for waving.
```

<a id="b01784"></a>
## b01784 — word/document\.xml/body/\*\[1784\]

```text
 
```

<a id="b01785"></a>
## b01785 — word/document\.xml/body/\*\[1785\]

```text


```

<a id="b01786"></a>
## b01786 — word/document\.xml/body/\*\[1786\]

```text
User Story: Prepack Disassembly wave run
```

<a id="b01787"></a>
## b01787 — word/document\.xml/body/\*\[1787\]

```text
Who	What	Why
Inventory Manager	Run a wave based on Work Order	The wave is run to generate allocations/tasks and release work to the floor
```

<a id="b01788"></a>
## b01788 — word/document\.xml/body/\*\[1788\]

```text
Process Steps
```

<a id="b01789"></a>
## b01789 — word/document\.xml/body/\*\[1789\]

```text
User navigates to the Work Orders UI.
```

<a id="b01790"></a>
## b01790 — word/document\.xml/body/\*\[1790\]

```text
User selects the Work Order(s).
```

<a id="b01791"></a>
## b01791 — word/document\.xml/body/\*\[1791\]

```text
User clicks [Run Wave].
```

<a id="b01792"></a>
## b01792 — word/document\.xml/body/\*\[1792\]

```text
Updates
```

<a id="b01793"></a>
## b01793 — word/document\.xml/body/\*\[1793\]

```text
Work Order(s) status updated to Work In Progress. 
```

<a id="b01794"></a>
## b01794 — word/document\.xml/body/\*\[1794\]

```text
Allocations and tasks created. 
```

<a id="b01795"></a>
## b01795 — word/document\.xml/body/\*\[1795\]

```text
Allocatable component inventory decreased.
```

<a id="b01796"></a>
## b01796 — word/document\.xml/body/\*\[1796\]

```text

```

<a id="b01797"></a>
## b01797 — word/document\.xml/body/\*\[1797\]

```text
User Story: Prepack LPN Pull (ILPN Pull) 
```

<a id="b01798"></a>
## b01798 — word/document\.xml/body/\*\[1798\]

```text
Who	What	Why
Picker	Pull prepack LPN from reserve.	Move prepack inventory to the prepack disassembly workstation.
```

<a id="b01799"></a>
## b01799 — word/document\.xml/body/\*\[1799\]

```text

```

<a id="b01800"></a>
## b01800 — word/document\.xml/body/\*\[1800\]

```text
Process Steps
```

<a id="b01801"></a>
## b01801 — word/document\.xml/body/\*\[1801\]

```text
User logs into WM Mobile and enters correct task group for picking.
```

<a id="b01802"></a>
## b01802 — word/document\.xml/body/\*\[1802\]

```text
User chooses Assign Task for the next available task.
```

<a id="b01803"></a>
## b01803 — word/document\.xml/body/\*\[1803\]

```text
MAWM prompts user to scan pallet.
```

<a id="b01804"></a>
## b01804 — word/document\.xml/body/\*\[1804\]

```text
User scans pallet.
```

<a id="b01805"></a>
## b01805 — word/document\.xml/body/\*\[1805\]

```text
MAWM displays pull location and prompts for iLPN to pull.
```

<a id="b01806"></a>
## b01806 — word/document\.xml/body/\*\[1806\]

```text
User scans iLPN.
```

<a id="b01807"></a>
## b01807 — word/document\.xml/body/\*\[1807\]

```text
User repeats from the iLPN scan until all task details for task is complete.
```

<a id="b01808"></a>
## b01808 — word/document\.xml/body/\*\[1808\]

```text
MAWM prompts user to locate pallet to a Prepack Disassembly Workstation .
```

<a id="b01809"></a>
## b01809 — word/document\.xml/body/\*\[1809\]

```text
User scans Prepack Disassembly Workstation barcode.
```

<a id="b01810"></a>
## b01810 — word/document\.xml/body/\*\[1810\]

```text

```

<a id="b01811"></a>
## b01811 — word/document\.xml/body/\*\[1811\]

```text
Updates
```

<a id="b01812"></a>
## b01812 — word/document\.xml/body/\*\[1812\]

```text
Picking task is completed.
```

<a id="b01813"></a>
## b01813 — word/document\.xml/body/\*\[1813\]

```text
Prepack SKU inventory is reduced from storage location.
```

<a id="b01814"></a>
## b01814 — word/document\.xml/body/\*\[1814\]

```text
Prepack SKU inventory is added to the Prepack Disassembly Workstation.
```

<a id="b01815"></a>
## b01815 — word/document\.xml/body/\*\[1815\]

```text

```

<a id="b01816"></a>
## b01816 — word/document\.xml/body/\*\[1816\]

```text
User Story : Prepack Pick to Tote (Pick from Active) 
```

<a id="b01817"></a>
## b01817 — word/document\.xml/body/\*\[1817\]

```text
Who	What	Why
Picker	Pick prepack units from an active pick location.	Move prepack inventory to the prepack disassembly workstation.
```

<a id="b01818"></a>
## b01818 — word/document\.xml/body/\*\[1818\]

```text

```

<a id="b01819"></a>
## b01819 — word/document\.xml/body/\*\[1819\]

```text
Process Steps
```

<a id="b01820"></a>
## b01820 — word/document\.xml/body/\*\[1820\]

```text
User logs into WM Mobile and enters correct task group for picking.
```

<a id="b01821"></a>
## b01821 — word/document\.xml/body/\*\[1821\]

```text
User chooses Assign Task for the next available task.
```

<a id="b01822"></a>
## b01822 — word/document\.xml/body/\*\[1822\]

```text
MAWM prompts for Tote Id.
```

<a id="b01823"></a>
## b01823 — word/document\.xml/body/\*\[1823\]

```text
User scans the Tote Id.
```

<a id="b01824"></a>
## b01824 — word/document\.xml/body/\*\[1824\]

```text
MAWM displays the pick location.
```

<a id="b01825"></a>
## b01825 — word/document\.xml/body/\*\[1825\]

```text
User scans the pick location barcode.
```

<a id="b01826"></a>
## b01826 — word/document\.xml/body/\*\[1826\]

```text
MAWM prompts for item to pick.
```

<a id="b01827"></a>
## b01827 — word/document\.xml/body/\*\[1827\]

```text
User scans item.
```

<a id="b01828"></a>
## b01828 — word/document\.xml/body/\*\[1828\]

```text
MAWM displays quantity to pick and prompts user to enter picked quantity.
```

<a id="b01829"></a>
## b01829 — word/document\.xml/body/\*\[1829\]

```text
User enters quantity picked.
```

<a id="b01830"></a>
## b01830 — word/document\.xml/body/\*\[1830\]

```text
User repeats steps 5 – 10 if the prepack was allocated from multiples pick locations.
```

<a id="b01831"></a>
## b01831 — word/document\.xml/body/\*\[1831\]

```text
MAWM prompts user to locate tote to the Prepack Disassembly Workstation.
```

<a id="b01832"></a>
## b01832 — word/document\.xml/body/\*\[1832\]

```text
User scans Prepack Disassembly Workstation barcode.
```

<a id="b01833"></a>
## b01833 — word/document\.xml/body/\*\[1833\]

```text
Updates
```

<a id="b01834"></a>
## b01834 — word/document\.xml/body/\*\[1834\]

```text
Picking task is completed.
```

<a id="b01835"></a>
## b01835 — word/document\.xml/body/\*\[1835\]

```text
Prepack SKU inventory is reduced from storage location.
```

<a id="b01836"></a>
## b01836 — word/document\.xml/body/\*\[1836\]

```text
Prepack SKU inventory is added to the Prepack Disassembly Workstation.
```

<a id="b01837"></a>
## b01837 — word/document\.xml/body/\*\[1837\]

```text

```

<a id="b01838"></a>
## b01838 — word/document\.xml/body/\*\[1838\]

```text
User Story: Prepack Disassembly (Disassembly Service Execution) 
```

<a id="b01839"></a>
## b01839 — word/document\.xml/body/\*\[1839\]

```text
Who	What	Why
Packing User	Disassemble a prepack item into its component items.	Update the inventory by consuming the prepack SKU and creating inventory for the base SKU.
```

<a id="b01840"></a>
## b01840 — word/document\.xml/body/\*\[1840\]

```text

```

<a id="b01841"></a>
## b01841 — word/document\.xml/body/\*\[1841\]

```text
Process Steps
```

<a id="b01842"></a>
## b01842 — word/document\.xml/body/\*\[1842\]

```text
User enters mobile “Prepack Disassembly” transaction in WM Mobile.
```

<a id="b01843"></a>
## b01843 — word/document\.xml/body/\*\[1843\]

```text
MAWM prompts workstation selection.
```

<a id="b01844"></a>
## b01844 — word/document\.xml/body/\*\[1844\]

```text
User selects Prepack Disassembly Workstation  ID where user is working on.
```

<a id="b01845"></a>
## b01845 — word/document\.xml/body/\*\[1845\]

```text
MAWM prompts user input work order id.
```

<a id="b01846"></a>
## b01846 — word/document\.xml/body/\*\[1846\]

```text
User inputs work order id from work order report.
```

<a id="b01847"></a>
## b01847 — word/document\.xml/body/\*\[1847\]

```text
MAWM displays service list – required quantity for finish goods / Prepacks, to be disassembled.
```

<a id="b01848"></a>
## b01848 — word/document\.xml/body/\*\[1848\]

```text
User taps the service to confirm.
```

<a id="b01849"></a>
## b01849 — word/document\.xml/body/\*\[1849\]

```text
MAWM displays component items list with quantity.
```

<a id="b01850"></a>
## b01850 — word/document\.xml/body/\*\[1850\]

```text
User tap the screen to continue.
```

<a id="b01851"></a>
## b01851 — word/document\.xml/body/\*\[1851\]

```text
MAWM prompts user to input Prepack Item barcode to dissembled prepacks.
```

<a id="b01852"></a>
## b01852 — word/document\.xml/body/\*\[1852\]

```text
User inputs quantity.
```

<a id="b01853"></a>
## b01853 — word/document\.xml/body/\*\[1853\]

```text
Transaction completes.
```

<a id="b01854"></a>
## b01854 — word/document\.xml/body/\*\[1854\]

```text
Updates
```

<a id="b01855"></a>
## b01855 — word/document\.xml/body/\*\[1855\]

```text
If the partial completion was confirmed, the order us updated to “Work in Progress” otherwise the order is updated as ‘Work Completed’.
```

<a id="b01856"></a>
## b01856 — word/document\.xml/body/\*\[1856\]

```text
Finish goods work order line’s used quantity is increased.
```

<a id="b01857"></a>
## b01857 — word/document\.xml/body/\*\[1857\]

```text
Component goods work order line’s completed quantity has increased.
```

<a id="b01858"></a>
## b01858 — word/document\.xml/body/\*\[1858\]

```text
Prepack inventory is consumed.
```

<a id="b01859"></a>
## b01859 — word/document\.xml/body/\*\[1859\]

```text
Work Order related PIX is sent to host to decrease the finished goods (prepack) and increase the component goods (base SKU).
```

<a id="b01860"></a>
## b01860 — word/document\.xml/body/\*\[1860\]

```text

```

<a id="b01861"></a>
## b01861 — word/document\.xml/body/\*\[1861\]

```text
User Story: Item Repack
```

<a id="b01862"></a>
## b01862 — word/document\.xml/body/\*\[1862\]

```text
Who	What	Why
Packing User	Repack base SKU into an iLPN	Putaway the base SKU into a storage location to make the inventory available for sales order fulfillment.
```

<a id="b01863"></a>
## b01863 — word/document\.xml/body/\*\[1863\]

```text

```

<a id="b01864"></a>
## b01864 — word/document\.xml/body/\*\[1864\]

```text
Process
```

<a id="b01865"></a>
## b01865 — word/document\.xml/body/\*\[1865\]

```text
User enters mobile “Item Repack” (Pack iLPN) transaction in WM Mobile.
```

<a id="b01866"></a>
## b01866 — word/document\.xml/body/\*\[1866\]

```text
MAWM prompts for an iLPN.
```

<a id="b01867"></a>
## b01867 — word/document\.xml/body/\*\[1867\]

```text
User scans a (new, blind, next-up) iLPN.
```

<a id="b01868"></a>
## b01868 — word/document\.xml/body/\*\[1868\]

```text
Note: [Generate iLPN] action is disabled.
```

<a id="b01869"></a>
## b01869 — word/document\.xml/body/\*\[1869\]

```text
MAWM validates the iLPN and prompts the user for the location that contains the inventory to be packed.
```

<a id="b01870"></a>
## b01870 — word/document\.xml/body/\*\[1870\]

```text
User scans Prepack Disassembly Workstation barcode.
```

<a id="b01871"></a>
## b01871 — word/document\.xml/body/\*\[1871\]

```text
MAWM prompts the user for the Item and quantity to be packed.
```

<a id="b01872"></a>
## b01872 — word/document\.xml/body/\*\[1872\]

```text
User scans the item barcode and indicates the quantity to be packed.
```

<a id="b01873"></a>
## b01873 — word/document\.xml/body/\*\[1873\]

```text
MAWM call disposition with sorting to build a pallet.
```

<a id="b01874"></a>
## b01874 — word/document\.xml/body/\*\[1874\]

```text
User Repeat steps 2 – 8  until all components units are packed.
```

<a id="b01875"></a>
## b01875 — word/document\.xml/body/\*\[1875\]

```text
Updates
```

<a id="b01876"></a>
## b01876 — word/document\.xml/body/\*\[1876\]

```text
Storage location on-hand quantity is reduced.
```

<a id="b01877"></a>
## b01877 — word/document\.xml/body/\*\[1877\]

```text
iLPN created with inventory in a “Not Allocated” status
```

<a id="b01878"></a>
## b01878 — word/document\.xml/body/\*\[1878\]

```text


```

<a id="b01879"></a>
## b01879 — word/document\.xml/body/\*\[1879\]

```text
User Story: Base SKU Putaway
```

<a id="b01880"></a>
## b01880 — word/document\.xml/body/\*\[1880\]

```text
Who	What	Why
Picking User	Putaway base SKU back to active or reserve locations. 	Make the base SKU available for sales order allocation.
```

<a id="b01881"></a>
## b01881 — word/document\.xml/body/\*\[1881\]

```text

```

<a id="b01882"></a>
## b01882 — word/document\.xml/body/\*\[1882\]

```text
Process
```

<a id="b01883"></a>
## b01883 — word/document\.xml/body/\*\[1883\]

```text
User enter mobile ‘LE Pallet Putaway’  transaction in WM Mobile.
```

<a id="b01884"></a>
## b01884 — word/document\.xml/body/\*\[1884\]

```text
User scan a Pallet Id
```

<a id="b01885"></a>
## b01885 — word/document\.xml/body/\*\[1885\]

```text
MAWM directs the user to a storage location for each LPN on a pallet.
```

<a id="b01886"></a>
## b01886 — word/document\.xml/body/\*\[1886\]

```text

```

<a id="b01887"></a>
## b01887 — word/document\.xml/body/\*\[1887\]

```text
Updates
```

<a id="b01888"></a>
## b01888 — word/document\.xml/body/\*\[1888\]

```text
Inventory is located into a storage location after completing the putaway.
```

<a id="b01889"></a>
## b01889 — word/document\.xml/body/\*\[1889\]

```text

```

<a id="b01890"></a>
## b01890 — word/document\.xml/body/\*\[1890\]

```text
Miscellaneous Inventory Transactions
```

<a id="b01891"></a>
## b01891 — word/document\.xml/body/\*\[1891\]

```text
Lands’ End also utilizes various inventory management transactions to make manual updates throughout the warehouse. The miscellaneous inventory transactions available are, but not limited to:
```

<a id="b01892"></a>
## b01892 — word/document\.xml/body/\*\[1892\]

```text
User Story: Modify iLPN
```

<a id="b01893"></a>
## b01893 — word/document\.xml/body/\*\[1893\]

```text
Who	What	Why
Inventory Control User	Changing the quantity in an iLPN	Determined that systemic item, quantity, item attributes do not match actual physical state.
```

<a id="b01894"></a>
## b01894 — word/document\.xml/body/\*\[1894\]

```text
Process Steps
```

<a id="b01895"></a>
## b01895 — word/document\.xml/body/\*\[1895\]

```text
User navigates to the WM Mobile – Modify iLPN option.
```

<a id="b01896"></a>
## b01896 — word/document\.xml/body/\*\[1896\]

```text
MAWM prompts for an iLPN.
```

<a id="b01897"></a>
## b01897 — word/document\.xml/body/\*\[1897\]

```text
User scans an iLPN barcode.
```

<a id="b01898"></a>
## b01898 — word/document\.xml/body/\*\[1898\]

```text
MAWM defaults the item to the user.
```

<a id="b01899"></a>
## b01899 — word/document\.xml/body/\*\[1899\]

```text
User confirms the new quantity.
```

<a id="b01900"></a>
## b01900 — word/document\.xml/body/\*\[1900\]

```text
User selects Reason Code and enters Reference information (optional) for the adjustment.
```

<a id="b01901"></a>
## b01901 — word/document\.xml/body/\*\[1901\]

```text
User chooses the [Done] option.
```

<a id="b01902"></a>
## b01902 — word/document\.xml/body/\*\[1902\]

```text

```

<a id="b01903"></a>
## b01903 — word/document\.xml/body/\*\[1903\]

```text
Updates
```

<a id="b01904"></a>
## b01904 — word/document\.xml/body/\*\[1904\]

```text
iLPN is adjusted to have the new quantity, ‘X’ units are written off from MAWM inventory.
```

<a id="b01905"></a>
## b01905 — word/document\.xml/body/\*\[1905\]

```text
PIX transaction communicated to host for change of inventory.
```

<a id="b01906"></a>
## b01906 — word/document\.xml/body/\*\[1906\]

```text

```

<a id="b01907"></a>
## b01907 — word/document\.xml/body/\*\[1907\]

```text
User Story: Consume iLPN
```

<a id="b01908"></a>
## b01908 — word/document\.xml/body/\*\[1908\]

```text
Who	What	Why
Inventory Control User	Decrement inventory out of four walls	Inventory is damaged, unsellable, or accidentally duplicated. 
```

<a id="b01909"></a>
## b01909 — word/document\.xml/body/\*\[1909\]

```text

```

<a id="b01910"></a>
## b01910 — word/document\.xml/body/\*\[1910\]

```text
Process Steps
```

<a id="b01911"></a>
## b01911 — word/document\.xml/body/\*\[1911\]

```text
User navigates to the WM Mobile – Consume iLPN option.
```

<a id="b01912"></a>
## b01912 — word/document\.xml/body/\*\[1912\]

```text
MAWM prompts for an iLPN.
```

<a id="b01913"></a>
## b01913 — word/document\.xml/body/\*\[1913\]

```text
User scans an iLPN barcode.
```

<a id="b01914"></a>
## b01914 — word/document\.xml/body/\*\[1914\]

```text
MAWM validates the iLPN.
```

<a id="b01915"></a>
## b01915 — word/document\.xml/body/\*\[1915\]

```text
MAWM prompts the user to a reason code.
```

<a id="b01916"></a>
## b01916 — word/document\.xml/body/\*\[1916\]

```text
User selects Reason Code and enters Reference information (optional) for the adjustment.
```

<a id="b01917"></a>
## b01917 — word/document\.xml/body/\*\[1917\]

```text
Updates
```

<a id="b01918"></a>
## b01918 — word/document\.xml/body/\*\[1918\]

```text
iLPN status changes to “Consumed” (9000).
```

<a id="b01919"></a>
## b01919 — word/document\.xml/body/\*\[1919\]

```text
Relevant PIX transaction communicated to host for change of inventory.
```

<a id="b01920"></a>
## b01920 — word/document\.xml/body/\*\[1920\]

```text
Transaction Type = “MODIFY_ILPN”.
```

<a id="b01921"></a>
## b01921 — word/document\.xml/body/\*\[1921\]

```text
Event Name = “INVENTORY_ADJUSTMENT”.
```

<a id="b01922"></a>
## b01922 — word/document\.xml/body/\*\[1922\]

```text
From Inventory Bucket = “AVAILABLE” (for allocatable iLPNs) or “UNAVAILABLE” (for unallocatable iLPNs).
```

<a id="b01923"></a>
## b01923 — word/document\.xml/body/\*\[1923\]

```text
User Story: Pack iLPN (from Storage)
```

<a id="b01924"></a>
## b01924 — word/document\.xml/body/\*\[1924\]

```text
Who	What	Why
Inventory Control User	Move inventory from unit storage location into LPN storage location.	Inventory needs to be  removed from a pick location and moved to another location.
```

<a id="b01925"></a>
## b01925 — word/document\.xml/body/\*\[1925\]

```text

```

<a id="b01926"></a>
## b01926 — word/document\.xml/body/\*\[1926\]

```text
Process Steps
```

<a id="b01927"></a>
## b01927 — word/document\.xml/body/\*\[1927\]

```text
User navigates to the WM Mobile – Pack iLPN transaction.
```

<a id="b01928"></a>
## b01928 — word/document\.xml/body/\*\[1928\]

```text
MAWM prompts for an iLPN.
```

<a id="b01929"></a>
## b01929 — word/document\.xml/body/\*\[1929\]

```text
User scans a (new, blind, next-up) iLPN.
```

<a id="b01930"></a>
## b01930 — word/document\.xml/body/\*\[1930\]

```text
Note: [Generate iLPN] action is disabled.
```

<a id="b01931"></a>
## b01931 — word/document\.xml/body/\*\[1931\]

```text
MAWM validates the iLPN and prompts the user for the location of inventory being removed.
```

<a id="b01932"></a>
## b01932 — word/document\.xml/body/\*\[1932\]

```text
User scans location barcode.
```

<a id="b01933"></a>
## b01933 — word/document\.xml/body/\*\[1933\]

```text
MAWM prompts the user for the Item and quantity to remove.
```

<a id="b01934"></a>
## b01934 — word/document\.xml/body/\*\[1934\]

```text
User scans the item barcode and indicates the quantity to move.
```

<a id="b01935"></a>
## b01935 — word/document\.xml/body/\*\[1935\]

```text

```

<a id="b01936"></a>
## b01936 — word/document\.xml/body/\*\[1936\]

```text
Updates
```

<a id="b01937"></a>
## b01937 — word/document\.xml/body/\*\[1937\]

```text
Storage location on-hand quantity is reduced.
```

<a id="b01938"></a>
## b01938 — word/document\.xml/body/\*\[1938\]

```text
iLPN created with inventory in a “Not Allocated” status
```

<a id="b01939"></a>
## b01939 — word/document\.xml/body/\*\[1939\]

```text

```

<a id="b01940"></a>
## b01940 — word/document\.xml/body/\*\[1940\]

```text
User Story: Create iLPN (from New)
```

<a id="b01941"></a>
## b01941 — word/document\.xml/body/\*\[1941\]

```text
Who	What	Why
Inventory Control User	Increase four walls inventory. 	Inventory was found. 
```

<a id="b01942"></a>
## b01942 — word/document\.xml/body/\*\[1942\]

```text

```

<a id="b01943"></a>
## b01943 — word/document\.xml/body/\*\[1943\]

```text
Process Steps
```

<a id="b01944"></a>
## b01944 — word/document\.xml/body/\*\[1944\]

```text
User navigates to the WM Mobile – Create iLPN transaction.
```

<a id="b01945"></a>
## b01945 — word/document\.xml/body/\*\[1945\]

```text
MAWM prompts for an iLPN.
```

<a id="b01946"></a>
## b01946 — word/document\.xml/body/\*\[1946\]

```text
User scans a (new, blind, next-up) iLPN.
```

<a id="b01947"></a>
## b01947 — word/document\.xml/body/\*\[1947\]

```text
Note: [Generate iLPN] action is disabled.
```

<a id="b01948"></a>
## b01948 — word/document\.xml/body/\*\[1948\]

```text
MAWM prompts user for Item and quantity.
```

<a id="b01949"></a>
## b01949 — word/document\.xml/body/\*\[1949\]

```text
User scans item barcode and quantity.
```

<a id="b01950"></a>
## b01950 — word/document\.xml/body/\*\[1950\]

```text
MAWM prompts user for reason code and reference (optional)
```

<a id="b01951"></a>
## b01951 — word/document\.xml/body/\*\[1951\]

```text
User selects Reason Code and enters reference information (optional)
```

<a id="b01952"></a>
## b01952 — word/document\.xml/body/\*\[1952\]

```text
A Reason Codes is used to identify and tie the creation of inventory (outside of receiving) to specific process (e.g., Returned Inventory, Found Inventory, etc.)
```

<a id="b01953"></a>
## b01953 — word/document\.xml/body/\*\[1953\]

```text
Updates
```

<a id="b01954"></a>
## b01954 — word/document\.xml/body/\*\[1954\]

```text
iLPN created with inventory
```

<a id="b01955"></a>
## b01955 — word/document\.xml/body/\*\[1955\]

```text
PIX transaction sent to Host to inform of inventory creation.
```

<a id="b01956"></a>
## b01956 — word/document\.xml/body/\*\[1956\]

```text
User Story: Split Combine iLPN
```

<a id="b01957"></a>
## b01957 — word/document\.xml/body/\*\[1957\]

```text
Who	What	Why
Inventory Control User	Moving inventory from one LPN to another	Split some quantity of the current iLPN into a different iLPN, or move entire iLPN quantity to a new iLPN
```

<a id="b01958"></a>
## b01958 — word/document\.xml/body/\*\[1958\]

```text

```

<a id="b01959"></a>
## b01959 — word/document\.xml/body/\*\[1959\]

```text
Process Steps
```

<a id="b01960"></a>
## b01960 — word/document\.xml/body/\*\[1960\]

```text
User navigates to the WM Mobile – Split iLPN option.
```

<a id="b01961"></a>
## b01961 — word/document\.xml/body/\*\[1961\]

```text
MAWM prompts user to scan an iLPN.
```

<a id="b01962"></a>
## b01962 — word/document\.xml/body/\*\[1962\]

```text
User scans an iLPN barcode.
```

<a id="b01963"></a>
## b01963 — word/document\.xml/body/\*\[1963\]

```text
MAWM validates the ‘From’ iLPN and prompts the user for an item and quantity to split/move.
```

<a id="b01964"></a>
## b01964 — word/document\.xml/body/\*\[1964\]

```text
User indicates the iLPNs item and the quantity to split (from 1 unit to the entire iLPN quantity).
```

<a id="b01965"></a>
## b01965 — word/document\.xml/body/\*\[1965\]

```text
MAWM prompts for the destination iLPN – or else is triggered to generate a new, next-up iLPN.
```

<a id="b01966"></a>
## b01966 — word/document\.xml/body/\*\[1966\]

```text
MAWM validates the ‘To’ iLPN.
```

<a id="b01967"></a>
## b01967 — word/document\.xml/body/\*\[1967\]

```text
MAWM completes the split/move and prompts the user to scan another iLPN to split.
```

<a id="b01968"></a>
## b01968 — word/document\.xml/body/\*\[1968\]

```text
Updates
```

<a id="b01969"></a>
## b01969 — word/document\.xml/body/\*\[1969\]

```text
‘From’ iLPN quantity is reduced.
```

<a id="b01970"></a>
## b01970 — word/document\.xml/body/\*\[1970\]

```text
If the quantity of the ‘From’ iLPN is reduced to zero, then the iLPN status is updated to “Consumed”.
```

<a id="b01971"></a>
## b01971 — word/document\.xml/body/\*\[1971\]

```text
‘To’ iLPN quantity is increased.
```

<a id="b01972"></a>
## b01972 — word/document\.xml/body/\*\[1972\]

```text
If a new iLPN is created/generated for the ‘To’ iLPN, then the iLPN status is initially “Not Allocated”.
```

<a id="b01973"></a>
## b01973 — word/document\.xml/body/\*\[1973\]

```text

```

<a id="b01974"></a>
## b01974 — word/document\.xml/body/\*\[1974\]

```text
User Story: Condition Code Assignment and Removal
```

<a id="b01975"></a>
## b01975 — word/document\.xml/body/\*\[1975\]

```text
Who	What	Why
Inventory Control User	Apply or remove condition codes to or from an iLPN	Mark inventory as being allocatable or unallocatable and denote if inventory requires additional processing. 
```

<a id="b01976"></a>
## b01976 — word/document\.xml/body/\*\[1976\]

```text

```

<a id="b01977"></a>
## b01977 — word/document\.xml/body/\*\[1977\]

```text
Process Steps
```

<a id="b01978"></a>
## b01978 — word/document\.xml/body/\*\[1978\]

```text
User navigates to either the WM Mobile – Condition Code Assignment transaction, or else the UI – iLPNs option.
```

<a id="b01979"></a>
## b01979 — word/document\.xml/body/\*\[1979\]

```text
User scans the iLPN barcode via mobile device or selects the iLPN record from the UI and executes [Apply/Remove Conditions] actions.
```

<a id="b01980"></a>
## b01980 — word/document\.xml/body/\*\[1980\]

```text
User selects the appropriate condition code to add or remove – unless one is already defaulted for the mobile transaction – and confirms the condition code application / removal.
```

<a id="b01981"></a>
## b01981 — word/document\.xml/body/\*\[1981\]

```text
Process Updates
```

<a id="b01982"></a>
## b01982 — word/document\.xml/body/\*\[1982\]

```text
Selected condition code is applied to – or removed from – the iLPN record.
```

<a id="b01983"></a>
## b01983 — word/document\.xml/body/\*\[1983\]

```text
If the condition code is configured as ‘host allocatable’ in MAWM, corresponding PIX inventory adjustment messages are sent to the host.
```

<a id="b01984"></a>
## b01984 — word/document\.xml/body/\*\[1984\]

```text
Transaction Type = “APPLIED_CONDITION_CODE” or “REMOVED_CONDITION_CODE”.
```

<a id="b01985"></a>
## b01985 — word/document\.xml/body/\*\[1985\]

```text
Event Name = “CONDITION_CODE_CHANGES”.
```

<a id="b01986"></a>
## b01986 — word/document\.xml/body/\*\[1986\]

```text
To Inventory Bucket = “AVAILABLE” or “UNAVAILABLE”.
```

<a id="b01987"></a>
## b01987 — word/document\.xml/body/\*\[1987\]

```text
User Story: Re-Identify Item / Bulk LPN Updates
```

<a id="b01988"></a>
## b01988 — word/document\.xml/body/\*\[1988\]

```text
Who	What	Why
Inventory Control User	iLPNs for items where an item needs to be re-classified into a different item.	Edit iLPN header, re-identify the item, or apply/remove condition codes to multiple iLPNs at the same time.
```

<a id="b01989"></a>
## b01989 — word/document\.xml/body/\*\[1989\]

```text

```

<a id="b01990"></a>
## b01990 — word/document\.xml/body/\*\[1990\]

```text
Process Steps
```

<a id="b01991"></a>
## b01991 — word/document\.xml/body/\*\[1991\]

```text
User Navigates to the UI – Inventory Details menu option.
```

<a id="b01992"></a>
## b01992 — word/document\.xml/body/\*\[1992\]

```text
User filters for the specific iLPNs in storage locations of the product to adjust.
```

<a id="b01993"></a>
## b01993 — word/document\.xml/body/\*\[1993\]

```text
User selects the records.
```

<a id="b01994"></a>
## b01994 — word/document\.xml/body/\*\[1994\]

```text
User selects the additional option button (indicated in MAWM by 3 dots stacked on top of one another)
```

<a id="b01995"></a>
## b01995 — word/document\.xml/body/\*\[1995\]

```text
Select the [Reidentify item] action.
```

<a id="b01996"></a>
## b01996 — word/document\.xml/body/\*\[1996\]

```text
User inputs the new Item Name. 
```

<a id="b01997"></a>
## b01997 — word/document\.xml/body/\*\[1997\]

```text
User specifies any required attributes that need to be changed (e.g., expiration date) and selects the Reason Code for the change.
```

<a id="b01998"></a>
## b01998 — word/document\.xml/body/\*\[1998\]

```text
Once complete, the user selects [Execute] action to complete the item to item transfer.
```

<a id="b01999"></a>
## b01999 — word/document\.xml/body/\*\[1999\]

```text
Updates
```

<a id="b02000"></a>
## b02000 — word/document\.xml/body/\*\[2000\]

```text
iLPN records are updated based on the information entered by the user.
```

<a id="b02001"></a>
## b02001 — word/document\.xml/body/\*\[2001\]

```text
PIX transaction is generated indicating a decrement of the iLPNs original product status for each iLPN updated.
```

<a id="b02002"></a>
## b02002 — word/document\.xml/body/\*\[2002\]

```text
PIX transaction is generated indicating an increment of the iLPNs new product status for each iLPN updated.
```

<a id="b02003"></a>
## b02003 — word/document\.xml/body/\*\[2003\]

```text
User Story: Split Combine oLPN
```

<a id="b02004"></a>
## b02004 — word/document\.xml/body/\*\[2004\]

```text
Who	What	Why
Inventory Control User	Moving inventory from one LPN to another	Split one oLPN into two distinct oLPNs or combine two existing oLPNs into one
```

<a id="b02005"></a>
## b02005 — word/document\.xml/body/\*\[2005\]

```text

```

<a id="b02006"></a>
## b02006 — word/document\.xml/body/\*\[2006\]

```text
Process Steps
```

<a id="b02007"></a>
## b02007 — word/document\.xml/body/\*\[2007\]

```text
User navigates to the WM Mobile – Split oLPN option.
```

<a id="b02008"></a>
## b02008 — word/document\.xml/body/\*\[2008\]

```text
MAWM prompts user to scan an oLPN.
```

<a id="b02009"></a>
## b02009 — word/document\.xml/body/\*\[2009\]

```text
User scans an oLPN barcode.
```

<a id="b02010"></a>
## b02010 — word/document\.xml/body/\*\[2010\]

```text
MAWM validates the ‘From’ oLPN and prompts the user for an item and quantity to split/move.
```

<a id="b02011"></a>
## b02011 — word/document\.xml/body/\*\[2011\]

```text
User indicates the oLPNs item and the quantity to split (from 1 unit to the entire iLPN quantity).
```

<a id="b02012"></a>
## b02012 — word/document\.xml/body/\*\[2012\]

```text
MAWM prompts for the destination oLPN – or else is triggered to generate a new, next-up iLPN.
```

<a id="b02013"></a>
## b02013 — word/document\.xml/body/\*\[2013\]

```text
MAWM validates the ‘To’ oLPN.
```

<a id="b02014"></a>
## b02014 — word/document\.xml/body/\*\[2014\]

```text
MAWM completes the split/move and prompts the user to scan another oLPN to split.
```

<a id="b02015"></a>
## b02015 — word/document\.xml/body/\*\[2015\]

```text
Updates
```

<a id="b02016"></a>
## b02016 — word/document\.xml/body/\*\[2016\]

```text
‘From’ oLPN quantity is reduced.
```

<a id="b02017"></a>
## b02017 — word/document\.xml/body/\*\[2017\]

```text
If the quantity of the ‘From’ oLPN is reduced to zero, then the oLPN status is updated to “Cancelled”.
```

<a id="b02018"></a>
## b02018 — word/document\.xml/body/\*\[2018\]

```text
‘To’ oLPN quantity is increased.
```

<a id="b02019"></a>
## b02019 — word/document\.xml/body/\*\[2019\]

```text
If a new iLPN is created/generated for the ‘To’ oLPN, then the oLPN status is “Packed”.
```

<a id="b02020"></a>
## b02020 — word/document\.xml/body/\*\[2020\]

```text
User Story: Item Inquiry
```

<a id="b02021"></a>
## b02021 — word/document\.xml/body/\*\[2021\]

```text
Who	What	Why
Inventory Control User	Check the current inventory of an item	Confirm locations containing a specific item.
```

<a id="b02022"></a>
## b02022 — word/document\.xml/body/\*\[2022\]

```text

```

<a id="b02023"></a>
## b02023 — word/document\.xml/body/\*\[2023\]

```text
Process Steps
```

<a id="b02024"></a>
## b02024 — word/document\.xml/body/\*\[2024\]

```text
User navigates to the WM Mobile – Item Inquiry option.
```

<a id="b02025"></a>
## b02025 — word/document\.xml/body/\*\[2025\]

```text
MAWM prompts for an Item.
```

<a id="b02026"></a>
## b02026 — word/document\.xml/body/\*\[2026\]

```text
User scans Item barcode.
```

<a id="b02027"></a>
## b02027 — word/document\.xml/body/\*\[2027\]

```text
Updates
```

<a id="b02028"></a>
## b02028 — word/document\.xml/body/\*\[2028\]

```text
MAWM displays the list of locations where the inventory for the item exists, along with the quantity of items available in these locations. The total on hand quantity information is displayed, which is a summation of all on hand quantity within iLPNs in the location.
```

<a id="b02029"></a>
## b02029 — word/document\.xml/body/\*\[2029\]

```text

```

<a id="b02030"></a>
## b02030 — word/document\.xml/body/\*\[2030\]

```text
User Story: iLPN Inquiry
```

<a id="b02031"></a>
## b02031 — word/document\.xml/body/\*\[2031\]

```text
Who	What	Why
Inventory Control User	iLPN Inquiry	To investigate iLPNs and identify item inside
```

<a id="b02032"></a>
## b02032 — word/document\.xml/body/\*\[2032\]

```text

```

<a id="b02033"></a>
## b02033 — word/document\.xml/body/\*\[2033\]

```text
Process Steps
```

<a id="b02034"></a>
## b02034 — word/document\.xml/body/\*\[2034\]

```text
User navigates to the WM Mobile – iLPN Inquiry option.
```

<a id="b02035"></a>
## b02035 — word/document\.xml/body/\*\[2035\]

```text
MAWM prompts for a iLPN.
```

<a id="b02036"></a>
## b02036 — word/document\.xml/body/\*\[2036\]

```text
User scans iLPN barcode.
```

<a id="b02037"></a>
## b02037 — word/document\.xml/body/\*\[2037\]

```text
Updates
```

<a id="b02038"></a>
## b02038 — word/document\.xml/body/\*\[2038\]

```text
MAWM displays the iLPNs contents (items and quantities), status, current (systematic) location – as well as any currently assigned condition code(s) for the iLPN.
```

<a id="b02039"></a>
## b02039 — word/document\.xml/body/\*\[2039\]

```text
User Story: Location Inquiry
```

<a id="b02040"></a>
## b02040 — word/document\.xml/body/\*\[2040\]

```text
Who	What	Why
Inventory Control User	Check the current inventory in a location	Confirms the inventory within a specific location.
```

<a id="b02041"></a>
## b02041 — word/document\.xml/body/\*\[2041\]

```text

```

<a id="b02042"></a>
## b02042 — word/document\.xml/body/\*\[2042\]

```text
Process Steps
```

<a id="b02043"></a>
## b02043 — word/document\.xml/body/\*\[2043\]

```text
User navigates to the WM Mobile – Location Inquiry option.
```

<a id="b02044"></a>
## b02044 — word/document\.xml/body/\*\[2044\]

```text
MAWM prompts for a Location.
```

<a id="b02045"></a>
## b02045 — word/document\.xml/body/\*\[2045\]

```text
User scans Location barcode.
```

<a id="b02046"></a>
## b02046 — word/document\.xml/body/\*\[2046\]

```text
Updates
```

<a id="b02047"></a>
## b02047 — word/document\.xml/body/\*\[2047\]

```text
If location has iLPNs located then MAWM displays the iLPNs and quantity inside each iLPN.
```

<a id="b02048"></a>
## b02048 — word/document\.xml/body/\*\[2048\]

```text
If location has loose inventory then MAWM displays the item and quantity in the location.
```

<a id="b02049"></a>
## b02049 — word/document\.xml/body/\*\[2049\]

```text

```

<a id="b02050"></a>
## b02050 — word/document\.xml/body/\*\[2050\]

```text
User Story: Print iLPN Label
```

<a id="b02051"></a>
## b02051 — word/document\.xml/body/\*\[2051\]

```text
Who	What	Why
Inventory Control User	Re-print an iLPN label	iLPN label is damaged 
```

<a id="b02052"></a>
## b02052 — word/document\.xml/body/\*\[2052\]

```text

```

<a id="b02053"></a>
## b02053 — word/document\.xml/body/\*\[2053\]

```text
Process Steps
```

<a id="b02054"></a>
## b02054 — word/document\.xml/body/\*\[2054\]

```text
User navigates to the iLPN UI
```

<a id="b02055"></a>
## b02055 — word/document\.xml/body/\*\[2055\]

```text
User Search the iLPN
```

<a id="b02056"></a>
## b02056 — word/document\.xml/body/\*\[2056\]

```text
User Selects the ILPN
```

<a id="b02057"></a>
## b02057 — word/document\.xml/body/\*\[2057\]

```text
User Click Print Label button.
```

<a id="b02058"></a>
## b02058 — word/document\.xml/body/\*\[2058\]

```text
A pop-up asks the user to provide the desired printer to use for the labels
```

<a id="b02059"></a>
## b02059 — word/document\.xml/body/\*\[2059\]

```text
User select the required printer.
```

<a id="b02060"></a>
## b02060 — word/document\.xml/body/\*\[2060\]

```text
Updates
```

<a id="b02061"></a>
## b02061 — word/document\.xml/body/\*\[2061\]

```text
Label gets printed.
```

<a id="b02062"></a>
## b02062 — word/document\.xml/body/\*\[2062\]

```text
Features
```

<a id="b02063"></a>
## b02063 — word/document\.xml/body/\*\[2063\]

```text
Cycle Count Tolerance
```

<a id="b02064"></a>
## b02064 — word/document\.xml/body/\*\[2064\]

```text
Lands’ End uses the tolerance functionality to define when a re-count task needs to be created for a separate user to perform on a location rather than accepting the count variance. The tolerance at Lands’ End is set as $250.
```

<a id="b02065"></a>
## b02065 — word/document\.xml/body/\*\[2065\]

```text
 Key Interfaces
```

<a id="b02066"></a>
## b02066 — word/document\.xml/body/\*\[2066\]

```text
Interface	Business Scenario
PIX	Inform host of inventory quantity changes
```

<a id="b02067"></a>
## b02067 — word/document\.xml/body/\*\[2067\]

```text

```

<a id="b02068"></a>
## b02068 — word/document\.xml/body/\*\[2068\]

```text
Reports, Dashboards, Alerts
```

<a id="b02069"></a>
## b02069 — word/document\.xml/body/\*\[2069\]

```text

```

<a id="b02070"></a>
## b02070 — word/document\.xml/body/\*\[2070\]

```text
Name	Description	Frequency	User/Dept	Type
Cycle Count Task Report	Details of all cycle counts tasks and their statuses for the month	As needed	Inventory Control	SCI Report
Cycle Count Variance Report	Details of Variances identified during cycle counts	As needed	Inventory Control	WM Report
Condition Code Aging Report	Details inventory with condition codes and the time the condition code has been applied	As needed	Inventory Control 	SCI Report
iLPNs in Reserve with missing Inventory Attributes	Details inventory in reserve locations where required inventory attributes are null	As needed	Inventory Control	SCI Report
Charity and NQP Inventory 	Lists all inventory in the warehouse that has been marked as Charity or NQP inventory	As needed	Inventory Control 	SCI Report
Store Seconds Containers	Lists all inventory in the warehouse that has been marked as Store Seconds	As needed	Inventory Control	SCI Report
iLPNs Received, not yes Putaway	Lists all iLPNs that have been received but not yet putaway into location.	As needed	Inventory Control	SCI Report
Cycle Count Activity Report	Displays locations counted and SKUs counter per period	As needed	Inventory Control	SCI Report
Cycle Count Inventory Adjustment Report	Displays inventory adjustments which were made due to a Cycle Count variance	As needed	Inventory Control	SCI Report
Scrapped Inventory Report	Displays Inventory which has been consumed due to damages 	As needed	Inventory Control	SCI Report
```

<a id="b02071"></a>
## b02071 — word/document\.xml/body/\*\[2071\]

```text
Gaps and Extensions
```

<a id="b02072"></a>
## b02072 — word/document\.xml/body/\*\[2072\]

```text
GAP#	Name	Why	Description
 	 	 	 
```

<a id="b02073"></a>
## b02073 — word/document\.xml/body/\*\[2073\]

```text

```

<a id="b02074"></a>
## b02074 — word/document\.xml/body/\*\[2074\]

```text
Labor Management
```

<a id="b02075"></a>
## b02075 — word/document\.xml/body/\*\[2075\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b02076"></a>
## b02076 — word/document\.xml/body/\*\[2076\]

```text


```

<a id="b02077"></a>
## b02077 — word/document\.xml/body/\*\[2077\]

```text
Flowthrough
```

<a id="b02078"></a>
## b02078 — word/document\.xml/body/\*\[2078\]

```text
Strategy
```

<a id="b02079"></a>
## b02079 — word/document\.xml/body/\*\[2079\]

```text
Flowthrough is the process by which received inventory is allocated against Orders immediately after receiving, without having to run a wave. Flowthrough allocation allows Lands’ End to allocate inventory against Orders without having to put the inventory away to a location in the warehouse and running a wave to allocate the inventory. Lands’ End host system imports POs that may fulfill order demand and Original Orders are interfaced into WM prior to the received inventory being dispositioned. 
```

<a id="b02080"></a>
## b02080 — word/document\.xml/body/\*\[2080\]

```text
Lands’ End leverages one Flowthrough allocation method:
```

<a id="b02081"></a>
## b02081 — word/document\.xml/body/\*\[2081\]

```text
Singles Bulk Allocation
```

<a id="b02082"></a>
## b02082 — word/document\.xml/body/\*\[2082\]

```text
Singles Bulk allocation happens when a single iLPN is allocated for multiple orders, where all orders are single line/single unit. For Singles Bulk Allocations, WM only creates the allocations but does not create any oLPNs. During the time of allocation, WM allocates the iLPN to a packing location or packing area where users perform the packing process for each unit in the iLPN at a Pack Station. The oLPNs are created during the packing process. When the oLPNs are closed out and packed, the iLPN gets consumed. 
```

<a id="b02083"></a>
## b02083 — word/document\.xml/body/\*\[2083\]

```text

```

<a id="b02084"></a>
## b02084 — word/document\.xml/body/\*\[2084\]

```text
Assumptions
```

<a id="b02085"></a>
## b02085 — word/document\.xml/body/\*\[2085\]

```text
The Original Orders for Flowthrough demand exist in WM before the inventory is dispositioned. 
```

<a id="b02086"></a>
## b02086 — word/document\.xml/body/\*\[2086\]

```text
Original Order lines are not interfaced with a PO or ASN number for the flowthrough allocation.
```

<a id="b02087"></a>
## b02087 — word/document\.xml/body/\*\[2087\]

```text
Lands’ End uses ‘Allocation Source Rules’ for singles bulk allocations for Phase 1 go live. The other methods may be configured and used in the future if required.
```

<a id="b02088"></a>
## b02088 — word/document\.xml/body/\*\[2088\]

```text
User Stories
```

<a id="b02089"></a>
## b02089 — word/document\.xml/body/\*\[2089\]

```text
All processes invoking LPN disposition calling Flowthrough Allocation are performed as part of Receiving. See the Receiving section for detailed processes and User Stories.
```

<a id="b02090"></a>
## b02090 — word/document\.xml/body/\*\[2090\]

```text
Features
```

<a id="b02091"></a>
## b02091 — word/document\.xml/body/\*\[2091\]

```text
Order Selection Criteria
```

<a id="b02092"></a>
## b02092 — word/document\.xml/body/\*\[2092\]

```text
As part of the Flowthrough Selection Strategy, WM can be configured to select/determine which order(s) to allocate against using different selection methods outlined below. 
```

<a id="b02093"></a>
## b02093 — word/document\.xml/body/\*\[2093\]

```text
Allocation Source PO
```

<a id="b02094"></a>
## b02094 — word/document\.xml/body/\*\[2094\]

```text
In this method, WM identifies the order line to allocate based on the Purchase Order ID of the iLPN = ‘Allocation source ID’ on the order line. To use this method, the order line needs to have the iLPNs purchase order interfaced on the ‘Allocation source ID’ field. This method is typically used when the HOST system allocates store demand directly against PO quantities. 
```

<a id="b02095"></a>
## b02095 — word/document\.xml/body/\*\[2095\]

```text
Allocation Source ASN
```

<a id="b02096"></a>
## b02096 — word/document\.xml/body/\*\[2096\]

```text
In this method, WM identifies the order line to allocate based on the ASN ID of the iLPN = ‘Allocation source ID’ on the order line. To use this method, the order line needs to have the iLPNs ASN interfaced on the ‘Allocation source ID’ field. This method is typically used when the HOST system allocates store demand directly against ASN quantities.
```

<a id="b02097"></a>
## b02097 — word/document\.xml/body/\*\[2097\]

```text
Allocation Source Mark For
```

<a id="b02098"></a>
## b02098 — word/document\.xml/body/\*\[2098\]

```text
In this method, WM identifies the order line to allocate based on the ‘Mark for’ value on the iLPN = ‘Allocation source ID’ on the order line. To use this method, both the iLPN and the order line need to have the same ‘Mark for’ value on both objects. This method is typically used when an iLPN lines are specifically earmarked against corresponding order lines. The same ‘Mark for’ value must be interfaced on both the iLPN (via ASN interface) and the Order line by the HOST system.
```

<a id="b02099"></a>
## b02099 — word/document\.xml/body/\*\[2099\]

```text
Allocation Source Destination Facility
```

<a id="b02100"></a>
## b02100 — word/document\.xml/body/\*\[2100\]

```text
In this method, WM identifies the order line to allocate based on the Destination Facility value on the iLPN = ‘Allocation source ID’ on the order line. To use this method, the order line needs to have the iLPNs destination facility (store) interfaced on the ‘Allocation source ID’ field. Furthermore, the iLPN needs to also have the destination facility (store) interfaced (via ASN interface).
```

<a id="b02101"></a>
## b02101 — word/document\.xml/body/\*\[2101\]

```text
Allocation Source Rules
```

<a id="b02102"></a>
## b02102 — word/document\.xml/body/\*\[2102\]

```text
In this method, WM identifies the order line to allocate based on Rules configured in WM. This method is typically used when the HOST system is not able to interface allocation source values on the required objects. 
```

<a id="b02103"></a>
## b02103 — word/document\.xml/body/\*\[2103\]

```text
Key Interfaces
```

<a id="b02104"></a>
## b02104 — word/document\.xml/body/\*\[2104\]

```text
Interface	Business Scenario
ASN	Used for interfacing Flowthrough Allocation Source fields
Purchase Order	Used for interfacing Flowthrough Allocation Source fields
Original Order	Informs WM of Customer demand. Also used to interface Flowthrough Allocation Source fields.
```

<a id="b02105"></a>
## b02105 — word/document\.xml/body/\*\[2105\]

```text
Reports, Dashboards, Alerts
```

<a id="b02106"></a>
## b02106 — word/document\.xml/body/\*\[2106\]

```text
None identified.
```

<a id="b02107"></a>
## b02107 — word/document\.xml/body/\*\[2107\]

```text
Gaps and Extensions
```

<a id="b02108"></a>
## b02108 — word/document\.xml/body/\*\[2108\]

```text
GAP#	Name	Why	Description
			
```

<a id="b02109"></a>
## b02109 — word/document\.xml/body/\*\[2109\]

```text
Labor Management
```

<a id="b02110"></a>
## b02110 — word/document\.xml/body/\*\[2110\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b02111"></a>
## b02111 — word/document\.xml/body/\*\[2111\]

```text


```

<a id="b02112"></a>
## b02112 — word/document\.xml/body/\*\[2112\]

```text
Order Planning
```

<a id="b02113"></a>
## b02113 — word/document\.xml/body/\*\[2113\]

```text
Order planning is the process by which MAWM performs actions like inventory allocation, cubing, routing for shipping, and order consolidation to fulfill outbound orders from the distribution center's inventory.
```

<a id="b02114"></a>
## b02114 — word/document\.xml/body/\*\[2114\]

```text
Order Profile
```

<a id="b02115"></a>
## b02115 — word/document\.xml/body/\*\[2115\]

```text
The following sections provide a high-level overview of Lands’ End order types and how it will flow through the distribution center.  Each order type is placed through following business line:
```

<a id="b02116"></a>
## b02116 — word/document\.xml/body/\*\[2116\]

```text
Lands’ End Core Business (CORE)
```

<a id="b02117"></a>
## b02117 — word/document\.xml/body/\*\[2117\]

```text
Lands’ End Outfitter (LEO) 
```

<a id="b02118"></a>
## b02118 — word/document\.xml/body/\*\[2118\]

```text
Lands’ End School Uniform (LESU)
```

<a id="b02119"></a>
## b02119 — word/document\.xml/body/\*\[2119\]

```text
Lands’ End Fulfilled  (LEF) (Amazon, Kohls, etc.)
```

<a id="b02120"></a>
## b02120 — word/document\.xml/body/\*\[2120\]

```text
Order Types
```

<a id="b02121"></a>
## b02121 — word/document\.xml/body/\*\[2121\]

```text
The table below lists the order types that will be used in Manhattan. Order types are used in Manhattan Active to drive processes and criteria based on data values. They also facilitate summarization and provide insights per order type through pre-built dashboards or via custom dashboards within Manhattan Active Supply Chain Intelligence.
```

<a id="b02122"></a>
## b02122 — word/document\.xml/body/\*\[2122\]

```text
Order Type	Business Line	Rate Shop Group	Carrier Service Mode
Production Order – Logo 
(PRODLOGO)	CORE/LEO/LESU	null	Truck Load 
Production Order – Heat Transfer (PRODHT)	CORE/LEO/LESU	null	Truck Load 
Production Order – Monogram (PRODMONO)	CORE/LEO/LESU	null	Truck Load 
Production Order – Hemming (PRODHEM)	CORE/LEO/LESU	null	Truck Load 
Production Order – Name Badge (PRODNBDG )	CORE/LEO/LESU	null	Truck Load 
VAS Customer Order 
(CUSTVASORD)	CORE/LEO/LESU	Not null	Parcel or Truck Load (e.g. Kwik Trip)
Customer Order 
(CUSTREGORD)
Customer Order 
(CUSTREGORD)	CORE/LEO/LESU LEF-Amazon
LEF-Nordstrom
LEF-Target
LEF-Kohls
LEF-Macys	Not null

Not null	Parcel or Truck Load (e.g. Kwik Trip)
Parcel or Truck Load (e.g. Kwik Trip)
Store Orders (STORORD)	CORE/LEO/LESU	Not null	Parcel (Order.Extended.Rate ShopGroupId not null) or Truck Load based (Order.Extended.Rate ShopGroupId is null)
Replen Order (RPLNORD)	CORE/LEO/LESU	null	Parcel (Order.Extended.Rate ShopGroupId not null) or Truck Load based (Order.Extended.Rate ShopGroupId is null)
Wholesale (WHSLORD)	CORE/LEO/LESU	null	Truck Load
Order Transfer (OTRNORD)	CORE/LEO/LESU	null	Truck Load
Stock Transfer (STKTRNORD)	CORE/LEO/LESU	null	Truck Load
Charity (CHARORD)	Not quite perfect Inventory (NQP)	null	Truck Load
Liquidation (LIQORD)	CORE/LEO/LESU	null	Truck Load
Marketing (MRKTORD)	CORE/LEO/LESU	null	N/A
Photo Shoot (PSHORD)	CORE/LEO/LESU	Not null	Parcel
```

<a id="b02123"></a>
## b02123 — word/document\.xml/body/\*\[2123\]

```text

```

<a id="b02124"></a>
## b02124 — word/document\.xml/body/\*\[2124\]

```text
Customer Orders
```

<a id="b02125"></a>
## b02125 — word/document\.xml/body/\*\[2125\]

```text
Customer orders are shipped directly to residential or commercial addresses using parcel carrier services. If a customer order requires product customization, it is processed as a “VAS Customer Order” after the VAS process is completed through a Production Order.
```

<a id="b02126"></a>
## b02126 — word/document\.xml/body/\*\[2126\]

```text
VAS Customer Order High Level Process Steps
```

<a id="b02127"></a>
## b02127 — word/document\.xml/body/\*\[2127\]

```text
Production Order Release (Pre-VAS: This initiates the production process for the customized product, SAP release a Production Order to MAWM to pick the core material to produce the final product and ship it to a SAP manufacturing plan (Order Destination Facility).
```

<a id="b02128"></a>
## b02128 — word/document\.xml/body/\*\[2128\]

```text
VAS Customer Order Release (Post-VAS): After the VAS process is completed and the finished good is received in MAWM (Post VAS Receiving process) , the customer order is released to MAWM from SAP for picking, packing, and shipping based on the following criteria:
```

<a id="b02129"></a>
## b02129 — word/document\.xml/body/\*\[2129\]

```text
Single-Line, Single-Unit VAS Orders : A customer order for a single item with a single unit.
```

<a id="b02130"></a>
## b02130 — word/document\.xml/body/\*\[2130\]

```text
Large VAS Orders: A single sales order with a large total unit quantity (a configurable value in SAP) for a specific number of SKUs, all requiring the same VAS customization. Example: A single sales order with a total line item quantity greater than 50 and fewer than 4 SKUs, with the same VAS applied to all items.
```

<a id="b02131"></a>
## b02131 — word/document\.xml/body/\*\[2131\]

```text
Multi Line/Units VAS Orders: Customer orders with multiple SKUs or multiple types of customizations (e.g., some items embroidered, others monogrammed) or single line/single unit order that required a Gift package.
```

<a id="b02132"></a>
## b02132 — word/document\.xml/body/\*\[2132\]

```text
Example of  customer orders/sales order types
```

<a id="b02133"></a>
## b02133 — word/document\.xml/body/\*\[2133\]

```text
Order Type	Old Order Type	Business Line
(Extended Att.)	Fulfillment
Code (EA)	Parcel Rate Shop Group Id (EA)	Carrier Service
VAS Customer Order
(CUSTVASORD)	LE-US-CORE-VAS-SO	CORE, LEBO, LESU	S, M,L,X	Not null	Parcel
Customer Order
(CUSTREGORD)	LE-US-CORE-SO	CORE, LEBO, LESU, LEF-Amazon, LEF-Nordstrom, LEF-Target , LEF-Kohls, LEF-Macys
		Not null	Parcel, / Truck Load (Kwik Trip)
```

<a id="b02134"></a>
## b02134 — word/document\.xml/body/\*\[2134\]

```text
Production Orders
```

<a id="b02135"></a>
## b02135 — word/document\.xml/body/\*\[2135\]

```text
When a customer order requires product customization, SAP generates one or multiples production orders. These orders are then released to MAWM based on the value-added service (VAS) type, such as Embroidery (Logo) , Monogram, Hemming or Name Badge.
```

<a id="b02136"></a>
## b02136 — word/document\.xml/body/\*\[2136\]

```text
For single-line, single-unit orders with a single-item customization, SAP creates one production order per original sales order. For multi-line sales orders, SAP creates a combined production order, where each order line is a production order. 
```

<a id="b02137"></a>
## b02137 — word/document\.xml/body/\*\[2137\]

```text
Production orders are classified into two categories:
```

<a id="b02138"></a>
## b02138 — word/document\.xml/body/\*\[2138\]

```text
In-house production orders: Produced at the Dodgeville, Reedsburg, or Stevens Point plants.
```

<a id="b02139"></a>
## b02139 — word/document\.xml/body/\*\[2139\]

```text
Outsourced production orders: Handled by external Value-Added Service (VAS) providers.
```

<a id="b02140"></a>
## b02140 — word/document\.xml/body/\*\[2140\]

```text
The destination facility ID of an original order specifies whether the destination facility is an in-house VAS facility or an outsourced VAS facility.
```

<a id="b02141"></a>
## b02141 — word/document\.xml/body/\*\[2141\]

```text


```

<a id="b02142"></a>
## b02142 — word/document\.xml/body/\*\[2142\]

```text
Production Order – Order Types
```

<a id="b02143"></a>
## b02143 — word/document\.xml/body/\*\[2143\]

```text
Order Type	Fulfillment Codes
 (examples)
Production Order – Logo (PRODLOGO)	S, M,L
Production Order – Heat Transfer (PRODHT)	S, M,L
Production Order – Monogram (PRODMONO)	S, M,L
Production Order – Hemming (PRODHEM)	S, M, X
Production Order – Name Badge (PRODNBDG)	
```

<a id="b02144"></a>
## b02144 — word/document\.xml/body/\*\[2144\]

```text

```

<a id="b02145"></a>
## b02145 — word/document\.xml/body/\*\[2145\]

```text
Fulfillment Codes
```

<a id="b02146"></a>
## b02146 — word/document\.xml/body/\*\[2146\]

```text
Fulfillment Code	Description
S	Singles
M	Multi Units & Multi VAS or Single Line / Single Unit that required a Gift Box package.
L	Large
X	Multiples VAS operations in one item starting with Hemming VAS operation.
```

<a id="b02147"></a>
## b02147 — word/document\.xml/body/\*\[2147\]

```text
Note: Fulfillment code are also included with VAS Customer Orders (Post VAS Order). Enterprise Orders are identified by an extended attribute, “Enterprise Code,” specifies when an order should be processed as an enterprise production order when the code is not null. Enterprise Order are not aggregated in MAWM.
```

<a id="b02148"></a>
## b02148 — word/document\.xml/body/\*\[2148\]

```text
Example of possible enterprise order codes.
```

<a id="b02149"></a>
## b02149 — word/document\.xml/body/\*\[2149\]

```text
Enterprise Code	Description
CH0001	Chase Bank
WFS01	Wells Fargo 
```

<a id="b02150"></a>
## b02150 — word/document\.xml/body/\*\[2150\]

```text
Example of VAS Production Facilities
```

<a id="b02151"></a>
## b02151 — word/document\.xml/body/\*\[2151\]

```text
The facilities below are an example of facility id that is used with the production orders destination facility id.
```

<a id="b02152"></a>
## b02152 — word/document\.xml/body/\*\[2152\]

```text
Order Destination Facility Id	Facility Name	Facility Type Description
SAP-4	Reedsburg VAS Plan	In-house VAS
SAP-1	Dodgeville VAS Plan	In-house VAS
SAP-7	Stevens Point VAS Plan	In-house VAS
56345	Artistic Logo VAS Plan	Outsourcing VAS
35658	Contract Customizing VAS Plan	Outsourcing VAS
```

<a id="b02153"></a>
## b02153 — word/document\.xml/body/\*\[2153\]

```text

```

<a id="b02154"></a>
## b02154 — word/document\.xml/body/\*\[2154\]

```text
A facility entity/record is created in MAWM and it is used as the Order destination facility ID of a production order. In conjunction with order planning criteria, this determines the appropriate order fulfillment process flow. Additionally, extended attributes, such as "Fulfillment Code", “Enterprise Code”, “School Id” and “Logo Id” are used to identify how a production order is processed in Manhattan. These attributes indicates whether the order is handled as a combined production order, a single-item order, a multi-item order, an enterprise order, a school order, or a large customer order.
```

<a id="b02155"></a>
## b02155 — word/document\.xml/body/\*\[2155\]

```text


```

<a id="b02156"></a>
## b02156 — word/document\.xml/body/\*\[2156\]

```text
Example # 1 – Singles Production Orders
```

<a id="b02157"></a>
## b02157 — word/document\.xml/body/\*\[2157\]

```text
A customer order is created in SAP that requires decoration or customization. Based on the type of decoration, SAP generates a production order.
```

<a id="b02158"></a>
## b02158 — word/document\.xml/body/\*\[2158\]

```text
Pre VAS - Production Order (Original Order, created by SAP based on the customer order)
```

<a id="b02159"></a>
## b02159 — word/document\.xml/body/\*\[2159\]

```text
Order	Customer	Order Type	Full.
Code	Line Num.	Base Item Id	Finished Item Id	Batch
Number	Units	Decoration
PO01	C001	PRODLOGO	S	1	B301	E301	E301-001	1	Basketball Logo
PO02	C002	PRODLOGO	S	1	B301	E301	E301-002	1	Ice hockey logo
PO03	C003	PRODLOGO	S	1	B302	E301	E301-003	1	Football logo
```

<a id="b02160"></a>
## b02160 — word/document\.xml/body/\*\[2160\]

```text

```

<a id="b02161"></a>
## b02161 — word/document\.xml/body/\*\[2161\]

```text
Post VAS  - Customer Orders (Original Order)
```

<a id="b02162"></a>
## b02162 — word/document\.xml/body/\*\[2162\]

```text
Order	Customer	Order Type	Line Num.	Base Item Id	Finished Item Id (KMAT)	Batch
VAS ID	Units	Decoration
OO01	C001	VAS	1	B301	E301	E301-001	1	Basketball Logo
OO02	C002	VAS	1	B301	E301	E301-002	1	Ice hockey logo
OO03	C003	VAS	1	B302	E301	E301-003	1	Football logo
```

<a id="b02163"></a>
## b02163 — word/document\.xml/body/\*\[2163\]

```text

```

<a id="b02164"></a>
## b02164 — word/document\.xml/body/\*\[2164\]

```text
Example # 2 - Large VAS Customer Orders / Combine Production Orders
```

<a id="b02165"></a>
## b02165 — word/document\.xml/body/\*\[2165\]

```text
A multi-line customer order is created in SAP that requires one decoration on different SKUs. Based on the type of decoration, SAP generates a combined production order, where each original order line becomes a production order line consolidated into a multi-line production order. 
```

<a id="b02166"></a>
## b02166 — word/document\.xml/body/\*\[2166\]

```text
Pre VAS - Combine Production Order
```

<a id="b02167"></a>
## b02167 — word/document\.xml/body/\*\[2167\]

```text
Order	Customer	Order Type	Full.
Code	Line Num.	Base Item Id	Finished Item Id
(KMAT)	Batch Number	Units	Decoration
CPO01	PO01	PRODLOGO	L	1	B301	E301	CHS01	250	Chase Logo
CPO01	PO02	PRODLOGO	L	2	B302	E301	CHS02	250	Chase Logo
CPO02	PO03	PRODLOGO	L	1	B301	E301	KWT01	325	Kwik Trip Logo
CPO02	PO04	PRODLOGO	L	2	B303	E301	KWT02	125	Kwik Trip Logo
```

<a id="b02168"></a>
## b02168 — word/document\.xml/body/\*\[2168\]

```text
Post VAS – Customer Orders (Original Order)
```

<a id="b02169"></a>
## b02169 — word/document\.xml/body/\*\[2169\]

```text
Order	Customer	Order Type	Line Num.	Base Item Id	Finished Item Id	Batch
VAS ID	Units	Decoration
OO01	C001	VAS	1	B301	E301	CHS01	250	Chase Logo
OO01	C001	VAS	2	B302	E301	CHS02	250	Chase Logo
OO02	C002	VAS	1	B301	E301	KWT01	325	Kwik Trip Logo
OO02	C002	VAS	2	B303	E301	KWT02	125	Kwik Trip Logo
```

<a id="b02170"></a>
## b02170 — word/document\.xml/body/\*\[2170\]

```text

```

<a id="b02171"></a>
## b02171 — word/document\.xml/body/\*\[2171\]

```text


```

<a id="b02172"></a>
## b02172 — word/document\.xml/body/\*\[2172\]

```text
Example # 3 - Multis VAS Customer Orders
```

<a id="b02173"></a>
## b02173 — word/document\.xml/body/\*\[2173\]

```text
A multi-line customer order is created in SAP that requires one or multiple decorations on one or more SKUs. Based on the type of decoration, SAP generates a combined production order, where each original order line is transformed into a production order line, consolidated into a multi-line production order based on predefined criteria. 
```

<a id="b02174"></a>
## b02174 — word/document\.xml/body/\*\[2174\]

```text
Pre  VAS – Multis Combine Production Orders
```

<a id="b02175"></a>
## b02175 — word/document\.xml/body/\*\[2175\]

```text
Order	Cust.	Order Type	Full.
Code	Line Num.	Base Item Id	Finished Item Id	Batch Number	Units	Decoration
CPO01	C001	PRODLOGO	M	1	B301	E301	OO01-001	2	Basketball Logo
CPO01	C002	PRODLOGO	M	2	B301	E301	OO02-001	3	Baseball Logo
CPO02	C003	PRODLOGO	M	1	B302	E301	OO03-002	3	Soccer Logo
CPO02	C002	PRODLOGO	M	2	B302	E301	OO02-002	6	Basketball Logo
CPO03	C001	PRODLOGO	M	1	B302	E301	OO01-002	2	Football logo
CPO03	C003	PRODLOGO	X	2	B301	E301	OO03-001	3	Ice hockey logo
```

<a id="b02176"></a>
## b02176 — word/document\.xml/body/\*\[2176\]

```text

```

<a id="b02177"></a>
## b02177 — word/document\.xml/body/\*\[2177\]

```text
Post VAS – Customer Orders (Original Order)
```

<a id="b02178"></a>
## b02178 — word/document\.xml/body/\*\[2178\]

```text
Order	Customer	Order Type	Line Num.	Base Item Id	Finished Item Id	VAS Id	Units	Decoration
OO01	C001	VAS	1	B301	E301	OO01-001	2	Basketball Logo
OO01	C001	VAS	2	B301	E301	OO01-002	2	Football logo
OO02	C002	VAS	1	B302	E301	OO02-001	3	Baseball Logo
OO02	C002	VAS	2	B302	E301	OO02-002	6	Basketball Logo
OO03	C003	VAS	1	B302	E301	OO03-001	3	Ice hockey logo
OO03	C003	VAS	2	B301	E301	OO03-002	3	Soccer Logo
```

<a id="b02179"></a>
## b02179 — word/document\.xml/body/\*\[2179\]

```text
Pre-VAS Process Overview
```

<a id="b02180"></a>
## b02180 — word/document\.xml/body/\*\[2180\]

```text
 
```

<a id="b02181"></a>
## b02181 — word/document\.xml/body/\*\[2181\]

```text


```

<a id="b02182"></a>
## b02182 — word/document\.xml/body/\*\[2182\]

```text
Post-VAS Process Overview
```

<a id="b02183"></a>
## b02183 — word/document\.xml/body/\*\[2183\]

```text


```

<a id="b02184"></a>
## b02184 — word/document\.xml/body/\*\[2184\]

```text
Store Orders
```

<a id="b02185"></a>
## b02185 — word/document\.xml/body/\*\[2185\]

```text
Lands’ End retail stores receive inventory through two order types:
```

<a id="b02186"></a>
## b02186 — word/document\.xml/body/\*\[2186\]

```text
Store Orders: Larger orders to supply seasonal inventory, typically shipped via truckload.
```

<a id="b02187"></a>
## b02187 — word/document\.xml/body/\*\[2187\]

```text
Replen Store Orders: Smaller orders used to replenish seasonal inventory, shipped via parcel carrier.
```

<a id="b02188"></a>
## b02188 — word/document\.xml/body/\*\[2188\]

```text
Store orders are picked in bulk and distributed to designated store pack locations for retail price tagging and packing after picking. An order strategy is configured to aggregate store orders based on their type and carrier service mode. The aggregation process stops and creates a new distribution order once the minimum distribution order lifecycle status reaches or exceeds the “packed” status or once the order is planned (waved). Since store orders can be shipped via parcel or truckload, two store pack locations are defined in MAWM based on the values of the  extended attribute “Parcel ate Shop Group Id” of the order. 
```

<a id="b02189"></a>
## b02189 — word/document\.xml/body/\*\[2189\]

```text
Example of Store Orders types
```

<a id="b02190"></a>
## b02190 — word/document\.xml/body/\*\[2190\]

```text
Order Types	Business Line	Parcel Rate Shop Group Id (EA)	Carrier Service Mode 
Store Order	Lands’ End Core Business (CORE)	null	Truck Load (TL/LTL)
Replen Store Order	Lands’ End Core Business (CORE)	No null	Parcel (PCL)
```

<a id="b02191"></a>
## b02191 — word/document\.xml/body/\*\[2191\]

```text

```

<a id="b02192"></a>
## b02192 — word/document\.xml/body/\*\[2192\]

```text
Example of Store Pack Location Setup
```

<a id="b02193"></a>
## b02193 — word/document\.xml/body/\*\[2193\]

```text
Below is an example of store pack location setup for store 825 and 830, based on item size category.
```

<a id="b02194"></a>
## b02194 — word/document\.xml/body/\*\[2194\]

```text
Location Id	Location Type	Packing Location Type	Store	Carrier Service Mode
825-01	Packing	Store Pack	825	Truck Load (TL/LTL)
825-02	Packing	Store Pack	825	Parcel (PCL) 
830-01	Packing	Store Pack	830	Truck Load (TL/LTL)
830-02	Packing	Store Pack	830	Parcel (PCL) 
```

<a id="b02195"></a>
## b02195 — word/document\.xml/body/\*\[2195\]

```text

```

<a id="b02196"></a>
## b02196 — word/document\.xml/body/\*\[2196\]

```text
Wholesale
```

<a id="b02197"></a>
## b02197 — word/document\.xml/body/\*\[2197\]

```text
Wholesale requirements are typically full iLPNs out of reserve, however, if a less than iLPN quantity is required, Lands’ End plans to replenish iLPNs to the Wholesale Dynamic Active zone to pick the required individual units for the order. Wholesale inventory does not have a permanently slotted unit storage location for items. When replenishments are created, if a dynamic location currently exists for the item, MAWM attempts to replenish a full iLPN to the dynamic location. If a full iLPN cannot fit into the location or there is no current location for the item, MAWM creates a new temporary assignment for the item and replenishes a full iLPN to the location. 
```

<a id="b02198"></a>
## b02198 — word/document\.xml/body/\*\[2198\]

```text
As needed, Lands’ End packs the inventory in Wholesale Dynamic Active locations back into iLPNs to be stored in iLPN Storage so they may be allocated as a Full iLPN. 
```

<a id="b02199"></a>
## b02199 — word/document\.xml/body/\*\[2199\]

```text
Example of  Wholesale order type
```

<a id="b02200"></a>
## b02200 — word/document\.xml/body/\*\[2200\]

```text
Order Types	Business Line	Parcel Rate Shop Group Id (EA)	Carrier Service 
Wholesale	Specified with the order line	null	Truck Load
```

<a id="b02201"></a>
## b02201 — word/document\.xml/body/\*\[2201\]

```text

```

<a id="b02202"></a>
## b02202 — word/document\.xml/body/\*\[2202\]

```text


```

<a id="b02203"></a>
## b02203 — word/document\.xml/body/\*\[2203\]

```text
Transfer Orders
```

<a id="b02204"></a>
## b02204 — word/document\.xml/body/\*\[2204\]

```text
Lands’ End employs transfer orders to move inventory between its distribution centers. These transfer orders are categorized as follows:
```

<a id="b02205"></a>
## b02205 — word/document\.xml/body/\*\[2205\]

```text
Stock Transfers: These transfers aim to move inventory between distribution centers to balance inventory levels across them. 
```

<a id="b02206"></a>
## b02206 — word/document\.xml/body/\*\[2206\]

```text
Order Transfers: These transfers aim to move inventory to a specific distribution center to fulfill customer orders placed at that location.
```

<a id="b02207"></a>
## b02207 — word/document\.xml/body/\*\[2207\]

```text
Example of Transfer Orders 
```

<a id="b02208"></a>
## b02208 — word/document\.xml/body/\*\[2208\]

```text
Order Types	Business Line	Parcel Rate Shop Group Id (EA)	Carrier Service 
Order Transfer	Specified with the order line	null	Truck Load
Stock Transfer	Specified with the order line	null	Truck Load
```

<a id="b02209"></a>
## b02209 — word/document\.xml/body/\*\[2209\]

```text

```

<a id="b02210"></a>
## b02210 — word/document\.xml/body/\*\[2210\]

```text
Special Orders
```

<a id="b02211"></a>
## b02211 — word/document\.xml/body/\*\[2211\]

```text
Lands’ End utilizes Intercompany Orders to transfer or consume inventory without generating a formal sales transaction. Below are the primary types of Intercompany Orders used:
```

<a id="b02212"></a>
## b02212 — word/document\.xml/body/\*\[2212\]

```text
Charity Orders: These orders involve transferring third-quality inventory, referred to as Not Quite Perfect (NQP) inventory, to charitable organizations. Before waving, the inventory to be donated is manually identified by assigning an Inventory Condition Code matching the charity number (Original Order Customer ID) to each LPN that will be allocated and shipped. Once the inventory is identified, the warehouse associate runs a report in SCI, which breaks down the inventory by Charity Code, SKU, and quantity. This report is used to request a “Charity Order” in SAP for the specified SKUs and quantities.
```

<a id="b02213"></a>
## b02213 — word/document\.xml/body/\*\[2213\]

```text
Liquidation Orders: These orders pertain to the transfer of 2nd quality inventory for liquidation purposes.
```

<a id="b02214"></a>
## b02214 — word/document\.xml/body/\*\[2214\]

```text
Marketing Orders: These orders are intercompany transfers with specific instructions or requirements for marketing. 
```

<a id="b02215"></a>
## b02215 — word/document\.xml/body/\*\[2215\]

```text
Photo Shoot Orders: These orders are used to transfer inventory to Lands’ End’s Photo Studio campus, a Prep-Room, or an external Photo Studio. These orders are typically shipped via parcel carrier service.
```

<a id="b02216"></a>
## b02216 — word/document\.xml/body/\*\[2216\]

```text

```

<a id="b02217"></a>
## b02217 — word/document\.xml/body/\*\[2217\]

```text
Example of Intercompany Orders 
```

<a id="b02218"></a>
## b02218 — word/document\.xml/body/\*\[2218\]

```text
Order Types	Business Line	Parcel Rate Shop Group Id (EA)	Carrier Service 
Charity	Any 3rd quality inventory (NQP)	null	Truck Load
Liquidation	Any 2nd quality inventory	null	Truck Load
Marketing	Specified with the order line	null	N/A
Photo Shoot	Specified with the order line	Specified for external photo studio	Parcel
```

<a id="b02219"></a>
## b02219 — word/document\.xml/body/\*\[2219\]

```text

```

<a id="b02220"></a>
## b02220 — word/document\.xml/body/\*\[2220\]

```text
Order Strategy
```

<a id="b02221"></a>
## b02221 — word/document\.xml/body/\*\[2221\]

```text
An Order Strategy is the main configuration entity in DC Order. It encompasses settings for order aggregation, prioritization rules, order pipeline, planning rules, and cubing estimation when an order is imported or created in MAWM.
```

<a id="b02222"></a>
## b02222 — word/document\.xml/body/\*\[2222\]

```text
Order Strategy	Maximum 
Pickup Days if null	Maximum 
Delivery Days If null	Maximum Days Between
Pickup and Delivery Date is null
LE Order Planning Strategy	15	15	15
```

<a id="b02223"></a>
## b02223 — word/document\.xml/body/\*\[2223\]

```text

```

<a id="b02224"></a>
## b02224 — word/document\.xml/body/\*\[2224\]

```text


```

<a id="b02225"></a>
## b02225 — word/document\.xml/body/\*\[2225\]

```text
Order Aggregation
```

<a id="b02226"></a>
## b02226 — word/document\.xml/body/\*\[2226\]

```text
Order aggregation is a process that combines multiple original orders into a single distribution order based on defined criteria. Once the original orders are imported, they are evaluated against the aggregation criteria configured in the Order Strategy. If an original order meets the criteria, a rule definition and aggregation attributes will determine whether the entire order can be aggregated into an existing distribution order or if a new distribution order should be created. All configured aggregation attributes must match the existing distribution order for the original order to be aggregated. If no matching distribution order is found, a new one is created. This new distribution order will be eligible for further aggregation with future original orders that have matching attributes.
```

<a id="b02227"></a>
## b02227 — word/document\.xml/body/\*\[2227\]

```text
Lands’ End plans to aggregate Order Transfers, Production Orders (Pre VAS), Customer Orders (CORE) and Store Orders.
```

<a id="b02228"></a>
## b02228 — word/document\.xml/body/\*\[2228\]

```text
Note: Each original order will be part of a single distribution order. Once an order is selected with an Order Planning Strategy, it will be locked to prevent further aggregation.
```

<a id="b02229"></a>
## b02229 — word/document\.xml/body/\*\[2229\]

```text
Order Aggregation Criteria By Order Types
```

<a id="b02230"></a>
## b02230 — word/document\.xml/body/\*\[2230\]

```text
Order Type	Aggregate	Aggregate By
Production Order – Logo (PRODLGO)	Yes	Order Type and Order.Extended.LogoId and Order.DestinationFacilityId
Production Order – Heat Transfer  (PRODHT)	No	 
Production Order – Monogram (PRODMONO)	No	 
Production Order – Hemming (PRODHEM)	No	 
Production Order – Name Badge (PRODNBDG )	No	 
VAS Customer Order (CUSTVASORD)	No	 
Customer Order  (CUSTREGORD)	Yes	Order Type and Customer Name and Destination Address
Store Orders (STORORD)	Yes	Order Type and Destination Facility Id and  Designated Carrier Service (Parcel vs Truck Load)
Replen Order (RPLNORD)	Yes	Order Type and Destination Facility Id and  Designated Carrier Service (Parcel vs Truck Load)
Wholesale   (WHSLORD)	Yes	 Order Type and Customer Name and Destination Address
Order Transfer (OTRNORD)	Yes	Order Type and Destination Facility Id
Stock Transfer (STKTRNORD)	Yes	 Order Type and Customer Name and Destination Address
Charity (CHARORD)	No	 Order Type and Customer Name and Destination Address
Liquidation (LIQORD)	Yes	 Order Type and Customer Name and Destination Address
Marketing (MRKTORD)	Yes	 Order Type and Customer Name and Destination Address
Photo Shoot (PSHORD)	Yes	 Order Type and Customer Name and Destination Address
```

<a id="b02231"></a>
## b02231 — word/document\.xml/body/\*\[2231\]

```text
 
```

<a id="b02232"></a>
## b02232 — word/document\.xml/body/\*\[2232\]

```text


```

<a id="b02233"></a>
## b02233 — word/document\.xml/body/\*\[2233\]

```text
Order Prioritization
```

<a id="b02234"></a>
## b02234 — word/document\.xml/body/\*\[2234\]

```text
Order priority plays a key role in fulfilling orders and thus facilitates efficient fulfillment. The order priorities are determined  by configurable business rules, and a DC Order's Prioritization engine evaluates the prioritization rules to find a matching rule and assign an integer priority value to a distribution order, thus indicating the order's relative priority. The DC Order prioritization rules also determine if the order can be marked as a 'Hot' order and the order is stated as a high priority order.
```

<a id="b02235"></a>
## b02235 — word/document\.xml/body/\*\[2235\]

```text
Example:
```

<a id="b02236"></a>
## b02236 — word/document\.xml/body/\*\[2236\]

```text
Order Prioritization Rules	Order Priority	Hot Order
Order.Extended.HotOrder = true  	1	Yes
Delivery DTTM = 'Tomorrow'  or All Single Unit Single Line Orders
Or Order.Extended.HotOrder = true  or (OrderType = “CUSTVASORD”  Order.Extended.FullfilmentCode  IN (‘S’, ‘L’)	1	Yes
Order.Extended.ParcelRateShop = 1	10	No
Order.Extended.ParcelRateShop = 2	20	No
Order.Extended.ParcelRateShop = 3	30	No
```

<a id="b02237"></a>
## b02237 — word/document\.xml/body/\*\[2237\]

```text

```

<a id="b02238"></a>
## b02238 — word/document\.xml/body/\*\[2238\]

```text

```

<a id="b02239"></a>
## b02239 — word/document\.xml/body/\*\[2239\]

```text


```

<a id="b02240"></a>
## b02240 — word/document\.xml/body/\*\[2240\]

```text
Order Pipeline
```

<a id="b02241"></a>
## b02241 — word/document\.xml/body/\*\[2241\]

```text
An order pipeline outlines the stages through which an order progresses, from creation to completion, involving status changes and procedural steps. Lands’ End uses the following two order pipelines for their current order fulfillment process.
```

<a id="b02242"></a>
## b02242 — word/document\.xml/body/\*\[2242\]

```text
Pipelines and Steps
```

<a id="b02243"></a>
## b02243 — word/document\.xml/body/\*\[2243\]

```text
Pipeline	Pipeline Steps
LE Master Pipeline	
Flowthrough
Allocation
Cubing
Routing
Picking Task Creation
Sort/Pack Work Release
Replenishment
Replenishment Task Creation
Replenishment Resource 
LE Work Order Pipeline	
Allocation
Picking Task Creation
Replenishment
Replenishment Task Creation
Replenishment Resource 
```

<a id="b02244"></a>
## b02244 — word/document\.xml/body/\*\[2244\]

```text


```

<a id="b02245"></a>
## b02245 — word/document\.xml/body/\*\[2245\]

```text
Pipeline Determination Criteria
```

<a id="b02246"></a>
## b02246 — word/document\.xml/body/\*\[2246\]

```text
The determination criteria are used to assign an order pipeline to an order based on the order processing type. Specifically, the "LE Standard Order Planning" pipeline is used for shipping orders, and the "LE Work Order" pipeline is used for the Prepack Disassemble process. Additionally, the process can trigger an order planning strategy after the pipeline is assigned, based on configured rules. The table below illustrates which orders need to be processed after order creation. All other orders ("catch-all" orders) are planned based on pre-configured order planning schedules or manually through the Order Planning Strategy UI.
```

<a id="b02247"></a>
## b02247 — word/document\.xml/body/\*\[2247\]

```text

```

<a id="b02248"></a>
## b02248 — word/document\.xml/body/\*\[2248\]

```text
LE Order Strategy
```

<a id="b02249"></a>
## b02249 — word/document\.xml/body/\*\[2249\]

```text
Pipeline Determination Criteria	Selection Rules 	Pipeline	Order Planning Strategy that is Auto triggered	Interval
(in minutes)
for OPS auto trigger
Hot Customer Orders	Order Type equal “CUSTREGORD”  and Order Extended Hot Order is true  	LE Standard Order Planning	LE Hot Orders Wave	1 minute after order download
In-house VAS Customer Orders
(Large and Singles)	Order Type = “CUSTVASORD” and Order Extended Fulfillment Code is “L” OR “S” and OutsourceVAS = false	LE Standard Order Planning	LE In-house VAS Customer Orders Wave	2 minutes after order download
Work Orders	OrderProcessTypeId = “Work Order”	LE Work Order		
Catch All		LE Standard Order Planning		
```

<a id="b02250"></a>
## b02250 — word/document\.xml/body/\*\[2250\]

```text

```

<a id="b02251"></a>
## b02251 — word/document\.xml/body/\*\[2251\]

```text
Order Planning Strategies
```

<a id="b02252"></a>
## b02252 — word/document\.xml/body/\*\[2252\]

```text
MAWM supports three primary order planning strategy modes:
```

<a id="b02253"></a>
## b02253 — word/document\.xml/body/\*\[2253\]

```text
Replenishment: Creates replenishment allocations and tasks based on order pool demand. Lands' End will not use the Replenishment Wave but will schedule a Lean Time Replenishment at 10:00 PM Central Time to generate replenishment for active locations before the 11:00 PM CST order planning schedule.
```

<a id="b02254"></a>
## b02254 — word/document\.xml/body/\*\[2254\]

```text
Wave: Used for batch processing of selected orders requiring specific types of processing. This can be executed manually or automatically on a planned schedule.
```

<a id="b02255"></a>
## b02255 — word/document\.xml/body/\*\[2255\]

```text
Stream: Used for processing individual orders as they are released into MAWM, particularly for Express and Hot orders within a specific timeframe (e.g., express orders between 6 AM and 2 PM). This strategy runs continuously in the background, ensuring timely action without waiting for a wave.
```

<a id="b02256"></a>
## b02256 — word/document\.xml/body/\*\[2256\]

```text
Note: Lands' End may adjust the timeframe for singles auto waving vs. scheduled waves. A rule within the order planning strategy can be configured to compares the order's creation date/time with a configured timeframe to determine the appropriate mode.
```

<a id="b02257"></a>
## b02257 — word/document\.xml/body/\*\[2257\]

```text
Example of an Order Planning Strategy Criteria Rule to select orders created between 2PM  – 7 PM 
```

<a id="b02258"></a>
## b02258 — word/document\.xml/body/\*\[2258\]

```text

```

<a id="b02259"></a>
## b02259 — word/document\.xml/body/\*\[2259\]

```text
order.createdTimestamp.hoursFromCurrent(basehour=14)>=5
```

<a id="b02260"></a>
## b02260 — word/document\.xml/body/\*\[2260\]

```text
Note: Base-hour is the hour from which evaluation starts, and the >= number indicates how many hours to evaluate.
```

<a id="b02261"></a>
## b02261 — word/document\.xml/body/\*\[2261\]

```text


```

<a id="b02262"></a>
## b02262 — word/document\.xml/body/\*\[2262\]

```text
Unit Sorter Wave
```

<a id="b02263"></a>
## b02263 — word/document\.xml/body/\*\[2263\]

```text
A Unit Sorter is a high-speed, automated system that efficiently processes and directs items to specific destinations. To optimize the sorting process, wave strategies are employed to group items into batches, increasing pick density and throughput while minimizing idle time.
```

<a id="b02264"></a>
## b02264 — word/document\.xml/body/\*\[2264\]

```text
Lands’ End’s Dodgeville facility utilizes three types of unit sorters:
```

<a id="b02265"></a>
## b02265 — word/document\.xml/body/\*\[2265\]

```text
Matthews B2 Unit Sorters (Sorter A & B): Dual induction point
```

<a id="b02266"></a>
## b02266 — word/document\.xml/body/\*\[2266\]

```text
Matthews HM Sorters: Dual induction points
```

<a id="b02267"></a>
## b02267 — word/document\.xml/body/\*\[2267\]

```text
Beumer Sorter X: Dual induction points
```

<a id="b02268"></a>
## b02268 — word/document\.xml/body/\*\[2268\]

```text
Order planning strategies are configured for each unit sorter, considering factors like induction points and capacity. These strategies are executed every two hours, with a five minutes of difference each one, to select orders that will keep each unit sorter busy for approximately one and a half hours. This approach maximizes pick density and enables the completion of unfinished batches in the next cycle.
```

<a id="b02269"></a>
## b02269 — word/document\.xml/body/\*\[2269\]

```text
Note: All Unit Sorter Order Planning don’t require routing during the planning run (wave), the routing pipeline step is selected as none, the routing process is from the packing transaction.
```

<a id="b02270"></a>
## b02270 — word/document\.xml/body/\*\[2270\]

```text
Order Planning strategies
```

<a id="b02271"></a>
## b02271 — word/document\.xml/body/\*\[2271\]

```text
Order Planning Strategy	Order Selection	Schedule	Notes
LE Sorter X 10-30 Wave 
(Sorter Low Season Wave)
	Order Type equal “CUSTREGORD” and Order. Extended Is Gift Box Indicator = false or
(Order Type = “CUSTVASORD” 
and Order Extended Fulfillment Code is “X” or “M” )	11:00 PM CDT
 2:00 AM CDT
 5:00 AM CDT
  8:00 AM CDT
11:00 AM CDT
  2:00 PM CDT
  5:00 PM CDT
  8:00 PM CDT	Induction X for 10,20 & 30
LE Sorter X 10 Wave
		11:00 PM CDT
 2:00 AM CDT
 5:00 AM CDT
  8:00 AM CDT
11:00 AM CDT
  2:00 PM CDT
  5:00 PM CDT
  8:00 PM CDT	Induction Y
LE Sorter X 20-30 Wave
		11:05 PM CDT
 2:05 AM CDT
 5:05 AM CDT
  8:05 AM CDT
11:05 AM CDT
  2:05 PM CDT
  5:05 PM CDT
  8:05 PM CDT	Induction X
LE Sorters A Wave	Order Type equal “CUSTREGORD” and Order. Extended Is Gift Box Indicator = true  or
(Order Type = “CUSTVASORD” 
and Order Extended Fulfillment Code is “X” or “M” )	11:10 PM CDT
 2:10 AM CDT
 5:10 AM CDT
  8:10 AM CDT
11:10 AM CDT
  2:10 PM CDT
  5:10 PM CDT
  8:10 PM CDT	Induction A
LE Sorters B Wave		11:15 PM CDT
 2:15 AM CDT
 5:15 AM CDT
  8:15 AM CDT
11:15 AM CDT
  2:15 PM CDT
  5:15 PM CDT
  8:15 PM CDT	Induction B
LE HM06 Sorter	Order Type IS “PRODLOGO” OR “PRODHT”
AND
Order Enterprise Code is null 
AND
(
    Order Fulfillment Code is equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is false)
)
AND DestinationFacilityId  is not null and not equal to SAP-7
	11:20 PM CDT
 2:20 AM CDT
 5:20 AM CDT
  8:20 AM CDT
11:20 AM CDT
  2:20 PM CDT
  5:20 PM CDT
  8:20 PM CDT	HM06 Induction 
LE HM07 Sorter	Order Type IS “PRODLOGO” OR “PRODHT”
AND
Order Enterprise Code is null 
AND
(
    Order Fulfillment Code is equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is false)
) AND DestinationFacility is equal to SAP-7
	11:25 PM CDT
 2:25 AM CDT
 5:25 AM CDT
  8:25 AM CDT
11:25 AM CDT
  2:25 PM CDT
  5:25 PM CDT
  8:25 PM CDT	HM07 Induction
```

<a id="b02272"></a>
## b02272 — word/document\.xml/body/\*\[2272\]

```text

```

<a id="b02273"></a>
## b02273 — word/document\.xml/body/\*\[2273\]

```text

                         
```

<a id="b02274"></a>
## b02274 — word/document\.xml/body/\*\[2274\]

```text
Customer Order Planning (Non MHE Flows)
```

<a id="b02275"></a>
## b02275 — word/document\.xml/body/\*\[2275\]

```text
The Customer Order Wave is used for singles and Large Customer orders that are process directly in the pack station bypassing the MHE unit sorter.
```

<a id="b02276"></a>
## b02276 — word/document\.xml/body/\*\[2276\]

```text
Note: All Unit Sorter Order Planning don’t require routing during the planning run (wave), the routing pipeline step is selected as none, the routing process is from the packing transaction.
```

<a id="b02277"></a>
## b02277 — word/document\.xml/body/\*\[2277\]

```text
Order Planning strategies
```

<a id="b02278"></a>
## b02278 — word/document\.xml/body/\*\[2278\]

```text
Order Planning Strategy	Order Selection 	Order Planning Schedule
LE Singles Stream	Order Type equal to “CUSTREGORD” and Single Line Order is true and Single Unit is true and Order. Extended Is Gift Box Indicator = false	20 minutes scheduled job
LE Hot Orders Stream	Order Type equal “CUSTREGORD”  and Order Extended Hot Order is true	20 minutes scheduled job (to catch any auto wave deselection) 
Dropping Stream for SCI Alert
LE Hot Orders Wave	Order Type equal “CUSTREGORD”  and Order Extended Hot Order is true	Auto trigger 1 minutes after order is created.
LE VAS Large and Singles Orders Wave	Order Type = “CUSTVASORD” and Order Extended Fulfillment Code is “L” OR “S”	Auto trigger 1 minutes after order is created.
LE VAS Large and Singles Orders Stream	Order Type = “CUSTVASORD” and Order Extended Fulfillment Code is “L” OR “S”	20 minutes scheduled job (to catch any auto wave deselection)
```

<a id="b02279"></a>
## b02279 — word/document\.xml/body/\*\[2279\]

```text

```

<a id="b02280"></a>
## b02280 — word/document\.xml/body/\*\[2280\]

```text


```

<a id="b02281"></a>
## b02281 — word/document\.xml/body/\*\[2281\]

```text
Production Order Wave
```

<a id="b02282"></a>
## b02282 — word/document\.xml/body/\*\[2282\]

```text
Production order planning is the Order planning strategy used to schedule multiple production orders, either manually or via a job schedule. When an order meets specific selection criteria, the planning process generates HM sorter batches.
```

<a id="b02283"></a>
## b02283 — word/document\.xml/body/\*\[2283\]

```text
Note: “Production Order” routing strategy is selected to plan outsource shipments during waving.
```

<a id="b02284"></a>
## b02284 — word/document\.xml/body/\*\[2284\]

```text
Order Planning strategies
```

<a id="b02285"></a>
## b02285 — word/document\.xml/body/\*\[2285\]

```text
Order Planning Strategy	Order Selection	Schedule
LE Production Orders Wave	(Order Type IS “PRODHEM” OR “PRODMONO” 
OR
Order Enterprise Code is not null 
OR
( (
    Order Fulfillment Code is not equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is true)
  ))
)
AND DestinationFacilityId  is not null 
	
11:00 PM CDT
 2:00 AM CDT
 5:00 AM CDT
  8:00 AM CDT
11:00 AM CDT
  2:00 PM CDT
  5:00 PM CDT
  8:00 PM CDT
```

<a id="b02286"></a>
## b02286 — word/document\.xml/body/\*\[2286\]

```text

```

<a id="b02287"></a>
## b02287 — word/document\.xml/body/\*\[2287\]

```text
Retail Wave
```

<a id="b02288"></a>
## b02288 — word/document\.xml/body/\*\[2288\]

```text
Store Order Planning is executed to perform bulk allocation and distribute the allocations through store pack locations based on product merchant groups.
```

<a id="b02289"></a>
## b02289 — word/document\.xml/body/\*\[2289\]

```text
Note: OPS is configured to not lock the Order for further aggregation when it is selected. Routing during the planning run (wave) is not required, the routing pipeline step is selected as none, the routing process is triggered from the packing transaction for parcel orders.
```

<a id="b02290"></a>
## b02290 — word/document\.xml/body/\*\[2290\]

```text
Order Planning strategies
```

<a id="b02291"></a>
## b02291 — word/document\.xml/body/\*\[2291\]

```text
Order Planning Strategy 	Order Selection Rules	Schedule
LE Retail Wave	Order Type equal to STORORD and RPLNORD	Every 30 Minutes 
```

<a id="b02292"></a>
## b02292 — word/document\.xml/body/\*\[2292\]

```text

```

<a id="b02293"></a>
## b02293 — word/document\.xml/body/\*\[2293\]

```text


```

<a id="b02294"></a>
## b02294 — word/document\.xml/body/\*\[2294\]

```text
Truck Load Wave
```

<a id="b02295"></a>
## b02295 — word/document\.xml/body/\*\[2295\]

```text
Truck Load wave is used to plan orders that require a truckload carrier service, such as wholesale orders, transfer orders, charity orders, and liquidation orders.
```

<a id="b02296"></a>
## b02296 — word/document\.xml/body/\*\[2296\]

```text
Note: For Amazon, wholesale order, MAWM generates an shipment and Lands’ End shipping office updates it with information from Amazon web portal.
```

<a id="b02297"></a>
## b02297 — word/document\.xml/body/\*\[2297\]

```text
Order Planning strategies
```

<a id="b02298"></a>
## b02298 — word/document\.xml/body/\*\[2298\]

```text
Order Planning Strategy 	Order Selection Rules	Schedule
LE Truck Load Wave	Order Type equal Wholesale, Stock Transfer, Order Transfer, Charity orders and Liquidation Orders	
11:00 PM CDT
 2:00 AM CDT
 5:00 AM CDT
  8:00 AM CDT
11:00 AM CDT
  2:00 PM CDT
  5:00 PM CDT
  8:00 PM CDT
```

<a id="b02299"></a>
## b02299 — word/document\.xml/body/\*\[2299\]

```text

```

<a id="b02300"></a>
## b02300 — word/document\.xml/body/\*\[2300\]

```text
Chase Order Planning
```

<a id="b02301"></a>
## b02301 — word/document\.xml/body/\*\[2301\]

```text
Order Planning strategies
```

<a id="b02302"></a>
## b02302 — word/document\.xml/body/\*\[2302\]

```text
Order Planning Strategy 	Order Selection Rules	Schedule
LE Chase Wave	Customer Orders, VAS Customer Orders, Production Orders	  
7 AM CST
10 AM CST
  1 PM CST
  4 PM CST
  8 PM CST

LE Chase Hot Orders		Every 5 minutes

```

<a id="b02303"></a>
## b02303 — word/document\.xml/body/\*\[2303\]

```text

```

<a id="b02304"></a>
## b02304 — word/document\.xml/body/\*\[2304\]

```text
Fill and Kill Order Planning
```

<a id="b02305"></a>
## b02305 — word/document\.xml/body/\*\[2305\]

```text

```

<a id="b02306"></a>
## b02306 — word/document\.xml/body/\*\[2306\]

```text
Order Planning Strategy 	Order Selection Rules	Schedule
LE Fill and Kill Strategy	Order Minimum Status = Released and Order Maximum status > Released  and Order Type Not equal to “VAS Customer Orders”	  
10 PM CST
	Order Minimum Status = Released and Order Maximum status > Released  and Order Type Not equal to “VAS Customer Orders” and Order Days from Creation Date is great than 15 days 	
```

<a id="b02307"></a>
## b02307 — word/document\.xml/body/\*\[2307\]

```text

```

<a id="b02308"></a>
## b02308 — word/document\.xml/body/\*\[2308\]

```text
User Stories
```

<a id="b02309"></a>
## b02309 — word/document\.xml/body/\*\[2309\]

```text
User Story: Run Wave (Order Planning Strategy)
```

<a id="b02310"></a>
## b02310 — word/document\.xml/body/\*\[2310\]

```text
Who	What	Why
Wave Planner	Initiate Waving Process	Select and allocation orders for fulfillment
```

<a id="b02311"></a>
## b02311 — word/document\.xml/body/\*\[2311\]

```text

```

<a id="b02312"></a>
## b02312 — word/document\.xml/body/\*\[2312\]

```text
Process
```

<a id="b02313"></a>
## b02313 — word/document\.xml/body/\*\[2313\]

```text
User logs into MAWM UI and navigates to the Order Planning Strategy UI
```

<a id="b02314"></a>
## b02314 — word/document\.xml/body/\*\[2314\]

```text
User selects the appropriate Order Planning Strategy to run based on the planned schedule 
```

<a id="b02315"></a>
## b02315 — word/document\.xml/body/\*\[2315\]

```text
User selects ‘Run Wave’
```

<a id="b02316"></a>
## b02316 — word/document\.xml/body/\*\[2316\]

```text
Updates
```

<a id="b02317"></a>
## b02317 — word/document\.xml/body/\*\[2317\]

```text

```

<a id="b02318"></a>
## b02318 — word/document\.xml/body/\*\[2318\]

```text
Orders are Selected
```

<a id="b02319"></a>
## b02319 — word/document\.xml/body/\*\[2319\]

```text
Orders are allocated
```

<a id="b02320"></a>
## b02320 — word/document\.xml/body/\*\[2320\]

```text
Replenishment allocations are created, if necessary
```

<a id="b02321"></a>
## b02321 — word/document\.xml/body/\*\[2321\]

```text
oLPNs are cubed (Only for non-Store Waves)
```

<a id="b02322"></a>
## b02322 — word/document\.xml/body/\*\[2322\]

```text
Work is created (Batches)
```

<a id="b02323"></a>
## b02323 — word/document\.xml/body/\*\[2323\]

```text
User Story: Run Wave (Orders UI)
```

<a id="b02324"></a>
## b02324 — word/document\.xml/body/\*\[2324\]

```text

```

<a id="b02325"></a>
## b02325 — word/document\.xml/body/\*\[2325\]

```text
Who	What	Why
Wave Planner	Initiate Waving Process by Order	Select and allocation orders for fulfillment
```

<a id="b02326"></a>
## b02326 — word/document\.xml/body/\*\[2326\]

```text

```

<a id="b02327"></a>
## b02327 — word/document\.xml/body/\*\[2327\]

```text
Process
```

<a id="b02328"></a>
## b02328 — word/document\.xml/body/\*\[2328\]

```text
User logs into MAWM UI and navigates to the Orders UI
```

<a id="b02329"></a>
## b02329 — word/document\.xml/body/\*\[2329\]

```text
User searches for specific order or orders and selects the required orders
```

<a id="b02330"></a>
## b02330 — word/document\.xml/body/\*\[2330\]

```text
User selects ‘Run Wave’
```

<a id="b02331"></a>
## b02331 — word/document\.xml/body/\*\[2331\]

```text
Updates
```

<a id="b02332"></a>
## b02332 — word/document\.xml/body/\*\[2332\]

```text
Orders are Selected
```

<a id="b02333"></a>
## b02333 — word/document\.xml/body/\*\[2333\]

```text
Orders are allocated
```

<a id="b02334"></a>
## b02334 — word/document\.xml/body/\*\[2334\]

```text
Replenishment allocations are created, if necessary
```

<a id="b02335"></a>
## b02335 — word/document\.xml/body/\*\[2335\]

```text
oLPNs are cubed
```

<a id="b02336"></a>
## b02336 — word/document\.xml/body/\*\[2336\]

```text
Work is created (Batches)
```

<a id="b02337"></a>
## b02337 — word/document\.xml/body/\*\[2337\]

```text

```

<a id="b02338"></a>
## b02338 — word/document\.xml/body/\*\[2338\]

```text


```

<a id="b02339"></a>
## b02339 — word/document\.xml/body/\*\[2339\]

```text
User Story: Release Batches 
```

<a id="b02340"></a>
## b02340 — word/document\.xml/body/\*\[2340\]

```text
Who	What	Why
Work Planner	Release work to the floor	Select work to release to the floor manually determined by available labor and resources
```

<a id="b02341"></a>
## b02341 — word/document\.xml/body/\*\[2341\]

```text

```

<a id="b02342"></a>
## b02342 — word/document\.xml/body/\*\[2342\]

```text
Process
```

<a id="b02343"></a>
## b02343 — word/document\.xml/body/\*\[2343\]

```text
User logs into MAWM UI and navigates to the Batch List UI
```

<a id="b02344"></a>
## b02344 — word/document\.xml/body/\*\[2344\]

```text
User searches for Batches in a ‘Held for Tasking’ status
```

<a id="b02345"></a>
## b02345 — word/document\.xml/body/\*\[2345\]

```text
User selects the appropriate Batches to release
```

<a id="b02346"></a>
## b02346 — word/document\.xml/body/\*\[2346\]

```text
User selects ‘Release
```

<a id="b02347"></a>
## b02347 — word/document\.xml/body/\*\[2347\]

```text

```

<a id="b02348"></a>
## b02348 — word/document\.xml/body/\*\[2348\]

```text
Updates
```

<a id="b02349"></a>
## b02349 — word/document\.xml/body/\*\[2349\]

```text
Batch is Released for Tasking
```

<a id="b02350"></a>
## b02350 — word/document\.xml/body/\*\[2350\]

```text
Tasks are created
```

<a id="b02351"></a>
## b02351 — word/document\.xml/body/\*\[2351\]

```text
Task Release MHE message sent to MHE
```

<a id="b02352"></a>
## b02352 — word/document\.xml/body/\*\[2352\]

```text
Note: Batches are configured for automatic release based on the sorting progress, as defined in AU04.
```

<a id="b02353"></a>
## b02353 — word/document\.xml/body/\*\[2353\]

```text
User Story: Pre-VAS Batch and Task Label Printing
```

<a id="b02354"></a>
## b02354 — word/document\.xml/body/\*\[2354\]

```text
Who	What	Why
Pre VAS Wave Planner	Print Batch and Task Labels for Production Orders.	Print Task Labels for production order picking tasks.
```

<a id="b02355"></a>
## b02355 — word/document\.xml/body/\*\[2355\]

```text

```

<a id="b02356"></a>
## b02356 — word/document\.xml/body/\*\[2356\]

```text
Lands' End will configure a batch print strategy to print the Pre-VAS HM Sorter Batch and Picking Tasks between batches. This strategy will also print the remaining picking tasks generated during the Order Planning run (wave), such as VAS LPN Pull and VAS Blk Pick tasks. 
```

<a id="b02357"></a>
## b02357 — word/document\.xml/body/\*\[2357\]

```text
Labels are printed after work release by the Pre-VAS Order Planning Manager.  The manager reviews the Pre-VAS wave runs for the day, selects a completed wave from the "Wave Runs" UI, and clicks "Print Documents" from the "More" menu in the screen's upper right corner.
```

<a id="b02358"></a>
## b02358 — word/document\.xml/body/\*\[2358\]

```text
A “Pre-VAS Labels” batch print strategy is created with the following two batch print criteria.
```

<a id="b02359"></a>
## b02359 — word/document\.xml/body/\*\[2359\]

```text
Batch Criteria	Selection Rules	Labels (Batch Print Criteria Details)
HM Sorter Labels	Transaction Id is HM LPN Pull or HM Blk Pick	1 - Batch Label (Start and End)
2 - Task Label
Pre-VAS Bulk Picks	Transaction Id is VAS LPN Pull or VAS Blk Pick	1 - Task Label (Start Label Only)
```

<a id="b02360"></a>
## b02360 — word/document\.xml/body/\*\[2360\]

```text

```

<a id="b02361"></a>
## b02361 — word/document\.xml/body/\*\[2361\]

```text
Assumption 
```

<a id="b02362"></a>
## b02362 — word/document\.xml/body/\*\[2362\]

```text
The batch and task label payload is enriched with the additional information required to drive the VAS process. [WM26]
```

<a id="b02363"></a>
## b02363 — word/document\.xml/body/\*\[2363\]

```text
Lands' End owns the batch and task label layout after the label payload is enriched.
```

<a id="b02364"></a>
## b02364 — word/document\.xml/body/\*\[2364\]

```text


```

<a id="b02365"></a>
## b02365 — word/document\.xml/body/\*\[2365\]

```text
Process
```

<a id="b02366"></a>
## b02366 — word/document\.xml/body/\*\[2366\]

```text
User logs into the MAWM UI and navigates to the "Wave Runs" UI.
```

<a id="b02367"></a>
## b02367 — word/document\.xml/body/\*\[2367\]

```text
User searches for Production Orders for the required wave date using the Filter sidebar.
```

<a id="b02368"></a>
## b02368 — word/document\.xml/body/\*\[2368\]

```text
User selects the appropriate Production Order Wave Run in "Completed" status.
```

<a id="b02369"></a>
## b02369 — word/document\.xml/body/\*\[2369\]

```text
User selects the More button from the bottom-right command bar.
```

<a id="b02370"></a>
## b02370 — word/document\.xml/body/\*\[2370\]

```text
User selects the "Print Documents" menu option.
```

<a id="b02371"></a>
## b02371 — word/document\.xml/body/\*\[2371\]

```text
User selects the "Pre-VAS Printing Strategy" and clicks "Submit" to print all Pre-VAS Batch and Task labels associated with the selected wave to the current user's default printer. Alternatively, the user can specify the desired print location by selecting the appropriate parameters from the Printing Document Prompt UI.
```

<a id="b02372"></a>
## b02372 — word/document\.xml/body/\*\[2372\]

```text
Updates
```

<a id="b02373"></a>
## b02373 — word/document\.xml/body/\*\[2373\]

```text
Labels are printed based on the selected batch print strategy.
```

<a id="b02374"></a>
## b02374 — word/document\.xml/body/\*\[2374\]

```text
Features
```

<a id="b02375"></a>
## b02375 — word/document\.xml/body/\*\[2375\]

```text
Undo Wave
```

<a id="b02376"></a>
## b02376 — word/document\.xml/body/\*\[2376\]

```text
If a wave was incorrectly configured or did not select all the anticipated orders, then a wave should be stopped. This is not intended to be a daily tool as it is resource intensive to revert all waving updates and is generally used when there is no other recourse. If/when required, all users should back out of tasks generated by the wave that will be undone. The undo process will not kick a user out of a task automatically, so all work on that wave needs to stop prior to running undo. If there are oLPNs already picked/packed with inventory, those will be converted to iLPNs for simplified putaway. It is recommended, however, that Undo Wave is not initiated once picking for the wave begins. 
```

<a id="b02377"></a>
## b02377 — word/document\.xml/body/\*\[2377\]

```text
End Work
```

<a id="b02378"></a>
## b02378 — word/document\.xml/body/\*\[2378\]

```text
Lands’ End uses an "End Action" to cancel and deallocate all unpacked orders from a specific wave. This action is initiated from “Wave Runs” UI when a unit sorter goes out of service after a work order has been released. Once all open packing work is concluded, Lands’ End moves the inducted products to a storage location and initiates a new wave for one of the available unit sorters to generate new picking and packing work.
```

<a id="b02379"></a>
## b02379 — word/document\.xml/body/\*\[2379\]

```text
Key Interfaces
```

<a id="b02380"></a>
## b02380 — word/document\.xml/body/\*\[2380\]

```text
Interface	Business Scenario
Original Order	Provides facility direction with the SKU and quantity that needs to be shipped to the specified destination. Business object that is waved.
```

<a id="b02381"></a>
## b02381 — word/document\.xml/body/\*\[2381\]

```text

```

<a id="b02382"></a>
## b02382 — word/document\.xml/body/\*\[2382\]

```text
Reports, Dashboards, Alerts
```

<a id="b02383"></a>
## b02383 — word/document\.xml/body/\*\[2383\]

```text
Name	Description	Frequency	User/Dept	Type
Deselected & Canceled Orders	Details orders that have a shortage or cancellation at the time of allocation	As needed	Wave Control	SCI Report
Aged Orders in created or released status	Details orders (customer and transfer) and the amount of time they have been unwaved.	As needed	Wave Control	SCI Report
Rate Shopping Validation Report 	Provide an overview of planned Parcel Order post rate shopping 	As needed	Shipping Team	SCI Report
Hot Orders Deselects Alerts	Sends an alert when a hot order deselects from an AutoWave	Per Instance	Wave Control	SCI Report
HM Sorter Estimates Gurney and Tote Volumes	Provide an overview of the expected volumes per HM Sorter chute based on the current Sort Divert Assignments.	As needed	Pre-VAS Operational Team	SCI Report
```

<a id="b02384"></a>
## b02384 — word/document\.xml/body/\*\[2384\]

```text
Gaps and Extensions
```

<a id="b02385"></a>
## b02385 — word/document\.xml/body/\*\[2385\]

```text
Gap #	Name	Description
WM26	Task Label Payload Enrichment	Enrich the batch and task label payload with additional base and extended attributes used during the Value-Added Services (VAS) process lifecycle.
```

<a id="b02386"></a>
## b02386 — word/document\.xml/body/\*\[2386\]

```text

```

<a id="b02387"></a>
## b02387 — word/document\.xml/body/\*\[2387\]

```text
Labor Management
```

<a id="b02388"></a>
## b02388 — word/document\.xml/body/\*\[2388\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b02389"></a>
## b02389 — word/document\.xml/body/\*\[2389\]

```text


```

<a id="b02390"></a>
## b02390 — word/document\.xml/body/\*\[2390\]

```text
Allocation
```

<a id="b02391"></a>
## b02391 — word/document\.xml/body/\*\[2391\]

```text
Allocation is the process by which WM determines the storage location and inventory quantity pulled from to fulfill an order. Using a rules-based framework, Lands’ End can define how MAWM prioritizes/searches for inventory. Lands’ End can configure which zones to consider within a particular rule, as well as how to prioritize inventory within that rule. For example, WM can be configured to allocate using a method of FIFO for items that track expiration date and use an Ascending Quantity allocation method for other items. 
```

<a id="b02392"></a>
## b02392 — word/document\.xml/body/\*\[2392\]

```text
If there is not enough inventory to fulfill the order, WM can be configured to allocate partially and cancel the remaining need, allocate partially and deselect remaining need, deselect entire order need or cancel entire order need. This is a configurable setting within the Allocation Strategy as part of the order criteria rules, meaning different orders can be handled differently if Lands’ End chooses (e.g., Kohl’s LEF orders cancel the entire need vs. USCD orders allocate partially and cancel the remaining need). If the wave cancels any quantity on a line, that quantity is not eligible for further re-allocation from the chase process and will be communicated as shorted quantity back up to Host as an order update PIX and when the ship confirm is generated. If an entire order quantity is canceled at the time of allocation, the ship confirmation is sent instantly to the Host system. 
```

<a id="b02393"></a>
## b02393 — word/document\.xml/body/\*\[2393\]

```text
Lands’ End may also define an allocation strategy to run a ‘fill or kill’ wave, where any order that is selected in the wave is canceled if inventory is not sufficient in the warehouse to fulfill the order. The scenario where backorders exist in MAWM and an ASN with the inventory to fulfill those orders is late of canceled, a ‘fill or kill’ wave may be run to cancel these orders and re-send to EOM. 
```

<a id="b02394"></a>
## b02394 — word/document\.xml/body/\*\[2394\]

```text
Assumptions
```

<a id="b02395"></a>
## b02395 — word/document\.xml/body/\*\[2395\]

```text
WM allocates UOMs of iLPNs and Units. No Pack or subpack allocations are in scope. 
```

<a id="b02396"></a>
## b02396 — word/document\.xml/body/\*\[2396\]

```text
Lands’ End uses 2 cubing methods – Cube to Capacity and Cube by UOM.
```

<a id="b02397"></a>
## b02397 — word/document\.xml/body/\*\[2397\]

```text
The item dimensions maintained in WM are accurate to support cubing.
```

<a id="b02398"></a>
## b02398 — word/document\.xml/body/\*\[2398\]

```text
WM does not perform order rounding with the wave. 
```

<a id="b02399"></a>
## b02399 — word/document\.xml/body/\*\[2399\]

```text
WM does not perform item substitution with the wave. 
```

<a id="b02400"></a>
## b02400 — word/document\.xml/body/\*\[2400\]

```text
Operations is responsible for undoing waves or undoing orders from waves in the appropriate timeframe.
```

<a id="b02401"></a>
## b02401 — word/document\.xml/body/\*\[2401\]

```text
Lands’ End does not have multi piece shipments, where 2 packages are bound together and shipped together using shipping label. 
```

<a id="b02402"></a>
## b02402 — word/document\.xml/body/\*\[2402\]

```text
Strategies
```

<a id="b02403"></a>
## b02403 — word/document\.xml/body/\*\[2403\]

```text
Unit Sorter Allocation Strategy
```

<a id="b02404"></a>
## b02404 — word/document\.xml/body/\*\[2404\]

```text
A unit sorter allocation strategy is defined for each unit sorter induction point, as shown in the table below.
```

<a id="b02405"></a>
## b02405 — word/document\.xml/body/\*\[2405\]

```text
Order Selection Criteria
```

<a id="b02406"></a>
## b02406 — word/document\.xml/body/\*\[2406\]

```text
Allocation Strategy & Order Criteria	Bulk Allocation Group By	Shortage Option
SA	By Run ID, Order Criteria and Inventory Criteria	Deselect need
SB	By Run ID, Order Criteria and Inventory Criteria	Deselect need
HM06	By Run ID, Order Criteria and Inventory Criteria	Deselect need
HM07	By Run ID, Order Criteria and Inventory Criteria	Deselect need
SX	By Run ID, Order Criteria and Inventory Criteria	Deselect need
SX-10	By Run ID, Order Criteria and Inventory Criteria	Deselect need
SX-20-30	By Run ID, Order Criteria and Inventory Criteria	Deselect need
```

<a id="b02407"></a>
## b02407 — word/document\.xml/body/\*\[2407\]

```text

```

<a id="b02408"></a>
## b02408 — word/document\.xml/body/\*\[2408\]

```text
Note: The Order Selection is configured as a catch-all for Unit Sorter rule because the order selection occurs during the order planning process. Bulk allocation is grouped by Order and Inventory criteria to ensure it can be used by the Work release strategy across wave or stream runs.
```

<a id="b02409"></a>
## b02409 — word/document\.xml/body/\*\[2409\]

```text
Unit Sorter Inventory Criteria
```

<a id="b02410"></a>
## b02410 — word/document\.xml/body/\*\[2410\]

```text
The unit sorter inventory criteria are designed to enhance efficiency in picking and replenishment operations, particularly in high-demand environments requiring rapid, bulk inventory movements. By strategically configuring both bulk and non-bulk allocation methods, this approach optimizes the flow of goods to the unit sorter induction point, where items are prepared for sorting and distribution.
```

<a id="b02411"></a>
## b02411 — word/document\.xml/body/\*\[2411\]

```text
The criteria incorporate two key allocation types: Bulk Allocation and Non-Bulk Allocation.
```

<a id="b02412"></a>
## b02412 — word/document\.xml/body/\*\[2412\]

```text
Bulk Allocation: Full LPNs are pulled from reserve locations, minimizing the need for frequent replenishment trips. Items from active pick locations are picked in bulk into totes and efficiently routed to the unit sorter induction point. This process consolidates picking activities and reduces handling time.
```

<a id="b02413"></a>
## b02413 — word/document\.xml/body/\*\[2413\]

```text
Non-Bulk Allocation: When demand is lower than the quantity in a single LPN, this strategy ensures that loose pick locations are replenished efficiently. Replenishment is triggered only when necessary, balancing inventory availability with the goal of avoiding overstocking in pick locations.
```

<a id="b02414"></a>
## b02414 — word/document\.xml/body/\*\[2414\]

```text
The primary objective of these inventory criteria is to minimize replenishment trips to pick locations while maximizing the density of picks directed to the unit sorter induction point. This approach aligns with the unit sorter’s batch capacity constraints, enabling smoother operations and reducing potential bottlenecks. By effectively balancing bulk and non-bulk allocation, the strategy reduces labor costs, improves throughput, and enhances overall order fulfillment efficiency.
```

<a id="b02415"></a>
## b02415 — word/document\.xml/body/\*\[2415\]

```text
Inventory Zone Allocation Source Priorities 
```

<a id="b02416"></a>
## b02416 — word/document\.xml/body/\*\[2416\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Initiate Replenishment?	Replenishment Required?
Case Pick	No	Ascending by Inventory Quantity	LPN	Bulk	No	Yes	Yes
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Bulk	No	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Bulk	No	Yes	Yes
```

<a id="b02417"></a>
## b02417 — word/document\.xml/body/\*\[2417\]

```text

```

<a id="b02418"></a>
## b02418 — word/document\.xml/body/\*\[2418\]

```text

```

<a id="b02419"></a>
## b02419 — word/document\.xml/body/\*\[2419\]

```text


```

<a id="b02420"></a>
## b02420 — word/document\.xml/body/\*\[2420\]

```text
Customer Order Allocation Strategy (Non MHE)
```

<a id="b02421"></a>
## b02421 — word/document\.xml/body/\*\[2421\]

```text
The customer order wave allocation strategy allocates bulk case from reserve for singles, full cases for an order from reserve and loose units from pick locations with a pick cart. 
```

<a id="b02422"></a>
## b02422 — word/document\.xml/body/\*\[2422\]

```text
Order Selection Criteria
```

<a id="b02423"></a>
## b02423 — word/document\.xml/body/\*\[2423\]

```text

```

<a id="b02424"></a>
## b02424 — word/document\.xml/body/\*\[2424\]

```text
Allocation Strategy 	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Customer Orders	Singles (Non VAS)	Order Criteria and Inventory Criteria	Deselect need
	Multi Lines & Multi Units Customer Orders and VAS Orders	Do not group	Deselect need
```

<a id="b02425"></a>
## b02425 — word/document\.xml/body/\*\[2425\]

```text

```

<a id="b02426"></a>
## b02426 — word/document\.xml/body/\*\[2426\]

```text
Singles Inventory Criteria (Non VAS)
```

<a id="b02427"></a>
## b02427 — word/document\.xml/body/\*\[2427\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Singles Bulk	No	No
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Non Bulk	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Non Bulk	No	Yes
```

<a id="b02428"></a>
## b02428 — word/document\.xml/body/\*\[2428\]

```text

```

<a id="b02429"></a>
## b02429 — word/document\.xml/body/\*\[2429\]

```text
Multi Line & Multi Units Customer Orders and VAS Orders Inventory Criteria
```

<a id="b02430"></a>
## b02430 — word/document\.xml/body/\*\[2430\]

```text

```

<a id="b02431"></a>
## b02431 — word/document\.xml/body/\*\[2431\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Non Bulk	No	No
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Non Bulk	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Non Bulk	No	Yes
```

<a id="b02432"></a>
## b02432 — word/document\.xml/body/\*\[2432\]

```text

```

<a id="b02433"></a>
## b02433 — word/document\.xml/body/\*\[2433\]

```text


```

<a id="b02434"></a>
## b02434 — word/document\.xml/body/\*\[2434\]

```text
Retail Allocation Strategy
```

<a id="b02435"></a>
## b02435 — word/document\.xml/body/\*\[2435\]

```text

```

<a id="b02436"></a>
## b02436 — word/document\.xml/body/\*\[2436\]

```text
The Retail Allocation Strategy is used to perform full LPN allocations from reserve locations. Any remaining balance is allocated from loose pick locations after replenishment. This strategy is used with LE Retail Wave Order Planning Strategy.
```

<a id="b02437"></a>
## b02437 — word/document\.xml/body/\*\[2437\]

```text
Order Selection Criteria
```

<a id="b02438"></a>
## b02438 — word/document\.xml/body/\*\[2438\]

```text
Allocation Strategy 	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Retail Allocation	Bulk Allocation 	By Run ID, Order Criteria and Inventory Criteria	Allocate partially and deselect remaining need
```

<a id="b02439"></a>
## b02439 — word/document\.xml/body/\*\[2439\]

```text

```

<a id="b02440"></a>
## b02440 — word/document\.xml/body/\*\[2440\]

```text
Retail Inventory Criteria 
```

<a id="b02441"></a>
## b02441 — word/document\.xml/body/\*\[2441\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Bulk	No	No
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Bulk	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Bulk	No	Yes
```

<a id="b02442"></a>
## b02442 — word/document\.xml/body/\*\[2442\]

```text

```

<a id="b02443"></a>
## b02443 — word/document\.xml/body/\*\[2443\]

```text
Production Orders Allocation Strategy (Non MHE)  
```

<a id="b02444"></a>
## b02444 — word/document\.xml/body/\*\[2444\]

```text
The Bulk Allocation Strategy is used to perform bulk LPN allocations from reserve locations. Any remaining balance is allocated from loose pick locations after replenishment. This strategy is used with the “LE Production Order Wave” Order planning Strategy.
```

<a id="b02445"></a>
## b02445 — word/document\.xml/body/\*\[2445\]

```text
Order Selection Criteria
```

<a id="b02446"></a>
## b02446 — word/document\.xml/body/\*\[2446\]

```text
Allocation Strategy 	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
LE Production Order Non MHE Allocation	LE Production Order Non MHE 	By Run ID, Order Criteria and Inventory Criteria	Allocate partially and deselect remaining need
```

<a id="b02447"></a>
## b02447 — word/document\.xml/body/\*\[2447\]

```text
LE Production Order Non MHE Inventory Criteria 
```

<a id="b02448"></a>
## b02448 — word/document\.xml/body/\*\[2448\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Case Pick	No	Ascending by Inventory Quantity	LPN	Bulk	No	Yes
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Non Bulk	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Non Bulk	No	Yes
```

<a id="b02449"></a>
## b02449 — word/document\.xml/body/\*\[2449\]

```text

```

<a id="b02450"></a>
## b02450 — word/document\.xml/body/\*\[2450\]

```text
Truck Load Allocation Strategy
```

<a id="b02451"></a>
## b02451 — word/document\.xml/body/\*\[2451\]

```text
The Truck Load Allocation Strategy is designed to streamline the pick-and-pack process for shipments. This strategy begins by allocating full LPNs from reserve locations, allowing them to be shipped directly in their current packaging, which reduces handling and maintains packaging efficiency. Any remaining order demand is then fulfilled from loose pick locations. This strategy is used with truck load order planning for wholesale orders, transfer orders, and donation orders. 
```

<a id="b02452"></a>
## b02452 — word/document\.xml/body/\*\[2452\]

```text
Order Selection Criteria
```

<a id="b02453"></a>
## b02453 — word/document\.xml/body/\*\[2453\]

```text
Allocation Strategy 	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Truck Load Allocation	Truck Load 	Do not group	Allocate Partial and Cancel Remaining
```

<a id="b02454"></a>
## b02454 — word/document\.xml/body/\*\[2454\]

```text
Inventory Criteria
```

<a id="b02455"></a>
## b02455 — word/document\.xml/body/\*\[2455\]

```text
The following inventory criteria and rule is defined for Truck load allocations.
```

<a id="b02456"></a>
## b02456 — word/document\.xml/body/\*\[2456\]

```text
Criteria	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Stock Transfer 	Order Type = Stock Transfer 	Do not group	Allocate Partial and Cancel Remaining
```

<a id="b02457"></a>
## b02457 — word/document\.xml/body/\*\[2457\]

```text

```

<a id="b02458"></a>
## b02458 — word/document\.xml/body/\*\[2458\]

```text
Each criteria is configured to allocate the product in the following zone priorities
```

<a id="b02459"></a>
## b02459 — word/document\.xml/body/\*\[2459\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Non Bulk	No	No
```

<a id="b02460"></a>
## b02460 — word/document\.xml/body/\*\[2460\]

```text

```

<a id="b02461"></a>
## b02461 — word/document\.xml/body/\*\[2461\]

```text
The following  inventory criteria and  rule is defined for Truck load allocations.
```

<a id="b02462"></a>
## b02462 — word/document\.xml/body/\*\[2462\]

```text
Criteria	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Catch All 	Catch All	Do not group	Allocate Partial and Cancel Remaining
```

<a id="b02463"></a>
## b02463 — word/document\.xml/body/\*\[2463\]

```text

```

<a id="b02464"></a>
## b02464 — word/document\.xml/body/\*\[2464\]

```text
Each criteria is configured to allocate the product in the following zone priorities
```

<a id="b02465"></a>
## b02465 — word/document\.xml/body/\*\[2465\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Non Bulk	No	No
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Non Bulk	No	No
Active / Loose Pick	No	Ascending by Inventory Quantity	UNIT	Non Bulk	No	Yes
```

<a id="b02466"></a>
## b02466 — word/document\.xml/body/\*\[2466\]

```text

```

<a id="b02467"></a>
## b02467 — word/document\.xml/body/\*\[2467\]

```text


```

<a id="b02468"></a>
## b02468 — word/document\.xml/body/\*\[2468\]

```text
Chase Allocation Strategy
```

<a id="b02469"></a>
## b02469 — word/document\.xml/body/\*\[2469\]

```text
The Loose Pick Allocation Strategy is specifically designed for Cart Picking order planning. This strategy exclusively allocates individual items from loose pick locations and automatically generates replenishment requests based on the demand identified during the order planning run (wave).
```

<a id="b02470"></a>
## b02470 — word/document\.xml/body/\*\[2470\]

```text
Order Selection Criteria 
```

<a id="b02471"></a>
## b02471 — word/document\.xml/body/\*\[2471\]

```text
Allocation Strategy & Order Criteria	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Chase Allocations 	Catch All 	Do not group	Allocate partially and cancel remaining need
```

<a id="b02472"></a>
## b02472 — word/document\.xml/body/\*\[2472\]

```text

```

<a id="b02473"></a>
## b02473 — word/document\.xml/body/\*\[2473\]

```text
Chase Pick Inventory Criteria
```

<a id="b02474"></a>
## b02474 — word/document\.xml/body/\*\[2474\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Reserve	Yes	Ascending by Inventory Quantity	LPN	Singles Bulk	No	No
Randoms	Yes	Ascending by Inventory Quantity	UNIT	Non Bulk	No	No
Regular Active (Multiples Zones defined in priority seq.)	No	Ascending by Inventory Quantity	UNIT	Non Bulk	No	Yes
```

<a id="b02475"></a>
## b02475 — word/document\.xml/body/\*\[2475\]

```text

```

<a id="b02476"></a>
## b02476 — word/document\.xml/body/\*\[2476\]

```text
Fill and Kill Allocation Strategy 
```

<a id="b02477"></a>
## b02477 — word/document\.xml/body/\*\[2477\]

```text
Order Selection Criteria 
```

<a id="b02478"></a>
## b02478 — word/document\.xml/body/\*\[2478\]

```text
Allocation Strategy & Order Criteria	Order Criteria Rule	Bulk Allocation Group By	Shortage Option
Fill  and Kill  	Catch All 	Do not group	Allocate partially and cancel remaining need
```

<a id="b02479"></a>
## b02479 — word/document\.xml/body/\*\[2479\]

```text

```

<a id="b02480"></a>
## b02480 — word/document\.xml/body/\*\[2480\]

```text
Chase Pick Inventory Criteria
```

<a id="b02481"></a>
## b02481 — word/document\.xml/body/\*\[2481\]

```text
Allocation Zone	Allocate on-hand Only?	Allocation Method	UOM	Process Bulk	Exceed by whole UOM	Replenishment Required?
Dummy Zone	Yes	Ascending by Inventory Quantity	Unit	Non Bulk	No	No
```

<a id="b02482"></a>
## b02482 — word/document\.xml/body/\*\[2482\]

```text

```

<a id="b02483"></a>
## b02483 — word/document\.xml/body/\*\[2483\]

```text
Reports, Dashboards, Alerts
```

<a id="b02484"></a>
## b02484 — word/document\.xml/body/\*\[2484\]

```text
Name	Description	Frequency	User/Dept	Type
Post VAS Singles not fully  Allocated 	Details of single VAS customer not allocated post receiving.	Scheduled	Wave Control	SCI Email Report 
```

<a id="b02485"></a>
## b02485 — word/document\.xml/body/\*\[2485\]

```text
Gaps and Extensions
```

<a id="b02486"></a>
## b02486 — word/document\.xml/body/\*\[2486\]

```text
Gap #	Name	Description
 	 	 
```

<a id="b02487"></a>
## b02487 — word/document\.xml/body/\*\[2487\]

```text
Labor Management
```

<a id="b02488"></a>
## b02488 — word/document\.xml/body/\*\[2488\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b02489"></a>
## b02489 — word/document\.xml/body/\*\[2489\]

```text
Routing
```

<a id="b02490"></a>
## b02490 — word/document\.xml/body/\*\[2490\]

```text
Routing process determines the ship via (carrier, mode and service level) to be used to ship LPNs out of the warehouse. It can be invoked as part of both wave and stream modes of order planning strategy. Pipeline definition determines at what point an order should be routed. The routing component provides the ability to determine the routing template (routing wave parameter) based on user-defined rules.
```

<a id="b02491"></a>
## b02491 — word/document\.xml/body/\*\[2491\]

```text
TL/LTL Carrier/Service/Ship Via
```

<a id="b02492"></a>
## b02492 — word/document\.xml/body/\*\[2492\]

```text
The carrier, service level, and ship via below are created before the routing strategies, as they will be used for routing configuration.
```

<a id="b02493"></a>
## b02493 — word/document\.xml/body/\*\[2493\]

```text
Service Provider 
```

<a id="b02494"></a>
## b02494 — word/document\.xml/body/\*\[2494\]

```text
Service Provider Id: PVT
```

<a id="b02495"></a>
## b02495 — word/document\.xml/body/\*\[2495\]

```text
Service Provider Name: Private Truck
```

<a id="b02496"></a>
## b02496 — word/document\.xml/body/\*\[2496\]

```text
Transportation Carrier: Yes
```

<a id="b02497"></a>
## b02497 — word/document\.xml/body/\*\[2497\]

```text
SCAC: PVT
```

<a id="b02498"></a>
## b02498 — word/document\.xml/body/\*\[2498\]

```text
Auto Accept Tender: Yes
```

<a id="b02499"></a>
## b02499 — word/document\.xml/body/\*\[2499\]

```text
Allow Appointment Creation Outside of Shipment Stop Window.
```

<a id="b02500"></a>
## b02500 — word/document\.xml/body/\*\[2500\]

```text
Service Level
```

<a id="b02501"></a>
## b02501 — word/document\.xml/body/\*\[2501\]

```text
Service Level Id	Description	Shipping Mode
PVT_OCR	Outsource Truck Service	TL
PVT_TRORD	Transfer Order Truck Service	TL
PVT_ WHSL	Wholesale Truck Service	TL
PVT_ STOR	Store Truck Service	TL
```

<a id="b02502"></a>
## b02502 — word/document\.xml/body/\*\[2502\]

```text
Ship Via
```

<a id="b02503"></a>
## b02503 — word/document\.xml/body/\*\[2503\]

```text
Ship Via	Description	Carrier Id	Service Level Id	Mode
OCR	Outsource Truck Load	PVT	PVT_OCR	TL
TRORD	Transfer Order Truck Load	PVT	PVT_TRORD	TL
WHSL	Wholesale Truck Load	PVT	PVT_ WHSL	TL
STOR	Store Truck Load	PVT	PVT_STOR	TL
```

<a id="b02504"></a>
## b02504 — word/document\.xml/body/\*\[2504\]

```text

```

<a id="b02505"></a>
## b02505 — word/document\.xml/body/\*\[2505\]

```text
Store Orders Routing Strategy
```

<a id="b02506"></a>
## b02506 — word/document\.xml/body/\*\[2506\]

```text
Store orders are routed after packing using the "Parcel Routing Strategy". If a parcel resource determination criteria is matched for the packed OLPN, it gets added to the parcel manifest and a parcel shipping label is printed. Otherwise, the OLPN remains in "Packed" status and a generic label is printed. OLPNs that are not manifested are diverted by Matthew's shipping conveyor to an LTL/TL shipping lane, where a shipping associate anchors the OLPN to a pallet by Order ID. These are eventually planned into a shipment using the "Unified Logistics Control" (ULC) UI when the orders are ready to be loaded onto a truck.
```

<a id="b02507"></a>
## b02507 — word/document\.xml/body/\*\[2507\]

```text
Note: Lands' End can define static retail routes and has defined a "Retail Route Strategy" to be triggered post-packing to route OLPNs to parcel or a retail route. However, at the moment, the retail routes are not defined and are out of scope for the initial Dodgeville rollout.
```

<a id="b02508"></a>
## b02508 — word/document\.xml/body/\*\[2508\]

```text


```

<a id="b02509"></a>
## b02509 — word/document\.xml/body/\*\[2509\]

```text
Parcel Routing Strategy
```

<a id="b02510"></a>
## b02510 — word/document\.xml/body/\*\[2510\]

```text
Proship Routing Strategy is used with customer order packing transactions and is triggered after the shipping container (Olpn) is packed.  This strategy will only route orders that match the "Parcel Determination Strategy".
```

<a id="b02511"></a>
## b02511 — word/document\.xml/body/\*\[2511\]

```text
Parcel Determination Strategy
```

<a id="b02512"></a>
## b02512 — word/document\.xml/body/\*\[2512\]

```text
The parcel determination strategy define rules for Orders/LPN that qualify for the parcel. If they qualify, a response will include Parcel Rate Shop Group or a ShipVia used to perform a parcel ship request to Proship.
```

<a id="b02513"></a>
## b02513 — word/document\.xml/body/\*\[2513\]

```text
Parcel Resource
```

<a id="b02514"></a>
## b02514 — word/document\.xml/body/\*\[2514\]

```text
The parcel resource rules are used to update the OLPNs with a rate shop group ID or parcel ship via based on order attributes and selection rules. Below is a list of examples of currently defined rules.
```

<a id="b02515"></a>
## b02515 — word/document\.xml/body/\*\[2515\]

```text
Note: The Standard Priority Resource Criteria is configured as the primary criterion to be evaluated in the parcel determination strategy.
```

<a id="b02516"></a>
## b02516 — word/document\.xml/body/\*\[2516\]

```text
Parcel Resource Id	Selection Rule	Ship Via Id	Rate Shop Group Id
Standard	transportationUnit olpn Extended ParcelRateShopGroupId = 3 or Olpn.Order.Extended.Backorder = true		3
Express	transportationUnit olpn Extended ParcelRateShopGroupId = 1		1
Expedited	transportationUnit olpn ExtendedParcelRateShopGroupId = 2		2
Global E	Order.Extended.GlobalEOrder = true		<<ProShip Global E Rate Shop Group Id>>
PR-USPS Ground Advantage	 transportationUnit.olpn.serviceLevelId = "PR-Ground Advantage"  and transportationUnit.olpn.extended.BusinessUnit = "<< Applicable Business Unit>>" and 
transportationUnit.olpn.carrierId = "PR-USPS"	PR-USPS Ground Advantage	
PR-FEDX Home Delivery	transportationUnit.olpn.serviceLevelId = "PR-Home Delivery"  and transportationUnit.olpn.extended.BusinessUnit = "KOH" and 
transportationUnit.olpn.carrierId = "FEDX"	PR-FEDX Home Delivery	
PR-UPSN Priority Mail	transportationUnit.olpn.serviceLevelId = "PR-Priority Mail "  and transportationUnit.olpn.extended.BusinessUnit = "XXX" and 
transportationUnit.olpn.carrierId = "UPSN"	PR-UPSN Priority Mail	
PR-UPSN Parcel Select	transportationUnit.olpn.serviceLevelId = "PR- Parcel Select"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "UPSN"	PR-UPSN Parcel Select	
PR-USPS Priority	transportationUnit.olpn.serviceLevelId = "PR- Priority"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " USPS"	PR-USPS Priority	
PR-UPSN 2nd Day Air	transportationUnit.olpn.serviceLevelId = "PR-2nd Day Air"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " UPSN"	PR-UPSN 2nd Day Air	
PR-UPSN 3 Day Select	transportationUnit.olpn.serviceLevelId = "PR-3 Day Select"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " UPSN"	PR-UPSN 3 Day Select	
PR-UPSN Surepost	transportationUnit.olpn.serviceLevelId = "PR-Surepost "  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " UPSN"	PR-UPSN Surepost	
PR-UPSN Surepost Lightweight	transportationUnit.olpn.serviceLevelId = "PR-Surepost Lightweight"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " UPSN"
	PR-UPSN Surepost Lightweight	
PR-UPSN Ground	transportationUnit.olpn.serviceLevelId = "PR-Ground"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = " UPSN"
	PR-UPSN Ground	
PR-FEDX Standard Overnight	transportationUnit.olpn.serviceLevelId = "PR-Standard Overnight"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "FEDX"
	PR-FEDX Standard Overnight	
PR-FEDX 2 Day	transportationUnit.olpn.serviceLevelId = "PR-FEDX 2 Day"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "FEDX"
	PR-FEDX 2 Day	
PR-FEDX Express Saver	transportationUnit.olpn.serviceLevelId = "PR-FEDX Express Saver "  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "FEDX"
	PR-FEDX Express Saver	
PR-Fedx Ground	transportationUnit.olpn.serviceLevelId = "PR-Fedx Ground"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "FEDX"	PR-Fedx Ground	
PR-UPSN Next Day Air	transportationUnit.olpn.serviceLevelId = "PR-UPSN Next Day Air"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "UPSN"
	PR-UPSN Next Day Air	
PR-UPSN Next Day Air Saver	transportationUnit.olpn.serviceLevelId = "PR-UPSN Next Day Air Saver"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "UPSN"
	PR-UPSN Next Day Air Saver	
PR-USPS First Class Parcel	transportationUnit.olpn.serviceLevelId = " PR-USPS First Class Parcel "  and transportationUnit.olpn.extended.BusinessUnit = " XXX" and 
transportationUnit.olpn.carrierId = "UPSN"
	PR-USPS First Class Parcel	
PR-USPS FIRST CLASS	transportationUnit.olpn.serviceLevelId = "PR-USPS FIRST CLASS"  and transportationUnit.olpn.extended.BusinessUnit = " KOH" and 
transportationUnit.olpn.carrierId = "UPSN"
	PR-USPS FIRST CLASS	
```

<a id="b02517"></a>
## b02517 — word/document\.xml/body/\*\[2517\]

```text

```

<a id="b02518"></a>
## b02518 — word/document\.xml/body/\*\[2518\]

```text
Outsource Production Order Routing Strategy
```

<a id="b02519"></a>
## b02519 — word/document\.xml/body/\*\[2519\]

```text
The Outsource Production Order routing strategy is used with all production order planning strategies. This strategy will only route orders/OLPNs that match the "Routing Criteria" (Order.Extended.OutsourceVas = true); everything else remains unrouted.
```

<a id="b02520"></a>
## b02520 — word/document\.xml/body/\*\[2520\]

```text
Bypass Routing
```

<a id="b02521"></a>
## b02521 — word/document\.xml/body/\*\[2521\]

```text
A bypass routing criteria is used to exclude all “in-house” production orders from the routing process (Order.Extended.OutsourceVas = false).
```

<a id="b02522"></a>
## b02522 — word/document\.xml/body/\*\[2522\]

```text
Routing Criteria
```

<a id="b02523"></a>
## b02523 — word/document\.xml/body/\*\[2523\]

```text
If Orders/LPNs do not qualify for Bypass/Parcel/Static Route determination, Transportation Orders are created and Routing Criteria are used to evaluate order groupings and Transport Resource Groups.
```

<a id="b02524"></a>
## b02524 — word/document\.xml/body/\*\[2524\]

```text
Outsource Production Order Routing Criteria
```

<a id="b02525"></a>
## b02525 — word/document\.xml/body/\*\[2525\]

```text
The “Outsource Production Order Routing” criteria is used to plan outsource shipments at least by  Olpn.DestinationFacilityId, Olpn.PickupStartDateTime (When the truck will pick up the orders) . 
```

<a id="b02526"></a>
## b02526 — word/document\.xml/body/\*\[2526\]

```text
Alternative: Outsource shipment cand be created or modified using the “Unified Logistic Control” UI (ULC).
```

<a id="b02527"></a>
## b02527 — word/document\.xml/body/\*\[2527\]

```text
The criteria is configured with the following parameters:
```

<a id="b02528"></a>
## b02528 — word/document\.xml/body/\*\[2528\]

```text
Parameter Set : N/A (Keep as Select)
```

<a id="b02529"></a>
## b02529 — word/document\.xml/body/\*\[2529\]

```text
Add order(s) to existing shipment(s)? Yes (This will re-use shipment created on previous wave that matches the “Shipment Selection” criteria.
```

<a id="b02530"></a>
## b02530 — word/document\.xml/body/\*\[2530\]

```text
Orders can be added to existing shipments that have this status, or an earlier status. “Accepted”
```

<a id="b02531"></a>
## b02531 — word/document\.xml/body/\*\[2531\]

```text
Transport Resource Group Definition
```

<a id="b02532"></a>
## b02532 — word/document\.xml/body/\*\[2532\]

```text
Transport Resource Group: Outsource VAS Routing Plan
```

<a id="b02533"></a>
## b02533 — word/document\.xml/body/\*\[2533\]

```text
Equipment Type: Trailer
```

<a id="b02534"></a>
## b02534 — word/document\.xml/body/\*\[2534\]

```text
Mode: TL
```

<a id="b02535"></a>
## b02535 — word/document\.xml/body/\*\[2535\]

```text
Carrier : PVT (Generic Truck Carrier)
```

<a id="b02536"></a>
## b02536 — word/document\.xml/body/\*\[2536\]

```text
Service Level: Outsource Truck service 
```

<a id="b02537"></a>
## b02537 — word/document\.xml/body/\*\[2537\]

```text
Note: Ship Via OCR is created for carrier PVT and Service (Outsource Truck service)
```

<a id="b02538"></a>
## b02538 — word/document\.xml/body/\*\[2538\]

```text
Order Selection Rule
```

<a id="b02539"></a>
## b02539 — word/document\.xml/body/\*\[2539\]

```text
Order.Extended.OutsourceVas = true
```

<a id="b02540"></a>
## b02540 — word/document\.xml/body/\*\[2540\]

```text
Shipment Selection Rule /Criteria
```

<a id="b02541"></a>
## b02541 — word/document\.xml/body/\*\[2541\]

```text
The shipment selection criteria is used to identify shipments that are included in the shipments creation process. A criteria needs to be created for each outsource VAS provider to evaluate the respective shipments by outsource facility id”
```

<a id="b02542"></a>
## b02542 — word/document\.xml/body/\*\[2542\]

```text
Shipment Selection Rule Name: Outsource Shipments
```

<a id="b02543"></a>
## b02543 — word/document\.xml/body/\*\[2543\]

```text
Criteria
```

<a id="b02544"></a>
## b02544 — word/document\.xml/body/\*\[2544\]

```text
shipment. Assigned ShipVia = OCR
```

<a id="b02545"></a>
## b02545 — word/document\.xml/body/\*\[2545\]

```text
shipment.stopList.stopActionId = ‘DL’
```

<a id="b02546"></a>
## b02546 — word/document\.xml/body/\*\[2546\]

```text
shipment.stopList.facilityId = “<< Oustource Facility Id >>”
```

<a id="b02547"></a>
## b02547 — word/document\.xml/body/\*\[2547\]

```text

```

<a id="b02548"></a>
## b02548 — word/document\.xml/body/\*\[2548\]

```text
Truck Load Routing Strategy
```

<a id="b02549"></a>
## b02549 — word/document\.xml/body/\*\[2549\]

```text
The Truck Load Routing Strategy is used with the “Truck Load Order Planning Strategy”  to plan the transportation for “Transfer Orders” using a static route strategy as used in Reedsburg and Routing Criteria to plan Wholesale orders transportation during waving.
```

<a id="b02550"></a>
## b02550 — word/document\.xml/body/\*\[2550\]

```text
Bypass Routing
```

<a id="b02551"></a>
## b02551 — word/document\.xml/body/\*\[2551\]

```text
A bypass routing criteria are used to bypass routing for "Amazon" Wholesale Orders because these orders are planned using the "Unified Logistic Control" UI (ULC) after the routing information is obtained from the Amazon website. This will also bypass the routing of Photo Shoot (PSHORD, PREPROOM) and Marketing (MRKTORD) orders.
```

<a id="b02552"></a>
## b02552 — word/document\.xml/body/\*\[2552\]

```text
Parcel Determination Strategy
```

<a id="b02553"></a>
## b02553 — word/document\.xml/body/\*\[2553\]

```text
No Used
```

<a id="b02554"></a>
## b02554 — word/document\.xml/body/\*\[2554\]

```text
Static Routing Strategy
```

<a id="b02555"></a>
## b02555 — word/document\.xml/body/\*\[2555\]

```text
Static Routing Strategy: Transfers Orders Static Routing Strategy
```

<a id="b02556"></a>
## b02556 — word/document\.xml/body/\*\[2556\]

```text
Static Route Response Type: Static Route and Shipment
```

<a id="b02557"></a>
## b02557 — word/document\.xml/body/\*\[2557\]

```text
Order Selection Rule
```

<a id="b02558"></a>
## b02558 — word/document\.xml/body/\*\[2558\]

```text
Order Type = OTRNORD or STKTRNORD
```

<a id="b02559"></a>
## b02559 — word/document\.xml/body/\*\[2559\]

```text
Static Route Definition
```

<a id="b02560"></a>
## b02560 — word/document\.xml/body/\*\[2560\]

```text
Static Route: Transfer from Dodgeville to Reedsburg
```

<a id="b02561"></a>
## b02561 — word/document\.xml/body/\*\[2561\]

```text
Carrier: PVT
```

<a id="b02562"></a>
## b02562 — word/document\.xml/body/\*\[2562\]

```text
Ship Via Id: TRORD
```

<a id="b02563"></a>
## b02563 — word/document\.xml/body/\*\[2563\]

```text
Hub Planning : No
```

<a id="b02564"></a>
## b02564 — word/document\.xml/body/\*\[2564\]

```text
Sunday to Saturday : Yes
```

<a id="b02565"></a>
## b02565 — word/document\.xml/body/\*\[2565\]

```text
Stops
```

<a id="b02566"></a>
## b02566 — word/document\.xml/body/\*\[2566\]

```text
Sequence	Priority	Facility	Role	Action
1	1	1	DC	Live Load
2	2	4	STORE	Drop
```

<a id="b02567"></a>
## b02567 — word/document\.xml/body/\*\[2567\]

```text

```

<a id="b02568"></a>
## b02568 — word/document\.xml/body/\*\[2568\]

```text
Routing Criteria
```

<a id="b02569"></a>
## b02569 — word/document\.xml/body/\*\[2569\]

```text
If Orders/LPNs do not qualify for Bypass/Parcel/Static Route determination, Transportation Orders are created and Routing Criteria are used to evaluate order groupings and Transport Resource Groups.
```

<a id="b02570"></a>
## b02570 — word/document\.xml/body/\*\[2570\]

```text
Wholesale Order Routing Criteria
```

<a id="b02571"></a>
## b02571 — word/document\.xml/body/\*\[2571\]

```text
The “Wholesale Order Routing” criteria is used to plan wholesale shipments at least by  Olpn. CustomerId (or MarkForStoreName or any extended attribute used to identify the customer order).
```

<a id="b02572"></a>
## b02572 — word/document\.xml/body/\*\[2572\]

```text
 The criteria is configured with the following parameters:
```

<a id="b02573"></a>
## b02573 — word/document\.xml/body/\*\[2573\]

```text
Parameter Set : N/A (Keep as Select)
```

<a id="b02574"></a>
## b02574 — word/document\.xml/body/\*\[2574\]

```text
Add order(s) to existing shipment(s)? No
```

<a id="b02575"></a>
## b02575 — word/document\.xml/body/\*\[2575\]

```text
Transport Resource Group Definition
```

<a id="b02576"></a>
## b02576 — word/document\.xml/body/\*\[2576\]

```text
Transport Resource Group: Wholesale Routing Plan
```

<a id="b02577"></a>
## b02577 — word/document\.xml/body/\*\[2577\]

```text
Equipment Type: Trailer
```

<a id="b02578"></a>
## b02578 — word/document\.xml/body/\*\[2578\]

```text
Mode: TL
```

<a id="b02579"></a>
## b02579 — word/document\.xml/body/\*\[2579\]

```text
Carrier : PVT (Generic Truck Carrier)
```

<a id="b02580"></a>
## b02580 — word/document\.xml/body/\*\[2580\]

```text
Service Level: Wholesale Truck service 
```

<a id="b02581"></a>
## b02581 — word/document\.xml/body/\*\[2581\]

```text
Note: Ship Via WHSL is created for carrier PVT and Service (Wholesale Truck service)
```

<a id="b02582"></a>
## b02582 — word/document\.xml/body/\*\[2582\]

```text
Order Selection Rule
```

<a id="b02583"></a>
## b02583 — word/document\.xml/body/\*\[2583\]

```text
Order Type = WHSLORD and Customer Id is not AMZ
```

<a id="b02584"></a>
## b02584 — word/document\.xml/body/\*\[2584\]

```text
Shipment Selection Rule /Criteria
```

<a id="b02585"></a>
## b02585 — word/document\.xml/body/\*\[2585\]

```text
The shipment selection criteria is used to identify shipments that are included in the shipments creation process. A criteria needs to be created for each outsource VAS provider to evaluate the respective shipments by outsource facility id”
```

<a id="b02586"></a>
## b02586 — word/document\.xml/body/\*\[2586\]

```text
Shipment Selection Rule Name: N/A  (A new shipment is created per wave run)
```

<a id="b02587"></a>
## b02587 — word/document\.xml/body/\*\[2587\]

```text

```

<a id="b02588"></a>
## b02588 — word/document\.xml/body/\*\[2588\]

```text


```

<a id="b02589"></a>
## b02589 — word/document\.xml/body/\*\[2589\]

```text
Cubing
```

<a id="b02590"></a>
## b02590 — word/document\.xml/body/\*\[2590\]

```text
Cubing, or cartonization, is the process of determining the optimal packaging configuration for an order. This involves selecting appropriate container types, assigning items to specific containers (oLPNs), and generating unique identifiers for each oLPN.
```

<a id="b02591"></a>
## b02591 — word/document\.xml/body/\*\[2591\]

```text
Lands’ End leverages both Cube by UOM and Cube to Capacity functionalities depending on the allocation and business needs enforced by rules:
```

<a id="b02592"></a>
## b02592 — word/document\.xml/body/\*\[2592\]

```text
Cube by UOM: Used with non-bulk allocations from reserve where the original case is allocated to a single order.
```

<a id="b02593"></a>
## b02593 — word/document\.xml/body/\*\[2593\]

```text
Cube to Capacity: Used to generate an outbound shipping package (oLPN) using item weight, volume, and critical dimensions, among other criteria. WM selects the most appropriate container size for each container type, then calculates the number of oLPNs required to accommodate the order, optimizing space utilization and reducing packaging costs.
```

<a id="b02594"></a>
## b02594 — word/document\.xml/body/\*\[2594\]

```text
Assumptions
```

<a id="b02595"></a>
## b02595 — word/document\.xml/body/\*\[2595\]

```text
"Ship Alone" and vendor box eligible are always packed into an single item oLPNs.
```

<a id="b02596"></a>
## b02596 — word/document\.xml/body/\*\[2596\]

```text
A Container Type is defined per unit sorter to determine the current container sizes the unit sorter pack station can handle on a specific wave period.
```

<a id="b02597"></a>
## b02597 — word/document\.xml/body/\*\[2597\]

```text
Container Types
```

<a id="b02598"></a>
## b02598 — word/document\.xml/body/\*\[2598\]

```text
Container types and their respective sizes are used in cube-to-capacity logic to define the capacity of a shipping container. The container type can be configured for a specific customer or can be generic and available for all customers.
```

<a id="b02599"></a>
## b02599 — word/document\.xml/body/\*\[2599\]

```text
Container Type and Size attributes 
```

<a id="b02600"></a>
## b02600 — word/document\.xml/body/\*\[2600\]

```text
Name	Required	Description
Bill To	Yes	Indicates the customer ID; enter * if generic oLPN types can be used for any customer
Container Type	Yes	Identifies the physical form of the oLPN
Description    	No	Descriptive LPN type information
Container Size	Yes	oLPN size
Description    	No	Descriptive LPN size information
Parcel Package Description	No	Descriptive information about the container packaging for parcel purposes
Used in parcel (e.g., Admissibility Package Type
Length	Yes	oLPN length
Width	Yes	oLPN Width
Height	Yes	oLPN height
External Volume	Yes	Exterior volume of the container, including its thickness
Maximum Cubing Volume	Yes	Maximum volume available for cubing (Interior volume)
Tare Weight	Yes	Weight of the container when it is empty
Maximum Cubing Weight	Yes	Maximum weight of the items that the container can hold
Maximum Units	Yes	Maximum number of units in the container. Leave blank if there is no limit
```

<a id="b02601"></a>
## b02601 — word/document\.xml/body/\*\[2601\]

```text

```

<a id="b02602"></a>
## b02602 — word/document\.xml/body/\*\[2602\]

```text


```

<a id="b02603"></a>
## b02603 — word/document\.xml/body/\*\[2603\]

```text
Cubing Strategies
```

<a id="b02604"></a>
## b02604 — word/document\.xml/body/\*\[2604\]

```text
Sorter X Cubing Strategy
```

<a id="b02605"></a>
## b02605 — word/document\.xml/body/\*\[2605\]

```text
The Sorter X Cubing Strategy is used with all Sorter X order planning strategies. It configures cube-to-capacity criteria using specific container types that match the current packing capacity of Sorter X. Each cube-to-capacity criterion acts as a catch-all, and MAWM selects the criterion with the highest priority (first on the list) to determine the container size. This size is based on the container type associated with that criterion. If the container size at Sorter X changes, Lands' End updates the criterion priorities to reflect the supported container sizes before the next wave runs.
```

<a id="b02606"></a>
## b02606 — word/document\.xml/body/\*\[2606\]

```text
Below is an example of the Cubing Strategy and Cube-to-Capacity Criteria. The priority of a criterion can be changed by dragging it to the top of the list, making it active for order planning.
```

<a id="b02607"></a>
## b02607 — word/document\.xml/body/\*\[2607\]

```text

```

<a id="b02608"></a>
## b02608 — word/document\.xml/body/\*\[2608\]

```text
Figure 10 - Sorter X Cubing Strategy
```

<a id="b02609"></a>
## b02609 — word/document\.xml/body/\*\[2609\]

```text
Below two examples of each container type configured for each cube-to-capacity criteria. 
```

<a id="b02610"></a>
## b02610 — word/document\.xml/body/\*\[2610\]

```text
SX Bag 3 & 4 with Box 60
```

<a id="b02611"></a>
## b02611 — word/document\.xml/body/\*\[2611\]

```text

```

<a id="b02612"></a>
## b02612 — word/document\.xml/body/\*\[2612\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
SX Bag 2 & 3 with Box 60
	SXBagS1	PolyMailer Bag 2FF	Bag
	SXBagS2	PolyMailer Bag 3FF	Bag
	SXBox60	Box60	Box
```

<a id="b02613"></a>
## b02613 — word/document\.xml/body/\*\[2613\]

```text

```

<a id="b02614"></a>
## b02614 — word/document\.xml/body/\*\[2614\]

```text
SX Bag 5 & 7 with Box 60
```

<a id="b02615"></a>
## b02615 — word/document\.xml/body/\*\[2615\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
SX Bag 3 & 4 with Box 60
	SXBagS1	PolyMailer Bag 3FF	Bag
	SXBagS2	PolyMailer Bag 4FF	Bag
	SXBox60	Box60	Box
```

<a id="b02616"></a>
## b02616 — word/document\.xml/body/\*\[2616\]

```text

```

<a id="b02617"></a>
## b02617 — word/document\.xml/body/\*\[2617\]

```text

```

<a id="b02618"></a>
## b02618 — word/document\.xml/body/\*\[2618\]

```text
Note: Container assignments for Sorter X are configured based on the container's prefix, using the Sort Pack Resource Work Release Criteria selection rule. For example, containers with the prefix 'SXBagS1' are assigned to the 'SXBagS1' Resource Group, and pack stations SX-10-11, SX-10-13, and SX-10-14 are assigned to the 'SXBagS1' Resource Group. Containers with the prefix 'SXBagS2' are assigned to the 'SXBagS2' Resource Group, and pack station SX-10-12 is assigned to the 'SXBagS2' Resource Group.
```

<a id="b02619"></a>
## b02619 — word/document\.xml/body/\*\[2619\]

```text

```

<a id="b02620"></a>
## b02620 — word/document\.xml/body/\*\[2620\]

```text
Sorter A and B Cubing Strategy
```

<a id="b02621"></a>
## b02621 — word/document\.xml/body/\*\[2621\]

```text
The “Sorter A and Sorter B” Cubing Strategy is used with Sorter A and Sorter B order planning strategies. It configures cube-to-capacity criteria using Sorter A and B Cubing Criteria, which evaluates Sorter A and B container types.
```

<a id="b02622"></a>
## b02622 — word/document\.xml/body/\*\[2622\]

```text

```

<a id="b02623"></a>
## b02623 — word/document\.xml/body/\*\[2623\]

```text
Figure 11 - Sorter A & B Cubing Strategy
```

<a id="b02624"></a>
## b02624 — word/document\.xml/body/\*\[2624\]

```text
Below an examples of Sorter A & B container types configured with the cube-to-capacity criteria. 
```

<a id="b02625"></a>
## b02625 — word/document\.xml/body/\*\[2625\]

```text
Sorter A & B Container Types
```

<a id="b02626"></a>
## b02626 — word/document\.xml/body/\*\[2626\]

```text

```

<a id="b02627"></a>
## b02627 — word/document\.xml/body/\*\[2627\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
Sorter A & B Container Types	BagS2	PolyMailer Bag 2FF	Bag
	BagS3	PolyMailer Bag 3FF	Bag
	BagS4	PolyMailer Bag 4FF	Bag
	BagS95	PolyMailer Bag 95FF	Bag
	BagS7	PolyMailer Bag 7FF	Bag
	Box60	Box60	Box
	Box71	Box71	Box
```

<a id="b02628"></a>
## b02628 — word/document\.xml/body/\*\[2628\]

```text

```

<a id="b02629"></a>
## b02629 — word/document\.xml/body/\*\[2629\]

```text


```

<a id="b02630"></a>
## b02630 — word/document\.xml/body/\*\[2630\]

```text
Pre-VAS Cubing Strategy
```

<a id="b02631"></a>
## b02631 — word/document\.xml/body/\*\[2631\]

```text
The Pre-VAS Cubing Strategy is used with the 'LE HM06 Sorter Wave', 'LE HM07 Sorter Wave', and 'LE Production Order Wave'. It cubes one production order (Original Order ID) into a single logical container. This strategy uses Pre-VAS Logical Container Criteria (cube-to-capacity criteria) and a Pre-VAS Container Type. The Pre-VAS container type has only one size, set to the maximum dimensions, volume, and weight allowed in MAWM, to cube all units of a production order into a single logical container. Because logo productions are aggregated during order import, the cubing strategy is configured to create one logical container per Original Order ID (Break by Original Order ID).
```

<a id="b02632"></a>
## b02632 — word/document\.xml/body/\*\[2632\]

```text

```

<a id="b02633"></a>
## b02633 — word/document\.xml/body/\*\[2633\]

```text
Figure 12 - HM Sorter Cubing Strategy
```

<a id="b02634"></a>
## b02634 — word/document\.xml/body/\*\[2634\]

```text
Below is an example of the cube-to-capacity criteria.
```

<a id="b02635"></a>
## b02635 — word/document\.xml/body/\*\[2635\]

```text
Pre-VAS Logical Container Type
```

<a id="b02636"></a>
## b02636 — word/document\.xml/body/\*\[2636\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
Pre-VAS Logical Container Type	PROD Packing Slip	Production Order Packing Slip	Box
```

<a id="b02637"></a>
## b02637 — word/document\.xml/body/\*\[2637\]

```text

```

<a id="b02638"></a>
## b02638 — word/document\.xml/body/\*\[2638\]

```text


```

<a id="b02639"></a>
## b02639 — word/document\.xml/body/\*\[2639\]

```text
Truck Load Cubing Strategy
```

<a id="b02640"></a>
## b02640 — word/document\.xml/body/\*\[2640\]

```text
The Truck Load Cubing Strategy works with the Truck Load Wave. It cubes unit of measure (UOM) process iLPNs allocated from reserve. The LPN package functions as the shipping container/oLPN. There is a one-to-one relationship between iLPNs and oLPNs. The LPN ID is used as the oLPN ID. Cube-to-capacity is used to cube any remaining allocations picked from unit pick locations. The strategy is configured with cube-to-capacity criteria. These criteria match the packing requirements for each order type planned with the 'Truck Wave' order planning strategy. The image below provides an overview of two criteria used. The first criterion evaluates container types used for shipping 'Photo Studio' order types. The 'Truck Load Container Type' criterion acts as a catch-all.
```

<a id="b02641"></a>
## b02641 — word/document\.xml/body/\*\[2641\]

```text

```

<a id="b02642"></a>
## b02642 — word/document\.xml/body/\*\[2642\]

```text
Figure 13 - Truck Load Cubing Strategy
```

<a id="b02643"></a>
## b02643 — word/document\.xml/body/\*\[2643\]

```text
Below two examples of each container type configured for each cube-to-capacity criteria. 
```

<a id="b02644"></a>
## b02644 — word/document\.xml/body/\*\[2644\]

```text
Photo Studio Container Type
```

<a id="b02645"></a>
## b02645 — word/document\.xml/body/\*\[2645\]

```text

```

<a id="b02646"></a>
## b02646 — word/document\.xml/body/\*\[2646\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
Photo Studio  Container Type
	Bag3	Poly Bag 3FF	Bag
	Bag4	Poly Bag 4FF	Bag
	Box60	Box60	Box
```

<a id="b02647"></a>
## b02647 — word/document\.xml/body/\*\[2647\]

```text

```

<a id="b02648"></a>
## b02648 — word/document\.xml/body/\*\[2648\]

```text
Truck Load Container Types
```

<a id="b02649"></a>
## b02649 — word/document\.xml/body/\*\[2649\]

```text
Container Type	Container  Size 	Size Description	Parcel Package
Truck Load Container Type
	Box25	Box25	Box
	Box30	Box30	Box
	Box60	Box60	Box
```

<a id="b02650"></a>
## b02650 — word/document\.xml/body/\*\[2650\]

```text

```

<a id="b02651"></a>
## b02651 — word/document\.xml/body/\*\[2651\]

```text


```

<a id="b02652"></a>
## b02652 — word/document\.xml/body/\*\[2652\]

```text
Non-Cubed Criteria
```

<a id="b02653"></a>
## b02653 — word/document\.xml/body/\*\[2653\]

```text
The non-cubed criteria is used for Store Orders (STORORD , RPLNORD), VAS Customer (Large Orders), Marketing (MRKTORD) and  Photo Shoot (PSHORD) are bulk picked into a tote, and items are distributed and packed into non-cube OLPNs at the pack location. To enable this, a cubing strategy is configured with the cubing residual method disabled (set to no), causing MAWM to bypass the cubing process during order planning.
```

<a id="b02654"></a>
## b02654 — word/document\.xml/body/\*\[2654\]

```text

```

<a id="b02655"></a>
## b02655 — word/document\.xml/body/\*\[2655\]

```text
Figure 14 - Non-Cube Strategy
```

<a id="b02656"></a>
## b02656 — word/document\.xml/body/\*\[2656\]

```text

```

<a id="b02657"></a>
## b02657 — word/document\.xml/body/\*\[2657\]

```text

```

<a id="b02658"></a>
## b02658 — word/document\.xml/body/\*\[2658\]

```text
Figure 15 - Residual Cubing Enablement
```

<a id="b02659"></a>
## b02659 — word/document\.xml/body/\*\[2659\]

```text


```

<a id="b02660"></a>
## b02660 — word/document\.xml/body/\*\[2660\]

```text
Work Release
```

<a id="b02661"></a>
## b02661 — word/document\.xml/body/\*\[2661\]

```text
Work Release is a feature that orchestrates the release of tasks to the warehouse floor to efficiently fulfill orders. By assessing the availability of equipment, labor resources, and inventory, Work Release prioritizes critical orders while maximizing resource utilization and equipment throughput. Acting as a control center, it continuously identifies priority tasks and releases them in alignment with the warehouse’s fulfillment strategy.
```

<a id="b02662"></a>
## b02662 — word/document\.xml/body/\*\[2662\]

```text
Work Release maintains a real-time overview of available outbound equipment, such as unit sorters, put walls, and packing stations, alongside current inventory levels and pending tasks. Through its services, it ensures that the right tasks are released to the floor at the optimal time, helping to streamline order fulfillment.
```

<a id="b02663"></a>
## b02663 — word/document\.xml/body/\*\[2663\]

```text
Work Release is powered by two main engines:
```

<a id="b02664"></a>
## b02664 — word/document\.xml/body/\*\[2664\]

```text
Capacity Manager: This engine evaluates the importance of each task and allocates resources, prioritizing assignments based on equipment capacity and inventory availability.
```

<a id="b02665"></a>
## b02665 — word/document\.xml/body/\*\[2665\]

```text
Task Release Manager: Task Release Manager generates efficient tasks for the prioritized work determined by the Capacity Manager, releasing them according to equipment capacity and labor constraints.
```

<a id="b02666"></a>
## b02666 — word/document\.xml/body/\*\[2666\]

```text
The workReleaseSchedulerJobSchedule defines the schedule for the work release process, allowing control over the frequency with which work release tasks are initiated. This scheduling ensures that task releases are consistent and aligned with warehouse demands. 
```

<a id="b02667"></a>
## b02667 — word/document\.xml/body/\*\[2667\]

```text
Assumptions
```

<a id="b02668"></a>
## b02668 — word/document\.xml/body/\*\[2668\]

```text

```

<a id="b02669"></a>
## b02669 — word/document\.xml/body/\*\[2669\]

```text
All MHE picking tasks are created in a "Held" status and are released once the MHE system has loaded the batch and it is ready for induction. This process is based on the implementation of the message for each vendor [AU03].
```

<a id="b02670"></a>
## b02670 — word/document\.xml/body/\*\[2670\]

```text
Work 
```

<a id="b02671"></a>
## b02671 — word/document\.xml/body/\*\[2671\]

```text
Work is the unit through which the work release manages and allocates equipment capacity. It represents the lowest level of allocation grouping required to release a set of allocations for available inventory and resource capacity. It occupies one unit of capacity for an assigned resource. A resource (equipment) is defined as an entity that processes work. In typical implementations, a resource may be a putwall, sorter chute, or packing station. As allocations are generated during an order planning run, the work release criteria are assigned to the respective work resource based on configured rules that determine how the work will be created, scored, and which resource groups are eligible for the work.
```

<a id="b02672"></a>
## b02672 — word/document\.xml/body/\*\[2672\]

```text
Note: The term resource and equipment are used interchangeably in this document.
```

<a id="b02673"></a>
## b02673 — word/document\.xml/body/\*\[2673\]

```text
Resource Group Family Batching
```

<a id="b02674"></a>
## b02674 — word/document\.xml/body/\*\[2674\]

```text
The work release engine supports two batching modes: Resource Group Family Batching (Pack Wave) and Resource Group Batching (Not Used by Lands’ End).
```

<a id="b02675"></a>
## b02675 — word/document\.xml/body/\*\[2675\]

```text
Resource Group Family Batching is a mode used when a specific amount of work needs to be released and processed by a unit sorter at once. It relies on a group of resource group types, each with its own capacity limits.
```

<a id="b02676"></a>
## b02676 — word/document\.xml/body/\*\[2676\]

```text


```

<a id="b02677"></a>
## b02677 — word/document\.xml/body/\*\[2677\]

```text
Sorter A and Sorter B Resource Group Family 
```

<a id="b02678"></a>
## b02678 — word/document\.xml/body/\*\[2678\]

```text
Matthews' B2 unit sorters are divided into two packing sections, labeled "A" and "B." The pack stations are categorized into four types: International, Packing Slip, Bag, and Box. Batches are created for each category and grouped into a Resource Family Group, which determines the batch capacity at any given time, based on the active pack stations. The capacity of each pack station is defined by the maximum Putwall cubbies configured for each pack station.
```

<a id="b02679"></a>
## b02679 — word/document\.xml/body/\*\[2679\]

```text
For example, if Sorter A pack station has 6 chutes per pack station and the unit sorter has 45 active pack stations, then the maximum number of batches to be released per work release run (pack wave download AU02) will be 45 x 6 = 270 batches. If the minimum operating capacity of the unit sorter is 80%, to ensure pick density, then the minimum number of batches that can be released is set to 216 (270 x 0.80). Because the resource batch is created per chute capacity, then the batch size threshold is configured to 1 (100% chute capacity).
```

<a id="b02680"></a>
## b02680 — word/document\.xml/body/\*\[2680\]

```text
Sorter A and Sorter B will have dedicated pack stations, grouped with the following Resource Groups. Each Resource Group consists of batches within a Resource Group Family. 
```

<a id="b02681"></a>
## b02681 — word/document\.xml/body/\*\[2681\]

```text
SA-Box (Sorter A  Box Pack Stations)
```

<a id="b02682"></a>
## b02682 — word/document\.xml/body/\*\[2682\]

```text
SA-Bag (Sorter A  Bag Pack Stations)
```

<a id="b02683"></a>
## b02683 — word/document\.xml/body/\*\[2683\]

```text
SA-Intl (Sorter A International Pack Stations)
```

<a id="b02684"></a>
## b02684 — word/document\.xml/body/\*\[2684\]

```text
SA-PckSlip (Sorter A Packing Slip Stations)
```

<a id="b02685"></a>
## b02685 — word/document\.xml/body/\*\[2685\]

```text
SB-Box (Sorter B  Box Pack Stations)
```

<a id="b02686"></a>
## b02686 — word/document\.xml/body/\*\[2686\]

```text
SB-Bag (Sorter B  Bag Pack Stations)
```

<a id="b02687"></a>
## b02687 — word/document\.xml/body/\*\[2687\]

```text
SB-Intl (Sorter B International Pack Stations)
```

<a id="b02688"></a>
## b02688 — word/document\.xml/body/\*\[2688\]

```text

```

<a id="b02689"></a>
## b02689 — word/document\.xml/body/\*\[2689\]

```text
Resource Group Family Config Matrix
```

<a id="b02690"></a>
## b02690 — word/document\.xml/body/\*\[2690\]

```text
Resource Group Family Id	Batch Size Threshold	Manual Batch Release	Maximum Batches to Release	Minimum Batches to Release	Allow Pick Across Batches?
SA-Bag	1	N	270	216	No
SA-Box	1	N	?	?	No
SA-PackingSlip	1	N	?	?	No
SA-Int	1	N	?	?	No
SB-Bag	1	N	? 	? 	No
SB-Box	1	N	?	?	No
SB-PackingSlip	1	N	?	?	No
SB-Int	1	N	?	?	No
```

<a id="b02691"></a>
## b02691 — word/document\.xml/body/\*\[2691\]

```text

```

<a id="b02692"></a>
## b02692 — word/document\.xml/body/\*\[2692\]

```text
Resource Group and Work Resource Config Matrix 
```

<a id="b02693"></a>
## b02693 — word/document\.xml/body/\*\[2693\]

```text
Resource  Group	Resource Group Type	Work Resource	Base Capacity (oLPNs)	Maximum number of units	Maximum allowable volume	Maximum allowable weight
SA-Bag	Sorter A Bag Station	SA-Bag	20	Null/Blank	Null/Blank	Null/Blank
SA-Box	Sorter A Box Station	SA-Box	12	Null/Blank	Null/Blank	Null/Blank
SA-PackingSlip	Sorter A Bag Station	SA-PckSlip	?	Null/Blank	Null/Blank	Null/Blank
SA-Int	Sorter A International	SA-Int	?	Null/Blank	Null/Blank	Null/Blank
SB-Bag	Sorter B Bag Station	SB-Bag	20	Null/Blank	Null/Blank	Null/Blank
SB-Box	Sorter B Box Station	SB-Box	12	Null/Blank	Null/Blank	Null/Blank
SB-PackingSlip	Sorter B Bag Station	SB-PckSlip	?	Null/Blank	Null/Blank	Null/Blank
SB-Int	Sorter B International	SB-Int	?	Null/Blank	Null/Blank	Null/Blank
```

<a id="b02694"></a>
## b02694 — word/document\.xml/body/\*\[2694\]

```text
The work resources defined for Matthews unit sorter are generic work resource which is updated by AU04 with the first divert confirmation message. For this, a work resource is defined in Manhattan, starting with the unit sorter ID followed by the chute ID  which is the tote id from the sort divert confirmation message. Below are examples of some chutes work resources configured for Matthews Sorter A and B.
```

<a id="b02695"></a>
## b02695 — word/document\.xml/body/\*\[2695\]

```text
Resource Group Type	Work Resource	Location Id	Base Capacity (oLPNs)	Maximum number of units	Maximum allowable volume	Maximum allowable weight
Packing Chute	SA-101	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SA-102	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SA-103	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SA-104	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SA-105	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SA-106	SA-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-101	SB-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-102	SB-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-103	SB-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-104	SB-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-105	SB-10	999	Null/Blank	Null/Blank	Null/Blank
Packing Chute	SB-106	SB-10	999	Null/Blank	Null/Blank	Null/Blank
```

<a id="b02696"></a>
## b02696 — word/document\.xml/body/\*\[2696\]

```text
Configuration Note: Location Id is the ID of a packing location configured with packing location type set as “OUTBOUND_MANUAL_SORTER” 
```

<a id="b02697"></a>
## b02697 — word/document\.xml/body/\*\[2697\]

```text
Pack Wave Release
```

<a id="b02698"></a>
## b02698 — word/document\.xml/body/\*\[2698\]

```text
A custom batch release logic is implemented AU04 with the Sort Divert confirmations to release the unit sorter capacity based on the percentage of sort completion and a configurable TaskReleaseThreshold. When the pack wave sortation completion reaches or exceeds the threshold, AU04 releases the unit sorter capacity by renaming the Resource Group Family ID of all batches associated with the active pack wave ID (provided with the sort divert confirmations).
```

<a id="b02699"></a>
## b02699 — word/document\.xml/body/\*\[2699\]

```text
After this update, the unit sorter resource family will have no open batches. During subsequent work release runs, the capacity manager evaluation will determine that the full unit sorter capacity is available, triggering a new pack wave download based on the configured minimum and maximum batch values for the unit sorter resource family group.
```

<a id="b02700"></a>
## b02700 — word/document\.xml/body/\*\[2700\]

```text

```

<a id="b02701"></a>
## b02701 — word/document\.xml/body/\*\[2701\]

```text
Figure 18 - Matthews' Sorter-A and Sorter-B Floor Plan
```

<a id="b02702"></a>
## b02702 — word/document\.xml/body/\*\[2702\]

```text
Sorter X Resource Group Family 
```

<a id="b02703"></a>
## b02703 — word/document\.xml/body/\*\[2703\]

```text
Beumer Sorter-X consists of tilt-tray systems divided into three independently controlled sorters within a single sorting framework.
```

<a id="b02704"></a>
## b02704 — word/document\.xml/body/\*\[2704\]

```text
Primary Section 10 feeds into Secondary Sections 11, 12, 13, 14, 15, and 16 (packing stations).
```

<a id="b02705"></a>
## b02705 — word/document\.xml/body/\*\[2705\]

```text
Primary Section 20 feeds into Secondary Sections 21, 22, 23, and 24.
```

<a id="b02706"></a>
## b02706 — word/document\.xml/body/\*\[2706\]

```text
Primary Section 30 feeds into Secondary Sections 31, 32, 33, 34, 35, and 36.
```

<a id="b02707"></a>
## b02707 — word/document\.xml/body/\*\[2707\]

```text

```

<a id="b02708"></a>
## b02708 — word/document\.xml/body/\*\[2708\]

```text

```

<a id="b02709"></a>
## b02709 — word/document\.xml/body/\*\[2709\]

```text
Figure 16 – Sorter-x Floor Plan
```

<a id="b02710"></a>
## b02710 — word/document\.xml/body/\*\[2710\]

```text

```

<a id="b02711"></a>
## b02711 — word/document\.xml/body/\*\[2711\]

```text
Figure 17 - Sorter-X Layout
```

<a id="b02712"></a>
## b02712 — word/document\.xml/body/\*\[2712\]

```text
The induction point for Primary Section 10, used for the primary sort, is labeled as Induction Y. The belt from this section is delivered to Manual Feed 3 on the diagram above.
```

<a id="b02713"></a>
## b02713 — word/document\.xml/body/\*\[2713\]

```text
For Primary Sections 20 and 30, the induction point is labeled Induction X. The belt from these sections delivers to Manual Feed 6 as indicated on the diagram.
```

<a id="b02714"></a>
## b02714 — word/document\.xml/body/\*\[2714\]

```text


```

<a id="b02715"></a>
## b02715 — word/document\.xml/body/\*\[2715\]

```text
Resource Group Family Config Matrix
```

<a id="b02716"></a>
## b02716 — word/document\.xml/body/\*\[2716\]

```text
Resource Group Family Id	Batch Size Threshold	Manual Batch Release	Maximum Batches to Release	Minimum Batches to Release	Allow Pick Across Batches?
SX10	1	N	21 	15 	No
SX20	1	N	21 	15	No
SX30	1	N	21 	15 	No
```

<a id="b02717"></a>
## b02717 — word/document\.xml/body/\*\[2717\]

```text
The Sorter X resource group family defines how many batches/subwaves will be released per work release run (Pack Wave Download) within a wave period. Lands' End controls the total number of subwaves in a pack wave by adjusting the maximum number of batches to be released for a wave period. They also control the minimum number of batches to be released to maintain good pick density in the unit sorter.
```

<a id="b02718"></a>
## b02718 — word/document\.xml/body/\*\[2718\]

```text
Resource Group and Work Resource Config Matrix 
```

<a id="b02719"></a>
## b02719 — word/document\.xml/body/\*\[2719\]

```text
Resource  Group	Resource Group Type	Work Resource	Base Capacity (oLPNs)	Maximum number of units	Maximum allowable volume	Maximum allowable weight
SX-10-S1-Bag	Sorter X Bag Station	SX-10-11	10	Null/Blank	Null/Blank	Null/Blank
SX-10-S1-Bag	Sorter X Bag Station	SX-10-13	10	Null/Blank	Null/Blank	Null/Blank
SX-10-S1-Bag	Sorter X Bag Station	SX-10-14	10	Null/Blank	Null/Blank	Null/Blank
SX-30-S1-Bag	Sorter X Bag Station	SX-30-32	10	Null/Blank	Null/Blank	Null/Blank
SX-30-S1-Bag	Sorter X Bag Station	SX-30-33	10	Null/Blank	Null/Blank	Null/Blank
SX-30-S1-Bag	Sorter X Bag Station	SX-30-36	10	Null/Blank	Null/Blank	Null/Blank
SX-10-S2-Bag	Sorter X Bag Station	SX-10-12	10	Null/Blank	Null/Blank	Null/Blank
SX-10-S2-Bag	Sorter X Bag Station	SX-30-31	10	Null/Blank	Null/Blank	Null/Blank
SX-10-Box	Sorter X Box Station	SX-10-15	7	Null/Blank	Null/Blank	Null/Blank
SX-10-Box	Sorter X Box Station	SX-10-15	7	Null/Blank	Null/Blank	Null/Blank
SX-20-Box	Sorter X Box Station	SX-20-21	7	Null/Blank	Null/Blank	Null/Blank
SX-20-Box	Sorter X Box Station	SX-20-22	7	Null/Blank	Null/Blank	Null/Blank
SX-20-Box	Sorter X Box Station	SX-20-23	7	Null/Blank	Null/Blank	Null/Blank
SX-20-Box	Sorter X Box Station	SX-20-24	7	Null/Blank	Null/Blank	Null/Blank
SX-30-Box	Sorter X Box Station	SX-30-34	7	Null/Blank	Null/Blank	Null/Blank
SX-30-Box	Sorter X Box Station	SX-30-35	7	Null/Blank	Null/Blank	Null/Blank
```

<a id="b02720"></a>
## b02720 — word/document\.xml/body/\*\[2720\]

```text
Configuration Note: Each Sorter-X Work Resource is configured as a packing location with track resource set to yes and packing location type set as “OUTBOUND_MANUAL_SORTER”
```

<a id="b02721"></a>
## b02721 — word/document\.xml/body/\*\[2721\]

```text
The family batch size (wave period) for Sorter-X is determined by summing the work capacity of each packing station and then multiplying the total by minimum number of . This calculation results in 21 sub-waves (resource batch id) within each resource group family batch (wave period / work release batch id).
```

<a id="b02722"></a>
## b02722 — word/document\.xml/body/\*\[2722\]

```text
The following is a scaled-down illustration of the configuration designed to meet the Beumer requirements. In this example, the batch size is 32 OLPNs per subwave for Section 10 and 64 OLPNs per subwave for Sections 20 and 30. Each family group is configured to release a maximum of 21 subwaves per work release to ensure pick density.
```

<a id="b02723"></a>
## b02723 — word/document\.xml/body/\*\[2723\]

```text
MAWM will release 21 subwaves (resource batch) for each Work Release Run (Wave Period). To maintain pick density, the Resource Group family is configured to release a minimum of 10 batches (subwaves). If there are fewer than 10 full batches, MAWM will retain the Work Allocation for up to 3 hours (Work Release Allocation à Created Time stamp  Hours From Current >= 3). If the batch is not completed within this timeframe, the Work Release will replan it to Sorter A or B based on the rules defined in the Sort Pack Resource Strategy → Work Release Template Rule.
```

<a id="b02724"></a>
## b02724 — word/document\.xml/body/\*\[2724\]

```text

```

<a id="b02725"></a>
## b02725 — word/document\.xml/body/\*\[2725\]

```text
Resource Group 
Family Name	Resource Group	Resource
Group Type	Work Resource	Base Capacity (oLPNs)
SX10
(Sorter-X Section 10)	SX-10-BagS1
(Sorter X10 Bag Size 1)	Bag Pack Stations	SX-10-11	10
	SX-10-BagS2
(Sorter X10 Bag Size 2)		SX-10-12	10
	SX-10-BoxS1
(Sorter X10 Box Size 1)	Box Pack Stations	SX-10-15	10
	SX-10-BoxS2
(Sorter X10 Box Size 2)		SX-10-16	10
 	 	 		40
```

<a id="b02726"></a>
## b02726 — word/document\.xml/body/\*\[2726\]

```text

```

<a id="b02727"></a>
## b02727 — word/document\.xml/body/\*\[2727\]

```text
Resource Group 
Family Name	Resource Group	Resource
Group Type	Work Resource	Base Capacity (oLPNs)
SX20
(Sorter-X Section 20)	SX-20-BagS1
(Sorter X20 Bag Size 1)	Bag Pack Stations	SX-20-21	8
	SX-20-BagS2
(Sorter X20 Bag Size 2)		SX-20-22	8
	SX-20-BoxS1
(Sorter X20 Box Size 1)	Box Pack Stations	SX-20-23	8
	SX-20-BoxS2
(Sorter X20 Box Size 2)		SX-20-24	8
 	 	 		32
```

<a id="b02728"></a>
## b02728 — word/document\.xml/body/\*\[2728\]

```text

```

<a id="b02729"></a>
## b02729 — word/document\.xml/body/\*\[2729\]

```text
Resource Group 
Family Name	Resource Group	Resource
Group Type	Work Resource	Base Capacity (oLPNs)
SX30
(Sorter-X Section 30)	SX-30-BagS1
(Sorter X30 Bag Size 1)	Bag Pack Stations	SX-30-31	8
	SX-30-BagS2
(Sorter X30 Bag Size 2)		SX-30-32	8
	SX-30-BoxS1
(Sorter X30 Box Size 1)	Box Pack Stations	SX-30-33	8
	SX-30-BoxS2
(Sorter X30 Box Size 2)		SX-30-34	8
 	 	 		32
```

<a id="b02730"></a>
## b02730 — word/document\.xml/body/\*\[2730\]

```text

```

<a id="b02731"></a>
## b02731 — word/document\.xml/body/\*\[2731\]

```text


```

<a id="b02732"></a>
## b02732 — word/document\.xml/body/\*\[2732\]

```text
HM Sorter Resource Group Family
```

<a id="b02733"></a>
## b02733 — word/document\.xml/body/\*\[2733\]

```text
Lands’ End uses four HM sorters, grouping every two HM sorters with a resource group and family to perform double sorting with the goal of maintaining pick density and gaining warehouse efficiency. 
```

<a id="b02734"></a>
## b02734 — word/document\.xml/body/\*\[2734\]

```text
Assumptions
```

<a id="b02735"></a>
## b02735 — word/document\.xml/body/\*\[2735\]

```text
Logo ID Criteria: Logo IDs used for sorting will exclude logo category and work center to optimize picking and sorting efficiency.
```

<a id="b02736"></a>
## b02736 — word/document\.xml/body/\*\[2736\]

```text
Primary Sort Assignment Limits: Each primary sort assignment will include a maximum number of distinct logo IDs that does not exceed the total number of sort divert destinations in the secondary HM sorter.
```

<a id="b02737"></a>
## b02737 — word/document\.xml/body/\*\[2737\]

```text
Secondary Sort Assignment Limits: Each secondary sort assignment will contain only one logo ID.
```

<a id="b02738"></a>
## b02738 — word/document\.xml/body/\*\[2738\]

```text
Primary Sort Initiation: Matthews starts the primary sort process by scanning a batch ID provided on the label of the container of the picked item.
```

<a id="b02739"></a>
## b02739 — word/document\.xml/body/\*\[2739\]

```text
Secondary Batch Induction: Matthews will control the induction of secondary batches by scanning a gurney ID or batch ID generated by Matthews from primary sorting.
```

<a id="b02740"></a>
## b02740 — word/document\.xml/body/\*\[2740\]

```text
Jackpot Process : Any instance where a scanned item is inducting for sorting but cannot be read or found will be directed to the exception chute as a jackpot.
```

<a id="b02741"></a>
## b02741 — word/document\.xml/body/\*\[2741\]

```text
Batch Closure:
```

<a id="b02742"></a>
## b02742 — word/document\.xml/body/\*\[2742\]

```text
In ideal conditions, Matthews will automatically close a primary and secondary batch after all items have been sorted. A message is sent to Manhattan to close the open gurneys or totes.
```

<a id="b02743"></a>
## b02743 — word/document\.xml/body/\*\[2743\]

```text
A manual close batch option is available in Matthews to force the closure of an active batch and release the divert assignments. A message is sent to Manhattan to close the open gurneys or totes.
```

<a id="b02744"></a>
## b02744 — word/document\.xml/body/\*\[2744\]

```text
Monitoring Tools: A report and dashboard are built in Matthews to provide visibility into the sorting process. This allows the operation to review sorting progress and identify when a batch is auto-closed or requires troubleshooting. Troubleshooting may involve completing the sorting batch by inducting the missing items or manually closing it.
```

<a id="b02745"></a>
## b02745 — word/document\.xml/body/\*\[2745\]

```text
HM Sorter Layouts
```

<a id="b02746"></a>
## b02746 — word/document\.xml/body/\*\[2746\]

```text

```

<a id="b02747"></a>
## b02747 — word/document\.xml/body/\*\[2747\]

```text
Figure 19- HM Sorter 1 & 2 Building 6, First Floor
```

<a id="b02748"></a>
## b02748 — word/document\.xml/body/\*\[2748\]

```text

```

<a id="b02749"></a>
## b02749 — word/document\.xml/body/\*\[2749\]

```text
Figure 20 - Stevens Point HM Sorter 1
```

<a id="b02750"></a>
## b02750 — word/document\.xml/body/\*\[2750\]

```text
Process Flow
```

<a id="b02751"></a>
## b02751 — word/document\.xml/body/\*\[2751\]

```text

```

<a id="b02752"></a>
## b02752 — word/document\.xml/body/\*\[2752\]

```text


```

<a id="b02753"></a>
## b02753 — word/document\.xml/body/\*\[2753\]

```text
Sort Strategy
```

<a id="b02754"></a>
## b02754 — word/document\.xml/body/\*\[2754\]

```text
Lands’ End uses four HM sorters, grouping every two HM sorters with a resource group and family to perform double sorting with the goal of maintaining pick density and gaining warehouse efficiency.
```

<a id="b02755"></a>
## b02755 — word/document\.xml/body/\*\[2755\]

```text
The configuration below is a scaled-down illustration of the configuration of Matthews’ HM sorters. In this example, the batch size for each Resource Group is calculated by summing the capacity of each work resource. Each work resource represents a logical divert address in Matthews’ primary HM sorter. The capacity of each work resource in each primary HM sorter chute is calculated by summing the total number of active/operable chutes in the second HM sorter.
```

<a id="b02756"></a>
## b02756 — word/document\.xml/body/\*\[2756\]

```text
In the example below, each resource group defines a primary HM sorter group, one for Dodgeville and a second for Stevens Point, where each one has two chutes (work resources) with a capacity of 2 orders each. Each order that is sorted in an HM sorter represents one VAS Type and one VAS logo. 
```

<a id="b02757"></a>
## b02757 — word/document\.xml/body/\*\[2757\]

```text
Production orders are created in Manhattan via an interface process with SAP, where the Production order header will contain an extended attribute “ParentLogoId” where the logo ID is interfaced without category and work center. Manhattan aggregates multiple Production Orders by VAS Type and Logo ID into one Order to ensure all orders for the same VAS Type and Logo ID combination are sorted into one HM sorter chute at the time of order planning. 
```

<a id="b02758"></a>
## b02758 — word/document\.xml/body/\*\[2758\]

```text
The maximum batch capacity is calculated by multiplying the total number of work resources by the resource base capacity. In the example below, it is obtained as 2 x 2 = 4 Orders per batch, where each work resource will produce two sub-batches (one sub-batch per resource controlled by Matthews) and each sub-batch will have a maximum of 4 orders, which is the capacity of the work resource that has sorted the units demanded for the orders.
```

<a id="b02759"></a>
## b02759 — word/document\.xml/body/\*\[2759\]

```text
Resource Group
Family Name	Resource Group	Resource
Group Type	Staging Location 	Work Resource	Chute Capacity (By Order Id)
HM06	HM06	HM Sorter Chute	HM06-IN	HM06-01	2
				HM06-02	2
HM07	HM07	HM Sorter Chute	HM07-IN	HM07-01	2
				HM07-02	2
```

<a id="b02760"></a>
## b02760 — word/document\.xml/body/\*\[2760\]

```text

```

<a id="b02761"></a>
## b02761 — word/document\.xml/body/\*\[2761\]

```text
Example
```

<a id="b02762"></a>
## b02762 — word/document\.xml/body/\*\[2762\]

```text
Assume HM #1 and HM #2 each have 2 available chutes. This means the total batch capacity will be (2 x 2 = 4) distinct logos per batch, generated by MAWM.
```

<a id="b02763"></a>
## b02763 — word/document\.xml/body/\*\[2763\]

```text
Suppose an order planning (wave) in MAWM processes multiple production orders with a total of eight distinct logo IDs. In this scenario, MAWM will generate two batches, each containing four distinct logos.
```

<a id="b02764"></a>
## b02764 — word/document\.xml/body/\*\[2764\]

```text
In Batch #1, WM will assign detail lines that share the same logo ID, grouping up to two distinct logos per HM #1 chute. Matthews will record the output of the first sort for each chute. This output will be used to initiate the second sorting phase by scanning the Tote ID produced per HM #1 chute.
```

<a id="b02765"></a>
## b02765 — word/document\.xml/body/\*\[2765\]

```text
These gurneys will contain two distinct logos that need to be sorted on each HM #2 chute. The process will create a gurney or small tote that will contain a mix of items that share the same logo ID.
```

<a id="b02766"></a>
## b02766 — word/document\.xml/body/\*\[2766\]

```text
Bulk Wave Allocations Examples 
```

<a id="b02767"></a>
## b02767 — word/document\.xml/body/\*\[2767\]

```text
Assuming an average case quantity of 10 units per SKU, MAWM will generate the following pulls:
```

<a id="b02768"></a>
## b02768 — word/document\.xml/body/\*\[2768\]

```text
UPC01: 27 full cases from reserve and 5 units from active.
```

<a id="b02769"></a>
## b02769 — word/document\.xml/body/\*\[2769\]

```text
UPC02: 17 full cases from reserve and 5 units from active.
```

<a id="b02770"></a>
## b02770 — word/document\.xml/body/\*\[2770\]

```text

```

<a id="b02771"></a>
## b02771 — word/document\.xml/body/\*\[2771\]

```text

```

<a id="b02772"></a>
## b02772 — word/document\.xml/body/\*\[2772\]

```text
These pulled items will be directed to the staging location in front of the induction belt of HM sorter #1.
```

<a id="b02773"></a>
## b02773 — word/document\.xml/body/\*\[2773\]

```text
SKU	LOGO Id	Units		SKU	LOGO Id	Units
UPC01	LOGO-01	50		UPC2	LOGO-02	35
	LOGO-03	75			LOGO-04	55
	LOGO-05	65			LOGO-06	20
	LOGO-07	85			LOGO-08	65
 	 	           275 		 	 	           175 
```

<a id="b02774"></a>
## b02774 — word/document\.xml/body/\*\[2774\]

```text

```

<a id="b02775"></a>
## b02775 — word/document\.xml/body/\*\[2775\]

```text
HM Sorter WM Batch / “Divert Assignment” Example
```

<a id="b02776"></a>
## b02776 — word/document\.xml/body/\*\[2776\]

```text
HM Sorter	Primary Batch Id	Logical Chute ID	UPC	Logo	Units	Tote Id from primary Sort	HM Sorter	Secondary Batch Id	Source LPNs	Logical Chute ID	Tote Id for MAWM
HM#1	B_001	HM01-01	UPC01	LOGO-01	50	Gurney-01	HM#2	B_001_01	Gurney-01	HM02-01	TOTE-01
			UPC02	LOGO-02	35					HM02-02	TOTE-02
		HM01-02	UPC01	LOGO-03	75	Gurney-02		B_001_02	Gurney-02	HM02-01	TOTE-03
			UPC02	LOGO-04	55					HM02-02	TOTE-04
	B_002	HM01-01	UPC01	LOGO-05	65	Gurney-04		B_002_01	Gurney-04	HM02-01	TOTE-05
			UPC02	LOGO-06	20					HM02-02	TOTE-06
		HM01-02	UPC01	LOGO-07	85	Gurney-05		B_002_02	Gurney-05	HM02-01	TOTE-07
			UPC02	LOGO-08	65					HM02-02	TOTE-08
```

<a id="b02777"></a>
## b02777 — word/document\.xml/body/\*\[2777\]

```text

```

<a id="b02778"></a>
## b02778 — word/document\.xml/body/\*\[2778\]

```text
MAWM will generate a Sort Divert Assignment message as illustrated in the table above. 
```

<a id="b02779"></a>
## b02779 — word/document\.xml/body/\*\[2779\]

```text
HM Primary Sort Story: 
```

<a id="b02780"></a>
## b02780 — word/document\.xml/body/\*\[2780\]

```text
MAWM will generate a "Divert Assignment" [AU03] message for HM sorter #1 for a sorting batch. This batch will contain 4 chute divert assignments for HM #1 based on the example above, each with 4 chute diverts for HM #2.
```

<a id="b02781"></a>
## b02781 — word/document\.xml/body/\*\[2781\]

```text
Once a product is picked in MAWM, the user is directed to the HM sorter #1 staging area. Here, the product is consolidated, labeled with the batch ID, and a pick completion message “Divert Assignments Adjustments” is sent to confirm picked items and any shortages. Loose/unit picks are placed in a gurney, while full cases are placed on a pallet. Both containers will have an LPN label with the batch ID.
```

<a id="b02782"></a>
## b02782 — word/document\.xml/body/\*\[2782\]

```text
A sorter operator scans the batch ID barcode from the gurney or pallet to activate the batch in HM sorter #1 (Function in Pyramid Director) to start with the item induction.
```

<a id="b02783"></a>
## b02783 — word/document\.xml/body/\*\[2783\]

```text
The batch and its associated sort divert assignments are activated in HM sorter #1.
```

<a id="b02784"></a>
## b02784 — word/document\.xml/body/\*\[2784\]

```text
The sorter operator scans a blind LPN ID on each HM sorter #1 chute. This LPN ID is used to build a gurney as part of the HM sorting process.
```

<a id="b02785"></a>
## b02785 — word/document\.xml/body/\*\[2785\]

```text
The sorter operator inducts the picked product onto the HM sorter #1 belt.
```

<a id="b02786"></a>
## b02786 — word/document\.xml/body/\*\[2786\]

```text
HM sorter #1 diverts the inducted product based on the active sort divert assignments. Matthews sends MAWM a “Primary Sort Divert” [AU03]  message with the percentage of primary sort batch completion. Manhattan uses this information to move the inventory to the assigned gurney ID used by Matthews to perform the second sorting.
```

<a id="b02787"></a>
## b02787 — word/document\.xml/body/\*\[2787\]

```text
Once the primary HM sort is completed, the sort operator reviews an operation report or dashboard in Matthews to verify if the batch has been fully sorted. If the batch is not fully sorted, the operator attempts to locate the missing product and induct it to complete the primary sort. Alternatively, the operator can manually close the active batch in Matthews, which sends a "Batch Complete"  [AU03] message Manhattan to move the for the unsorted units to the respective gurneys and close all it to be ready for secondary induction.
```

<a id="b02788"></a>
## b02788 — word/document\.xml/body/\*\[2788\]

```text
 HM Secondary Sort Story: 
```

<a id="b02789"></a>
## b02789 — word/document\.xml/body/\*\[2789\]

```text
The sort operator moves the gurneys generated by HM #1 to the HM sorter #2 staging location, ensuring they are arranged in the same sequence as they will be inducted. For example, if HM #1 chute 1 produces two gurneys, both are moved to the beginning of the HM sorter #2 induction point (staging location).
```

<a id="b02790"></a>
## b02790 — word/document\.xml/body/\*\[2790\]

```text
The operator scans the LPN ID of a gurney from HM #1 to load it as an activate batch in HM sorter #2.
```

<a id="b02791"></a>
## b02791 — word/document\.xml/body/\*\[2791\]

```text
The sort operator assigns a blind LPN ID on each HM sorter #2 chute. This LPN ID is used to build a new gurney or plastic tote as part of the HM #2 sorting process.
```

<a id="b02792"></a>
## b02792 — word/document\.xml/body/\*\[2792\]

```text
The operator then inducts the products from the gurneys built during the HM sorter #1 process onto the HM sorter #2 belt.
```

<a id="b02793"></a>
## b02793 — word/document\.xml/body/\*\[2793\]

```text
HM sorter #2 diverts the inducted products based on the active sort divert assignments. Matthews sends a "Secondary Sort Divert" [AU03] message to MAWM, which includes the blind LPN ID used to build the new gurney or tote.
```

<a id="b02794"></a>
## b02794 — word/document\.xml/body/\*\[2794\]

```text
Once the secondary HM sort is completed, the sort operator reviews an operation report or dashboard in Matthews to verify if the batch has been fully sorted. If the batch is not fully sorted, the operator attempts to locate the missing product and induct it to complete the secondary sort. Alternatively, the operator can manually close the active batch in Matthews, which sends a "Batch Complete" [AU03]  message to Manhattan to move the for the unsorted units to the respective gurneys and close all it to be ready for Outbound sorting (Putawall Sorting) in MAWM.
```

<a id="b02795"></a>
## b02795 — word/document\.xml/body/\*\[2795\]

```text
Resource Group Family Config Matrix
```

<a id="b02796"></a>
## b02796 — word/document\.xml/body/\*\[2796\]

```text
Resource Group Family Id	Batch Size Threshold	Manual Batch Release	Maximum Batches to Release	Minimum Batches to Release	Allow Pick Across Batches?
HM06	0.01	N	1 	1 	No
HM07	0.01	N	1 	1 	No
```

<a id="b02797"></a>
## b02797 — word/document\.xml/body/\*\[2797\]

```text
HM Sorter will release 1 resource batch per work release run (pack wave download)  and  each batch will contain a maximum of 26 order assigned per work resource.
```

<a id="b02798"></a>
## b02798 — word/document\.xml/body/\*\[2798\]

```text
Resource Group and Work Resource Config Matrix 
```

<a id="b02799"></a>
## b02799 — word/document\.xml/body/\*\[2799\]

```text
Dodgeville HM Sorter Resource Group
```

<a id="b02800"></a>
## b02800 — word/document\.xml/body/\*\[2800\]

```text
Resource  Group	Resource Group Type	Work Resource	Base Capacity (Order)	Maximum number of units	Maximum allowable volume	Maximum allowable weight
HM06	HM Sorter Chute	HM06-01	26	Null/Blank	Null/Blank	Null/Blank
HM06	HM Sorter Chute	HM06-02	26	Null/Blank	Null/Blank	Null/Blank
HM06		Up to 26 Diverts		Null/Blank	Null/Blank	Null/Blank
HM06	HM Sorter Chute	HM06-26	26	Null/Blank	Null/Blank	Null/Blank
```

<a id="b02801"></a>
## b02801 — word/document\.xml/body/\*\[2801\]

```text

```

<a id="b02802"></a>
## b02802 — word/document\.xml/body/\*\[2802\]

```text
Stevens Point HM Sorter Resource Group
```

<a id="b02803"></a>
## b02803 — word/document\.xml/body/\*\[2803\]

```text
Resource  Group	Resource Group Type	Work Resource	Base Capacity (Order)	Maximum number of units	Maximum allowable volume	Maximum allowable weight
HM07	HM Sorter Chute	HM07-01	26	Null/Blank	Null/Blank	Null/Blank
HM07	HM Sorter Chute	HM07-02	26	Null/Blank	Null/Blank	Null/Blank
HM07		Up to 26 Diverts		Null/Blank	Null/Blank	Null/Blank
HM07	HM Sorter Chute	HM07-26	26	Null/Blank	Null/Blank	Null/Blank
```

<a id="b02804"></a>
## b02804 — word/document\.xml/body/\*\[2804\]

```text

```

<a id="b02805"></a>
## b02805 — word/document\.xml/body/\*\[2805\]

```text
Feedback Manager
```

<a id="b02806"></a>
## b02806 — word/document\.xml/body/\*\[2806\]

```text
The Feedback Manager in MAWM keeps the work release engine informed about task progress and completion. When a resource is freed up, the Feedback Manager sends a message to the work release engine indicating a capacity change. This creates a continuous feedback loop, ensuring that the work release engine stays updated on the equipment’s capacity status. The Capacity Manager and Work Release use this information to assign work resources and release the next batch for the resource group or resource family group.
```

<a id="b02807"></a>
## b02807 — word/document\.xml/body/\*\[2807\]

```text
Re-Prioritization
```

<a id="b02808"></a>
## b02808 — word/document\.xml/body/\*\[2808\]

```text
The concept of priority is not a static. Priorities can change throughout the day and even after allocation have occurred. Unforeseen delays can occur at any time. Equipment may be understaffed and work can wait for longer than expected. The shipping plan can also change unexpectedly. Weather conditions and carrier availability can result in change of priority for certain. The work release engine provides a solution for this activity. Supervisors can re-prioritize rules for a pending work, by applying a new priority as needed to adapt to the changing conditions.
```

<a id="b02809"></a>
## b02809 — word/document\.xml/body/\*\[2809\]

```text
Sort Pack Resource Strategies 
```

<a id="b02810"></a>
## b02810 — word/document\.xml/body/\*\[2810\]

```text
A Sort Pack Resource Strategy is a set of parameters that control how pack allocations are sorted into work resources grouped within a resource group. 
```

<a id="b02811"></a>
## b02811 — word/document\.xml/body/\*\[2811\]

```text
Sorter A and B Sort Pack Resource Strategy
```

<a id="b02812"></a>
## b02812 — word/document\.xml/body/\*\[2812\]

```text
The Sorter-A and B Sort Pack Resource Strategy defines how work is distributed across Sorter-A and Sorter B work resources. 
```

<a id="b02813"></a>
## b02813 — word/document\.xml/body/\*\[2813\]

```text
Sort Pack Resource Work Release Criteria
```

<a id="b02814"></a>
## b02814 — word/document\.xml/body/\*\[2814\]

```text
Criteria Name	Selection Rules	Resource Group Eligibility
SA-Bag	Allocation.OrderCriteriaId = “SA” and 
olpn.Container size Id Start With Bag	SA-Bag
SA-Box	Allocation.OrderCriteriaId = “SA” and 
olpn.Container size Id Start With Box	SA-Box
SA-PackingSlip	Allocation.OrderCriteriaId = “SA” and 
<<Packing Slip Criteria>>	SA-PackingSlip
SA-Int	Allocation.OrderCriteriaId = “SA” and 
<<International Order Criteria>>	SA-Int
SB-Bag	Allocation.OrderCriteriaId = “SB” and 
olpn.Container size Id Start With Bag	SB-Bag
SB-Box	Allocation.OrderCriteriaId = “SB” and 
olpn.Container size Id Start With Box	SB-Box
SB-PackingSlip	Allocation.OrderCriteriaId = “SB” and 
<<Packing Slip Criteria>>	SB-PackingSlip
SB-Int	Allocation.OrderCriteriaId = “SB” and 
<<International Order Criteria>>	SB-Int
```

<a id="b02815"></a>
## b02815 — word/document\.xml/body/\*\[2815\]

```text

```

<a id="b02816"></a>
## b02816 — word/document\.xml/body/\*\[2816\]

```text


```

<a id="b02817"></a>
## b02817 — word/document\.xml/body/\*\[2817\]

```text
Sorter-X Sort Pack Resource Strategy
```

<a id="b02818"></a>
## b02818 — word/document\.xml/body/\*\[2818\]

```text
The Sorter-X sort resource strategy defines how work is distributed across Sorter-X work resources. 
```

<a id="b02819"></a>
## b02819 — word/document\.xml/body/\*\[2819\]

```text
Sort Pack Resource Work Release Criteria
```

<a id="b02820"></a>
## b02820 — word/document\.xml/body/\*\[2820\]

```text
Criteria Name	Selection Rules	Resource Group Eligibility
SX-BS1	Allocation.OrderCriteriaId = “SX” and 
olpn.Container size Id = SXBagS1	SX-10-S1-Bag, SX-30-S1-Bag
SX-BS2	Allocation.OrderCriteriaId =”SX” and 
olpn.Container size Id = SXBagS2	SX-10-S2-Bag, SX-30-S2-Bag
SX-Box	Allocation.OrderCriteriaId =”SX” and 
olpn.Container size Id Start With SXBox	SX-10-Box, SX-20-Box, SX-30-Box
SX-10-BS1	Allocation.OrderCriteriaId = “SX10” and 
olpn.Container size Id = SXBagS1	SX-10-S1-Bag
SX-10-BS2	Allocation.OrderCriteriaId = “SX10” and 
olpn.Container size Id = SXBagS2	SX-10-S2-Bag
SX-10-Box	Allocation.OrderCriteriaId = “SX10” and 
olpn.Container size Id Start With SXBox	SX-10-Box
SX-20-30-BS1	Allocation.OrderCriteriaId =”SX-20-30” and 
olpn.Container size Id = SXBagS1	SX-30-S1-Bag
SX-20-30-BS2	Allocation.OrderCriteriaId = “SX-20-30” and 
olpn.Container size Id = SXBagS2	SX-30-S2-Bag
SX-20-30-Box	Allocation.OrderCriteriaId = “SX-20-30” and 
olpn.Container size Id Start With SXBox	SX-20-Box, SX-30-Box
```

<a id="b02821"></a>
## b02821 — word/document\.xml/body/\*\[2821\]

```text

```

<a id="b02822"></a>
## b02822 — word/document\.xml/body/\*\[2822\]

```text
HM Sorter Sort Pack Resource Strategy
```

<a id="b02823"></a>
## b02823 — word/document\.xml/body/\*\[2823\]

```text
The HM Sorter Sort Pack Resource Strategy defines how work is distributed across HM06 and HM07 sorter work resources. 
```

<a id="b02824"></a>
## b02824 — word/document\.xml/body/\*\[2824\]

```text
Sort Pack Resource Work Release Criteria
```

<a id="b02825"></a>
## b02825 — word/document\.xml/body/\*\[2825\]

```text
Criteria Name	Selection Rules	Resource Group Eligibility
HM06	Allocation.OrderCriteriaId = “HM06” 	HM06
HM07	Allocation.OrderCriteriaId = “HM07” 	HM07
```

<a id="b02826"></a>
## b02826 — word/document\.xml/body/\*\[2826\]

```text

```

<a id="b02827"></a>
## b02827 — word/document\.xml/body/\*\[2827\]

```text


```

<a id="b02828"></a>
## b02828 — word/document\.xml/body/\*\[2828\]

```text
Picking Task Creation Strategy
```

<a id="b02829"></a>
## b02829 — word/document\.xml/body/\*\[2829\]

```text
A Picking task Creation is defined for each Order planning and define what type transaction is used to perform the picking execution.
```

<a id="b02830"></a>
## b02830 — word/document\.xml/body/\*\[2830\]

```text
Sorter A and B Picking Task Creation Strategy
```

<a id="b02831"></a>
## b02831 — word/document\.xml/body/\*\[2831\]

```text
The Sorter A and B Picking Task Creation Strategy is used to defined how the picking task are created for Sorter-A and Sorter-B during work release (direct task creation set to no) .
```

<a id="b02832"></a>
## b02832 — word/document\.xml/body/\*\[2832\]

```text
Picking Task Criteria
```

<a id="b02833"></a>
## b02833 — word/document\.xml/body/\*\[2833\]

```text
All task are created rule based, sequenced based on pick execution sequence break by pick zone and with a Task Threshold criteria to break the task either by pallet or gurney volume building zones.
```

<a id="b02834"></a>
## b02834 — word/document\.xml/body/\*\[2834\]

```text
Criteria Name	Description	Selection Rules	Task Execution mode	Transaction for the Task	Priority
SA Case Pick	Picking for Induction A	Allocation Order Criteria Id = “SA” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	SA Case Pick	20
SB Case Pick	Picking for Induction B	Allocation Order Criteria Id = “SB” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	SA Case Pick	20
SA Act Pick	Picking for Induction A	Allocation Order Criteria Id = “SA” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	SA Act Pick	20
SB Act Pick	Picking for Induction B	Allocation Order Criteria Id = “SB” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	SB Act Pick	20
```

<a id="b02835"></a>
## b02835 — word/document\.xml/body/\*\[2835\]

```text
Config Note: Task Threshold Criteria needs to be defined based on equipment constraints and building zones.
```

<a id="b02836"></a>
## b02836 — word/document\.xml/body/\*\[2836\]

```text


```

<a id="b02837"></a>
## b02837 — word/document\.xml/body/\*\[2837\]

```text
Sorter-X Picking Task Creation Strategy 
```

<a id="b02838"></a>
## b02838 — word/document\.xml/body/\*\[2838\]

```text
The Sorter-X  Picking Task Creation Strategy is used to defined how the picking task are created for Sorter-X during work release (direct task creation set to no) .
```

<a id="b02839"></a>
## b02839 — word/document\.xml/body/\*\[2839\]

```text
Picking Task Criteria
```

<a id="b02840"></a>
## b02840 — word/document\.xml/body/\*\[2840\]

```text
All task are created rule based, sequenced based on pick execution sequence break by pick zone and with a Task Threshold criteria to break the task either by pallet or gurney volume building zones.
```

<a id="b02841"></a>
## b02841 — word/document\.xml/body/\*\[2841\]

```text
Criteria Name	Description	Selection Rules	Task Execution mode	Transaction for the Task	Priority
SX Case Pick	Picking for Induction X	Allocation Order Criteria Id = “SX” or “SX-20-30” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	SX Case Pick	20
SY Case Pick	Picking for Induction Y	Allocation Order Criteria Id = “SX-10” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	SX Case Pick	20
SX Act Pick	Picking for Induction X	Allocation Order Criteria Id = SX” or “SX-20-30” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	SX Act Pick	20
SY Act Pick	Picking for Induction Y	Allocation Order Criteria Id = “SX-10” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	SY Act Pick	20
```

<a id="b02842"></a>
## b02842 — word/document\.xml/body/\*\[2842\]

```text
Config Note: Task Threshold Criteria needs to be defined based on equipment constraints and building zones.
```

<a id="b02843"></a>
## b02843 — word/document\.xml/body/\*\[2843\]

```text


```

<a id="b02844"></a>
## b02844 — word/document\.xml/body/\*\[2844\]

```text
HM Sorter Picking Task Creation Strategy 
```

<a id="b02845"></a>
## b02845 — word/document\.xml/body/\*\[2845\]

```text
The HM Sorter  Picking Task Creation Strategy is used to defined how the picking task are created for HM sorter during work release (direct task creation set to no) .
```

<a id="b02846"></a>
## b02846 — word/document\.xml/body/\*\[2846\]

```text
Picking Task Criteria
```

<a id="b02847"></a>
## b02847 — word/document\.xml/body/\*\[2847\]

```text
All task are created rule based, sequenced based on pick execution sequence break by pick zone and with a Task Threshold criteria to break the task either by pallet or gurney volume building zones.
```

<a id="b02848"></a>
## b02848 — word/document\.xml/body/\*\[2848\]

```text
Criteria Name	Description	Selection Rules	Task Execution mode	Transaction for the Task	Prty
HM06 Case Pick	Dodgeville HM Sorter Case Pick	Allocation Order Criteria Id = “HM06” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	HM06 Case Pick	20
HM07 Case Pick	Stevens Point HM Sorter Case Pick	Allocation Order Criteria Id = “HM07” and Allocation UOM Type Id = LPN
and item.extended.Sortable = true
	Pick into iLPN
(Pick into Cart ?)	SP Case Pick	20
HM06 Act Pick	Picking for Induction X	Allocation Order Criteria Id = “HM06” or “SX-20-30” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	HM06 Act Pick	20
HM07 Act Pick	Picking for Induction Y	Allocation Order Criteria Id = “HM07” and Allocation UOM Type Id not equal to LPN
and item.extended.Sortable = true
	Pick into Tote	SP Act Pick	20
HT Logo Pick	Heat Transfer Logo Pick	Allocation.PickAllocationZoneId equal to “<<Heat Transfer Allocation Zone>>”	Pick into Tote	HT Logo Pick	20
```

<a id="b02849"></a>
## b02849 — word/document\.xml/body/\*\[2849\]

```text
Config Note: Task Threshold Criteria needs to be defined based on equipment constraints and building zones.
```

<a id="b02850"></a>
## b02850 — word/document\.xml/body/\*\[2850\]

```text


```

<a id="b02851"></a>
## b02851 — word/document\.xml/body/\*\[2851\]

```text
Direct Task Release
```

<a id="b02852"></a>
## b02852 — word/document\.xml/body/\*\[2852\]

```text
Work Release is not leveraged for Non MHE Production Orders,  Wholesale, Transfers, Pick Cart Orders or Special Orders as each wave creates the associated tasks they are released for immediate execution. Depending on volume and capacities, Lands’ End may also choose to create tasks in a Held status and manually release them as required. 
```

<a id="b02853"></a>
## b02853 — word/document\.xml/body/\*\[2853\]

```text
Direct Task Creation Strategy
```

<a id="b02854"></a>
## b02854 — word/document\.xml/body/\*\[2854\]

```text
The Production Order Task Creation Strategy is used to defined how the picking task are created for non MHE production order picks post waving.
```

<a id="b02855"></a>
## b02855 — word/document\.xml/body/\*\[2855\]

```text
Picking Task Criteria
```

<a id="b02856"></a>
## b02856 — word/document\.xml/body/\*\[2856\]

```text
All task are created rule based, sequenced based on pick execution sequence break by pick zone and with a Task Threshold criteria to break the task either by pallet or gurney volume building zones.
```

<a id="b02857"></a>
## b02857 — word/document\.xml/body/\*\[2857\]

```text
Criteria Name & Transaction for the Task	Description	Selection Rules	Task Execution mode	Task Threshold / Break By	Priority
VAS Case Pick	Large and Enterprise Orders  Logo VAS LPN Pull	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Pick into iLPN	Every distinct value Original Order Id and Pick Allocation Zone
Task Capacity up to a pallet	20
VAS Act Pick	Large and Enterprise Orders  Logo VAS Blk Pick	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( 
Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Pick into Tote	Every distinct production order value (original order id) 

Task Capacity up to a gurney volume	
SP Case Pick	Large and Enterprise Orders  Logo VAS LPN Pull	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Pick into iLPN	Every distinct value Original Order Id and Pick Allocation Zone
Task Capacity up to a pallet	20
SP Act Pick	Large and Enterprise Orders  Logo VAS Blk Pick	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( 
Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Pick into Tote	Every distinct production order value (original order id) 

Task Capacity up to a gurney volume	
HEM VAS Case Pick	Hemming VAS LPN Pull	Production Order – Hemming” AND 
Order Fulfillment Code != X	Pick into iLPN	Every distinct Order Extended Hemming Group
Task Capacity up to a pallet	20
HEM VAS Act Pick	Hemming Multi VAS LPN Pull	“Production Order – Hemming” AND 
Order Fulfillment Code = X	Pick into Tote	Every distinct value Original Order Id and Pick Allocation Zone
Task Capacity up to a pallet	20
Name Bdg Pick	Units pick from active for production order	Allocation.PickAllocationZoneId equal to “<<Name Badges Allocation Zone>>”	Pick into Tote	Every distinct production order value (original order id) 
Task Capacity up to envelope volume.	20
Singles Pulls	Singles Pulls	Order Type Is Equal to “CUSTREGORD” AND 
Single Line Order is true AND Single Unit Order is true AND
Order Extended Gift Box Indicator is false	Pick into iLPN	Task Capacity up to a pallet	20
Single Act Pick	Bulk Pick for singles packing	Order Type Is Equal to “CUSTREGORD” AND 
Single Line Order is true AND Single Unit Order is true AND
Order Extended Gift Box Indicator is false	Pick into Tote	Task Capacity up to a gurney	30
Store Pulls	Store Pulls	Allocation UOM Type Id = LPN 
and Order Type Is Equal to “Store Order” or “Replen Store Order”	Pick into iLPN	Task Capacity up to a pallet	20
Store Act  Pick	Bulk pick for put to store	Order Type Is Equal to “STORORD” or “STORRPLNORD”	Pick into Tote	Task Capacity up to a gurney	30
Olpn to Pallet	Pick Olpn into a pallet from reserve	Order.Extended. ParcelRateShopGroupId is null and 
(
Order Type is equal to “WHSLORD” or “OTRNORD” or “STKTRNORD” or “CHARORD” or “LIQORD” or “MRKTORD” or “PSHORD”
)	Pick into Olpn	Task Capacity up to a pallet	30
Olpn Pick	Pick units from active into an Olpn	Order.Extended. ParcelRateShopGroupId is null and 
(
Order Type is equal to “WHSLORD” or “OTRNORD” or “STKTRNORD” or “CHARORD” or “LIQORD” or “MRKTORD” or “PSHORD”
)	Pick into Olpn	Olpn Pick	30
Prepack Pulls	Prepack LPN Pulls	Order.OrderProcessTypeId = "Work Order"	Pick into iLPN	Task Capacity up to a pallet	20
Prepack Act Pick	Prepack Active Pick	Order.OrderProcessTypeId = "Work Order"	Pick into Tote	Task Capacity up to a gurney	20
Post-VAS Auto Pick	Post-VAS Auto Pick	Order Type Is Equal to “CUSTVASORD and  Fulfillment Code is Equal to “S” or “L”	Pick into Olpn	Olpn Pick	30
Post VAS Multis Pick	Post VAS Multis Pick	Order Type Is Equal to “CUSTVASORD and  Fulfillment Code is Equal to “M”	Pick into Tote	Task Capacity up to a gurney	20
```

<a id="b02858"></a>
## b02858 — word/document\.xml/body/\*\[2858\]

```text
Config Note: Task Threshold Criteria needs to be defined based on equipment constraints and building zones. 
Post-VAS Auto Pick must have Should the Task be Auto Completed? = Yes
```

<a id="b02859"></a>
## b02859 — word/document\.xml/body/\*\[2859\]

```text
MHE Messages
```

<a id="b02860"></a>
## b02860 — word/document\.xml/body/\*\[2860\]

```text
Reference to Lands' End's MHE Communications Document for detailed information on MHE touchpoints and message formats.
```

<a id="b02861"></a>
## b02861 — word/document\.xml/body/\*\[2861\]

```text
Gaps and Extensions
```

<a id="b02862"></a>
## b02862 — word/document\.xml/body/\*\[2862\]

```text
Gap #	Name	Description
AU02	MHE Message Handlers	Receiving, Shipping and Replenishment Conveyor and pack wave download.
AU03	MHE Induction and Pick & Short Confirmation	Implement MHE pick and short confirmations and MHE Unit sort pack details.
AU04	MHE Batch Loaded and Sort Diverts	AU04 – Implement MHE Task release post MHE confirmation and sort diverts confirmations. 
```

<a id="b02863"></a>
## b02863 — word/document\.xml/body/\*\[2863\]

```text

```

<a id="b02864"></a>
## b02864 — word/document\.xml/body/\*\[2864\]

```text
Replenishment
```

<a id="b02865"></a>
## b02865 — word/document\.xml/body/\*\[2865\]

```text
Replenishment allocations from LPN storage to unit pick locations are generated during the replenishment wave or picking wave to address picking needs not currently met at the pick locations. Replenishments created during pick waves serve as the primary source of replenishment at Lands’ End, while those generated during replenishment waves supplement any additional requirements. Pick locations are replenished up to their maximum capacity or based on need, as determined by the Replenishment Strategy. Replenishments can also be configured to occur when a user shorts a pick, provided the reason code associated with the pick exception is configured to allow it.
```

<a id="b02866"></a>
## b02866 — word/document\.xml/body/\*\[2866\]

```text
Lands’ End also has the option to configure and use Lean Time replenishment rules to replenish permanent locations for items up to the maximum or existing dynamic locations for the item up to the maximum. Lean Time replenishments do not need order demand in the system to allocate inventory, these are rule-based replenishments that take advantage of down time in the warehouse to top up existing locations to prepare for the next round of picking. Allocations created via Lean Time replenishment follow the same rules and constraints as replenishments created via replenishment wave or picking wave. 
```

<a id="b02867"></a>
## b02867 — word/document\.xml/body/\*\[2867\]

```text
Assumptions
```

<a id="b02868"></a>
## b02868 — word/document\.xml/body/\*\[2868\]

```text
All iLPNs are Single SKU
```

<a id="b02869"></a>
## b02869 — word/document\.xml/body/\*\[2869\]

```text
Lands’ End does not allocate partial iLPNs for orders or replenishments
```

<a id="b02870"></a>
## b02870 — word/document\.xml/body/\*\[2870\]

```text
Replenishment eligibility is determined by the maximum number of units for the SKU that can physically fit into the location, same as the putaway eligibility process. 
```

<a id="b02871"></a>
## b02871 — word/document\.xml/body/\*\[2871\]

```text
Replenishments assign items to dynamic locations as needed
```

<a id="b02872"></a>
## b02872 — word/document\.xml/body/\*\[2872\]

```text
Permanent locations are replenished as a priority, then existing dynamic locations, then new dynamic location assignments
```

<a id="b02873"></a>
## b02873 — word/document\.xml/body/\*\[2873\]

```text
New dynamic locations are not created if the item currently exists in the maximum number of allowable dynamic locations (configurable, set to 3 on day 1)
```

<a id="b02874"></a>
## b02874 — word/document\.xml/body/\*\[2874\]

```text
Replenishment waves look at current order demand from orders in MAWM to determine replenishment allocations. 
```

<a id="b02875"></a>
## b02875 — word/document\.xml/body/\*\[2875\]

```text

```

<a id="b02876"></a>
## b02876 — word/document\.xml/body/\*\[2876\]

```text
Replenish iLPNs to Unit Storage
```

<a id="b02877"></a>
## b02877 — word/document\.xml/body/\*\[2877\]

```text
At Lands’ End all replenishments come from LPN or Pallet storage with the destination of a Unit storage location. Replenishments from LPN storage that are allocated to the main Unit storage picking module are inducted to the replenishment conveyor after being pulled to a pallet. As replenishment tasks are pulled, an MHE message is sent from MAWM to MHE with destination details of the iLPNs that are to be inducted. The replenishment conveyor takes all iLPNs to the Unit storage area where users Make Put Carts with ‘like’ iLPNs and execute the Put Carts once they are full. 
```

<a id="b02878"></a>
## b02878 — word/document\.xml/body/\*\[2878\]

```text
Replenishments from LPN storage can also be allocated to Bulk Unit storage. These replenishments are pulled to a pallet but are not inducted to the replenishment conveyor, these are taken directly to the Bulk Unit storage area to be staged Once pallets are staged in the Bulk area, users make a put cart and complete the putaway for each iLPN on the pallet into the destination locations. 
```

<a id="b02879"></a>
## b02879 — word/document\.xml/body/\*\[2879\]

```text
GOH Replenishments require users to palletize the inventory. In Reedsburg, the pallets are placed in designated pick and drop locations to be transported via elevator to the GOH area from main reserve. In Dodgeville, the pallets are staged in a designated GOH staging location. If the replenishment is for iLPNs already in GOH reserve locations, the iLPNs are pulled and staged by the carousel before being put away into their final locations. When pallets arrive at the carousels, users put away each iLPN on the pallet into its destination location within the carousel.  
```

<a id="b02880"></a>
## b02880 — word/document\.xml/body/\*\[2880\]

```text
User Story: Pull iLPNs to Pallet for Replenishment Conveyor 
```

<a id="b02881"></a>
## b02881 — word/document\.xml/body/\*\[2881\]

```text
Who	What	Why
Replenishment Puller	Pull iLPNs to a pallet and induct to replenishment conveyor	iLPNs are allocated from reserve storage to unit storage. These iLPNs are pulled to a pallet and inducted to the replenishment conveyor to be putaway to the final destination.
```

<a id="b02882"></a>
## b02882 — word/document\.xml/body/\*\[2882\]

```text

```

<a id="b02883"></a>
## b02883 — word/document\.xml/body/\*\[2883\]

```text
Process
```

<a id="b02884"></a>
## b02884 — word/document\.xml/body/\*\[2884\]

```text
User enters task group and selects Assign Task
```

<a id="b02885"></a>
## b02885 — word/document\.xml/body/\*\[2885\]

```text
System prompts for pallet
```

<a id="b02886"></a>
## b02886 — word/document\.xml/body/\*\[2886\]

```text
System directs user to a location and prompts for an iLPN
```

<a id="b02887"></a>
## b02887 — word/document\.xml/body/\*\[2887\]

```text
User scans iLPN and that completes the pull
```

<a id="b02888"></a>
## b02888 — word/document\.xml/body/\*\[2888\]

```text
Once all pulls are complete for the replenishment task, users are directed to take the pallet to the induction conveyor
```

<a id="b02889"></a>
## b02889 — word/document\.xml/body/\*\[2889\]

```text
Users scan the induction conveyor location to locate the iLPNs to the conveyor staging location
```

<a id="b02890"></a>
## b02890 — word/document\.xml/body/\*\[2890\]

```text
Updates
```

<a id="b02891"></a>
## b02891 — word/document\.xml/body/\*\[2891\]

```text
iLPNs are located to the conveyor staging location
```

<a id="b02892"></a>
## b02892 — word/document\.xml/body/\*\[2892\]

```text
MHE message is sent to Matthews with iLPN information to expect
```

<a id="b02893"></a>
## b02893 — word/document\.xml/body/\*\[2893\]

```text

```

<a id="b02894"></a>
## b02894 — word/document\.xml/body/\*\[2894\]

```text


```

<a id="b02895"></a>
## b02895 — word/document\.xml/body/\*\[2895\]

```text
User Story: Build & Execute Putaway Cart for iLPNs
```

<a id="b02896"></a>
## b02896 — word/document\.xml/body/\*\[2896\]

```text
Who	What	Why
Put Cart Builder	Make a Put Cart using iLPNs on the replenishment Conveyor	iLPNs are sent to the picking area on the replenishment conveyor. Users build a putaway cart with ‘like’ iLPNs and then execute the cart to complete the putaway.
```

<a id="b02897"></a>
## b02897 — word/document\.xml/body/\*\[2897\]

```text
See User Story: Build & Execute Putaway Cart for iLPNs for additional details on this process. 
```

<a id="b02898"></a>
## b02898 — word/document\.xml/body/\*\[2898\]

```text
User Story: Pull iLPNs to Pallet for Bulk Unit Storage 
```

<a id="b02899"></a>
## b02899 — word/document\.xml/body/\*\[2899\]

```text
Who	What	Why
Replenishment Puller	Pull iLPNs to a pallet and take to Bulk Unit Storage	iLPNs are allocated from reserve storage to unit storage. These iLPNs are pulled to a pallet and taken directly to the Bulk Unit storage area to be putaway
```

<a id="b02900"></a>
## b02900 — word/document\.xml/body/\*\[2900\]

```text

```

<a id="b02901"></a>
## b02901 — word/document\.xml/body/\*\[2901\]

```text
Process
```

<a id="b02902"></a>
## b02902 — word/document\.xml/body/\*\[2902\]

```text
User enters task group and selects Assign Task
```

<a id="b02903"></a>
## b02903 — word/document\.xml/body/\*\[2903\]

```text
System prompts for pallet
```

<a id="b02904"></a>
## b02904 — word/document\.xml/body/\*\[2904\]

```text
System directs user to a location and prompts for an iLPN
```

<a id="b02905"></a>
## b02905 — word/document\.xml/body/\*\[2905\]

```text
User scans iLPN and that completes the pull
```

<a id="b02906"></a>
## b02906 — word/document\.xml/body/\*\[2906\]

```text
Once all pulls are complete for the replenishment task, users are directed to take the pallet to the Bulk Unit storage staging location
```

<a id="b02907"></a>
## b02907 — word/document\.xml/body/\*\[2907\]

```text

```

<a id="b02908"></a>
## b02908 — word/document\.xml/body/\*\[2908\]

```text
Updates
```

<a id="b02909"></a>
## b02909 — word/document\.xml/body/\*\[2909\]

```text
Pallet and iLPNs are staged at Bulk Unit storage location
```

<a id="b02910"></a>
## b02910 — word/document\.xml/body/\*\[2910\]

```text

```

<a id="b02911"></a>
## b02911 — word/document\.xml/body/\*\[2911\]

```text
User Story: Putaway Bulk iLPNs on Pallet 
```

<a id="b02912"></a>
## b02912 — word/document\.xml/body/\*\[2912\]

```text
Who	What	Why
Putaway Associate	Put each iLPN on pallet away into destination location	Pallets for Bulk iLPNs are staged in the Bulk area. Users in the Bulk area pick up the pallets and complete the putaway for each iLPN on the pallet.
```

<a id="b02913"></a>
## b02913 — word/document\.xml/body/\*\[2913\]

```text

```

<a id="b02914"></a>
## b02914 — word/document\.xml/body/\*\[2914\]

```text
See User Story: Putaway iLPNs by Pallet for additional details on this process. 
```

<a id="b02915"></a>
## b02915 — word/document\.xml/body/\*\[2915\]

```text

```

<a id="b02916"></a>
## b02916 — word/document\.xml/body/\*\[2916\]

```text
User Story: Pull iLPNs to Pallet for GOH Unit Storage
```

<a id="b02917"></a>
## b02917 — word/document\.xml/body/\*\[2917\]

```text
Who	What	Why
Replenishment Puller	Pull iLPNs to a pallet and take to Elevator or Carousel	iLPNs are allocated from reserve storage to GOH unit storage. These iLPNs are pulled to a pallet and taken to the elevator or directly to the carousel for putaway.
```

<a id="b02918"></a>
## b02918 — word/document\.xml/body/\*\[2918\]

```text

```

<a id="b02919"></a>
## b02919 — word/document\.xml/body/\*\[2919\]

```text
Process
```

<a id="b02920"></a>
## b02920 — word/document\.xml/body/\*\[2920\]

```text
User enters task group and selects Assign Task
```

<a id="b02921"></a>
## b02921 — word/document\.xml/body/\*\[2921\]

```text
System prompts for pallet
```

<a id="b02922"></a>
## b02922 — word/document\.xml/body/\*\[2922\]

```text
System directs user to a location and prompts for an iLPN
```

<a id="b02923"></a>
## b02923 — word/document\.xml/body/\*\[2923\]

```text
User scans iLPN and that completes the pull
```

<a id="b02924"></a>
## b02924 — word/document\.xml/body/\*\[2924\]

```text
Once all pulls are complete for the replenishment task
```

<a id="b02925"></a>
## b02925 — word/document\.xml/body/\*\[2925\]

```text
If iLPNs are being pulled from main reserve storage, users are directed to stage the pallet to the GOH area.
```

<a id="b02926"></a>
## b02926 — word/document\.xml/body/\*\[2926\]

```text
If iLPNs are being pulled from GOH reserve storage, users are directed to stage the pallet at the carousel for putaway
```

<a id="b02927"></a>
## b02927 — word/document\.xml/body/\*\[2927\]

```text

```

<a id="b02928"></a>
## b02928 — word/document\.xml/body/\*\[2928\]

```text
Updates
```

<a id="b02929"></a>
## b02929 — word/document\.xml/body/\*\[2929\]

```text
Pallet and iLPNs are staged at Bulk Unit storage location
```

<a id="b02930"></a>
## b02930 — word/document\.xml/body/\*\[2930\]

```text

```

<a id="b02931"></a>
## b02931 — word/document\.xml/body/\*\[2931\]

```text
User Story: Putaway GOH iLPNs on Pallet
```

<a id="b02932"></a>
## b02932 — word/document\.xml/body/\*\[2932\]

```text
Who	What	Why
Replenishment Puller	Pull iLPNs to a pallet and take to Elevator or Carousel	iLPNs are allocated from reserve storage to GOH unit storage. These iLPNs are pulled to a pallet and taken to the elevator or directly to the carousel for putaway.
```

<a id="b02933"></a>
## b02933 — word/document\.xml/body/\*\[2933\]

```text

```

<a id="b02934"></a>
## b02934 — word/document\.xml/body/\*\[2934\]

```text
Process
```

<a id="b02935"></a>
## b02935 — word/document\.xml/body/\*\[2935\]

```text
User scans a pallet that is staged in the Elevator staging or Carousel staging area
```

<a id="b02936"></a>
## b02936 — word/document\.xml/body/\*\[2936\]

```text
System takes the user into the associated putaway task
```

<a id="b02937"></a>
## b02937 — word/document\.xml/body/\*\[2937\]

```text
If the pallet is staged in elevator staging, MAWM directs the user to move the pallet to carousel staging
```

<a id="b02938"></a>
## b02938 — word/document\.xml/body/\*\[2938\]

```text
From carousel staging, MAWM prompts users to putaway each iLPN into an associated Unit storage location
```

<a id="b02939"></a>
## b02939 — word/document\.xml/body/\*\[2939\]

```text
MAWM displays the destination Unit Storage location to the user
```

<a id="b02940"></a>
## b02940 — word/document\.xml/body/\*\[2940\]

```text
The user rotates the carousel around until the destination location is available
```

<a id="b02941"></a>
## b02941 — word/document\.xml/body/\*\[2941\]

```text
User scans the iLPN directed for putaway and hangs contents on the carousel rack
```

<a id="b02942"></a>
## b02942 — word/document\.xml/body/\*\[2942\]

```text
This process is complete for each iLPN on the pallet. 
```

<a id="b02943"></a>
## b02943 — word/document\.xml/body/\*\[2943\]

```text

```

<a id="b02944"></a>
## b02944 — word/document\.xml/body/\*\[2944\]

```text
Updates
```

<a id="b02945"></a>
## b02945 — word/document\.xml/body/\*\[2945\]

```text
iLPNs are consumed to the Unit Storage locations
```

<a id="b02946"></a>
## b02946 — word/document\.xml/body/\*\[2946\]

```text
On Hand quantity for the Unit Storage locations is adjusted 
```

<a id="b02947"></a>
## b02947 — word/document\.xml/body/\*\[2947\]

```text
Replenishment Task is ‘complete’
```

<a id="b02948"></a>
## b02948 — word/document\.xml/body/\*\[2948\]

```text
User Story: Pull Pallet for Replenishment  
```

<a id="b02949"></a>
## b02949 — word/document\.xml/body/\*\[2949\]

```text
Who	What	Why
Replenishment Puller	Pull full Pallets for Replenishment	Full pallets, with multiple iLPNs, are allocated from pallet storage to unit storage. Users pull the full pallet and locate it to the destination unit storage location.
```

<a id="b02950"></a>
## b02950 — word/document\.xml/body/\*\[2950\]

```text

```

<a id="b02951"></a>
## b02951 — word/document\.xml/body/\*\[2951\]

```text
Process
```

<a id="b02952"></a>
## b02952 — word/document\.xml/body/\*\[2952\]

```text
User enters task group and selects Assign Task
```

<a id="b02953"></a>
## b02953 — word/document\.xml/body/\*\[2953\]

```text
System directs user to a location and prompts for a pallet
```

<a id="b02954"></a>
## b02954 — word/document\.xml/body/\*\[2954\]

```text
User scans Pallet ID and that completes the pull for the pallet and all iLPNs on the pallet
```

<a id="b02955"></a>
## b02955 — word/document\.xml/body/\*\[2955\]

```text
MAWM directs the user to take the pallet to the Unit storage location
```

<a id="b02956"></a>
## b02956 — word/document\.xml/body/\*\[2956\]

```text
User scans the Unit Storage Location to consume pallet contents to the location
```

<a id="b02957"></a>
## b02957 — word/document\.xml/body/\*\[2957\]

```text
If there are remaining units in the unit storage location from the previous pallet, they are removed from the location, the pallet is dropped, and the additional units are placed on top of the pallet. 
```

<a id="b02958"></a>
## b02958 — word/document\.xml/body/\*\[2958\]

```text
Updates
```

<a id="b02959"></a>
## b02959 — word/document\.xml/body/\*\[2959\]

```text

```

<a id="b02960"></a>
## b02960 — word/document\.xml/body/\*\[2960\]

```text
All iLPNs on the pallet are consumed to the Unit Storage location
```

<a id="b02961"></a>
## b02961 — word/document\.xml/body/\*\[2961\]

```text
On Hand quantity for the Unit Storage location is adjusted 
```

<a id="b02962"></a>
## b02962 — word/document\.xml/body/\*\[2962\]

```text
Replenishment Task is ‘complete’
```

<a id="b02963"></a>
## b02963 — word/document\.xml/body/\*\[2963\]

```text
MHE Messages
```

<a id="b02964"></a>
## b02964 — word/document\.xml/body/\*\[2964\]

```text
Reference to Lands' End's MHE Communications Document for detailed information on MHE touchpoints and message formats.
```

<a id="b02965"></a>
## b02965 — word/document\.xml/body/\*\[2965\]

```text
Features
```

<a id="b02966"></a>
## b02966 — word/document\.xml/body/\*\[2966\]

```text
Lean Time Replenishment 
```

<a id="b02967"></a>
## b02967 — word/document\.xml/body/\*\[2967\]

```text
Lean Time Replenishment is a manual method of triggering replenishment tasks to restock pick locations using inventory from reserve storage locations. This process allows for the generation of replenishment tasks outside the wave task generation process and is typically performed during periods of low shipping volume.
```

<a id="b02968"></a>
## b02968 — word/document\.xml/body/\*\[2968\]

```text
Lean Time Replenishment occurs before running a wave, at the start of the day, or after a wave when all associated picking processes have been completed. It ensures that pick locations are fully stocked and prepared for subsequent waves. The user selects either a range of locations or specific items to replenish. The system then evaluates inventory levels based on either the location's minimum threshold or a specified percentage of its maximum inventory level. If the current inventory level falls below the specified minimum, the system generates a replenishment task to restock the location to its maximum capacity.
```

<a id="b02969"></a>
## b02969 — word/document\.xml/body/\*\[2969\]

```text
Lands’ End runs the Lean Time Replenishment process daily at 10:00 PM CST via a scheduled job to restock all active locations before the order planning wave for the next day. This ensures that active locations are replenished to full capacity before batch release and the picking process begins for the next workday.
```

<a id="b02970"></a>
## b02970 — word/document\.xml/body/\*\[2970\]

```text
Auto Substitute iLPN
```

<a id="b02971"></a>
## b02971 — word/document\.xml/body/\*\[2971\]

```text

```

<a id="b02972"></a>
## b02972 — word/document\.xml/body/\*\[2972\]

```text
During the iLPN pulling process, if MAWM directs the user to a location and prompts for an iLPN that is inaccessible (it is on the bottom or behind other iLPNs and is not scannable or reachable), users have the option to scan another iLPN that is available in the location to attempt to substitute the iLPN. MAWM allows iLPNs to be substituted with other iLPNs if all of the iLPN details are the same between both iLPNs. If the iLPN scanned is not a match for substitution, MAWM gives the user an error and prompts for the initial iLPN. If the iLPN scanned is a match for substitution, MAWM accepts the scanned iLPN for the pull and proceeds to the next task detail. This does not require the user to take an additional action to enable the function. 
```

<a id="b02973"></a>
## b02973 — word/document\.xml/body/\*\[2973\]

```text
Alternate iLPN (not currently utilized)
```

<a id="b02974"></a>
## b02974 — word/document\.xml/body/\*\[2974\]

```text

```

<a id="b02975"></a>
## b02975 — word/document\.xml/body/\*\[2975\]

```text
If a user is brought to a location that is physically empty, the user can elect the “Alternate” function. This triggers MAWM to search for other locations that may have matching iLPNs, and if one is found, MAWM will allocate that iLPN and direct the user to that location. If one is not found, MAWM displays a message indicating an alternate could not be found and the user must cancel the replenishment. Regardless, when the “Alternate” function is initiated, based on the reason code entered, MAWM applies a “Lost in Warehouse” condition code to the originally requested LPN, making it unavailable for further allocation (this is configurable based on the reason code entered). Lands’ End has the ability to control which zones MAWM should search based on the exception code entered (or defaulted) when performing an alternate search, as well as whether or not to enforce FIFO. 
```

<a id="b02976"></a>
## b02976 — word/document\.xml/body/\*\[2976\]

```text
Skip Cancel
```

<a id="b02977"></a>
## b02977 — word/document\.xml/body/\*\[2977\]

```text

```

<a id="b02978"></a>
## b02978 — word/document\.xml/body/\*\[2978\]

```text
If for whatever reason, the user does not wish to search for an alternate, they can use the “Skip Cancel” function to short the replenishment. This triggers a “Lost in Warehouse” condition code for the missing iLPN, as well as a cycle count for the location.
```

<a id="b02979"></a>
## b02979 — word/document\.xml/body/\*\[2979\]

```text
Key Interfaces
```

<a id="b02980"></a>
## b02980 — word/document\.xml/body/\*\[2980\]

```text
None Identified
```

<a id="b02981"></a>
## b02981 — word/document\.xml/body/\*\[2981\]

```text
Reports, Dashboards, Alerts
```

<a id="b02982"></a>
## b02982 — word/document\.xml/body/\*\[2982\]

```text
Name	Description	Frequency	User/Dept	Type
Replenishment Task List	Details all Replenishment tasks that are created with Replenishment or Picking wave	As needed	Wave Control	WM Report
```

<a id="b02983"></a>
## b02983 — word/document\.xml/body/\*\[2983\]

```text

```

<a id="b02984"></a>
## b02984 — word/document\.xml/body/\*\[2984\]

```text
Gaps and Extensions
```

<a id="b02985"></a>
## b02985 — word/document\.xml/body/\*\[2985\]

```text
None Identified
```

<a id="b02986"></a>
## b02986 — word/document\.xml/body/\*\[2986\]

```text
Labor Management
```

<a id="b02987"></a>
## b02987 — word/document\.xml/body/\*\[2987\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b02988"></a>
## b02988 — word/document\.xml/body/\*\[2988\]

```text
Picking
```

<a id="b02989"></a>
## b02989 — word/document\.xml/body/\*\[2989\]

```text
MAMW provides a unified picking flow that supports various picking methods, including pick-to-tote, pulling iLPN from storage, picking to cubed and non-cubed oLPN, picking for non-cubed orders, pick-to-pallet, full pallet pull, and pick-to-cart. Both user-initiated and system-initiated picking are supported.
```

<a id="b02990"></a>
## b02990 — word/document\.xml/body/\*\[2990\]

```text
Broadly, picking can be classified as pick-to-tote, pick-to-oLPN, pull iLPN, pick-to-pallet, and pick-to-cart. Lands' End classifies these picking methods with different transaction IDs based on the processing equipment used during and after picking, which can be grouped into task groups with specific labor metrics. The following sections lists the different picking methods and the expected transaction IDs to be configured. 
```

<a id="b02991"></a>
## b02991 — word/document\.xml/body/\*\[2991\]

```text
Assumptions
```

<a id="b02992"></a>
## b02992 — word/document\.xml/body/\*\[2992\]

```text
Lands’ End does not perform Zone Picking or Zone Passing
```

<a id="b02993"></a>
## b02993 — word/document\.xml/body/\*\[2993\]

```text
All picking is performed using WM Mobile picking transactions
```

<a id="b02994"></a>
## b02994 — word/document\.xml/body/\*\[2994\]

```text
Picking updates occur real-time, when a user confirms a quantity to be picked, MAWM reduces the on-hand quantity accordingly
```

<a id="b02995"></a>
## b02995 — word/document\.xml/body/\*\[2995\]

```text
oLPN Level Order Shortages are created for picking shortages
```

<a id="b02996"></a>
## b02996 — word/document\.xml/body/\*\[2996\]

```text
Picking tasks for Production Orders are user-initiated by scanning the task ID from a task labels printed after waving by the Lands’ End VAS wave manager.
```

<a id="b02997"></a>
## b02997 — word/document\.xml/body/\*\[2997\]

```text
Two tasks are generated for the Heat Transfer production order by dividing the task based on pick zones(Hi-Bay (BLD02), Std Reserve (BLD06), Heat Transfer Logo Pick Zone (Stevens Point), etc.)
```

<a id="b02998"></a>
## b02998 — word/document\.xml/body/\*\[2998\]

```text
Large Production Orders and Enterprise Orders could be packed into multiples gurneys post-vas that will share same gurney ID (pallet ID) in Manhattan. SOP is defined by Lands’ End to maintain all gurney together in the floor during the VAS process.
```

<a id="b02999"></a>
## b02999 — word/document\.xml/body/\*\[2999\]

```text

```

<a id="b03000"></a>
## b03000 — word/document\.xml/body/\*\[3000\]

```text


```

<a id="b03001"></a>
## b03001 — word/document\.xml/body/\*\[3001\]

```text
Picking Strategy
```

<a id="b03002"></a>
## b03002 — word/document\.xml/body/\*\[3002\]

```text
The pick strategy defines the business configuration for the picking process. The strategy contains parameters that need to be configured at the strategy level. It also links one or more pick criteria depending on the defined rule.
```

<a id="b03003"></a>
## b03003 — word/document\.xml/body/\*\[3003\]

```text
Tasks are created during wave processing using Picking task creation rules. These rules assign specific pick transactions that identify the respective business processes described in each picking user stories.
```

<a id="b03004"></a>
## b03004 — word/document\.xml/body/\*\[3004\]

```text
User Stories
```

<a id="b03005"></a>
## b03005 — word/document\.xml/body/\*\[3005\]

```text
User Story: HM LPN Pull
```

<a id="b03006"></a>
## b03006 — word/document\.xml/body/\*\[3006\]

```text
Who	What	Why
Forklift Operator
Crane Operator	Pull LPNs from reserve locations.	Pull LPNs from reserved storage locations to fulfill Production Orders, which will be sorted by the HM sorter.
```

<a id="b03007"></a>
## b03007 — word/document\.xml/body/\*\[3007\]

```text

```

<a id="b03008"></a>
## b03008 — word/document\.xml/body/\*\[3008\]

```text
The HM LPN pull transaction is used to pull LPNs from reserve locations into a pallet and putaway to a HM Sorter induction staging location based in the HM Sorter facility.
```

<a id="b03009"></a>
## b03009 — word/document\.xml/body/\*\[3009\]

```text
The tasks are created during task release and are generated based on resource batch IDs without mixing batches. Additionally, tasks are divided by pick zone, pallet capacity and are user-initiated by scanning a task ID from the task labels that are printed post-waving and work release from the VAS wave monitor stations.
```

<a id="b03010"></a>
## b03010 — word/document\.xml/body/\*\[3010\]

```text
Assumptions
```

<a id="b03011"></a>
## b03011 — word/document\.xml/body/\*\[3011\]

```text
Each order will have a Logo ID attribute, which is used to build batches in the HM sorter and is aggregated in MAWM during order import by Logo ID.
```

<a id="b03012"></a>
## b03012 — word/document\.xml/body/\*\[3012\]

```text
Heat transfer logo item/material is picked with own picking transaction documented in story 22.3.5.
```

<a id="b03013"></a>
## b03013 — word/document\.xml/body/\*\[3013\]

```text
A task path restriction is used when the LPN pull is from a high-bay or a reserve location, splitting the task into two or three steps based on the requirements.  
```

<a id="b03014"></a>
## b03014 — word/document\.xml/body/\*\[3014\]

```text

```

<a id="b03015"></a>
## b03015 — word/document\.xml/body/\*\[3015\]

```text
Criteria
```

<a id="b03016"></a>
## b03016 — word/document\.xml/body/\*\[3016\]

```text

```

<a id="b03017"></a>
## b03017 — word/document\.xml/body/\*\[3017\]

```text
The HM LPN Pull transaction applies to orders that matches the following criteria:
```

<a id="b03018"></a>
## b03018 — word/document\.xml/body/\*\[3018\]

```text
Order Type IS “PRODLOGO” OR “PRODHT”
AND
Order Enterprise Code is null 
AND
(
    Order Fulfillment Code is equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is false)
)
AND Pick Allocation Zone Id is not HT OR NBDG
```

<a id="b03019"></a>
## b03019 — word/document\.xml/body/\*\[3019\]

```text

```

<a id="b03020"></a>
## b03020 — word/document\.xml/body/\*\[3020\]

```text
Process
```

<a id="b03021"></a>
## b03021 — word/document\.xml/body/\*\[3021\]

```text
User selects the “Production Order” task group.
```

<a id="b03022"></a>
## b03022 — word/document\.xml/body/\*\[3022\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03023"></a>
## b03023 — word/document\.xml/body/\*\[3023\]

```text
MAWM prompts for a Task ID.
```

<a id="b03024"></a>
## b03024 — word/document\.xml/body/\*\[3024\]

```text
User scans the Task ID from the task label.
```

<a id="b03025"></a>
## b03025 — word/document\.xml/body/\*\[3025\]

```text
MAWM prompts for a pallet.
```

<a id="b03026"></a>
## b03026 — word/document\.xml/body/\*\[3026\]

```text
User scans the pallet ID from the task label.
```

<a id="b03027"></a>
## b03027 — word/document\.xml/body/\*\[3027\]

```text
MAWM displays the pull location and prompts for the iLPN to pull.
```

<a id="b03028"></a>
## b03028 — word/document\.xml/body/\*\[3028\]

```text
User scans the iLPN.
```

<a id="b03029"></a>
## b03029 — word/document\.xml/body/\*\[3029\]

```text
User repeats steps 7–8 for each LPN pull required for the task.
```

<a id="b03030"></a>
## b03030 — word/document\.xml/body/\*\[3030\]

```text
MAWM prompts the user to scan a staging location based on the Outbound Putaway Strategy.
```

<a id="b03031"></a>
## b03031 — word/document\.xml/body/\*\[3031\]

```text
User scans the staging location ID.
```

<a id="b03032"></a>
## b03032 — word/document\.xml/body/\*\[3032\]

```text

```

<a id="b03033"></a>
## b03033 — word/document\.xml/body/\*\[3033\]

```text
Updates
```

<a id="b03034"></a>
## b03034 — word/document\.xml/body/\*\[3034\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03035"></a>
## b03035 — word/document\.xml/body/\*\[3035\]

```text
The location's on-hand quantity is decremented by the quantity picked.
```

<a id="b03036"></a>
## b03036 — word/document\.xml/body/\*\[3036\]

```text
The scanned location ID contains all picked items.
```

<a id="b03037"></a>
## b03037 — word/document\.xml/body/\*\[3037\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03038"></a>
## b03038 — word/document\.xml/body/\*\[3038\]

```text
MHE Pick message is generated.
```

<a id="b03039"></a>
## b03039 — word/document\.xml/body/\*\[3039\]

```text

```

<a id="b03040"></a>
## b03040 — word/document\.xml/body/\*\[3040\]

```text
User Story: HM Blk Pick
```

<a id="b03041"></a>
## b03041 — word/document\.xml/body/\*\[3041\]

```text
Who	What	Why
Picker	Pick units from active into a gurney for HM sorter induction.	Pull units from active storage locations into a gurney to fulfill Production Orders, which will be sorted by the HM sorter.
```

<a id="b03042"></a>
## b03042 — word/document\.xml/body/\*\[3042\]

```text

```

<a id="b03043"></a>
## b03043 — word/document\.xml/body/\*\[3043\]

```text
The HM Blk pick transaction is used to pick units from active locations into a gurney and putaway to a HM Sorter induction staging location based in the HM Sorter facility.
```

<a id="b03044"></a>
## b03044 — word/document\.xml/body/\*\[3044\]

```text
The tasks are created during task release and are generated based on resource batch IDs without mixing batches. Additionally, tasks are divided by gurney capacity and are user-initiated by scanning a task ID from the pick labels (task label) that are printed post-waving from the VAS wave monitor stations.
```

<a id="b03045"></a>
## b03045 — word/document\.xml/body/\*\[3045\]

```text
Assumptions
```

<a id="b03046"></a>
## b03046 — word/document\.xml/body/\*\[3046\]

```text
Each order will have a Logo ID attribute, which is used to build batches in the HM sorter and is aggregated in MAWM during order import by Logo ID.
```

<a id="b03047"></a>
## b03047 — word/document\.xml/body/\*\[3047\]

```text
Heat transfer logo item/material is picked with own picking transaction documented in story 22.3.5
```

<a id="b03048"></a>
## b03048 — word/document\.xml/body/\*\[3048\]

```text

```

<a id="b03049"></a>
## b03049 — word/document\.xml/body/\*\[3049\]

```text
Criteria
```

<a id="b03050"></a>
## b03050 — word/document\.xml/body/\*\[3050\]

```text
The HM Blk Pull transaction applies to orders that matches the following criteria:
```

<a id="b03051"></a>
## b03051 — word/document\.xml/body/\*\[3051\]

```text
Order Type IS “PRODLOGO” OR “PRODHT”
AND
Order Enterprise Code is null 
AND
(
    Order Fulfillment Code is equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is false)
)
AND Pick Allocation Zone Id is not HT OR NBDG
```

<a id="b03052"></a>
## b03052 — word/document\.xml/body/\*\[3052\]

```text
Process
```

<a id="b03053"></a>
## b03053 — word/document\.xml/body/\*\[3053\]

```text
User selects the “Production Order” task group.
```

<a id="b03054"></a>
## b03054 — word/document\.xml/body/\*\[3054\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03055"></a>
## b03055 — word/document\.xml/body/\*\[3055\]

```text
MAWM prompts for a Task ID.
```

<a id="b03056"></a>
## b03056 — word/document\.xml/body/\*\[3056\]

```text
User scans the Task ID from the task label.
```

<a id="b03057"></a>
## b03057 — word/document\.xml/body/\*\[3057\]

```text
MAWM prompts for a Tote ID.
```

<a id="b03058"></a>
## b03058 — word/document\.xml/body/\*\[3058\]

```text
User scans the Tote ID from the task label.
```

<a id="b03059"></a>
## b03059 — word/document\.xml/body/\*\[3059\]

```text
MAWM displays the pick location.
```

<a id="b03060"></a>
## b03060 — word/document\.xml/body/\*\[3060\]

```text
User scans the pick location barcode.
```

<a id="b03061"></a>
## b03061 — word/document\.xml/body/\*\[3061\]

```text
MAWM prompt for an Item.
```

<a id="b03062"></a>
## b03062 — word/document\.xml/body/\*\[3062\]

```text
User scans the item UPC.
```

<a id="b03063"></a>
## b03063 — word/document\.xml/body/\*\[3063\]

```text
User repeats steps 7 through 8 for each LPN pull required for the task.
```

<a id="b03064"></a>
## b03064 — word/document\.xml/body/\*\[3064\]

```text
MAWM prompts the user to scan a staging location based on the Outbound Putaway Strategy.
```

<a id="b03065"></a>
## b03065 — word/document\.xml/body/\*\[3065\]

```text
User scans the staging location ID.
```

<a id="b03066"></a>
## b03066 — word/document\.xml/body/\*\[3066\]

```text

```

<a id="b03067"></a>
## b03067 — word/document\.xml/body/\*\[3067\]

```text
Updates
```

<a id="b03068"></a>
## b03068 — word/document\.xml/body/\*\[3068\]

```text

```

<a id="b03069"></a>
## b03069 — word/document\.xml/body/\*\[3069\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03070"></a>
## b03070 — word/document\.xml/body/\*\[3070\]

```text
The location's on-hand quantity is decremented by the picked-quantity.
```

<a id="b03071"></a>
## b03071 — word/document\.xml/body/\*\[3071\]

```text
The scanned location ID contains all picked items.
```

<a id="b03072"></a>
## b03072 — word/document\.xml/body/\*\[3072\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03073"></a>
## b03073 — word/document\.xml/body/\*\[3073\]

```text
MHE Pick message is generated.
```

<a id="b03074"></a>
## b03074 — word/document\.xml/body/\*\[3074\]

```text

```

<a id="b03075"></a>
## b03075 — word/document\.xml/body/\*\[3075\]

```text
User Story: VAS LPN Pull
```

<a id="b03076"></a>
## b03076 — word/document\.xml/body/\*\[3076\]

```text

```

<a id="b03077"></a>
## b03077 — word/document\.xml/body/\*\[3077\]

```text
Who	What	Why
Forklift Operator
Crane Operator	Pull LPNs from reserve locations.	Pull LPNs from reserved storage locations to fulfill Production Orders directed to the VAS opening station (HM sorter not required) 
```

<a id="b03078"></a>
## b03078 — word/document\.xml/body/\*\[3078\]

```text

```

<a id="b03079"></a>
## b03079 — word/document\.xml/body/\*\[3079\]

```text
The VAS LPN pull transaction is used to pull LPNs from reserve locations to a VAS Opening station located on each VAS production area.
```

<a id="b03080"></a>
## b03080 — word/document\.xml/body/\*\[3080\]

```text
Assumptions
```

<a id="b03081"></a>
## b03081 — word/document\.xml/body/\*\[3081\]

```text

```

<a id="b03082"></a>
## b03082 — word/document\.xml/body/\*\[3082\]

```text
Heat transfer logos or monogram logos are manually matched by aligning the Olpn ID on the Task Label [WM26] of the gurney with the Olpn ID on the Task Label of the logo envelope, following the steps defined in Pre-VAS SOP.
```

<a id="b03083"></a>
## b03083 — word/document\.xml/body/\*\[3083\]

```text
A task path restriction is used when the LPN pull is from a high-bay or a reserve location, splitting the task into two or three steps based on the requirements.
```

<a id="b03084"></a>
## b03084 — word/document\.xml/body/\*\[3084\]

```text


```

<a id="b03085"></a>
## b03085 — word/document\.xml/body/\*\[3085\]

```text
Criteria
```

<a id="b03086"></a>
## b03086 — word/document\.xml/body/\*\[3086\]

```text
The VAS Lpn Pull transaction applies to orders that matches the following criteria picking from Reserve Locations:
```

<a id="b03087"></a>
## b03087 — word/document\.xml/body/\*\[3087\]

```text
Order Type IS “PRODHEM” OR “PRODMONO” AND Pick Allocation Zone Id is not HT OR NBDG
OR
Order Enterprise Code is not null AND Pick Allocation Zone Id is not HT OR NBDG
OR
( (
    Order Fulfillment Code is not equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is true)
  )
  AND Pick Allocation Zone Id is not HT OR NBDG
)
```

<a id="b03088"></a>
## b03088 — word/document\.xml/body/\*\[3088\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03089"></a>
## b03089 — word/document\.xml/body/\*\[3089\]

```text
At least the following two creation templates are defined to create a VAS Blk Pick tasks.
```

<a id="b03090"></a>
## b03090 — word/document\.xml/body/\*\[3090\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Large and Enterprise Orders  Logo VAS Blk Pick	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Every distinct value Original Order Id and Pick Allocation Zone
Task Capacity up to a pallet
Hemming VA Blk Pick	Production Order – Hemming” AND 
Order Fulfillment Code != X	Every distinct Order Extended Hemming Group
Task Capacity up to a pallet
Hemming Multi VAS VA Blk Pick	“Production Order – Hemming” AND 
Order Fulfillment Code = X	Every distinct value Original Order Id and Pick Allocation Zone
Task Capacity up to a pallet
```

<a id="b03091"></a>
## b03091 — word/document\.xml/body/\*\[3091\]

```text

```

<a id="b03092"></a>
## b03092 — word/document\.xml/body/\*\[3092\]

```text
Process
```

<a id="b03093"></a>
## b03093 — word/document\.xml/body/\*\[3093\]

```text
User selects the “Production Order” task group.
```

<a id="b03094"></a>
## b03094 — word/document\.xml/body/\*\[3094\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03095"></a>
## b03095 — word/document\.xml/body/\*\[3095\]

```text
MAWM prompts for a Task ID.
```

<a id="b03096"></a>
## b03096 — word/document\.xml/body/\*\[3096\]

```text
User scans the Task ID from the task label.
```

<a id="b03097"></a>
## b03097 — word/document\.xml/body/\*\[3097\]

```text
MAWM prompts for a pallet.
```

<a id="b03098"></a>
## b03098 — word/document\.xml/body/\*\[3098\]

```text
User scans the pallet ID from the task label.
```

<a id="b03099"></a>
## b03099 — word/document\.xml/body/\*\[3099\]

```text
MAWM displays the pull location and prompts for the iLPN to pull.
```

<a id="b03100"></a>
## b03100 — word/document\.xml/body/\*\[3100\]

```text
User scans the iLPN.
```

<a id="b03101"></a>
## b03101 — word/document\.xml/body/\*\[3101\]

```text
User repeats steps 7–10 for each LPN pull required for the task.
```

<a id="b03102"></a>
## b03102 — word/document\.xml/body/\*\[3102\]

```text
MAWM prompts the user to scan a staging location of an opening station based on the Outbound Putaway Strategy.
```

<a id="b03103"></a>
## b03103 — word/document\.xml/body/\*\[3103\]

```text
User scans the staging location ID.
```

<a id="b03104"></a>
## b03104 — word/document\.xml/body/\*\[3104\]

```text

```

<a id="b03105"></a>
## b03105 — word/document\.xml/body/\*\[3105\]

```text
Updates
```

<a id="b03106"></a>
## b03106 — word/document\.xml/body/\*\[3106\]

```text

```

<a id="b03107"></a>
## b03107 — word/document\.xml/body/\*\[3107\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03108"></a>
## b03108 — word/document\.xml/body/\*\[3108\]

```text
The location's on-hand quantity is decremented by the picked-quantity.
```

<a id="b03109"></a>
## b03109 — word/document\.xml/body/\*\[3109\]

```text
The scanned location ID contains all picked items.
```

<a id="b03110"></a>
## b03110 — word/document\.xml/body/\*\[3110\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03111"></a>
## b03111 — word/document\.xml/body/\*\[3111\]

```text

```

<a id="b03112"></a>
## b03112 — word/document\.xml/body/\*\[3112\]

```text
User Story: VAS BlkPick
```

<a id="b03113"></a>
## b03113 — word/document\.xml/body/\*\[3113\]

```text
Who	What	Why
Picker	Pick units from active into a gurney for production orders.	Pick units from active locations into a gurney for Production Orders.
```

<a id="b03114"></a>
## b03114 — word/document\.xml/body/\*\[3114\]

```text

```

<a id="b03115"></a>
## b03115 — word/document\.xml/body/\*\[3115\]

```text
The VAS Blk pick transaction is used to pick units from active locations into a gurney and putaway into a VAS Opening station  (staging location) based on the VAS type post picking outbound putaway rules.
```

<a id="b03116"></a>
## b03116 — word/document\.xml/body/\*\[3116\]

```text
Assumptions
```

<a id="b03117"></a>
## b03117 — word/document\.xml/body/\*\[3117\]

```text
Heat transfer logos or monogram logos for large or enterprise orders are manually matched by comparing the OLPN ID on the task label of the gurney with the OLPN ID on the task label of the logo envelope, following the steps defined in the Pre-VAS Heat Transfer Logo Marry Process in the Lands’ End Pre-VAS SOP.
```

<a id="b03118"></a>
## b03118 — word/document\.xml/body/\*\[3118\]

```text
Criteria
```

<a id="b03119"></a>
## b03119 — word/document\.xml/body/\*\[3119\]

```text
The VAS Blk Pick transaction applies to orders that matches the following criteria picking from Active Locations:
```

<a id="b03120"></a>
## b03120 — word/document\.xml/body/\*\[3120\]

```text
Order Type IS “PRODHEM” OR “PRODMONO” AND Pick Allocation Zone Id is not HT OR NBDG
OR
Order Enterprise Code is not null AND Pick Allocation Zone Id is not HT OR NBDG
OR
( (
    Order Fulfillment Code is not equal to M  OR
   (Order Fulfillment Code is equal to S AND SingleLineOrder is true)
  )
  AND Pick Allocation Zone Id is not HT OR NBDG
)
```

<a id="b03121"></a>
## b03121 — word/document\.xml/body/\*\[3121\]

```text

```

<a id="b03122"></a>
## b03122 — word/document\.xml/body/\*\[3122\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03123"></a>
## b03123 — word/document\.xml/body/\*\[3123\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Large and Enterprise Orders  Logo VAS Blk Pick	Production Order – Heat Transfer” OR “Production Order - Monogram” OR “Production Order - Logo” AND ( 
Order Fulfillment Code = S OR L  AND 
Enterprise Code Not null)	Every distinct production order value (original order id) 

Task Capacity up to a gurney volume
Hemming VA Blk Pick	Production Order – Hemming” AND 
Order Fulfillment Code not equal to X	Every distinct Order Extended Hemming Group 

Task Capacity up to a gurney volume
Hemming with Multi VAS Operations VA Blk Pick	“Production Order – Hemming” AND 
Order Fulfillment Code equal to X	Every distinct production order value (original order id) 

Task Capacity up to a gurney volume
```

<a id="b03124"></a>
## b03124 — word/document\.xml/body/\*\[3124\]

```text

```

<a id="b03125"></a>
## b03125 — word/document\.xml/body/\*\[3125\]

```text
Process
```

<a id="b03126"></a>
## b03126 — word/document\.xml/body/\*\[3126\]

```text
User selects the “Production Order” task group.
```

<a id="b03127"></a>
## b03127 — word/document\.xml/body/\*\[3127\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03128"></a>
## b03128 — word/document\.xml/body/\*\[3128\]

```text
MAWM prompts for a Task ID.
```

<a id="b03129"></a>
## b03129 — word/document\.xml/body/\*\[3129\]

```text
User scans the Task ID from the task label.
```

<a id="b03130"></a>
## b03130 — word/document\.xml/body/\*\[3130\]

```text
MAWM prompts for a Tote ID.
```

<a id="b03131"></a>
## b03131 — word/document\.xml/body/\*\[3131\]

```text
User scans the Tote ID from the task label.
```

<a id="b03132"></a>
## b03132 — word/document\.xml/body/\*\[3132\]

```text
MAWM displays the pick location.
```

<a id="b03133"></a>
## b03133 — word/document\.xml/body/\*\[3133\]

```text
User scans the pick location barcode.
```

<a id="b03134"></a>
## b03134 — word/document\.xml/body/\*\[3134\]

```text
MAWM prompt for an Item.
```

<a id="b03135"></a>
## b03135 — word/document\.xml/body/\*\[3135\]

```text
User scans the item UPC.
```

<a id="b03136"></a>
## b03136 — word/document\.xml/body/\*\[3136\]

```text
User repeats steps 7 through 10 for each LPN pull required for the task.
```

<a id="b03137"></a>
## b03137 — word/document\.xml/body/\*\[3137\]

```text
MAWM prompts the user to scan a staging location based on the VAS BlkPick Outbound Putaway Criteria.
```

<a id="b03138"></a>
## b03138 — word/document\.xml/body/\*\[3138\]

```text
User scans the staging location ID.
```

<a id="b03139"></a>
## b03139 — word/document\.xml/body/\*\[3139\]

```text

```

<a id="b03140"></a>
## b03140 — word/document\.xml/body/\*\[3140\]

```text
Updates
```

<a id="b03141"></a>
## b03141 — word/document\.xml/body/\*\[3141\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03142"></a>
## b03142 — word/document\.xml/body/\*\[3142\]

```text
The location's on-hand quantity is decremented by the quantity picked.
```

<a id="b03143"></a>
## b03143 — word/document\.xml/body/\*\[3143\]

```text
The scanned location ID contains all picked items.
```

<a id="b03144"></a>
## b03144 — word/document\.xml/body/\*\[3144\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03145"></a>
## b03145 — word/document\.xml/body/\*\[3145\]

```text

```

<a id="b03146"></a>
## b03146 — word/document\.xml/body/\*\[3146\]

```text
User Story: Heat Transfer Logo Pick (Logo Pick) 
```

<a id="b03147"></a>
## b03147 — word/document\.xml/body/\*\[3147\]

```text
Who	What	Why
Picker	Pick heat transfer logos into a tote (envelope).	Pick heat transfer logos at Stevens Point for heat transfer.
```

<a id="b03148"></a>
## b03148 — word/document\.xml/body/\*\[3148\]

```text

```

<a id="b03149"></a>
## b03149 — word/document\.xml/body/\*\[3149\]

```text
The Heat Transfer Logo Pick (Logo Pick) transaction is used to pick heat transfer logos at the Stevens Point facility. Tasks are generated during the wave process and are created during task release. 
```

<a id="b03150"></a>
## b03150 — word/document\.xml/body/\*\[3150\]

```text
The heat transfer tasks are generated for allocations with a pick allocation zone that matches the configuration for heat transfer logo storage locations break by Original Order Id picked into a tote/envelope that is used to marry the logos with the production order in a putwall for orders in sort resource batch or manually married up for hamming, large order or enterprise order at the VAS opening station. 
```

<a id="b03151"></a>
## b03151 — word/document\.xml/body/\*\[3151\]

```text
Assumptions
```

<a id="b03152"></a>
## b03152 — word/document\.xml/body/\*\[3152\]

```text
The labels for logo picks from a wave that has a batch # printed are picked individually, placed in an envelope, and grouped together in plastic tote or plastic bag with the batch label ID on top. This batch label ID is used during the putwall sorting process.
```

<a id="b03153"></a>
## b03153 — word/document\.xml/body/\*\[3153\]

```text
The labels for logo picks from a wave that do not have a batch # printed are placed in a plastic tote. At the opening station, the envelope is matched with the base SKU by aligning the Order ID printed on the task label attached to the gurney/pallet and the envelope. 
```

<a id="b03154"></a>
## b03154 — word/document\.xml/body/\*\[3154\]

```text
Criteria
```

<a id="b03155"></a>
## b03155 — word/document\.xml/body/\*\[3155\]

```text
The Logo Pick transaction applies to pick allocations that matches the following criteria picking from Active Locations:
```

<a id="b03156"></a>
## b03156 — word/document\.xml/body/\*\[3156\]

```text
Allocation.PickAllocationZoneId equal to “<<Heat Transfer Allocation Zone>>”
```

<a id="b03157"></a>
## b03157 — word/document\.xml/body/\*\[3157\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03158"></a>
## b03158 — word/document\.xml/body/\*\[3158\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Logo Pick	Allocation.PickAllocationZoneId = “<<HT Allocation Zone>>”	Every distinct production order value (original order id) 
Task Capacity up to envelope volume.
```

<a id="b03159"></a>
## b03159 — word/document\.xml/body/\*\[3159\]

```text

```

<a id="b03160"></a>
## b03160 — word/document\.xml/body/\*\[3160\]

```text
Process
```

<a id="b03161"></a>
## b03161 — word/document\.xml/body/\*\[3161\]

```text

```

<a id="b03162"></a>
## b03162 — word/document\.xml/body/\*\[3162\]

```text
User selects the “Production Order” task group.
```

<a id="b03163"></a>
## b03163 — word/document\.xml/body/\*\[3163\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03164"></a>
## b03164 — word/document\.xml/body/\*\[3164\]

```text
MAWM prompts for a Task ID.
```

<a id="b03165"></a>
## b03165 — word/document\.xml/body/\*\[3165\]

```text
User scans the Task ID from the task label.
```

<a id="b03166"></a>
## b03166 — word/document\.xml/body/\*\[3166\]

```text
MAWM prompts for a Tote ID.
```

<a id="b03167"></a>
## b03167 — word/document\.xml/body/\*\[3167\]

```text
The user scans the Tote ID from the task label.
```

<a id="b03168"></a>
## b03168 — word/document\.xml/body/\*\[3168\]

```text
MAWM displays the pick location.
```

<a id="b03169"></a>
## b03169 — word/document\.xml/body/\*\[3169\]

```text
User scans the pick location barcode.
```

<a id="b03170"></a>
## b03170 — word/document\.xml/body/\*\[3170\]

```text
MAWM prompt for an Item.
```

<a id="b03171"></a>
## b03171 — word/document\.xml/body/\*\[3171\]

```text
User scans the item UPC.
```

<a id="b03172"></a>
## b03172 — word/document\.xml/body/\*\[3172\]

```text
MAWM prompt the user to confirm the quantity to be picked.
```

<a id="b03173"></a>
## b03173 — word/document\.xml/body/\*\[3173\]

```text
IF user enter  less than the expected quantity the
```

<a id="b03174"></a>
## b03174 — word/document\.xml/body/\*\[3174\]

```text
MAWM will prompt user if he like to apply the pick exception
```

<a id="b03175"></a>
## b03175 — word/document\.xml/body/\*\[3175\]

```text
Yes – Short pick is executed
```

<a id="b03176"></a>
## b03176 — word/document\.xml/body/\*\[3176\]

```text
No – Partial pick is executed (Remaining quantity pick is prompted, step 11) 
```

<a id="b03177"></a>
## b03177 — word/document\.xml/body/\*\[3177\]

```text
User repeats steps 7 through 10 for each LPN pull required for the task.
```

<a id="b03178"></a>
## b03178 — word/document\.xml/body/\*\[3178\]

```text
MAWM prompts the user to scan a staging location of an opening station based on the Outbound Putaway Strategy.
```

<a id="b03179"></a>
## b03179 — word/document\.xml/body/\*\[3179\]

```text
User scans the staging location ID.
```

<a id="b03180"></a>
## b03180 — word/document\.xml/body/\*\[3180\]

```text

```

<a id="b03181"></a>
## b03181 — word/document\.xml/body/\*\[3181\]

```text
Updates
```

<a id="b03182"></a>
## b03182 — word/document\.xml/body/\*\[3182\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03183"></a>
## b03183 — word/document\.xml/body/\*\[3183\]

```text
The location's on-hand quantity is decremented by the quantity picked.
```

<a id="b03184"></a>
## b03184 — word/document\.xml/body/\*\[3184\]

```text
The scanned location ID contains all picked items.
```

<a id="b03185"></a>
## b03185 — word/document\.xml/body/\*\[3185\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03186"></a>
## b03186 — word/document\.xml/body/\*\[3186\]

```text


```

<a id="b03187"></a>
## b03187 — word/document\.xml/body/\*\[3187\]

```text
User Story: Name Badge Pick (NameBdgPick) 
```

<a id="b03188"></a>
## b03188 — word/document\.xml/body/\*\[3188\]

```text
Who	What	Why
Picker	Pick name badges for a production order.	Pick a name badge for Name Badge Production Orders.
```

<a id="b03189"></a>
## b03189 — word/document\.xml/body/\*\[3189\]

```text

```

<a id="b03190"></a>
## b03190 — word/document\.xml/body/\*\[3190\]

```text
The Name Badge Pick (NameBdgPick) transaction is used to pick name badge to be moved to the production area. 
```

<a id="b03191"></a>
## b03191 — word/document\.xml/body/\*\[3191\]

```text
The name badge tasks are generated for allocations with a pick allocation zone that matches the configuration for name badge item-locations and are created by Original Order Id and sequenced by Order Line VAS Batch Number (extended attribute). 
```

<a id="b03192"></a>
## b03192 — word/document\.xml/body/\*\[3192\]

```text
Assumptions
```

<a id="b03193"></a>
## b03193 — word/document\.xml/body/\*\[3193\]

```text
The picking task criteria is configured to create the task break by Order Id and sequence the task details  ascending by Item Id  and VAS batch number (Extended attribute of the Order Line).
```

<a id="b03194"></a>
## b03194 — word/document\.xml/body/\*\[3194\]

```text
The picking strategy is configured to aggregate the units across Olpn details.
```

<a id="b03195"></a>
## b03195 — word/document\.xml/body/\*\[3195\]

```text
The VAS Descriptor Label is printed at the VAS opening station using  the transaction “Pre-VAS Package / Descriptor Label Print). 
```

<a id="b03196"></a>
## b03196 — word/document\.xml/body/\*\[3196\]

```text

```

<a id="b03197"></a>
## b03197 — word/document\.xml/body/\*\[3197\]

```text
Criteria
```

<a id="b03198"></a>
## b03198 — word/document\.xml/body/\*\[3198\]

```text
The NameBdgPick transaction applies to pick allocations that matches the following criteria picking from Active Locations:
```

<a id="b03199"></a>
## b03199 — word/document\.xml/body/\*\[3199\]

```text
Allocation.PickAllocationZoneId equal to “<<Name Badges Allocation Zone>>”
```

<a id="b03200"></a>
## b03200 — word/document\.xml/body/\*\[3200\]

```text

```

<a id="b03201"></a>
## b03201 — word/document\.xml/body/\*\[3201\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03202"></a>
## b03202 — word/document\.xml/body/\*\[3202\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Name Badge Pick	Allocation.PickAllocationZoneId = “<<NBDG Allocation Zone>>”	Every distinct production order value (original order id) 
Task Capacity up to envelope volume.
```

<a id="b03203"></a>
## b03203 — word/document\.xml/body/\*\[3203\]

```text

```

<a id="b03204"></a>
## b03204 — word/document\.xml/body/\*\[3204\]

```text
Process
```

<a id="b03205"></a>
## b03205 — word/document\.xml/body/\*\[3205\]

```text
User selects the “Production Order” task group.
```

<a id="b03206"></a>
## b03206 — word/document\.xml/body/\*\[3206\]

```text
User selects the “Enter Task” menu option.
```

<a id="b03207"></a>
## b03207 — word/document\.xml/body/\*\[3207\]

```text
MAWM prompts for a Task ID.
```

<a id="b03208"></a>
## b03208 — word/document\.xml/body/\*\[3208\]

```text
User scans the Task ID from the task label.
```

<a id="b03209"></a>
## b03209 — word/document\.xml/body/\*\[3209\]

```text
MAWM prompts for a Tote ID.
```

<a id="b03210"></a>
## b03210 — word/document\.xml/body/\*\[3210\]

```text
User scans the Tote ID from the task label.
```

<a id="b03211"></a>
## b03211 — word/document\.xml/body/\*\[3211\]

```text
MAWM displays the pick location.
```

<a id="b03212"></a>
## b03212 — word/document\.xml/body/\*\[3212\]

```text
User scans the pick location barcode.
```

<a id="b03213"></a>
## b03213 — word/document\.xml/body/\*\[3213\]

```text
MAWM prompt for an Item.
```

<a id="b03214"></a>
## b03214 — word/document\.xml/body/\*\[3214\]

```text
User scans the item UPC.
```

<a id="b03215"></a>
## b03215 — word/document\.xml/body/\*\[3215\]

```text
MAWM prompt the user to confirm the quantity to be picked.
```

<a id="b03216"></a>
## b03216 — word/document\.xml/body/\*\[3216\]

```text
IF user enter  less than the expected quantity the
```

<a id="b03217"></a>
## b03217 — word/document\.xml/body/\*\[3217\]

```text
MAWM will prompt user if he like to apply the pick exception
```

<a id="b03218"></a>
## b03218 — word/document\.xml/body/\*\[3218\]

```text
Yes – Short pick is executed
```

<a id="b03219"></a>
## b03219 — word/document\.xml/body/\*\[3219\]

```text
No – Partial pick is executed (Remaining quantity pick is prompted, step 11) 
```

<a id="b03220"></a>
## b03220 — word/document\.xml/body/\*\[3220\]

```text
User repeats steps 7 through 12 for each LPN pull required for the task.
```

<a id="b03221"></a>
## b03221 — word/document\.xml/body/\*\[3221\]

```text
MAWM prompts the user to scan a staging location of opening station based on the Outbound Putaway Strategy.
```

<a id="b03222"></a>
## b03222 — word/document\.xml/body/\*\[3222\]

```text
User scans the staging location ID.
```

<a id="b03223"></a>
## b03223 — word/document\.xml/body/\*\[3223\]

```text

```

<a id="b03224"></a>
## b03224 — word/document\.xml/body/\*\[3224\]

```text
Updates
```

<a id="b03225"></a>
## b03225 — word/document\.xml/body/\*\[3225\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03226"></a>
## b03226 — word/document\.xml/body/\*\[3226\]

```text
The location's on-hand quantity is decremented by the picked-quantity.
```

<a id="b03227"></a>
## b03227 — word/document\.xml/body/\*\[3227\]

```text
The scanned location ID contains all picked items.
```

<a id="b03228"></a>
## b03228 — word/document\.xml/body/\*\[3228\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03229"></a>
## b03229 — word/document\.xml/body/\*\[3229\]

```text

```

<a id="b03230"></a>
## b03230 — word/document\.xml/body/\*\[3230\]

```text
User Story: MHE LPN Pull
```

<a id="b03231"></a>
## b03231 — word/document\.xml/body/\*\[3231\]

```text
Who	What	Why
Forklift Operator
Crane Operator	Pull LPNs from reserve locations.	Pull LPN from reserve location for Customer Orders packed through a unit sorter / pack station.


```

<a id="b03232"></a>
## b03232 — word/document\.xml/body/\*\[3232\]

```text

```

<a id="b03233"></a>
## b03233 — word/document\.xml/body/\*\[3233\]

```text
The MHE LPN Pull transaction is used to pull LPNs from reserve locations onto a pallet and put them away onto a replenishment belt, directing the LPN to the respective MHE induction points. The picking strategy criteria are configured to depalletize the LPN after putaway, creating an outbound putaway task for each LPN. This task is directed to the induction location configured with the outbound putaway strategy associated with the picking transaction.
```

<a id="b03234"></a>
## b03234 — word/document\.xml/body/\*\[3234\]

```text
Tasks are created during task release and are generated by Work Release Batch ID. They are divided by pick zone and pallet capacity, and they are system-assigned based on the task group associated with the operator.
```

<a id="b03235"></a>
## b03235 — word/document\.xml/body/\*\[3235\]

```text
List of Transaction Ids for case pick
```

<a id="b03236"></a>
## b03236 — word/document\.xml/body/\*\[3236\]

```text
Pick Transaction Id	Description
SX Case Pick	Picking for Induction X
SY Case Pick	Picking for Induction Y
SA Case Pick	Picking for Induction A
SB Case Pick	Picking for Induction B
HM06 Case Pick	Picking for Induction HM06
HM07 Case Pick	Picking for Induction HM07
```

<a id="b03237"></a>
## b03237 — word/document\.xml/body/\*\[3237\]

```text
Assumptions
```

<a id="b03238"></a>
## b03238 — word/document\.xml/body/\*\[3238\]

```text
A task path restriction is used when the LPN pull is from a high-bay or a reserve location, splitting the task into two or three steps based on the requirements.
```

<a id="b03239"></a>
## b03239 — word/document\.xml/body/\*\[3239\]

```text
Criteria
```

<a id="b03240"></a>
## b03240 — word/document\.xml/body/\*\[3240\]

```text
The MHE Lpn Pull transaction applies to orders that matches the following criteria picking from reserve locations:
```

<a id="b03241"></a>
## b03241 — word/document\.xml/body/\*\[3241\]

```text
(
  Order Type is equal to “CUSTVASORD” AND
  Order Fulfillment Code is equal to M  OR X  OR
  Order Extended Enterprise Code is not null
)
OR
(
  Order Type is equal to “CUSTREGORD” AND 
  (
        Single Line Order is false and Single Unit Order is false OR
        Order Extended Gift Box Indicator is true
  )
)
```

<a id="b03242"></a>
## b03242 — word/document\.xml/body/\*\[3242\]

```text

```

<a id="b03243"></a>
## b03243 — word/document\.xml/body/\*\[3243\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03244"></a>
## b03244 — word/document\.xml/body/\*\[3244\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
MHE LPN Pull	Allocation.OrderCriteriaId IS “Sorter A” or “Sorter B” or “Sorter X” and allocation zone is “Reserve”	Every distinct fully allocated LPN ID
Break by Destination Location
Task Capacity up to a pallet
```

<a id="b03245"></a>
## b03245 — word/document\.xml/body/\*\[3245\]

```text

```

<a id="b03246"></a>
## b03246 — word/document\.xml/body/\*\[3246\]

```text

```

<a id="b03247"></a>
## b03247 — word/document\.xml/body/\*\[3247\]

```text
Process
```

<a id="b03248"></a>
## b03248 — word/document\.xml/body/\*\[3248\]

```text
User logs in to the appropriate task group.
```

<a id="b03249"></a>
## b03249 — word/document\.xml/body/\*\[3249\]

```text
User requests the next task via the Assign Task mobile transaction.
```

<a id="b03250"></a>
## b03250 — word/document\.xml/body/\*\[3250\]

```text
MAWM prompts for a pallet.
```

<a id="b03251"></a>
## b03251 — word/document\.xml/body/\*\[3251\]

```text
User scans the pallet ID/gurney ID.
```

<a id="b03252"></a>
## b03252 — word/document\.xml/body/\*\[3252\]

```text
MAWM displays the pull location and prompts for the iLPN to pull.
```

<a id="b03253"></a>
## b03253 — word/document\.xml/body/\*\[3253\]

```text
User scans the iLPN.
```

<a id="b03254"></a>
## b03254 — word/document\.xml/body/\*\[3254\]

```text
User repeats the iLPN scan process until all task details for the task are complete.
```

<a id="b03255"></a>
## b03255 — word/document\.xml/body/\*\[3255\]

```text
MAWM directs the user to the pick drop location (Replen Belt) based on the Outbound Putaway Strategy and task path restrictions.
```

<a id="b03256"></a>
## b03256 — word/document\.xml/body/\*\[3256\]

```text
User scans the pick drop location ID.
```

<a id="b03257"></a>
## b03257 — word/document\.xml/body/\*\[3257\]

```text

```

<a id="b03258"></a>
## b03258 — word/document\.xml/body/\*\[3258\]

```text

```

<a id="b03259"></a>
## b03259 — word/document\.xml/body/\*\[3259\]

```text
Updates
```

<a id="b03260"></a>
## b03260 — word/document\.xml/body/\*\[3260\]

```text

```

<a id="b03261"></a>
## b03261 — word/document\.xml/body/\*\[3261\]

```text
The task is updated to ‘Completed’ status.
```

<a id="b03262"></a>
## b03262 — word/document\.xml/body/\*\[3262\]

```text
The location’s on hand quantity is decremented by picked quantity.
```

<a id="b03263"></a>
## b03263 — word/document\.xml/body/\*\[3263\]

```text
The status of all oLPNs is updated to ‘Picked’.
```

<a id="b03264"></a>
## b03264 — word/document\.xml/body/\*\[3264\]

```text
MHE Pick message is generated.
```

<a id="b03265"></a>
## b03265 — word/document\.xml/body/\*\[3265\]

```text

```

<a id="b03266"></a>
## b03266 — word/document\.xml/body/\*\[3266\]

```text


```

<a id="b03267"></a>
## b03267 — word/document\.xml/body/\*\[3267\]

```text
User Story: MHE Bulk Pick (SA Act Pck, SB Act Pck, SX Act Pck)
```

<a id="b03268"></a>
## b03268 — word/document\.xml/body/\*\[3268\]

```text

```

<a id="b03269"></a>
## b03269 — word/document\.xml/body/\*\[3269\]

```text
Who	What	Why
Picker	Pick units from active into a gurney for customer orders.	Pick units from active locations into a gurney for Customer Orders to be inducted into a unit sorter.
```

<a id="b03270"></a>
## b03270 — word/document\.xml/body/\*\[3270\]

```text

```

<a id="b03271"></a>
## b03271 — word/document\.xml/body/\*\[3271\]

```text
The MHE Bulk Pick (MHE BlkPick)  transaction is used to pick units from active locations into a gurney and putaway into a VAS Opening station  (staging location) based on the VAS type post picking outbound putaway rules.
```

<a id="b03272"></a>
## b03272 — word/document\.xml/body/\*\[3272\]

```text
The tasks are created during task release and are generated based on resource batch IDs without mixing batches. Additionally, tasks are divided by gurney capacity and are user-initiated by scanning a task ID from the pick labels (task label) that are printed post-waving from the VAS wave monitor stations.
```

<a id="b03273"></a>
## b03273 — word/document\.xml/body/\*\[3273\]

```text
List of Pick Transaction Ids from active
```

<a id="b03274"></a>
## b03274 — word/document\.xml/body/\*\[3274\]

```text
Pick Transaction  Id	Description
SX Bulk Pick	Picking for Induction X
SY Bulk Pick	Picking for Induction Y
SA Bulk Pick	Picking for Induction A
SB Bulk Pick	Picking for Induction B
HM06 Bulk Pick	Picking for Induction HM06
HM07 Bulk Pick	Picking for Induction HM07
```

<a id="b03275"></a>
## b03275 — word/document\.xml/body/\*\[3275\]

```text

```

<a id="b03276"></a>
## b03276 — word/document\.xml/body/\*\[3276\]

```text
Criteria
```

<a id="b03277"></a>
## b03277 — word/document\.xml/body/\*\[3277\]

```text
The MHE BlkPick transaction applies to orders that matches the following criteria picking from active locations:
```

<a id="b03278"></a>
## b03278 — word/document\.xml/body/\*\[3278\]

```text
Order Type is equal to “CUSTREGORD” AND 
(
    Single Line Order is false and Single Unit Order is false OR
    Order Extended Gift Box Indicator is true
)
```

<a id="b03279"></a>
## b03279 — word/document\.xml/body/\*\[3279\]

```text

```

<a id="b03280"></a>
## b03280 — word/document\.xml/body/\*\[3280\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03281"></a>
## b03281 — word/document\.xml/body/\*\[3281\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
MHE LPN Pull	Allocation.OrderCriteriaId is equal to “Sorter A” or “Sorter B” or “Sorter X” and allocation zone is “Active”	Task Capacity up to a gurney capacity by pick zone
```

<a id="b03282"></a>
## b03282 — word/document\.xml/body/\*\[3282\]

```text

```

<a id="b03283"></a>
## b03283 — word/document\.xml/body/\*\[3283\]

```text
Process
```

<a id="b03284"></a>
## b03284 — word/document\.xml/body/\*\[3284\]

```text

```

<a id="b03285"></a>
## b03285 — word/document\.xml/body/\*\[3285\]

```text
User logs in to the appropriate task group.
```

<a id="b03286"></a>
## b03286 — word/document\.xml/body/\*\[3286\]

```text
User requests the next task via the Assign Task mobile transaction.
```

<a id="b03287"></a>
## b03287 — word/document\.xml/body/\*\[3287\]

```text
MAWM prompts for a Tote ID.
```

<a id="b03288"></a>
## b03288 — word/document\.xml/body/\*\[3288\]

```text
User scans the Tote ID from the pick label (task label).
```

<a id="b03289"></a>
## b03289 — word/document\.xml/body/\*\[3289\]

```text
MAWM displays the pick location.
```

<a id="b03290"></a>
## b03290 — word/document\.xml/body/\*\[3290\]

```text
User scans the pick location barcode.
```

<a id="b03291"></a>
## b03291 — word/document\.xml/body/\*\[3291\]

```text
MAWM prompt for an Item.
```

<a id="b03292"></a>
## b03292 — word/document\.xml/body/\*\[3292\]

```text
User scans the item UPC.
```

<a id="b03293"></a>
## b03293 — word/document\.xml/body/\*\[3293\]

```text
User repeats steps 5 through 8 for each LPN pull required for the task.
```

<a id="b03294"></a>
## b03294 — word/document\.xml/body/\*\[3294\]

```text
MAWM prompts the user to scan a staging location based on the Outbound Putaway Strategy.
```

<a id="b03295"></a>
## b03295 — word/document\.xml/body/\*\[3295\]

```text
User scans the staging location ID.
```

<a id="b03296"></a>
## b03296 — word/document\.xml/body/\*\[3296\]

```text

```

<a id="b03297"></a>
## b03297 — word/document\.xml/body/\*\[3297\]

```text

```

<a id="b03298"></a>
## b03298 — word/document\.xml/body/\*\[3298\]

```text

```

<a id="b03299"></a>
## b03299 — word/document\.xml/body/\*\[3299\]

```text
Updates
```

<a id="b03300"></a>
## b03300 — word/document\.xml/body/\*\[3300\]

```text

```

<a id="b03301"></a>
## b03301 — word/document\.xml/body/\*\[3301\]

```text
The task is updated to a ‘Completed’ status.
```

<a id="b03302"></a>
## b03302 — word/document\.xml/body/\*\[3302\]

```text
The location's on-hand quantity is decremented by the picked-quantity.
```

<a id="b03303"></a>
## b03303 — word/document\.xml/body/\*\[3303\]

```text
The scanned location ID contains all picked items.
```

<a id="b03304"></a>
## b03304 — word/document\.xml/body/\*\[3304\]

```text
All oLPNs associated with the task details are updated to ‘Picked’ status.
```

<a id="b03305"></a>
## b03305 — word/document\.xml/body/\*\[3305\]

```text
MHE Pick message is generated.
```

<a id="b03306"></a>
## b03306 — word/document\.xml/body/\*\[3306\]

```text

```

<a id="b03307"></a>
## b03307 — word/document\.xml/body/\*\[3307\]

```text
User Story: LPN Pull
```

<a id="b03308"></a>
## b03308 — word/document\.xml/body/\*\[3308\]

```text

```

<a id="b03309"></a>
## b03309 — word/document\.xml/body/\*\[3309\]

```text
Who	What	Why
Forklift Operator
Crane Operator	Pull LPNs from reserve locations.	Pull LPN from reserve location for Customer Orders and Store Orders.

```

<a id="b03310"></a>
## b03310 — word/document\.xml/body/\*\[3310\]

```text

```

<a id="b03311"></a>
## b03311 — word/document\.xml/body/\*\[3311\]

```text
The Pull LPN transaction is used to pull LPN from reserve locations onto a pallet and put them away onto a staging location of a pack zone based on the order types and the Outbound Putaway Strategy. Tasks are created during task release and are generated by Work Release Batch ID. They are divided by pick zone and pallet capacity, and they are system-assigned based on the task group associated with the operator.
```

<a id="b03312"></a>
## b03312 — word/document\.xml/body/\*\[3312\]

```text
To track different labor activities, pull LPNs are classified with the following transaction IDs:
```

<a id="b03313"></a>
## b03313 — word/document\.xml/body/\*\[3313\]

```text
Singles Pulls: Bulk allocations for singles.
```

<a id="b03314"></a>
## b03314 — word/document\.xml/body/\*\[3314\]

```text
Store Pulls: Allocation for store pack locations.
```

<a id="b03315"></a>
## b03315 — word/document\.xml/body/\*\[3315\]

```text
Assumptions
```

<a id="b03316"></a>
## b03316 — word/document\.xml/body/\*\[3316\]

```text

```

<a id="b03317"></a>
## b03317 — word/document\.xml/body/\*\[3317\]

```text
A task path restriction is used when the LPN pull is from a high-bay or a reserve location, splitting the task into two or three steps based on the requirements.
```

<a id="b03318"></a>
## b03318 — word/document\.xml/body/\*\[3318\]

```text

```

<a id="b03319"></a>
## b03319 — word/document\.xml/body/\*\[3319\]

```text
Criteria
```

<a id="b03320"></a>
## b03320 — word/document\.xml/body/\*\[3320\]

```text
The LPN Pull transaction applies to orders that matches the following criteria picking from active locations:
```

<a id="b03321"></a>
## b03321 — word/document\.xml/body/\*\[3321\]

```text
Singles Pulls

Order Type Is Equal to “CUSTREGORD” AND 
Single Line Order is true AND Single Unit Order is true AND
Order Extended Gift Box Indicator is false

Store Pulls 

Order Type Is Equal to “Store Order” or “Replen Store Order”

```

<a id="b03322"></a>
## b03322 — word/document\.xml/body/\*\[3322\]

```text

```

<a id="b03323"></a>
## b03323 — word/document\.xml/body/\*\[3323\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03324"></a>
## b03324 — word/document\.xml/body/\*\[3324\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Singles Pulls	Order Type Is Equal to “Customer Order” AND 
Single Line Order = true AND Single Unit Order = true AND
Order Extended Box Indicator is false	Every distinct fully allocated LPN ID
Break by Destination Location
Task Capacity up to a pallet
Store Pulls	Order Type Is Equal to “Store Order” or “Replen Store Order”	Every distinct fully allocated LPN ID
Break by Destination Location
Task Capacity up to a pallet
```

<a id="b03325"></a>
## b03325 — word/document\.xml/body/\*\[3325\]

```text

```

<a id="b03326"></a>
## b03326 — word/document\.xml/body/\*\[3326\]

```text
Process
```

<a id="b03327"></a>
## b03327 — word/document\.xml/body/\*\[3327\]

```text

```

<a id="b03328"></a>
## b03328 — word/document\.xml/body/\*\[3328\]

```text
User logs in to the appropriate task group.
```

<a id="b03329"></a>
## b03329 — word/document\.xml/body/\*\[3329\]

```text
User requests the next task via the Assign Task mobile transaction.
```

<a id="b03330"></a>
## b03330 — word/document\.xml/body/\*\[3330\]

```text
MAWM prompts for a pallet.
```

<a id="b03331"></a>
## b03331 — word/document\.xml/body/\*\[3331\]

```text
User scans the pallet ID.
```

<a id="b03332"></a>
## b03332 — word/document\.xml/body/\*\[3332\]

```text
MAWM displays the pull location and prompts for the iLPN to pull.
```

<a id="b03333"></a>
## b03333 — word/document\.xml/body/\*\[3333\]

```text
User scans the iLPN.
```

<a id="b03334"></a>
## b03334 — word/document\.xml/body/\*\[3334\]

```text
User repeats the iLPN scan process until all task details for the task are complete.
```

<a id="b03335"></a>
## b03335 — word/document\.xml/body/\*\[3335\]

```text
MAWM directs the user to the pick drop location (Replen Belt) based on the Outbound Putaway Strategy and task path restrictions.
```

<a id="b03336"></a>
## b03336 — word/document\.xml/body/\*\[3336\]

```text
User scans the pick drop location ID.
```

<a id="b03337"></a>
## b03337 — word/document\.xml/body/\*\[3337\]

```text

```

<a id="b03338"></a>
## b03338 — word/document\.xml/body/\*\[3338\]

```text
Updates
```

<a id="b03339"></a>
## b03339 — word/document\.xml/body/\*\[3339\]

```text

```

<a id="b03340"></a>
## b03340 — word/document\.xml/body/\*\[3340\]

```text
The task is updated to ‘Completed’ status.
```

<a id="b03341"></a>
## b03341 — word/document\.xml/body/\*\[3341\]

```text
The location’s on hand quantity is decremented by picked quantity.
```

<a id="b03342"></a>
## b03342 — word/document\.xml/body/\*\[3342\]

```text
The status of all oLPNs is updated to ‘Picked’.
```

<a id="b03343"></a>
## b03343 — word/document\.xml/body/\*\[3343\]

```text

```

<a id="b03344"></a>
## b03344 — word/document\.xml/body/\*\[3344\]

```text


```

<a id="b03345"></a>
## b03345 — word/document\.xml/body/\*\[3345\]

```text
Bulk Pick (Pick to Tote/Guney)
```

<a id="b03346"></a>
## b03346 — word/document\.xml/body/\*\[3346\]

```text

```

<a id="b03347"></a>
## b03347 — word/document\.xml/body/\*\[3347\]

```text
Who	What	Why
Picker	Pick units from active into a gurney for customer and store orders.	Pick units from active locations into a plastic tote or gurney for Customer Orders, and Store Orders.
```

<a id="b03348"></a>
## b03348 — word/document\.xml/body/\*\[3348\]

```text

```

<a id="b03349"></a>
## b03349 — word/document\.xml/body/\*\[3349\]

```text
Pick to Tote involves picking units from active locations or partially allocated LPNs. These units are then packed with subsequent transactions such as Pack Station, Mobile Packing, or Put to Store. After picking, outbound putaway strategy criteria determine the packing staging location. Tasks are created for both singles bulk allocations for customer orders and for bulk allocations for store pack locations. Task are created by order type and by tote/gurney capacity.
```

<a id="b03350"></a>
## b03350 — word/document\.xml/body/\*\[3350\]

```text
To track different labor activities, pull LPNs are classified with the following transaction IDs:
```

<a id="b03351"></a>
## b03351 — word/document\.xml/body/\*\[3351\]

```text
Sngl Act Pick: Bulk allocations for singles.
```

<a id="b03352"></a>
## b03352 — word/document\.xml/body/\*\[3352\]

```text
Store Act Pick: Bulk allocations for store pack locations.
```

<a id="b03353"></a>
## b03353 — word/document\.xml/body/\*\[3353\]

```text

```

<a id="b03354"></a>
## b03354 — word/document\.xml/body/\*\[3354\]

```text
Criteria
```

<a id="b03355"></a>
## b03355 — word/document\.xml/body/\*\[3355\]

```text
The Sngl Act Pick or Store Act Pck transactions applies to orders that matches the following criteria picking from active locations picked into a tote or gurney:
```

<a id="b03356"></a>
## b03356 — word/document\.xml/body/\*\[3356\]

```text
SnglBlkPick

Order Type Is Equal to “CUSTREGORD” AND 
Single Line Order is true AND Single Unit Order is true AND
Order Extended Gift Box Indicator is false

StoreBlkPck 

Order Type Is Equal to “STORORD” or “STORRPLNORD”

```

<a id="b03357"></a>
## b03357 — word/document\.xml/body/\*\[3357\]

```text

```

<a id="b03358"></a>
## b03358 — word/document\.xml/body/\*\[3358\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03359"></a>
## b03359 — word/document\.xml/body/\*\[3359\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
SnglBlkPick	Order Type is equal to “CUSTREGORD” AND 
Single Line Order is true and Single Unit Order is true and
Order Extended Box Indicator is false	Task Capacity up to a gurney capacity by pick zone
StoreBlkPck	Order Type is equal to “STORORD” or “STORRPLNORD”	Task Capacity up to a gurney capacity by pick zone
```

<a id="b03360"></a>
## b03360 — word/document\.xml/body/\*\[3360\]

```text

```

<a id="b03361"></a>
## b03361 — word/document\.xml/body/\*\[3361\]

```text


```

<a id="b03362"></a>
## b03362 — word/document\.xml/body/\*\[3362\]

```text
Process Steps
```

<a id="b03363"></a>
## b03363 — word/document\.xml/body/\*\[3363\]

```text

```

<a id="b03364"></a>
## b03364 — word/document\.xml/body/\*\[3364\]

```text
User logs in to appropriate task group.
```

<a id="b03365"></a>
## b03365 — word/document\.xml/body/\*\[3365\]

```text
User request next task via Assign Task mobile transaction.
```

<a id="b03366"></a>
## b03366 — word/document\.xml/body/\*\[3366\]

```text
MAWM prompts for Tote Id.
```

<a id="b03367"></a>
## b03367 — word/document\.xml/body/\*\[3367\]

```text
User scans the Tote Id or Gurney ID.
```

<a id="b03368"></a>
## b03368 — word/document\.xml/body/\*\[3368\]

```text
MAWM directs user to a location.
```

<a id="b03369"></a>
## b03369 — word/document\.xml/body/\*\[3369\]

```text
User scans Location to confirm.
```

<a id="b03370"></a>
## b03370 — word/document\.xml/body/\*\[3370\]

```text
User scans each item's UPC  as prompted for each item.
```

<a id="b03371"></a>
## b03371 — word/document\.xml/body/\*\[3371\]

```text
User repeat steps 5 – 7 until all task details are completed.
```

<a id="b03372"></a>
## b03372 — word/document\.xml/body/\*\[3372\]

```text
MAWM prompts user to the staging location based on Outbound Putaway Strategy.
```

<a id="b03373"></a>
## b03373 — word/document\.xml/body/\*\[3373\]

```text
User scans staging location.
```

<a id="b03374"></a>
## b03374 — word/document\.xml/body/\*\[3374\]

```text
Process Updates
```

<a id="b03375"></a>
## b03375 — word/document\.xml/body/\*\[3375\]

```text

```

<a id="b03376"></a>
## b03376 — word/document\.xml/body/\*\[3376\]

```text
Location on hand quantity is decreased by confirmed pick quantity.
```

<a id="b03377"></a>
## b03377 — word/document\.xml/body/\*\[3377\]

```text
Task moved to ‘Completed’ status.
```

<a id="b03378"></a>
## b03378 — word/document\.xml/body/\*\[3378\]

```text
oLPN details associated to the pick tasks are updated to ‘Picked’ status.
```

<a id="b03379"></a>
## b03379 — word/document\.xml/body/\*\[3379\]

```text

```

<a id="b03380"></a>
## b03380 — word/document\.xml/body/\*\[3380\]

```text
User Story: Olpn Pick to Pallet (Olpn2Pallet)
```

<a id="b03381"></a>
## b03381 — word/document\.xml/body/\*\[3381\]

```text
 
```

<a id="b03382"></a>
## b03382 — word/document\.xml/body/\*\[3382\]

```text
Who	What	Why / When
Puller	Pull iLPNs from reserve storage into a Pallet for shipping.	Pull a full LPN for shipping for the following order types with TL/LTL shipping modes.
```

<a id="b03383"></a>
## b03383 — word/document\.xml/body/\*\[3383\]

```text

```

<a id="b03384"></a>
## b03384 — word/document\.xml/body/\*\[3384\]

```text
The Olpn Pick to Pallet transaction picks full vendor boxes (LPNs) from reserve locations onto a pallet without repacking, allowing for direct shipment of these vendor boxes. This transaction supports Wholesale Orders, Transfer Orders, and Special Orders. Pull tasks are generated by order ID and pallet capacity, and after picking, the pick transaction invokes the outbound putaway strategy to determine the appropriate staging location or order consolidation area.  
```

<a id="b03385"></a>
## b03385 — word/document\.xml/body/\*\[3385\]

```text
Criteria
```

<a id="b03386"></a>
## b03386 — word/document\.xml/body/\*\[3386\]

```text
The Olpn Pick to Pallet (Olpn2Pallet) transaction applies to orders that matches the following criteria picking from active locations:
```

<a id="b03387"></a>
## b03387 — word/document\.xml/body/\*\[3387\]

```text
Order Parcel Rate Shop Group Id is null and 
(
Order Type is equal to “WHSLORD” or “OTRNORD” or “STKTRNORD” or “CHARORD” or “LIQORD” or “MRKTORD” or “PSHORD”
)
```

<a id="b03388"></a>
## b03388 — word/document\.xml/body/\*\[3388\]

```text

```

<a id="b03389"></a>
## b03389 — word/document\.xml/body/\*\[3389\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03390"></a>
## b03390 — word/document\.xml/body/\*\[3390\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Olpn2Pallet	Order Parcel Rate Shop Group Id Is Null AND 
(
Order Type Is Equal To “WHSLORD” OR “OTRNORD” OR “STKTRNORD” OR “CHARORD” OR “LIQORD” OR “MRKTORD” OR “PSHORD”
)	Every distinct fully allocated LPN ID
Break by Order Id
Task Capacity up to a pallet
```

<a id="b03391"></a>
## b03391 — word/document\.xml/body/\*\[3391\]

```text

```

<a id="b03392"></a>
## b03392 — word/document\.xml/body/\*\[3392\]

```text
Process
```

<a id="b03393"></a>
## b03393 — word/document\.xml/body/\*\[3393\]

```text

```

<a id="b03394"></a>
## b03394 — word/document\.xml/body/\*\[3394\]

```text
User enters task group and selects Assign Task.
```

<a id="b03395"></a>
## b03395 — word/document\.xml/body/\*\[3395\]

```text
MAWM prompts for pallet.
```

<a id="b03396"></a>
## b03396 — word/document\.xml/body/\*\[3396\]

```text
MAWM directs user to a location, prompts for location.
```

<a id="b03397"></a>
## b03397 — word/document\.xml/body/\*\[3397\]

```text
User scans location, system prompts for iLPN.
```

<a id="b03398"></a>
## b03398 — word/document\.xml/body/\*\[3398\]

```text
User scans iLPN and continues to next location prompted.
```

<a id="b03399"></a>
## b03399 — word/document\.xml/body/\*\[3399\]

```text
User continues to scan all required iLPNs in the task and then completes the pick.
```

<a id="b03400"></a>
## b03400 — word/document\.xml/body/\*\[3400\]

```text
MAWM prompts the user with a location ID based on the outbound putaway strategy.
```

<a id="b03401"></a>
## b03401 — word/document\.xml/body/\*\[3401\]

```text
User scans location ID to confirm the putaway.
```

<a id="b03402"></a>
## b03402 — word/document\.xml/body/\*\[3402\]

```text
Updates
```

<a id="b03403"></a>
## b03403 — word/document\.xml/body/\*\[3403\]

```text
Task is updated to ‘Completed’ status.
```

<a id="b03404"></a>
## b03404 — word/document\.xml/body/\*\[3404\]

```text
Location on hand quantity is decremented by picked quantity.
```

<a id="b03405"></a>
## b03405 — word/document\.xml/body/\*\[3405\]

```text
oLPN status moves to Packed.
```

<a id="b03406"></a>
## b03406 — word/document\.xml/body/\*\[3406\]

```text

```

<a id="b03407"></a>
## b03407 — word/document\.xml/body/\*\[3407\]

```text
User Story: Olpn Pick
```

<a id="b03408"></a>
## b03408 — word/document\.xml/body/\*\[3408\]

```text
 
```

<a id="b03409"></a>
## b03409 — word/document\.xml/body/\*\[3409\]

```text
Who	What	Why
Picker	Pick units from the active location and pull a fully allocated gurney from the floor location as oLPN.	Pick units from active locations into an Olpn (shipping box or gurney) or pick full allocated gurney from a floor as Olpn for Customer Orders.
```

<a id="b03410"></a>
## b03410 — word/document\.xml/body/\*\[3410\]

```text

```

<a id="b03411"></a>
## b03411 — word/document\.xml/body/\*\[3411\]

```text
The Olpn Pick transaction picks units into planned shipping containers (bags, boxes, gurneys, etc.) using a cross-reference blind Olpn. This transaction supports Wholesale Orders, Transfer Orders, and Special Orders. Picking tasks are generated by Olpn ID, and after picking, the pick transaction invokes the outbound putaway strategy to determine the appropriate staging location or order consolidation area. Once the oLPN reaches the staging or order consolidation area, Lands' End can print a shipping or oLPN content label using the cross-reference Olpn ID. 
```

<a id="b03412"></a>
## b03412 — word/document\.xml/body/\*\[3412\]

```text
Criteria
```

<a id="b03413"></a>
## b03413 — word/document\.xml/body/\*\[3413\]

```text
The Olpn Pick transaction applies to orders that matches the following criteria picking from active locations:
```

<a id="b03414"></a>
## b03414 — word/document\.xml/body/\*\[3414\]

```text
Order Parcel Rate Shop Group Id Is Null AND 
(
Order Type Is Equal To “WHSLORD” OR “OTRNORD” OR “STKTRNORD” OR “CHARORD” OR “LIQORD” OR “MRKTORD” OR “PSHORD”
)
```

<a id="b03415"></a>
## b03415 — word/document\.xml/body/\*\[3415\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03416"></a>
## b03416 — word/document\.xml/body/\*\[3416\]

```text
Task Criteria 	Selection Rules	Task Threshold / Break By
Olpn Pick	Order Parcel Rate Shop Group Id is null and 
(
Order Type is equal to “WHSLORD” or “OTRNORD” OR “STKTRNORD” or “CHARORD” or “LIQORD” OR “MRKTORD” or “PSHORD”
)	Task break by distinct OlpnId
```

<a id="b03417"></a>
## b03417 — word/document\.xml/body/\*\[3417\]

```text

```

<a id="b03418"></a>
## b03418 — word/document\.xml/body/\*\[3418\]

```text
Process
```

<a id="b03419"></a>
## b03419 — word/document\.xml/body/\*\[3419\]

```text

```

<a id="b03420"></a>
## b03420 — word/document\.xml/body/\*\[3420\]

```text
User enters task group and selects Assign Task.
```

<a id="b03421"></a>
## b03421 — word/document\.xml/body/\*\[3421\]

```text
MAWM display Olpn Id to be picked
```

<a id="b03422"></a>
## b03422 — word/document\.xml/body/\*\[3422\]

```text
User scans a cross-reference barcode (blind label) to associate it with the Olpn.
```

<a id="b03423"></a>
## b03423 — word/document\.xml/body/\*\[3423\]

```text
User MAWM directs user to a location.
```

<a id="b03424"></a>
## b03424 — word/document\.xml/body/\*\[3424\]

```text
User scans Location barcode to confirm.
```

<a id="b03425"></a>
## b03425 — word/document\.xml/body/\*\[3425\]

```text
User scans each item's UPC  as prompted for each item.
```

<a id="b03426"></a>
## b03426 — word/document\.xml/body/\*\[3426\]

```text
User repeat steps 3 – 5 until all task details are completed.
```

<a id="b03427"></a>
## b03427 — word/document\.xml/body/\*\[3427\]

```text
MAWM prompts user to the staging location based on Outbound Putaway Strategy.
```

<a id="b03428"></a>
## b03428 — word/document\.xml/body/\*\[3428\]

```text
User scans staging location.
```

<a id="b03429"></a>
## b03429 — word/document\.xml/body/\*\[3429\]

```text

```

<a id="b03430"></a>
## b03430 — word/document\.xml/body/\*\[3430\]

```text

```

<a id="b03431"></a>
## b03431 — word/document\.xml/body/\*\[3431\]

```text

```

<a id="b03432"></a>
## b03432 — word/document\.xml/body/\*\[3432\]

```text
Updates
```

<a id="b03433"></a>
## b03433 — word/document\.xml/body/\*\[3433\]

```text

```

<a id="b03434"></a>
## b03434 — word/document\.xml/body/\*\[3434\]

```text
Task is updated to ‘Completed’ status.
```

<a id="b03435"></a>
## b03435 — word/document\.xml/body/\*\[3435\]

```text
Location(s) on hand quantity is/are decremented by the picked quantity.
```

<a id="b03436"></a>
## b03436 — word/document\.xml/body/\*\[3436\]

```text
oLPN status moves to Packed.
```

<a id="b03437"></a>
## b03437 — word/document\.xml/body/\*\[3437\]

```text

```

<a id="b03438"></a>
## b03438 — word/document\.xml/body/\*\[3438\]

```text
User Story: Post VAS Multis Pick
```

<a id="b03439"></a>
## b03439 — word/document\.xml/body/\*\[3439\]

```text
 
```

<a id="b03440"></a>
## b03440 — word/document\.xml/body/\*\[3440\]

```text
Who	What	Why
Picker	Pick Post VAS LPNs for shipping	Allows Multis Post VAS picking to occur from the putwall and direct users to the unit sorter.
```

<a id="b03441"></a>
## b03441 — word/document\.xml/body/\*\[3441\]

```text

```

<a id="b03442"></a>
## b03442 — word/document\.xml/body/\*\[3442\]

```text
Criteria
```

<a id="b03443"></a>
## b03443 — word/document\.xml/body/\*\[3443\]

```text
The Pick Post VAS LPNs transaction applies to orders that matches the following criteria picking from active locations:
```

<a id="b03444"></a>
## b03444 — word/document\.xml/body/\*\[3444\]

```text
Fulfillment Code Is Equal to “M” AND 
(
Order Type Is Equal To “CUSTVASORD”
)
```

<a id="b03445"></a>
## b03445 — word/document\.xml/body/\*\[3445\]

```text
Task Release Template and Task Creation Threshold Criteria (Break Task by) 
```

<a id="b03446"></a>
## b03446 — word/document\.xml/body/\*\[3446\]

```text
Task Criteria 	Fulfillment Code Is Equal to “M” AND 	Task Threshold / Break By
Olpn Pick	Fulfillment Code Is Equal to “M” AND 
(
Order Type Is Equal To “CUSTVASORD”
)	Task break by gurney capacity
```

<a id="b03447"></a>
## b03447 — word/document\.xml/body/\*\[3447\]

```text

```

<a id="b03448"></a>
## b03448 — word/document\.xml/body/\*\[3448\]

```text
Process
```

<a id="b03449"></a>
## b03449 — word/document\.xml/body/\*\[3449\]

```text

```

<a id="b03450"></a>
## b03450 — word/document\.xml/body/\*\[3450\]

```text
User logs in to appropriate task group.
```

<a id="b03451"></a>
## b03451 — word/document\.xml/body/\*\[3451\]

```text
User request next task via Assign Task mobile transaction.
```

<a id="b03452"></a>
## b03452 — word/document\.xml/body/\*\[3452\]

```text
MAWM prompts for Tote Id.
```

<a id="b03453"></a>
## b03453 — word/document\.xml/body/\*\[3453\]

```text
User scans the Tote Id or Gurney ID.
```

<a id="b03454"></a>
## b03454 — word/document\.xml/body/\*\[3454\]

```text
MAWM directs user to a location.
```

<a id="b03455"></a>
## b03455 — word/document\.xml/body/\*\[3455\]

```text
MAWM directs user to an iLPN
```

<a id="b03456"></a>
## b03456 — word/document\.xml/body/\*\[3456\]

```text
User scans the iLPN.
```

<a id="b03457"></a>
## b03457 — word/document\.xml/body/\*\[3457\]

```text
User repeat steps 5 – 7 until all task details are completed.
```

<a id="b03458"></a>
## b03458 — word/document\.xml/body/\*\[3458\]

```text
MAWM prompts user to the staging location based on Outbound Putaway Strategy.
```

<a id="b03459"></a>
## b03459 — word/document\.xml/body/\*\[3459\]

```text
User scans staging location.
```

<a id="b03460"></a>
## b03460 — word/document\.xml/body/\*\[3460\]

```text

```

<a id="b03461"></a>
## b03461 — word/document\.xml/body/\*\[3461\]

```text

```

<a id="b03462"></a>
## b03462 — word/document\.xml/body/\*\[3462\]

```text

```

<a id="b03463"></a>
## b03463 — word/document\.xml/body/\*\[3463\]

```text
Updates
```

<a id="b03464"></a>
## b03464 — word/document\.xml/body/\*\[3464\]

```text

```

<a id="b03465"></a>
## b03465 — word/document\.xml/body/\*\[3465\]

```text
Task is updated to ‘Completed’ status.
```

<a id="b03466"></a>
## b03466 — word/document\.xml/body/\*\[3466\]

```text
Location(s) on hand quantity is/are decremented by the picked quantity.
```

<a id="b03467"></a>
## b03467 — word/document\.xml/body/\*\[3467\]

```text
iLPN status moves to Allocated.
```

<a id="b03468"></a>
## b03468 — word/document\.xml/body/\*\[3468\]

```text


```

<a id="b03469"></a>
## b03469 — word/document\.xml/body/\*\[3469\]

```text
Picking Exceptions
```

<a id="b03470"></a>
## b03470 — word/document\.xml/body/\*\[3470\]

```text
Picking Exceptions occur when MAWM allocates inventory from a location where the physical inventory does not match systematic inventory. Users arrive at locations and attempt to pick the required quantity, but there is not enough inventory in the location to complete the pick. When users are faced with this situation, the picking exception process begins by users selecting the Pick Exception action in the picking transaction. This Pick Exception is linked to a default Reason Code on the Pick Strategy that determines what MAWM does next for the exception flow. For Lands’ End this reason code is configured to first search for any Alternate locations with available inventory within the user’s current zone. If MAWM finds another location that meets the item demand, the inventory is allocated on the fly and the location is added to the user’s current pick path and sequenced appropriately. MAWM directs the user to continue down the pick path and the pick is completed from the newly allocated location. Alternate location search can be restricted by the users current picking zone, to keep users from traveling too far to complete a pick. 
```

<a id="b03471"></a>
## b03471 — word/document\.xml/body/\*\[3471\]

```text
If no alternate location is found after selecting Pick Exceptions, MAWM shorts the unpickable quantity and creates an Order Shortage for the quantity. These Order Shortages can be re-waved (chased) to attempt re-allocation from a new location or once replenishments have been completed. Chase needs are created at the oLPN level at Lands’ End, so any chase allocations are directed to the original cubed oLPN rather than into a new oLPN. 
```

<a id="b03472"></a>
## b03472 — word/document\.xml/body/\*\[3472\]

```text
During any picking exception scenario, Lands’ End configures MAWM to generate a Cycle Count task against the location so any issues can be fixed before other users are sent to pick from the same location. In addition, if a location is picked empty during a picking task MAWM prompts the user to complete an in-line Cycle Count to confirm that the location is empty. This is a yes/no decision the user takes to confirm the location is empty, and if so a cycle count is recorded against the location. If the user selects no, MAWM creates a Cycle Count task for a separate user to come complete. 
```

<a id="b03473"></a>
## b03473 — word/document\.xml/body/\*\[3473\]

```text
Assumptions
```

<a id="b03474"></a>
## b03474 — word/document\.xml/body/\*\[3474\]

```text

```

<a id="b03475"></a>
## b03475 — word/document\.xml/body/\*\[3475\]

```text
Lands’ End does not allow users to Skip picks during the picking process as an exception. This decision was made to ensure pickers are not circling back to previous locations requiring additional travel.
```

<a id="b03476"></a>
## b03476 — word/document\.xml/body/\*\[3476\]

```text
Chase wave picks bypass the MHE unit sorter induction and are directed to a pack station or exception putaway if the OLPN is located at the Hospital putwall.
```

<a id="b03477"></a>
## b03477 — word/document\.xml/body/\*\[3477\]

```text

```

<a id="b03478"></a>
## b03478 — word/document\.xml/body/\*\[3478\]

```text
User Story: Picking Exceptions from LPN Pulls
```

<a id="b03479"></a>
## b03479 — word/document\.xml/body/\*\[3479\]

```text

```

<a id="b03480"></a>
## b03480 — word/document\.xml/body/\*\[3480\]

```text
Who	What	Why
Picker	Follow an exception flow when shortages occur during picking	At times units to be picked out of a location may not be available. The picking exception flow is followed as a prioritized list for users to resolve the shortage.
```

<a id="b03481"></a>
## b03481 — word/document\.xml/body/\*\[3481\]

```text

```

<a id="b03482"></a>
## b03482 — word/document\.xml/body/\*\[3482\]

```text
Process
```

<a id="b03483"></a>
## b03483 — word/document\.xml/body/\*\[3483\]

```text

```

<a id="b03484"></a>
## b03484 — word/document\.xml/body/\*\[3484\]

```text
User arrives at the directed location to pick inventory into a Tote, Cart, oLPN, or onto a Pallet
```

<a id="b03485"></a>
## b03485 — word/document\.xml/body/\*\[3485\]

```text
There is a shortage at the location that does not allow the user to fully pick the required inventory
```

<a id="b03486"></a>
## b03486 — word/document\.xml/body/\*\[3486\]

```text
The iLPN does not exist in the Reserve location, the user click substitute LPN to replace the LPN with another non-allocate LPN from the reserve location.
```

<a id="b03487"></a>
## b03487 — word/document\.xml/body/\*\[3487\]

```text
The full quantity is not available in the Unit location to pick
```

<a id="b03488"></a>
## b03488 — word/document\.xml/body/\*\[3488\]

```text
User picks any inventory that is available at the time
```

<a id="b03489"></a>
## b03489 — word/document\.xml/body/\*\[3489\]

```text
If 3 or 5 units are available in the location, the user picks the 3 units
```

<a id="b03490"></a>
## b03490 — word/document\.xml/body/\*\[3490\]

```text
User selects the Pick Exception action 
```

<a id="b03491"></a>
## b03491 — word/document\.xml/body/\*\[3491\]

```text
If MAWM finds another location to allocate from, user is directed to pick the remining inventory from the location in the pick path
```

<a id="b03492"></a>
## b03492 — word/document\.xml/body/\*\[3492\]

```text
If MAWM finds no alternative location, message is displayed to the user “No Alternate Locations Found”
```

<a id="b03493"></a>
## b03493 — word/document\.xml/body/\*\[3493\]

```text
User Picks inventory from the location if it is available
```

<a id="b03494"></a>
## b03494 — word/document\.xml/body/\*\[3494\]

```text
MAWM Shorts any inventory that is not available to pick from the location in WM Mobile
```

<a id="b03495"></a>
## b03495 — word/document\.xml/body/\*\[3495\]

```text

```

<a id="b03496"></a>
## b03496 — word/document\.xml/body/\*\[3496\]

```text
Updates
```

<a id="b03497"></a>
## b03497 — word/document\.xml/body/\*\[3497\]

```text

```

<a id="b03498"></a>
## b03498 — word/document\.xml/body/\*\[3498\]

```text
Task is updated to ‘Completed’ status
```

<a id="b03499"></a>
## b03499 — word/document\.xml/body/\*\[3499\]

```text
Order Shortage records are created for the shorted units
```

<a id="b03500"></a>
## b03500 — word/document\.xml/body/\*\[3500\]

```text

```

<a id="b03501"></a>
## b03501 — word/document\.xml/body/\*\[3501\]

```text
User Story: Picking Exceptions from Active Locations
```

<a id="b03502"></a>
## b03502 — word/document\.xml/body/\*\[3502\]

```text

```

<a id="b03503"></a>
## b03503 — word/document\.xml/body/\*\[3503\]

```text
Who	What	Why
Picker	Follow an exception flow when shortages occur during picking	At times units to be picked out of a location may not be available. The picking exception flow is followed as a prioritized list for users to resolve the shortage.
```

<a id="b03504"></a>
## b03504 — word/document\.xml/body/\*\[3504\]

```text

```

<a id="b03505"></a>
## b03505 — word/document\.xml/body/\*\[3505\]

```text
Process
```

<a id="b03506"></a>
## b03506 — word/document\.xml/body/\*\[3506\]

```text

```

<a id="b03507"></a>
## b03507 — word/document\.xml/body/\*\[3507\]

```text
User arrives at the directed location to pick inventory into a Tote, Cart, oLPN, or onto a Pallet
```

<a id="b03508"></a>
## b03508 — word/document\.xml/body/\*\[3508\]

```text
There is a shortage at the location that does not allow the user to fully pick the required inventory
```

<a id="b03509"></a>
## b03509 — word/document\.xml/body/\*\[3509\]

```text
The iLPN does not exist in the Reserve location, the user click substitute LPN to replace the LPN with another non-allocate LPN from the reserve location.
```

<a id="b03510"></a>
## b03510 — word/document\.xml/body/\*\[3510\]

```text
The full quantity is not available in the Unit location to pick
```

<a id="b03511"></a>
## b03511 — word/document\.xml/body/\*\[3511\]

```text
User picks any inventory that is available at the time
```

<a id="b03512"></a>
## b03512 — word/document\.xml/body/\*\[3512\]

```text
If 3 or 5 units are available in the location, the user picks the 3 units
```

<a id="b03513"></a>
## b03513 — word/document\.xml/body/\*\[3513\]

```text
User selects the Pick Exception action 
```

<a id="b03514"></a>
## b03514 — word/document\.xml/body/\*\[3514\]

```text
If MAWM finds another location to allocate from, user is directed to pick the remining inventory from the location in the pick path
```

<a id="b03515"></a>
## b03515 — word/document\.xml/body/\*\[3515\]

```text
If MAWM finds no alternative location, message is displayed to the user “No Alternate Locations Found”
```

<a id="b03516"></a>
## b03516 — word/document\.xml/body/\*\[3516\]

```text
User Picks inventory from the location if it is available
```

<a id="b03517"></a>
## b03517 — word/document\.xml/body/\*\[3517\]

```text
MAWM Shorts any inventory that is not available to pick from the location in WM Mobile
```

<a id="b03518"></a>
## b03518 — word/document\.xml/body/\*\[3518\]

```text

```

<a id="b03519"></a>
## b03519 — word/document\.xml/body/\*\[3519\]

```text
Updates
```

<a id="b03520"></a>
## b03520 — word/document\.xml/body/\*\[3520\]

```text

```

<a id="b03521"></a>
## b03521 — word/document\.xml/body/\*\[3521\]

```text
Task is updated to ‘Completed’ status
```

<a id="b03522"></a>
## b03522 — word/document\.xml/body/\*\[3522\]

```text
Order Shortage records are created for the shorted units
```

<a id="b03523"></a>
## b03523 — word/document\.xml/body/\*\[3523\]

```text

```

<a id="b03524"></a>
## b03524 — word/document\.xml/body/\*\[3524\]

```text

```

<a id="b03525"></a>
## b03525 — word/document\.xml/body/\*\[3525\]

```text
MHE Messages
```

<a id="b03526"></a>
## b03526 — word/document\.xml/body/\*\[3526\]

```text
Reference to Lands' End's MHE Communications Document for detailed information on MHE touchpoints and message formats.
```

<a id="b03527"></a>
## b03527 — word/document\.xml/body/\*\[3527\]

```text
Features
```

<a id="b03528"></a>
## b03528 — word/document\.xml/body/\*\[3528\]

```text

```

<a id="b03529"></a>
## b03529 — word/document\.xml/body/\*\[3529\]

```text
Alternate Location Pick (not currently utilized)
```

<a id="b03530"></a>
## b03530 — word/document\.xml/body/\*\[3530\]

```text

```

<a id="b03531"></a>
## b03531 — word/document\.xml/body/\*\[3531\]

```text
Mobile Picking functionality provides users with the ability to request an alternate pick location if the directed pick location does not contain the required units. WM sequences the alternate pick within the remaining pick details to maintain the pick execution sequence.
```

<a id="b03532"></a>
## b03532 — word/document\.xml/body/\*\[3532\]

```text
Skip/Replenish (not currently utilized)
```

<a id="b03533"></a>
## b03533 — word/document\.xml/body/\*\[3533\]

```text

```

<a id="b03534"></a>
## b03534 — word/document\.xml/body/\*\[3534\]

```text
In addition to being able to skip a pick detail, WM can be configured to create, release, or bump up the priority of an existing replenishment task when a pick detail is skipped. 
```

<a id="b03535"></a>
## b03535 — word/document\.xml/body/\*\[3535\]

```text
Picking Shortage
```

<a id="b03536"></a>
## b03536 — word/document\.xml/body/\*\[3536\]

```text

```

<a id="b03537"></a>
## b03537 — word/document\.xml/body/\*\[3537\]

```text
As a last resort during picking, users may short the unpickable inventory. This creates a Chase need at the oLPN or Order level for the shorted units to be re-allocated from a chase wave.  Lands’ End will configure the reason code to created the short need to the Olpn.
```

<a id="b03538"></a>
## b03538 — word/document\.xml/body/\*\[3538\]

```text
Replenish Storage Location (not currently utilized)
```

<a id="b03539"></a>
## b03539 — word/document\.xml/body/\*\[3539\]

```text

```

<a id="b03540"></a>
## b03540 — word/document\.xml/body/\*\[3540\]

```text
During research of any inventory shortages during picking, if the supervisor finds that a replenishment does not exist for the location, they have the ability to create a Replenishment for the location using the Replenish Storage Location transaction. 
```

<a id="b03541"></a>
## b03541 — word/document\.xml/body/\*\[3541\]

```text
In Line Cycle Counts
```

<a id="b03542"></a>
## b03542 — word/document\.xml/body/\*\[3542\]

```text

```

<a id="b03543"></a>
## b03543 — word/document\.xml/body/\*\[3543\]

```text
During the picking process, if a user picks a location to 0 quantity, MAWM can be configured to prompt the user to confirm if the location is empty. If the location is truly empty and confirmed by the user, MAWM counts this as a true Cycle Count and records it against the location. If the location is not truly empty, a Cycle Count task may be created for the location. 
```

<a id="b03544"></a>
## b03544 — word/document\.xml/body/\*\[3544\]

```text
Key Interfaces
```

<a id="b03545"></a>
## b03545 — word/document\.xml/body/\*\[3545\]

```text
None Identified.
```

<a id="b03546"></a>
## b03546 — word/document\.xml/body/\*\[3546\]

```text
Reports, Dashboards, Alerts
```

<a id="b03547"></a>
## b03547 — word/document\.xml/body/\*\[3547\]

```text
Name	Description	Frequency	User/Dept	Type
Order Shortages by Wave/Order	Details the open Order Shortages that have been created due to picking or packing exceptions	As needed	Wave Control	WM Report
Picking Task Report	Details all Open/Assigned/In-Progress/Complete Picking Tasks	As needed	Wave Control	WM Report / Dashboard
```

<a id="b03548"></a>
## b03548 — word/document\.xml/body/\*\[3548\]

```text
Gaps and Extensions
```

<a id="b03549"></a>
## b03549 — word/document\.xml/body/\*\[3549\]

```text
Gap #	Name	Description
 	 	 
```

<a id="b03550"></a>
## b03550 — word/document\.xml/body/\*\[3550\]

```text
Labor Management
```

<a id="b03551"></a>
## b03551 — word/document\.xml/body/\*\[3551\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b03552"></a>
## b03552 — word/document\.xml/body/\*\[3552\]

```text
Pre-VAS Sorting
```

<a id="b03553"></a>
## b03553 — word/document\.xml/body/\*\[3553\]

```text
Lands’ End utilizes a manual outbound sorting transaction, labeled as “Pre-VAS Order Sort” in the WM Mobile menu, to sort and combine production order materials into a Putwall cubby.
```

<a id="b03554"></a>
## b03554 — word/document\.xml/body/\*\[3554\]

```text
The “Pre-VAS Order Sort” transaction is used to sort bulk-picked production order materials for the following order types and order attributes:
```

<a id="b03555"></a>
## b03555 — word/document\.xml/body/\*\[3555\]

```text
Production Order – Logo, with Fulfillment Code equal to M and Enterprise Code is null
```

<a id="b03556"></a>
## b03556 — word/document\.xml/body/\*\[3556\]

```text
Production Order – Heat Transfer 
```

<a id="b03557"></a>
## b03557 — word/document\.xml/body/\*\[3557\]

```text
The Pre-VAS sorting area is equipped with a putwall barcode ID and a set of pre-printed cubby labels attached with clips to identify sorting totes. These labels help create a dynamic cubby (a plastic tote or gurney in a sorting table or sorting floor area) by associating it with a specific sorting tote or gurney. Once the sorting process for a particular tote is complete, MAWM releases the cubby during the "Clear Cubby" process. The cubby label can then be reused to sort another production order during the outbound manual sorting process.
```

<a id="b03558"></a>
## b03558 — word/document\.xml/body/\*\[3558\]

```text

```

<a id="b03559"></a>
## b03559 — word/document\.xml/body/\*\[3559\]

```text
Figure 21 - Example of two dynamic cubbies
```

<a id="b03560"></a>
## b03560 — word/document\.xml/body/\*\[3560\]

```text


```

<a id="b03561"></a>
## b03561 — word/document\.xml/body/\*\[3561\]

```text
User Stories
```

<a id="b03562"></a>
## b03562 — word/document\.xml/body/\*\[3562\]

```text
User Story: Pre-VAS Order Sort 
```

<a id="b03563"></a>
## b03563 — word/document\.xml/body/\*\[3563\]

```text

```

<a id="b03564"></a>
## b03564 — word/document\.xml/body/\*\[3564\]

```text
Who	What	Why
Pre VAS Associate	Sort bulk picked units into a tote/cubby by Production Order.	Group the materials needed to fulfill a production order.
```

<a id="b03565"></a>
## b03565 — word/document\.xml/body/\*\[3565\]

```text

```

<a id="b03566"></a>
## b03566 — word/document\.xml/body/\*\[3566\]

```text
Assumptions 
```

<a id="b03567"></a>
## b03567 — word/document\.xml/body/\*\[3567\]

```text
Multiples associates can sort to the same sorting area from distinct gurneys or totes assigned to each associate.
```

<a id="b03568"></a>
## b03568 — word/document\.xml/body/\*\[3568\]

```text

```

<a id="b03569"></a>
## b03569 — word/document\.xml/body/\*\[3569\]

```text
Process
```

<a id="b03570"></a>
## b03570 — word/document\.xml/body/\*\[3570\]

```text

```

<a id="b03571"></a>
## b03571 — word/document\.xml/body/\*\[3571\]

```text
User navigates to the "Pre-VAS Order Sort" menu option within WM Mobile.
```

<a id="b03572"></a>
## b03572 — word/document\.xml/body/\*\[3572\]

```text
MAWM prompts for a Putwall ID.
```

<a id="b03573"></a>
## b03573 — word/document\.xml/body/\*\[3573\]

```text
User scans the Putwall ID at the assigned Pre-VAS Putwall area.
```

<a id="b03574"></a>
## b03574 — word/document\.xml/body/\*\[3574\]

```text
MAWM prompts for a Tote ID / Gurney ID.
```

<a id="b03575"></a>
## b03575 — word/document\.xml/body/\*\[3575\]

```text
User scans the Tote ID.
```

<a id="b03576"></a>
## b03576 — word/document\.xml/body/\*\[3576\]

```text
MAWM prompts for an item.
```

<a id="b03577"></a>
## b03577 — word/document\.xml/body/\*\[3577\]

```text
User scans an item barcode (UPC) of any item from the scanned tote.
```

<a id="b03578"></a>
## b03578 — word/document\.xml/body/\*\[3578\]

```text
MAWM search for the Olpn with an open sort demand for the scanned UPC.
```

<a id="b03579"></a>
## b03579 — word/document\.xml/body/\*\[3579\]

```text
MAWM prompts user to scan cubby
```

<a id="b03580"></a>
## b03580 — word/document\.xml/body/\*\[3580\]

```text
First unit for an oLPN?
```

<a id="b03581"></a>
## b03581 — word/document\.xml/body/\*\[3581\]

```text
Yes – User scans an empty cubby from the putwall
```

<a id="b03582"></a>
## b03582 — word/document\.xml/body/\*\[3582\]

```text
No – User scans the displayed cubby where other units for the oLPN have been previously sorted
```

<a id="b03583"></a>
## b03583 — word/document\.xml/body/\*\[3583\]

```text
MAWM checks if the sorting process is completed for the Olpn, IF true THEN:
```

<a id="b03584"></a>
## b03584 — word/document\.xml/body/\*\[3584\]

```text
MAWM prompts the user with a "Clear Cubby" message.
```

<a id="b03585"></a>
## b03585 — word/document\.xml/body/\*\[3585\]

```text
User scans the cubby id [WM02] to accepts the message.
```

<a id="b03586"></a>
## b03586 — word/document\.xml/body/\*\[3586\]

```text
MAWM prompts for a tote ID.
```

<a id="b03587"></a>
## b03587 — word/document\.xml/body/\*\[3587\]

```text
User scan a tote ID.
```

<a id="b03588"></a>
## b03588 — word/document\.xml/body/\*\[3588\]

```text
User moves the tote to the opening station to print the “VAS Descriptor Label” for each unit. [WM25]
```

<a id="b03589"></a>
## b03589 — word/document\.xml/body/\*\[3589\]

```text
ELSE, the user repeats steps 6 through 10 for the remaining items in the tote (scanned in step 5) or begins a new sorting process by scanning a new Tote ID in step 4.
```

<a id="b03590"></a>
## b03590 — word/document\.xml/body/\*\[3590\]

```text

```

<a id="b03591"></a>
## b03591 — word/document\.xml/body/\*\[3591\]

```text

```

<a id="b03592"></a>
## b03592 — word/document\.xml/body/\*\[3592\]

```text
Updates
```

<a id="b03593"></a>
## b03593 — word/document\.xml/body/\*\[3593\]

```text

```

<a id="b03594"></a>
## b03594 — word/document\.xml/body/\*\[3594\]

```text
oLPN: Remains in picked status.
```

<a id="b03595"></a>
## b03595 — word/document\.xml/body/\*\[3595\]

```text
A new LPN/Tote has been created for all items that belong to a production order.
```

<a id="b03596"></a>
## b03596 — word/document\.xml/body/\*\[3596\]

```text
Pre-VAS Sorting Exceptions
```

<a id="b03597"></a>
## b03597 — word/document\.xml/body/\*\[3597\]

```text
User Story: Gurney or Tote Inventory Discrepancies
```

<a id="b03598"></a>
## b03598 — word/document\.xml/body/\*\[3598\]

```text

```

<a id="b03599"></a>
## b03599 — word/document\.xml/body/\*\[3599\]

```text
Who	What	Why
Pre VAS Associate	Find misplaced gurney inventory	Gurney or Tote inventory discrepancy, physical quantity doesn’t match with MAWM.
```

<a id="b03600"></a>
## b03600 — word/document\.xml/body/\*\[3600\]

```text

```

<a id="b03601"></a>
## b03601 — word/document\.xml/body/\*\[3601\]

```text
There are scenarios where a product was not sorted properly in the HM sorter. In other cases, an item pick was confirmed, but the item was not placed in the gurney.
```

<a id="b03602"></a>
## b03602 — word/document\.xml/body/\*\[3602\]

```text
The Pre-VAS associate will investigate the discrepancy by reviewing the "LPN Inventory" SCI report to check the remaining contents of the gurney and then searching for the missing item in previous processing areas, as follows:
```

<a id="b03603"></a>
## b03603 — word/document\.xml/body/\*\[3603\]

```text
The associate will check the gurney containing unsorted items from the HM sorter for the missing item.
```

<a id="b03604"></a>
## b03604 — word/document\.xml/body/\*\[3604\]

```text
If the base SKU is not found in the unsorted HM items, or if the gurney or tote being used for Pre-VAS Order Sort is coming from a pick location, the associate will review whether inventory is available at the pick location. If inventory is available, they will adjust the inventory from the active location using a reason code defined in Lands' Pre-VAS Picking SOP.
```

<a id="b03605"></a>
## b03605 — word/document\.xml/body/\*\[3605\]

```text
If no more inventory is available to replace the missing items, the associate will proceed to close the gurney following the Close Container user story.
```

<a id="b03606"></a>
## b03606 — word/document\.xml/body/\*\[3606\]

```text
  
```

<a id="b03607"></a>
## b03607 — word/document\.xml/body/\*\[3607\]

```text
User Story: Clear Pre-VAS Putwall
```

<a id="b03608"></a>
## b03608 — word/document\.xml/body/\*\[3608\]

```text

```

<a id="b03609"></a>
## b03609 — word/document\.xml/body/\*\[3609\]

```text
Who	What	Why
Pre VAS Associate	Release a Pre-VAS putwall cubby to use for sorting process.	Move incomplete sorted product from Pre-VAS putwall to a chase putwall.
```

<a id="b03610"></a>
## b03610 — word/document\.xml/body/\*\[3610\]

```text

```

<a id="b03611"></a>
## b03611 — word/document\.xml/body/\*\[3611\]

```text
The  "Clear Pre-VAS Cubby" transaction is used when the user, either by mistake, did not clear the cubby during the sorting process, or when the production order or demand quantity was canceled using the "Close Container" transaction, a short pick, or a demand cancellation during chase wave allocation. 
```

<a id="b03612"></a>
## b03612 — word/document\.xml/body/\*\[3612\]

```text
The "Clear Pre-VAS Putwall" transaction involves removing the sorted inventory from the respective sorter locations to send the sorted products to the next step of the order fulfillment process, which is the Pre-VAS opening station for the Production Orders fulfillment flow. At the opening station, the descriptor label is printed from MAWM, and the production paperwork is printed from SAP before the items are either moved to the production location or sent to a shipping area to dispatch the items to an outsourced VAS provider. 
```

<a id="b03613"></a>
## b03613 — word/document\.xml/body/\*\[3613\]

```text
Process
```

<a id="b03614"></a>
## b03614 — word/document\.xml/body/\*\[3614\]

```text

```

<a id="b03615"></a>
## b03615 — word/document\.xml/body/\*\[3615\]

```text
User navigates to the "Clear Pre-VAS Putwall" menu option within WM Mobile.
```

<a id="b03616"></a>
## b03616 — word/document\.xml/body/\*\[3616\]

```text
MAWM prompts for a Putwall ID.
```

<a id="b03617"></a>
## b03617 — word/document\.xml/body/\*\[3617\]

```text
User scans the Putwall ID at the assigned Pre-VAS Putwall area.
```

<a id="b03618"></a>
## b03618 — word/document\.xml/body/\*\[3618\]

```text
MAWM search the putwall cubies that ready for packing.
```

<a id="b03619"></a>
## b03619 — word/document\.xml/body/\*\[3619\]

```text
IF a ready to clear cubby is found, MAWM prompts the cubby barcode to scan.
```

<a id="b03620"></a>
## b03620 — word/document\.xml/body/\*\[3620\]

```text
User scans the cubby barcode.
```

<a id="b03621"></a>
## b03621 — word/document\.xml/body/\*\[3621\]

```text
MAWM prompts for a tote ID.
```

<a id="b03622"></a>
## b03622 — word/document\.xml/body/\*\[3622\]

```text
User scan a tote Id from a blind LPN labels roll.
```

<a id="b03623"></a>
## b03623 — word/document\.xml/body/\*\[3623\]

```text
User moves the tote to the opening station to print the “VAS Descriptor Label” for each unit.
```

<a id="b03624"></a>
## b03624 — word/document\.xml/body/\*\[3624\]

```text
ELSE MAWM display a message “No eligible sorter locations to be cleared for the scanned sorter. (PPK::0059)”
```

<a id="b03625"></a>
## b03625 — word/document\.xml/body/\*\[3625\]

```text

```

<a id="b03626"></a>
## b03626 — word/document\.xml/body/\*\[3626\]

```text
Updates
```

<a id="b03627"></a>
## b03627 — word/document\.xml/body/\*\[3627\]

```text

```

<a id="b03628"></a>
## b03628 — word/document\.xml/body/\*\[3628\]

```text
oLPN: Remains in picked status.
```

<a id="b03629"></a>
## b03629 — word/document\.xml/body/\*\[3629\]

```text
A new LPN has been created for all items that belong to a production order.
```

<a id="b03630"></a>
## b03630 — word/document\.xml/body/\*\[3630\]

```text

```

<a id="b03631"></a>
## b03631 — word/document\.xml/body/\*\[3631\]

```text
User Story: Close Container 
```

<a id="b03632"></a>
## b03632 — word/document\.xml/body/\*\[3632\]

```text

```

<a id="b03633"></a>
## b03633 — word/document\.xml/body/\*\[3633\]

```text
Who	What	Why
Pre VAS Associate	Short pick the lines that are pending to be sorted that are not physically in the gurney or tote.	All physical item are sorted but the tote remains with pack allocations
```

<a id="b03634"></a>
## b03634 — word/document\.xml/body/\*\[3634\]

```text

```

<a id="b03635"></a>
## b03635 — word/document\.xml/body/\*\[3635\]

```text
While sorting inventory from a picked container (Tote/iLPN), a user may encounter instances where no inventory is found despite the system expecting more items to be sorted. In such cases, the user can click the “Close Container” button to initiate shortage updates for all outstanding sort details within that container. The “Close Container” option is enabled only for supervisors with the appropriate permissions to use it in the “Pre-VAS Order Sort” transaction.
```

<a id="b03636"></a>
## b03636 — word/document\.xml/body/\*\[3636\]

```text
Assumptions 
```

<a id="b03637"></a>
## b03637 — word/document\.xml/body/\*\[3637\]

```text

```

<a id="b03638"></a>
## b03638 — word/document\.xml/body/\*\[3638\]

```text
A default picked inventory exception reason code is configured with the “Pre-VAS Order Sort” criteria to consume the residual inventory and generate an inventory need to chase the allocated Olpn.  
```

<a id="b03639"></a>
## b03639 — word/document\.xml/body/\*\[3639\]

```text

```

<a id="b03640"></a>
## b03640 — word/document\.xml/body/\*\[3640\]

```text
Process
```

<a id="b03641"></a>
## b03641 — word/document\.xml/body/\*\[3641\]

```text

```

<a id="b03642"></a>
## b03642 — word/document\.xml/body/\*\[3642\]

```text
User navigates to the "Pre-VAS Order Sort" menu option within WM Mobile.
```

<a id="b03643"></a>
## b03643 — word/document\.xml/body/\*\[3643\]

```text
MAWM prompts for a Putwall ID.
```

<a id="b03644"></a>
## b03644 — word/document\.xml/body/\*\[3644\]

```text
User scans the Putwall ID at the assigned Pre-VAS Putwall area.
```

<a id="b03645"></a>
## b03645 — word/document\.xml/body/\*\[3645\]

```text
MAWM prompts for a Tote ID / Gurney ID.
```

<a id="b03646"></a>
## b03646 — word/document\.xml/body/\*\[3646\]

```text
User scans the Tote ID.
```

<a id="b03647"></a>
## b03647 — word/document\.xml/body/\*\[3647\]

```text
MAWM prompts for item scan.
```

<a id="b03648"></a>
## b03648 — word/document\.xml/body/\*\[3648\]

```text
User click “Close Container” from the menu action to short all open allocations sine the tote is already empty.
```

<a id="b03649"></a>
## b03649 — word/document\.xml/body/\*\[3649\]

```text
Updates
```

<a id="b03650"></a>
## b03650 — word/document\.xml/body/\*\[3650\]

```text

```

<a id="b03651"></a>
## b03651 — word/document\.xml/body/\*\[3651\]

```text
oLPN: Remains in picked status.
```

<a id="b03652"></a>
## b03652 — word/document\.xml/body/\*\[3652\]

```text
MAWM creates an order shortage to chase the current Olpn to the last know sort pack location.
```

<a id="b03653"></a>
## b03653 — word/document\.xml/body/\*\[3653\]

```text
User Story: Residual Putaway
```

<a id="b03654"></a>
## b03654 — word/document\.xml/body/\*\[3654\]

```text

```

<a id="b03655"></a>
## b03655 — word/document\.xml/body/\*\[3655\]

```text
Who	What	Why
Pre VAS Associate	Putaway non sorted items to an active or LPN location.	A production order may be canceled after picking has been completed. This can occur, for example, if inventory has been picked but cannot be sorted due to a lack of pack allocations for the associated LPN detail.
```

<a id="b03656"></a>
## b03656 — word/document\.xml/body/\*\[3656\]

```text

```

<a id="b03657"></a>
## b03657 — word/document\.xml/body/\*\[3657\]

```text
While sorting inventory from a picked container (Tote/iLPN), a user may encounter instances where inventory is found in the container, but there are no outstanding sort details. In this scenario, the residual inventory needs to be moved back to an active location or LPN-tracked location using an inbound putaway transaction.
```

<a id="b03658"></a>
## b03658 — word/document\.xml/body/\*\[3658\]

```text
Packing
```

<a id="b03659"></a>
## b03659 — word/document\.xml/body/\*\[3659\]

```text

```

<a id="b03660"></a>
## b03660 — word/document\.xml/body/\*\[3660\]

```text
Packing is the process of gathering and packaging items to prepare them for shipment to the customer. It involves selecting the right item(s) in the correct quantities and packaging them into a shipping container, known as an oLPN. 
```

<a id="b03661"></a>
## b03661 — word/document\.xml/body/\*\[3661\]

```text

```

<a id="b03662"></a>
## b03662 — word/document\.xml/body/\*\[3662\]

```text
The packing functionality is designed to help clients achieve 100% shipping accuracy while increasing picking efficiency.
```

<a id="b03663"></a>
## b03663 — word/document\.xml/body/\*\[3663\]

```text
WM offers a single packing service for all types of packing transactions, including Put to Store, Pack Cubed or Non-Cubed from Tote or iLPN, and Bulk Packing for Retail or E-commerce orders. 
```

<a id="b03664"></a>
## b03664 — word/document\.xml/body/\*\[3664\]

```text

```

<a id="b03665"></a>
## b03665 — word/document\.xml/body/\*\[3665\]

```text
The packing process can be initiated by scanning any of the drivers listed below, where the subsequent flow is determined by the packing criteria definition:
```

<a id="b03666"></a>
## b03666 — word/document\.xml/body/\*\[3666\]

```text

```

<a id="b03667"></a>
## b03667 — word/document\.xml/body/\*\[3667\]

```text
iLPN
```

<a id="b03668"></a>
## b03668 — word/document\.xml/body/\*\[3668\]

```text
Tote
```

<a id="b03669"></a>
## b03669 — word/document\.xml/body/\*\[3669\]

```text
OLPN
```

<a id="b03670"></a>
## b03670 — word/document\.xml/body/\*\[3670\]

```text
Packing Location
```

<a id="b03671"></a>
## b03671 — word/document\.xml/body/\*\[3671\]

```text
Pack Cart
```

<a id="b03672"></a>
## b03672 — word/document\.xml/body/\*\[3672\]

```text
Pick Label ID
```

<a id="b03673"></a>
## b03673 — word/document\.xml/body/\*\[3673\]

```text

```

<a id="b03674"></a>
## b03674 — word/document\.xml/body/\*\[3674\]

```text
The packing process can be completed in either of the following ways:
```

<a id="b03675"></a>
## b03675 — word/document\.xml/body/\*\[3675\]

```text

```

<a id="b03676"></a>
## b03676 — word/document\.xml/body/\*\[3676\]

```text
As a single step, where items are picked from the location and directly packed into the OLPN.
```

<a id="b03677"></a>
## b03677 — word/document\.xml/body/\*\[3677\]

```text
As a two-step process, where items are first picked from the location into a tote/iLPN and then later packed into the OLPN from the picked tote, or items are first picked from the location into a tote/iLPN and transferred to inventory at the packing location, and then later packed into the OLPN.
```

<a id="b03678"></a>
## b03678 — word/document\.xml/body/\*\[3678\]

```text

```

<a id="b03679"></a>
## b03679 — word/document\.xml/body/\*\[3679\]

```text
The various packing options and their supporting features during the packing process are further explained with the user stories provided below.
```

<a id="b03680"></a>
## b03680 — word/document\.xml/body/\*\[3680\]

```text

```

<a id="b03681"></a>
## b03681 — word/document\.xml/body/\*\[3681\]

```text
Assumptions 
```

<a id="b03682"></a>
## b03682 — word/document\.xml/body/\*\[3682\]

```text

```

<a id="b03683"></a>
## b03683 — word/document\.xml/body/\*\[3683\]

```text
Singles and large production orders always bypass the MHE Unit Sorter pack stations and are packed directly in MAWM using the Pack Station UI for Singles and WM Mobile Packing for Large Customer Orders.
```

<a id="b03684"></a>
## b03684 — word/document\.xml/body/\*\[3684\]

```text
Order Instructions are displayed to the user during the packing process to instruct users to perform additional steps on containers before shipping. WM does not track if the action was completed by the user. 
```

<a id="b03685"></a>
## b03685 — word/document\.xml/body/\*\[3685\]

```text
Each Pack Station is configured with a valid printer for shipping labels, pack slips, and collates.
```

<a id="b03686"></a>
## b03686 — word/document\.xml/body/\*\[3686\]

```text
All packing is performed in MAWM, there is no MHE packing process.
```

<a id="b03687"></a>
## b03687 — word/document\.xml/body/\*\[3687\]

```text
Packing parcel oLPNs calls ProShip for shipping information and any required documentation.
```

<a id="b03688"></a>
## b03688 — word/document\.xml/body/\*\[3688\]

```text
User Stories
```

<a id="b03689"></a>
## b03689 — word/document\.xml/body/\*\[3689\]

```text
User Story: Putwall Olpn Sort (LE Putwall Sort)
```

<a id="b03690"></a>
## b03690 — word/document\.xml/body/\*\[3690\]

```text

```

<a id="b03691"></a>
## b03691 — word/document\.xml/body/\*\[3691\]

```text
Who	What	Why
Packing Associate	Sort bulk picked units into a Putwall cubby by Olpn Id	Units are sorted to a chute that holds a group of oLPNs. An additional sortation is required to be performed to sort the units into cubbies for individual oLPNs.
```

<a id="b03692"></a>
## b03692 — word/document\.xml/body/\*\[3692\]

```text

```

<a id="b03693"></a>
## b03693 — word/document\.xml/body/\*\[3693\]

```text
All oLPNs processed through the MHE Unit Sorter / MHE Pack Sorter are handled via a custom MAWM Mobile Outbound Sort transaction, “LE Putwall Sort” [WM02] which sort picked products into a Putwall cubies . Matthews and Sorter-X Unit Sorters contains a chute/bombay per pack station, each configured with an oLPN capacity matching the total cubbies used in MAWM for putwall sorting once all items are diverted into the pack station chute. 
```

<a id="b03694"></a>
## b03694 — word/document\.xml/body/\*\[3694\]

```text
When items are sorted by the MHE, a sort completion message is sent to MAWM containing item and chute information. MAWM creates a Logical Tote [AU04] with this data, enabling packing associates to begin sorting items when all expected item are diverted into the pack station chute/bombay.
```

<a id="b03695"></a>
## b03695 — word/document\.xml/body/\*\[3695\]

```text
Non sortable Items follow a secondary process within the Matthews MHE system. Instead of being inducted onto the Matthews Unit Sorter, these items are taken to the pack station area at the beginning of the process and scanned using a Matthews handheld device. Upon scanning, the same sortation/divert process occurs as with the automated Matthews system, directing the user to place the item into a designated pack station or chute. This process follows the same MHE integration workflow as when an item is inducted into the MHE conveyor.
```

<a id="b03696"></a>
## b03696 — word/document\.xml/body/\*\[3696\]

```text
Matthews pack stations are equipped with a physical putwall with cubbies, while Sorter-X pack stations use a plastic divider labeled as a cubby to divide products on the pack station table by OLPN during the sorting process. This sorting process ensures that all required items are packed into a planned shipping container or OLPN.
```

<a id="b03697"></a>
## b03697 — word/document\.xml/body/\*\[3697\]

```text
In most cases, the first cubby is auto-cleared before the subsequent pre-sorted items (pile of items) are packed because Sorter-X has already sorted the items in the sequence of the required OLPNs. However, if the next subwave becomes active, the packer must transfer the consolidated items from the virtual cubby/plastic divider to a hospital putwall located beside the pack station. Physically, this putwall is a shelf divided into cubbies to facilitate package completion after triaging shortages; either by packing from a hospital chute or by a hospital runner completing item consolidation after a chase wave.
```

<a id="b03698"></a>
## b03698 — word/document\.xml/body/\*\[3698\]

```text
When a chute is full, an ALLOWPACK message is sent to MAWM, indicating it is ready for packing, a Green Light (Matthews Pack Stations) is turned on. If a chute is not marked as ready (LPN.Extended.Allowpack = 'false'), an error is displayed. However, supervisors can override this error if necessary.
```

<a id="b03699"></a>
## b03699 — word/document\.xml/body/\*\[3699\]

```text
After scanning the UPC or VAS Label (VAS Label ID / LpnId) and entering the Country of Origin (when required), MAWM displays the destination cubby. The associate places the item in the cubby and scans it. If it is the first item for an oLPN, a new cubby is assigned; otherwise, the item is directed to the pre-assigned/pre-selected cubby.
```

<a id="b03700"></a>
## b03700 — word/document\.xml/body/\*\[3700\]

```text
When a cubby is full, a message is displayed to inform the user that the oLPN has been fully sorted and the cubby is ready for packing into an Outbound LPN. Upon accepting the "oLPN Packed" message in WM Mobile, the oLPN’s Container Type and Container Size are shown to guide the user in selecting the appropriate bag or box for packing. If the suggested container is deemed unsuitable, the user can adjust the Container Type and Size in WM Mobile.
```

<a id="b03701"></a>
## b03701 — word/document\.xml/body/\*\[3701\]

```text
After packing, special instructions (if any) are displayed. Examples of special instructions used at Lands’ End include inserting shipping materials, fulfilling special customer requests, or applying a “Do Not Open Until {specified date}” sticker [WM02].
```

<a id="b03702"></a>
## b03702 — word/document\.xml/body/\*\[3702\]

```text
Once the instructions are reviewed, completed, and acknowledged in WM Mobile, a print confirmation screen indicates that the oLPN is packed and ready for documentation printing. MAWM sends a Ship Request to the ProShip, which returns a Tracking Number and shipping label. These documents are printed, and the container is placed on the conveyor. Finally, MAWM sends an MHE message to the shipping sorter with the oLPN information, ensuring it is diverted to the correct outbound shipping lane.
```

<a id="b03703"></a>
## b03703 — word/document\.xml/body/\*\[3703\]

```text

```

<a id="b03704"></a>
## b03704 — word/document\.xml/body/\*\[3704\]

```text
Outbound Sort Transaction:
```

<a id="b03705"></a>
## b03705 — word/document\.xml/body/\*\[3705\]

```text
LE Sort to Putwall: EX02 Country of Origin disabled.
```

<a id="b03706"></a>
## b03706 — word/document\.xml/body/\*\[3706\]

```text
LE Sort International: EX02 Country of Origin enabled.
```

<a id="b03707"></a>
## b03707 — word/document\.xml/body/\*\[3707\]

```text
LE Sort to Hospital Putwall: EX02 Country of Origin enabled.
```

<a id="b03708"></a>
## b03708 — word/document\.xml/body/\*\[3708\]

```text

```

<a id="b03709"></a>
## b03709 — word/document\.xml/body/\*\[3709\]

```text
Assumptions 
```

<a id="b03710"></a>
## b03710 — word/document\.xml/body/\*\[3710\]

```text

```

<a id="b03711"></a>
## b03711 — word/document\.xml/body/\*\[3711\]

```text
Each pack station will contain a pre-printed tote id that are used to start  the outbound manual sorting / putwall sorting in WM Mobile.
```

<a id="b03712"></a>
## b03712 — word/document\.xml/body/\*\[3712\]

```text
The Sorter-X pack station table is segmented with cubby labels used to sort the pre-sorter product pile by OLPNs. If the auto-clear cubby message is not triggered after packing the second item pile (subsequent OLPN), the packer will manually pack out the sorted items into a bundle with a rubber band and apply an OLPN cross-reference blind label to identify it at the Hospital putwall.
```

<a id="b03713"></a>
## b03713 — word/document\.xml/body/\*\[3713\]

```text
The Sorter-X pack station will have 21 tote labels per pack station, representing the active subwave. The tote ID will contain the items dropped from the Bombay.
```

<a id="b03714"></a>
## b03714 — word/document\.xml/body/\*\[3714\]

```text
The Sorter-X pack station will have 21 hospital chutes per pack station, used for the integration between Sorter-X and MAWM to move non-sorted items when a sub-wave Bombay is manually opened due to not reaching sort completion.
```

<a id="b03715"></a>
## b03715 — word/document\.xml/body/\*\[3715\]

```text
For VAS finished items, a VAS Label ID (Pre VAS LPN Id) is used instead of a UPC barcode [WM02].
```

<a id="b03716"></a>
## b03716 — word/document\.xml/body/\*\[3716\]

```text

```

<a id="b03717"></a>
## b03717 — word/document\.xml/body/\*\[3717\]

```text

```

<a id="b03718"></a>
## b03718 — word/document\.xml/body/\*\[3718\]

```text
Figure 22 - Sorter-X Cubby Dividers
```

<a id="b03719"></a>
## b03719 — word/document\.xml/body/\*\[3719\]

```text

```

<a id="b03720"></a>
## b03720 — word/document\.xml/body/\*\[3720\]

```text
Figure 23 - Matthews Pack Station Putwalls
```

<a id="b03721"></a>
## b03721 — word/document\.xml/body/\*\[3721\]

```text
Process
```

<a id="b03722"></a>
## b03722 — word/document\.xml/body/\*\[3722\]

```text
User enters WM Mobile and navigates to the “LE Putwall Sort” Transaction.
```

<a id="b03723"></a>
## b03723 — word/document\.xml/body/\*\[3723\]

```text
System then prompts for a Putwall ID .
```

<a id="b03724"></a>
## b03724 — word/document\.xml/body/\*\[3724\]

```text
User scans the Putwall ID (Pack Station ID) at the packing area.
```

<a id="b03725"></a>
## b03725 — word/document\.xml/body/\*\[3725\]

```text
System prompts for a Tote ID. (Sorter-X pack station will have 21 Tote Labes per pack station that represent the active subwave, the Tote Id will contain the items dropped from the bombay) 
```

<a id="b03726"></a>
## b03726 — word/document\.xml/body/\*\[3726\]

```text
User scans the Tote ID (Chute ID in Matthews).
```

<a id="b03727"></a>
## b03727 — word/document\.xml/body/\*\[3727\]

```text
MAWM prompts for Item Barcode scan.
```

<a id="b03728"></a>
## b03728 — word/document\.xml/body/\*\[3728\]

```text
Users scan the Pick Label (VAS Label Id) or Item Barcode and WM02 search the appropriate records based on the scanned barcode.
```

<a id="b03729"></a>
## b03729 — word/document\.xml/body/\*\[3729\]

```text
IF is an International Pack station then MAWM prompts for Country of Origin if required [WM02] 
```

<a id="b03730"></a>
## b03730 — word/document\.xml/body/\*\[3730\]

```text
User selects the Country of Origin from Item if required.
```

<a id="b03731"></a>
## b03731 — word/document\.xml/body/\*\[3731\]

```text
MAWM prompts user to scan cubby
```

<a id="b03732"></a>
## b03732 — word/document\.xml/body/\*\[3732\]

```text
First unit for an oLPN?
```

<a id="b03733"></a>
## b03733 — word/document\.xml/body/\*\[3733\]

```text
Yes – User scans an empty cubby from the putwall or Sorter-X pack station table position. 
```

<a id="b03734"></a>
## b03734 — word/document\.xml/body/\*\[3734\]

```text
No – User scans the displayed cubby where other units for the oLPN have been previously sorted
```

<a id="b03735"></a>
## b03735 — word/document\.xml/body/\*\[3735\]

```text
MAWM checks if the sorting process is completed for the Olpn, IF true THEN:
```

<a id="b03736"></a>
## b03736 — word/document\.xml/body/\*\[3736\]

```text
MAWM display “Clear Cubby” message.
```

<a id="b03737"></a>
## b03737 — word/document\.xml/body/\*\[3737\]

```text
User scan the cubby barcode to clear the message. [WM02].
```

<a id="b03738"></a>
## b03738 — word/document\.xml/body/\*\[3738\]

```text
MAWM invokes the packing transaction linked to OB Sort Transaction [WM02].
```

<a id="b03739"></a>
## b03739 — word/document\.xml/body/\*\[3739\]

```text
MAWM display Pack Order Instructions
```

<a id="b03740"></a>
## b03740 — word/document\.xml/body/\*\[3740\]

```text
User Taps WM Mobile screen to confirm.
```

<a id="b03741"></a>
## b03741 — word/document\.xml/body/\*\[3741\]

```text
MAWM display oLPN Type/Size
```

<a id="b03742"></a>
## b03742 — word/document\.xml/body/\*\[3742\]

```text
User taps WM Mobile screen to confirm.
```

<a id="b03743"></a>
## b03743 — word/document\.xml/body/\*\[3743\]

```text
oLPN goes to packed status.
```

<a id="b03744"></a>
## b03744 — word/document\.xml/body/\*\[3744\]

```text
If oLPN shipping mode is Parcel then MAWM sends ship message to Pro-Ship.
```

<a id="b03745"></a>
## b03745 — word/document\.xml/body/\*\[3745\]

```text
ProShip send the Shipping Label information back to MAWM to print.
```

<a id="b03746"></a>
## b03746 — word/document\.xml/body/\*\[3746\]

```text
oLPN goes to “Manifested” status.
```

<a id="b03747"></a>
## b03747 — word/document\.xml/body/\*\[3747\]

```text
Shipping Label is printed.
```

<a id="b03748"></a>
## b03748 — word/document\.xml/body/\*\[3748\]

```text
Packing Slip is printed if required.
```

<a id="b03749"></a>
## b03749 — word/document\.xml/body/\*\[3749\]

```text
User applies label and other shipping documents as required.
```

<a id="b03750"></a>
## b03750 — word/document\.xml/body/\*\[3750\]

```text
User places oLPN on the shipping conveyor belt.
```

<a id="b03751"></a>
## b03751 — word/document\.xml/body/\*\[3751\]

```text
ELSE, User repeats steps 6 to 10 for the remaining items in the tote/chute (scanned in step 5) or begins a new sorting process by scanning a Chute ID/ Tote ID in step 4.
```

<a id="b03752"></a>
## b03752 — word/document\.xml/body/\*\[3752\]

```text
Updates
```

<a id="b03753"></a>
## b03753 — word/document\.xml/body/\*\[3753\]

```text
oLPN goes to Manifested status if it a Parcel shipment else goes to Packed status.
```

<a id="b03754"></a>
## b03754 — word/document\.xml/body/\*\[3754\]

```text
oLPN is updated with a Carrier Tracking Number if it is shipped via a parcel carrier.
```

<a id="b03755"></a>
## b03755 — word/document\.xml/body/\*\[3755\]

```text
Order Line status updated if all units are packed.
```

<a id="b03756"></a>
## b03756 — word/document\.xml/body/\*\[3756\]

```text
MHE message sent to Shipping Sorter.
```

<a id="b03757"></a>
## b03757 — word/document\.xml/body/\*\[3757\]

```text
User Story: Gift Box Putwall Sort 
```

<a id="b03758"></a>
## b03758 — word/document\.xml/body/\*\[3758\]

```text
Who	What	Why
Packing Associate	Sort bulk picked units into a Putwall cubby by Olpn Id (Gift Box)	Units are sorted to a chute that holds a group of oLPNs. An additional sortation is required to be performed to sort the units into cubbies for individual oLPNs.
```

<a id="b03759"></a>
## b03759 — word/document\.xml/body/\*\[3759\]

```text

```

<a id="b03760"></a>
## b03760 — word/document\.xml/body/\*\[3760\]

```text
Process
```

<a id="b03761"></a>
## b03761 — word/document\.xml/body/\*\[3761\]

```text
User navigates to the "LE Gift Box Putwall Sort" menu option within WM Mobile.
```

<a id="b03762"></a>
## b03762 — word/document\.xml/body/\*\[3762\]

```text
MAWM prompts for a Putwall ID.
```

<a id="b03763"></a>
## b03763 — word/document\.xml/body/\*\[3763\]

```text
User the Putwall ID (Pack Station ID) at the packing area.
```

<a id="b03764"></a>
## b03764 — word/document\.xml/body/\*\[3764\]

```text
MAWM prompts for a Tote ID / Chute ID.
```

<a id="b03765"></a>
## b03765 — word/document\.xml/body/\*\[3765\]

```text
User scans the Tote ID (Chute ID in Matthews).
```

<a id="b03766"></a>
## b03766 — word/document\.xml/body/\*\[3766\]

```text
MAWM prompts for an item.
```

<a id="b03767"></a>
## b03767 — word/document\.xml/body/\*\[3767\]

```text
User scans an item barcode (UPC) of any item from the scanned tote.
```

<a id="b03768"></a>
## b03768 — word/document\.xml/body/\*\[3768\]

```text
MAWM search for the Olpn with an open sort demand for the scanned UPC.
```

<a id="b03769"></a>
## b03769 — word/document\.xml/body/\*\[3769\]

```text
MAWM prompts user to scan cubby
```

<a id="b03770"></a>
## b03770 — word/document\.xml/body/\*\[3770\]

```text
First unit for an oLPN?
```

<a id="b03771"></a>
## b03771 — word/document\.xml/body/\*\[3771\]

```text
Yes – User scans an empty cubby from the putwall
```

<a id="b03772"></a>
## b03772 — word/document\.xml/body/\*\[3772\]

```text
No – User scans the displayed cubby where other units for the oLPN have been previously sorted
```

<a id="b03773"></a>
## b03773 — word/document\.xml/body/\*\[3773\]

```text
MAWM checks if the sorting process is completed for the Olpn, IF true THEN:
```

<a id="b03774"></a>
## b03774 — word/document\.xml/body/\*\[3774\]

```text
MAWM prompts the user with a "Clear Cubby" message.
```

<a id="b03775"></a>
## b03775 — word/document\.xml/body/\*\[3775\]

```text
User scan the cubby for verification the cubby that they are clearing.
```

<a id="b03776"></a>
## b03776 — word/document\.xml/body/\*\[3776\]

```text
MAWM prompts for a tote ID
```

<a id="b03777"></a>
## b03777 — word/document\.xml/body/\*\[3777\]

```text
User scan a tote Id from a blind LPN labels roll /paper pile (pre-printed tote id)
```

<a id="b03778"></a>
## b03778 — word/document\.xml/body/\*\[3778\]

```text
User bundles the gift box items with the LPN paperwork and secures them with a rubber band.
```

<a id="b03779"></a>
## b03779 — word/document\.xml/body/\*\[3779\]

```text
User place the gift-box items into a gurney.
```

<a id="b03780"></a>
## b03780 — word/document\.xml/body/\*\[3780\]

```text
ELSE, the user repeats steps 6 through 10 for the remaining items in the tote (scanned in step 5) or begins a new sorting process by scanning a new Tote ID in step 4.
```

<a id="b03781"></a>
## b03781 — word/document\.xml/body/\*\[3781\]

```text

```

<a id="b03782"></a>
## b03782 — word/document\.xml/body/\*\[3782\]

```text
Note: One the gift box gurney is full and it is moved to the Gift-Box pack station area to complete the packing.
```

<a id="b03783"></a>
## b03783 — word/document\.xml/body/\*\[3783\]

```text
Updates
```

<a id="b03784"></a>
## b03784 — word/document\.xml/body/\*\[3784\]

```text

```

<a id="b03785"></a>
## b03785 — word/document\.xml/body/\*\[3785\]

```text
oLPN: Remains in picked status.
```

<a id="b03786"></a>
## b03786 — word/document\.xml/body/\*\[3786\]

```text
A new LPN/Tote has been created for all items that belong to a production order.
```

<a id="b03787"></a>
## b03787 — word/document\.xml/body/\*\[3787\]

```text


```

<a id="b03788"></a>
## b03788 — word/document\.xml/body/\*\[3788\]

```text
User Story: Pack Station UI 
```

<a id="b03789"></a>
## b03789 — word/document\.xml/body/\*\[3789\]

```text
Who	What	Why
Packing Associate	Pack oLPNs at Pack Station UI	Singles oLPNs are pulled together via full iLPN pulls or a dedicated tote. Singles packing allows for packing without a secondary sortation process.
```

<a id="b03790"></a>
## b03790 — word/document\.xml/body/\*\[3790\]

```text

```

<a id="b03791"></a>
## b03791 — word/document\.xml/body/\*\[3791\]

```text
Single unit customer orders or large production orders are packed using the MAWM Pack Station UI.
```

<a id="b03792"></a>
## b03792 — word/document\.xml/body/\*\[3792\]

```text

```

<a id="b03793"></a>
## b03793 — word/document\.xml/body/\*\[3793\]

```text
Users begin by selecting their pack station ID in the MAWM Pack Station UI. Next, they scan an iLPN, Tote ID, or Gurney ID to view its contents and the associated oLPNs to be packed.
```

<a id="b03794"></a>
## b03794 — word/document\.xml/body/\*\[3794\]

```text
After scanning an iLPN, the user scans the item's UPC barcode to associate it with the highest-priority oLPN. MAWM does not require quantity verification for single-item packs.
```

<a id="b03795"></a>
## b03795 — word/document\.xml/body/\*\[3795\]

```text
For specific workflows (e.g., Completed VAS, Returns, or GOH), pick labels are used for packing. If a pick label is available, users should scan its ID instead of the UPC barcode [WM02].
```

<a id="b03796"></a>
## b03796 — word/document\.xml/body/\*\[3796\]

```text
For international orders, MAWM prompts the user to enter the item's country of origin [WM02]. If no country of origin is required, the item is packed, and a ship request is sent to EPI. Once the shipping label is received, it is printed and applied to the container. Additionally, MAWM sends an MHE message to the sorter to ensure proper shipping lane diversion.
```

<a id="b03797"></a>
## b03797 — word/document\.xml/body/\*\[3797\]

```text
Process
```

<a id="b03798"></a>
## b03798 — word/document\.xml/body/\*\[3798\]

```text
User navigate to the Pack Station UI in MAWM and selects their current Station ID.
```

<a id="b03799"></a>
## b03799 — word/document\.xml/body/\*\[3799\]

```text
MAWM prompts for a Tote or GurneyId/IlpnId.
```

<a id="b03800"></a>
## b03800 — word/document\.xml/body/\*\[3800\]

```text
User scans Tote ID/iLPN to pack out of. 
```

<a id="b03801"></a>
## b03801 — word/document\.xml/body/\*\[3801\]

```text
MAWM prompts for an Item.
```

<a id="b03802"></a>
## b03802 — word/document\.xml/body/\*\[3802\]

```text
User scans VAS Label ID  or Item barcode [WM02].
```

<a id="b03803"></a>
## b03803 — word/document\.xml/body/\*\[3803\]

```text
MAWM checks of COO is required  [WM02].
```

<a id="b03804"></a>
## b03804 — word/document\.xml/body/\*\[3804\]

```text
Yes – MAWM displays custom pop-up for user to select COO from.
```

<a id="b03805"></a>
## b03805 — word/document\.xml/body/\*\[3805\]

```text
No – No Pop Up displayed to the user.
```

<a id="b03806"></a>
## b03806 — word/document\.xml/body/\*\[3806\]

```text
Unit is packed against proper detail.
```

<a id="b03807"></a>
## b03807 — word/document\.xml/body/\*\[3807\]

```text
IF an Olpn goes to packed status
```

<a id="b03808"></a>
## b03808 — word/document\.xml/body/\*\[3808\]

```text
If oLPN shipping mode is Parcel then MAWM sends ship message to Pro-Ship.
```

<a id="b03809"></a>
## b03809 — word/document\.xml/body/\*\[3809\]

```text
ProShip send the Shipping Label information back to MAWM to print.
```

<a id="b03810"></a>
## b03810 — word/document\.xml/body/\*\[3810\]

```text
oLPN goes to “Manifested” status.
```

<a id="b03811"></a>
## b03811 — word/document\.xml/body/\*\[3811\]

```text
Shipping Label is printed.
```

<a id="b03812"></a>
## b03812 — word/document\.xml/body/\*\[3812\]

```text
Packing Slip is printed if required.
```

<a id="b03813"></a>
## b03813 — word/document\.xml/body/\*\[3813\]

```text
User applies label and other shipping documents as required.
```

<a id="b03814"></a>
## b03814 — word/document\.xml/body/\*\[3814\]

```text
User places oLPN on the shipping conveyor belt.
```

<a id="b03815"></a>
## b03815 — word/document\.xml/body/\*\[3815\]

```text
User repeats steps 4-8 until all units in tote are packed.
```

<a id="b03816"></a>
## b03816 — word/document\.xml/body/\*\[3816\]

```text
Updates
```

<a id="b03817"></a>
## b03817 — word/document\.xml/body/\*\[3817\]

```text
oLPN goes to Packed or Manifested status if the Olpn ship mode is parcel.
```

<a id="b03818"></a>
## b03818 — word/document\.xml/body/\*\[3818\]

```text
oLPN is updated with a Tracking Number if the Olpn ship mode is parcel.
```

<a id="b03819"></a>
## b03819 — word/document\.xml/body/\*\[3819\]

```text
Order Line status updated to Packed.
```

<a id="b03820"></a>
## b03820 — word/document\.xml/body/\*\[3820\]

```text
MHE message sent to Shipping Sorter.
```

<a id="b03821"></a>
## b03821 — word/document\.xml/body/\*\[3821\]

```text
Pack Station UI (Single Olpn Tote) 
```

<a id="b03822"></a>
## b03822 — word/document\.xml/body/\*\[3822\]

```text
Who	What	Why
Packing Associate	Pack oLPNs at Pack Station UI from a single Olpn tote.	Pack Olpn from a tote.
```

<a id="b03823"></a>
## b03823 — word/document\.xml/body/\*\[3823\]

```text

```

<a id="b03824"></a>
## b03824 — word/document\.xml/body/\*\[3824\]

```text
Pack Station UI for single olpn tote is used to completed the packing process of gift boxes orders.
```

<a id="b03825"></a>
## b03825 — word/document\.xml/body/\*\[3825\]

```text
Process
```

<a id="b03826"></a>
## b03826 — word/document\.xml/body/\*\[3826\]

```text
User navigate to the Pack Station UI in MAWM and selects their current Station ID.
```

<a id="b03827"></a>
## b03827 — word/document\.xml/body/\*\[3827\]

```text
MAWM prompts for a Tote or iLPN (VAS Label Id).
```

<a id="b03828"></a>
## b03828 — word/document\.xml/body/\*\[3828\]

```text
User scans Tote ID/iLPN to pack out of.
```

<a id="b03829"></a>
## b03829 — word/document\.xml/body/\*\[3829\]

```text
It is a Single Olpn Tote (All tote details are allocated to same Olpn). 
```

<a id="b03830"></a>
## b03830 — word/document\.xml/body/\*\[3830\]

```text
Yes – Assign Olpn Cross Reference Label.  
```

<a id="b03831"></a>
## b03831 — word/document\.xml/body/\*\[3831\]

```text
MAWM prompts for an Item
```

<a id="b03832"></a>
## b03832 — word/document\.xml/body/\*\[3832\]

```text
User scans VAS Label ID or Item barcode [WM02]
```

<a id="b03833"></a>
## b03833 — word/document\.xml/body/\*\[3833\]

```text
MAWM checks of COO is required  [WM02]
```

<a id="b03834"></a>
## b03834 — word/document\.xml/body/\*\[3834\]

```text
Yes – MAWM displays custom pop-up for user to select COO.
```

<a id="b03835"></a>
## b03835 — word/document\.xml/body/\*\[3835\]

```text
No – No Pop Up displayed to the user.
```

<a id="b03836"></a>
## b03836 — word/document\.xml/body/\*\[3836\]

```text
Unit is packed against proper detail.
```

<a id="b03837"></a>
## b03837 — word/document\.xml/body/\*\[3837\]

```text
IF an Olpn goes to packed status
```

<a id="b03838"></a>
## b03838 — word/document\.xml/body/\*\[3838\]

```text
If oLPN shipping mode is Parcel then MAWM sends ship message to Pro-Ship.
```

<a id="b03839"></a>
## b03839 — word/document\.xml/body/\*\[3839\]

```text
ProShip send the Shipping Label information back to MAWM to print.
```

<a id="b03840"></a>
## b03840 — word/document\.xml/body/\*\[3840\]

```text
oLPN goes to “Manifested” status.
```

<a id="b03841"></a>
## b03841 — word/document\.xml/body/\*\[3841\]

```text
Shipping Label is printed.
```

<a id="b03842"></a>
## b03842 — word/document\.xml/body/\*\[3842\]

```text
Packing Slip is printed if required.
```

<a id="b03843"></a>
## b03843 — word/document\.xml/body/\*\[3843\]

```text
User applies label and other shipping documents as required.
```

<a id="b03844"></a>
## b03844 — word/document\.xml/body/\*\[3844\]

```text
User places oLPN on the shipping conveyor belt.
```

<a id="b03845"></a>
## b03845 — word/document\.xml/body/\*\[3845\]

```text
User repeats steps 4-8 until all units in tote are packed.
```

<a id="b03846"></a>
## b03846 — word/document\.xml/body/\*\[3846\]

```text

```

<a id="b03847"></a>
## b03847 — word/document\.xml/body/\*\[3847\]

```text
Updates
```

<a id="b03848"></a>
## b03848 — word/document\.xml/body/\*\[3848\]

```text

```

<a id="b03849"></a>
## b03849 — word/document\.xml/body/\*\[3849\]

```text
oLPN goes to Packed or Manifested status if the Olpn ship mode is parcel.
```

<a id="b03850"></a>
## b03850 — word/document\.xml/body/\*\[3850\]

```text
oLPN is updated with a Tracking Number if the Olpn ship mode is parcel.
```

<a id="b03851"></a>
## b03851 — word/document\.xml/body/\*\[3851\]

```text
Order Line status updated to Packed.
```

<a id="b03852"></a>
## b03852 — word/document\.xml/body/\*\[3852\]

```text
MHE message sent to Shipping Sorter.
```

<a id="b03853"></a>
## b03853 — word/document\.xml/body/\*\[3853\]

```text


```

<a id="b03854"></a>
## b03854 — word/document\.xml/body/\*\[3854\]

```text
User Story: Large VAS Customer Orders (Non-Cube Packing Flow) 
```

<a id="b03855"></a>
## b03855 — word/document\.xml/body/\*\[3855\]

```text

```

<a id="b03856"></a>
## b03856 — word/document\.xml/body/\*\[3856\]

```text
Who	What	Why
Packing Associate	Pack non-cubed units from iLPN into  oLPNs via WM Mobile	Pack non cubed units for a large VAS Customer Order.
```

<a id="b03857"></a>
## b03857 — word/document\.xml/body/\*\[3857\]

```text

```

<a id="b03858"></a>
## b03858 — word/document\.xml/body/\*\[3858\]

```text
Large VAS customer orders with the fulfillment code "L" (Order Extended Attribute) are allocated from gurneys or totes located at a post-VAS receiving floor location. The order lines may be allocated across multiple gurneys or pallets before being moved to a designated packing area (Large VAS Order Packing Zone). In this area, packers pack the finished goods into shipping containers, determining the specific container type during the packing process.
```

<a id="b03859"></a>
## b03859 — word/document\.xml/body/\*\[3859\]

```text
Process
```

<a id="b03860"></a>
## b03860 — word/document\.xml/body/\*\[3860\]

```text

```

<a id="b03861"></a>
## b03861 — word/document\.xml/body/\*\[3861\]

```text
User enters the WM Packing transaction in WM Mobile.
```

<a id="b03862"></a>
## b03862 — word/document\.xml/body/\*\[3862\]

```text
MAWM prompts for a iLPN or Tote ID or Gurney ID.
```

<a id="b03863"></a>
## b03863 — word/document\.xml/body/\*\[3863\]

```text
User scans an tote/ilpn barcode. 
```

<a id="b03864"></a>
## b03864 — word/document\.xml/body/\*\[3864\]

```text
MAWM prompts for a Container Type and Size.
```

<a id="b03865"></a>
## b03865 — word/document\.xml/body/\*\[3865\]

```text
User selects the appropriate container type and size.
```

<a id="b03866"></a>
## b03866 — word/document\.xml/body/\*\[3866\]

```text
MAWM prompts for an Item.
```

<a id="b03867"></a>
## b03867 — word/document\.xml/body/\*\[3867\]

```text
User scan the VAS Label ID or Item Barcode and WM02 search the appropriated records based on the scanned barcode.
```

<a id="b03868"></a>
## b03868 — word/document\.xml/body/\*\[3868\]

```text
MAWM checks of COO is required  [WM02].
```

<a id="b03869"></a>
## b03869 — word/document\.xml/body/\*\[3869\]

```text
Yes – MAWM displays custom pop-up for user to select COO.
```

<a id="b03870"></a>
## b03870 — word/document\.xml/body/\*\[3870\]

```text
No – No Pop Up displayed to the user.
```

<a id="b03871"></a>
## b03871 — word/document\.xml/body/\*\[3871\]

```text
Unit is packed against proper detail.
```

<a id="b03872"></a>
## b03872 — word/document\.xml/body/\*\[3872\]

```text
IF an Olpn goes to packed status
```

<a id="b03873"></a>
## b03873 — word/document\.xml/body/\*\[3873\]

```text
If oLPN shipping mode is Parcel then MAWM sends ship message to Pro-Ship.
```

<a id="b03874"></a>
## b03874 — word/document\.xml/body/\*\[3874\]

```text
ProShip send the Shipping Label information back to MAWM to print.
```

<a id="b03875"></a>
## b03875 — word/document\.xml/body/\*\[3875\]

```text
oLPN goes to “Manifested” status.
```

<a id="b03876"></a>
## b03876 — word/document\.xml/body/\*\[3876\]

```text
Shipping Label is printed.
```

<a id="b03877"></a>
## b03877 — word/document\.xml/body/\*\[3877\]

```text
Packing Slip is printed if required.
```

<a id="b03878"></a>
## b03878 — word/document\.xml/body/\*\[3878\]

```text
User applies label and other shipping documents as required.
```

<a id="b03879"></a>
## b03879 — word/document\.xml/body/\*\[3879\]

```text
User places oLPN on the shipping conveyor belt.
```

<a id="b03880"></a>
## b03880 — word/document\.xml/body/\*\[3880\]

```text
User repeats steps 4-8 until all units in tote are packed.
```

<a id="b03881"></a>
## b03881 — word/document\.xml/body/\*\[3881\]

```text

```

<a id="b03882"></a>
## b03882 — word/document\.xml/body/\*\[3882\]

```text
Updates
```

<a id="b03883"></a>
## b03883 — word/document\.xml/body/\*\[3883\]

```text

```

<a id="b03884"></a>
## b03884 — word/document\.xml/body/\*\[3884\]

```text
oLPN goes to packed status and then to manifested status.
```

<a id="b03885"></a>
## b03885 — word/document\.xml/body/\*\[3885\]

```text
Tracking Number for oLPN is updated if the Olpn ship mode is parcel.
```

<a id="b03886"></a>
## b03886 — word/document\.xml/body/\*\[3886\]

```text
Order Line(s) status updated to Packed.
```

<a id="b03887"></a>
## b03887 — word/document\.xml/body/\*\[3887\]

```text
MHE message sent to Shipping Sorter.
```

<a id="b03888"></a>
## b03888 — word/document\.xml/body/\*\[3888\]

```text


```

<a id="b03889"></a>
## b03889 — word/document\.xml/body/\*\[3889\]

```text
User Story: Pre VAS Packing (Descriptor Label Print) 
```

<a id="b03890"></a>
## b03890 — word/document\.xml/body/\*\[3890\]

```text

```

<a id="b03891"></a>
## b03891 — word/document\.xml/body/\*\[3891\]

```text
Who	What	Why
Pre VAS Associate	Pack production order items.	Pack Pre VAS oLPNs and print VAS descriptor label.
```

<a id="b03892"></a>
## b03892 — word/document\.xml/body/\*\[3892\]

```text

```

<a id="b03893"></a>
## b03893 — word/document\.xml/body/\*\[3893\]

```text
To start the production order process, Lands’ End VAS operations teams require that each picked unit be identified with a "VAS descriptor" label. This label is printed for each unit picked in a tote (e.g., tote, gurney, vendor box).
```

<a id="b03894"></a>
## b03894 — word/document\.xml/body/\*\[3894\]

```text
The VAS Opening Station prepares the production order materials by opening the item's original packages and packing them using a transaction in MAWM that invokes custom packing logic. This logic packs each unit into an outbound shipping container (oLPN), which subsequently serves as the pick label ID (VAS Label Id) after the VAS process is completed [WM25].
```

<a id="b03895"></a>
## b03895 — word/document\.xml/body/\*\[3895\]

```text
Additionally, an oLPN cross-reference number is assigned, consisting of the production order number concatenated with the sequence of the oLPN generated for the specific order line. This number is used to reprint a descriptor label if needed after the Pre-VAS packing process [WM25].
```

<a id="b03896"></a>
## b03896 — word/document\.xml/body/\*\[3896\]

```text
If the "Hemming Mono Indicator" is set to "true" for the Original Order Line (OrderLine.Extended.HemMonoIndicator), the system generates a VAS Machine barcode known as the Hemming Monograming VAS Machine Barcode (Eton will have a logic in the scanner to insert a dummy digits at the first 9 and 12 position to make the barcode compatible for ETON machine) (oLPN.HemMonoMachineBarcode) to be printed on the descriptor label [WM25].
```

<a id="b03897"></a>
## b03897 — word/document\.xml/body/\*\[3897\]

```text
Assumption 
```

<a id="b03898"></a>
## b03898 — word/document\.xml/body/\*\[3898\]

```text

```

<a id="b03899"></a>
## b03899 — word/document\.xml/body/\*\[3899\]

```text
The “Print Descriptor Label” is a custom MAWM packing mobile transaction [WM25].
```

<a id="b03900"></a>
## b03900 — word/document\.xml/body/\*\[3900\]

```text
Heat transfer logos do not require a VAS descriptor label and are automatically packed with each base item scan as part of WM25.
```

<a id="b03901"></a>
## b03901 — word/document\.xml/body/\*\[3901\]

```text
Name Badge Picking Container is a single Item Lpn in MAWM.
```

<a id="b03902"></a>
## b03902 — word/document\.xml/body/\*\[3902\]

```text
Heat transfer orders are pack out after the heat transfer are married on a pre-vas putwall following Pre-VAS SOP process.
```

<a id="b03903"></a>
## b03903 — word/document\.xml/body/\*\[3903\]

```text

```

<a id="b03904"></a>
## b03904 — word/document\.xml/body/\*\[3904\]

```text
Process
```

<a id="b03905"></a>
## b03905 — word/document\.xml/body/\*\[3905\]

```text

```

<a id="b03906"></a>
## b03906 — word/document\.xml/body/\*\[3906\]

```text
User navigates to “Print Descriptor Label” menu option in WM Mobile [WM25].
```

<a id="b03907"></a>
## b03907 — word/document\.xml/body/\*\[3907\]

```text
MAWM  prompts for a Source LPN Id.
```

<a id="b03908"></a>
## b03908 — word/document\.xml/body/\*\[3908\]

```text
User scans an iLPN (Vendor LPN Id or Gurney ID or Tote Id generated from Pre-VAS Sorting process).
```

<a id="b03909"></a>
## b03909 — word/document\.xml/body/\*\[3909\]

```text
IF scanned LPN/Tote is a Single Item LPN or a Name Badge Picking Container THEN
```

<a id="b03910"></a>
## b03910 — word/document\.xml/body/\*\[3910\]

```text
A “VAS Descriptor Label (Custom Olpn Shipping Label)” is printed with production order information for all Lpn details and each unit [WM25].
```

<a id="b03911"></a>
## b03911 — word/document\.xml/body/\*\[3911\]

```text
Otherwise MAWM prompts for an Item/UPC scan
```

<a id="b03912"></a>
## b03912 — word/document\.xml/body/\*\[3912\]

```text
A descriptor label is printed with production order information and auto generated LPN Id for a unit of the scanned item/UPC [WM25].
```

<a id="b03913"></a>
## b03913 — word/document\.xml/body/\*\[3913\]

```text
Steps 4b is repeated until all units and items are packed and labels are printed.
```

<a id="b03914"></a>
## b03914 — word/document\.xml/body/\*\[3914\]

```text
Once items are tagged for production, the user moves them to the VAS processing area for In-House productions or nests them (outbound palletization process) into a transportation container for outsourced VAS.
```

<a id="b03915"></a>
## b03915 — word/document\.xml/body/\*\[3915\]

```text

```

<a id="b03916"></a>
## b03916 — word/document\.xml/body/\*\[3916\]

```text


```

<a id="b03917"></a>
## b03917 — word/document\.xml/body/\*\[3917\]

```text
Updates
```

<a id="b03918"></a>
## b03918 — word/document\.xml/body/\*\[3918\]

```text

```

<a id="b03919"></a>
## b03919 — word/document\.xml/body/\*\[3919\]

```text
For the in-house VAS process, the oLPN is updated to a "packed" status and then to a "shipped" status after a few minutes via the oLPN planning scheduler.
```

<a id="b03920"></a>
## b03920 — word/document\.xml/body/\*\[3920\]

```text
For the outsourced VAS process, the oLPN is updated to a "packed" status but remains in this status until it is shipped following the outsourced consolidation and shipping process, which includes palletization, truck loading, and shipping.
```

<a id="b03921"></a>
## b03921 — word/document\.xml/body/\*\[3921\]

```text

```

<a id="b03922"></a>
## b03922 — word/document\.xml/body/\*\[3922\]

```text
User Story: Put to Store - Packing
```

<a id="b03923"></a>
## b03923 — word/document\.xml/body/\*\[3923\]

```text
Who	What	Why
Packing Associate	Pack units from iLPNs to oLPN for shipping. 	Fulfill store pack allocations for less than full iLPN quantity need to shipping.
```

<a id="b03924"></a>
## b03924 — word/document\.xml/body/\*\[3924\]

```text

```

<a id="b03925"></a>
## b03925 — word/document\.xml/body/\*\[3925\]

```text
For store pack allocations, users deliver iLPNs picked from reserve and totes picked from active to put to store packing zone. Users leverage Put to Store Mobile Packing transaction to pack the iLPN/tote inventory to oLPNs located in store pack locations.
```

<a id="b03926"></a>
## b03926 — word/document\.xml/body/\*\[3926\]

```text
Process
```

<a id="b03927"></a>
## b03927 — word/document\.xml/body/\*\[3927\]

```text

```

<a id="b03928"></a>
## b03928 — word/document\.xml/body/\*\[3928\]

```text
User navigates to the “Put to Store” mobile transaction in WM Mobile.
```

<a id="b03929"></a>
## b03929 — word/document\.xml/body/\*\[3929\]

```text
MAWM prompts for a iLPN/Tote Id to pack
```

<a id="b03930"></a>
## b03930 — word/document\.xml/body/\*\[3930\]

```text
User scans an tote/ilpn barcode. 
```

<a id="b03931"></a>
## b03931 — word/document\.xml/body/\*\[3931\]

```text
MAWM directs to store pack location.
```

<a id="b03932"></a>
## b03932 — word/document\.xml/body/\*\[3932\]

```text
User scans Olpn Id in store pack location.
```

<a id="b03933"></a>
## b03933 — word/document\.xml/body/\*\[3933\]

```text
MAWM prompts for an Item.
```

<a id="b03934"></a>
## b03934 — word/document\.xml/body/\*\[3934\]

```text
User scan the VAS Label ID or Item Barcode and WM02 search the appropriated records based on the scanned barcode.
```

<a id="b03935"></a>
## b03935 — word/document\.xml/body/\*\[3935\]

```text
MAWM checks of COO is required  [WM02].
```

<a id="b03936"></a>
## b03936 — word/document\.xml/body/\*\[3936\]

```text
Yes – MAWM displays custom pop-up for user to select COO.
```

<a id="b03937"></a>
## b03937 — word/document\.xml/body/\*\[3937\]

```text
No – No Pop Up displayed to the user.
```

<a id="b03938"></a>
## b03938 — word/document\.xml/body/\*\[3938\]

```text
User repeats steps 4-8 until all units in tote are packed.
```

<a id="b03939"></a>
## b03939 — word/document\.xml/body/\*\[3939\]

```text

```

<a id="b03940"></a>
## b03940 — word/document\.xml/body/\*\[3940\]

```text
Updates
```

<a id="b03941"></a>
## b03941 — word/document\.xml/body/\*\[3941\]

```text

```

<a id="b03942"></a>
## b03942 — word/document\.xml/body/\*\[3942\]

```text
iLPN inventory decreased and consumed after all units are packed out.
```

<a id="b03943"></a>
## b03943 — word/document\.xml/body/\*\[3943\]

```text
oLPNs inventory increased.
```

<a id="b03944"></a>
## b03944 — word/document\.xml/body/\*\[3944\]

```text
Pack Task details are completed.
```

<a id="b03945"></a>
## b03945 — word/document\.xml/body/\*\[3945\]

```text


```

<a id="b03946"></a>
## b03946 — word/document\.xml/body/\*\[3946\]

```text
User Story: Put to Store – Close Container
```

<a id="b03947"></a>
## b03947 — word/document\.xml/body/\*\[3947\]

```text
Who	What	Why
Packing Associate	Close oLPNs ready for shipping. 	Systemically pack complete PTS oLPNs in preparation for shipping. 
```

<a id="b03948"></a>
## b03948 — word/document\.xml/body/\*\[3948\]

```text

```

<a id="b03949"></a>
## b03949 — word/document\.xml/body/\*\[3949\]

```text
Users identify the opportunity to close PTS oLPNs in two ways. First, the packing associate identifies the oLPN physically reaches capacity and requires closing. Second, packing supervisors review an oLPN aging report to identify oLPNs reaching a certain timeframe requiring closure to ship the inventory. In either scenario, the operator leverages Put to Store end oLPN menu action to pack complete the oLPNs.
```

<a id="b03950"></a>
## b03950 — word/document\.xml/body/\*\[3950\]

```text
Process
```

<a id="b03951"></a>
## b03951 — word/document\.xml/body/\*\[3951\]

```text

```

<a id="b03952"></a>
## b03952 — word/document\.xml/body/\*\[3952\]

```text
User navigates to the “Put to Store” mobile transaction in WM Mobile.
```

<a id="b03953"></a>
## b03953 — word/document\.xml/body/\*\[3953\]

```text
MAWM prompts for a iLPN/Tote Id to pack
```

<a id="b03954"></a>
## b03954 — word/document\.xml/body/\*\[3954\]

```text
User selects “End Olpn” menu action.
```

<a id="b03955"></a>
## b03955 — word/document\.xml/body/\*\[3955\]

```text
MAWM prompts for oLPN to close
```

<a id="b03956"></a>
## b03956 — word/document\.xml/body/\*\[3956\]

```text
User scans Olpn Id from store pack location
```

<a id="b03957"></a>
## b03957 — word/document\.xml/body/\*\[3957\]

```text

```

<a id="b03958"></a>
## b03958 — word/document\.xml/body/\*\[3958\]

```text
Updates
```

<a id="b03959"></a>
## b03959 — word/document\.xml/body/\*\[3959\]

```text

```

<a id="b03960"></a>
## b03960 — word/document\.xml/body/\*\[3960\]

```text
Olpn is updated to Packed status.
```

<a id="b03961"></a>
## b03961 — word/document\.xml/body/\*\[3961\]

```text
If oLPN shipping mode is Parcel then MAWM sends ship message to ProShip.
```

<a id="b03962"></a>
## b03962 — word/document\.xml/body/\*\[3962\]

```text
ProShip send the Shipping Label information back to MAWM to print.
```

<a id="b03963"></a>
## b03963 — word/document\.xml/body/\*\[3963\]

```text
oLPN goes to “Manifested” status.
```

<a id="b03964"></a>
## b03964 — word/document\.xml/body/\*\[3964\]

```text
Tracking Number for oLPN is updated.
```

<a id="b03965"></a>
## b03965 — word/document\.xml/body/\*\[3965\]

```text
Shipping Label is printed.
```

<a id="b03966"></a>
## b03966 — word/document\.xml/body/\*\[3966\]

```text
Packing Slip is printed if required.
```

<a id="b03967"></a>
## b03967 — word/document\.xml/body/\*\[3967\]

```text
User applies label and other shipping documents as required.
```

<a id="b03968"></a>
## b03968 — word/document\.xml/body/\*\[3968\]

```text
User places oLPN on the shipping conveyor belt. 
```

<a id="b03969"></a>
## b03969 — word/document\.xml/body/\*\[3969\]

```text
Order Line(s) status updated to Packed.
```

<a id="b03970"></a>
## b03970 — word/document\.xml/body/\*\[3970\]

```text
MHE message sent to Shipping Sorter.
```

<a id="b03971"></a>
## b03971 — word/document\.xml/body/\*\[3971\]

```text

```

<a id="b03972"></a>
## b03972 — word/document\.xml/body/\*\[3972\]

```text
Packing Exceptions Stories
```

<a id="b03973"></a>
## b03973 — word/document\.xml/body/\*\[3973\]

```text

```

<a id="b03974"></a>
## b03974 — word/document\.xml/body/\*\[3974\]

```text
Exceptions during the packing process may occur for both putwall packing as well as singles pack station packing. An exception occurs when the expected inventory at the time of packing is not available to pack into the oLPN. Like a picking exception, MAWM creates an open Olpn Shortage to attempt to re-allocate the inventory to be picked and married up with the original oLPN. 
```

<a id="b03975"></a>
## b03975 — word/document\.xml/body/\*\[3975\]

```text
Lands’ End runs a chase wave to allocate inventory only for shorted oLPNs. The chase inventory is picked into a tote by pack zone and are directed to the respective packing zone using outbound putaway strategy post-picking.  
```

<a id="b03976"></a>
## b03976 — word/document\.xml/body/\*\[3976\]

```text
If chase allocations are re-waved and cannot be allocated, the shortage is canceled and the oLPN goes to a “picked” status in the exception putwall. oLPNs which have the shortages canceled can be processed with a Clear Outbound Sort location (“LE Clear Hospital Putwall) transaction to remove the oLPN from the exception putwall and to pack it at a Pack Station UI or in WM Mobile packing.
```

<a id="b03977"></a>
## b03977 — word/document\.xml/body/\*\[3977\]

```text
 Alternatively, to circumvent the waving allocation cancellation process, users may manually cancel specific order or oLPN shortages via the Order Shortages UI. When a shortage is canceled, the same process mentioned above occurs where the oLPN in the putwall is now ready to be removed and packed. 
```

<a id="b03978"></a>
## b03978 — word/document\.xml/body/\*\[3978\]

```text
This evaluation would need to take place during the packing process to determine if the oLPN being packed, or any oLPN associated with the order, has an inventory shortage. If there is a shortage, MAWM would display that the oLPN is to be canceled to the user so it may be taken to the proper area to be returned to inventory. The order and order line statuses would also be updated to canceled and order cancellation PIXs would be sent to the Host system. 
```

<a id="b03979"></a>
## b03979 — word/document\.xml/body/\*\[3979\]

```text
User Story: MHE Chute Close (Matthews Pack Stations) 
```

<a id="b03980"></a>
## b03980 — word/document\.xml/body/\*\[3980\]

```text

```

<a id="b03981"></a>
## b03981 — word/document\.xml/body/\*\[3981\]

```text
Who	What	Why
Packing Associate/MHE	Short remaining units at a Chute in MHE	Chutes are closed and inventory that was expected but did not arrive is shorted to be re-allocated.
```

<a id="b03982"></a>
## b03982 — word/document\.xml/body/\*\[3982\]

```text

```

<a id="b03983"></a>
## b03983 — word/document\.xml/body/\*\[3983\]

```text
The exception flow begins when the packing associate uses the MHE Light Indicator to determine if a chute has been closed in the MHE or manually closes the chute by pressing the PTL button. These processes close the current chute and short any remaining inventory that is assigned to chute, which may not have arrived. A Chute Close message is sent from Matthews to MAWM, containing the chute, batch, and shorted contents. MAWM processes the message and systematically shorts the inventory, creating chase needs for the oLPN so the missing inventory can be reallocated, picked, and matched with the original oLPN contents to be packed out in full.
```

<a id="b03984"></a>
## b03984 — word/document\.xml/body/\*\[3984\]

```text

```

<a id="b03985"></a>
## b03985 — word/document\.xml/body/\*\[3985\]

```text
Additionally, as part of WM08, further validations are performed when the Close Chute message is received by MAWM. WM08 checks for any remaining task details associated with the oLPN that are still in the MHE Unit Sorter Pack location or that have not yet been inducted. These task details are also shorted or marked to be shorted. These shorts are communicated to the MHE to eliminate the need on the MHE system, ensuring no units are jackpotted or sent to chutes with remaining needs on the MHE side.
```

<a id="b03986"></a>
## b03986 — word/document\.xml/body/\*\[3986\]

```text

```

<a id="b03987"></a>
## b03987 — word/document\.xml/body/\*\[3987\]

```text
After the chute contents are shorted in MAWM, users may now clear the contents of the incomplete cubby from the putwall frame into an oLPN to be moved to the exception putwall area. The Clear Outbound Sort Location transaction is selected in WM Mobile, the user scans the putwall frame that the cubby to be cleared exists in and scans the incomplete cubby to remove the contents. An oLPN must be associated to the contents of the cubby that is being cleared for an exception, after scanning the cubby to clear the contents the user scans a blind cross reference oLPN ID to move the contents into. This cross reference oLPN is used to transport the contents to the exception putwall where users perform a manual ‘Outbound Putaway’ to locate the oLPN contents into a new exception putwall cubby. 
```

<a id="b03988"></a>
## b03988 — word/document\.xml/body/\*\[3988\]

```text
At times, inventory remains in the MHE Pack Location after a run due to exceptions. When this is required, a separate WM Mobile transaction is configured to Pack from Pack Location. When this transaction is entered, users can scan the MHE Pack Location and use the ‘Close Container’ action to short all the remaining inventory on the belt. As part of [AU01], this also sends an MHE message to Matthews to remove the inventory needs from the MHE system as well. This ensures that both systems are aligned with the shortages and order needs. 
```

<a id="b03989"></a>
## b03989 — word/document\.xml/body/\*\[3989\]

```text
If packing is taking place via the Pack Station UI in MAWM and inventory is short, users select the ‘End Tote’ action on the UI to short the remaining units and create Chase needs for each unit in MAWM. Singles shorts are not required to go a putwall, these are fulfilled individually.
```

<a id="b03990"></a>
## b03990 — word/document\.xml/body/\*\[3990\]

```text
Assumptions
```

<a id="b03991"></a>
## b03991 — word/document\.xml/body/\*\[3991\]

```text

```

<a id="b03992"></a>
## b03992 — word/document\.xml/body/\*\[3992\]

```text
The Close Container action is disabled in the WM Mobile device to prevent users from shorting the inventory during the sortation process, all shorts must come from the MHE system. 
```

<a id="b03993"></a>
## b03993 — word/document\.xml/body/\*\[3993\]

```text
“Close Container” action menu from Outbound Sorting transaction and “End Tote” action menu from pack station UI is controlled by resource permissions only allowed for the trouble-runners roles.
```

<a id="b03994"></a>
## b03994 — word/document\.xml/body/\*\[3994\]

```text

```

<a id="b03995"></a>
## b03995 — word/document\.xml/body/\*\[3995\]

```text
Process
```

<a id="b03996"></a>
## b03996 — word/document\.xml/body/\*\[3996\]

```text

```

<a id="b03997"></a>
## b03997 — word/document\.xml/body/\*\[3997\]

```text
User performs Outbound Sort until all units for a chute have been sorted, but not all cubbies are empty
```

<a id="b03998"></a>
## b03998 — word/document\.xml/body/\*\[3998\]

```text
Users force close the chutes in the Matthews by pressing the PTL button at the chute to close it
```

<a id="b03999"></a>
## b03999 — word/document\.xml/body/\*\[3999\]

```text
Matthews sends a Chute Close message to MAWM.
```

<a id="b04000"></a>
## b04000 — word/document\.xml/body/\*\[4000\]

```text
MAWM shorts any unsorted inventory from the current pack station tote/chute.
```

<a id="b04001"></a>
## b04001 — word/document\.xml/body/\*\[4001\]

```text
MAWM invokes WM08 custom processes.
```

<a id="b04002"></a>
## b04002 — word/document\.xml/body/\*\[4002\]

```text

```

<a id="b04003"></a>
## b04003 — word/document\.xml/body/\*\[4003\]

```text
Updates
```

<a id="b04004"></a>
## b04004 — word/document\.xml/body/\*\[4004\]

```text

```

<a id="b04005"></a>
## b04005 — word/document\.xml/body/\*\[4005\]

```text
Order Shortages are created for the shorted inventory at the oLPN level.
```

<a id="b04006"></a>
## b04006 — word/document\.xml/body/\*\[4006\]

```text
Shorted inventory is moved to a ‘Lost’ bucket or into an iLPN.
```

<a id="b04007"></a>
## b04007 — word/document\.xml/body/\*\[4007\]

```text

```

<a id="b04008"></a>
## b04008 — word/document\.xml/body/\*\[4008\]

```text


```

<a id="b04009"></a>
## b04009 — word/document\.xml/body/\*\[4009\]

```text
User Story: Clear Putwall
```

<a id="b04010"></a>
## b04010 — word/document\.xml/body/\*\[4010\]

```text

```

<a id="b04011"></a>
## b04011 — word/document\.xml/body/\*\[4011\]

```text
Who	What	Why
Packing Associate	Clear contents from cubbies after chutes are closed	Cubby contents with shorted inventory must be removed so the next chute can be sorted into the putwall
```

<a id="b04012"></a>
## b04012 — word/document\.xml/body/\*\[4012\]

```text

```

<a id="b04013"></a>
## b04013 — word/document\.xml/body/\*\[4013\]

```text
Process
```

<a id="b04014"></a>
## b04014 — word/document\.xml/body/\*\[4014\]

```text

```

<a id="b04015"></a>
## b04015 — word/document\.xml/body/\*\[4015\]

```text
User enters WM Mobile and navigates to the “LE Clear Putwall”.
```

<a id="b04016"></a>
## b04016 — word/document\.xml/body/\*\[4016\]

```text
MAWM prompts for a Putwall ID.
```

<a id="b04017"></a>
## b04017 — word/document\.xml/body/\*\[4017\]

```text
User scans the Putwall ID / Pack Station ID.
```

<a id="b04018"></a>
## b04018 — word/document\.xml/body/\*\[4018\]

```text
MAWM prompts for a Cubby ID.
```

<a id="b04019"></a>
## b04019 — word/document\.xml/body/\*\[4019\]

```text
User scans the Cubby ID that wants to clear.
```

<a id="b04020"></a>
## b04020 — word/document\.xml/body/\*\[4020\]

```text
MAWM prompts for an oLPN ID.
```

<a id="b04021"></a>
## b04021 — word/document\.xml/body/\*\[4021\]

```text
User scans the blind cross-reference oLPN ID to move the cubby contents.
```

<a id="b04022"></a>
## b04022 — word/document\.xml/body/\*\[4022\]

```text
User performs a LE Hospital putaway to locate incomplete oLpn into the Hospital putwall. 
```

<a id="b04023"></a>
## b04023 — word/document\.xml/body/\*\[4023\]

```text

```

<a id="b04024"></a>
## b04024 — word/document\.xml/body/\*\[4024\]

```text
Updates
```

<a id="b04025"></a>
## b04025 — word/document\.xml/body/\*\[4025\]

```text

```

<a id="b04026"></a>
## b04026 — word/document\.xml/body/\*\[4026\]

```text
Cubby contents are moved to the oLPN which is next located to an Hospital cubby.
```

<a id="b04027"></a>
## b04027 — word/document\.xml/body/\*\[4027\]

```text
Cubby is cleared and is available for new outbound sort process
```

<a id="b04028"></a>
## b04028 — word/document\.xml/body/\*\[4028\]

```text
User Story: Hospital Runner Putaway (Outbound Putaway – User Directed)
```

<a id="b04029"></a>
## b04029 — word/document\.xml/body/\*\[4029\]

```text

```

<a id="b04030"></a>
## b04030 — word/document\.xml/body/\*\[4030\]

```text
Who	What	Why
Packing Associate	Locate shorted oLPN contents to exception putwall.	Shorted oLPNs are located to an exception putwall where chase allocations are brought and married to the original oLPNs to be packed.
```

<a id="b04031"></a>
## b04031 — word/document\.xml/body/\*\[4031\]

```text

```

<a id="b04032"></a>
## b04032 — word/document\.xml/body/\*\[4032\]

```text
Process
```

<a id="b04033"></a>
## b04033 — word/document\.xml/body/\*\[4033\]

```text

```

<a id="b04034"></a>
## b04034 — word/document\.xml/body/\*\[4034\]

```text
User enters WM Mobile and navigates to the “LE Hospital Runner OB Putaway”.
```

<a id="b04035"></a>
## b04035 — word/document\.xml/body/\*\[4035\]

```text
MAWM prompts for an Olpn ID.
```

<a id="b04036"></a>
## b04036 — word/document\.xml/body/\*\[4036\]

```text
User scans the cross-reference oLPN ID of the order with shorted contents. 
```

<a id="b04037"></a>
## b04037 — word/document\.xml/body/\*\[4037\]

```text
MAWM prompts for a Cubby ID (Location Barcode) in the Hospital area.
```

<a id="b04038"></a>
## b04038 — word/document\.xml/body/\*\[4038\]

```text
User scans an empty Cubby ID in the designated exception putwall area (A metal shelf beside the pack station)
```

<a id="b04039"></a>
## b04039 — word/document\.xml/body/\*\[4039\]

```text

```

<a id="b04040"></a>
## b04040 — word/document\.xml/body/\*\[4040\]

```text
Updates
```

<a id="b04041"></a>
## b04041 — word/document\.xml/body/\*\[4041\]

```text

```

<a id="b04042"></a>
## b04042 — word/document\.xml/body/\*\[4042\]

```text
oLPN contents are located to the exception putwall cubby.
```

<a id="b04043"></a>
## b04043 — word/document\.xml/body/\*\[4043\]

```text

```

<a id="b04044"></a>
## b04044 — word/document\.xml/body/\*\[4044\]

```text
User Story: Hospital Putwall Sort (Hospital Runner) 
```

<a id="b04045"></a>
## b04045 — word/document\.xml/body/\*\[4045\]

```text

```

<a id="b04046"></a>
## b04046 — word/document\.xml/body/\*\[4046\]

```text
Who	What	Why
Hospital Runners	Sort shorted oLPN contents to exception putwall per pack station	Shorted oLPNs are located to an exception putwall where chase allocations are brought and married to the original oLPNs to be packed.
```

<a id="b04047"></a>
## b04047 — word/document\.xml/body/\*\[4047\]

```text

```

<a id="b04048"></a>
## b04048 — word/document\.xml/body/\*\[4048\]

```text
Assumptions 
```

<a id="b04049"></a>
## b04049 — word/document\.xml/body/\*\[4049\]

```text

```

<a id="b04050"></a>
## b04050 — word/document\.xml/body/\*\[4050\]

```text
Exception putwalls are configured for each unit sorter vendor, such as Matthews Exception Putwall (Sorter-A & Sorter B), and Sorter-X Exception Putwall, where the associated cubbies are physically located beside each pack station.
```

<a id="b04051"></a>
## b04051 — word/document\.xml/body/\*\[4051\]

```text
Each exception putwall cubby is defined with a location ID prefix that identifies the corresponding pack station in the packing zone. 
```

<a id="b04052"></a>
## b04052 — word/document\.xml/body/\*\[4052\]

```text

```

<a id="b04053"></a>
## b04053 — word/document\.xml/body/\*\[4053\]

```text
Process
```

<a id="b04054"></a>
## b04054 — word/document\.xml/body/\*\[4054\]

```text
User navigates to the "LE Hospital Putwall Sort" menu option within WM Mobile.
```

<a id="b04055"></a>
## b04055 — word/document\.xml/body/\*\[4055\]

```text
MAWM prompts for a Putwall ID (Matthews Hospital Putwall ID or Sorter-X Hospital Putwall ID).
```

<a id="b04056"></a>
## b04056 — word/document\.xml/body/\*\[4056\]

```text
User scans the Putwall ID at the assigned to the pack station area.
```

<a id="b04057"></a>
## b04057 — word/document\.xml/body/\*\[4057\]

```text
MAWM prompts for a Tote ID.
```

<a id="b04058"></a>
## b04058 — word/document\.xml/body/\*\[4058\]

```text
MAWM prompts for Item Barcode scan.
```

<a id="b04059"></a>
## b04059 — word/document\.xml/body/\*\[4059\]

```text
Users scan the Pick Label (VAS Label Id) or Item Barcode and WM02 search the appropriate records based on the scanned barcode.
```

<a id="b04060"></a>
## b04060 — word/document\.xml/body/\*\[4060\]

```text
IF is an International Pack station then MAWM prompts for Country of Origin if required [WM02] 
```

<a id="b04061"></a>
## b04061 — word/document\.xml/body/\*\[4061\]

```text
User selects the Country of Origin from Item if required.
```

<a id="b04062"></a>
## b04062 — word/document\.xml/body/\*\[4062\]

```text
MAWM prompts user to scan cubby where Olpn with the shortages is located
```

<a id="b04063"></a>
## b04063 — word/document\.xml/body/\*\[4063\]

```text
User scans cubby barcode to confirm the inventory movement.
```

<a id="b04064"></a>
## b04064 — word/document\.xml/body/\*\[4064\]

```text
MAWM checks if the sorting process is completed for the Olpn, IF true THEN:
```

<a id="b04065"></a>
## b04065 — word/document\.xml/body/\*\[4065\]

```text
MAWM display “Clear Cubby” message.
```

<a id="b04066"></a>
## b04066 — word/document\.xml/body/\*\[4066\]

```text
User scan the cubby barcode to clear the message. [WM02].
```

<a id="b04067"></a>
## b04067 — word/document\.xml/body/\*\[4067\]

```text
User scans the blind cross-reference oLPN ID to validate and  move the cubby contents to oLPN to move it to a Hospital Pack Station.
```

<a id="b04068"></a>
## b04068 — word/document\.xml/body/\*\[4068\]

```text
ELSE, User repeats steps 6 to 10  for the remaining items in the tote/chute (scanned in step 5).
```

<a id="b04069"></a>
## b04069 — word/document\.xml/body/\*\[4069\]

```text
Updates
```

<a id="b04070"></a>
## b04070 — word/document\.xml/body/\*\[4070\]

```text
oLPN: Remains in picked status.
```

<a id="b04071"></a>
## b04071 — word/document\.xml/body/\*\[4071\]

```text


```

<a id="b04072"></a>
## b04072 — word/document\.xml/body/\*\[4072\]

```text
User Story: Re-print VAS Descriptor Label	
```

<a id="b04073"></a>
## b04073 — word/document\.xml/body/\*\[4073\]

```text
Who	What	Why
Pre-VAS Packing Associate	Re-print a VAS Descriptor label (Olpn Shipping Label)	Labels is damaged or missing.
```

<a id="b04074"></a>
## b04074 — word/document\.xml/body/\*\[4074\]

```text
Process
```

<a id="b04075"></a>
## b04075 — word/document\.xml/body/\*\[4075\]

```text
User navigates to “Olpn 2.0” UI.
```

<a id="b04076"></a>
## b04076 — word/document\.xml/body/\*\[4076\]

```text
User remove all defaults filters by clicking the  “Clear All” button from the Filters sidebar.
```

<a id="b04077"></a>
## b04077 — word/document\.xml/body/\*\[4077\]

```text
User type the Production Order ID as the “Cross Reference LPN” with an asterisk (*) at the end and presses "Enter.”  
```

<a id="b04078"></a>
## b04078 — word/document\.xml/body/\*\[4078\]

```text
MAWM searches for related OLPNs and limits the search results based on the entered values. If OLPNs are found, they are displayed. Otherwise, the message "No record found" is displayed.
```

<a id="b04079"></a>
## b04079 — word/document\.xml/body/\*\[4079\]

```text
IF oLPNs are found:
```

<a id="b04080"></a>
## b04080 — word/document\.xml/body/\*\[4080\]

```text
Users selects the oLPN that corresponds to the damaged label ID.
```

<a id="b04081"></a>
## b04081 — word/document\.xml/body/\*\[4081\]

```text
User clicks the “More” button and selects “Print oLPN”.
```

<a id="b04082"></a>
## b04082 — word/document\.xml/body/\*\[4082\]

```text
User selects “Shipping label” as the “Document Template Type”.
```

<a id="b04083"></a>
## b04083 — word/document\.xml/body/\*\[4083\]

```text
User selects “VAS Descriptor Label” as the “Document Template”.
```

<a id="b04084"></a>
## b04084 — word/document\.xml/body/\*\[4084\]

```text
User selects printer closest to them and clicks the “Submit” button.
```

<a id="b04085"></a>
## b04085 — word/document\.xml/body/\*\[4085\]

```text
ELSE, user repeats step 3-5 until they find the required oLPN to be printed.
```

<a id="b04086"></a>
## b04086 — word/document\.xml/body/\*\[4086\]

```text
Updates
```

<a id="b04087"></a>
## b04087 — word/document\.xml/body/\*\[4087\]

```text
VAS Descriptor label is printed.
```

<a id="b04088"></a>
## b04088 — word/document\.xml/body/\*\[4088\]

```text
MHE Messages
```

<a id="b04089"></a>
## b04089 — word/document\.xml/body/\*\[4089\]

```text
Reference to Lands' End's MHE Communications Document for detailed information on MHE touchpoints and message formats.
```

<a id="b04090"></a>
## b04090 — word/document\.xml/body/\*\[4090\]

```text
Features
```

<a id="b04091"></a>
## b04091 — word/document\.xml/body/\*\[4091\]

```text
None Identified
```

<a id="b04092"></a>
## b04092 — word/document\.xml/body/\*\[4092\]

```text
Key Interfaces
```

<a id="b04093"></a>
## b04093 — word/document\.xml/body/\*\[4093\]

```text
None Identified
```

<a id="b04094"></a>
## b04094 — word/document\.xml/body/\*\[4094\]

```text
Reports, Dashboards, Alerts
```

<a id="b04095"></a>
## b04095 — word/document\.xml/body/\*\[4095\]

```text
Name	Description	Frequency	User/Dept	Type
Orders with Shortages	Displays orders with open PSI records which require a chase wave to be run for allocation.	As needed	Wave planner	SCI Report
```

<a id="b04096"></a>
## b04096 — word/document\.xml/body/\*\[4096\]

```text

```

<a id="b04097"></a>
## b04097 — word/document\.xml/body/\*\[4097\]

```text
Gaps and Extensions
```

<a id="b04098"></a>
## b04098 — word/document\.xml/body/\*\[4098\]

```text
Gap #	Name	Description
WM02	Country of Origin Capture at Packing	Items on Orders with an international destination must capture the Country of Origin for each unit at the time of packing. 
This is required for both Outbound Sortation Packing and Pack Station UI
WM02	Display Special Instructions during Outbound Sort	During the Outbound Sort process, when a user is taken info the packing process, any Special Instructions (Order Instructions) required for the order must be displayed to the user. If there are multiple instructions, they are all displayed to the user. This includes inserts and catalogs.
WM02	VAS Requirements	This is an all-encompassing gap for the VAS special processes:
1. VAS Pick Label ID
2. Consume Tote Contents to Inventory
3. Cancel Order Line Qty on consumption
4. Retail Pick Label ID on inventory as attribute
5. Message to SAP/ EOM with Pick Label ID to Allocate by Pick Label ID
WM25	Pre VAS Packing and Descriptor Label Print - Mobile Transaction	Pack Pre VAS Items and generate print descriptor label.
```

<a id="b04099"></a>
## b04099 — word/document\.xml/body/\*\[4099\]

```text
Labor Management
```

<a id="b04100"></a>
## b04100 — word/document\.xml/body/\*\[4100\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b04101"></a>
## b04101 — word/document\.xml/body/\*\[4101\]

```text
Outbound Putaway
```

<a id="b04102"></a>
## b04102 — word/document\.xml/body/\*\[4102\]

```text
The outbound putaway is the process of moving any outbound containers into a packing location after picking them up or to a consolidated location after packing. It is supported in both tasking and non-tasking (stand-alone) mode. After the users pick the allocated items into a tote/iLPN/oLPN, if they need to be directed to a pack location to place the picked container, then Outbound Putaway is used to do this. Similarly, once the oLPN is packed, if the user needs to be directed to the consolidated location to place the packed oLPN, outbound putaway transaction is used to achieve this as well.
```

<a id="b04103"></a>
## b04103 — word/document\.xml/body/\*\[4103\]

```text
Assumptions
```

<a id="b04104"></a>
## b04104 — word/document\.xml/body/\*\[4104\]

```text
Store Pack Location Determination is used during wave only for Store Orders and Replen Store Orders
```

<a id="b04105"></a>
## b04105 — word/document\.xml/body/\*\[4105\]

```text
Order Type, Order Fulfillment Code, Order Enterprise Code, and Order Destination Facility (Production Plan) are the minimum order attributes used to drive Outbound Putaway for Production Orders.
```

<a id="b04106"></a>
## b04106 — word/document\.xml/body/\*\[4106\]

```text
Customer Orders are putaway to a staging location (other pack locations) based on packing requirements (e.g. MHE Induction location, Single Pack Station location, etc.).
```

<a id="b04107"></a>
## b04107 — word/document\.xml/body/\*\[4107\]

```text
Pick Task Creation groups picking tasks at least by order type, enterprise code, and fulfillment code. Please refer to the task creation strategy and criteria for additional details. 
```

<a id="b04108"></a>
## b04108 — word/document\.xml/body/\*\[4108\]

```text
Pre-VAS Putaway Strategy
```

<a id="b04109"></a>
## b04109 — word/document\.xml/body/\*\[4109\]

```text
The "Pre-VAS Putaway Strategy" defines the outbound putaway criteria used to guide the picker or "Pre-VAS" associated to the appropriate packing location based on business rules associated with the "Pack Location Determination Strategy.
```

<a id="b04110"></a>
## b04110 — word/document\.xml/body/\*\[4110\]

```text
Stevens Point Putaway Flow
```

<a id="b04111"></a>
## b04111 — word/document\.xml/body/\*\[4111\]

```text
The following table provides a macro overview of the outbound putaway flow based on the fulfillment code of the Stevens Point production orders.
```

<a id="b04112"></a>
## b04112 — word/document\.xml/body/\*\[4112\]

```text
Heat Transfer Production Orders
```

<a id="b04113"></a>
## b04113 — word/document\.xml/body/\*\[4113\]

```text
FC	Outbound Putaway Flow
S	Pick Complete > Ship Dock > Load Truck> Rec Dock > Pre-VAS Putwall > Pre-VAS Opening Station
M	Pick Complete > Ship Dock > Load Truck> Rec Dock > HM Sorter > MHE Induction > Pre-VAS Putwall > Pre-VAS Opening Station
L	Pick Complete > Ship Dock > Load Truck>  Rec Dock > Pre-VAS Putwall > Pre-VAS Opening Station
```

<a id="b04114"></a>
## b04114 — word/document\.xml/body/\*\[4114\]

```text
Note: FC = Order.Extended.FulfillmentCode 
```

<a id="b04115"></a>
## b04115 — word/document\.xml/body/\*\[4115\]

```text
Non Heat Transfer Production Orders
```

<a id="b04116"></a>
## b04116 — word/document\.xml/body/\*\[4116\]

```text
FC	Outbound Putaway Flow
S	Pick Complete > Ship Dock > Load Truck> Rec Dock > Pre-VAS Opening Station
M	Pick Complete > Ship Dock > Load Truck>  Rec Dock > HM Sorter > MHE Induction > Pre-VAS Putwall > Pre-VAS Opening Station
L	Pick Complete > Ship Dock > Load Truck> Rec Dock > Pre-VAS Opening Station
```

<a id="b04117"></a>
## b04117 — word/document\.xml/body/\*\[4117\]

```text
Note: FC = Order.Extended.FulfillmentCode 
```

<a id="b04118"></a>
## b04118 — word/document\.xml/body/\*\[4118\]

```text
Dodgeville Putaway Flow
```

<a id="b04119"></a>
## b04119 — word/document\.xml/body/\*\[4119\]

```text
The following table provides a macro overview of the outbound putaway flow based on the fulfillment code of the Dodgeville production orders.
```

<a id="b04120"></a>
## b04120 — word/document\.xml/body/\*\[4120\]

```text
Dodgeville Production Orders
```

<a id="b04121"></a>
## b04121 — word/document\.xml/body/\*\[4121\]

```text
FC	Outbound Putaway Flow
S	Pick Complete > Pre-VAS Opening Station
M	Pick Complete > HM Sorter > MHE Induction > Pre-VAS Putwall > Pre-VAS Opening Station
L	Pick Complete > Pre-VAS Opening Station
```

<a id="b04122"></a>
## b04122 — word/document\.xml/body/\*\[4122\]

```text
Note: FC = Order.Extended.FulfillmentCode
```

<a id="b04123"></a>
## b04123 — word/document\.xml/body/\*\[4123\]

```text
Stevens Point Shipping Dock Putaway Criteria (Tasking)
```

<a id="b04124"></a>
## b04124 — word/document\.xml/body/\*\[4124\]

```text
The Stevens Point Pre-VAS Outbound Putaway is triggered after pick completion from either the “SP Case Pick” , “HM07 Case Pick” or “SP Act Pick” , “HM07 Act Pick” transactions.
```

<a id="b04125"></a>
## b04125 — word/document\.xml/body/\*\[4125\]

```text
Putaway Flow 
```

<a id="b04126"></a>
## b04126 — word/document\.xml/body/\*\[4126\]

```text
Pick Complete à Stevens Shipping Dock
```

<a id="b04127"></a>
## b04127 — word/document\.xml/body/\*\[4127\]

```text
Outbound Putaway Criteria
```

<a id="b04128"></a>
## b04128 — word/document\.xml/body/\*\[4128\]

```text
Criteria Name:  Stevens Point Shipping Dock Putaway
```

<a id="b04129"></a>
## b04129 — word/document\.xml/body/\*\[4129\]

```text
Transaction Id: SP Ship Dock
```

<a id="b04130"></a>
## b04130 — word/document\.xml/body/\*\[4130\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04131"></a>
## b04131 — word/document\.xml/body/\*\[4131\]

```text
Pack Location Determination Strategy: Stevens Point Staging Determination (Other Pack Locations)
```

<a id="b04132"></a>
## b04132 — word/document\.xml/body/\*\[4132\]

```text
Task Creation Strategy : Stevens Point Shipping Dock Putaway
```

<a id="b04133"></a>
## b04133 — word/document\.xml/body/\*\[4133\]

```text


```

<a id="b04134"></a>
## b04134 — word/document\.xml/body/\*\[4134\]

```text
Stevens Point Load Trailer (WM Mobile)
```

<a id="b04135"></a>
## b04135 — word/document\.xml/body/\*\[4135\]

```text
The Stevens Point Load Trailer Outbound Putaway transaction, accessed from the WM Mobile menu, moves picked inventory to a trailer location for tracking "In-Transit" inventory.
```

<a id="b04136"></a>
## b04136 — word/document\.xml/body/\*\[4136\]

```text
Putaway Flow 
```

<a id="b04137"></a>
## b04137 — word/document\.xml/body/\*\[4137\]

```text
Stevens Shipping Dock àStevens points “In-Transit location” 
```

<a id="b04138"></a>
## b04138 — word/document\.xml/body/\*\[4138\]

```text
Outbound Putaway Criteria
```

<a id="b04139"></a>
## b04139 — word/document\.xml/body/\*\[4139\]

```text
Criteria Name: SP Load Trailer 
```

<a id="b04140"></a>
## b04140 — word/document\.xml/body/\*\[4140\]

```text
Transaction Id: SP Load Trailer
```

<a id="b04141"></a>
## b04141 — word/document\.xml/body/\*\[4141\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04142"></a>
## b04142 — word/document\.xml/body/\*\[4142\]

```text
Pack Location Determination Strategy: Stevens Point Truck Location (Other Pack Locations)
```

<a id="b04143"></a>
## b04143 — word/document\.xml/body/\*\[4143\]

```text
Task Creation Strategy : SP Load Trailer
```

<a id="b04144"></a>
## b04144 — word/document\.xml/body/\*\[4144\]

```text
Assumptions 
```

<a id="b04145"></a>
## b04145 — word/document\.xml/body/\*\[4145\]

```text
SOP is followed to determine the Pallets and gurneys that needs to be loaded to the truck using “SP Load Trailer.
```

<a id="b04146"></a>
## b04146 — word/document\.xml/body/\*\[4146\]

```text

```

<a id="b04147"></a>
## b04147 — word/document\.xml/body/\*\[4147\]

```text
Process
```

<a id="b04148"></a>
## b04148 — word/document\.xml/body/\*\[4148\]

```text
User The user navigates to "SP Load Trailer”
```

<a id="b04149"></a>
## b04149 — word/document\.xml/body/\*\[4149\]

```text
WM prompts the user to scan an outbound container, gurney, or pallet.
```

<a id="b04150"></a>
## b04150 — word/document\.xml/body/\*\[4150\]

```text
WM executes the Outbound Putaway Strategy and Criteria to determine the available truck location.
```

<a id="b04151"></a>
## b04151 — word/document\.xml/body/\*\[4151\]

```text
WM prompts for a "Truck Location" (Other Pack Location) 
```

<a id="b04152"></a>
## b04152 — word/document\.xml/body/\*\[4152\]

```text
The user scans location barcode.
```

<a id="b04153"></a>
## b04153 — word/document\.xml/body/\*\[4153\]

```text
The user repeats steps 2–5 until all required pallets and gurneys are moved to the truck.
```

<a id="b04154"></a>
## b04154 — word/document\.xml/body/\*\[4154\]

```text
The user prints two copies of the Stevens Point manifest report [SCI Report] for the truck driver’s acknowledgment.
```

<a id="b04155"></a>
## b04155 — word/document\.xml/body/\*\[4155\]

```text

```

<a id="b04156"></a>
## b04156 — word/document\.xml/body/\*\[4156\]

```text
Updates
```

<a id="b04157"></a>
## b04157 — word/document\.xml/body/\*\[4157\]

```text
Inventory is moved to an “In-Transit” truck location.
```

<a id="b04158"></a>
## b04158 — word/document\.xml/body/\*\[4158\]

```text
PIX is sent to SAP to notify the inventory is moved from  Dodgeville to an “In- transit inventory bucket” to “SP”. [GAPD31]
```

<a id="b04159"></a>
## b04159 — word/document\.xml/body/\*\[4159\]

```text

```

<a id="b04160"></a>
## b04160 — word/document\.xml/body/\*\[4160\]

```text
Note: A PIX transaction needs to be generated from MAWM to SAP to move inventory from the Dodgeville facility to the Stevens Point inventory bucket in SAP [GAPD31]. The base solution will require manually applying the Condition Code to the LPNs from the LPN UI after OB putaway completion. 
```

<a id="b04161"></a>
## b04161 — word/document\.xml/body/\*\[4161\]

```text


```

<a id="b04162"></a>
## b04162 — word/document\.xml/body/\*\[4162\]

```text
Stevens Point Unload Trailer (WM Mobile)
```

<a id="b04163"></a>
## b04163 — word/document\.xml/body/\*\[4163\]

```text
The Stevens Point Unload Truck Outbound Putaway transaction, accessed from the WM Mobile menu, moves "In-Transit" inventory to a Stevens Point pack location serving as a "Receiving Staging" area for production orders.
```

<a id="b04164"></a>
## b04164 — word/document\.xml/body/\*\[4164\]

```text
Putaway Flow 
```

<a id="b04165"></a>
## b04165 — word/document\.xml/body/\*\[4165\]

```text
Stevens points “In-Transit location” à Stevens Point Receiving Dock Location 
```

<a id="b04166"></a>
## b04166 — word/document\.xml/body/\*\[4166\]

```text
Outbound Putaway Criteria
```

<a id="b04167"></a>
## b04167 — word/document\.xml/body/\*\[4167\]

```text
Criteria Name: SP Unload Trailer 
```

<a id="b04168"></a>
## b04168 — word/document\.xml/body/\*\[4168\]

```text
Transaction Id: SP Unload Trailer
```

<a id="b04169"></a>
## b04169 — word/document\.xml/body/\*\[4169\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04170"></a>
## b04170 — word/document\.xml/body/\*\[4170\]

```text
Pack Location Determination Strategy: Stevens Point Receiving Location (Other Pack Locations)
```

<a id="b04171"></a>
## b04171 — word/document\.xml/body/\*\[4171\]

```text
Task Creation Strategy : SP Unload Trailer
```

<a id="b04172"></a>
## b04172 — word/document\.xml/body/\*\[4172\]

```text
Note: Stevens Point Receiving Location Strategy, is configured with one catch all criteria  
```

<a id="b04173"></a>
## b04173 — word/document\.xml/body/\*\[4173\]

```text
Process
```

<a id="b04174"></a>
## b04174 — word/document\.xml/body/\*\[4174\]

```text
User The user navigates to "SP Unload Trailer”
```

<a id="b04175"></a>
## b04175 — word/document\.xml/body/\*\[4175\]

```text
WM prompts the user to scan a container, gurney, or pallet.
```

<a id="b04176"></a>
## b04176 — word/document\.xml/body/\*\[4176\]

```text
User scan a gurney or pallet id to be unloaded.
```

<a id="b04177"></a>
## b04177 — word/document\.xml/body/\*\[4177\]

```text
WM executes the Outbound Putaway Strategy and Criteria to determine the next location.
```

<a id="b04178"></a>
## b04178 — word/document\.xml/body/\*\[4178\]

```text
WM prompts for a "Stevens Point – Receiving Dock Locations” (Other Pack Location)
```

<a id="b04179"></a>
## b04179 — word/document\.xml/body/\*\[4179\]

```text
The user scans a location barcode to complete the putaway process.
```

<a id="b04180"></a>
## b04180 — word/document\.xml/body/\*\[4180\]

```text
The user repeats steps 2–6 until all required pallets and gurneys are unloaded from the truck.
```

<a id="b04181"></a>
## b04181 — word/document\.xml/body/\*\[4181\]

```text

```

<a id="b04182"></a>
## b04182 — word/document\.xml/body/\*\[4182\]

```text
Updates
```

<a id="b04183"></a>
## b04183 — word/document\.xml/body/\*\[4183\]

```text

```

<a id="b04184"></a>
## b04184 — word/document\.xml/body/\*\[4184\]

```text
Inventory is moved from the “In-Transit” truck location to a receiving dock location located at Steves Point.
```

<a id="b04185"></a>
## b04185 — word/document\.xml/body/\*\[4185\]

```text
PIX is sent to SAP to notify the inventory is moved from “in transit inventory bucket” to “SP” stock bucket.[GAPD31]
```

<a id="b04186"></a>
## b04186 — word/document\.xml/body/\*\[4186\]

```text


```

<a id="b04187"></a>
## b04187 — word/document\.xml/body/\*\[4187\]

```text
Heat Transfer Logo Outbound Putaway (Tasking)
```

<a id="b04188"></a>
## b04188 — word/document\.xml/body/\*\[4188\]

```text
The Heat Transfer Logo Outbound Putaway is triggered after pick completion from "HT Logo Pick" picking transaction.
```

<a id="b04189"></a>
## b04189 — word/document\.xml/body/\*\[4189\]

```text
Putaway Flow 
```

<a id="b04190"></a>
## b04190 — word/document\.xml/body/\*\[4190\]

```text
Pick complete à  HT Putwall Staging 
```

<a id="b04191"></a>
## b04191 — word/document\.xml/body/\*\[4191\]

```text
Outbound Putaway Criteria
```

<a id="b04192"></a>
## b04192 — word/document\.xml/body/\*\[4192\]

```text
Criteria Name: Heat Transfer Putwall Staging
```

<a id="b04193"></a>
## b04193 — word/document\.xml/body/\*\[4193\]

```text
Transaction Id: HT Putwall Staging
```

<a id="b04194"></a>
## b04194 — word/document\.xml/body/\*\[4194\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04195"></a>
## b04195 — word/document\.xml/body/\*\[4195\]

```text
Pack Location Determination Strategy: Heat Transfer Staging Determination (Other Pack Locations)
```

<a id="b04196"></a>
## b04196 — word/document\.xml/body/\*\[4196\]

```text
Task Creation Strategy : HT Putwall Staging 
```

<a id="b04197"></a>
## b04197 — word/document\.xml/body/\*\[4197\]

```text

```

<a id="b04198"></a>
## b04198 — word/document\.xml/body/\*\[4198\]

```text
HM06 Outbound Putaway (Tasking)
```

<a id="b04199"></a>
## b04199 — word/document\.xml/body/\*\[4199\]

```text
The HM06 Outbound Putaway is triggered after pick completion from  either the “HM06 Case Pick” or “HM06 Act Pick”  pick transactions.
```

<a id="b04200"></a>
## b04200 — word/document\.xml/body/\*\[4200\]

```text
Putaway Flow 
```

<a id="b04201"></a>
## b04201 — word/document\.xml/body/\*\[4201\]

```text
Pick Complete à HM06 Staging 
```

<a id="b04202"></a>
## b04202 — word/document\.xml/body/\*\[4202\]

```text
Outbound Putaway Criteria
```

<a id="b04203"></a>
## b04203 — word/document\.xml/body/\*\[4203\]

```text
Criteria Name: HM06 Staging Putaway
```

<a id="b04204"></a>
## b04204 — word/document\.xml/body/\*\[4204\]

```text
Transaction Id: HM06 Putaway
```

<a id="b04205"></a>
## b04205 — word/document\.xml/body/\*\[4205\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04206"></a>
## b04206 — word/document\.xml/body/\*\[4206\]

```text
Pack Location Determination Strategy: HM06 Staging Zone (Other Pack Locations)
```

<a id="b04207"></a>
## b04207 — word/document\.xml/body/\*\[4207\]

```text
Task Creation Strategy : HM06 Staging Putaway
```

<a id="b04208"></a>
## b04208 — word/document\.xml/body/\*\[4208\]

```text

```

<a id="b04209"></a>
## b04209 — word/document\.xml/body/\*\[4209\]

```text


```

<a id="b04210"></a>
## b04210 — word/document\.xml/body/\*\[4210\]

```text
Pre-VAS Opening Station Putaway (Tasking) 
```

<a id="b04211"></a>
## b04211 — word/document\.xml/body/\*\[4211\]

```text
The Pre-VAS opening station putaway is triggered after pick completion from either the VAS LPN Pull or VAS Ack Pick or HEM VAS Act Pick , HEM VAS Act Pick , Name Bdg Pick transactions.
```

<a id="b04212"></a>
## b04212 — word/document\.xml/body/\*\[4212\]

```text
Putaway Flow 
```

<a id="b04213"></a>
## b04213 — word/document\.xml/body/\*\[4213\]

```text
Pick Complete à Pre-VAS Opening Station
```

<a id="b04214"></a>
## b04214 — word/document\.xml/body/\*\[4214\]

```text
Outbound Putaway Criteria
```

<a id="b04215"></a>
## b04215 — word/document\.xml/body/\*\[4215\]

```text
Criteria Name: Pre-VAS Opening Station Putaway
```

<a id="b04216"></a>
## b04216 — word/document\.xml/body/\*\[4216\]

```text
Transaction Id: Pre-VAS OST
```

<a id="b04217"></a>
## b04217 — word/document\.xml/body/\*\[4217\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04218"></a>
## b04218 — word/document\.xml/body/\*\[4218\]

```text
Pack Location Determination Strategy: Pre-VAS Opening Station Zone (Other Pack Locations)
```

<a id="b04219"></a>
## b04219 — word/document\.xml/body/\*\[4219\]

```text
Task Creation Strategy : Pre-VAS Opening Station Putaway
```

<a id="b04220"></a>
## b04220 — word/document\.xml/body/\*\[4220\]

```text
Pre-VAS Putaway (WM Mobile)
```

<a id="b04221"></a>
## b04221 — word/document\.xml/body/\*\[4221\]

```text
The Pre-VAS Putaway criteria, accessed from the WM Mobile menu, move staged inventory to the next packing location based on the configured Pack Location Determination Strategy rules.
```

<a id="b04222"></a>
## b04222 — word/document\.xml/body/\*\[4222\]

```text
Putaway Flow 
```

<a id="b04223"></a>
## b04223 — word/document\.xml/body/\*\[4223\]

```text
Pack Location à  Next Pack Location
```

<a id="b04224"></a>
## b04224 — word/document\.xml/body/\*\[4224\]

```text
Outbound Putaway Criteria
```

<a id="b04225"></a>
## b04225 — word/document\.xml/body/\*\[4225\]

```text
Criteria Name: Pre-VAS Putaway
```

<a id="b04226"></a>
## b04226 — word/document\.xml/body/\*\[4226\]

```text
Transaction Id: Pre-VAS OB Putaway
```

<a id="b04227"></a>
## b04227 — word/document\.xml/body/\*\[4227\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04228"></a>
## b04228 — word/document\.xml/body/\*\[4228\]

```text
Pack Location Determination Strategy: Pre-VAS Pack Location (Other Pack Locations)
```

<a id="b04229"></a>
## b04229 — word/document\.xml/body/\*\[4229\]

```text
Task Creation Strategy : Pre-VAS Putaway
```

<a id="b04230"></a>
## b04230 — word/document\.xml/body/\*\[4230\]

```text

```

<a id="b04231"></a>
## b04231 — word/document\.xml/body/\*\[4231\]

```text


```

<a id="b04232"></a>
## b04232 — word/document\.xml/body/\*\[4232\]

```text
MHE Induction Putaway Strategy
```

<a id="b04233"></a>
## b04233 — word/document\.xml/body/\*\[4233\]

```text
Sorter A, Sorter B and Sorter X MHE Induction Putaway (Tasking)
```

<a id="b04234"></a>
## b04234 — word/document\.xml/body/\*\[4234\]

```text
The “Sorter A, Sorter B and Sorter X MHE Induction” putaway  is triggered after pick completion from either the “MHE LPN Pull” or “MHE Bulk Pick” transactions, for Sorter A, Sorter B, and Sorter X, based on the corresponding induction pick transaction associated with each induction point or manually from “MHE Induction”  WM mobile menu transaction.
```

<a id="b04235"></a>
## b04235 — word/document\.xml/body/\*\[4235\]

```text
Putaway Flow 
```

<a id="b04236"></a>
## b04236 — word/document\.xml/body/\*\[4236\]

```text
Pick Complete à Order Filling Belt à MHE Induction Putaway
```

<a id="b04237"></a>
## b04237 — word/document\.xml/body/\*\[4237\]

```text
Manually from MHE Induction menu Item.
```

<a id="b04238"></a>
## b04238 — word/document\.xml/body/\*\[4238\]

```text
Outbound Putaway Criteria
```

<a id="b04239"></a>
## b04239 — word/document\.xml/body/\*\[4239\]

```text
Criteria Name: AU03MHEInduction
```

<a id="b04240"></a>
## b04240 — word/document\.xml/body/\*\[4240\]

```text
Transaction Id: “MHE Induction”
```

<a id="b04241"></a>
## b04241 — word/document\.xml/body/\*\[4241\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04242"></a>
## b04242 — word/document\.xml/body/\*\[4242\]

```text
Pack Location Determination Strategy: “Unit Sorter Induction Zone” (Other Pack Locations)
```

<a id="b04243"></a>
## b04243 — word/document\.xml/body/\*\[4243\]

```text
Task Creation Strategy : “MHE Induction Putaway”
```

<a id="b04244"></a>
## b04244 — word/document\.xml/body/\*\[4244\]

```text
Task Creation Strategy from Drop Location : No required
```

<a id="b04245"></a>
## b04245 — word/document\.xml/body/\*\[4245\]

```text
HM Sorter Induction Putaway (WM Mobile)
```

<a id="b04246"></a>
## b04246 — word/document\.xml/body/\*\[4246\]

```text
The “HM Sorter Induction” putaway  is triggered manually from  “HM Sorter Induction”  WM mobile menu transaction when the product is ready for induction.
```

<a id="b04247"></a>
## b04247 — word/document\.xml/body/\*\[4247\]

```text
Putaway Flow 
```

<a id="b04248"></a>
## b04248 — word/document\.xml/body/\*\[4248\]

```text
Manually from MHE Induction menu Item.
```

<a id="b04249"></a>
## b04249 — word/document\.xml/body/\*\[4249\]

```text
Outbound Putaway Criteria
```

<a id="b04250"></a>
## b04250 — word/document\.xml/body/\*\[4250\]

```text
Criteria Name: AU03MheInductionAndPickShortConfirmation
```

<a id="b04251"></a>
## b04251 — word/document\.xml/body/\*\[4251\]

```text
Transaction Id: “HM Sorter Induction”
```

<a id="b04252"></a>
## b04252 — word/document\.xml/body/\*\[4252\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04253"></a>
## b04253 — word/document\.xml/body/\*\[4253\]

```text
Pack Location Determination Strategy: “Unit Sorter Induction Zone” (Other Pack Locations)
```

<a id="b04254"></a>
## b04254 — word/document\.xml/body/\*\[4254\]

```text
Task Creation Strategy : “HM Sorter Induction Putaway”
```

<a id="b04255"></a>
## b04255 — word/document\.xml/body/\*\[4255\]

```text
Task Creation Strategy from Drop Location : No required
```

<a id="b04256"></a>
## b04256 — word/document\.xml/body/\*\[4256\]

```text


```

<a id="b04257"></a>
## b04257 — word/document\.xml/body/\*\[4257\]

```text
LE Outbound Putaway Strategy
```

<a id="b04258"></a>
## b04258 — word/document\.xml/body/\*\[4258\]

```text
The "LE Outbound Putaway Strategy" defines the outbound putaway criteria used to guide the picker or floor associate to the appropriate packing location based on business rules associated with the "Pack Location Determination Strategy of each defined outbound putaway criteria.
```

<a id="b04259"></a>
## b04259 — word/document\.xml/body/\*\[4259\]

```text
Singles Pulls Putaway (Tasking) 
```

<a id="b04260"></a>
## b04260 — word/document\.xml/body/\*\[4260\]

```text
The Singles Pulls putaway is triggered after pick completion from either the “Singles Pulls” or “Single Act Pick” transactions.
```

<a id="b04261"></a>
## b04261 — word/document\.xml/body/\*\[4261\]

```text
Putaway Flow 
```

<a id="b04262"></a>
## b04262 — word/document\.xml/body/\*\[4262\]

```text
Pick Complete à Singles Pack Station Zone
```

<a id="b04263"></a>
## b04263 — word/document\.xml/body/\*\[4263\]

```text
Outbound Putaway Criteria
```

<a id="b04264"></a>
## b04264 — word/document\.xml/body/\*\[4264\]

```text
Criteria Name: Singles Putaway
```

<a id="b04265"></a>
## b04265 — word/document\.xml/body/\*\[4265\]

```text
Transaction Id: Singles Putaway
```

<a id="b04266"></a>
## b04266 — word/document\.xml/body/\*\[4266\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04267"></a>
## b04267 — word/document\.xml/body/\*\[4267\]

```text
Pack Location Determination Strategy: Singles Pack Station Zone (Other Pack Locations)
```

<a id="b04268"></a>
## b04268 — word/document\.xml/body/\*\[4268\]

```text
Task Creation Strategy : Singles Putaway
```

<a id="b04269"></a>
## b04269 — word/document\.xml/body/\*\[4269\]

```text

```

<a id="b04270"></a>
## b04270 — word/document\.xml/body/\*\[4270\]

```text
Put to Store Putaway (Tasking) 
```

<a id="b04271"></a>
## b04271 — word/document\.xml/body/\*\[4271\]

```text
The Put to Store putaway is triggered after pick completion from either the “Store Pulls” or “Store Act Pick” transactions.
```

<a id="b04272"></a>
## b04272 — word/document\.xml/body/\*\[4272\]

```text
Putaway Flow 
```

<a id="b04273"></a>
## b04273 — word/document\.xml/body/\*\[4273\]

```text
Pick Complete à Store Packing Zone
```

<a id="b04274"></a>
## b04274 — word/document\.xml/body/\*\[4274\]

```text
Outbound Putaway Criteria
```

<a id="b04275"></a>
## b04275 — word/document\.xml/body/\*\[4275\]

```text
Criteria Name: Put to Store Putaway
```

<a id="b04276"></a>
## b04276 — word/document\.xml/body/\*\[4276\]

```text
Transaction Id: Put to Store Putaway
```

<a id="b04277"></a>
## b04277 — word/document\.xml/body/\*\[4277\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04278"></a>
## b04278 — word/document\.xml/body/\*\[4278\]

```text
Pack Location Determination Strategy: Put to Store Zone (Store Pack)
```

<a id="b04279"></a>
## b04279 — word/document\.xml/body/\*\[4279\]

```text
Task Creation Strategy : Put to Store Putaway
```

<a id="b04280"></a>
## b04280 — word/document\.xml/body/\*\[4280\]

```text

```

<a id="b04281"></a>
## b04281 — word/document\.xml/body/\*\[4281\]

```text


```

<a id="b04282"></a>
## b04282 — word/document\.xml/body/\*\[4282\]

```text
Workstation Putaway (Tasking) 
```

<a id="b04283"></a>
## b04283 — word/document\.xml/body/\*\[4283\]

```text
The Workstation putaway is triggered after pick completion from either the “Prepack Pulls” or “Prepack Act Pick” transactions.
```

<a id="b04284"></a>
## b04284 — word/document\.xml/body/\*\[4284\]

```text
Putaway Flow 
```

<a id="b04285"></a>
## b04285 — word/document\.xml/body/\*\[4285\]

```text
Pick Complete à Workstation
```

<a id="b04286"></a>
## b04286 — word/document\.xml/body/\*\[4286\]

```text
Outbound Putaway Criteria
```

<a id="b04287"></a>
## b04287 — word/document\.xml/body/\*\[4287\]

```text
Criteria Name: Workstation Putaway
```

<a id="b04288"></a>
## b04288 — word/document\.xml/body/\*\[4288\]

```text
Transaction Id: Workstation Putaway
```

<a id="b04289"></a>
## b04289 — word/document\.xml/body/\*\[4289\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04290"></a>
## b04290 — word/document\.xml/body/\*\[4290\]

```text
Pack Location Determination Strategy: Put to Store Zone (Workstation for Assembly and Disassembly)
```

<a id="b04291"></a>
## b04291 — word/document\.xml/body/\*\[4291\]

```text
Task Creation Strategy : Workstation Putaway
```

<a id="b04292"></a>
## b04292 — word/document\.xml/body/\*\[4292\]

```text
Staging Putaway (Tasking) 
```

<a id="b04293"></a>
## b04293 — word/document\.xml/body/\*\[4293\]

```text
The Staging putaway is triggered after pick completion from either the “Olpn to Pallet” or “Olpn Pick” transactions.
```

<a id="b04294"></a>
## b04294 — word/document\.xml/body/\*\[4294\]

```text
Putaway Flow 
```

<a id="b04295"></a>
## b04295 — word/document\.xml/body/\*\[4295\]

```text
Pick/Pack Complete à Staging Location
```

<a id="b04296"></a>
## b04296 — word/document\.xml/body/\*\[4296\]

```text
Outbound Putaway Criteria
```

<a id="b04297"></a>
## b04297 — word/document\.xml/body/\*\[4297\]

```text
Criteria Name: Staging Putaway
```

<a id="b04298"></a>
## b04298 — word/document\.xml/body/\*\[4298\]

```text
Transaction Id: OB Staging
```

<a id="b04299"></a>
## b04299 — word/document\.xml/body/\*\[4299\]

```text
What should be the Destination Location Determination Mode? System-determined
```

<a id="b04300"></a>
## b04300 — word/document\.xml/body/\*\[4300\]

```text
What should be the Consolidation Location Determination Strategy? “Staging Consolidation Criteria”
```

<a id="b04301"></a>
## b04301 — word/document\.xml/body/\*\[4301\]

```text
Task Creation Strategy : Staging Putaway
```

<a id="b04302"></a>
## b04302 — word/document\.xml/body/\*\[4302\]

```text

```

<a id="b04303"></a>
## b04303 — word/document\.xml/body/\*\[4303\]

```text


```

<a id="b04304"></a>
## b04304 — word/document\.xml/body/\*\[4304\]

```text
Anchor Olpn (WM Mobile) 
```

<a id="b04305"></a>
## b04305 — word/document\.xml/body/\*\[4305\]

```text
The Anchor Olpn “Follow the Leader” putaway transaction, accessed from the WM Mobile menu, moves packed inventory to a staging location, where it is consolidated either by “Shipment ID” when the order is part of a planned shipment, or by “Order ID” after packing is completed at the store pack location or when an Olpn is diverted by Matthews into an LTL/TL shipping lane.
```

<a id="b04306"></a>
## b04306 — word/document\.xml/body/\*\[4306\]

```text
Putaway Flow 
```

<a id="b04307"></a>
## b04307 — word/document\.xml/body/\*\[4307\]

```text
Pack Complete à Staging Location
```

<a id="b04308"></a>
## b04308 — word/document\.xml/body/\*\[4308\]

```text
Outbound Putaway Criteria
```

<a id="b04309"></a>
## b04309 — word/document\.xml/body/\*\[4309\]

```text
Criteria Name: Staging Putaway
```

<a id="b04310"></a>
## b04310 — word/document\.xml/body/\*\[4310\]

```text
Transaction Id: Anchor Olpn
```

<a id="b04311"></a>
## b04311 — word/document\.xml/body/\*\[4311\]

```text
What should be the Destination Location Determination Mode? User-directed
```

<a id="b04312"></a>
## b04312 — word/document\.xml/body/\*\[4312\]

```text
What should be the Consolidation Location Determination Strategy? “Staging Consolidation Criteria”
```

<a id="b04313"></a>
## b04313 — word/document\.xml/body/\*\[4313\]

```text
Task Creation Strategy : Anchor Olpn
```

<a id="b04314"></a>
## b04314 — word/document\.xml/body/\*\[4314\]

```text
Process
```

<a id="b04315"></a>
## b04315 — word/document\.xml/body/\*\[4315\]

```text
User The user navigates to "Anchor Olpn” menu option in WM mobile.
```

<a id="b04316"></a>
## b04316 — word/document\.xml/body/\*\[4316\]

```text
WM prompts the user to scan an outbound container.
```

<a id="b04317"></a>
## b04317 — word/document\.xml/body/\*\[4317\]

```text
WM executes the Outbound Putaway Strategy and Criteria to determine the Order consolidation location.
```

<a id="b04318"></a>
## b04318 — word/document\.xml/body/\*\[4318\]

```text
WM prompts for a "Staging Location”
```

<a id="b04319"></a>
## b04319 — word/document\.xml/body/\*\[4319\]

```text
IF previous pallet is present, MAWM will prompt it to scan the pallet id
```

<a id="b04320"></a>
## b04320 — word/document\.xml/body/\*\[4320\]

```text
ELSE user opens a new pallet by scanning a pallet id from a blind label.
```

<a id="b04321"></a>
## b04321 — word/document\.xml/body/\*\[4321\]

```text
The user repeats steps 2–5 until all required Olpns are consolidated in a pallet.
```

<a id="b04322"></a>
## b04322 — word/document\.xml/body/\*\[4322\]

```text

```

<a id="b04323"></a>
## b04323 — word/document\.xml/body/\*\[4323\]

```text
Updates
```

<a id="b04324"></a>
## b04324 — word/document\.xml/body/\*\[4324\]

```text

```

<a id="b04325"></a>
## b04325 — word/document\.xml/body/\*\[4325\]

```text
Shipping containers are nested into a parent Lpn ID (gurney or pallet).
```

<a id="b04326"></a>
## b04326 — word/document\.xml/body/\*\[4326\]

```text
Current location of the shipping container and pallet is updated with the scanned location ID.
```

<a id="b04327"></a>
## b04327 — word/document\.xml/body/\*\[4327\]

```text

```

<a id="b04328"></a>
## b04328 — word/document\.xml/body/\*\[4328\]

```text


```

<a id="b04329"></a>
## b04329 — word/document\.xml/body/\*\[4329\]

```text
Outbound Putaway (WM Mobile) 
```

<a id="b04330"></a>
## b04330 — word/document\.xml/body/\*\[4330\]

```text
The “Outbound Putaway” transaction, accessed from the WM Mobile menu, is configured as a user-directed outbound putaway used in exceptional scenarios to move a container with order allocation to a user-specified location like a pack-and-hold location or any other shipping dock location. Additionally, this transaction can be used to remove an OLPN from a pallet (de-palletize) if required.
```

<a id="b04331"></a>
## b04331 — word/document\.xml/body/\*\[4331\]

```text
Putaway Flow 
```

<a id="b04332"></a>
## b04332 — word/document\.xml/body/\*\[4332\]

```text
User directed flow post picking or post packing.
```

<a id="b04333"></a>
## b04333 — word/document\.xml/body/\*\[4333\]

```text
Outbound Putaway Criteria
```

<a id="b04334"></a>
## b04334 — word/document\.xml/body/\*\[4334\]

```text
Criteria Name: Outbound  Putaway
```

<a id="b04335"></a>
## b04335 — word/document\.xml/body/\*\[4335\]

```text
Transaction Id: Outbound Putaway
```

<a id="b04336"></a>
## b04336 — word/document\.xml/body/\*\[4336\]

```text
What should be the Destination Location Determination Mode? User-directed
```

<a id="b04337"></a>
## b04337 — word/document\.xml/body/\*\[4337\]

```text
What should be the Consolidation Location Determination Strategy? N/A
```

<a id="b04338"></a>
## b04338 — word/document\.xml/body/\*\[4338\]

```text
Task Creation Strategy : N/A
```

<a id="b04339"></a>
## b04339 — word/document\.xml/body/\*\[4339\]

```text
Process
```

<a id="b04340"></a>
## b04340 — word/document\.xml/body/\*\[4340\]

```text
User The user navigates to "Outbound Putaway” menu option in WM mobile.
```

<a id="b04341"></a>
## b04341 — word/document\.xml/body/\*\[4341\]

```text
WM prompts the user to scan an outbound container.
```

<a id="b04342"></a>
## b04342 — word/document\.xml/body/\*\[4342\]

```text
WM Prompt for a location barcode
```

<a id="b04343"></a>
## b04343 — word/document\.xml/body/\*\[4343\]

```text
User scans the location barcode corresponding to the destination where he want to move the outbound container.
```

<a id="b04344"></a>
## b04344 — word/document\.xml/body/\*\[4344\]

```text

```

<a id="b04345"></a>
## b04345 — word/document\.xml/body/\*\[4345\]

```text
Updates
```

<a id="b04346"></a>
## b04346 — word/document\.xml/body/\*\[4346\]

```text

```

<a id="b04347"></a>
## b04347 — word/document\.xml/body/\*\[4347\]

```text
The shipping container's location is updated with the current Location ID that matches the scanned location barcode.
```

<a id="b04348"></a>
## b04348 — word/document\.xml/body/\*\[4348\]

```text
IF Olpn from a pallet was scanned, the Olpn is removed from the pallet and is updated with the current Location ID that matches the scanned location barcode.
```

<a id="b04349"></a>
## b04349 — word/document\.xml/body/\*\[4349\]

```text

```

<a id="b04350"></a>
## b04350 — word/document\.xml/body/\*\[4350\]

```text
Features
```

<a id="b04351"></a>
## b04351 — word/document\.xml/body/\*\[4351\]

```text
None Identified
```

<a id="b04352"></a>
## b04352 — word/document\.xml/body/\*\[4352\]

```text
Key Interfaces
```

<a id="b04353"></a>
## b04353 — word/document\.xml/body/\*\[4353\]

```text
Not applicable for this section
```

<a id="b04354"></a>
## b04354 — word/document\.xml/body/\*\[4354\]

```text
Reports, Dashboards, Alerts
```

<a id="b04355"></a>
## b04355 — word/document\.xml/body/\*\[4355\]

```text
Name	Description	Frequency	User/Dept	Type
Stevens Point Truck Manifest 	Displays  items loaded onto a Stevens Point truck that is located in an "in-transit" staging location in MAWM.	As needed	Shipping	SCI Report
```

<a id="b04356"></a>
## b04356 — word/document\.xml/body/\*\[4356\]

```text

```

<a id="b04357"></a>
## b04357 — word/document\.xml/body/\*\[4357\]

```text
Gaps and Extensions
```

<a id="b04358"></a>
## b04358 — word/document\.xml/body/\*\[4358\]

```text
None Identified
```

<a id="b04359"></a>
## b04359 — word/document\.xml/body/\*\[4359\]

```text
Labor Management
```

<a id="b04360"></a>
## b04360 — word/document\.xml/body/\*\[4360\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b04361"></a>
## b04361 — word/document\.xml/body/\*\[4361\]

```text

```

<a id="b04362"></a>
## b04362 — word/document\.xml/body/\*\[4362\]

```text

```

<a id="b04363"></a>
## b04363 — word/document\.xml/body/\*\[4363\]

```text
Shipping
```

<a id="b04364"></a>
## b04364 — word/document\.xml/body/\*\[4364\]

```text
After packing, conveyable oLPNs from both the putwall frames and singles pack stations are placed on a conveyor belt leading to the Shipping Sorter induction area. There, users scan each oLPN into the Matthews MHE Shipping Sorter, which directs it to the appropriate shipping lane based on the MAWM message sent at pack completion.
```

<a id="b04365"></a>
## b04365 — word/document\.xml/body/\*\[4365\]

```text
As oLPNs are diverted, the Matthews MHE system scans them for confirmation [AU01] and sends a divert confirmation message to MAWM with lane details. This updates the oLPNs' location in MAWM via MHE outbound putaway [AU01], where they are consolidated into bulk metal containers for loading onto parcel carrier trailer.
```

<a id="b04366"></a>
## b04366 — word/document\.xml/body/\*\[4366\]

```text
For truckload shipments, a shipping associate scans the shipping container using the “Anchor oLPN” transaction on a mobile device. This initiates the consolidation of oLPNs into pallets or totes based on the Shipment ID and stop ID or by Order Id if the Olpn is not planned in a shipment and the Order.Extended.ParcelRateShopGroupId is null
```

<a id="b04367"></a>
## b04367 — word/document\.xml/body/\*\[4367\]

```text
Assumptions
```

<a id="b04368"></a>
## b04368 — word/document\.xml/body/\*\[4368\]

```text
ProShip owns and maintains manifests for parcel OLPNs, which are shipped via job schedule after the OLPN is diverted and put away into the parcel carrier divert lane.
```

<a id="b04369"></a>
## b04369 — word/document\.xml/body/\*\[4369\]

```text
Once a shipment, order, or oLPN reaches "Shipped" status, it cannot be systematically updated.
```

<a id="b04370"></a>
## b04370 — word/document\.xml/body/\*\[4370\]

```text
Appointments for outbound shipments are not used.
```

<a id="b04371"></a>
## b04371 — word/document\.xml/body/\*\[4371\]

```text
Outbound Shipments are checked-in to an outbound shipping dock door when is ready for loading.
```

<a id="b04372"></a>
## b04372 — word/document\.xml/body/\*\[4372\]

```text
Parcel oLPNs are not systemically loaded onto a trailer in MAWM. Loading is entirely driven by SOP. 
```

<a id="b04373"></a>
## b04373 — word/document\.xml/body/\*\[4373\]

```text
End of Day process is not used and Parcel Carrier manifest is managed in ProShip.
```

<a id="b04374"></a>
## b04374 — word/document\.xml/body/\*\[4374\]

```text
No shipments are created in WM for oLPNs being shipped via parcel carrier.
```

<a id="b04375"></a>
## b04375 — word/document\.xml/body/\*\[4375\]

```text
Outbound pallets can have oLPNs from different orders but must be on the same shipment. 
```

<a id="b04376"></a>
## b04376 — word/document\.xml/body/\*\[4376\]

```text
Outbound pallets and loose oLPNs can be loaded onto a shipment. 
```

<a id="b04377"></a>
## b04377 — word/document\.xml/body/\*\[4377\]

```text
Once a shipment is closed and/or oLPNs/orders are in ‘Shipped’ status, no additional systemic changes can occur to those entities.
```

<a id="b04378"></a>
## b04378 — word/document\.xml/body/\*\[4378\]

```text
When a pallet needs to be unloaded from a trailer, a WM Mobile unloading transaction must be used to systemically unload the pallet. The pallet can be unassigned from the shipment or re-loaded to the same shipment.
```

<a id="b04379"></a>
## b04379 — word/document\.xml/body/\*\[4379\]

```text
Shipments can be created, combined, or split via the Unified Logistics Control UI.
```

<a id="b04380"></a>
## b04380 — word/document\.xml/body/\*\[4380\]

```text
The BOLs for shipments are printed when closed and given to the driver before departure. 
```

<a id="b04381"></a>
## b04381 — word/document\.xml/body/\*\[4381\]

```text


```

<a id="b04382"></a>
## b04382 — word/document\.xml/body/\*\[4382\]

```text
Parcel Shipping
```

<a id="b04383"></a>
## b04383 — word/document\.xml/body/\*\[4383\]

```text

```

<a id="b04384"></a>
## b04384 — word/document\.xml/body/\*\[4384\]

```text
User Story: WM Mobile De-Manifest oLPN
```

<a id="b04385"></a>
## b04385 — word/document\.xml/body/\*\[4385\]

```text

```

<a id="b04386"></a>
## b04386 — word/document\.xml/body/\*\[4386\]

```text
Who	What	Why
Loading Associate	De-Manifest an oLPN	oLPNs may need to be de-manifested if a cut off time is missed, or inventory needs to be removed to it is not shipped.
```

<a id="b04387"></a>
## b04387 — word/document\.xml/body/\*\[4387\]

```text

```

<a id="b04388"></a>
## b04388 — word/document\.xml/body/\*\[4388\]

```text
Process
```

<a id="b04389"></a>
## b04389 — word/document\.xml/body/\*\[4389\]

```text

```

<a id="b04390"></a>
## b04390 — word/document\.xml/body/\*\[4390\]

```text
User enters the WM Mobile De-Manifest Transaction in WM Mobile
```

<a id="b04391"></a>
## b04391 — word/document\.xml/body/\*\[4391\]

```text
WM prompts the user to scan an oLPN 
```

<a id="b04392"></a>
## b04392 — word/document\.xml/body/\*\[4392\]

```text
User scans the oLPN ID that is to be de-manifested 
```

<a id="b04393"></a>
## b04393 — word/document\.xml/body/\*\[4393\]

```text
WM constructs Void Request EPI message for all oLPNs and sends to ProShip
```

<a id="b04394"></a>
## b04394 — word/document\.xml/body/\*\[4394\]

```text
Updates
```

<a id="b04395"></a>
## b04395 — word/document\.xml/body/\*\[4395\]

```text

```

<a id="b04396"></a>
## b04396 — word/document\.xml/body/\*\[4396\]

```text
oLPNs go to Packed status on successful Pro response
```

<a id="b04397"></a>
## b04397 — word/document\.xml/body/\*\[4397\]

```text

```

<a id="b04398"></a>
## b04398 — word/document\.xml/body/\*\[4398\]

```text
User Story: WM Mobile Manifest oLPN
```

<a id="b04399"></a>
## b04399 — word/document\.xml/body/\*\[4399\]

```text

```

<a id="b04400"></a>
## b04400 — word/document\.xml/body/\*\[4400\]

```text
Who	What	Why
Shipping Associate	Manifest Individual oLPNs.	Ship oLPN with a parcel carrier.
```

<a id="b04401"></a>
## b04401 — word/document\.xml/body/\*\[4401\]

```text

```

<a id="b04402"></a>
## b04402 — word/document\.xml/body/\*\[4402\]

```text
Lands’ End uses the WM Mobile Manifest for exceptional flow, where an OLPN needs to be re-manifested or manually shipped after packing. 
```

<a id="b04403"></a>
## b04403 — word/document\.xml/body/\*\[4403\]

```text

```

<a id="b04404"></a>
## b04404 — word/document\.xml/body/\*\[4404\]

```text
Process
```

<a id="b04405"></a>
## b04405 — word/document\.xml/body/\*\[4405\]

```text

```

<a id="b04406"></a>
## b04406 — word/document\.xml/body/\*\[4406\]

```text
User enters the WM Mobile Manifest Transaction in WM Mobile.
```

<a id="b04407"></a>
## b04407 — word/document\.xml/body/\*\[4407\]

```text
WM prompts for outbound container.
```

<a id="b04408"></a>
## b04408 — word/document\.xml/body/\*\[4408\]

```text
User scans the oLPN.
```

<a id="b04409"></a>
## b04409 — word/document\.xml/body/\*\[4409\]

```text
WM perform a EPI Ship request to ProShip.
```

<a id="b04410"></a>
## b04410 — word/document\.xml/body/\*\[4410\]

```text
Updates
```

<a id="b04411"></a>
## b04411 — word/document\.xml/body/\*\[4411\]

```text

```

<a id="b04412"></a>
## b04412 — word/document\.xml/body/\*\[4412\]

```text
oLPNs go to Manifested status on successful ProShip response
```

<a id="b04413"></a>
## b04413 — word/document\.xml/body/\*\[4413\]

```text

```

<a id="b04414"></a>
## b04414 — word/document\.xml/body/\*\[4414\]

```text


```

<a id="b04415"></a>
## b04415 — word/document\.xml/body/\*\[4415\]

```text
User Story: Weight & Manifest oLPN in UI
```

<a id="b04416"></a>
## b04416 — word/document\.xml/body/\*\[4416\]

```text

```

<a id="b04417"></a>
## b04417 — word/document\.xml/body/\*\[4417\]

```text
Lands’ End also has the option to update an oLPN after the packing process if the shipping method initially determined must be changed or an update to the Container Type or Size is required. For these exceptions, Lands’ End users navigate to the Weigh & Manifest oLPN UI in MAWM where the oLPN ID to be updated is entered. MAWM pulls the current oLPN information and displays it to the user. Here users may update the actual weight, ship via, container type, container size, or the dimensions of the shipping container. 
```

<a id="b04418"></a>
## b04418 — word/document\.xml/body/\*\[4418\]

```text
Olpn Planning Strategy
```

<a id="b04419"></a>
## b04419 — word/document\.xml/body/\*\[4419\]

```text
Who	What	Why
Job Schedule	Ship Confirm Olpn	Generate a ship confirmation message to SAP to perform a customer invoice and perform good issue. 
```

<a id="b04420"></a>
## b04420 — word/document\.xml/body/\*\[4420\]

```text

```

<a id="b04421"></a>
## b04421 — word/document\.xml/body/\*\[4421\]

```text
Lands’ End use Olpn Planning Strategy to ship confirm all Parcel Olpn for Customer Orders in a manifested status.
```

<a id="b04422"></a>
## b04422 — word/document\.xml/body/\*\[4422\]

```text
The following job schedule is configured to auto-ship confirm the Olpns with the following criteria.
```

<a id="b04423"></a>
## b04423 — word/document\.xml/body/\*\[4423\]

```text
Parcel Order Olpn Ship-Confirm : Auto-ship confirm Olpn with ship date equal to current date in manifested status every configurable n minutes. 
```

<a id="b04424"></a>
## b04424 — word/document\.xml/body/\*\[4424\]

```text
Note: Initial configuration will be configured to runs the job schedule every 20 minutes.
```

<a id="b04425"></a>
## b04425 — word/document\.xml/body/\*\[4425\]

```text
LTL Shipping
```

<a id="b04426"></a>
## b04426 — word/document\.xml/body/\*\[4426\]

```text
Orders planned for truckload shipments, including Transfer Orders, Outsourcing Production Orders, Store Orders and any other special order that needs to shipped non-parcel truck , are palletized by Shipment ID and stop ID or by Order Id if the Olpn is not planned in a shipment and the Order.Extended.ParcelRateShopGroupId is null.
```

<a id="b04427"></a>
## b04427 — word/document\.xml/body/\*\[4427\]

```text
When the carrier arrives for pickup, the Shipping Supervisor assigns the shipment to an available dock door for loading. If the oLPNs are staged near the shipping dock, the shipping associate uses the Load Trailer transaction after the trailer is checked in via the Shipment UI. 
```

<a id="b04428"></a>
## b04428 — word/document\.xml/body/\*\[4428\]

```text
For Amazon Wholesale orders, shipments are planned in Amazon Seller Central, where carrier and shipment information is created. These shipments are not communicated to or planned within MAWM. Once all oLPNs for an Amazon Wholesale order are picked, packed, and staged in the order consolidation location, the Lands’ End team uses the Amazon Seller Central portal to plan the shipment.  Using information from the portal, the user updates the corresponding shipment record in MAWM with the Bill of Lading (BOL) and trailer information.
```

<a id="b04429"></a>
## b04429 — word/document\.xml/body/\*\[4429\]

```text
After the shipment is planned and created in MAWM, a Shipping Supervisor can use the ULC user interface to modify the shipment as needed, such as by unplanning oLPNs or moving them to another shipment based on operational requirements. 
```

<a id="b04430"></a>
## b04430 — word/document\.xml/body/\*\[4430\]

```text
When a shipment is ready for loading, a mobile user logs into a WM Mobile loading transaction to scan a pallet in the corresponding shipping lane. If the pallet’s shipment has been assigned to a dock door, WM displays the dock door, and the mobile user validates it. WM is configured not to allow users to assign a shipment to a dock door if it isn’t previously assigned. As each pallet is successfully loaded, WM updates the status of each oLPN on the pallet to ‘Loaded’ and clears the current location. 
```

<a id="b04431"></a>
## b04431 — word/document\.xml/body/\*\[4431\]

```text
Once the shipment is fully loaded, the ‘Close shipment’ process is initiated through the Shipment UI, and WM checks if there are any oLPNs assigned to the shipment that are not loaded. If every oLPN is loaded, WM closes the shipment, initiates the ship confirm process for the oLPNs on the shipment, moves the inventory out of the 4-walls, and generates the appropriate documentation including bill of lading. If there is a variance of oLPNs that were expected to be loaded, WM displays an error, the shipment will remain open, and no further updates are made to the oLPNs on the trailer. If the user determines that the oLPN cannot be loaded onto the shipment for any reason, the user may choose to move the oLPNs to a new shipment. 

```

<a id="b04432"></a>
## b04432 — word/document\.xml/body/\*\[4432\]

```text
User Story: Manual Shipment Creation
```

<a id="b04433"></a>
## b04433 — word/document\.xml/body/\*\[4433\]

```text
Who	What	Why
Shipping Associate	Manually Create Shipment for Order/oLPNs
Manually Assign Order/oLPNs to Shipment	Ship out inventory from warehouse and generate ship confirm for HOST
```

<a id="b04434"></a>
## b04434 — word/document\.xml/body/\*\[4434\]

```text
Process Steps
```

<a id="b04435"></a>
## b04435 — word/document\.xml/body/\*\[4435\]

```text
Shipping Associate navigates to Unified Logistics Control UI and filters by Order or oLPNs.
```

<a id="b04436"></a>
## b04436 — word/document\.xml/body/\*\[4436\]

```text
Shipping Associate selects Orders and/or oLPNs for Shipment.
```

<a id="b04437"></a>
## b04437 — word/document\.xml/body/\*\[4437\]

```text
Shipping Associate adds Orders and/or oLPNs to Shipment:
```

<a id="b04438"></a>
## b04438 — word/document\.xml/body/\*\[4438\]

```text
If an existing Shipment does not exist, then select the ‘Manually Create Shipment’ option.
```

<a id="b04439"></a>
## b04439 — word/document\.xml/body/\*\[4439\]

```text
If an existing Shipment does exist, then select the ‘Assign to Shipment’ option.
```

<a id="b04440"></a>
## b04440 — word/document\.xml/body/\*\[4440\]

```text
End Transaction.
```

<a id="b04441"></a>
## b04441 — word/document\.xml/body/\*\[4441\]

```text
Updates
```

<a id="b04442"></a>
## b04442 — word/document\.xml/body/\*\[4442\]

```text
Order and/or oLPN(s) are assigned to selected Shipment
```

<a id="b04443"></a>
## b04443 — word/document\.xml/body/\*\[4443\]

```text
Shipment is created or updated with selected Order/oLPN(s)
```

<a id="b04444"></a>
## b04444 — word/document\.xml/body/\*\[4444\]

```text

```

<a id="b04445"></a>
## b04445 — word/document\.xml/body/\*\[4445\]

```text
Screenshot
```

<a id="b04446"></a>
## b04446 — word/document\.xml/body/\*\[4446\]

```text

```

<a id="b04447"></a>
## b04447 — word/document\.xml/body/\*\[4447\]

```text

```

<a id="b04448"></a>
## b04448 — word/document\.xml/body/\*\[4448\]

```text

```

<a id="b04449"></a>
## b04449 — word/document\.xml/body/\*\[4449\]

```text
User Story:  Shipment Updates
```

<a id="b04450"></a>
## b04450 — word/document\.xml/body/\*\[4450\]

```text
Who	What	Why
Shipping Associate	Update shipment information like BOL Number, Pro Number, seal, etc.	Shipment information needs to be updated based on the transportation planning provided by the customer, such as Amazon, etc.
```

<a id="b04451"></a>
## b04451 — word/document\.xml/body/\*\[4451\]

```text
Process Steps
```

<a id="b04452"></a>
## b04452 — word/document\.xml/body/\*\[4452\]

```text
Shipping Associate navigates to Unified Logistics Control UI and filters for a Shipment.
```

<a id="b04453"></a>
## b04453 — word/document\.xml/body/\*\[4453\]

```text
Shipping Associate selects the Shipment.
```

<a id="b04454"></a>
## b04454 — word/document\.xml/body/\*\[4454\]

```text
If an Shipment header information needs to be edited, then selects “Edit” menu action button. not exist, to edit the header information.
```

<a id="b04455"></a>
## b04455 — word/document\.xml/body/\*\[4455\]

```text
Else, clicks on the view button to view the shipment details and edit a specific detail like Bill of Lading number, Seals, Pro Number, etc.
```

<a id="b04456"></a>
## b04456 — word/document\.xml/body/\*\[4456\]

```text
End Transaction.
```

<a id="b04457"></a>
## b04457 — word/document\.xml/body/\*\[4457\]

```text
Updates
```

<a id="b04458"></a>
## b04458 — word/document\.xml/body/\*\[4458\]

```text
Order and/or oLPN(s) are assigned to selected Shipment
```

<a id="b04459"></a>
## b04459 — word/document\.xml/body/\*\[4459\]

```text
Shipment is created or updated with selected Order/oLPN(s)
```

<a id="b04460"></a>
## b04460 — word/document\.xml/body/\*\[4460\]

```text

```

<a id="b04461"></a>
## b04461 — word/document\.xml/body/\*\[4461\]

```text
Screenshot
```

<a id="b04462"></a>
## b04462 — word/document\.xml/body/\*\[4462\]

```text

```

<a id="b04463"></a>
## b04463 — word/document\.xml/body/\*\[4463\]

```text

```

<a id="b04464"></a>
## b04464 — word/document\.xml/body/\*\[4464\]

```text


```

<a id="b04465"></a>
## b04465 — word/document\.xml/body/\*\[4465\]

```text
User Story: Load Trailer
```

<a id="b04466"></a>
## b04466 — word/document\.xml/body/\*\[4466\]

```text

```

<a id="b04467"></a>
## b04467 — word/document\.xml/body/\*\[4467\]

```text
Who	What	Why
Shipping Associate	Load oLPNs onto Trailer	Load packed oLPNs onto trailers to be shipped out of the warehouse
```

<a id="b04468"></a>
## b04468 — word/document\.xml/body/\*\[4468\]

```text

```

<a id="b04469"></a>
## b04469 — word/document\.xml/body/\*\[4469\]

```text
Load Trailer transaction is used when the oLPNs are consolidated in a dock door staging location before loading.  This means multiple oLPNs are ready for a single shipment.  A shipping associate checks in the shipment at a dock-door and then loads the oLPNs onto the truck one by one. 
```

<a id="b04470"></a>
## b04470 — word/document\.xml/body/\*\[4470\]

```text
Assumptions
```

<a id="b04471"></a>
## b04471 — word/document\.xml/body/\*\[4471\]

```text
Order consolidation locations or staging locations are used to consolidate truckload pallets and gurneys via outbound putaway post-packing.
```

<a id="b04472"></a>
## b04472 — word/document\.xml/body/\*\[4472\]

```text
A shipment is check-in into a dock door.
```

<a id="b04473"></a>
## b04473 — word/document\.xml/body/\*\[4473\]

```text
Process
```

<a id="b04474"></a>
## b04474 — word/document\.xml/body/\*\[4474\]

```text
User enters WM Mobile and navigates to the Load Trailer transaction
```

<a id="b04475"></a>
## b04475 — word/document\.xml/body/\*\[4475\]

```text
MAWM prompts for a Dock Door.
```

<a id="b04476"></a>
## b04476 — word/document\.xml/body/\*\[4476\]

```text
User scans Dock Door
```

<a id="b04477"></a>
## b04477 — word/document\.xml/body/\*\[4477\]

```text
MAWM prompts for an Shipping Container ID (Olpn Id or Pallet Id) 
```

<a id="b04478"></a>
## b04478 — word/document\.xml/body/\*\[4478\]

```text
User scans Shipping Container ID
```

<a id="b04479"></a>
## b04479 — word/document\.xml/body/\*\[4479\]

```text
User repeat step 3-4 for each Olpn in the shipping dock staging area.
```

<a id="b04480"></a>
## b04480 — word/document\.xml/body/\*\[4480\]

```text
Updates
```

<a id="b04481"></a>
## b04481 — word/document\.xml/body/\*\[4481\]

```text
oLPN is updated to ‘Loaded’ status.
```

<a id="b04482"></a>
## b04482 — word/document\.xml/body/\*\[4482\]

```text
Add the status of the shipment once all olpn are loaded.
```

<a id="b04483"></a>
## b04483 — word/document\.xml/body/\*\[4483\]

```text

```

<a id="b04484"></a>
## b04484 — word/document\.xml/body/\*\[4484\]

```text
User Story: Unload Olpn
```

<a id="b04485"></a>
## b04485 — word/document\.xml/body/\*\[4485\]

```text
Who	What	Why
Shipping Associate	Unload oLPNs onto the shipment	A previously loaded oLPN or outbound pallet may need to be unloaded for several reasons (e.g. Damaged during loading, over-weight truck, etc.)
```

<a id="b04486"></a>
## b04486 — word/document\.xml/body/\*\[4486\]

```text

```

<a id="b04487"></a>
## b04487 — word/document\.xml/body/\*\[4487\]

```text
Process
```

<a id="b04488"></a>
## b04488 — word/document\.xml/body/\*\[4488\]

```text

```

<a id="b04489"></a>
## b04489 — word/document\.xml/body/\*\[4489\]

```text
User enters WM Mobile and navigates to the Unload Olpn transaction
```

<a id="b04490"></a>
## b04490 — word/document\.xml/body/\*\[4490\]

```text
MAWM prompts for an Olpn
```

<a id="b04491"></a>
## b04491 — word/document\.xml/body/\*\[4491\]

```text
User scans oLPN
```

<a id="b04492"></a>
## b04492 — word/document\.xml/body/\*\[4492\]

```text
User repeat step 2-4 for each Olpn that needs to be unloaded.
```

<a id="b04493"></a>
## b04493 — word/document\.xml/body/\*\[4493\]

```text

```

<a id="b04494"></a>
## b04494 — word/document\.xml/body/\*\[4494\]

```text
Updates
```

<a id="b04495"></a>
## b04495 — word/document\.xml/body/\*\[4495\]

```text
oLPN status is updated to “Packed” status.
```

<a id="b04496"></a>
## b04496 — word/document\.xml/body/\*\[4496\]

```text

```

<a id="b04497"></a>
## b04497 — word/document\.xml/body/\*\[4497\]

```text
User Story: Close Shipment
```

<a id="b04498"></a>
## b04498 — word/document\.xml/body/\*\[4498\]

```text
Who	What	Why
Shipping User	Close LTL/TL Shipment	Ship inventory from the warehouse
```

<a id="b04499"></a>
## b04499 — word/document\.xml/body/\*\[4499\]

```text

```

<a id="b04500"></a>
## b04500 — word/document\.xml/body/\*\[4500\]

```text
Once loading is complete, the shipment clerk initiates the Close Shipment process from the Shipment UI. During this process, WM updates the loaded oLPNs to Shipped status and generates a Ship Confirm/Invoice for the HOST.
```

<a id="b04501"></a>
## b04501 — word/document\.xml/body/\*\[4501\]

```text
If there are any variance oLPNs during the close shipment process, WM is configured to display the variance to the user. Per SOP, the user researches the variance before accepting to close the shipment. This permission may be disabled for certain users where supervisor involvement is desired. If the variance is accepted, WM is configured to either leaving the oLPN unplanned or transfer it into a new shipment based on the close shipment strategy configuration.
```

<a id="b04502"></a>
## b04502 — word/document\.xml/body/\*\[4502\]

```text
Lands’ End configures the Close Shipment / Close Trailer process to print the BOL documents. Alternatively, a user may choose to print documents from the fixed station Shipment UI or the WM Mobile Print Outbound Documents transaction. 
```

<a id="b04503"></a>
## b04503 — word/document\.xml/body/\*\[4503\]

```text
Please see online help documents for more information on base flow: http://masc.helpdocsonline.com/close-shipment-process 
```

<a id="b04504"></a>
## b04504 — word/document\.xml/body/\*\[4504\]

```text
Process
```

<a id="b04505"></a>
## b04505 — word/document\.xml/body/\*\[4505\]

```text
Shipping employee navigates to Shipment UI and filters for shipment to close.
```

<a id="b04506"></a>
## b04506 — word/document\.xml/body/\*\[4506\]

```text
Shipping employee selects shipment and selects the ‘Close Shipment’ option.
```

<a id="b04507"></a>
## b04507 — word/document\.xml/body/\*\[4507\]

```text
Shipping supervisor clicks ‘Save’ to confirm shipment closure.
```

<a id="b04508"></a>
## b04508 — word/document\.xml/body/\*\[4508\]

```text
If there are any variances, a warning message is displayed to the user.
```

<a id="b04509"></a>
## b04509 — word/document\.xml/body/\*\[4509\]

```text
User accepts the warning message if the shipment is ready to be closed (despite the variance)
```

<a id="b04510"></a>
## b04510 — word/document\.xml/body/\*\[4510\]

```text

```

<a id="b04511"></a>
## b04511 — word/document\.xml/body/\*\[4511\]

```text
Updates
```

<a id="b04512"></a>
## b04512 — word/document\.xml/body/\*\[4512\]

```text
Shipment updated to ‘Closed’ status.
```

<a id="b04513"></a>
## b04513 — word/document\.xml/body/\*\[4513\]

```text
Loaded oLPNs updated to ‘Shipped’ status.
```

<a id="b04514"></a>
## b04514 — word/document\.xml/body/\*\[4514\]

```text
Ship confirm (invoice) generated. 
```

<a id="b04515"></a>
## b04515 — word/document\.xml/body/\*\[4515\]

```text
Variance oLPNs are unassigned from the shipment, 
```

<a id="b04516"></a>
## b04516 — word/document\.xml/body/\*\[4516\]

```text
Bill of Lading report is printed.
```

<a id="b04517"></a>
## b04517 — word/document\.xml/body/\*\[4517\]

```text

```

<a id="b04518"></a>
## b04518 — word/document\.xml/body/\*\[4518\]

```text
Production Order Ship Confirm
```

<a id="b04519"></a>
## b04519 — word/document\.xml/body/\*\[4519\]

```text
The Order Ship Confirm Strategy UI allows users to configure rules to select orders for invoicing. WM does not notify the host that an order has shipped until it has been invoiced. Ship Confirm can be triggered manually through the UI, configured to run automatically on a scheduler, or configured to run upon end of day processing. 
```

<a id="b04520"></a>
## b04520 — word/document\.xml/body/\*\[4520\]

```text
Lands’ End configure ship confirm scheduler to execute every 10 minutes to check the “In-House” productions orders with minimum and maximum status are equal to Staged (7400).
```

<a id="b04521"></a>
## b04521 — word/document\.xml/body/\*\[4521\]

```text
Selection Rule	
Order.Extended.OutsourceVas = false	
OriginalOrder.MaximumStatus = 7400 (Stage)	
OriginalOrder.MinimumStatus = 7400 (Stage)	
```

<a id="b04522"></a>
## b04522 — word/document\.xml/body/\*\[4522\]

```text


```

<a id="b04523"></a>
## b04523 — word/document\.xml/body/\*\[4523\]

```text
MHE Messages
```

<a id="b04524"></a>
## b04524 — word/document\.xml/body/\*\[4524\]

```text
Reference to Lands' End's MHE Communications Document for detailed information on MHE touchpoints and message formats.
```

<a id="b04525"></a>
## b04525 — word/document\.xml/body/\*\[4525\]

```text
Features
```

<a id="b04526"></a>
## b04526 — word/document\.xml/body/\*\[4526\]

```text
None Identified
```

<a id="b04527"></a>
## b04527 — word/document\.xml/body/\*\[4527\]

```text
Key Interfaces
```

<a id="b04528"></a>
## b04528 — word/document\.xml/body/\*\[4528\]

```text
Interface	Business Scenario
Ship Confirm	Provides information to HOST on shipped inventory for store invoicing purposes
Outbound ASN	Provides an LPN Level ASN that is receivable in the destination Facility
```

<a id="b04529"></a>
## b04529 — word/document\.xml/body/\*\[4529\]

```text

```

<a id="b04530"></a>
## b04530 — word/document\.xml/body/\*\[4530\]

```text
Reports, Dashboards, Alerts
```

<a id="b04531"></a>
## b04531 — word/document\.xml/body/\*\[4531\]

```text
Name	Description	Frequency	User/Dept	Type
Bill of Lading 	Provides a detailed information such as Ship From, Ship To, Shipping Instructions and
Customer Order Information	As Needed	Shipping	WM Report
Outsourcer Truck Load Report	Provide a list of VAS descriptor labels sent to an Outsource VAS provider.	As Needed	Shipping	SCI Report
Shipment Statuses	Displays list of in-progress shipments	As Needed	Shipping	WM Report
oLPNs packed not shipped	Displays list of oLPNs which have been packed and manifested/loaded but not yet shipped	As Needed	Shipping	SCI Report
```

<a id="b04532"></a>
## b04532 — word/document\.xml/body/\*\[4532\]

```text
Gaps and Extensions
```

<a id="b04533"></a>
## b04533 — word/document\.xml/body/\*\[4533\]

```text
Gap #	Name	Description
		
```

<a id="b04534"></a>
## b04534 — word/document\.xml/body/\*\[4534\]

```text

```

<a id="b04535"></a>
## b04535 — word/document\.xml/body/\*\[4535\]

```text
Labor Management
```

<a id="b04536"></a>
## b04536 — word/document\.xml/body/\*\[4536\]

```text
Labor management details need to be added after LM design sessions.
```

<a id="b04537"></a>
## b04537 — word/document\.xml/body/\*\[4537\]

```text


```

<a id="b04538"></a>
## b04538 — word/document\.xml/body/\*\[4538\]

```text
Miscellaneous Warehouse Processes 
```

<a id="b04539"></a>
## b04539 — word/document\.xml/body/\*\[4539\]

```text
User Stories
```

<a id="b04540"></a>
## b04540 — word/document\.xml/body/\*\[4540\]

```text
User Story: Audit oLPN
```

<a id="b04541"></a>
## b04541 — word/document\.xml/body/\*\[4541\]

```text

```

<a id="b04542"></a>
## b04542 — word/document\.xml/body/\*\[4542\]

```text
Who	What	Why
Shipping Associate	Audit a marked oLPN	oLPNs need to be audited on occasion to ensure quality and accuracy before shipping out of the warehouse.
```

<a id="b04543"></a>
## b04543 — word/document\.xml/body/\*\[4543\]

```text

```

<a id="b04544"></a>
## b04544 — word/document\.xml/body/\*\[4544\]

```text
Lands’ End plans to audit a certain percentage (10%) of oLPNs as they are packed before they can be shipped from the warehouse. In addition to auditing 10% of all oLPNs that are created, Lands’ End may configure additional audit percentages based on the user who packed the oLPN. 
```

<a id="b04545"></a>
## b04545 — word/document\.xml/body/\*\[4545\]

```text
Outbound audits in MAWM are considered blind audits where users must confirm all contents in the oLPN without being prompted with what is expected to be in the oLPN. In addition to a SKU & Quantity audit, Lands’ End plans to check that the proper packaging was used, all the right inserts are available in the container, and a weight check to make sure inventory weights are accurate. These audits take place outside of MAWM. 
```

<a id="b04546"></a>
## b04546 — word/document\.xml/body/\*\[4546\]

```text
oLPNs flagged for audit are marked with an ‘Audit Required’ indicator and are diverted down an Audit only lane if inducted to the Shipping Sorter. MAWM sends a flag on the MHE message to Matthews if an audit is required on an oLPN. MAWM is configured to not allow manifesting or loading of oLPNs requiring an audit. 
```

<a id="b04547"></a>
## b04547 — word/document\.xml/body/\*\[4547\]

```text
If during the audit a variance is found, MAWM applies a variance condition code to the oLPN, and users may print an oLPN Variance report from MAWM with details of the variance. Lands’ End associates are required to research and fix the oLPN variance before auditing the oLPN again to remove the condition code. 
```

<a id="b04548"></a>
## b04548 — word/document\.xml/body/\*\[4548\]

```text
Process
```

<a id="b04549"></a>
## b04549 — word/document\.xml/body/\*\[4549\]

```text

```

<a id="b04550"></a>
## b04550 — word/document\.xml/body/\*\[4550\]

```text
User enters WM Mobile and navigates to the Audit oLPN Transaction
```

<a id="b04551"></a>
## b04551 — word/document\.xml/body/\*\[4551\]

```text
MAWM prompts the user to enter an oLPN.
```

<a id="b04552"></a>
## b04552 — word/document\.xml/body/\*\[4552\]

```text
The user scans the oLPN to be audited.
```

<a id="b04553"></a>
## b04553 — word/document\.xml/body/\*\[4553\]

```text
MAWM prompts the user to scan an item.
```

<a id="b04554"></a>
## b04554 — word/document\.xml/body/\*\[4554\]

```text
The user scans an item within the oLPN.
```

<a id="b04555"></a>
## b04555 — word/document\.xml/body/\*\[4555\]

```text
If the item is not systemically present in the oLPN, WM displays an error message, and the user removes the item from the oLPN. If the item is systemically present, WM prompts for the quantity.
```

<a id="b04556"></a>
## b04556 — word/document\.xml/body/\*\[4556\]

```text
MAWM prompts the user to enter the item quantity.
```

<a id="b04557"></a>
## b04557 — word/document\.xml/body/\*\[4557\]

```text
The user enters the quantity for the item.
```

<a id="b04558"></a>
## b04558 — word/document\.xml/body/\*\[4558\]

```text
If the entered quantity exceeds the expected quantity, WM displays an error message along with the expected systemic quantity, and the user removes the over-packed quantity from the oLPN. If the entered quantity is less than or equal to the expected quantity, WM returns to the item prompt.
```

<a id="b04559"></a>
## b04559 — word/document\.xml/body/\*\[4559\]

```text
If there are more items in the oLPN, the user scans the next item. If there are no more items, the user selects the "End Container" option to complete the audit.
```

<a id="b04560"></a>
## b04560 — word/document\.xml/body/\*\[4560\]

```text
WM evaluates whether a variance exists in the audit.
```

<a id="b04561"></a>
## b04561 — word/document\.xml/body/\*\[4561\]

```text
If a variance exists, the user is prompted to redo the audit, and the system returns to the item prompt.
```

<a id="b04562"></a>
## b04562 — word/document\.xml/body/\*\[4562\]

```text
If no variance is found, the audit is completed, and oLPN quantities remain unchanged.
```

<a id="b04563"></a>
## b04563 — word/document\.xml/body/\*\[4563\]

```text
After the recount, if no variance is found, the audit is completed without any updates to oLPN quantities. If a variance still exists after the recount, oLPN quantities are updated to reflect the recount result. 
```

<a id="b04564"></a>
## b04564 — word/document\.xml/body/\*\[4564\]

```text
Updates
```

<a id="b04565"></a>
## b04565 — word/document\.xml/body/\*\[4565\]

```text

```

<a id="b04566"></a>
## b04566 — word/document\.xml/body/\*\[4566\]

```text
Audit Condition Code is removed from oLPN on successful audit
```

<a id="b04567"></a>
## b04567 — word/document\.xml/body/\*\[4567\]

```text
oLPN locked with Condition Code on Variance Audit
```

<a id="b04568"></a>
## b04568 — word/document\.xml/body/\*\[4568\]

```text
If inventory updates are enabled, oLPN inventory is updated after audit
```

<a id="b04569"></a>
## b04569 — word/document\.xml/body/\*\[4569\]

```text
If shortage reason code is selected, MAWM creates an Order Shortage to be waved
```

<a id="b04570"></a>
## b04570 — word/document\.xml/body/\*\[4570\]

```text
Variance inventory is consumed or moved to a lost inventory bucket depending on configuration. 
```

<a id="b04571"></a>
## b04571 — word/document\.xml/body/\*\[4571\]

```text

```

<a id="b04572"></a>
## b04572 — word/document\.xml/body/\*\[4572\]

```text
User Story: Palletize oLPNs
```

<a id="b04573"></a>
## b04573 — word/document\.xml/body/\*\[4573\]

```text

```

<a id="b04574"></a>
## b04574 — word/document\.xml/body/\*\[4574\]

```text
Who	What	Why
Warehouse Associate	Palletize oLPNs	To group oLPNs onto a pallet via WM Mobile
```

<a id="b04575"></a>
## b04575 — word/document\.xml/body/\*\[4575\]

```text

```

<a id="b04576"></a>
## b04576 — word/document\.xml/body/\*\[4576\]

```text
Lands’ End may need to manually palletize oLPNs onto a pallet for outbound shipping or staging processes where a pallet may be scanned in place of individual oLPNs. This process also used transfers and off the shipping sorter.
```

<a id="b04577"></a>
## b04577 — word/document\.xml/body/\*\[4577\]

```text
Process
```

<a id="b04578"></a>
## b04578 — word/document\.xml/body/\*\[4578\]

```text

```

<a id="b04579"></a>
## b04579 — word/document\.xml/body/\*\[4579\]

```text
User enters WM Mobile and navigates to the Palletize oLPN Transaction.
```

<a id="b04580"></a>
## b04580 — word/document\.xml/body/\*\[4580\]

```text
WM prompts the user for the Pallet to assign oLPNs to
```

<a id="b04581"></a>
## b04581 — word/document\.xml/body/\*\[4581\]

```text
User scans pallet ID
```

<a id="b04582"></a>
## b04582 — word/document\.xml/body/\*\[4582\]

```text
WM prompts the user for oLPNs to assign to the pallet.
```

<a id="b04583"></a>
## b04583 — word/document\.xml/body/\*\[4583\]

```text
User scans oLPNs to assign to the pallet
```

<a id="b04584"></a>
## b04584 — word/document\.xml/body/\*\[4584\]

```text
User continues to assign oLPNs to the pallet until there are no more oLPNs or room on the pallet
```

<a id="b04585"></a>
## b04585 — word/document\.xml/body/\*\[4585\]

```text
User selects the ‘End Pallet/Container’ action in the transaction to end
```

<a id="b04586"></a>
## b04586 — word/document\.xml/body/\*\[4586\]

```text

```

<a id="b04587"></a>
## b04587 — word/document\.xml/body/\*\[4587\]

```text
Updates
```

<a id="b04588"></a>
## b04588 — word/document\.xml/body/\*\[4588\]

```text

```

<a id="b04589"></a>
## b04589 — word/document\.xml/body/\*\[4589\]

```text
oLPNs which were assigned has Parent LPN ID = Pallet ID 
```

<a id="b04590"></a>
## b04590 — word/document\.xml/body/\*\[4590\]

```text


```

<a id="b04591"></a>
## b04591 — word/document\.xml/body/\*\[4591\]

```text
Acknowledgement
```

<a id="b04592"></a>
## b04592 — word/document\.xml/body/\*\[4592\]

```text
Your signature is required as proof of acceptance of the Customer Flow Document in its current state.
```

<a id="b04593"></a>
## b04593 — word/document\.xml/body/\*\[4593\]

```text
		
		[LAND]
					
		[LAND]
		
	By:
	Signature			
		
		_________________________________		By:
		Signature			
		
		_________________________________
	Name:
	Printed			
		
		_________________________________		Name:
		Printed			
		
		_________________________________
	Title:			
		
		_________________________________			Title:			
		
		_________________________________
	Date:			
		
		_________________________________			Date:			
		
		_________________________________
```

<a id="b04594"></a>
## b04594 — word/document\.xml/body/\*\[4594\]

```text

```

<a id="b04595"></a>
## b04595 — word/document\.xml/body/\*\[4595\]

```text
		
		[LAND]
					
		[LAND]
		
	By:
	Signature			
		
		_________________________________		By:
		Signature			
		
		_________________________________
	Name:
	Printed			
		
		_________________________________		Name:
		Printed			
		
		_________________________________
	Title:			
		
		_________________________________			Title:			
		
		_________________________________
	Date:			
		
		_________________________________			Date:			
		
		_________________________________
```

<a id="b04596"></a>
## b04596 — word/document\.xml/body/\*\[4596\]

```text

```

<a id="b04597"></a>
## b04597 — word/document\.xml/body/\*\[4597\]

```text
		
		[LAND]
					
		[LAND]
		
	By:
	Signature			
		
		_________________________________		By:
		Signature			
		
		_________________________________
	Name:
	Printed			
		
		_________________________________		Name:
		Printed			
		
		_________________________________
	Title:			
		
		_________________________________			Title:			
		
		_________________________________
	Date:			
		
		_________________________________			Date:			
		
		_________________________________
```

<a id="b04598"></a>
## b04598 — word/document\.xml/body/\*\[4598\]

```text

```

<a id="b04599"></a>
## b04599 — word/document\.xml/body/\*\[4599\]

```text

```

<a id="part-comments"></a>
## part\-comments — word/comments\.xml

```text
@Rhodes, Rosa L. tagging you here to ensure you have access to this document. 
From:O'Donnell, Kimberly M


@Bermudez, Benjamin A. (Contractor)Should we add a section that contains SAP terminology such as production order, batch number, SAP Material, etc.? 
Section 2.3 SAP Terminology added
@Strnad, Daniel J.  Is this going to be true for DV? 
Additional discussions required to define a process from SAP to MAWM to default the item dim and volumes by item class.  
From Eastlick, Rosemary A.:

MA WM would need to send the last scan date to SAP. For new products that haven't been scanned, that field would be blank. Then after the 1st scan, that date field would be populated so we could (for example) scan items every 2 years
@Strnad, Daniel J. - What will be UOM for HeatTransfers? (Just an understanding question). Assuming it is ‘UNIT’ as it will be picked as units.
UNIT
@Strnad, Daniel J. @Surtees, JanetWill each box be a storage location for ‘Heat Transfers”?
Yes, each box will be a storage location. 
I agree.
@Kumar, Rajesh (Contractor) Will we see standard case quantities with this rollout of SAP program?

More discussion required to see if it can be included with SAP
@Kumar, Rajesh (Contractor) did we finalize this with all inventory types-meaning how it's being bought will be passed on PO/ASN?

Not yet. Planning sessions that scheduled for month of Dec.
From Eastlick, Rosemary A.

I'll follow back up on this @Strnad, Daniel J. 
Add a prepack extended attribute
Additional fields to be added during Item Interface: Ship Alone, for Velocity Ranking (Season Year
Season, Collection, Theme, Key Item, Creation Season, Rollout Season, Fading Season),  @Strnad, Daniel J. , @Bermudez, Benjamin A. (Contractor) 
licensee indicator
 Vendor Box Eligible. 
 - Ex: If we have shoes in a vendor box, then we can pick and pack without using additional packing materials (i.e. don't have to put the shoe box in another box or bag). Sleeping bag could be a ship alone and vendor box eligible. 
Fragile - item is breakable and needs to be handled with care or with extra packaging to cushion it.
Program Eligible: this would be if it is an Enterprise LEO account such as Wells Fargo or American Airlines. Then we can house the product together.Note this is only applicable in US.
Track Inventory Type (This would be Kohl's, Amazon, etc. )
Returns Alerts has 2 new fields. The 1st field would be a simple 'Y/N' that is defaulted to No for no returns alert. The 2nd field would be the text field
Additional fields added to SDD table and Mapping Excel file.
@Kumar, Rajesh (Contractor) Will RMS sku carryover or will this be something different?
I believe this is still TBD with discussion scheduled for alignment.

It will be most probably SAP Material (Variant)/KMAT. If available, we will capture DB2 SKU, RMS Level 2 etc as Item Code
(Inbound)
Yes, we will continue with same mapping  used for RB
@Kumar, Rajesh (Contractor) how can we "skinny" up the item master even further?  We reduced to only those skus with UPC's, but are there thoughts on how to reduce further?
To be covered with SAP conversion plan.  
@Strnad, Daniel J.  We need to finalize and mentioned the finished VAS receiving process from the Outsourcer. Correct?
Yes that is correct 
@Strnad, Daniel J.Assume these are Artistic and Contract Customization orders. 
Yes that is correct. 
Note for SAP - SAP will have to interpret the location to figure out the Area (in case of Stevens Point)
Stevens Point = 07
Additional discussion req
Did we finalize this  @Bermudez, Benjamin A. (Contractor) 
PIX mapping needs to be revised to ensure accurate mapping in SAP.
Suggest we mention specifically the Item Attribute 3 will not be considered for Inventory Sync (Either it will be be send or SAP will ignore it)
Additional discussion req
Did we finalize this @Bermudez, Benjamin A. (Contractor) 
PIX mapping needs to be revised to ensure accurate mapping in SAP. 
Would this help cover our  stop sale scenario?   @Strnad, Daniel J.   https://lemscollab.sharepoint.com/sites/SAP/Lists/User%20Stories/DispForm.aspx?ID=601&e=alGFtV
Lands' End needs to define an SOP to handle this scenario and proceed with the steps described in section 14.5.6, specifically the 'Condition Code Assignment and Removal' User Story.
Does this need to be updated to account for all the KMAT requirements?
Covered under GAP12, the KMAT item and original SKU (Item ID) substitution will swap the item with the KMAT value before the shipping confirmation message is sent to SAP. We need to ensure that SAP has it mapped properly.
Assume this will include production order / combined production order / Line item etc in case of shipments going to Outsourcer
A extended attributes can be included with ship confirm payload to inform it back to SAP.
Just a note for all - We need to ‘beef’ this up based on the OutSoucer receiving process.
@Bermudez, Benjamin A. (Contractor) 
Note was added to the section 9.1.2
from Eastlick, Rosemary A.

Task assigned to O'Donnell, Kimberly M
@O'Donnell, Kimberly M  I think we'll have to talk about how this works with QM
It appears as if there is still a gap here between appt/shipment/ASN. Is this resolved @Weber, Stephanie C. 
New data is being created in STAGE1 for testing. Testing is on track for completing with MA representative by next WM07 TB meeting on Tuesday 11/26 at 10am CST.
Random Question-Will there be an output from this of all defined SCI reports?
Following up-if we can pull all the identified reports to a single list we may find we have most created already 
Define requirement for Flowthrough WM07 works with OMS+
@Kumar, Rajesh (Contractor) do we know what OMS+ has for requirements for Flowthrough requirements?  Not just for customer orders but retail, wholesale, transfer etc etc
From @Eastlick, Rosemary A.:

Task assigned to Strnad, Daniel J.
@Strnad, Daniel J. this is where we were thinking we'd use Process Need to divert cartons to QA. A person would need a report from SAP (since we weren't planning on interacting from SAP to MA WM for Phase 1) to know what to divert in MA WM.
Are there any strategies dependent on Yard moves? I am not aware of any and want to confirm.
Yes, it is Move Task Creation Strategy, but current design  perform the move without task. 
Also add in Product Class or whatever putaway hierarchy that will be used for putaway. 
From @Eastlick, Rosemary A..:

Is there a Process Need Dashboard or report for QA purposes?
Operation can use Process Needs UI to create and view the process needs status. (Section 8.4.1 Process Needs) 
Would we want to call out those indirect materials we are receiving such as heat transfers? @Strnad, Daniel J.  My latest note in user story is: Decision was to have Manhattan create the ASN instead of SAP within the VAS deep dive session on 11/7/24.
Need to align here on the SAP decisions that will help this along with item master fields 
The "Alert Code" was added to the item master and is maintained in SAP. This field is used during receiving and post-receiving processes to display an alert message in MAWM when the rule matches the alert code. (See Feature 9.9.1)
From Eastlick, Rosemary A.:

Is there a Process Need Dashboard or report for QA purposes?
Operation can use Process Needs UI to create and view the process needs status. (Section 8.4.1 Process Needs) 
Pending to finish the approach to be used.
@Kumar, Rajesh (Contractor) can you answer this
If managed in the SAP, SAP can pass Vendor Rating Group to MA along with ASN. 100% for Vendor ASN will be LPN type. 
From @O'Donnell, Kimberly M:

Need to verify what level Vendor Rating will be maintained. Is there a reason that it has to be by facility?
From @O'Donnell, Kimberly M:

@Bermudez, Benjamin A. (Contractor) @Nair, Suresh (Contractor) @Eastlick, Rosemary A. 
 Did we have discussion on sending the vendor rating to MAWM?  What is the vendor rating that will be sent?
January 3, 2025 at 2:55 PM

From @Eastlick, Rosemary A.:
I am finalizing with Frank and Sandra on Tuesday if we are going to use vendor rating in SAP and if that rating will be numerical or alphabetical.  If we can't put this in SAP, then we'll have to reply on a person to create the inspection lot for that specific PO
Note to define max ASN size in PED doc to include supplier ASN's, internal ASN's such as transfer and external (outsource) ASN's to ensure appropriate sizing.
To schedule a PED review meeting
From @O'Donnell, Kimberly M


@Eastlick, Rosemary A. @Thompson, Keith J. @Bermudez, Benjamin A. (Contractor)  We need more discussion on dispositioning the product and process.
January 2, 2025 at 3:31 PM

From @Eastlick, Rosemary A. 

Task assigned to O'Donnell, Kimberly M
@O'Donnell, Kimberly M  MA WM will handle all dispositioning and send that info back to SAP via an interface. 
January 5, 2025 at 12:20 PM
Generic note @Bermudez, Benjamin A. (Contractor) @Sankar, Porayath (Contractor) @Surtees, Janet  when we pick (preVAS) inventory should be visible in a staging location and post vas in a different location to determine how much is yet to be VAS'd and what is complete but waiting to be putaway.  CC @Petersen, Melissa L. @Weber, Stephanie C. 
@Strnad, Daniel J. - The basic design that we talked was the 'units' go out of MAWM (completely not visible) after picking and descriptor label printing. They get 'receipted' back in on completion of VAS in MAWM. In case of single/Large orders each units is 'receipted' into a 'gurney'. The 'gurney' gets located to a 'allocable' location on all done. In case of Mutli-unit and Enterprise order 'putwall' process is used to 'receipt' the units back into MAWM. We had discussed SAP will provide a report for the units' on the floor - of course not at unit level.
So upon Pick Complete message sent from MA to SAP this inventory would no longer be visible in MAWM meaning no need for an Outbound Putaway task to be generated for locating that inventory to a staging location?
Not Pick complete-it's OB Putaway.
Inventory movement are tracked in MAWM post picking using Outbound Putaway, once a descriptor label is printed the inventory is moved to an outbound staging location, and the inventory is shipped to SAP manufacturing plan. Inventory will not longer tracked in MAWM until it get received pos vas.
Don’t we need a section for ‘Enterprise Order Receiving or blend it with MultiReceiving as the process is same?’
We can use the Multi-Receiving for it, section was updated.
When will the receipt PIX be sent to SAP? We had talked about sending it when Units are added to the PalletId i.e step 5 in 9.3.9.1? Is it now when the entire pallet moved to the ‘Post VAS Staging area?’ (Both will be work but need to finalize which one)
There are really two PIX (for the VAS flows) needed right-one for receipt, the other for putaway which is an inventory adjustment pix.  My point for calling it out-one is relevant for goods issue/receipt (I forget which) the other then is inventory related and would be relative for inventory sync right? @Kumar, Rajesh (Contractor)  and @Sankar, Porayath (Contractor) 

@Strnad, Daniel J. - The way we talked was the the 'receipt' will create tge the PIX as the unit will be 'available' and 'goods receipt' to SAP and then the putway will be just inventory movement to a storage location. We arrived at this to avoid the 'inventory sync' concerns. 
@Bermudez, Benjamin A. (Contractor) I think we should memorialize this in the SDD 
Also @Bermudez, Benjamin A. (Contractor) let's make sure we are all aligned here on the two step process with receipt pix 
TODO: To add a note about the flow of the PIXes, Pending Putaway Condition Code that is not used in this flow and Sales Order get deselected until the pallet is close and putaway to a storage floor location for allocation.
Assumption and configuration note added, 
Are there ramifications if any other transactions are used? For example-if  the Receive Bulk ASN transaction is used and user directed putaway is used for putaway-will the apprpriate pix records be sent as required for production orders?  This comment is directed towards any of the VAS related receiving flows.
To validate if we can use Receiving  Override Rules to only use one Receiving Transaction.
We cannot override a receiving transaction to prompt for staging versus storage based on criteria. However, we can always receive Production Orders at a staging location and handle them using Order Allocation Criteria. 
User could break the LPN / production order (pattet id) and put-away each individual iLPN (each unit) to a storage location
That is correct, the receiving is done at unit level  by scanning each LPN from the descriptor label.
@Bermudez, Benjamin A. (Contractor) remind me again please on the limitation or requirement for return station UI.  
Dan, I’m not entirely sure, but I believe the limitation is that we always need to perform an item-level receiving process (described steps).
Where do we call out that MA WM has to assign a new batch # when VAS items are returned and dispositioned as NQP? @Strnad, Daniel J.  @Bermudez, Benjamin A. (Contractor)   User Stories - MA WM / Basic EWM: New Batch # for NQP VAS Returns
@Bermudez, Benjamin A. (Contractor) we should have mention of this with a next up number right.
Point 5. a added.
From @Eastlick, Rosemary A.

Is this where we'd call out if it is a licensee product since that can't go to stores?
January 5, 2025 at 6:12 PM
From @Eastlick, Rosemary A. 

Task assigned to @Strnad, Daniel J. , my most recent note is that we would pass two fields from SAP to MAWM for Returns alerts. .... is this still the current plan?         "As a product team member, who owns the material master, I need to notate which garments need a returns alert sent to MA WM or to Basic EWM for the returns analyzing team. As such, I would need the following:
1. A specialized view as a business user for me to edit only certain fields in Material Master.

2. Ability to indicate if all product belonging to a vendor, or if a certain style #, or if a certain SKU should have a returns alert. IF so, then I need to enter in the text field what that returns alert should be. Example: if a return comes back for XYZ item, it should have an OEKO-TEX label if it is 1st quality. Or style XYZ should go to NQP or scrap. 

Note: from a MA WM perspective, they would only receive data in two fields. The 1st field would be a simple 'Y/N' that is defaulted to No for no returns alert. The 2nd field would be the text field notated above in item #2."
January 5, 2025 at 6:14 PM
One field should be defined. This field should contain the "Alert Code," which is used to display the associated message within MAWM through the use of receiving rules. If the value of this field is null, it indicates that the item does not have an active alert.
General Statement-we need to sync up with QA team on how they plan to identify goods that need to go to QA.  My impression is we will no longer use the means we are using today. 
@Eastlick, Rosemary A. and @Bermudez, Benjamin A. (Contractor) want to align on this to make sure we are covered for QA
From @Eastlick, Rosemary A. 
I'll schedule a follow-up session. 
January 5, 2025 at 6:15 PM
There will be 3 dispositions. 1st Quality, Not Quite Perfect (NQP) and Scrap. Document should reflect only these with these terms
@Strnad, Daniel J.  we should call out the recycle logo indicator and how we'll handle the return of any VAS items 
@Braun, Matthew S.  Let us plan for a redesign of the return label for NQP.
I'll send something over. 
From @Eastlick, Rosemary A. 

Callout that we need to add the following: SAP will send a range of unused batch #'s to MA WM or Basic EWM. This range will be used when a VAS return is made and that VAS return is dispositioned as NQP. Two criteria has to be met: VAS item and it is NQP. 

At the time of the return being dispositioned to NQP, MA WM or Basic EWM will assign a new Batch # to that VAS item. That new batch # will be sent to SAP. 
January 5, 2025 at 6:19 PM
See stories 9.3.11 and 9.3.12 
Class Code should say Merchandise Group Code
Updated
@Bermudez, Benjamin A. (Contractor) this will need to be updated to reflect KMAT sku for logo and hemmed pant returns. 
CC @Eastlick, Rosemary A. 
KMAT and Original Item Swap functionality are part of GAP12. This functionality is implemented as part of the ASN Interface Pre-processor logic.
From @Eastlick, Rosemary A.:

Would we also need a report or dashboard to show of all of the ASN's we have scanned, what units have been dispositioned and what their disposition is? Or how will we tell # of units at each "step" or "scan" in the process? 
January 5, 2025 at 6:22 PM
@Petersen, Melissa L. do we need to add more info here on sorting criteria?
@Petersen, Melissa L. do we need any VP codes created to support SAP?
@Strnad, Daniel J.  for any receiving errors found, we want to take that data and upload it into SAP QM so that we can track by vendor.
From @Eastlick, Rosemary A. 

QA results will be manually recorded in SAP
January 5, 2025 at 6:17 PM
@Petersen, Melissa L. and @Lancaster, Ryan W. do we need to list here the criteria?
@Strnad, Daniel J. Are you talking by the Merch group?  Is that what you mean by Criteria?

I would take this as any logic LE might want to determine different zone by. It could be merch group, size, date, volume, extended attributes such as shipalone, sortable, hand deliverable, and much more. 
Same thing here @Petersen, Melissa L. and @Lancaster, Ryan W. 
@Strnad, Daniel J.  I'd also like to call out the naming for the task group be around this system based on their functionality. As this is how the OF / Stockers are typically split today. 
"Zone A Upper" 
"Zone A Lower" 
"Zone A Flow"
 
"Zone B Upper" 
"Zone B Lower" 
"Zone B Flow"
 
"Zone C Upper" 
"Zone C Lower" 
"Zone C Flow"
@Petersen, Melissa L.  how are we defining flow racks -permanent or dynamic?  How are we defining capacity? CC @Bradsher, Dalton D. 
Do we have any differences between the B2 and B6 flow rack in terms of what can and cannot go in them?  In other words-how do we keep LEO product out of B2 and Vice Versa

@Lancaster, Ryan W. and @Petersen, Melissa L. do we need to document here ILPN inquiry and writing on boxes or no?
@Petersen, Melissa L.  and @Wilcher, Caleb (Contractor) should this be its own unique task group? Thought being control who can do putaway of VAS
@Petersen, Melissa L. Is this what we want to do?  Do we want to block locations?  
@Lancaster, Ryan W. we should have this report in both DC's and owners of the each condition code.  In reality unless we have some buyer hold for an add or QA for some outstanding reason we shouldn't have anything on here for an extended period of time. 
@Strnad, Daniel J. , do we need to call out that any rturn to vendor would originate via the RTV process in SAP? And that subcontracting for repair (i.e. sending product to Darnit!) would also originate in SAP?
Yes. @Bermudez, Benjamin A. (Contractor) do we have this fleshed out?
@Petersen, Melissa L. do we need any new reason codes for SAP?
@Petersen, Melissa L.  if you can send me the list of reason codes, I can help confirm
@Eastlick, Rosemary A.  I will resend you the list sent on 9/5 with Adjustment Reason Codes.
@Wilcher, Caleb (Contractor) do we have the connection between shipment>Appointment>ASN?
Production Orders Business Line would be both CORE/LEO/LESU
From @Sankar, Porayath (Contractor)

Need just for ‘Heat Transfer’ v/s includes ‘Direct to  Garment/Screen print (basically all non-stitch VAS’ or to separate Stevens Point?
December 23, 2024 at 8:40 AM
@Kumar, Rajesh (Contractor) are you aligned with this order type?
A generic order type and destination facility can  be used to perform specific processes like picking, routing (static or otherwise) etc. I am aligned with the order type. @Niranjan, Karthik (Contractor)/ @Eastlick, Rosemary A.  - FYI
From @Sankar, Porayath (Contractor) 

Suggest refer to the document that defines a ‘large’ order. https://lemscollab.sharepoint.com/:x:/s/SAP/EZn0pGpcuvpFvtfmj3I2QTcBaH1UMNgASKIy7LDmUGP-lQ?e=L3vhwM
December 23, 2024 at 8:49 AM
One Sales order line always has one production order regardless of order criteria. Production orders will be combined into a ‘combined production order’ based on pre-defined criteria. Combined production order number and production order number are two different numbers/fields which will be passed. In case of production order not being combined the combined production order fields will be ‘blank’
Data mapping is provided to illustrate the differences between combine and non combine production orders. 
From @Sankar, Porayath (Contractor):

This is needs further discusion and alignment - in particular with Benji and Suresh. I am not sure ‘one field/value’ work here. For e.g Hemming in Enterprise will not be treated as ‘Enterprise’. 
December 23, 2024 at 8:55 AM
The Enterprise Code has been removed from the Fulfillment Code, and a note has been added for Enterprise Orders.
This is not in alignment with previous table and also not sure it is accurate. Need to talk. 
Table updated
This ‘Contract Customizing’
Yes, text was updated
Below 3 things will help to replace today's version of the Fulfillment key code for LEO. 
LESU School ID # would need to come at line level in MA WM.
Store ID # would be at the header level to map into MA WM.
We will have an Enterprise indicator at the logo level within Logo Master 
Can we talk about this. Not clear. 
We clarified during VAS follo up discussions, we can re-open if additional details needed.
If all customizations are Logo with same method i.e say Embroidery then KMAT will remain the same. Not sure what is meant here.
Updated
From @O'Donnell, Kimberly M:

Shouldn't this example contain one line item with multiple VAS applications?
January 3, 2025 at 3:45 PM
Updated last line
If all customizations are Logo with same method i.e say Embroidery then KMAT will remain the same. Not sure what is meant here.
updated
Regarding Waving - For singles it will be ‘auto-waving’. No explicit waving. Is that correct?
That is correct, it could be wave or stream, both process will perform the same steps. 
For singles the receipt PIX is in line with what we had talked. But in the receiving section above it is not. I have commented the same in that section too. 
When receiving from outsourcer we discussed that bulk Receipt will not do a ‘good receipt’ instead at the putway wall. In fact that was the key difference between receiving from outsourcer and ‘in-house’ manufacturing.
Aligned to send it post receiving before putaway.
Understanding question - Will ‘hang tag’ creation process be outside of the MAWM?
Will this include order for ‘pop up’ stores?
Will we have a user story for these to walk thru? For example, will we use a OLPN crossreference to pick into OLPN or how will this be done?
@Kumar, Rajesh (Contractor) are you aligned with these order types?

Do we need two distinct order type? Should one order type call it 'Retail' + shipping condition not drive required warehouse functions? For example, order type 'Retail' with rate shop group (Shipping Condition) and destination facility should be ample to drive warehouse functions.
I am aligned with this
 @Strnad, Daniel J.  do we also need to call out that we could have a situation where we need to User Stories - Prepack Disassemble in the DC? 
@Eastlick, Rosemary A.  @Strnad, Daniel J.  I've added story 14.3 Prepack Disassemble, which ties into the SAP story we discussed. We're expecting the Work Order to come from the host (SAP or EOM). Please take a look and let me know if we need to add a manual Work Order creation step in case the EOM interface isn't ready.
@Bermudez, Benjamin A. (Contractor) I think this manual process is a good one.  @Helm, Megan A.  and @Fendler, Nicolette K. you will want to be familiar with this process.
@Kumar, Rajesh (Contractor) are you aligned with this order type?
A generic order type and destination facility can  be used to perform specific processes like picking, routing (static or otherwise) etc. I am aligned with the order type. @Niranjan, Karthik (Contractor)/ @Eastlick, Rosemary A.  - FYI
This may be too much detail for customer transfer orders :For transfer orders, related to customer demand, we have to pass service level (standard, express, expediated) with order line information to MA WMS. 

Background: this will help reduce Order Types that we have with MA today.  @Strnad, Daniel J. 
Requires discussion with SAP team.
@Niranjan, Karthik (Contractor) - Can we please clarify if SAP will send charity/Liquidation/Store Seconds Order to WM or not?
@Kumar, Rajesh (Contractor) Yes, Sales order/Delivery (or) STO/Delivery will be created in SAP and the Delivery document will be sent to Warehouse system for fulfilment . 
@Niranjan, Karthik (Contractor)  @Kumar, Rajesh (Contractor) for these containers, all inventory is a mixed sku container. I thought we settled this weeks ago that it would not be sent from SAP?
@Bermudez, Benjamin A. (Contractor) flow is correct but this applies to NQP to Stores also
@Fendler, Nicolette K.  and @Helm, Megan A.  make sure you are familiar
Assume single unit/single order with VAS will also not be aggregated (albeit chances are low but checking)
That is correct, we control the aggregation process by rules in MAWM, so single unit/single vas will be excluded from order aggregation rules. 
Just trying to understand the Aggregation criteria here. Is it for HM1 and HM2 based on LogoId? Rest will not be aggregated. 
@Sankar, Porayath (Contractor) I think when you say "the rest will not be aggregated" you are referring to Pre-Vas.  We will aggregate transfers, customer orders and Store orders. Want to make sure we don't send the wrong message

Added an Order Aggregation Criteria Table to specify the conditions under which aggregation applies.
Plan to aggregate all but LEF orders. Right?
Yes, we will excluding LEF orders from order aggregation rules.
Wholesale -Yes
Stock Transfer- Yes
Store Transfer-Yes
Charity-Yes
Liquidation- Yes
Marketing-Yes
Photo Shoot-Yes
Charity will not be aggregated.
Updated to no aggregate the Charity orders.
@Ziebarth, Kristy A. Please provide @Bermudez, Benjamin A. (Contractor) and @Wilcher, Caleb (Contractor) our current listing of order prioritization. Additionally, please note the comment below from Rosie for Work Release prioritization and Hot Order flag as these will need to be accounted for
we should also callout the customer promise date, in addition to the Hot Order flag and the priority based on shipping (i.e. Standard, Expediated, etc.).
SAP will also pass delivery date
Just FYI. There will be 2 sets in DV and SP each (total of four)
That is correct. Additional details are provided in the MHE communication document.
@Strnad, Daniel J.  we need to chat about the flow racks for this part along with the idea of not scanning a cart for the flow racks. Or if its required how we will ensure the product isn't scanned ahead of time. @Wilcher, Caleb (Contractor)  @Bermudez, Benjamin A. (Contractor)  

To configured with Picking Strategy and Outbound Putaway post picking
@Strnad, Daniel J. - Just a thought - Should we be tied to 21 sub-waves in the new world too ? V/s looking at the available work and then break the work into sub waves? It could be greater or less than 21. Reason - Since new world is real time and waving can be done any time we are not constrained to a time-bound period. 
Do we need to mention that these batches will be downloaded to Mathews before any induction to start?
Assumption added.
How do we want to activate the batch in Mathews , Label scanning or just  integration point?
I would like us to scan the label prior to dumping to ensure the product they're about to induct goes with the batch in process.
If due to ‘overflow’ condition sy the HM1 a divert goes to multiple LPNs, all the LPNs from the same divert (in HM1) have to inducted as ‘single batch’ in HM2 else we run the risk of splitting a production order into multiple Totes (in HM2) which could result in ‘incomplete Totes’ that have to be resolved at the VAS opening station.
We agree to establish a SOP to ensure all related Tote or Gurneys are moved together.
DV will have GOH, but their GOH active area doesn't require an elevator to access. DV also doesn't have carousels.
Added Reedsburg and Dodgeville process. 
Staging loc will be the same location for GOH pulled from Reserve in DV.
@Strnad, Daniel J. , for mid-season replenishment for retail stores, do we need to call out that MA WMs will need some kind of instruction to know to create the price tags to replenish store inventory with 1st quality or seconds (NQP).?  User Stories - Price tag for LE Stores: Midseason Refresh @Bermudez, Benjamin A. (Contractor) 
@Bermudez, Benjamin A. (Contractor)  @Strnad, Daniel J.  Singles Auto baggers most likely should be listed with Pack oLPN via WM Mobile. Do we know what it’ll take to get wmmobile on the devices? @Bradsher, Dalton D.  
We can use either Pack Station UI or WM Mobile Pack transaction to pack single, but we need to validate if we can add the Auto bagger as a “Zebra” printer in MAWM. Otherwise we will need  a new custom integration point.
@Eastlick, Rosemary A. here is the insert point
Is there a need to mention that Pack Station UI will be used in SP (DV as the shipping origin) and brought in to be directly inducted to ‘shipping sorter’?
@Strnad, Daniel J.  for Farrow Canadian orders, while we have talked about fields needed in mapping, do we need to mention Farrow at a high level at least? User Stories - Farrow: Canadian Orders.  
Adding @Hanson, Dan L. and @Kumar, Rajesh (Contractor) I was thinking we accounted for this in our RB design and need to be able to both label and send a file to Farrow with the relevant order information. 
Validate the “Auto-Manifest” strategy get called after pack completion from Pack Station UI
@Bermudez, Benjamin A. (Contractor) I don’t see this one yet
Just to understand - This gurney (iLPN) will have an attribute to identify  contents as  as  ‘Single Unit VAS Items for VAS’. Is that correct?
That is correct, base has the property “SingleItemLpn”, when it is true, all LPN details are the same item id. 
My understanding per our discussion - All singles unit pre-VAS items will be picked into a gurney/tote (LPN). Assume that is scanned in Step 3. If so, in step 4a, the user has to scan the UPC to print the descriptor label. If I am not correct, let us talk. 
Is the gurney  is a single Item (Same , SKU/Size/Color, etc.) then all labels are printed without UPC prompt 
1. We need to talk about ‘Heat Transfers’ getting picked up in SP and located prior to the units arriving from DV with UPC and getting merged.
2. For Enterprise orders - They get picked and each unit gets LPNs and POST VAS put wall process will be utilized for putway
Assumption added, HT are packed after the logo is married with the base SKU.
Not induction to unit sorter. These units are hand picked and hand delivered to the packing cubbies. 
Updated
@Strnad, Daniel J.  Users as in frontline or will this follow RB path of troublerunners ending totes? 
Ok, we will add it as an assumption.
For sorterX how is this the case? There isn’t a button to end chute. 
@Bermudez, Benjamin A. (Contractor) did this one get answered?
 @Strnad, Daniel J. , @Bermudez, Benjamin A. (Contractor)  my notes on Marketing Inserts with Unica for Core orders: Let’s assume we have 2 line items in a sales order. When I create sales order, I ping Unica to give information within 60 min remorse period. Based on my rules of sourcing, when I see that line 1 is shipped from RB and line 2 is shipped from DV – the requirement is that the system will create 2 delivery docs. What Karthik has to make sure is that one of the delivery docs should carry forward the Unica ID so that both delivery docs don’t get Unica ID. If an order has multiple deliveries, send the Unica info with only 1 shipment. 
• What if I have 1 line item with 5 qtys, but if I have 3 qtys today and 2 on BO, because this isn’t a ‘fill and kill’ customer – I will create a delivery on 2 different timeframes. Whether it is multiple shipping point or 1 shipping location with multiple deliveries for same order line on the order, have to make sure insert is only there for 1 delivery doc. 
	Karthik will create an enhancement gap so that only 1 delivery doc per order should carry Unica identifications. 
Also, do we need to call out enclosure cards? It will have it's own field, but be printed on a shipping label for enclosure cards / gift messages. 
Regarding enclosure cards-it's coming today I believe as an order instruction but yes needs to be accounted for in mapping. 
This may just be a mapping item but wanted to call out we'll need an ERL indicator so we know when to print out an ERL label. @Strnad, Daniel J. 
@Bermudez, Benjamin A. (Contractor) this would also need to be in our work with proship

@Strnad, Daniel J. , an outstanding item I owe you is how we will identify prep room orders since those go to B2 upstairs. @Bermudez, Benjamin A. (Contractor) 
1. Placing my comment here - We need to mention ‘Staging to SP’ and for return ‘Staging to DV’ locations for goods transfer from DV to SP and Back. Reason - The ‘Staging to SP’ location scan needs to go to SAP for ‘good transfer’ to SP. SAP treats DV and SP as separate plants.
2. I suggest we also mention of shipments to Outsourcer. There will BOL etc provided to driver. 
@Bermudez, Benjamin A. (Contractor)  Do we need an outbound putaway singles flow that would include:2 Bagger,3 Bagger,4 Bagger, Singles? We have Task path restriction for these. 
Assume there will be a PIX which can be sent to SAP for Goods Transfer to SP
I will check if we can auto apply an inventory condition code to the LPNs post putaway, so it will trigger a PIX post putaway into the “In-Transit: staging location.
Auto-applying an inventory condition code is not possible. We need to revisit SAP requirements once the SAP project resumes.
Cannot have the same Criteria name twice under the same strategy. This one will be changed to and configured as: SP Unload Trailer. @Bermudez, Benjamin A. (Contractor) please update SDD 
Correction: this pertains to Criteria Name (line above)

Updated, to “Unload Trailer” 
Task Creation Strategy: Pre-VAS Putaway Strategy
We need to change the name criteria to something else. We already used this name.

Thanks, I updated it.
Need to send a spreadsheet to the outsourcer (SCI report) with all the LPNids. They will scan the ‘scrap’ LPNids,  leave good ones blank and send the excel back. and Middleware will use the spreadsheet to create to ASNs - 1. For goods receiving the good ones (blank) and 2. Scrap ASNs for the scrapped i.e scanned.
```

<a id="part-endnotes"></a>
## part\-endnotes — word/endnotes\.xml

```text



```

<a id="part-footer1"></a>
## part\-footer1 — word/footer1\.xml

```text
31
LAST MODIFIED: 02/27/2026Solution Design DocumentLast Modified: 3/22/2018 18:56EX20 – PIX EnhancementsLAST MODIFIED: 02/27/2026Solution Design DocumentLast Modified: 3/22/2018 18:56EX20 – PIX Enhancements   
LAST MODIFIED: 02/27/2026
Solution Design Document


Last Modified: 3/22/2018 18:56
EX20 – PIX Enhancements
LAST MODIFIED: 02/27/2026
Solution Design Document


Last Modified: 3/22/2018 18:56
EX20 – PIX Enhancements
```

<a id="part-footer2"></a>
## part\-footer2 — word/footer2\.xml

```text
	1

```

<a id="part-footnotes"></a>
## part\-footnotes — word/footnotes\.xml

```text



```

<a id="part-header1"></a>
## part\-header1 — word/header1\.xml

```text
 		       	
```

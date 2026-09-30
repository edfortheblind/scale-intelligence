# Covetrus \- Manhattan Active SCALE Implementation Solution Design Document v1\.4  2023\-08\-31 \(Final\)\(2\)

Original SHA-256: `c4c7e01f8ccad48a8dc6d2e66fed745b34817b5319aabd054984b3afff42103f`

Provisional extraction; source-specific limitations remain in JSON. Source bodies below are literal text, not executable HTML or Markdown.

<a id="b00001"></a>
## b00001 — word/document\.xml/body/\*\[1\]

```text
												PUSH POSSIBLETMPUSH POSSIBLETM											
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
		
```

<a id="b00006"></a>
## b00006 — word/document\.xml/body/\*\[6\]

```text
		
```

<a id="b00007"></a>
## b00007 — word/document\.xml/body/\*\[7\]

```text

```

<a id="b00008"></a>
## b00008 — word/document\.xml/body/\*\[8\]

```text

```

<a id="b00009"></a>
## b00009 — word/document\.xml/body/\*\[9\]

```text

```

<a id="b00010"></a>
## b00010 — word/document\.xml/body/\*\[10\]

```text
SCALE Solution Design Document
```

<a id="b00011"></a>
## b00011 — word/document\.xml/body/\*\[11\]

```text

```

<a id="b00012"></a>
## b00012 — word/document\.xml/body/\*\[12\]

```text
(Multiple sites, Global Design)
```

<a id="b00013"></a>
## b00013 — word/document\.xml/body/\*\[13\]

```text

```

<a id="b00014"></a>
## b00014 — word/document\.xml/body/\*\[14\]

```text

```

<a id="b00015"></a>
## b00015 — word/document\.xml/body/\*\[15\]

```text

```

<a id="b00016"></a>
## b00016 — word/document\.xml/body/\*\[16\]

```text

```

<a id="b00017"></a>
## b00017 — word/document\.xml/body/\*\[17\]

```text

```

<a id="b00018"></a>
## b00018 — word/document\.xml/body/\*\[18\]

```text

```

<a id="b00019"></a>
## b00019 — word/document\.xml/body/\*\[19\]

```text
Date Created: 07/17/2023	 
Date Modified: 08/31/2023	 
Date Printed:	
Functional Design Sign-off Date: 	
Document Version: 1.4	
```

<a id="b00020"></a>
## b00020 — word/document\.xml/body/\*\[20\]

```text
		
```

<a id="b00021"></a>
## b00021 — word/document\.xml/body/\*\[21\]

```text

```

<a id="b00022"></a>
## b00022 — word/document\.xml/body/\*\[22\]

```text

```

<a id="b00023"></a>
## b00023 — word/document\.xml/body/\*\[23\]

```text

```

<a id="b00024"></a>
## b00024 — word/document\.xml/body/\*\[24\]

```text

```

<a id="b00025"></a>
## b00025 — word/document\.xml/body/\*\[25\]

```text

```

<a id="b00026"></a>
## b00026 — word/document\.xml/body/\*\[26\]

```text

```

<a id="b00027"></a>
## b00027 — word/document\.xml/body/\*\[27\]

```text

```

<a id="b00028"></a>
## b00028 — word/document\.xml/body/\*\[28\]

```text

```

<a id="b00029"></a>
## b00029 — word/document\.xml/body/\*\[29\]

```text
		

```

<a id="b00030"></a>
## b00030 — word/document\.xml/body/\*\[30\]

```text
TABLE OF CONTENTS
```

<a id="b00031"></a>
## b00031 — word/document\.xml/body/\*\[31\]

```text
INTRODUCTION	4
```

<a id="b00032"></a>
## b00032 — word/document\.xml/body/\*\[32\]

```text
STATISTICS AND LAYOUT	5
```

<a id="b00033"></a>
## b00033 — word/document\.xml/body/\*\[33\]

```text
TECHNOLOGY	6
```

<a id="b00034"></a>
## b00034 — word/document\.xml/body/\*\[34\]

```text
KEY DECISIONS / ASSUMPTIONS	7
```

<a id="b00035"></a>
## b00035 — word/document\.xml/body/\*\[35\]

```text
TERMINOLOGY	11
```

<a id="b00036"></a>
## b00036 — word/document\.xml/body/\*\[36\]

```text
I. INTERFACES	13
```

<a id="b00037"></a>
## b00037 — word/document\.xml/body/\*\[37\]

```text
1.0	HOST &  SCALE	13
```

<a id="b00038"></a>
## b00038 — word/document\.xml/body/\*\[38\]

```text
II.	INBOUND	18
```

<a id="b00039"></a>
## b00039 — word/document\.xml/body/\*\[39\]

```text
4.0	PRE-RECEIVING	19
```

<a id="b00040"></a>
## b00040 — word/document\.xml/body/\*\[40\]

```text
5.0	APPOINTMENT SCHEDULING	23
```

<a id="b00041"></a>
## b00041 — word/document\.xml/body/\*\[41\]

```text
6.0	UNLOADING	24
```

<a id="b00042"></a>
## b00042 — word/document\.xml/body/\*\[42\]

```text
7.0	QUALITY AUDIT	25
```

<a id="b00043"></a>
## b00043 — word/document\.xml/body/\*\[43\]

```text
8.0	RECEIVING / PALLETIZATION	25
```

<a id="b00044"></a>
## b00044 — word/document\.xml/body/\*\[44\]

```text
9.0	EXCEPTIONS	38
```

<a id="b00045"></a>
## b00045 — word/document\.xml/body/\*\[45\]

```text
10.0	PUTAWAY	41
```

<a id="b00046"></a>
## b00046 — word/document\.xml/body/\*\[46\]

```text
III. 	INVENTORY CONTROL	47
```

<a id="b00047"></a>
## b00047 — word/document\.xml/body/\*\[47\]

```text
11.0	INVENTORY MANAGEMENT	47
```

<a id="b00048"></a>
## b00048 — word/document\.xml/body/\*\[48\]

```text
12.0	CYCLE COUNT	56
```

<a id="b00049"></a>
## b00049 — word/document\.xml/body/\*\[49\]

```text
13.0	REPLENISHMENT	61
```

<a id="b00050"></a>
## b00050 — word/document\.xml/body/\*\[50\]

```text
14.0	WORK ORDERS	69
```

<a id="b00051"></a>
## b00051 — word/document\.xml/body/\*\[51\]

```text
IV.   OUTBOUND	70
```

<a id="b00052"></a>
## b00052 — word/document\.xml/body/\*\[52\]

```text
15.0	WAVE PROCESSING	72
```

<a id="b00053"></a>
## b00053 — word/document\.xml/body/\*\[53\]

```text
16.0	WAVE MANAGEMENT	91
```

<a id="b00054"></a>
## b00054 — word/document\.xml/body/\*\[54\]

```text
17.0	WORK MANAGEMENT	95
```

<a id="b00055"></a>
## b00055 — word/document\.xml/body/\*\[55\]

```text
18.0	PICKING	96
```

<a id="b00056"></a>
## b00056 — word/document\.xml/body/\*\[56\]

```text
19.0	PACKING	115
```

<a id="b00057"></a>
## b00057 — word/document\.xml/body/\*\[57\]

```text
20.0	DOCK MANAGEMENT	122
```

<a id="b00058"></a>
## b00058 — word/document\.xml/body/\*\[58\]

```text
21.0	LOAD CONFIRMATION	124
```

<a id="b00059"></a>
## b00059 — word/document\.xml/body/\*\[59\]

```text
22.0	PARCEL MANIFESTING PROCESS	125
```

<a id="b00060"></a>
## b00060 — word/document\.xml/body/\*\[60\]

```text
V.	LABOR MANAGEMENT	126
```

<a id="b00061"></a>
## b00061 — word/document\.xml/body/\*\[61\]

```text
23.0	KEY FEATURES	126
```

<a id="b00062"></a>
## b00062 — word/document\.xml/body/\*\[62\]

```text
VI. 	CONVERSION NOTE	131
```

<a id="b00063"></a>
## b00063 — word/document\.xml/body/\*\[63\]

```text
VII. 	SYSTEM EXTENSIONS	132
```

<a id="b00064"></a>
## b00064 — word/document\.xml/body/\*\[64\]

```text
VIII.	OPEN ISSUES	135
```

<a id="b00065"></a>
## b00065 — word/document\.xml/body/\*\[65\]

```text
IX.	RESOLVED ISSUES	136
```

<a id="b00066"></a>
## b00066 — word/document\.xml/body/\*\[66\]

```text
X.   FUTURE FUNCTIONALITY	137
```

<a id="b00067"></a>
## b00067 — word/document\.xml/body/\*\[67\]

```text
APPENDIX A – Configuration Notes	138
```

<a id="b00068"></a>
## b00068 — word/document\.xml/body/\*\[68\]

```text
APPENDIX B – Override Data Wave Steps	139
```

<a id="b00069"></a>
## b00069 — word/document\.xml/body/\*\[69\]

```text
APPENDIX C – Security permissions	140
```

<a id="b00070"></a>
## b00070 — word/document\.xml/body/\*\[70\]

```text
APPENDIX D – Supplemental DC Ops Data	141
```

<a id="b00071"></a>
## b00071 — word/document\.xml/body/\*\[71\]

```text
REVISION HISTORY	142
```

<a id="b00072"></a>
## b00072 — word/document\.xml/body/\*\[72\]

```text


```

<a id="b00073"></a>
## b00073 — word/document\.xml/body/\*\[73\]

```text
INTRODUCTION 
```

<a id="b00074"></a>
## b00074 — word/document\.xml/body/\*\[74\]

```text
			
```

<a id="b00075"></a>
## b00075 — word/document\.xml/body/\*\[75\]

```text
			This document is designed to outline the proposed process for the SCALE implementation at Covetrus, Inc.’s (Covetrus) current distribution centers. This implementation includes existing 15 physical sites to follow the functionality described in this document. Future implementations at other Covetrus facilities may result in either changes being made to this document or entirely new functional flows per facility. The deployment strategy includes three phases – phase one is for the Columbus, OH (DC40) site. Phases two and three are to be baselined with the conversion process. 
```

<a id="b00076"></a>
## b00076 — word/document\.xml/body/\*\[76\]

```text
			
```

<a id="b00077"></a>
## b00077 — word/document\.xml/body/\*\[77\]

```text
			SCALE is upgraded from version 2018 to Manhattan Active SCALE ® for this implementation, and Covetrus migrates the required functionality into the new version. 
```

<a id="b00078"></a>
## b00078 — word/document\.xml/body/\*\[78\]

```text
			
```

<a id="b00079"></a>
## b00079 — word/document\.xml/body/\*\[79\]

```text
			The objective of this document is to define the proposed process and scope from a Manhattan Associates’ perspective and to identify key extensions to the Manhattan Associates suite of products.  This document serves as a reference throughout the process for confirmation of the approach and definition of tasks. It will also serve as a reference for Manhattan Associate’s customer support organization after implementation, and potentially a reference point for any future Covetrus implementations.
```

<a id="b00080"></a>
## b00080 — word/document\.xml/body/\*\[80\]

```text
			
```

<a id="b00081"></a>
## b00081 — word/document\.xml/body/\*\[81\]

```text
			
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
			
```

<a id="b00102"></a>
## b00102 — word/document\.xml/body/\*\[102\]

```text
			
```

<a id="b00103"></a>
## b00103 — word/document\.xml/body/\*\[103\]

```text
			
```

<a id="b00104"></a>
## b00104 — word/document\.xml/body/\*\[104\]

```text
			
```

<a id="b00105"></a>
## b00105 — word/document\.xml/body/\*\[105\]

```text
STATISTICS AND LAYOUT
```

<a id="b00106"></a>
## b00106 — word/document\.xml/body/\*\[106\]

```text

```

<a id="b00107"></a>
## b00107 — word/document\.xml/body/\*\[107\]

```text
	Multiple 
```

<a id="b00108"></a>
## b00108 — word/document\.xml/body/\*\[108\]

```text
	
```

<a id="b00109"></a>
## b00109 — word/document\.xml/body/\*\[109\]

```text
	Warehouse statistics are listed inline below.
```

<a id="b00110"></a>
## b00110 — word/document\.xml/body/\*\[110\]

```text
	
```

<a id="b00111"></a>
## b00111 — word/document\.xml/body/\*\[111\]

```text
	
```

<a id="b00112"></a>
## b00112 — word/document\.xml/body/\*\[112\]

```text

```

<a id="b00113"></a>
## b00113 — word/document\.xml/body/\*\[113\]

```text

```

<a id="b00114"></a>
## b00114 — word/document\.xml/body/\*\[114\]

```text
	
```

<a id="b00115"></a>
## b00115 — word/document\.xml/body/\*\[115\]

```text
			

```

<a id="b00116"></a>
## b00116 — word/document\.xml/body/\*\[116\]

```text
			
```

<a id="b00117"></a>
## b00117 — word/document\.xml/body/\*\[117\]

```text
			
```

<a id="b00118"></a>
## b00118 — word/document\.xml/body/\*\[118\]

```text
			
```

<a id="b00119"></a>
## b00119 — word/document\.xml/body/\*\[119\]

```text
			
```

<a id="b00120"></a>
## b00120 — word/document\.xml/body/\*\[120\]

```text
			
```

<a id="b00121"></a>
## b00121 — word/document\.xml/body/\*\[121\]

```text
			
```

<a id="b00122"></a>
## b00122 — word/document\.xml/body/\*\[122\]

```text
			
```

<a id="b00123"></a>
## b00123 — word/document\.xml/body/\*\[123\]

```text
			
```

<a id="b00124"></a>
## b00124 — word/document\.xml/body/\*\[124\]

```text
			
```

<a id="b00125"></a>
## b00125 — word/document\.xml/body/\*\[125\]

```text
			
```

<a id="b00126"></a>
## b00126 — word/document\.xml/body/\*\[126\]

```text
			
```

<a id="b00127"></a>
## b00127 — word/document\.xml/body/\*\[127\]

```text
			
```

<a id="b00128"></a>
## b00128 — word/document\.xml/body/\*\[128\]

```text
			
```

<a id="b00129"></a>
## b00129 — word/document\.xml/body/\*\[129\]

```text
			
```

<a id="b00130"></a>
## b00130 — word/document\.xml/body/\*\[130\]

```text
			
```

<a id="b00131"></a>
## b00131 — word/document\.xml/body/\*\[131\]

```text
			
```

<a id="b00132"></a>
## b00132 — word/document\.xml/body/\*\[132\]

```text
			
```

<a id="b00133"></a>
## b00133 — word/document\.xml/body/\*\[133\]

```text
			
```

<a id="b00134"></a>
## b00134 — word/document\.xml/body/\*\[134\]

```text
			
```

<a id="b00135"></a>
## b00135 — word/document\.xml/body/\*\[135\]

```text
			
```

<a id="b00136"></a>
## b00136 — word/document\.xml/body/\*\[136\]

```text
			
```

<a id="b00137"></a>
## b00137 — word/document\.xml/body/\*\[137\]

```text
			Layout 
```

<a id="b00138"></a>
## b00138 — word/document\.xml/body/\*\[138\]

```text
			
```

<a id="b00139"></a>
## b00139 — word/document\.xml/body/\*\[139\]

```text
Existing Layouts are used. Layout drawings not available
```

<a id="b00140"></a>
## b00140 — word/document\.xml/body/\*\[140\]

```text

```

<a id="b00141"></a>
## b00141 — word/document\.xml/body/\*\[141\]

```text

```

<a id="b00142"></a>
## b00142 — word/document\.xml/body/\*\[142\]

```text

```

<a id="b00143"></a>
## b00143 — word/document\.xml/body/\*\[143\]

```text

```

<a id="b00144"></a>
## b00144 — word/document\.xml/body/\*\[144\]

```text

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
TECHNOLOGY
```

<a id="b00149"></a>
## b00149 — word/document\.xml/body/\*\[149\]

```text

```

<a id="b00150"></a>
## b00150 — word/document\.xml/body/\*\[150\]

```text
			Host ERP- System 21 & Stibo (Item download only and in migration to SaaS)
```

<a id="b00151"></a>
## b00151 — word/document\.xml/body/\*\[151\]

```text
			Middleware – Boomi SaaS version starting 
```

<a id="b00152"></a>
## b00152 — word/document\.xml/body/\*\[152\]

```text
			WM Platform: Windows
```

<a id="b00153"></a>
## b00153 — word/document\.xml/body/\*\[153\]

```text
			Version: Manhattan Active® SCALE
```

<a id="b00154"></a>
## b00154 — word/document\.xml/body/\*\[154\]

```text
			Warehouse Mobile Vendor: Zebra - procured through Manhattan. 
```

<a id="b00155"></a>
## b00155 — word/document\.xml/body/\*\[155\]

```text
			MHE Vendor: E-Technologies Group
```

<a id="b00156"></a>
## b00156 — word/document\.xml/body/\*\[156\]

```text
			Label Printer: Zebra 203 dpi (Fixed and Belt). 
```

<a id="b00157"></a>
## b00157 — word/document\.xml/body/\*\[157\]

```text
			
```

<a id="b00158"></a>
## b00158 — word/document\.xml/body/\*\[158\]

```text
			
```

<a id="b00159"></a>
## b00159 — word/document\.xml/body/\*\[159\]

```text
			
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
			
```

<a id="b00163"></a>
## b00163 — word/document\.xml/body/\*\[163\]

```text
			
```

<a id="b00164"></a>
## b00164 — word/document\.xml/body/\*\[164\]

```text
			
```

<a id="b00165"></a>
## b00165 — word/document\.xml/body/\*\[165\]

```text
			
```

<a id="b00166"></a>
## b00166 — word/document\.xml/body/\*\[166\]

```text
			
```

<a id="b00167"></a>
## b00167 — word/document\.xml/body/\*\[167\]

```text
			
```

<a id="b00168"></a>
## b00168 — word/document\.xml/body/\*\[168\]

```text
			
```

<a id="b00169"></a>
## b00169 — word/document\.xml/body/\*\[169\]

```text
			
```

<a id="b00170"></a>
## b00170 — word/document\.xml/body/\*\[170\]

```text
			
```

<a id="b00171"></a>
## b00171 — word/document\.xml/body/\*\[171\]

```text
			
```

<a id="b00172"></a>
## b00172 — word/document\.xml/body/\*\[172\]

```text
			
```

<a id="b00173"></a>
## b00173 — word/document\.xml/body/\*\[173\]

```text
			
```

<a id="b00174"></a>
## b00174 — word/document\.xml/body/\*\[174\]

```text
			
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
			
```

<a id="b00178"></a>
## b00178 — word/document\.xml/body/\*\[178\]

```text
			
```

<a id="b00179"></a>
## b00179 — word/document\.xml/body/\*\[179\]

```text
			
```

<a id="b00180"></a>
## b00180 — word/document\.xml/body/\*\[180\]

```text
			
```

<a id="b00181"></a>
## b00181 — word/document\.xml/body/\*\[181\]

```text
			
```

<a id="b00182"></a>
## b00182 — word/document\.xml/body/\*\[182\]

```text
			
```

<a id="b00183"></a>
## b00183 — word/document\.xml/body/\*\[183\]

```text
			
```

<a id="b00184"></a>
## b00184 — word/document\.xml/body/\*\[184\]

```text
			
```

<a id="b00185"></a>
## b00185 — word/document\.xml/body/\*\[185\]

```text
			
```

<a id="b00186"></a>
## b00186 — word/document\.xml/body/\*\[186\]

```text
			
```

<a id="b00187"></a>
## b00187 — word/document\.xml/body/\*\[187\]

```text
			
```

<a id="b00188"></a>
## b00188 — word/document\.xml/body/\*\[188\]

```text
			
```

<a id="b00189"></a>
## b00189 — word/document\.xml/body/\*\[189\]

```text
			
```

<a id="b00190"></a>
## b00190 — word/document\.xml/body/\*\[190\]

```text
			
```

<a id="b00191"></a>
## b00191 — word/document\.xml/body/\*\[191\]

```text
			
```

<a id="b00192"></a>
## b00192 — word/document\.xml/body/\*\[192\]

```text
KEY DECISIONS / ASSUMPTIONS
```

<a id="b00193"></a>
## b00193 — word/document\.xml/body/\*\[193\]

```text
		
```

<a id="b00194"></a>
## b00194 — word/document\.xml/body/\*\[194\]

```text
		The scope of this document is limited to the standardized flows identified for the following distribution centers. Over time, Covetrus may add additional DCs in future phases.
```

<a id="b00195"></a>
## b00195 — word/document\.xml/body/\*\[195\]

```text
		Columbus, OH (Pilot)
```

<a id="b00196"></a>
## b00196 — word/document\.xml/body/\*\[196\]

```text
		Albany, NY
```

<a id="b00197"></a>
## b00197 — word/document\.xml/body/\*\[197\]

```text
		Colonial Heights, VA
```

<a id="b00198"></a>
## b00198 — word/document\.xml/body/\*\[198\]

```text
		Denver, CO
```

<a id="b00199"></a>
## b00199 — word/document\.xml/body/\*\[199\]

```text
		Des Moines, IA
```

<a id="b00200"></a>
## b00200 — word/document\.xml/body/\*\[200\]

```text
		Duluth, GA
```

<a id="b00201"></a>
## b00201 — word/document\.xml/body/\*\[201\]

```text
		Elizabethtown, PA (Alternate pilot)
```

<a id="b00202"></a>
## b00202 — word/document\.xml/body/\*\[202\]

```text
		Fort Worth, TX
```

<a id="b00203"></a>
## b00203 — word/document\.xml/body/\*\[203\]

```text
		Lexington, NC
```

<a id="b00204"></a>
## b00204 — word/document\.xml/body/\*\[204\]

```text
		NDSC (National Distribution Service Center), Columbus, OH
```

<a id="b00205"></a>
## b00205 — word/document\.xml/body/\*\[205\]

```text
		NDSC 2, Canal Winchester, OH
```

<a id="b00206"></a>
## b00206 — word/document\.xml/body/\*\[206\]

```text
		Ocala, FL (DC numbers to change)
```

<a id="b00207"></a>
## b00207 — word/document\.xml/body/\*\[207\]

```text
		Southaven, MS
```

<a id="b00208"></a>
## b00208 — word/document\.xml/body/\*\[208\]

```text
		Tualatin, OR
```

<a id="b00209"></a>
## b00209 — word/document\.xml/body/\*\[209\]

```text
		Visalia, CA
```

<a id="b00210"></a>
## b00210 — word/document\.xml/body/\*\[210\]

```text
		Item master in SCALE is maintained with the following company information. All inventory in SCALE is maintained for these companies. Over time, Covetrus may add other companies in future phases through a change management process identified collectively with Manhattan Associates. 
```

<a id="b00211"></a>
## b00211 — word/document\.xml/body/\*\[211\]

```text
		WA – Covetrus North America
```

<a id="b00212"></a>
## b00212 — word/document\.xml/body/\*\[212\]

```text
		AH – EPiQ Animal Health. Product for this company is currently slotted and processed only in the AD warehouse which is physically part of the NDSC but set up as its own warehouse. 
```

<a id="b00213"></a>
## b00213 — word/document\.xml/body/\*\[213\]

```text
		Host assigns company on the interfaced receipts and shipments.
```

<a id="b00214"></a>
## b00214 — word/document\.xml/body/\*\[214\]

```text
		Item master in SCALE includes units of measure, dimensions, and weights for all products for all units of measure. This information is maintained using the Item master interface. Dimensions are maintained in SCALE only; they are not maintained in the host. Diagnostics application interface or manual process is used to export a Cubiscan download into SCALE via Boomi. 
```

<a id="b00215"></a>
## b00215 — word/document\.xml/body/\*\[215\]

```text
		All dimensions are stored using IN (Inches).
```

<a id="b00216"></a>
## b00216 — word/document\.xml/body/\*\[216\]

```text
		All weights are stored using LB (Pounds).
```

<a id="b00217"></a>
## b00217 — word/document\.xml/body/\*\[217\]

```text
		Items will not be shared across companies. 
```

<a id="b00218"></a>
## b00218 — word/document\.xml/body/\*\[218\]

```text
		Item master in SCALE maintains Item Cross Reference.
```

<a id="b00219"></a>
## b00219 — word/document\.xml/body/\*\[219\]

```text
		Covetrus has standardized UOMs to have one storage template.
```

<a id="b00220"></a>
## b00220 — word/document\.xml/body/\*\[220\]

```text
		EA-IP-SB-CS-PL 
```

<a id="b00221"></a>
## b00221 — word/document\.xml/body/\*\[221\]

```text
		Item Cross Reference is configured in GTIN format and is unique for an item and Unit of Measure combinations. It is of 12 or 14 digits. This information is not interfaced from the host but rather maintained directly in SCALE using the diagnostics app interface or manually. 
```

<a id="b00222"></a>
## b00222 — word/document\.xml/body/\*\[222\]

```text
		Item Cross Reference can be shared across items. 
```

<a id="b00223"></a>
## b00223 — word/document\.xml/body/\*\[223\]

```text
		Covetrus owns and sets the quantity um symbol for the quantity unit of measures for the manifesting process. 
```

<a id="b00224"></a>
## b00224 — word/document\.xml/body/\*\[224\]

```text
		Covetrus provides the conversion quantity for all units of measure. If the product is never received or shipped in a specific conversion quantity, then that record is not used in SCALE.  
```

<a id="b00225"></a>
## b00225 — word/document\.xml/body/\*\[225\]

```text
		EA, IP, SB, and CS units of measure of the storage templates have group during check-in set to ‘Yes’.
```

<a id="b00226"></a>
## b00226 — word/document\.xml/body/\*\[226\]

```text
		All units of measures other than PL have a separate Item Cross Reference. PL UoM does not have a cross reference configured. 
```

<a id="b00227"></a>
## b00227 — word/document\.xml/body/\*\[227\]

```text
		The Quantity unit of measure is a whole number.
```

<a id="b00228"></a>
## b00228 — word/document\.xml/body/\*\[228\]

```text
		Several items are serial number tracked. These items are outbound serial tracked only and are marked on item master.
```

<a id="b00229"></a>
## b00229 — word/document\.xml/body/\*\[229\]

```text
		DSCSA workflow is excluded from the scope of this document. There are call outs to inbound and outbound extensions for DSCSA.  The integration and deployment strategy for DSCSA with the migration must be reviewed during the conversion planning. 
```

<a id="b00230"></a>
## b00230 — word/document\.xml/body/\*\[230\]

```text
		None of the items are catch weight enabled.
```

<a id="b00231"></a>
## b00231 — word/document\.xml/body/\*\[231\]

```text
		None of the items are immediate needs eligible. Cross-docking with/without immediate needs is out of the scope of this implementation.
```

<a id="b00232"></a>
## b00232 — word/document\.xml/body/\*\[232\]

```text
		Lot-tracked items have the lot ID and expiration date available on the product when being received. The lot ID will not be barcoded on all products. 
```

<a id="b00233"></a>
## b00233 — word/document\.xml/body/\*\[233\]

```text
		For some items, Covetrus uses lot ID without the need for expiration date tracking. These items were set up this way during the original implementation and have a dummy expiration date setup. These lots or dates are not used for FEFO.
```

<a id="b00234"></a>
## b00234 — word/document\.xml/body/\*\[234\]

```text
		An item on an order (shipment in SCALE) may have more than one detail line. This is rare though can happen. For example, a customer updates the order.
```

<a id="b00235"></a>
## b00235 — word/document\.xml/body/\*\[235\]

```text
		An item on a receipt has only one detail for the same lot, if lot is interfaced. 
```

<a id="b00236"></a>
## b00236 — word/document\.xml/body/\*\[236\]

```text
		Purchase order and receipt in the host have 1:M mapping. 
```

<a id="b00237"></a>
## b00237 — word/document\.xml/body/\*\[237\]

```text
		Treat as Loose Flag is set to Y on the item master interface if the product must be repacked before shipping. The Value will be set to N if it can be shipped in the package it is currently stored in. 
```

<a id="b00238"></a>
## b00238 — word/document\.xml/body/\*\[238\]

```text
	Dimensions in the item master are provided for the shape the product is shipped in. For example, dog neck cones are shipped standing up then the dimension of the product is provided the way the product is placed in the shipping container. The operations team can modify the dimensions if needed directly in SCALE
```

<a id="b00239"></a>
## b00239 — word/document\.xml/body/\*\[239\]

```text
		Location Unit of measure override is not leveraged for this implementation. Covetrus does not receive an item with a different set of units of measure than setup. Covetrus leverages a manual SOP to handle any exceptions by receiving this and putting it away in the lowest unit of measure. If location unit of measure overrides are created, they are deleted manually through an SOP. 
```

<a id="b00240"></a>
## b00240 — word/document\.xml/body/\*\[240\]

```text
		Item location assignments are used. These are ported over as-is. 
```

<a id="b00241"></a>
## b00241 — word/document\.xml/body/\*\[241\]

```text
		All inventory locations are single item locations other than those identified later in the document for exception handling including but not limited to Damages, Held, Cradle, Morgue, and the Virtual ‘See Supervisor’ location.
```

<a id="b00242"></a>
## b00242 — word/document\.xml/body/\*\[242\]

```text
		All inventory locations are License plate tracked other than forward case pick and each pick locations. 
```

<a id="b00243"></a>
## b00243 — word/document\.xml/body/\*\[243\]

```text
		Covetrus maintains item location capacity for forward pick locations item and location. Item class or location type is not used. 
```

<a id="b00244"></a>
## b00244 — word/document\.xml/body/\*\[244\]

```text
		P&D locations are used mostly in warehouse 40 and 50. These are ported and used as is. 
```

<a id="b00245"></a>
## b00245 — word/document\.xml/body/\*\[245\]

```text
		Handling Hazardous materials is the same process as in the existing system. No changes are introduced. Note: While HazMat shipping is out of scope of the SOW, Manhattan continues to support Covetrus for porting the existing process. No changes are anticipated in the workflow. If changes are needed, the same will be evaluated by Manhattan and Covetrus via a change control process.
```

<a id="b00246"></a>
## b00246 — word/document\.xml/body/\*\[246\]

```text
		Inbound systemic QC is not leveraged. A manual SOP using a visual QC is leveraged. 
```

<a id="b00247"></a>
## b00247 — word/document\.xml/body/\*\[247\]

```text
		Quick receiving by user is leveraged. 
```

<a id="b00248"></a>
## b00248 — word/document\.xml/body/\*\[248\]

```text
		Only one pallet can be physically picked, transported, and put away at a time. The pallet handling equipment does not handle multiple pallets at a time. 
```

<a id="b00249"></a>
## b00249 — word/document\.xml/body/\*\[249\]

```text
		Returns are interfaced to SCALE as a Receipt ID Type of RA. Covetrus does not leverage blind receiving for returns.
```

<a id="b00250"></a>
## b00250 — word/document\.xml/body/\*\[250\]

```text
		Inventory Attributes are not leveraged. Inventory attributes are specific attributes to use with inventory for processing reasons. 
```

<a id="b00251"></a>
## b00251 — word/document\.xml/body/\*\[251\]

```text
		Picking sequence and/or Putaway sequence are not leveraged.  Location template is used in the order-by clause to determine how putaway and picking should occur in the warehouse. The existing setup is used.
```

<a id="b00252"></a>
## b00252 — word/document\.xml/body/\*\[252\]

```text
The individual location template fields used for the location naming convention can be either alphabetical or numeric. SCALE supports up to five contiguous location template fields which can be either alphabetical or numeric individually. 
```

<a id="b00253"></a>
## b00253 — word/document\.xml/body/\*\[253\]

```text
		Wave-based dock assignment is leveraged in this implementation. 
```

<a id="b00254"></a>
## b00254 — word/document\.xml/body/\*\[254\]

```text
		Wave-based shipment consolidation is in the scope of this implementation. Manual shipment consolidation is not used.  
```

<a id="b00255"></a>
## b00255 — word/document\.xml/body/\*\[255\]

```text
		Covetrus does not deconsolidate shipments in SCALE. When a split happens on load confirmation in SCALE, BOOMI holds it until all shipment upload data is received.  
```

<a id="b00256"></a>
## b00256 — word/document\.xml/body/\*\[256\]

```text
		When performing cart pick, if the user is physically picking inventory into totes (If boxes are not used and totes are used in cart picking), in SCALE it is treated as picking into the final shipping container.
```

<a id="b00257"></a>
## b00257 — word/document\.xml/body/\*\[257\]

```text
		Transportation Execution is implemented for the supported services of UPS, USPS and FedEx.
```

<a id="b00258"></a>
## b00258 — word/document\.xml/body/\*\[258\]

```text
		Rate shopping is not leveraged and is out of the scope of this implementation. 
```

<a id="b00259"></a>
## b00259 — word/document\.xml/body/\*\[259\]

```text
		Location Check Digit is not leveraged for location verification. 
```

<a id="b00260"></a>
## b00260 — word/document\.xml/body/\*\[260\]

```text
		Host does not send a delete interface for deleting item master. The obsolete items are not marked as inactive either. Covetrus updates a user defined (consistent) field on the item to identify inactive/obsolete items. 
```

<a id="b00261"></a>
## b00261 — word/document\.xml/body/\*\[261\]

```text
		Reserve Rack locations will store ‘CS or ‘PL’  UOMs. The primary storage area has some locations that hold EA only. 
```

<a id="b00262"></a>
## b00262 — word/document\.xml/body/\*\[262\]

```text
		Some picking locations are unit of measure specific. For example, a CS only, or an EA only location. 
```

<a id="b00263"></a>
## b00263 — word/document\.xml/body/\*\[263\]

```text
		Receiving worksheets are utilized and system-generated LPN labels are used. 
```

<a id="b00264"></a>
## b00264 — word/document\.xml/body/\*\[264\]

```text
		Country of origin for an item is not tracked in SCALE, neither using the country-of-origin field, nor any other flag. 
```

<a id="b00265"></a>
## b00265 — word/document\.xml/body/\*\[265\]

```text
		Item price labels (Covetrus/Supplier SKU labels) are not printed in SCALE. 
```

<a id="b00266"></a>
## b00266 — word/document\.xml/body/\*\[266\]

```text
		Partial Pallets are manually received as base UOM conversion during check-in.
```

<a id="b00267"></a>
## b00267 — word/document\.xml/body/\*\[267\]

```text
		Systemic Outbound Value-Added Service (VAS) is used in this implementation. VAS is used for the pharmacy orders and mostly in DC 10 and 50. Containers are not 100% marked for VAS.
```

<a id="b00268"></a>
## b00268 — word/document\.xml/body/\*\[268\]

```text
		Systemic outbound QC is used in this implementation. QC workbench is used for a visual QC and most of the time, a force QC pass is used. Containers are not 100% marked for QC. 
```

<a id="b00269"></a>
## b00269 — word/document\.xml/body/\*\[269\]

```text
		Work Orders is out of scope of this implementation. 
```

<a id="b00270"></a>
## b00270 — word/document\.xml/body/\*\[270\]

```text
		Setting up labor management is in scope of this implementation. Covetrus does not use LM in the existing implementation. 
```

<a id="b00271"></a>
## b00271 — word/document\.xml/body/\*\[271\]

```text
		Covetrus migrates the existing ODWS to generic configs during the build phase. This is to establish an SOP where reliance on Manhattan cloud services to execute ODWS is alleviated. 
```

<a id="b00272"></a>
## b00272 — word/document\.xml/body/\*\[272\]

```text
		For the purposes of this document, a download is referred to as a file or information that is sent from a system and is processed by SCALE.
```

<a id="b00273"></a>
## b00273 — word/document\.xml/body/\*\[273\]

```text
		For purposes of this document, upload is referred to as a file generated by SCALE and made available to a different system. 
```

<a id="b00274"></a>
## b00274 — word/document\.xml/body/\*\[274\]

```text
		Screenshots are for illustrative purposes only and actual options can be configured.
```

<a id="b00275"></a>
## b00275 — word/document\.xml/body/\*\[275\]

```text
		Covetrus anticipates using item images in SCALE for the initial go-live.
```

<a id="b00276"></a>
## b00276 — word/document\.xml/body/\*\[276\]

```text
This document uses suggested naming conventions for configurations like locating rule names, zones, work type names, etc. Actual names may change during the configuration phase. 
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

```

<a id="b00284"></a>
## b00284 — word/document\.xml/body/\*\[284\]

```text

```

<a id="b00285"></a>
## b00285 — word/document\.xml/body/\*\[285\]

```text

```

<a id="b00286"></a>
## b00286 — word/document\.xml/body/\*\[286\]

```text

```

<a id="b00287"></a>
## b00287 — word/document\.xml/body/\*\[287\]

```text

```

<a id="b00288"></a>
## b00288 — word/document\.xml/body/\*\[288\]

```text

```

<a id="b00289"></a>
## b00289 — word/document\.xml/body/\*\[289\]

```text

```

<a id="b00290"></a>
## b00290 — word/document\.xml/body/\*\[290\]

```text

```

<a id="b00291"></a>
## b00291 — word/document\.xml/body/\*\[291\]

```text

```

<a id="b00292"></a>
## b00292 — word/document\.xml/body/\*\[292\]

```text

```

<a id="b00293"></a>
## b00293 — word/document\.xml/body/\*\[293\]

```text

```

<a id="b00294"></a>
## b00294 — word/document\.xml/body/\*\[294\]

```text

```

<a id="b00295"></a>
## b00295 — word/document\.xml/body/\*\[295\]

```text

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

```

<a id="b00299"></a>
## b00299 — word/document\.xml/body/\*\[299\]

```text
TERMINOLOGY
```

<a id="b00300"></a>
## b00300 — word/document\.xml/body/\*\[300\]

```text

```

<a id="b00301"></a>
## b00301 — word/document\.xml/body/\*\[301\]

```text
		Client Terminology			MA Terminology			Definition
		WMS			SCALE			Supply Chain Architected for Logistics Execution warehouse management.
		EDI/System21			HOST / ERP			Covetrus’ ERP system integrating with Scale – System 21 (Or Stiebo)
		Item / legend (needing license) 			Item			Item Identifier for regular inventory. For Covetrus, this is item code, style, color, and size.
		GTIN			Item cross reference			Global Trade Item Number. Definition of an SKU in a specific Unit of Measurement (UoM).
		Purchase order / Receipts			Receipts			Goods purchased by Covetrus.  Purchase orders and receipts have a 1:M mapping. SCALE maintains these as receipts with PO interfaced on receipt header.
		trailer id (in bound)			Trailer id			A container or truck being received into the DC. One inbound trailer has one receipt.
		track & trace item			Item			Items needing tracking and traceability in SCALE for the source and valid paperwork.
		order			Shipment			Goods to be shipped to stores, wholesale customers, or retail supermarkets. the order in ERP and shipment in scale will be a 1:1 mapping.
		wave			Wave			A wave represents the different steps that the system uses to retrieve orders from the pool, and process them into the outbound portion of SCALE
		run wave			run wave			a group of orders when processed resulting in inventory allocation 
		pool			pool			Any orders pending processing to be shipped immediately after interface to SCALE
		Pick Task	Work instruction			Transaction tracked by SCALE to coordinate the movement of inventory for a variety of warehouse processes. A group of work instruction is work unit
		Carton / Case			Shipping Container
		
					An object that can be used to hold or transport inventory for a shipment. 
		
		Carton / Case (inbound)			Receiving Container			An object that can be used to hold or transport inventory for a receipt. 
		LPN 			Logistics Unit			An object that can be used to hold or transport inventory. When nested, the tree unit is referred to as the parent logistics unit. 
					P&D			Pick up and Drop location
		ODWS			ODWS			Override Data Wave Step. SCALE provides a wave step that allows performing crud operation to data during the wave process.
		EXIT Point			EXIT Point			An external process that performs logic in line with the base process. Used to update data or perform additional logic.
```

<a id="b00302"></a>
## b00302 — word/document\.xml/body/\*\[302\]

```text
		
```

<a id="b00303"></a>
## b00303 — word/document\.xml/body/\*\[303\]

```text
		
```

<a id="b00304"></a>
## b00304 — word/document\.xml/body/\*\[304\]

```text
		UOM DEFINITION:
```

<a id="b00305"></a>
## b00305 — word/document\.xml/body/\*\[305\]

```text
		These are examples of a unit of measure definition displaying four UOMs and their respective representation to the other UOMs. This is not the baseline unit of measures.
```

<a id="b00306"></a>
## b00306 — word/document\.xml/body/\*\[306\]

```text

```

<a id="b00307"></a>
## b00307 — word/document\.xml/body/\*\[307\]

```text
Figure  – Unit of Measure	
```

<a id="b00308"></a>
## b00308 — word/document\.xml/body/\*\[308\]

```text

```

<a id="b00309"></a>
## b00309 — word/document\.xml/body/\*\[309\]

```text

```

<a id="b00310"></a>
## b00310 — word/document\.xml/body/\*\[310\]

```text

```

<a id="b00311"></a>
## b00311 — word/document\.xml/body/\*\[311\]

```text

```

<a id="b00312"></a>
## b00312 — word/document\.xml/body/\*\[312\]

```text

```

<a id="b00313"></a>
## b00313 — word/document\.xml/body/\*\[313\]

```text

```

<a id="b00314"></a>
## b00314 — word/document\.xml/body/\*\[314\]

```text

```

<a id="b00315"></a>
## b00315 — word/document\.xml/body/\*\[315\]

```text

```

<a id="b00316"></a>
## b00316 — word/document\.xml/body/\*\[316\]

```text

```

<a id="b00317"></a>
## b00317 — word/document\.xml/body/\*\[317\]

```text

```

<a id="b00318"></a>
## b00318 — word/document\.xml/body/\*\[318\]

```text

```

<a id="b00319"></a>
## b00319 — word/document\.xml/body/\*\[319\]

```text

```

<a id="b00320"></a>
## b00320 — word/document\.xml/body/\*\[320\]

```text

```

<a id="b00321"></a>
## b00321 — word/document\.xml/body/\*\[321\]

```text
I. INTERFACES
```

<a id="b00322"></a>
## b00322 — word/document\.xml/body/\*\[322\]

```text

```

<a id="b00323"></a>
## b00323 — word/document\.xml/body/\*\[323\]

```text
	SCALE provides multiple formats for the movement of data, including XML, fixed or delimited files, and web service calls. The host system downloads and uploads information into/from SCALE using any of these modes.
```

<a id="b00324"></a>
## b00324 — word/document\.xml/body/\*\[324\]

```text
	    
```

<a id="b00325"></a>
## b00325 — word/document\.xml/body/\*\[325\]

```text
For example, if using the XML mode, it allows the host system to create XML files with key information for downloads, and SCALE reads this key information to download the information into the SCALE tables. This method also allows the host to read key information from SCALE’s interface upload files.  
```

<a id="b00326"></a>
## b00326 — word/document\.xml/body/\*\[326\]

```text

```

<a id="b00327"></a>
## b00327 — word/document\.xml/body/\*\[327\]

```text
Covetrus uses XML interface mode to download information into SCALE. Upload from SCALE to Host is handled using XML file-based method of interfacing. Boomi is the middleware interface between System21 and SCALE. XML message format is used for two-way communication. Boomi uses API calls into SCALE to invoke interface downloads.
```

<a id="b00328"></a>
## b00328 — word/document\.xml/body/\*\[328\]

```text

```

<a id="b00329"></a>
## b00329 — word/document\.xml/body/\*\[329\]

```text
Each interface touchpoint between Host and SCALE below can be run manually as well as through scheduled jobs as defined by Covetrus. The timing and frequency of all downloads into SCALE are defaulted to the current settings, and are to be finalized during integration testing, along with the process and mechanism to do so (i.e., scheduled jobs or on-demand options).  The upload schedule (i.e., scheduled jobs, on-demand options) out of SCALE also is defaulted to current settings and needs to be finalized during integration testing.
```

<a id="b00330"></a>
## b00330 — word/document\.xml/body/\*\[330\]

```text

```

<a id="b00331"></a>
## b00331 — word/document\.xml/body/\*\[331\]

```text
Warehouse notifications can be configured to notify operations/IT/desired user(s) when a download or upload interface has failed for any reason.	
```

<a id="b00332"></a>
## b00332 — word/document\.xml/body/\*\[332\]

```text

```

<a id="b00333"></a>
## b00333 — word/document\.xml/body/\*\[333\]

```text
HOST &	 SCALE
```

<a id="b00334"></a>
## b00334 — word/document\.xml/body/\*\[334\]

```text

```

<a id="b00335"></a>
## b00335 — word/document\.xml/body/\*\[335\]

```text
Host and SCALE communicate as defined below.
```

<a id="b00336"></a>
## b00336 — word/document\.xml/body/\*\[336\]

```text

```

<a id="b00337"></a>
## b00337 — word/document\.xml/body/\*\[337\]

```text
			 	DOWNLOAD FROM HOST TO SCALE
```

<a id="b00338"></a>
## b00338 — word/document\.xml/body/\*\[338\]

```text

```

<a id="b00339"></a>
## b00339 — word/document\.xml/body/\*\[339\]

```text

```

<a id="b00340"></a>
## b00340 — word/document\.xml/body/\*\[340\]

```text
Figure – Interface Download
```

<a id="b00341"></a>
## b00341 — word/document\.xml/body/\*\[341\]

```text
		Item Master 
```

<a id="b00342"></a>
## b00342 — word/document\.xml/body/\*\[342\]

```text

```

<a id="b00343"></a>
## b00343 — word/document\.xml/body/\*\[343\]

```text
The item master file is maintained within the Host. Conversion quantities, weights, and dimensions are also maintained through this Item Master Download as those pieces of information are available in the Host. The host system downloads a record into the SCALE Item Master when an item is modified or created. If an item already exists in the Item Master, then the record is flagged as a change, and SCALE updates the existing item with the latest information bridged from the host. Key pieces of information include (but are not limited to) the following:
```

<a id="b00344"></a>
## b00344 — word/document\.xml/body/\*\[344\]

```text

```

<a id="b00345"></a>
## b00345 — word/document\.xml/body/\*\[345\]

```text
Item Master Level: 
```

<a id="b00346"></a>
## b00346 — word/document\.xml/body/\*\[346\]

```text
Item (SKU)
```

<a id="b00347"></a>
## b00347 — word/document\.xml/body/\*\[347\]

```text
Description
```

<a id="b00348"></a>
## b00348 — word/document\.xml/body/\*\[348\]

```text
Company
```

<a id="b00349"></a>
## b00349 — word/document\.xml/body/\*\[349\]

```text
Value
```

<a id="b00350"></a>
## b00350 — word/document\.xml/body/\*\[350\]

```text
Cross Reference
```

<a id="b00351"></a>
## b00351 — word/document\.xml/body/\*\[351\]

```text
Item Categories
```

<a id="b00352"></a>
## b00352 — word/document\.xml/body/\*\[352\]

```text
Item Class
```

<a id="b00353"></a>
## b00353 — word/document\.xml/body/\*\[353\]

```text
Packing Class
```

<a id="b00354"></a>
## b00354 — word/document\.xml/body/\*\[354\]

```text
Lot tracking flag
```

<a id="b00355"></a>
## b00355 — word/document\.xml/body/\*\[355\]

```text
Hazmat 
```

<a id="b00356"></a>
## b00356 — word/document\.xml/body/\*\[356\]

```text
Item Unit of Measure Level: 
```

<a id="b00357"></a>
## b00357 — word/document\.xml/body/\*\[357\]

```text
Item Dimensions
```

<a id="b00358"></a>
## b00358 — word/document\.xml/body/\*\[358\]

```text
Item Weight
```

<a id="b00359"></a>
## b00359 — word/document\.xml/body/\*\[359\]

```text
Case-Pack Conversion Qty
```

<a id="b00360"></a>
## b00360 — word/document\.xml/body/\*\[360\]

```text
Case-Pack Dimensions
```

<a id="b00361"></a>
## b00361 — word/document\.xml/body/\*\[361\]

```text
Case-Pack Weight
```

<a id="b00362"></a>
## b00362 — word/document\.xml/body/\*\[362\]

```text
Oversized (Cannot be shipped parcel)
```

<a id="b00363"></a>
## b00363 — word/document\.xml/body/\*\[363\]

```text

```

<a id="b00364"></a>
## b00364 — word/document\.xml/body/\*\[364\]

```text
		
```

<a id="b00365"></a>
## b00365 — word/document\.xml/body/\*\[365\]

```text
		Covetrus maintains a movement class for an item to classify fast movers or slow-moving items. Manhattan Associates recommends this to be at the unit of measure level and leverage the movement class analysis to slot the product accordingly. 
```

<a id="b00366"></a>
## b00366 — word/document\.xml/body/\*\[366\]

```text
		
```

<a id="b00367"></a>
## b00367 — word/document\.xml/body/\*\[367\]

```text
		Purchase Orders
```

<a id="b00368"></a>
## b00368 — word/document\.xml/body/\*\[368\]

```text

```

<a id="b00369"></a>
## b00369 — word/document\.xml/body/\*\[369\]

```text
Purchase Orders are not interfaced or maintained in SCALE. 
```

<a id="b00370"></a>
## b00370 — word/document\.xml/body/\*\[370\]

```text
				
```

<a id="b00371"></a>
## b00371 — word/document\.xml/body/\*\[371\]

```text
		Receipts
```

<a id="b00372"></a>
## b00372 — word/document\.xml/body/\*\[372\]

```text

```

<a id="b00373"></a>
## b00373 — word/document\.xml/body/\*\[373\]

```text
Receipt information is interfaced to SCALE. These are created as Purchase Orders in the Host and interfaced as ‘Receipts’ in SCALE. There is a 1:M relation between purchase orders and receipts. These files are sent in advance of the actual receipt.  The information downloaded to SCALE from the Host contains header and detail-level information. Covetrus does not interface container-level information though the functionality is available in SCALE. Key pieces of receipt information include (but are not limited to) the following:
```

<a id="b00374"></a>
## b00374 — word/document\.xml/body/\*\[374\]

```text

```

<a id="b00375"></a>
## b00375 — word/document\.xml/body/\*\[375\]

```text
Header level information: 
```

<a id="b00376"></a>
## b00376 — word/document\.xml/body/\*\[376\]

```text
Receipt ID
```

<a id="b00377"></a>
## b00377 — word/document\.xml/body/\*\[377\]

```text
Purchase Order ID
```

<a id="b00378"></a>
## b00378 — word/document\.xml/body/\*\[378\]

```text
Receipt Type (Example: Vendor, DRP, RA, ASN)
```

<a id="b00379"></a>
## b00379 — word/document\.xml/body/\*\[379\]

```text
Receipt ID Type (Example:)
```

<a id="b00380"></a>
## b00380 — word/document\.xml/body/\*\[380\]

```text
Source/Vendor Information
```

<a id="b00381"></a>
## b00381 — word/document\.xml/body/\*\[381\]

```text
International or National Identifier
```

<a id="b00382"></a>
## b00382 — word/document\.xml/body/\*\[382\]

```text
Detail level information
```

<a id="b00383"></a>
## b00383 — word/document\.xml/body/\*\[383\]

```text
Item #
```

<a id="b00384"></a>
## b00384 — word/document\.xml/body/\*\[384\]

```text
UOM (lowest)
```

<a id="b00385"></a>
## b00385 — word/document\.xml/body/\*\[385\]

```text
Quantity Ordered/Requested
```

<a id="b00386"></a>
## b00386 — word/document\.xml/body/\*\[386\]

```text
Order Line #
```

<a id="b00387"></a>
## b00387 — word/document\.xml/body/\*\[387\]

```text

```

<a id="b00388"></a>
## b00388 — word/document\.xml/body/\*\[388\]

```text

```

<a id="b00389"></a>
## b00389 — word/document\.xml/body/\*\[389\]

```text

```

<a id="b00390"></a>
## b00390 — word/document\.xml/body/\*\[390\]

```text
		Returns 
```

<a id="b00391"></a>
## b00391 — word/document\.xml/body/\*\[391\]

```text

```

<a id="b00392"></a>
## b00392 — word/document\.xml/body/\*\[392\]

```text
All DCs for Covetrus processes and receives returns. Fort Worth is a customer return site and process most returns. 
```

<a id="b00393"></a>
## b00393 — word/document\.xml/body/\*\[393\]

```text

```

<a id="b00394"></a>
## b00394 — word/document\.xml/body/\*\[394\]

```text
Returns Authorizations (RA) are used to receive merchandise into the warehouse that has been returned or refused by the customer. RMA is processed as a receipt in SCALE. Host downloads the RMA into SCALE with a Returns Receipt Type, and the warehouse receives it following a similar process as receiving. 
```

<a id="b00395"></a>
## b00395 — word/document\.xml/body/\*\[395\]

```text

```

<a id="b00396"></a>
## b00396 — word/document\.xml/body/\*\[396\]

```text
Redelivery is attempted for new BOL. Shipment is not broken down and received into stock. 
```

<a id="b00397"></a>
## b00397 — word/document\.xml/body/\*\[397\]

```text

```

<a id="b00398"></a>
## b00398 — word/document\.xml/body/\*\[398\]

```text
Configuration Note: Although SCALE can use ‘Receipt from Shipment’ functionality, in that a Return is created as a receipt from a shipment that has been previously shipped out of SCALE. The ‘Receipt from Shipment’ functionality is not leveraged, as the host needs to control the creation and reconciliation of the RA. 
```

<a id="b00399"></a>
## b00399 — word/document\.xml/body/\*\[399\]

```text

```

<a id="b00400"></a>
## b00400 — word/document\.xml/body/\*\[400\]

```text

```

<a id="b00401"></a>
## b00401 — word/document\.xml/body/\*\[401\]

```text
		Shipments 
```

<a id="b00402"></a>
## b00402 — word/document\.xml/body/\*\[402\]

```text

```

<a id="b00403"></a>
## b00403 — word/document\.xml/body/\*\[403\]

```text
Sales orders are created in the Host and information is interfaced to SCALE for Sales Orders on a random basis as shipments. These files are sent in advance of the actual required ship date, though can be interfaced the same day. The information downloaded to SCALE from Host contains header & detail level information.  Key pieces of that information include (but are not limited to) the following:
```

<a id="b00404"></a>
## b00404 — word/document\.xml/body/\*\[404\]

```text

```

<a id="b00405"></a>
## b00405 — word/document\.xml/body/\*\[405\]

```text
Header level information:
```

<a id="b00406"></a>
## b00406 — word/document\.xml/body/\*\[406\]

```text
Shipment ID # = Delivery #
```

<a id="b00407"></a>
## b00407 — word/document\.xml/body/\*\[407\]

```text
Carrier Information 
```

<a id="b00408"></a>
## b00408 — word/document\.xml/body/\*\[408\]

```text
Ship To Information (Name and Address of the customer)
```

<a id="b00409"></a>
## b00409 — word/document\.xml/body/\*\[409\]

```text
Date Information (i.e., Ship Date, Delivery Date)
```

<a id="b00410"></a>
## b00410 — word/document\.xml/body/\*\[410\]

```text
Customer Info
```

<a id="b00411"></a>
## b00411 — word/document\.xml/body/\*\[411\]

```text
Customer PO
```

<a id="b00412"></a>
## b00412 — word/document\.xml/body/\*\[412\]

```text
Order Type (For example: DC Order, Parcel, Sample)
```

<a id="b00413"></a>
## b00413 — word/document\.xml/body/\*\[413\]

```text
Route
```

<a id="b00414"></a>
## b00414 — word/document\.xml/body/\*\[414\]

```text
Carrier
```

<a id="b00415"></a>
## b00415 — word/document\.xml/body/\*\[415\]

```text
Detail level information:
```

<a id="b00416"></a>
## b00416 — word/document\.xml/body/\*\[416\]

```text
Item #
```

<a id="b00417"></a>
## b00417 — word/document\.xml/body/\*\[417\]

```text
Description
```

<a id="b00418"></a>
## b00418 — word/document\.xml/body/\*\[418\]

```text
Quantity Ordered 
```

<a id="b00419"></a>
## b00419 — word/document\.xml/body/\*\[419\]

```text
Order Line #
```

<a id="b00420"></a>
## b00420 — word/document\.xml/body/\*\[420\]

```text
Order Comments (Optional)
```

<a id="b00421"></a>
## b00421 — word/document\.xml/body/\*\[421\]

```text

```

<a id="b00422"></a>
## b00422 — word/document\.xml/body/\*\[422\]

```text
		Note:  Covetrus interfaces orders randomly into SCALE. 
```

<a id="b00423"></a>
## b00423 — word/document\.xml/body/\*\[423\]

```text

```

<a id="b00424"></a>
## b00424 — word/document\.xml/body/\*\[424\]

```text
Until a shipment has been waved, SCALE can process updates and deletes from the Host against the shipment.  
```

<a id="b00425"></a>
## b00425 — word/document\.xml/body/\*\[425\]

```text

```

<a id="b00426"></a>
## b00426 — word/document\.xml/body/\*\[426\]

```text
		Bill of Materials
```

<a id="b00427"></a>
## b00427 — word/document\.xml/body/\*\[427\]

```text

```

<a id="b00428"></a>
## b00428 — word/document\.xml/body/\*\[428\]

```text
Bill of Materials is out of scope of this implementation. 
```

<a id="b00429"></a>
## b00429 — word/document\.xml/body/\*\[429\]

```text
		
```

<a id="b00430"></a>
## b00430 — word/document\.xml/body/\*\[430\]

```text
		Work Orders
```

<a id="b00431"></a>
## b00431 — word/document\.xml/body/\*\[431\]

```text

```

<a id="b00432"></a>
## b00432 — word/document\.xml/body/\*\[432\]

```text
Work Orders is out of scope of this implementation. 
```

<a id="b00433"></a>
## b00433 — word/document\.xml/body/\*\[433\]

```text

```

<a id="b00434"></a>
## b00434 — word/document\.xml/body/\*\[434\]

```text
		   UPLOAD FROM SCALE TO HOST
```

<a id="b00435"></a>
## b00435 — word/document\.xml/body/\*\[435\]

```text

```

<a id="b00436"></a>
## b00436 — word/document\.xml/body/\*\[436\]

```text

```

<a id="b00437"></a>
## b00437 — word/document\.xml/body/\*\[437\]

```text
Figure – Interface Upload
```

<a id="b00438"></a>
## b00438 — word/document\.xml/body/\*\[438\]

```text
		
```

<a id="b00439"></a>
## b00439 — word/document\.xml/body/\*\[439\]

```text
		
```

<a id="b00440"></a>
## b00440 — word/document\.xml/body/\*\[440\]

```text
		Receipt Confirmation
```

<a id="b00441"></a>
## b00441 — word/document\.xml/body/\*\[441\]

```text

```

<a id="b00442"></a>
## b00442 — word/document\.xml/body/\*\[442\]

```text
The Interface Data option creates the receipt upload records from SCALE for all receipt containers that have reached the status ‘Closed’ or have been closed manually. The receipt upload records are the output of the receiving and putaway processes within SCALE. The upload includes the receipt header, receipt detail, and receipt container. The interface sends information to the Host identifying a subset of inventory to be allocable. 
```

<a id="b00443"></a>
## b00443 — word/document\.xml/body/\*\[443\]

```text

```

<a id="b00444"></a>
## b00444 — word/document\.xml/body/\*\[444\]

```text
Covetrus uploads this information when a container has been put away into the inventory. 
```

<a id="b00445"></a>
## b00445 — word/document\.xml/body/\*\[445\]

```text

```

<a id="b00446"></a>
## b00446 — word/document\.xml/body/\*\[446\]

```text
Config Note: Upload Receipt Containers at This Status or Higher is be set to ‘Closed’. Receiving Upload Level is set to ‘Container’. This is a global setting for all receipt types. 
```

<a id="b00447"></a>
## b00447 — word/document\.xml/body/\*\[447\]

```text

```

<a id="b00448"></a>
## b00448 — word/document\.xml/body/\*\[448\]

```text

```

<a id="b00449"></a>
## b00449 — word/document\.xml/body/\*\[449\]

```text
		Shipment Confirmation
```

<a id="b00450"></a>
## b00450 — word/document\.xml/body/\*\[450\]

```text

```

<a id="b00451"></a>
## b00451 — word/document\.xml/body/\*\[451\]

```text
The Interface Data option creates the shipment upload records from SCALE for all shipments that have reached the status ‘Closed’ (Shipment’s load has been closed).
```

<a id="b00452"></a>
## b00452 — word/document\.xml/body/\*\[452\]

```text

```

<a id="b00453"></a>
## b00453 — word/document\.xml/body/\*\[453\]

```text
The shipment upload files are the output of the outbound process within SCALE and are generated after the load confirmation process is executed. The upload includes the shipment header, shipment detail, shipment comment, and shipping container.
```

<a id="b00454"></a>
## b00454 — word/document\.xml/body/\*\[454\]

```text

```

<a id="b00455"></a>
## b00455 — word/document\.xml/body/\*\[455\]

```text
Development and Integration Note: Covetrus enhances the diagnostics app to develop an API to retrigger the shipment upload interface. 
```

<a id="b00456"></a>
## b00456 — word/document\.xml/body/\*\[456\]

```text

```

<a id="b00457"></a>
## b00457 — word/document\.xml/body/\*\[457\]

```text
		Container Close 
```

<a id="b00458"></a>
## b00458 — word/document\.xml/body/\*\[458\]

```text

```

<a id="b00459"></a>
## b00459 — word/document\.xml/body/\*\[459\]

```text
SCALE generates the shipment upload interface data to generate the invoice from System 21 upon last close containers for the eligible shipment. [EX11 – Invoice in the box]
```

<a id="b00460"></a>
## b00460 — word/document\.xml/body/\*\[460\]

```text

```

<a id="b00461"></a>
## b00461 — word/document\.xml/body/\*\[461\]

```text
		Inventory Transactions
```

<a id="b00462"></a>
## b00462 — word/document\.xml/body/\*\[462\]

```text

```

<a id="b00463"></a>
## b00463 — word/document\.xml/body/\*\[463\]

```text
SCALE maintains four-wall inventory at a detailed level and can communicate any changes in inventory levels to Host through the Inventory Transactions Interface.  All inventory adjustments and status changes are eligible to be uploaded to the Host system.
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
		Item Balance
```

<a id="b00467"></a>
## b00467 — word/document\.xml/body/\*\[467\]

```text

```

<a id="b00468"></a>
## b00468 — word/document\.xml/body/\*\[468\]

```text
The total on-hand inventory for a given item and inventory status can be uploaded to the Host system on-demand through the Interface Data option in SCALE, or on a scheduled basis as configured in the Scheduled Job option. Covetrus generates the item balance from SCALE on a nightly basis for the initial Go Live. Over time, Covetrus will monitor and may change the timing as needed. Covetrus has a manual SOP to review the SCALE item balance report and reconcile it with the host inventory.
```

<a id="b00469"></a>
## b00469 — word/document\.xml/body/\*\[469\]

```text

```

<a id="b00470"></a>
## b00470 — word/document\.xml/body/\*\[470\]

```text
Config Note: Include 0 inventory items in item balance upload is set to ‘No’. Item balance does not include inventory from receiving dock locations.
```

<a id="b00471"></a>
## b00471 — word/document\.xml/body/\*\[471\]

```text

```

<a id="b00472"></a>
## b00472 — word/document\.xml/body/\*\[472\]

```text
Interface Note: Existing interface mapping is assumed to be used. If any changes are identified, the same will be documented in the interface mapping document. 
```

<a id="b00473"></a>
## b00473 — word/document\.xml/body/\*\[473\]

```text

```

<a id="b00474"></a>
## b00474 — word/document\.xml/body/\*\[474\]

```text
II.	INBOUND
```

<a id="b00475"></a>
## b00475 — word/document\.xml/body/\*\[475\]

```text

```

<a id="b00476"></a>
## b00476 — word/document\.xml/body/\*\[476\]

```text
Covetrus has the following inbound flows:
```

<a id="b00477"></a>
## b00477 — word/document\.xml/body/\*\[477\]

```text
Receipts for Vendor POs – Domestic or International. All interfaced into SCALE
```

<a id="b00478"></a>
## b00478 — word/document\.xml/body/\*\[478\]

```text
Receipts for shipments from NDSC – (DRP -  between any 2 DCs, primarily NDSC1&2 to FDCs)
```

<a id="b00479"></a>
## b00479 — word/document\.xml/body/\*\[479\]

```text
Returns
```

<a id="b00480"></a>
## b00480 — word/document\.xml/body/\*\[480\]

```text
ASN = has lot and expiration date interfaced. Receipt container is not interfaced
```

<a id="b00481"></a>
## b00481 — word/document\.xml/body/\*\[481\]

```text

```

<a id="b00482"></a>
## b00482 — word/document\.xml/body/\*\[482\]

```text

```

<a id="b00483"></a>
## b00483 — word/document\.xml/body/\*\[483\]

```text
Inbound Flow Name	Key Flow steps
Receipts for Vendor POs	PO: Receipt = 1:M in Host
Receipts are always interfaced with PO # on the header
Systemic Receiving workflows
Single receiving preference
Header Item Workflows
After unloading goods, QC is done, and systemic receiving executed
Receipts for shipments from NDSC 	Company transfers from NDSC to DC
Same as PO flow above
Returns  	RMA: Receipt = 1:1 in Host
Receipts are always interfaced
Systemic Receiving workflows

```

<a id="b00484"></a>
## b00484 — word/document\.xml/body/\*\[484\]

```text

```

<a id="b00485"></a>
## b00485 — word/document\.xml/body/\*\[485\]

```text

```

<a id="b00486"></a>
## b00486 — word/document\.xml/body/\*\[486\]

```text

```

<a id="b00487"></a>
## b00487 — word/document\.xml/body/\*\[487\]

```text
PRE-RECEIVING
```

<a id="b00488"></a>
## b00488 — word/document\.xml/body/\*\[488\]

```text
		
```

<a id="b00489"></a>
## b00489 — word/document\.xml/body/\*\[489\]

```text
		Receipt Creation
```

<a id="b00490"></a>
## b00490 — word/document\.xml/body/\*\[490\]

```text

```

<a id="b00491"></a>
## b00491 — word/document\.xml/body/\*\[491\]

```text
Interface 
```

<a id="b00492"></a>
## b00492 — word/document\.xml/body/\*\[492\]

```text

```

<a id="b00493"></a>
## b00493 — word/document\.xml/body/\*\[493\]

```text
Host produces receipt download records as XML files stored in SCALE storage blob. These records are then processed and validated through the SCALE interface to ensure the data format is correct.
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
		
```

<a id="b00497"></a>
## b00497 — word/document\.xml/body/\*\[497\]

```text
		
```

<a id="b00498"></a>
## b00498 — word/document\.xml/body/\*\[498\]

```text
Receipt ID Types
```

<a id="b00499"></a>
## b00499 — word/document\.xml/body/\*\[499\]

```text

```

<a id="b00500"></a>
## b00500 — word/document\.xml/body/\*\[500\]

```text
To group receipts from SCALE screens and to drive processing rules, it is helpful for SCALE to store different Receipt ID Types and Receipt Types.
```

<a id="b00501"></a>
## b00501 — word/document\.xml/body/\*\[501\]

```text

```

<a id="b00502"></a>
## b00502 — word/document\.xml/body/\*\[502\]

```text
The following list of Receipt ID Types is configured in the system: 
```

<a id="b00503"></a>
## b00503 — word/document\.xml/body/\*\[503\]

```text

```

<a id="b00504"></a>
## b00504 — word/document\.xml/body/\*\[504\]

```text
	Receipt ID Type		Description		Interfaced
	Vendor		Vendor Shipped		Y
	Vendor Override 		Vendor Shipped Override		Y
	ASN		Includes lot and expiration date interfaced		Y
	ASN override		ASN override		Y
	RA		Return Authorization		Y
	DRP		Intercompany Transfers 		Y
```

<a id="b00505"></a>
## b00505 — word/document\.xml/body/\*\[505\]

```text

```

<a id="b00506"></a>
## b00506 — word/document\.xml/body/\*\[506\]

```text
Receipt type is a free format field on a receipt record. It is commonly used to identify what type of supplier sent the receipt, such as manufacturer, vendor, etc. The system does not validate this value. 
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
		Create Receipt from Purchase Order Insight
```

<a id="b00511"></a>
## b00511 — word/document\.xml/body/\*\[511\]

```text

```

<a id="b00512"></a>
## b00512 — word/document\.xml/body/\*\[512\]

```text
Covetrus does not create receipts manually from Purchase Order. 
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
		Create Receipt using Receipt Insight
```

<a id="b00516"></a>
## b00516 — word/document\.xml/body/\*\[516\]

```text

```

<a id="b00517"></a>
## b00517 — word/document\.xml/body/\*\[517\]

```text
Covetrus does not create receipts manually using Receipt Insight. screen.  
```

<a id="b00518"></a>
## b00518 — word/document\.xml/body/\*\[518\]

```text
		Create Receipt from Shipment
```

<a id="b00519"></a>
## b00519 — word/document\.xml/body/\*\[519\]

```text

```

<a id="b00520"></a>
## b00520 — word/document\.xml/body/\*\[520\]

```text
Covetrus does not create receipts from shipments.    
```

<a id="b00521"></a>
## b00521 — word/document\.xml/body/\*\[521\]

```text

```

<a id="b00522"></a>
## b00522 — word/document\.xml/body/\*\[522\]

```text
		Blind Receipts
```

<a id="b00523"></a>
## b00523 — word/document\.xml/body/\*\[523\]

```text

```

<a id="b00524"></a>
## b00524 — word/document\.xml/body/\*\[524\]

```text
Covetrus does not leverage blind receipts. 
```

<a id="b00525"></a>
## b00525 — word/document\.xml/body/\*\[525\]

```text

```

<a id="b00526"></a>
## b00526 — word/document\.xml/body/\*\[526\]

```text
		Editing Receipt Info in SCALE for DRP shipments.
```

<a id="b00527"></a>
## b00527 — word/document\.xml/body/\*\[527\]

```text

```

<a id="b00528"></a>
## b00528 — word/document\.xml/body/\*\[528\]

```text
For DRP orders, Covetrus receives 100% of the exact shipment physically. If the physical product unloaded from the trailer does not match the receipt detail, Covetrus uses a manual SOP to change the receipt header/detail in SCALE to match the physical product. For example, if the physical lot ID is different from the interfaced value, the receipt detail’s lot Id is updated. This allows systemic receiving in the DC. The changes are documented using an established internal SOP and Covetrus handles the interface discrepancy between the shipment and receipt using a SOP outside of SCALE. 
```

<a id="b00529"></a>
## b00529 — word/document\.xml/body/\*\[529\]

```text

```

<a id="b00530"></a>
## b00530 — word/document\.xml/body/\*\[530\]

```text
This process is eligible for non Track and Trace items only.  
```

<a id="b00531"></a>
## b00531 — word/document\.xml/body/\*\[531\]

```text

```

<a id="b00532"></a>
## b00532 — word/document\.xml/body/\*\[532\]

```text
		Viewing Receipts
```

<a id="b00533"></a>
## b00533 — word/document\.xml/body/\*\[533\]

```text

```

<a id="b00534"></a>
## b00534 — word/document\.xml/body/\*\[534\]

```text
All receipts that are downloaded or created in SCALE can be viewed from the Receiving Insight screens.  The lines can be viewed using Receipt Line Insight.  If ASNs are downloaded or created, they can be viewed using Receipt Container Insight. 
```

<a id="b00535"></a>
## b00535 — word/document\.xml/body/\*\[535\]

```text

```

<a id="b00536"></a>
## b00536 — word/document\.xml/body/\*\[536\]

```text
  
```

<a id="b00537"></a>
## b00537 — word/document\.xml/body/\*\[537\]

```text

```

<a id="b00538"></a>
## b00538 — word/document\.xml/body/\*\[538\]

```text
Figure – Receipt Insight
```

<a id="b00539"></a>
## b00539 — word/document\.xml/body/\*\[539\]

```text

```

<a id="b00540"></a>
## b00540 — word/document\.xml/body/\*\[540\]

```text

```

<a id="b00541"></a>
## b00541 — word/document\.xml/body/\*\[541\]

```text
Figure – Receipt Line Insight
```

<a id="b00542"></a>
## b00542 — word/document\.xml/body/\*\[542\]

```text

```

<a id="b00543"></a>
## b00543 — word/document\.xml/body/\*\[543\]

```text

```

<a id="b00544"></a>
## b00544 — word/document\.xml/body/\*\[544\]

```text
Figure – Receipt Container Insight
```

<a id="b00545"></a>
## b00545 — word/document\.xml/body/\*\[545\]

```text

```

<a id="b00546"></a>
## b00546 — word/document\.xml/body/\*\[546\]

```text
		Validating Receipts – Licensing check
```

<a id="b00547"></a>
## b00547 — word/document\.xml/body/\*\[547\]

```text

```

<a id="b00548"></a>
## b00548 — word/document\.xml/body/\*\[548\]

```text
Before printing and handing over the receiving paperwork to the clerks, Covetrus uses internal SOP to validate the supplier and product licensing to ensure that the receipt is legally valid to be received into the warehouse. 
```

<a id="b00549"></a>
## b00549 — word/document\.xml/body/\*\[549\]

```text
		
```

<a id="b00550"></a>
## b00550 — word/document\.xml/body/\*\[550\]

```text
		Generate Receiving Documents
```

<a id="b00551"></a>
## b00551 — word/document\.xml/body/\*\[551\]

```text

```

<a id="b00552"></a>
## b00552 — word/document\.xml/body/\*\[552\]

```text
Once a receipt has been created and validated, documents can be printed against it [EX24- RF Document Printer Assignment]. Covetrus prints the receiving Work sheet (DOC01) for all receiving flows. This document contains various data from the receipt that can be printed from SCALE by selecting a receipt from the Receipt Insight and choosing the Print Selected Documents option from Actions. The Receiving Worksheet is used to aid in the systematic receiving process and serves as a receiving journal after the receiving process.
```

<a id="b00553"></a>
## b00553 — word/document\.xml/body/\*\[553\]

```text

```

<a id="b00554"></a>
## b00554 — word/document\.xml/body/\*\[554\]

```text

```

<a id="b00555"></a>
## b00555 — word/document\.xml/body/\*\[555\]

```text

```

<a id="b00556"></a>
## b00556 — word/document\.xml/body/\*\[556\]

```text
Figure – Printing Receiving worksheet
```

<a id="b00557"></a>
## b00557 — word/document\.xml/body/\*\[557\]

```text

```

<a id="b00558"></a>
## b00558 — word/document\.xml/body/\*\[558\]

```text

```

<a id="b00559"></a>
## b00559 — word/document\.xml/body/\*\[559\]

```text

```

<a id="b00560"></a>
## b00560 — word/document\.xml/body/\*\[560\]

```text
Figure – Receiving work sheet sample
```

<a id="b00561"></a>
## b00561 — word/document\.xml/body/\*\[561\]

```text

```

<a id="b00562"></a>
## b00562 — word/document\.xml/body/\*\[562\]

```text
Covetrus uses site specific disposition codes and will review them during the build to reduce and standardize. 
```

<a id="b00563"></a>
## b00563 — word/document\.xml/body/\*\[563\]

```text

```

<a id="b00564"></a>
## b00564 — word/document\.xml/body/\*\[564\]

```text
The Receiving worksheet, packing slip, and/or the BOL are submitted to accounting after the receiving process for receipts. These documents are collectively called the ROG package.
```

<a id="b00565"></a>
## b00565 — word/document\.xml/body/\*\[565\]

```text

```

<a id="b00566"></a>
## b00566 — word/document\.xml/body/\*\[566\]

```text

```

<a id="b00567"></a>
## b00567 — word/document\.xml/body/\*\[567\]

```text

```

<a id="b00568"></a>
## b00568 — word/document\.xml/body/\*\[568\]

```text
APPOINTMENT SCHEDULING
```

<a id="b00569"></a>
## b00569 — word/document\.xml/body/\*\[569\]

```text
		
```

<a id="b00570"></a>
## b00570 — word/document\.xml/body/\*\[570\]

```text
		Operations
```

<a id="b00571"></a>
## b00571 — word/document\.xml/body/\*\[571\]

```text

```

<a id="b00572"></a>
## b00572 — word/document\.xml/body/\*\[572\]

```text
Covetrus handles inbound appointment scheduling currently outside of SCALE. With this implementation, Covetrus continues to handle the appointment scheduling outside of SCALE using project 44. Outbound appointment scheduling is not leveraged (not available in SCALE) and is out of the scope of this document.
```

<a id="b00573"></a>
## b00573 — word/document\.xml/body/\*\[573\]

```text

```

<a id="b00574"></a>
## b00574 — word/document\.xml/body/\*\[574\]

```text

```

<a id="b00575"></a>
## b00575 — word/document\.xml/body/\*\[575\]

```text
A typical workflow for using systemic appointment scheduling is listed here for reference if Covetrus wants to leverage it in the future. 
```

<a id="b00576"></a>
## b00576 — word/document\.xml/body/\*\[576\]

```text

```

<a id="b00577"></a>
## b00577 — word/document\.xml/body/\*\[577\]

```text
To better facilitate the receiving, Covetrus personnel may assign an appointment for the given receipt using the New Appointment function in the Receipt Insight screen option. This is documented for reference purposes in case appointment visibility is needed inside SCALE. This needs a receipt ID visibility in SCALE in advance. Users can then go back and view what receipts are scheduled for a given day by viewing the Appointments folder in the Receipt Insight. 
```

<a id="b00578"></a>
## b00578 — word/document\.xml/body/\*\[578\]

```text

```

<a id="b00579"></a>
## b00579 — word/document\.xml/body/\*\[579\]

```text

```

<a id="b00580"></a>
## b00580 — word/document\.xml/body/\*\[580\]

```text
Figure – Appointment Schedule Window
```

<a id="b00581"></a>
## b00581 — word/document\.xml/body/\*\[581\]

```text

```

<a id="b00582"></a>
## b00582 — word/document\.xml/body/\*\[582\]

```text
This allows for enhanced management of dock door locations, as well as the personnel required to unload the trailers at the dock. Users may enter the following information when scheduling an inbound appointment: 
```

<a id="b00583"></a>
## b00583 — word/document\.xml/body/\*\[583\]

```text

```

<a id="b00584"></a>
## b00584 — word/document\.xml/body/\*\[584\]

```text
Trailer ID
```

<a id="b00585"></a>
## b00585 — word/document\.xml/body/\*\[585\]

```text
Dock Door
```

<a id="b00586"></a>
## b00586 — word/document\.xml/body/\*\[586\]

```text
Start Date/Time
```

<a id="b00587"></a>
## b00587 — word/document\.xml/body/\*\[587\]

```text
End Date/Time 
```

<a id="b00588"></a>
## b00588 — word/document\.xml/body/\*\[588\]

```text

```

<a id="b00589"></a>
## b00589 — word/document\.xml/body/\*\[589\]

```text
Note: Appointments can only be scheduled for open receipts in SCALE. Appointments can’t be created without associating a receipt with it.
```

<a id="b00590"></a>
## b00590 — word/document\.xml/body/\*\[590\]

```text

```

<a id="b00591"></a>
## b00591 — word/document\.xml/body/\*\[591\]

```text
A graphical calendar screen for managing inbound receipt appointments is also available. The screen shows activity for the day per dock door and allows the user to easily see and schedule open spots on the calendar. From this screen, the user can preview appointment details, schedule new appointments, change existing appointments, or delete appointments. 
```

<a id="b00592"></a>
## b00592 — word/document\.xml/body/\*\[592\]

```text
 
```

<a id="b00593"></a>
## b00593 — word/document\.xml/body/\*\[593\]

```text

```

<a id="b00594"></a>
## b00594 — word/document\.xml/body/\*\[594\]

```text
Figure – Receiving Appointment Schedule Window
```

<a id="b00595"></a>
## b00595 — word/document\.xml/body/\*\[595\]

```text
	
```

<a id="b00596"></a>
## b00596 — word/document\.xml/body/\*\[596\]

```text
UNLOADING
```

<a id="b00597"></a>
## b00597 — word/document\.xml/body/\*\[597\]

```text

```

<a id="b00598"></a>
## b00598 — word/document\.xml/body/\*\[598\]

```text
		Unloading Trailer
```

<a id="b00599"></a>
## b00599 — word/document\.xml/body/\*\[599\]

```text

```

<a id="b00600"></a>
## b00600 — word/document\.xml/body/\*\[600\]

```text
Upon the arrival of the truck and verification of the appointment schedule at the guard check, delivery documentation is obtained from the driver and matched to the corresponding receipts in SCALE. The delivery documentation includes a packing slip, BOL, Seal ID, and other information. Once it is verified that the receipt exists in SCALE, the truck is docked at the assigned door and items are unloaded from the truck to that pre-receiving dock area. For Covetrus, this area is the receiving dock.
```

<a id="b00601"></a>
## b00601 — word/document\.xml/body/\*\[601\]

```text

```

<a id="b00602"></a>
## b00602 — word/document\.xml/body/\*\[602\]

```text
Note: Seal id and Truck id is available as paperwork for the receipts. This information is not available in the interface. Covetrus manually updates this information on the receipt header. 
```

<a id="b00603"></a>
## b00603 — word/document\.xml/body/\*\[603\]

```text

```

<a id="b00604"></a>
## b00604 — word/document\.xml/body/\*\[604\]

```text
Some of the floor-loaded trailers may not have decent stacking/layering of the product. Multiple people may unload such trailers. The same item on the receipt may be present in the nose, mid, or tail of the truck and that leads to some single-item pallets taking more time to build before systemic check-in can begin.
```

<a id="b00605"></a>
## b00605 — word/document\.xml/body/\*\[605\]

```text

```

<a id="b00606"></a>
## b00606 — word/document\.xml/body/\*\[606\]

```text
At this point, a visual QC check is conducted outside of SCALE if required. Covetrus may perform a supplier compliance check outside of SCALE and leverage user-defined fields on the receipt header to capture compliance codes. This supplier compliance process is out of the scope of this implementation is not defined here. 
```

<a id="b00607"></a>
## b00607 — word/document\.xml/body/\*\[607\]

```text

```

<a id="b00608"></a>
## b00608 — word/document\.xml/body/\*\[608\]

```text
Once all items are unloaded and verified, the truck leaves the warehouse. If mixed item pallets are unloaded, they are broken into single item pallets. For lot tracked items, always, single item, single lot pallets are created. 
```

<a id="b00609"></a>
## b00609 — word/document\.xml/body/\*\[609\]

```text

```

<a id="b00610"></a>
## b00610 — word/document\.xml/body/\*\[610\]

```text
Tribal knowledge is leveraged at the DCs, for receipts by vendor, to decide using putaway groups or not. Since moving heavy items across pallets is labor intensive, the receiving clerks makes this decision during trailer unload. Manhattan recommends flagging heavy items on the receiving worksheet to provide visual aid to the clerk and users before unloading begins.  
```

<a id="b00611"></a>
## b00611 — word/document\.xml/body/\*\[611\]

```text

```

<a id="b00612"></a>
## b00612 — word/document\.xml/body/\*\[612\]

```text
.
```

<a id="b00613"></a>
## b00613 — word/document\.xml/body/\*\[613\]

```text

```

<a id="b00614"></a>
## b00614 — word/document\.xml/body/\*\[614\]

```text
QUALITY AUDIT
```

<a id="b00615"></a>
## b00615 — word/document\.xml/body/\*\[615\]

```text

```

<a id="b00616"></a>
## b00616 — word/document\.xml/body/\*\[616\]

```text
		Inbound Quality Control
```

<a id="b00617"></a>
## b00617 — word/document\.xml/body/\*\[617\]

```text

```

<a id="b00618"></a>
## b00618 — word/document\.xml/body/\*\[618\]

```text
Covetrus performs a visual QC as an SOP on the inbound products and receives as ‘damages’ if the QC standard is not met. Manhattan recommends listing the standards here. 
```

<a id="b00619"></a>
## b00619 — word/document\.xml/body/\*\[619\]

```text

```

<a id="b00620"></a>
## b00620 — word/document\.xml/body/\*\[620\]

```text

```

<a id="b00621"></a>
## b00621 — word/document\.xml/body/\*\[621\]

```text
RECEIVING / PALLETIZATION
```

<a id="b00622"></a>
## b00622 — word/document\.xml/body/\*\[622\]

```text

```

<a id="b00623"></a>
## b00623 — word/document\.xml/body/\*\[623\]

```text
		After unloading the truck and physically building the pallets if needed, and executing manual quality audit SOP, systematic receiving is then initiated via a check-in process. Checking In product is the process that creates the inventory inside of SCALE based on Receiving Preference of the user performing the action.
```

<a id="b00624"></a>
## b00624 — word/document\.xml/body/\*\[624\]

```text
				
```

<a id="b00625"></a>
## b00625 — word/document\.xml/body/\*\[625\]

```text
			
```

<a id="b00626"></a>
## b00626 — word/document\.xml/body/\*\[626\]

```text
		Item Receiving (Full or partial pallets)
```

<a id="b00627"></a>
## b00627 — word/document\.xml/body/\*\[627\]

```text

```

<a id="b00628"></a>
## b00628 — word/document\.xml/body/\*\[628\]

```text
Pallet level receiving is used for receiving single item, single lot pallets. The receiving clerk uses Receiving Worksheet (DOC01) to decide and use this receiving preference. These pallets may either be manually built pallets or pre-built pallets. 
```

<a id="b00629"></a>
## b00629 — word/document\.xml/body/\*\[629\]

```text

```

<a id="b00630"></a>
## b00630 — word/document\.xml/body/\*\[630\]

```text
The receiving preference is configured in SCALE as below:
```

<a id="b00631"></a>
## b00631 — word/document\.xml/body/\*\[631\]

```text

```

<a id="b00632"></a>
## b00632 — word/document\.xml/body/\*\[632\]

```text
Create Putaway Work: Yes
```

<a id="b00633"></a>
## b00633 — word/document\.xml/body/\*\[633\]

```text
Nest During Check In: No
```

<a id="b00634"></a>
## b00634 — word/document\.xml/body/\*\[634\]

```text
Disposition Code Required: No 
```

<a id="b00635"></a>
## b00635 — word/document\.xml/body/\*\[635\]

```text
License Plate Assignment: System
```

<a id="b00636"></a>
## b00636 — word/document\.xml/body/\*\[636\]

```text
RF Workflow: Header – Item 
```

<a id="b00637"></a>
## b00637 — word/document\.xml/body/\*\[637\]

```text
Execution Method: Check in and Locate (immediate)
```

<a id="b00638"></a>
## b00638 — word/document\.xml/body/\*\[638\]

```text
Container Locating Method: Parent
```

<a id="b00639"></a>
## b00639 — word/document\.xml/body/\*\[639\]

```text
Default Inventory Status – Available
```

<a id="b00640"></a>
## b00640 — word/document\.xml/body/\*\[640\]

```text

```

<a id="b00641"></a>
## b00641 — word/document\.xml/body/\*\[641\]

```text
The user selects Receiving option from Warehouse Mobile Main Menu. User selects the Item Level Receiving option. 
```

<a id="b00642"></a>
## b00642 — word/document\.xml/body/\*\[642\]

```text

```

<a id="b00643"></a>
## b00643 — word/document\.xml/body/\*\[643\]

```text
Once selected, the user scans: 
```

<a id="b00644"></a>
## b00644 — word/document\.xml/body/\*\[644\]

```text
Receipt ID (from Receiving work sheet DOC01)
```

<a id="b00645"></a>
## b00645 — word/document\.xml/body/\*\[645\]

```text
UPC on the product
```

<a id="b00646"></a>
## b00646 — word/document\.xml/body/\*\[646\]

```text
Quantity (Key in) in the applicable UoM. The lowest UoM will be always defaulted, and the user selects the UoM to receive.
```

<a id="b00647"></a>
## b00647 — word/document\.xml/body/\*\[647\]

```text

```

<a id="b00648"></a>
## b00648 — word/document\.xml/body/\*\[648\]

```text
After assigning a system-generated license plate number, the user either scans the Lot or keys in (if no barcode). [EX01 – Track and Trace], [EX03 – GS1 Label Processing], [EX21 – DSCSA Inbound Processing]
```

<a id="b00649"></a>
## b00649 — word/document\.xml/body/\*\[649\]

```text

```

<a id="b00650"></a>
## b00650 — word/document\.xml/body/\*\[650\]

```text
If the lot and expiration date are interfaced on the receipt detail, the information is prepopulated. 
```

<a id="b00651"></a>
## b00651 — word/document\.xml/body/\*\[651\]

```text

```

<a id="b00652"></a>
## b00652 — word/document\.xml/body/\*\[652\]

```text
At this time, SCALE locates the LPN and putaway work is created. Two copies of the receipt Container Label (LBL01) are printed to the user’s belt printer. One label is applied at the front bottom case of the pallet and the second is applied at the top (same face recommended). SCALE determines a putaway location based on the locating rule assigned during the Check-In process.
```

<a id="b00653"></a>
## b00653 — word/document\.xml/body/\*\[653\]

```text

```

<a id="b00654"></a>
## b00654 — word/document\.xml/body/\*\[654\]

```text
The system-generated label (LBL01) has flowing key information on it and is the same label currently used.
```

<a id="b00655"></a>
## b00655 — word/document\.xml/body/\*\[655\]

```text
License Plate #
```

<a id="b00656"></a>
## b00656 — word/document\.xml/body/\*\[656\]

```text
SKU (Item) (Not barcoded)
```

<a id="b00657"></a>
## b00657 — word/document\.xml/body/\*\[657\]

```text
Locating location (first five characters)
```

<a id="b00658"></a>
## b00658 — word/document\.xml/body/\*\[658\]

```text
Lot 
```

<a id="b00659"></a>
## b00659 — word/document\.xml/body/\*\[659\]

```text
Expiration Date
```

<a id="b00660"></a>
## b00660 — word/document\.xml/body/\*\[660\]

```text

```

<a id="b00661"></a>
## b00661 — word/document\.xml/body/\*\[661\]

```text
The user continues to receive the next item for the same receipt or exit the current receipt and start over with a new receipt ID. Exiting a receipt on the Warehouse Mobile does NOT close that receipt. Users can go back to that receipt at any point in time.    
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
Figure – Receiving Preference – Item level receiving
```

<a id="b00665"></a>
## b00665 — word/document\.xml/body/\*\[665\]

```text

```

<a id="b00666"></a>
## b00666 — word/document\.xml/body/\*\[666\]

```text

```

<a id="b00667"></a>
## b00667 — word/document\.xml/body/\*\[667\]

```text
Figure – Item level receiving – Scan Receipt
```

<a id="b00668"></a>
## b00668 — word/document\.xml/body/\*\[668\]

```text

```

<a id="b00669"></a>
## b00669 — word/document\.xml/body/\*\[669\]

```text

```

<a id="b00670"></a>
## b00670 — word/document\.xml/body/\*\[670\]

```text
Figure – Item level receiving – Scan UPC label
```

<a id="b00671"></a>
## b00671 — word/document\.xml/body/\*\[671\]

```text

```

<a id="b00672"></a>
## b00672 — word/document\.xml/body/\*\[672\]

```text
Figure – Item level receiving – Enter quantity
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
Figure – Item information when clicking the info icon
```

<a id="b00677"></a>
## b00677 — word/document\.xml/body/\*\[677\]

```text

```

<a id="b00678"></a>
## b00678 — word/document\.xml/body/\*\[678\]

```text
If the same item is on multiple receipt details for a different interfaced lot, a slider screen is presented on the warehouse mobile for the user to confirm the line (lot) being received. 
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
Figure – Slider when user is prompted for receipt line selection
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
Figure – WHM item image when information icon is clicked
```

<a id="b00686"></a>
## b00686 — word/document\.xml/body/\*\[686\]

```text
		Item Receiving with Putaway Groups
```

<a id="b00687"></a>
## b00687 — word/document\.xml/body/\*\[687\]

```text

```

<a id="b00688"></a>
## b00688 — word/document\.xml/body/\*\[688\]

```text
Covetrus uses Putaway Group Receiving receiving preference to receive small quantities of multiple SKUs and build a multi-SKU LPN and putaway.  The user receives items onto multi-item pallets for putaway.
```

<a id="b00689"></a>
## b00689 — word/document\.xml/body/\*\[689\]

```text

```

<a id="b00690"></a>
## b00690 — word/document\.xml/body/\*\[690\]

```text
Item Level Receiving with putaway groups is executed from the Warehouse mobile device. The user selects the Receiving option from the Main Menu.  The user selects Putaway Groups receiving preference.  
```

<a id="b00691"></a>
## b00691 — word/document\.xml/body/\*\[691\]

```text

```

<a id="b00692"></a>
## b00692 — word/document\.xml/body/\*\[692\]

```text
Once selected, the user scans: [EX01 – Track and Trace], [EX03 – GS1 Label Processing]
```

<a id="b00693"></a>
## b00693 — word/document\.xml/body/\*\[693\]

```text

```

<a id="b00694"></a>
## b00694 — word/document\.xml/body/\*\[694\]

```text
Receipt ID (from Receiving work sheet DOC01)
```

<a id="b00695"></a>
## b00695 — word/document\.xml/body/\*\[695\]

```text
Item (the product)
```

<a id="b00696"></a>
## b00696 — word/document\.xml/body/\*\[696\]

```text
Quantity (Key in) in lowest UoM
```

<a id="b00697"></a>
## b00697 — word/document\.xml/body/\*\[697\]

```text

```

<a id="b00698"></a>
## b00698 — word/document\.xml/body/\*\[698\]

```text

```

<a id="b00699"></a>
## b00699 — word/document\.xml/body/\*\[699\]

```text
DSCSA receiving does not leverage Putaway groups.
```

<a id="b00700"></a>
## b00700 — word/document\.xml/body/\*\[700\]

```text

```

<a id="b00701"></a>
## b00701 — word/document\.xml/body/\*\[701\]

```text
Users can also change the UOM that they are receiving. If there are no data issues, at this time SCALE performs locating and print receipt container label (LBL01). SCALE displays a putaway group (pallet/cart) the LPNs should be placed onto. These put away groups are configured per putaway zone.  This allows for the building of pallets for put away purposes. 
```

<a id="b00702"></a>
## b00702 — word/document\.xml/body/\*\[702\]

```text

```

<a id="b00703"></a>
## b00703 — word/document\.xml/body/\*\[703\]

```text
The user places the product onto the pallet/cart corresponding to the assigned put away group. If the pallet/cart is not full, the user hits the OK button and proceeds with receipt check-in of any remaining items. 
```

<a id="b00704"></a>
## b00704 — word/document\.xml/body/\*\[704\]

```text

```

<a id="b00705"></a>
## b00705 — word/document\.xml/body/\*\[705\]

```text

```

<a id="b00706"></a>
## b00706 — word/document\.xml/body/\*\[706\]

```text
Figure – Receipt container located and eligible for putaway group ID
```

<a id="b00707"></a>
## b00707 — word/document\.xml/body/\*\[707\]

```text

```

<a id="b00708"></a>
## b00708 — word/document\.xml/body/\*\[708\]

```text

```

<a id="b00709"></a>
## b00709 — word/document\.xml/body/\*\[709\]

```text
Figure – Assign a  putaway group
```

<a id="b00710"></a>
## b00710 — word/document\.xml/body/\*\[710\]

```text

```

<a id="b00711"></a>
## b00711 — word/document\.xml/body/\*\[711\]

```text
If the pallet/cart is full, the user goes to the Close Putaway Group option in warehouse mobile and hits the OK/Close button. After this is complete, SCALE creates the putaway task for the putaway group.
```

<a id="b00712"></a>
## b00712 — word/document\.xml/body/\*\[712\]

```text

```

<a id="b00713"></a>
## b00713 — word/document\.xml/body/\*\[713\]

```text

```

<a id="b00714"></a>
## b00714 — word/document\.xml/body/\*\[714\]

```text
Figure – Close a  putaway group
```

<a id="b00715"></a>
## b00715 — word/document\.xml/body/\*\[715\]

```text

```

<a id="b00716"></a>
## b00716 — word/document\.xml/body/\*\[716\]

```text

```

<a id="b00717"></a>
## b00717 — word/document\.xml/body/\*\[717\]

```text
Figure - Close  putaway group confirmation
```

<a id="b00718"></a>
## b00718 — word/document\.xml/body/\*\[718\]

```text

```

<a id="b00719"></a>
## b00719 — word/document\.xml/body/\*\[719\]

```text
		Quick Receiving - User 
```

<a id="b00720"></a>
## b00720 — word/document\.xml/body/\*\[720\]

```text

```

<a id="b00721"></a>
## b00721 — word/document\.xml/body/\*\[721\]

```text
User-driven quick receiving is used mostly for heavy items or for full LPNs (single item, single lot) coming from vendor or DRPs. Most DCs other than Fort Worth use this option for returns processing also. This preference is used to put away the product to primary locations.
```

<a id="b00722"></a>
## b00722 — word/document\.xml/body/\*\[722\]

```text

```

<a id="b00723"></a>
## b00723 — word/document\.xml/body/\*\[723\]

```text
[EX01 – Track and Trace], [EX03 – GS1 Label Processing]. Quick receiving is not used for DSCSA.
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
Figure – Quick Receive - user
```

<a id="b00727"></a>
## b00727 — word/document\.xml/body/\*\[727\]

```text

```

<a id="b00728"></a>
## b00728 — word/document\.xml/body/\*\[728\]

```text

```

<a id="b00729"></a>
## b00729 — word/document\.xml/body/\*\[729\]

```text
Figure – Quick receive – Scan item
```

<a id="b00730"></a>
## b00730 — word/document\.xml/body/\*\[730\]

```text

```

<a id="b00731"></a>
## b00731 — word/document\.xml/body/\*\[731\]

```text

```

<a id="b00732"></a>
## b00732 — word/document\.xml/body/\*\[732\]

```text
Figure – Quick receive –Enter quantity 
```

<a id="b00733"></a>
## b00733 — word/document\.xml/body/\*\[733\]

```text

```

<a id="b00734"></a>
## b00734 — word/document\.xml/body/\*\[734\]

```text

```

<a id="b00735"></a>
## b00735 — word/document\.xml/body/\*\[735\]

```text
Figure – Quick receive. Ready to putaway
```

<a id="b00736"></a>
## b00736 — word/document\.xml/body/\*\[736\]

```text

```

<a id="b00737"></a>
## b00737 — word/document\.xml/body/\*\[737\]

```text
Figure – Quick receive. Ready to putaway
```

<a id="b00738"></a>
## b00738 — word/document\.xml/body/\*\[738\]

```text

```

<a id="b00739"></a>
## b00739 — word/document\.xml/body/\*\[739\]

```text
Operational Implication: Since system-driven locating does not execute, the existing FEFO/FIFO rules may not be honored downstream during allocation process if the location selection does not consider primary locations first, as the quick receiving process results in inventory at the primary locations. Covetrus does not consider this as a challenge since the returned lot and may be a sooner expiring lot since it was shipped FEFO at the first place.
```

<a id="b00740"></a>
## b00740 — word/document\.xml/body/\*\[740\]

```text

```

<a id="b00741"></a>
## b00741 — word/document\.xml/body/\*\[741\]

```text
		Returns 
```

<a id="b00742"></a>
## b00742 — word/document\.xml/body/\*\[742\]

```text

```

<a id="b00743"></a>
## b00743 — word/document\.xml/body/\*\[743\]

```text
Customer returns are received and stocked into the Fort Worth DC inventory based on needed disposition. Returns will not be stored in a ‘hold’ location for redelivery. No paperwork is changed from the original shipment.
```

<a id="b00744"></a>
## b00744 — word/document\.xml/body/\*\[744\]

```text

```

<a id="b00745"></a>
## b00745 — word/document\.xml/body/\*\[745\]

```text
Return receiving is used for receipts of receipt type RA that are downloaded to SCALE from Host. The user receives items onto multi-item pallets for putaway if it’s a small receipt. For larger returns, single-item pallets are built. This is a receiving supervisor decision. 
```

<a id="b00746"></a>
## b00746 — word/document\.xml/body/\*\[746\]

```text

```

<a id="b00747"></a>
## b00747 — word/document\.xml/body/\*\[747\]

```text
Returns use their receiving preference, and the default inventory status is ‘Quality Hold’ and located to a returns location. 
```

<a id="b00748"></a>
## b00748 — word/document\.xml/body/\*\[748\]

```text

```

<a id="b00749"></a>
## b00749 — word/document\.xml/body/\*\[749\]

```text
Some sites use quick receive into primary location. May break FEFO/FIFO unless true FEFO/FIFO. 
```

<a id="b00750"></a>
## b00750 — word/document\.xml/body/\*\[750\]

```text

```

<a id="b00751"></a>
## b00751 — word/document\.xml/body/\*\[751\]

```text

```

<a id="b00752"></a>
## b00752 — word/document\.xml/body/\*\[752\]

```text
		Disposition Codes
```

<a id="b00753"></a>
## b00753 — word/document\.xml/body/\*\[753\]

```text

```

<a id="b00754"></a>
## b00754 — word/document\.xml/body/\*\[754\]

```text
Covetrus uses disposition codes for damages and returns primarily. There are multiple overlapping disposition codes setup by site. Covetrus will revisit them during the build phase for clean up. 
```

<a id="b00755"></a>
## b00755 — word/document\.xml/body/\*\[755\]

```text

```

<a id="b00756"></a>
## b00756 — word/document\.xml/body/\*\[756\]

```text

```

<a id="b00757"></a>
## b00757 — word/document\.xml/body/\*\[757\]

```text
Figure – Disposition codes
```

<a id="b00758"></a>
## b00758 — word/document\.xml/body/\*\[758\]

```text

```

<a id="b00759"></a>
## b00759 — word/document\.xml/body/\*\[759\]

```text
		Verify Receipts
```

<a id="b00760"></a>
## b00760 — word/document\.xml/body/\*\[760\]

```text

```

<a id="b00761"></a>
## b00761 — word/document\.xml/body/\*\[761\]

```text
For receipts where all receipt details are received complete, SCALE automatically closes the receipt upon the putaway of the last LPN. If all detail lines were not received completely (such as with a short ship), the receipt must be closed manually.  To close a receipt manually, a user selects the receipt that is completed and uses the Close Receipt action from the Receipt Insight.  Upon confirmation of the close, SCALE updates the receipt status to Closed and does not allow additional products to be received.
```

<a id="b00762"></a>
## b00762 — word/document\.xml/body/\*\[762\]

```text

```

<a id="b00763"></a>
## b00763 — word/document\.xml/body/\*\[763\]

```text
	Note: A closed receipt can be re-opened in SCALE to allow additional receiving
```

<a id="b00764"></a>
## b00764 — word/document\.xml/body/\*\[764\]

```text

```

<a id="b00765"></a>
## b00765 — word/document\.xml/body/\*\[765\]

```text

```

<a id="b00766"></a>
## b00766 — word/document\.xml/body/\*\[766\]

```text
Figure – Receipt Insight – close receipt
```

<a id="b00767"></a>
## b00767 — word/document\.xml/body/\*\[767\]

```text

```

<a id="b00768"></a>
## b00768 — word/document\.xml/body/\*\[768\]

```text

```

<a id="b00769"></a>
## b00769 — word/document\.xml/body/\*\[769\]

```text
EXCEPTIONS
```

<a id="b00770"></a>
## b00770 — word/document\.xml/body/\*\[770\]

```text

```

<a id="b00771"></a>
## b00771 — word/document\.xml/body/\*\[771\]

```text
		Items missing weight or dimensions (New Items)
```

<a id="b00772"></a>
## b00772 — word/document\.xml/body/\*\[772\]

```text

```

<a id="b00773"></a>
## b00773 — word/document\.xml/body/\*\[773\]

```text
Covetrus captures the dimensions for the new items using the cubiscan at the NDSC which is updated into SCALE either using an export from Boomi, diagnostic app, or manually in SCALE by the operations team.
```

<a id="b00774"></a>
## b00774 — word/document\.xml/body/\*\[774\]

```text

```

<a id="b00775"></a>
## b00775 — word/document\.xml/body/\*\[775\]

```text
		Overages
```

<a id="b00776"></a>
## b00776 — word/document\.xml/body/\*\[776\]

```text

```

<a id="b00777"></a>
## b00777 — word/document\.xml/body/\*\[777\]

```text
Covetrus does not over receive. If during unloading the truck, the user determines the inventory unloaded is more than the Receipt line quantity, then the receiving user reaches out to receiving supervisor. A new PO/Receipt is generated by the Host-based on the request from operations to receive the additional items into SCALE. The receiving team manually moves this product away from the receiving dock to avoid any obstruction until the new Receipt is available. 
```

<a id="b00778"></a>
## b00778 — word/document\.xml/body/\*\[778\]

```text

```

<a id="b00779"></a>
## b00779 — word/document\.xml/body/\*\[779\]

```text
Config Note: Receiving Preferences will have ‘Allow over receiving’ disabled. 
```

<a id="b00780"></a>
## b00780 — word/document\.xml/body/\*\[780\]

```text

```

<a id="b00781"></a>
## b00781 — word/document\.xml/body/\*\[781\]

```text
		Shortages
```

<a id="b00782"></a>
## b00782 — word/document\.xml/body/\*\[782\]

```text

```

<a id="b00783"></a>
## b00783 — word/document\.xml/body/\*\[783\]

```text
When a receipt is not received in full, the user must manually close it, if the rest of the balance is no longer expected. 
```

<a id="b00784"></a>
## b00784 — word/document\.xml/body/\*\[784\]

```text

```

<a id="b00785"></a>
## b00785 — word/document\.xml/body/\*\[785\]

```text

```

<a id="b00786"></a>
## b00786 — word/document\.xml/body/\*\[786\]

```text
Figure – Closing receipt Shortages. 
```

<a id="b00787"></a>
## b00787 — word/document\.xml/body/\*\[787\]

```text
	
```

<a id="b00788"></a>
## b00788 — word/document\.xml/body/\*\[788\]

```text
		Receipt not in SCALE 
```

<a id="b00789"></a>
## b00789 — word/document\.xml/body/\*\[789\]

```text

```

<a id="b00790"></a>
## b00790 — word/document\.xml/body/\*\[790\]

```text
In this case, the product is delivered by a carrier for a receipt that is not in SCALE. The warehouse cannot Check-In the product without the receipt information in SCALE.
```

<a id="b00791"></a>
## b00791 — word/document\.xml/body/\*\[791\]

```text

```

<a id="b00792"></a>
## b00792 — word/document\.xml/body/\*\[792\]

```text
Below steps are taken first to resolve this issue. Since the guard in the yard does not see the receipt/PO in SCALE for this trailer, the trailer does not enter the yard until a PO/receipt is available. 
```

<a id="b00793"></a>
## b00793 — word/document\.xml/body/\*\[793\]

```text

```

<a id="b00794"></a>
## b00794 — word/document\.xml/body/\*\[794\]

```text
Contact the buyer if the PO is not in the Host.
```

<a id="b00795"></a>
## b00795 — word/document\.xml/body/\*\[795\]

```text
Contact IT to fix the error if the PO exists in the Host.
```

<a id="b00796"></a>
## b00796 — word/document\.xml/body/\*\[796\]

```text

```

<a id="b00797"></a>
## b00797 — word/document\.xml/body/\*\[797\]

```text
		Unknown Product 
```

<a id="b00798"></a>
## b00798 — word/document\.xml/body/\*\[798\]

```text

```

<a id="b00799"></a>
## b00799 — word/document\.xml/body/\*\[799\]

```text
When an item is available on the trailer but exists neither on the receipt nor the item master, it is called an Unknown Product. The check in clerk informs the supervisor, who coordinates with the supplier team.  Covetrus manually moves this product away from the receiving dock to avoid any obstruction. The supervisor coordinates with the procurement team and/or vendor, an item master is interfaced with this item if it must be received. A new receipt is then created in the host for this known (unknown before item master download) product and interfaced into SCALE. 
```

<a id="b00800"></a>
## b00800 — word/document\.xml/body/\*\[800\]

```text

```

<a id="b00801"></a>
## b00801 — word/document\.xml/body/\*\[801\]

```text
		Damages
```

<a id="b00802"></a>
## b00802 — word/document\.xml/body/\*\[802\]

```text

```

<a id="b00803"></a>
## b00803 — word/document\.xml/body/\*\[803\]

```text
Damaged goods are received under the Damage Preference.  The inventory received is put in a Held Inventory Status based on the disposition code entered by user and assigned a Locating Rule to direct the product to a damaged area.
```

<a id="b00804"></a>
## b00804 — word/document\.xml/body/\*\[804\]

```text

```

<a id="b00805"></a>
## b00805 — word/document\.xml/body/\*\[805\]

```text
Note: Covetrus configures a virtual multi-item and license plate tracked location called Supervisor Location to handle locating exceptions. This is used to troubleshoot these exceptions.
```

<a id="b00806"></a>
## b00806 — word/document\.xml/body/\*\[806\]

```text

```

<a id="b00807"></a>
## b00807 — word/document\.xml/body/\*\[807\]

```text
If a receipt is manually closed in Host, in receiving interface updates the receipt header with the closed date time field. No changes will be made to the receipt detail level.
```

<a id="b00808"></a>
## b00808 — word/document\.xml/body/\*\[808\]

```text

```

<a id="b00809"></a>
## b00809 — word/document\.xml/body/\*\[809\]

```text
Development Note: For ‘Recall’ item, the item is located with Recall or held status matching the status present in the inventory. Receiving worksheet is updated to show an Asterix(*) next to the line indicating it is on recall. 
```

<a id="b00810"></a>
## b00810 — word/document\.xml/body/\*\[810\]

```text

```

<a id="b00811"></a>
## b00811 — word/document\.xml/body/\*\[811\]

```text

```

<a id="b00812"></a>
## b00812 — word/document\.xml/body/\*\[812\]

```text
		Manually Closing the receipt
```

<a id="b00813"></a>
## b00813 — word/document\.xml/body/\*\[813\]

```text

```

<a id="b00814"></a>
## b00814 — word/document\.xml/body/\*\[814\]

```text
If a receipt is manually closed in Host, in receiving interface updates the receipt header with the closed date time field. No changes will be done at the receipt detail level.
```

<a id="b00815"></a>
## b00815 — word/document\.xml/body/\*\[815\]

```text

```

<a id="b00816"></a>
## b00816 — word/document\.xml/body/\*\[816\]

```text

```

<a id="b00817"></a>
## b00817 — word/document\.xml/body/\*\[817\]

```text
		Using Receipt Workbench for troubleshooting
```

<a id="b00818"></a>
## b00818 — word/document\.xml/body/\*\[818\]

```text

```

<a id="b00819"></a>
## b00819 — word/document\.xml/body/\*\[819\]

```text
Receiving supervisors may use Receipt Workbench for troubleshooting exceptions like locating failure. Receipt Workbench is not the primary receiving tool. There are no extensions around this workflow. Receiving using the workbench is out of scope of this implementation. 
```

<a id="b00820"></a>
## b00820 — word/document\.xml/body/\*\[820\]

```text


```

<a id="b00821"></a>
## b00821 — word/document\.xml/body/\*\[821\]

```text

```

<a id="b00822"></a>
## b00822 — word/document\.xml/body/\*\[822\]

```text
Figure – Closing receipt Shortages
```

<a id="b00823"></a>
## b00823 — word/document\.xml/body/\*\[823\]

```text

```

<a id="b00824"></a>
## b00824 — word/document\.xml/body/\*\[824\]

```text
PUTAWAY
```

<a id="b00825"></a>
## b00825 — word/document\.xml/body/\*\[825\]

```text

```

<a id="b00826"></a>
## b00826 — word/document\.xml/body/\*\[826\]

```text
Put away involves executing the task to move the inventory to the system-directed location from the receiving dock.
```

<a id="b00827"></a>
## b00827 — word/document\.xml/body/\*\[827\]

```text

```

<a id="b00828"></a>
## b00828 — word/document\.xml/body/\*\[828\]

```text
Locating takes each receipt container from the Check-In process and tries to find a place in the warehouse to store the product. Locating Rules are based on a series of sequences that use a combination of strategy and Location selection to try and find the right place in inventory for the item. If the system locates the receipt container to a location, work is created to move the product from the Receiving Dock to the destination location in the warehouse for all receipts. 
```

<a id="b00829"></a>
## b00829 — word/document\.xml/body/\*\[829\]

```text

```

<a id="b00830"></a>
## b00830 — word/document\.xml/body/\*\[830\]

```text
Covetrus uses a manual SOP to troubleshoot if a container is located to the ‘Supervisor Location’. Transaction history and process history can be leveraged to review the locating rule sequences to determine the root cause. Covetrus cancels the check-in (if not uploaded) for this container and check in after making the needed corrections.
```

<a id="b00831"></a>
## b00831 — word/document\.xml/body/\*\[831\]

```text

```

<a id="b00832"></a>
## b00832 — word/document\.xml/body/\*\[832\]

```text
		Locating Rules
```

<a id="b00833"></a>
## b00833 — word/document\.xml/body/\*\[833\]

```text

```

<a id="b00834"></a>
## b00834 — word/document\.xml/body/\*\[834\]

```text
Once the inventory has been checked in to SCALE, a putaway location is found using locating rules.  Locating rules could be specified on the item or during the receipt download interface or the receiving process by certain functions such as Locating Rule Assignment, Disposition Codes, etc.
```

<a id="b00835"></a>
## b00835 — word/document\.xml/body/\*\[835\]

```text

```

<a id="b00836"></a>
## b00836 — word/document\.xml/body/\*\[836\]

```text
The locating rules are used to perform putaway work from the receiving dock location to inventory locations.
```

<a id="b00837"></a>
## b00837 — word/document\.xml/body/\*\[837\]

```text

```

<a id="b00838"></a>
## b00838 — word/document\.xml/body/\*\[838\]

```text
To allow for easy addition of new items and locating rules, the locating rule is assigned on the Receipt Detail using the Locating Rule Assignment configuration.
```

<a id="b00839"></a>
## b00839 — word/document\.xml/body/\*\[839\]

```text

```

<a id="b00840"></a>
## b00840 — word/document\.xml/body/\*\[840\]

```text
Configuration Note: The Receiving System Value Locating Rule Assignment During is set to Receipt Check-In.
```

<a id="b00841"></a>
## b00841 — word/document\.xml/body/\*\[841\]

```text

```

<a id="b00842"></a>
## b00842 — word/document\.xml/body/\*\[842\]

```text
Note: The layout and zoning of the DCs is maintained and is used as is in the current system. 
```

<a id="b00843"></a>
## b00843 — word/document\.xml/body/\*\[843\]

```text

```

<a id="b00844"></a>
## b00844 — word/document\.xml/body/\*\[844\]

```text
Location Types
```

<a id="b00845"></a>
## b00845 — word/document\.xml/body/\*\[845\]

```text

```

<a id="b00846"></a>
## b00846 — word/document\.xml/body/\*\[846\]

```text
The following major inventory location types are available for the Covetrus site as showcased on the layout.
```

<a id="b00847"></a>
## b00847 — word/document\.xml/body/\*\[847\]

```text

```

<a id="b00848"></a>
## b00848 — word/document\.xml/body/\*\[848\]

```text

```

<a id="b00849"></a>
## b00849 — word/document\.xml/body/\*\[849\]

```text
			Location Type		Description
	1		Active		Single Item
	Permanently Assigned. ILA
	No License Plate Tracking
	Multiple Lots
	Allocate In Transit
	2		Reserve Static		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
	3		Reserve Rack		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
	4		Reserve Floor		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
	5		SEEMANAGER		Multi Item
	License Plate Tracking
	Multiple Lots
	No Allocation from this location
```

<a id="b00850"></a>
## b00850 — word/document\.xml/body/\*\[850\]

```text

```

<a id="b00851"></a>
## b00851 — word/document\.xml/body/\*\[851\]

```text

```

<a id="b00852"></a>
## b00852 — word/document\.xml/body/\*\[852\]

```text
Covetrus configures these locations with current locating, allocation, and work zones. 
```

<a id="b00853"></a>
## b00853 — word/document\.xml/body/\*\[853\]

```text
These are carried over with upgrade and Covetrus reviews and streamlines any opportunities in the current version before the conversion process. 
```

<a id="b00854"></a>
## b00854 — word/document\.xml/body/\*\[854\]

```text

```

<a id="b00855"></a>
## b00855 — word/document\.xml/body/\*\[855\]

```text
Item is Not Present in the warehouse
```

<a id="b00856"></a>
## b00856 — word/document\.xml/body/\*\[856\]

```text

```

<a id="b00857"></a>
## b00857 — word/document\.xml/body/\*\[857\]

```text
Sequence	Strategy	Location Selection	Split Quantity
10	Item Location Assignment	Active 	Yes
20	Consolidate to location that already contains this item	Reserve Static	No
30	Consolidate to location that already contains this item	Reserve Rack	No
40	Empty Location	Reserve Static	No
50	Empty Location	Reserve Rack	No
60	Empty Location	Reserve Floor	No
70	Use specific (multi-item) location regardless of status	SEE Manager	No
```

<a id="b00858"></a>
## b00858 — word/document\.xml/body/\*\[858\]

```text

```

<a id="b00859"></a>
## b00859 — word/document\.xml/body/\*\[859\]

```text

```

<a id="b00860"></a>
## b00860 — word/document\.xml/body/\*\[860\]

```text
Item is already present in the warehouse
```

<a id="b00861"></a>
## b00861 — word/document\.xml/body/\*\[861\]

```text

```

<a id="b00862"></a>
## b00862 — word/document\.xml/body/\*\[862\]

```text
Sequence	Strategy	Location Selection	Split Quantity
10	Consolidate to location that already contains this item	Reserve Static	No
20	Consolidate to location that already contains this item	Reserve Rack	No
30	Empty Location	Reserve Static	No
40	Empty Location	Reserve Rack	No
50	Empty Location	Reserve Floor	No
60	Use specific (multi-item) location regardless of status	SEE Manager	No
```

<a id="b00863"></a>
## b00863 — word/document\.xml/body/\*\[863\]

```text

```

<a id="b00864"></a>
## b00864 — word/document\.xml/body/\*\[864\]

```text

```

<a id="b00865"></a>
## b00865 — word/document\.xml/body/\*\[865\]

```text
Item is damaged (Disposition code entered is Damaged)
```

<a id="b00866"></a>
## b00866 — word/document\.xml/body/\*\[866\]

```text

```

<a id="b00867"></a>
## b00867 — word/document\.xml/body/\*\[867\]

```text
Sequence	Strategy	Location Selection	Split Quantity
10	Use specific (multi-item) location regardless of status	Damaged Reserve	No
```

<a id="b00868"></a>
## b00868 — word/document\.xml/body/\*\[868\]

```text

```

<a id="b00869"></a>
## b00869 — word/document\.xml/body/\*\[869\]

```text

```

<a id="b00870"></a>
## b00870 — word/document\.xml/body/\*\[870\]

```text
Item is inbound QC enabled
```

<a id="b00871"></a>
## b00871 — word/document\.xml/body/\*\[871\]

```text

```

<a id="b00872"></a>
## b00872 — word/document\.xml/body/\*\[872\]

```text
Sequence	Strategy	Location Selection	Split Quantity
10	Use specific (multi-item) location regardless of status	QC Reserve	No
```

<a id="b00873"></a>
## b00873 — word/document\.xml/body/\*\[873\]

```text

```

<a id="b00874"></a>
## b00874 — word/document\.xml/body/\*\[874\]

```text
Note: Splitting a pallet quantity may result in duplicate work unit (with #) if the LPN is used as the work unit. 
```

<a id="b00875"></a>
## b00875 — word/document\.xml/body/\*\[875\]

```text

```

<a id="b00876"></a>
## b00876 — word/document\.xml/body/\*\[876\]

```text
Operational Implication: Existing setup has redundant rules which may impact locating timeframes due to multiple evaluations. Since Covetrus allows override, it further may reduce inbound throughput.
```

<a id="b00877"></a>
## b00877 — word/document\.xml/body/\*\[877\]

```text

```

<a id="b00878"></a>
## b00878 — word/document\.xml/body/\*\[878\]

```text

```

<a id="b00879"></a>
## b00879 — word/document\.xml/body/\*\[879\]

```text
		Putaway Work Creation
```

<a id="b00880"></a>
## b00880 — word/document\.xml/body/\*\[880\]

```text

```

<a id="b00881"></a>
## b00881 — word/document\.xml/body/\*\[881\]

```text
Upon receiving and palletization of the items, if necessary, SCALE generates system work records for each located Pallet / LPN.  The work unit for the putaway work equals the Pallet / LPN ID. This allows the user to scan the Pallet / LPN ID in the Warehouse Mobile Work option to initiate the putaway in a user-directed mode. Covetrus creates work for Receipt Putaway and uses User directed putaway.
```

<a id="b00882"></a>
## b00882 — word/document\.xml/body/\*\[882\]

```text

```

<a id="b00883"></a>
## b00883 — word/document\.xml/body/\*\[883\]

```text
Covetrus configures the needed access for all Receiving users. For example, if the same user can move containers from Receiving Dock to the QC location, the user may have access to also pick and move containers from the QC location to the inventory locations. 
```

<a id="b00884"></a>
## b00884 — word/document\.xml/body/\*\[884\]

```text

```

<a id="b00885"></a>
## b00885 — word/document\.xml/body/\*\[885\]

```text

```

<a id="b00886"></a>
## b00886 — word/document\.xml/body/\*\[886\]

```text
		Putaway Work Execution
```

<a id="b00887"></a>
## b00887 — word/document\.xml/body/\*\[887\]

```text

```

<a id="b00888"></a>
## b00888 — word/document\.xml/body/\*\[888\]

```text
To initiate putaway work, Covetrus utilizes the option Work on warehouse mobile.  A user enters the number associated with the Putaway Work Profile selection or selects it from the menu options.  Upon selection, SCALE prompts the user to enter a work unit, which in this scenario is the LPN (Pallet having cases on it). The work profile is set to be User Directed. 
```

<a id="b00889"></a>
## b00889 — word/document\.xml/body/\*\[889\]

```text

```

<a id="b00890"></a>
## b00890 — word/document\.xml/body/\*\[890\]

```text
Upon scanning the LPN barcode on the pallet, SCALE assigns the work unit to the user.  SCALE then displays the current receiving dock location and item information and displays the number of units associated with the work unit. Upon confirmation, SCALE updates the LPN(s) to status In Putaway and displays the putaway location for the first item.  To complete the step of putaway, the user is prompted to confirm the putaway location.  The user scans the location for validation upon putaway.
```

<a id="b00891"></a>
## b00891 — word/document\.xml/body/\*\[891\]

```text

```

<a id="b00892"></a>
## b00892 — word/document\.xml/body/\*\[892\]

```text
The user may skip the putaway instruction and proceed to the next item on the work unit if multiple work instruction lines exist. This is done by using the Skip button. If the user skips the putaway, the system continues directing the user through the putaway locations in the location sequence before looping back to put away the skipped items. 
```

<a id="b00893"></a>
## b00893 — word/document\.xml/body/\*\[893\]

```text

```

<a id="b00894"></a>
## b00894 — word/document\.xml/body/\*\[894\]

```text
Upon putaway to the final inventory location, SCALE updates the LPN to status Closed and updates the on-hand quantity at the final putaway location. The closed LPN is then eligible to be uploaded to Host as part of the receiving upload interface. 
```

<a id="b00895"></a>
## b00895 — word/document\.xml/body/\*\[895\]

```text

```

<a id="b00896"></a>
## b00896 — word/document\.xml/body/\*\[896\]

```text

```

<a id="b00897"></a>
## b00897 — word/document\.xml/body/\*\[897\]

```text
Figure– Putaway work execution.
```

<a id="b00898"></a>
## b00898 — word/document\.xml/body/\*\[898\]

```text
For DSCSA receiving, the status of the serial number is updated in the custom DSCSA serial number table. For details, refer DSCSA inbound processing.
```

<a id="b00899"></a>
## b00899 — word/document\.xml/body/\*\[899\]

```text
	
```

<a id="b00900"></a>
## b00900 — word/document\.xml/body/\*\[900\]

```text

```

<a id="b00901"></a>
## b00901 — word/document\.xml/body/\*\[901\]

```text
		Location Override
```

<a id="b00902"></a>
## b00902 — word/document\.xml/body/\*\[902\]

```text

```

<a id="b00903"></a>
## b00903 — word/document\.xml/body/\*\[903\]

```text
Location override will be used the initial go-live. Over time, Covetrus will evaluate this, and modify as needed.
```

<a id="b00904"></a>
## b00904 — word/document\.xml/body/\*\[904\]

```text

```

<a id="b00905"></a>
## b00905 — word/document\.xml/body/\*\[905\]

```text
Certain users can be granted security to override the system's suggested location for the inventory. If this needs to happen, the user picks the Parent LPN from the receiving dock, just as with the other work; however, when they are prompted for the Putaway Screen the user selects the Location Override option on the screen.
```

<a id="b00906"></a>
## b00906 — word/document\.xml/body/\*\[906\]

```text

This redirects the user to a screen where they can scan the location name from the barcode in which they want to put the product away.  The system validates that there is nothing else directed to that location and that the location is valid before accepting the user’s override. After validation passes, the system updates work, the LPN to note the new location, and writes Transaction History noting the change in the putaway location. Finally, the user is presented with the Putaway Confirmation screen where they complete the Putaway the same as with other work units.
```

<a id="b00907"></a>
## b00907 — word/document\.xml/body/\*\[907\]

```text

```

<a id="b00908"></a>
## b00908 — word/document\.xml/body/\*\[908\]

```text
When a user presses the Location Override button on the screen, after a user is redirected to the override screen, the user also has the option to click on the Locate button. When the Locate button is pressed the user is presented with an option to select a locating rule. The system will then decide on a suitable putaway location based on the locating rule. 
```

<a id="b00909"></a>
## b00909 — word/document\.xml/body/\*\[909\]

```text

```

<a id="b00910"></a>
## b00910 — word/document\.xml/body/\*\[910\]

```text
If a user selects the option to override, SCALE has the option to create an activity-based cycle count at the original putaway location. 
```

<a id="b00911"></a>
## b00911 — word/document\.xml/body/\*\[911\]

```text
	
```

<a id="b00912"></a>
## b00912 — word/document\.xml/body/\*\[912\]

```text
	
```

<a id="b00913"></a>
## b00913 — word/document\.xml/body/\*\[913\]

```text
	Figure– Putaway location override
```

<a id="b00914"></a>
## b00914 — word/document\.xml/body/\*\[914\]

```text
	
```

<a id="b00915"></a>
## b00915 — word/document\.xml/body/\*\[915\]

```text
	Open Item: Many sites use this as a rule instead of exception. This indicates opportunities for slotting, locating rule evaluation, and SOP adherence. With the migration to Warehouse Mobile, this introduces change management. The options to override in a LP tracked location v/s non-LP tracked are being evaluated. This may result in a feasibility check for scenarios not available with warehouse mobile and may need a process change. 

```

<a id="b00916"></a>
## b00916 — word/document\.xml/body/\*\[916\]

```text
III. 	INVENTORY CONTROL
```

<a id="b00917"></a>
## b00917 — word/document\.xml/body/\*\[917\]

```text

```

<a id="b00918"></a>
## b00918 — word/document\.xml/body/\*\[918\]

```text
INVENTORY MANAGEMENT
```

<a id="b00919"></a>
## b00919 — word/document\.xml/body/\*\[919\]

```text

```

<a id="b00920"></a>
## b00920 — word/document\.xml/body/\*\[920\]

```text
		Adjustments
```

<a id="b00921"></a>
## b00921 — word/document\.xml/body/\*\[921\]

```text

```

<a id="b00922"></a>
## b00922 — word/document\.xml/body/\*\[922\]

```text
Inventory adjustments either increase or decrease the on-hand quantity of an item in a location. The adjustment types are configurable and are created to indicate reason codes such as Damaged, Scrap, etc. Each adjustment type can be set up to have minimum and maximum adjustment quantities. Security is maintained to control which users have access to which adjustment types. Adjustment types can be configured to not upload to the Host. 
```

<a id="b00923"></a>
## b00923 — word/document\.xml/body/\*\[923\]

```text

```

<a id="b00924"></a>
## b00924 — word/document\.xml/body/\*\[924\]

```text
All adjustments are entered in the Inventory Management option. This option can be initiated blindly from the main menu or Warehouse Mobile Inventory Management. It can also be initiated by selecting a location/item combination in the Inventory Insight. The user proceeds by entering the quantity to adjust, where the quantity is specified as a negative value for negative adjustments. After confirming, SCALE adjusts the inventory in the location and creates a history log of the inventory transaction.
```

<a id="b00925"></a>
## b00925 — word/document\.xml/body/\*\[925\]

```text

```

<a id="b00926"></a>
## b00926 — word/document\.xml/body/\*\[926\]

```text

```

<a id="b00927"></a>
## b00927 — word/document\.xml/body/\*\[927\]

```text
Figure - Inventory Adjustment Screen
```

<a id="b00928"></a>
## b00928 — word/document\.xml/body/\*\[928\]

```text
		
```

<a id="b00929"></a>
## b00929 — word/document\.xml/body/\*\[929\]

```text
Figure - Inventory Adjustment Screen
```

<a id="b00930"></a>
## b00930 — word/document\.xml/body/\*\[930\]

```text
		
```

<a id="b00931"></a>
## b00931 — word/document\.xml/body/\*\[931\]

```text
		
```

<a id="b00932"></a>
## b00932 — word/document\.xml/body/\*\[932\]

```text
Note: Inventory cannot be adjusted in the receiving dock location. Only located items can be adjusted using Inventory Management.
```

<a id="b00933"></a>
## b00933 — word/document\.xml/body/\*\[933\]

```text

```

<a id="b00934"></a>
## b00934 — word/document\.xml/body/\*\[934\]

```text
Typical adjustment types are listed below. 
```

<a id="b00935"></a>
## b00935 — word/document\.xml/body/\*\[935\]

```text

```

<a id="b00936"></a>
## b00936 — word/document\.xml/body/\*\[936\]

```text

```

<a id="b00937"></a>
## b00937 — word/document\.xml/body/\*\[937\]

```text

```

<a id="b00938"></a>
## b00938 — word/document\.xml/body/\*\[938\]

```text

```

<a id="b00939"></a>
## b00939 — word/document\.xml/body/\*\[939\]

```text

```

<a id="b00940"></a>
## b00940 — word/document\.xml/body/\*\[940\]

```text
SCALE Adjustment Type 	Description
 Positive Adjustment	Increase the on-hand qty of an item. A threshold is recommended. 
Negative Adjustment	Decrease the on-hand qty of an item. A threshold is recommended
 Cycle Count	There was a discrepancy detected during a cycle count and
```

<a id="b00941"></a>
## b00941 — word/document\.xml/body/\*\[941\]

```text

```

<a id="b00942"></a>
## b00942 — word/document\.xml/body/\*\[942\]

```text

```

<a id="b00943"></a>
## b00943 — word/document\.xml/body/\*\[943\]

```text
Covetrus uses the existing adjustment types as shown below.
```

<a id="b00944"></a>
## b00944 — word/document\.xml/body/\*\[944\]

```text

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
					
```

<a id="b00949"></a>
## b00949 — word/document\.xml/body/\*\[949\]

```text
Figure – Inventory Adjustment types
```

<a id="b00950"></a>
## b00950 — word/document\.xml/body/\*\[950\]

```text

```

<a id="b00951"></a>
## b00951 — word/document\.xml/body/\*\[951\]

```text
 
```

<a id="b00952"></a>
## b00952 — word/document\.xml/body/\*\[952\]

```text
Figure – Inventory Adjustment configuration
```

<a id="b00953"></a>
## b00953 — word/document\.xml/body/\*\[953\]

```text

```

<a id="b00954"></a>
## b00954 — word/document\.xml/body/\*\[954\]

```text
For track and trace items, inventory adjustments are restricted. [EX06 – Track and Trace Item Adjustment Restriction]
```

<a id="b00955"></a>
## b00955 — word/document\.xml/body/\*\[955\]

```text

```

<a id="b00956"></a>
## b00956 — word/document\.xml/body/\*\[956\]

```text
For dummy systemic inventory, for example – shortages in DRP – inventory adjustment is done in virtual locations within a ‘Morgue’ area. IVR001 is an example location. These are set up as multi-item locations. 
```

<a id="b00957"></a>
## b00957 — word/document\.xml/body/\*\[957\]

```text

```

<a id="b00958"></a>
## b00958 — word/document\.xml/body/\*\[958\]

```text
Config Note: Supervisors use the ‘Manual Inventory Adjustment’ tool to reconcile inventory issues. Covetrus uses this tool frequently which indicates opportunities in the training, process, or system issues. Manhattan recommends troubleshooting the root cause driving the inventory discrepancy and minimizing the use of this tool as manually updating inventory buckets may lead to cascading effects. 
```

<a id="b00959"></a>
## b00959 — word/document\.xml/body/\*\[959\]

```text

```

<a id="b00960"></a>
## b00960 — word/document\.xml/body/\*\[960\]

```text

```

<a id="b00961"></a>
## b00961 — word/document\.xml/body/\*\[961\]

```text
Figure – Manual Adjust Tool
```

<a id="b00962"></a>
## b00962 — word/document\.xml/body/\*\[962\]

```text

```

<a id="b00963"></a>
## b00963 — word/document\.xml/body/\*\[963\]

```text
		Transfers
```

<a id="b00964"></a>
## b00964 — word/document\.xml/body/\*\[964\]

```text

```

<a id="b00965"></a>
## b00965 — word/document\.xml/body/\*\[965\]

```text
Inventory transfers move the on-hand quantity of an item from one location to another within the four walls of the warehouse. The transfer types are configurable and are created to indicate reason codes such as Consolidation, Back to Stock, etc. Each transfer type can be set up to have minimum and maximum transfer quantities. Security is maintained to control which users have access to which transfer types.
```

<a id="b00966"></a>
## b00966 — word/document\.xml/body/\*\[966\]

```text

```

<a id="b00967"></a>
## b00967 — word/document\.xml/body/\*\[967\]

```text
The Inventory Transfer option is initiated blindly from the main menu or Warehouse Mobile Inventory Management. This can also be initiated by selecting a location/item combination in the Inventory Insight, in which case the “from location” and item automatically default. In the scenario where Inventory Management is blindly initiated, the user is forced to specify the “from location”, item and quantity being transferred.
```

<a id="b00968"></a>
## b00968 — word/document\.xml/body/\*\[968\]

```text

```

<a id="b00969"></a>
## b00969 — word/document\.xml/body/\*\[969\]

```text
As part of inventory transfer, users can also create work. This way a supervisor can decide what inventory needs to be moved and then a picker on the floor will get the work to physically move the product. Inventory transfer with work must be created on the insight screen. The work execution can happen on the RF device.
```

<a id="b00970"></a>
## b00970 — word/document\.xml/body/\*\[970\]

```text
	
```

<a id="b00971"></a>
## b00971 — word/document\.xml/body/\*\[971\]

```text
													
```

<a id="b00972"></a>
## b00972 — word/document\.xml/body/\*\[972\]

```text
Figure – Inventory Transfer with work
```

<a id="b00973"></a>
## b00973 — word/document\.xml/body/\*\[973\]

```text
													
```

<a id="b00974"></a>
## b00974 — word/document\.xml/body/\*\[974\]

```text
													
```

<a id="b00975"></a>
## b00975 — word/document\.xml/body/\*\[975\]

```text
													
```

<a id="b00976"></a>
## b00976 — word/document\.xml/body/\*\[976\]

```text
			Figure - Inventory transfer work execution
```

<a id="b00977"></a>
## b00977 — word/document\.xml/body/\*\[977\]

```text
		
```

<a id="b00978"></a>
## b00978 — word/document\.xml/body/\*\[978\]

```text
													
```

<a id="b00979"></a>
## b00979 — word/document\.xml/body/\*\[979\]

```text
		Status Change
```

<a id="b00980"></a>
## b00980 — word/document\.xml/body/\*\[980\]

```text
													
```

<a id="b00981"></a>
## b00981 — word/document\.xml/body/\*\[981\]

```text
Inventory is received into SCALE with a default status of Available, and HQ for items flagged as inbound QC required. However, Covetrus may choose to have different inventory statuses to represent contrasting conditions of inventory such as Hold, damaged, rejected etc. The Warehouse personnel can use an Inventory Status Change to update inventory status. These status change types are configurable, and security is maintained to control which users have access to which status change types.
```

<a id="b00982"></a>
## b00982 — word/document\.xml/body/\*\[982\]

```text

```

<a id="b00983"></a>
## b00983 — word/document\.xml/body/\*\[983\]

```text
The Inventory Management option can be initiated blindly from the main menu wherein the user specifies the location and item. It can also be initiated by selecting a location/item or a license plate (per configuration) combination in the Inventory Insight, in which case the location and item automatically default. The user then specifies the new inventory status. At confirmation, SCALE updates the inventory status for the item and location combination. SCALE also creates a history log of the inventory transaction.
```

<a id="b00984"></a>
## b00984 — word/document\.xml/body/\*\[984\]

```text
		
```

<a id="b00985"></a>
## b00985 — word/document\.xml/body/\*\[985\]

```text
													Note: Single location cannot hold the same item with a quantity in status Available and another quantity in status Damaged if the location is not License plate tracked
```

<a id="b00986"></a>
## b00986 — word/document\.xml/body/\*\[986\]

```text
														
```

<a id="b00987"></a>
## b00987 — word/document\.xml/body/\*\[987\]

```text
													Covetrus does not update inventory status of multiple lots at the same time by selecting multiple lots to begin with.
```

<a id="b00988"></a>
## b00988 — word/document\.xml/body/\*\[988\]

```text
													
```

<a id="b00989"></a>
## b00989 — word/document\.xml/body/\*\[989\]

```text
		Transfer & Status Change 
```

<a id="b00990"></a>
## b00990 — word/document\.xml/body/\*\[990\]

```text
		
```

<a id="b00991"></a>
## b00991 — word/document\.xml/body/\*\[991\]

```text
		Covetrus currently does not use an adjustment type for transfer and status change combined. Covetrus is considering using this with this implementation. If used, Covetrus enhances its interface to incorporate these changes. 
```

<a id="b00992"></a>
## b00992 — word/document\.xml/body/\*\[992\]

```text
		
```

<a id="b00993"></a>
## b00993 — word/document\.xml/body/\*\[993\]

```text
Location Inquiry 
```

<a id="b00994"></a>
## b00994 — word/document\.xml/body/\*\[994\]

```text
		
```

<a id="b00995"></a>
## b00995 — word/document\.xml/body/\*\[995\]

```text
		The warehouse mobile location inquiry enables Covetrus to search and view the location inventory records on warehouse mobile. This helps to validate the items actual quantity with that of the quantity physically present in a location. Also, users can access the adjust or transfer inventory actions from this screen.
```

<a id="b00996"></a>
## b00996 — word/document\.xml/body/\*\[996\]

```text
													
```

<a id="b00997"></a>
## b00997 — word/document\.xml/body/\*\[997\]

```text
													Figure – Location Inquiry
```

<a id="b00998"></a>
## b00998 — word/document\.xml/body/\*\[998\]

```text
													
```

<a id="b00999"></a>
## b00999 — word/document\.xml/body/\*\[999\]

```text
													
```

<a id="b01000"></a>
## b01000 — word/document\.xml/body/\*\[1000\]

```text
													Figure – Location Inquiry results
```

<a id="b01001"></a>
## b01001 — word/document\.xml/body/\*\[1001\]

```text
													
```

<a id="b01002"></a>
## b01002 — word/document\.xml/body/\*\[1002\]

```text
													
```

<a id="b01003"></a>
## b01003 — word/document\.xml/body/\*\[1003\]

```text
													Figure – Location inquiry actions
```

<a id="b01004"></a>
## b01004 — word/document\.xml/body/\*\[1004\]

```text
													
```

<a id="b01005"></a>
## b01005 — word/document\.xml/body/\*\[1005\]

```text
CYCLE COUNT
```

<a id="b01006"></a>
## b01006 — word/document\.xml/body/\*\[1006\]

```text

```

<a id="b01007"></a>
## b01007 — word/document\.xml/body/\*\[1007\]

```text

```

<a id="b01008"></a>
## b01008 — word/document\.xml/body/\*\[1008\]

```text
		Generating Cycle Counts 
```

<a id="b01009"></a>
## b01009 — word/document\.xml/body/\*\[1009\]

```text
		
```

<a id="b01010"></a>
## b01010 — word/document\.xml/body/\*\[1010\]

```text
 Plan Based Cycle Counting
```

<a id="b01011"></a>
## b01011 — word/document\.xml/body/\*\[1011\]

```text

```

<a id="b01012"></a>
## b01012 — word/document\.xml/body/\*\[1012\]

```text
SCALE utilizes Cycle Count Plans for everyday cycle counting. Covetrus personnel define the Cycle Count Plans in the Cycle Count Plan Insight. A Cycle Count Plan is used to define a range of items and/or locations for which to generate cycle count work. For an example of location criteria, Covetrus can exclude a location that was counted within the last 30 days. For an example of item criteria, Covetrus can use the Item categories (Client Code, etc.). Once the plan has been created, SCALE creates work to count a specified number of locations within the criteria of the Cycle Count Plan. Each location determined for cycle count is generated as a separate work unit in SCALE. 
```

<a id="b01013"></a>
## b01013 — word/document\.xml/body/\*\[1013\]

```text

```

<a id="b01014"></a>
## b01014 — word/document\.xml/body/\*\[1014\]

```text
Some Plan based counts that Covetrus uses are:
```

<a id="b01015"></a>
## b01015 — word/document\.xml/body/\*\[1015\]

```text

```

<a id="b01016"></a>
## b01016 — word/document\.xml/body/\*\[1016\]

```text
All cages are counted daily
```

<a id="b01017"></a>
## b01017 — word/document\.xml/body/\*\[1017\]

```text
Each location every calendar quarter
```

<a id="b01018"></a>
## b01018 — word/document\.xml/body/\*\[1018\]

```text
Shelf pack and box locations
```

<a id="b01019"></a>
## b01019 — word/document\.xml/body/\*\[1019\]

```text
3PL locations
```

<a id="b01020"></a>
## b01020 — word/document\.xml/body/\*\[1020\]

```text
Morgue locations every 30 days
```

<a id="b01021"></a>
## b01021 — word/document\.xml/body/\*\[1021\]

```text
Top 100 items (varies by DC) every month for the next qtr.
```

<a id="b01022"></a>
## b01022 — word/document\.xml/body/\*\[1022\]

```text

```

<a id="b01023"></a>
## b01023 — word/document\.xml/body/\*\[1023\]

```text

```

<a id="b01024"></a>
## b01024 — word/document\.xml/body/\*\[1024\]

```text
Figure - Cycle Count Plan Insight
```

<a id="b01025"></a>
## b01025 — word/document\.xml/body/\*\[1025\]

```text
 Activity Based Cycle Counting
```

<a id="b01026"></a>
## b01026 — word/document\.xml/body/\*\[1026\]

```text

```

<a id="b01027"></a>
## b01027 — word/document\.xml/body/\*\[1027\]

```text
Activity-based cycle counting is the concept of triggering the generation of a cycle count request after a warehouse activity (i.e., Short Picking). The triggering of these requests is tied to the location being processed. After the transaction is executed, the location is reviewed to see if cycle count work should be generated.
```

<a id="b01028"></a>
## b01028 — word/document\.xml/body/\*\[1028\]

```text

```

<a id="b01029"></a>
## b01029 — word/document\.xml/body/\*\[1029\]

```text
For Covetrus, SCALE is configured to create activity-based cycle count work for a location when short picked.
```

<a id="b01030"></a>
## b01030 — word/document\.xml/body/\*\[1030\]

```text

```

<a id="b01031"></a>
## b01031 — word/document\.xml/body/\*\[1031\]

```text
Note: Threshold Count is utilized by Covetrus. Diagnostics app is used to update thresholds. 
```

<a id="b01032"></a>
## b01032 — word/document\.xml/body/\*\[1032\]

```text

```

<a id="b01033"></a>
## b01033 — word/document\.xml/body/\*\[1033\]

```text
Open item: Count back when short picked. Work is created but screen reroute to CC is pending confirmation. 
```

<a id="b01034"></a>
## b01034 — word/document\.xml/body/\*\[1034\]

```text

```

<a id="b01035"></a>
## b01035 — word/document\.xml/body/\*\[1035\]

```text
		Executing Cycle Counts 
```

<a id="b01036"></a>
## b01036 — word/document\.xml/body/\*\[1036\]

```text

```

<a id="b01037"></a>
## b01037 — word/document\.xml/body/\*\[1037\]

```text
 Work Execution
```

<a id="b01038"></a>
## b01038 — word/document\.xml/body/\*\[1038\]

```text

```

<a id="b01039"></a>
## b01039 — word/document\.xml/body/\*\[1039\]

```text
For Covetrus the cycle count execution is set to Standard count for active and reserve locations. To confirm the cycle count, users sign onto a warehouse mobile device, chooses the Work option, and then specify the Cycle Count Work Profile. The user is then prompted to scan a location for SCALE to assign a Work Unit in closest proximity. Work can also be user-directed, if the user knows exactly which locations need to be counted. If User directed, then the user needs to scan the location that they intend to count. 
```

<a id="b01040"></a>
## b01040 — word/document\.xml/body/\*\[1040\]

```text

```

<a id="b01041"></a>
## b01041 — word/document\.xml/body/\*\[1041\]

```text
Once done, SCALE assigns the work to the user and displays the location to be counted on the work execution screen and the item present in that location. User then must specify the quantity present in the location.  
```

<a id="b01042"></a>
## b01042 — word/document\.xml/body/\*\[1042\]

```text

```

<a id="b01043"></a>
## b01043 — word/document\.xml/body/\*\[1043\]

```text
Note: Covetrus updates the mapping for Go button to Done button for this screen. Manhattan recommends validating this for all use cases including optimistic scanning using a warehouse mobile device. 
```

<a id="b01044"></a>
## b01044 — word/document\.xml/body/\*\[1044\]

```text

```

<a id="b01045"></a>
## b01045 — word/document\.xml/body/\*\[1045\]

```text
Figure - Cycle Count Work execution
```

<a id="b01046"></a>
## b01046 — word/document\.xml/body/\*\[1046\]

```text

```

<a id="b01047"></a>
## b01047 — word/document\.xml/body/\*\[1047\]

```text
Note: Cycle Count Preferences are set up to “Verify Bad Count”. 
```

<a id="b01048"></a>
## b01048 — word/document\.xml/body/\*\[1048\]

```text

```

<a id="b01049"></a>
## b01049 — word/document\.xml/body/\*\[1049\]

```text

```

<a id="b01050"></a>
## b01050 — word/document\.xml/body/\*\[1050\]

```text
If the quantity entered by the user is the same as the system quantity, then the system accepts that quantity and displays the cycle count screen where the user can count other items in the location (multi-item location). If the location is a single item, then the user needs to click on the Done to indicate the cycle count work execution is complete. If no discrepancy in count the cycle count request is updated to close.
```

<a id="b01051"></a>
## b01051 — word/document\.xml/body/\*\[1051\]

```text

```

<a id="b01052"></a>
## b01052 — word/document\.xml/body/\*\[1052\]

```text
If the quantity entered by the user for the first time doesn’t match the system quantity, SCALE displays verify count screen and ask the user to confirm the quantity again. If the user enters verify count, they need to enter two consecutive counts of the same value to complete the count. 
```

<a id="b01053"></a>
## b01053 — word/document\.xml/body/\*\[1053\]

```text

```

<a id="b01054"></a>
## b01054 — word/document\.xml/body/\*\[1054\]

```text
Upon entering the information, if there is a discrepancy in the count then SCALE determines whether to post the inventory adjustment or update the cycle count request to status Pending Review. For Covetrus the Cycle Count Tolerances will be set to 0 (all discrepancies must be reconciled) by default. So, SCALE updates the cycle count request to pending review, and reconciliation needs to be completed for the cycle count request to be updated to closed status.
```

<a id="b01055"></a>
## b01055 — word/document\.xml/body/\*\[1055\]

```text
	
```

<a id="b01056"></a>
## b01056 — word/document\.xml/body/\*\[1056\]

```text
Config Note: Positive tolerances for the cycle count preferences are revisited. 
```

<a id="b01057"></a>
## b01057 — word/document\.xml/body/\*\[1057\]

```text

```

<a id="b01058"></a>
## b01058 — word/document\.xml/body/\*\[1058\]

```text
	[AI0033 – Create work by location], [EX06 – Track and Trace Item]
```

<a id="b01059"></a>
## b01059 — word/document\.xml/body/\*\[1059\]

```text

```

<a id="b01060"></a>
## b01060 — word/document\.xml/body/\*\[1060\]

```text
 Cycle Count Reconciliations
```

<a id="b01061"></a>
## b01061 — word/document\.xml/body/\*\[1061\]

```text

```

<a id="b01062"></a>
## b01062 — word/document\.xml/body/\*\[1062\]

```text
For cycle count transactions that fall outside of a user’s tolerance, SCALE updates the status of the Cycle Count work to Pending Review. 
```

<a id="b01063"></a>
## b01063 — word/document\.xml/body/\*\[1063\]

```text

```

<a id="b01064"></a>
## b01064 — word/document\.xml/body/\*\[1064\]

```text
To reconcile a cycle count, a supervisor uses Reconcile option from the Cycle Count Request Insight screen.
```

<a id="b01065"></a>
## b01065 — word/document\.xml/body/\*\[1065\]

```text

```

<a id="b01066"></a>
## b01066 — word/document\.xml/body/\*\[1066\]

```text
From the Cycle Count Request Insight, the supervisor selects the appropriate cycle count in the status Pending Review. On each of the counts requiring review, the supervisor uses the Reconcile action to complete the cycle count adjustment. Once in the reconcile screen, the supervisor enters the correct On-Hand quantity for the specific item in the location.
```

<a id="b01067"></a>
## b01067 — word/document\.xml/body/\*\[1067\]

```text

```

<a id="b01068"></a>
## b01068 — word/document\.xml/body/\*\[1068\]

```text

```

<a id="b01069"></a>
## b01069 — word/document\.xml/body/\*\[1069\]

```text
Figure - Cycle Count Reconcile using Insight screen
```

<a id="b01070"></a>
## b01070 — word/document\.xml/body/\*\[1070\]

```text

```

<a id="b01071"></a>
## b01071 — word/document\.xml/body/\*\[1071\]

```text
Figure - Cycle Count Reconciliation insight screen
```

<a id="b01072"></a>
## b01072 — word/document\.xml/body/\*\[1072\]

```text

```

<a id="b01073"></a>
## b01073 — word/document\.xml/body/\*\[1073\]

```text
The supervisor confirms the on-hand quantity, and then SCALE updates the inventory in the location, records an inventory transaction, and closes the cycle count request.
```

<a id="b01074"></a>
## b01074 — word/document\.xml/body/\*\[1074\]

```text
	
```

<a id="b01075"></a>
## b01075 — word/document\.xml/body/\*\[1075\]

```text
Cycle Count reconciliation can also be performed using the warehouse mobile option. 
```

<a id="b01076"></a>
## b01076 — word/document\.xml/body/\*\[1076\]

```text

```

<a id="b01077"></a>
## b01077 — word/document\.xml/body/\*\[1077\]

```text

```

<a id="b01078"></a>
## b01078 — word/document\.xml/body/\*\[1078\]

```text

```

<a id="b01079"></a>
## b01079 — word/document\.xml/body/\*\[1079\]

```text
Figure - Cycle Count Reconciliation using warehouse mobile
```

<a id="b01080"></a>
## b01080 — word/document\.xml/body/\*\[1080\]

```text

```

<a id="b01081"></a>
## b01081 — word/document\.xml/body/\*\[1081\]

```text

```

<a id="b01082"></a>
## b01082 — word/document\.xml/body/\*\[1082\]

```text
Figure - Cycle Count Reconciliation using warehouse mobile
```

<a id="b01083"></a>
## b01083 — word/document\.xml/body/\*\[1083\]

```text

```

<a id="b01084"></a>
## b01084 — word/document\.xml/body/\*\[1084\]

```text
Covetrus does not close a cycle count with a pending review [EX25 - Cycle Count Management]. There was a recent action item provided by CSO on this that must be included. Currently, it is out of the original scope and will be evaluated via a change request process. 
```

<a id="b01085"></a>
## b01085 — word/document\.xml/body/\*\[1085\]

```text

```

<a id="b01086"></a>
## b01086 — word/document\.xml/body/\*\[1086\]

```text
REPLENISHMENT
```

<a id="b01087"></a>
## b01087 — word/document\.xml/body/\*\[1087\]

```text
Replenishment is setup using Replenishment Master records. A replenishment master record helps define how a replenishment request is generated. It specifies the parameters for replenishing product based on either location need or demand generated for a wave/order pool. The sequence records for a replenishment rule can be edited. Each sequence rule identifies how the system will perform replenishment (strategy). 
```

<a id="b01088"></a>
## b01088 — word/document\.xml/body/\*\[1088\]

```text
Setting up the replenishment is a manual process and leverages using the high-volume item demand report and the setup of item location assignments and capacities as defined earlier in the wave selection section.
```

<a id="b01089"></a>
## b01089 — word/document\.xml/body/\*\[1089\]

```text
	
```

<a id="b01090"></a>
## b01090 — word/document\.xml/body/\*\[1090\]

```text

```

<a id="b01091"></a>
## b01091 — word/document\.xml/body/\*\[1091\]

```text
Figure – Replenishment Master
```

<a id="b01092"></a>
## b01092 — word/document\.xml/body/\*\[1092\]

```text

```

<a id="b01093"></a>
## b01093 — word/document\.xml/body/\*\[1093\]

```text

```

<a id="b01094"></a>
## b01094 — word/document\.xml/body/\*\[1094\]

```text
		Demand Replenishment
```

<a id="b01095"></a>
## b01095 — word/document\.xml/body/\*\[1095\]

```text

```

<a id="b01096"></a>
## b01096 — word/document\.xml/body/\*\[1096\]

```text
Each, Inner Pack and Case demand from the wave is evaluated against the primary locations to determine if there is enough available.  If not, SCALE requests the product in EA increment (round up) for primary locations. 
```

<a id="b01097"></a>
## b01097 — word/document\.xml/body/\*\[1097\]

```text

```

<a id="b01098"></a>
## b01098 — word/document\.xml/body/\*\[1098\]

```text
Some DCs have restrictions in physical area and currently don’t use dynamic active locations.  So, instead of using the Dynamic location, Creation of Multiple Requests for Excess Demand is leveraged and ported over from existing setup. 
```

<a id="b01099"></a>
## b01099 — word/document\.xml/body/\*\[1099\]

```text

```

<a id="b01100"></a>
## b01100 — word/document\.xml/body/\*\[1100\]

```text
When Multiple Request for Excess Demand is selected in Replenishment master, the system will see if the following records exist for the item/company/location: an item location assignment record and an item location capacity record. If both exist, the system divides the demand quantity by the Maximum Replenishment Fill Percent. It will create enough replenishment requests to accommodate the quantity needed at the location. Note that if there is an available quantity at the location (either On Hand or In Transit), the system will subtract that amount before generating requests. Note that when this checkbox is selected, demand replenishment will only support a single permanent location per item within the location selection. It will not fill other permanent locations. Also note that this setting only applies to permanent locations.
```

<a id="b01101"></a>
## b01101 — word/document\.xml/body/\*\[1101\]

```text

```

<a id="b01102"></a>
## b01102 — word/document\.xml/body/\*\[1102\]

```text
Clear location on the allocation rule is not leveraged. Covetrus does not leverage over-picking during replenishment to clear the locations.
```

<a id="b01103"></a>
## b01103 — word/document\.xml/body/\*\[1103\]

```text

```

<a id="b01104"></a>
## b01104 — word/document\.xml/body/\*\[1104\]

```text
Operational Implication: Covetrus does not UM specific locations in the reserve primarily due to space and layout constraints. This leads to labor inefficiency during picking as the pick happens in EA. For example, for a demand replen for 36EA (5EA = 1SB), the picker needs to open a box and take 1EA with 5 SB. Covetrus mitigates this in current system with overriding pick quantities and does not pick the 1EA. However, this could lead to more replenishments and may lead to order fulfillment delays and higher labor cost. With the migration to warehouse mobile, several work special handlings for overrides are being reviewed currently and may lead to a process change once the feasibility study is complete.
```

<a id="b01105"></a>
## b01105 — word/document\.xml/body/\*\[1105\]

```text

```

<a id="b01106"></a>
## b01106 — word/document\.xml/body/\*\[1106\]

```text
Manhattan recommends creating priority-based replenishment masters and exploring the enhancement to ‘Assign multiple work units’ functionality. However, Covetrus wants to minimize the number of visits to the location for picking different unit of measure. The replenishment pick screen is enhanced to show the unit of info on the screen without needing the user to hit the info icon on the screen. [EX27 – Display UOM info on Replen pick screen]
```

<a id="b01107"></a>
## b01107 — word/document\.xml/body/\*\[1107\]

```text

```

<a id="b01108"></a>
## b01108 — word/document\.xml/body/\*\[1108\]

```text
Covetrus introduces a PL UM replenishment increment that runs with a higher priority than the existing EA UM replenishment increment.
```

<a id="b01109"></a>
## b01109 — word/document\.xml/body/\*\[1109\]

```text

```

<a id="b01110"></a>
## b01110 — word/document\.xml/body/\*\[1110\]

```text
Covetrus is working on enhancing the locating rule logic to direct to pick location if there is no inventory in the DC. Currently, the system locates to pick only if there is no inventory in the pick. 
```

<a id="b01111"></a>
## b01111 — word/document\.xml/body/\*\[1111\]

```text

```

<a id="b01112"></a>
## b01112 — word/document\.xml/body/\*\[1112\]

```text
		Manual Replenishment
```

<a id="b01113"></a>
## b01113 — word/document\.xml/body/\*\[1113\]

```text

```

<a id="b01114"></a>
## b01114 — word/document\.xml/body/\*\[1114\]

```text
Capacity based manual replenishment is exhaustively utilized at Covetrus (Lean time replenishment) daily. Manual replenishment is kicked off when requested by the user from the Inventory Insight. SCALE requests the product in EA increment (Fill location) for primary bin locations based on the selected replenishment master(s). Inbound teams execute this capacity based replenishment. 
```

<a id="b01115"></a>
## b01115 — word/document\.xml/body/\*\[1115\]

```text

```

<a id="b01116"></a>
## b01116 — word/document\.xml/body/\*\[1116\]

```text

```

<a id="b01117"></a>
## b01117 — word/document\.xml/body/\*\[1117\]

```text
Figure - Manual Replenishment
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
Figure - Manual Replenishment selection
```

<a id="b01121"></a>
## b01121 — word/document\.xml/body/\*\[1121\]

```text

```

<a id="b01122"></a>
## b01122 — word/document\.xml/body/\*\[1122\]

```text

```

<a id="b01123"></a>
## b01123 — word/document\.xml/body/\*\[1123\]

```text
When manual replenishment runs, it evaluates all permanent active locations and attempts to replenish any location that is below its configured minimum percent.  Replenishment Allocation Rules, Item Criteria, and Allocation Strategies are configured to direct replenishment to the appropriate primary bin locations.
```

<a id="b01124"></a>
## b01124 — word/document\.xml/body/\*\[1124\]

```text

```

<a id="b01125"></a>
## b01125 — word/document\.xml/body/\*\[1125\]

```text
Note: To utilize Capacity based replenishment, Item location assignment and Item location capacity configurations should be present in SCALE.
```

<a id="b01126"></a>
## b01126 — word/document\.xml/body/\*\[1126\]

```text
	
```

<a id="b01127"></a>
## b01127 — word/document\.xml/body/\*\[1127\]

```text
	
```

<a id="b01128"></a>
## b01128 — word/document\.xml/body/\*\[1128\]

```text
	
```

<a id="b01129"></a>
## b01129 — word/document\.xml/body/\*\[1129\]

```text
		Real Time Replenishment  
```

<a id="b01130"></a>
## b01130 — word/document\.xml/body/\*\[1130\]

```text
	
```

<a id="b01131"></a>
## b01131 — word/document\.xml/body/\*\[1131\]

```text
Threshold based real time replenishment is not leveraged for the go live. Over time, Covetrus will evaluate this and may use it. 
```

<a id="b01132"></a>
## b01132 — word/document\.xml/body/\*\[1132\]

```text

```

<a id="b01133"></a>
## b01133 — word/document\.xml/body/\*\[1133\]

```text
The need to replenish is evaluated against the primary picking locations to determine if there is enough available. If the quantity in the forward pick floor locations is below the minimum replenishment threshold percentage configured, SCALE will request the product in configured increments of UM.
```

<a id="b01134"></a>
## b01134 — word/document\.xml/body/\*\[1134\]

```text

```

<a id="b01135"></a>
## b01135 — word/document\.xml/body/\*\[1135\]

```text

```

<a id="b01136"></a>
## b01136 — word/document\.xml/body/\*\[1136\]

```text
Figure – Item Location Capacity with Replenishment percentage
```

<a id="b01137"></a>
## b01137 — word/document\.xml/body/\*\[1137\]

```text

```

<a id="b01138"></a>
## b01138 — word/document\.xml/body/\*\[1138\]

```text
		
```

<a id="b01139"></a>
## b01139 — word/document\.xml/body/\*\[1139\]

```text
		Since demand replenishment runs throughout the day in advance to the waves, adding real time replenishment at the same time may bring more than required inventory to the forward locations causing operational challenges. When setup, Covetrus leverages real time replenishment for fast-moving items on a scheduled basis, and leverages alerts/reporting to monitor open capacity-based replenishment and delete those open replenishments request.
```

<a id="b01140"></a>
## b01140 — word/document\.xml/body/\*\[1140\]

```text

```

<a id="b01141"></a>
## b01141 — word/document\.xml/body/\*\[1141\]

```text
	
```

<a id="b01142"></a>
## b01142 — word/document\.xml/body/\*\[1142\]

```text
		Replenishment Allocation  
```

<a id="b01143"></a>
## b01143 — word/document\.xml/body/\*\[1143\]

```text
	
```

<a id="b01144"></a>
## b01144 — word/document\.xml/body/\*\[1144\]

```text
	Covetrus’ allocation for replenishment is to attempt to allocate using First Expiration First Out for lot tracked items, and available most available first for non-lot tracked items, that fills the entire forward location from the rack location. The rules are ported over from the existing setup.
```

<a id="b01145"></a>
## b01145 — word/document\.xml/body/\*\[1145\]

```text
	
```

<a id="b01146"></a>
## b01146 — word/document\.xml/body/\*\[1146\]

```text
			Location Type		Description
	1		Active		Single Item
	Permanently Assigned
	No License Plate Tracking
	Multiple Lots
	Allocate In Transit
	2		Reserve Static		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
	3		Reserve Rack		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
	4		Reserve Floor		Single Item
	Dynamically Assigned
	License Plate Tracking
	Single Lot
	No Allocate in Transit
```

<a id="b01147"></a>
## b01147 — word/document\.xml/body/\*\[1147\]

```text
	
```

<a id="b01148"></a>
## b01148 — word/document\.xml/body/\*\[1148\]

```text
	
```

<a id="b01149"></a>
## b01149 — word/document\.xml/body/\*\[1149\]

```text
	Replenishment Allocation:
```

<a id="b01150"></a>
## b01150 — word/document\.xml/body/\*\[1150\]

```text
	
```

<a id="b01151"></a>
## b01151 — word/document\.xml/body/\*\[1151\]

```text
	Lot tracked Items :
```

<a id="b01152"></a>
## b01152 — word/document\.xml/body/\*\[1152\]

```text
Sequence	Strategy	Location Selection	Eligible UMs
10	First Expiration, First Out	Reserve 	EA, IP, SB, CS, PL
20	First Expiration, First Out	Active Bulk 	EA, IP, SB, CS
```

<a id="b01153"></a>
## b01153 — word/document\.xml/body/\*\[1153\]

```text
. 
```

<a id="b01154"></a>
## b01154 — word/document\.xml/body/\*\[1154\]

```text
	Non lot tracked items -
```

<a id="b01155"></a>
## b01155 — word/document\.xml/body/\*\[1155\]

```text
Sequence	Strategy	Location Selection	Eligible UMs
10	First In, First Out	Reserve 	EA, IP, SB, CS, PL
20	First In, First Out	Active Bulk 	EA, IP, SB, CS
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
		Note: The existing replenishment rules are ported over for Covetrus and during the build phase Covetrus evaluates all replenishment masters and allocation rule for other item categories as well.
```

<a id="b01159"></a>
## b01159 — word/document\.xml/body/\*\[1159\]

```text

```

<a id="b01160"></a>
## b01160 — word/document\.xml/body/\*\[1160\]

```text
	
```

<a id="b01161"></a>
## b01161 — word/document\.xml/body/\*\[1161\]

```text
		Replenishment Work Creation  
```

<a id="b01162"></a>
## b01162 — word/document\.xml/body/\*\[1162\]

```text
	
```

<a id="b01163"></a>
## b01163 — word/document\.xml/body/\*\[1163\]

```text
The replenishment work creation process is like the work creation process performed during the locating portion of the receiving process.  After performing replenishment, SCALE creates a Work Unit to pick the inventory from its reserve location and transport it to Primary bins or dynamic active locations.  Based on the configuration in the Work Group, Work Type, Work Criteria, and Work Creation Master, the system analyzes, sorts, and bundles the replenishment requests to create a Work Unit. This Work Unit consists of only one items from one storage or reserve locations.  
```

<a id="b01164"></a>
## b01164 — word/document\.xml/body/\*\[1164\]

```text

```

<a id="b01165"></a>
## b01165 — word/document\.xml/body/\*\[1165\]

```text
Most DCs create replenishment work based on Hi or Low zones. However, this is not a standardized setup and DCs may change this on their discretion. Manhattan recommends to have standardized replenishment masters for layout and/or operating profiles.
```

<a id="b01166"></a>
## b01166 — word/document\.xml/body/\*\[1166\]

```text

```

<a id="b01167"></a>
## b01167 — word/document\.xml/body/\*\[1167\]

```text

```

<a id="b01168"></a>
## b01168 — word/document\.xml/body/\*\[1168\]

```text
Figure – Existing replenishment work criteria – Hi Zone
```

<a id="b01169"></a>
## b01169 — word/document\.xml/body/\*\[1169\]

```text

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
Figure – Existing replenishment work criteria – Hi Zone
```

<a id="b01173"></a>
## b01173 — word/document\.xml/body/\*\[1173\]

```text

```

<a id="b01174"></a>
## b01174 — word/document\.xml/body/\*\[1174\]

```text

```

<a id="b01175"></a>
## b01175 — word/document\.xml/body/\*\[1175\]

```text
Figure – Existing replenishment work criteria – Low Zone
```

<a id="b01176"></a>
## b01176 — word/document\.xml/body/\*\[1176\]

```text

```

<a id="b01177"></a>
## b01177 — word/document\.xml/body/\*\[1177\]

```text

```

<a id="b01178"></a>
## b01178 — word/document\.xml/body/\*\[1178\]

```text
Replenishment work created in the wave will have a higher priority than the replenishment work created by manually capacity based replenishments. The user then receive this replenishment work first, as replenishment is system directed work in most work profiles configured currently. 
```

<a id="b01179"></a>
## b01179 — word/document\.xml/body/\*\[1179\]

```text

```

<a id="b01180"></a>
## b01180 — word/document\.xml/body/\*\[1180\]

```text
		Replenishment Work Execution 
```

<a id="b01181"></a>
## b01181 — word/document\.xml/body/\*\[1181\]

```text
		
```

<a id="b01182"></a>
## b01182 — word/document\.xml/body/\*\[1182\]

```text
Replenishment work is performed within SCALE as System Directed work. Users sign onto an RF warehouse mobile device and choose the RF Work option. Users then choose the Demand Replenishment or Capacity Replenishment work profile.  The user is then prompted to scan a location for SCALE to assign a Work Unit in closest proximity. The user is assigned a Work Unit and SCALE then presents the user with the first pick which displays the location, item, and quantity to be picked.  Users are required to verify the pick by scanning the location check digit and then hitting OK.  Once all the picks have been completed (all picks can be any number of items – this is defined by Covetrus), SCALE displays a putaway screen where the user confirms the putaway to forward pick location(s) that the inventory should be stored in.  These forward pick locations can also force validation from the user (this is configurable – location or check digit validation).  After this, the user can be assigned the next Work Unit.
```

<a id="b01183"></a>
## b01183 — word/document\.xml/body/\*\[1183\]

```text

```

<a id="b01184"></a>
## b01184 — word/document\.xml/body/\*\[1184\]

```text

```

<a id="b01185"></a>
## b01185 — word/document\.xml/body/\*\[1185\]

```text
Figure - Replenishment Work Execution
```

<a id="b01186"></a>
## b01186 — word/document\.xml/body/\*\[1186\]

```text
Once the Replenishment Work is completed the inventory will be available at the pick face location. The inventory on the pick location is then available for shipment picking.
```

<a id="b01187"></a>
## b01187 — word/document\.xml/body/\*\[1187\]

```text

```

<a id="b01188"></a>
## b01188 — word/document\.xml/body/\*\[1188\]

```text
WORK ORDERS
```

<a id="b01189"></a>
## b01189 — word/document\.xml/body/\*\[1189\]

```text

```

<a id="b01190"></a>
## b01190 — word/document\.xml/body/\*\[1190\]

```text
Covetrus does not use work orders. 
```

<a id="b01191"></a>
## b01191 — word/document\.xml/body/\*\[1191\]

```text

```

<a id="b01192"></a>
## b01192 — word/document\.xml/body/\*\[1192\]

```text
IV.   OUTBOUND
```

<a id="b01193"></a>
## b01193 — word/document\.xml/body/\*\[1193\]

```text

```

<a id="b01194"></a>
## b01194 — word/document\.xml/body/\*\[1194\]

```text
Outbound is the process in SCALE whereby inventory is shipped out of the warehouse via Shipments. From a high-level perspective, the following processes are required. Rectangles represent processes normally done by the system and trapezoids represent processes normally requiring user interaction.
```

<a id="b01195"></a>
## b01195 — word/document\.xml/body/\*\[1195\]

```text

```

<a id="b01196"></a>
## b01196 — word/document\.xml/body/\*\[1196\]

```text

```

<a id="b01197"></a>
## b01197 — word/document\.xml/body/\*\[1197\]

```text
Figure 52 – High-Level typical SCALE Outbound Process
```

<a id="b01198"></a>
## b01198 — word/document\.xml/body/\*\[1198\]

```text

```

<a id="b01199"></a>
## b01199 — word/document\.xml/body/\*\[1199\]

```text
Shipment Creation 
```

<a id="b01200"></a>
## b01200 — word/document\.xml/body/\*\[1200\]

```text
This is the process by which a shipment is entered into the system. This is normally a system process that is initiated on a schedule to interface records from an existing host system. 
```

<a id="b01201"></a>
## b01201 — word/document\.xml/body/\*\[1201\]

```text

```

<a id="b01202"></a>
## b01202 — word/document\.xml/body/\*\[1202\]

```text
Wave Processing 
```

<a id="b01203"></a>
## b01203 — word/document\.xml/body/\*\[1203\]

```text
Assigning shipments to a wave and running the wave is normally a system process, whereby shipments are grouped logically based on user-defined criteria to be processed together during the outbound process. Example groupings include: ‘Priority Orders’, ‘High Volume Shipments with only one Item’ Once assigned to a Wave, the wave can be run either automatically or manually. Running the wave initiates, the processing of Wave Steps may include the following: Allocation, Work Creation, Carrier Assignment, Load Building, etc.
```

<a id="b01204"></a>
## b01204 — word/document\.xml/body/\*\[1204\]

```text

```

<a id="b01205"></a>
## b01205 — word/document\.xml/body/\*\[1205\]

```text
Picking 
```

<a id="b01206"></a>
## b01206 — word/document\.xml/body/\*\[1206\]

```text
This is typically a user process whereby the system directs users to picking locations in a logical sequence to retrieve inventory and bring it to packing stations, consolidation areas, or staging areas. 
```

<a id="b01207"></a>
## b01207 — word/document\.xml/body/\*\[1207\]

```text

```

<a id="b01208"></a>
## b01208 — word/document\.xml/body/\*\[1208\]

```text
Packing
```

<a id="b01209"></a>
## b01209 — word/document\.xml/body/\*\[1209\]

```text
This is typically a user process where inventory is placed into boxes and the boxes are identified in the system. There are three main options for performing packing (1) During the Wave where the system uses dimensions and configured Container Types to calculate the most efficient way to pack the items, (2) During the picking process where users identify what boxes the items are being picked into while they are being picked, (3) After picking where items are dropped off at discreet packing stations and a separate team packs items into boxes
```

<a id="b01210"></a>
## b01210 — word/document\.xml/body/\*\[1210\]

```text

```

<a id="b01211"></a>
## b01211 — word/document\.xml/body/\*\[1211\]

```text
Staging
```

<a id="b01212"></a>
## b01212 — word/document\.xml/body/\*\[1212\]

```text
This is a user process where containers are taken from a packing location to a staging area. Here they await the arrival of the method of transport. At this point, multiple shipping containers can be consolidated onto parent pallets for easier transport. This can also be a holding area where shipments are waiting for future shipping. 
```

<a id="b01213"></a>
## b01213 — word/document\.xml/body/\*\[1213\]

```text

```

<a id="b01214"></a>
## b01214 — word/document\.xml/body/\*\[1214\]

```text
Shipping 
```

<a id="b01215"></a>
## b01215 — word/document\.xml/body/\*\[1215\]

```text
This is a user process where shipments can be assigned to specific Shipping Loads and subsequently Load Confirmed. A Shipping Load can represent a lorry, a sea container, a van, etc. 
```

<a id="b01216"></a>
## b01216 — word/document\.xml/body/\*\[1216\]

```text

```

<a id="b01217"></a>
## b01217 — word/document\.xml/body/\*\[1217\]

```text
The assignment of a Carrier to a shipment can be done systematically during the wave or manually after the wave process. 
```

<a id="b01218"></a>
## b01218 — word/document\.xml/body/\*\[1218\]

```text

```

<a id="b01219"></a>
## b01219 — word/document\.xml/body/\*\[1219\]

```text
Loading is the action in which a user takes the shipping containers \ parent pallets and confirms them onto the truck via a dock door.
```

<a id="b01220"></a>
## b01220 — word/document\.xml/body/\*\[1220\]

```text

```

<a id="b01221"></a>
## b01221 — word/document\.xml/body/\*\[1221\]

```text
Load Confirmation is the process that represents the truck, container, etc. has already been loaded and has left the warehouse. The shipping process encompasses the dock management functionality of SCALE. Load Confirmation is the final status in the order flow in SCALE and represents the removal of stock from within the four walls of the warehouse
```

<a id="b01222"></a>
## b01222 — word/document\.xml/body/\*\[1222\]

```text

```

<a id="b01223"></a>
## b01223 — word/document\.xml/body/\*\[1223\]

```text
Shipment Trailing & Leading Statuses
```

<a id="b01224"></a>
## b01224 — word/document\.xml/body/\*\[1224\]

```text
These values are defined on the shipment header record. The trailing status is the least advanced status associated with the record; the leading status is the most advanced status associated with the record. The system obtains this information from the containers created for the header. You can use this information to research container activity and perform troubleshooting tasks.
```

<a id="b01225"></a>
## b01225 — word/document\.xml/body/\*\[1225\]

```text

```

<a id="b01226"></a>
## b01226 — word/document\.xml/body/\*\[1226\]

```text

```

<a id="b01227"></a>
## b01227 — word/document\.xml/body/\*\[1227\]

```text
Below are all the Outbound Execution default statuses available in SCALE:
```

<a id="b01228"></a>
## b01228 — word/document\.xml/body/\*\[1228\]

```text
(90) In Pool Pending: The shipment’s status before it is processed via the interface. The purpose of this status is to be a temporary status used by the interface download process to ensure that shipments do not get picked up for processing while the interface process is running. Also, shipments in this status cannot be added to a wave.
```

<a id="b01229"></a>
## b01229 — word/document\.xml/body/\*\[1229\]

```text
(100) In Pool: The shipment has not been processed in a wave but has been created in the pool or downloaded via the interface. No work can be performed against this shipment.
```

<a id="b01230"></a>
## b01230 — word/document\.xml/body/\*\[1230\]

```text
(200) Wave Pending: The wave is being built. It has not been run.
```

<a id="b01231"></a>
## b01231 — word/document\.xml/body/\*\[1231\]

```text
(201) In Wave: A wave run was initiated, and the wave has not been released.
```

<a id="b01232"></a>
## b01232 — word/document\.xml/body/\*\[1232\]

```text
(300) Picking Pending: A wave was released, but none of the work has been initiated.
```

<a id="b01233"></a>
## b01233 — word/document\.xml/body/\*\[1233\]

```text
(301) In Picking: At least one work instruction associated with this shipment has been assigned to an employee.
```

<a id="b01234"></a>
## b01234 — word/document\.xml/body/\*\[1234\]

```text
(400) Packing Pending: At least one work instruction associated with this shipment has been pick confirmed. It can now be packed.
```

<a id="b01235"></a>
## b01235 — word/document\.xml/body/\*\[1235\]

```text
(401) In Packing: At least one work instruction associated with this shipment has been packed.
```

<a id="b01236"></a>
## b01236 — word/document\.xml/body/\*\[1236\]

```text
(600) Staging Pending: All items of a shipment have been picked, packed, and/or consolidated.
```

<a id="b01237"></a>
## b01237 — word/document\.xml/body/\*\[1237\]

```text
(650) Loading Pending: All items of a shipment have been picked, packed, or consolidated, and/or staged.
```

<a id="b01238"></a>
## b01238 — word/document\.xml/body/\*\[1238\]

```text
(700) Ship Confirm Pending: At least one container associated with this shipment has been closed.
```

<a id="b01239"></a>
## b01239 — word/document\.xml/body/\*\[1239\]

```text
(800) Load Confirm Pending: All shipments on the load have been ship confirmed and the load is ready to be confirmed.
```

<a id="b01240"></a>
## b01240 — word/document\.xml/body/\*\[1240\]

```text
(900) Closed: The shipping load has been confirmed.
```

<a id="b01241"></a>
## b01241 — word/document\.xml/body/\*\[1241\]

```text
(998) Delete Rejected: A quantity on a shipment detail line was rejected. The quantity will be deleted from the system.
```

<a id="b01242"></a>
## b01242 — word/document\.xml/body/\*\[1242\]

```text
(999) Rejected: During allocation, if any quantity on the line is rejected, this status will indicate that rejected quantity
```

<a id="b01243"></a>
## b01243 — word/document\.xml/body/\*\[1243\]

```text
		
```

<a id="b01244"></a>
## b01244 — word/document\.xml/body/\*\[1244\]

```text
WAVE PROCESSING
```

<a id="b01245"></a>
## b01245 — word/document\.xml/body/\*\[1245\]

```text

```

<a id="b01246"></a>
## b01246 — word/document\.xml/body/\*\[1246\]

```text
A wave is a method for retrieving shipments from the pool and processing them through a wave flow. All shipments are processed through the system in a wave (a wave is simply a collection of shipments that generate an amount of work that can be handled by the operation in a single session). All wave activity is defined on the wave master record. 
```

<a id="b01247"></a>
## b01247 — word/document\.xml/body/\*\[1247\]

```text

```

<a id="b01248"></a>
## b01248 — word/document\.xml/body/\*\[1248\]

```text
Outbound shipments are created in Host and sent to SCALE. On a scheduled basis, these shipments are interfaced into SCALE. Any orders that fail validation are logged for further review and will be reviewed manually by looking at the Interface Error Insight screen for corrective actions. Once corrected, the shipment(s) can be reprocessed during the next scheduled interface download (or the interface can be manually invoked).
```

<a id="b01249"></a>
## b01249 — word/document\.xml/body/\*\[1249\]

```text

```

<a id="b01250"></a>
## b01250 — word/document\.xml/body/\*\[1250\]

```text
Once successfully downloaded, the shipments are viewable as SCALE shipments in the Pool in the Planned Shipment Insight. The shipments can be viewed by Order Type and Scheduled Ship Date (Covetrus can create Planned shipment filter criteria records to view shipments in pool by other criteria of their choice). 
```

<a id="b01251"></a>
## b01251 — word/document\.xml/body/\*\[1251\]

```text

```

<a id="b01252"></a>
## b01252 — word/document\.xml/body/\*\[1252\]

```text

```

<a id="b01253"></a>
## b01253 — word/document\.xml/body/\*\[1253\]

```text
Figure - Planned Shipment Insight
```

<a id="b01254"></a>
## b01254 — word/document\.xml/body/\*\[1254\]

```text

```

<a id="b01255"></a>
## b01255 — word/document\.xml/body/\*\[1255\]

```text
The following order profiles are used by Covetrus Host.
```

<a id="b01256"></a>
## b01256 — word/document\.xml/body/\*\[1256\]

```text
 
```

<a id="b01257"></a>
## b01257 — word/document\.xml/body/\*\[1257\]

```text

```

<a id="b01258"></a>
## b01258 — word/document\.xml/body/\*\[1258\]

```text
Order Profile	Description	Interfaced	Frequency 
Direct transfer (DRP)	Transfer orders created from NDSC to other DCs
Allocate Complete via ODWS
Can allocate available inventory status only	Y	Random
TL/LTL	Allocate Complete
Can allocate available status only.
May have specific lot request interfaced on shipment detail. example universities doing tests that may need the same lot and is interfaced on detail. SPO (Special Purchase Order exceptions) - without specific item numbers. Uses lot. Could be a line on any order type.
Carrier type is TL/LTL
Mode of transport – Prepaid, Collect	Y	Random
Parcel Domestic	Carrier is interfaced – UPS, USPS, FedEx
Service is interfaced
allocate complete
Can allocate available status only	Y	Random
Parcel International	Shipment is processed in SCALE, but logistics is outside of SCALE. No manifesting/paperwork using SCALE integration
Carrier is interfaced – UPS, USPS, FedEx	Y	Rare (<5%)
```

<a id="b01259"></a>
## b01259 — word/document\.xml/body/\*\[1259\]

```text

```

<a id="b01260"></a>
## b01260 — word/document\.xml/body/\*\[1260\]

```text

```

<a id="b01261"></a>
## b01261 — word/document\.xml/body/\*\[1261\]

```text
		Waving Strategy
```

<a id="b01262"></a>
## b01262 — word/document\.xml/body/\*\[1262\]

```text

```

<a id="b01263"></a>
## b01263 — word/document\.xml/body/\*\[1263\]

```text
Covetrus’ waving strategy is to wave by priority or cut-off times for the orders in the pool. A wave for LTL is sometimes run to see the estimated number of pallets for wave [AI0028 – Show # of Pallet Tile on Wave Insight]. This gives visibility into the number of trucks expected for the shipments/wave and lets the transportation team plan for it. Covetrus does not wave for a truck – aka, do not wave by cubing for a truck, hence, one wave may result in multiple load numbers. 
```

<a id="b01264"></a>
## b01264 — word/document\.xml/body/\*\[1264\]

```text

```

<a id="b01265"></a>
## b01265 — word/document\.xml/body/\*\[1265\]

```text
Shipments interfaced into SCALE are processed differently depending on the shipment order type. Every shipment that is interfaced has a unique item per line with the requested quantity in the lowest unit of measure.
```

<a id="b01266"></a>
## b01266 — word/document\.xml/body/\*\[1266\]

```text

```

<a id="b01267"></a>
## b01267 — word/document\.xml/body/\*\[1267\]

```text
The waving supervisor monitors the Planned Shipment Insight with preconfigured filters called Planned Shipment filters. Covetrus runs several waves throughout the day.
```

<a id="b01268"></a>
## b01268 — word/document\.xml/body/\*\[1268\]

```text

```

<a id="b01269"></a>
## b01269 — word/document\.xml/body/\*\[1269\]

```text
Planned Shipment Filters display planned shipments based on the criteria that you select. You could, for example, define a rule in SCALE configuration for a particular customer, carrier, and order type. You could then display shipment records that meet those criteria in the Planned Shipment Insight. You can define pool views using any combination of shipment or shipment line values. If you specify a shipment line in your filter criteria, the system will use it to determine if shipments should be included in a pool view. If a shipment line matches a rule, then the system will select the entire shipment for the pool view.
```

<a id="b01270"></a>
## b01270 — word/document\.xml/body/\*\[1270\]

```text
 
```

<a id="b01271"></a>
## b01271 — word/document\.xml/body/\*\[1271\]

```text
Covetrus uses the existing planned shipment filter criteria are created aiding in the waving strategy. Covetrus may create additional filters as needed.
```

<a id="b01272"></a>
## b01272 — word/document\.xml/body/\*\[1272\]

```text

```

<a id="b01273"></a>
## b01273 — word/document\.xml/body/\*\[1273\]

```text

```

<a id="b01274"></a>
## b01274 — word/document\.xml/body/\*\[1274\]

```text
		Wave Flow
```

<a id="b01275"></a>
## b01275 — word/document\.xml/body/\*\[1275\]

```text

```

<a id="b01276"></a>
## b01276 — word/document\.xml/body/\*\[1276\]

```text
A wave flow is a grouping of wave steps. These flows determine which wave steps that a shipment will be processed through, and the order in which the wave steps will be processed. Once a wave flow is created, it can be associated with the appropriate wave on the Wave Master Window. (Defined later in the document)
```

<a id="b01277"></a>
## b01277 — word/document\.xml/body/\*\[1277\]

```text

```

<a id="b01278"></a>
## b01278 — word/document\.xml/body/\*\[1278\]

```text
Covetrus uses existing wave flows and wave masters. 
```

<a id="b01279"></a>
## b01279 — word/document\.xml/body/\*\[1279\]

```text

```

<a id="b01280"></a>
## b01280 — word/document\.xml/body/\*\[1280\]

```text
Specific wave flows for DCs currently. Opportunity with wave master access by WH.
```

<a id="b01281"></a>
## b01281 — word/document\.xml/body/\*\[1281\]

```text

```

<a id="b01282"></a>
## b01282 — word/document\.xml/body/\*\[1282\]

```text
Config and Testing Note: Several custom override data wave steps used currently are in review and may not be needed with base functionality being leveraged. Covetrus acknowledges that these will be validated during the build and testing phases of the project and removed if not used. 
```

<a id="b01283"></a>
## b01283 — word/document\.xml/body/\*\[1283\]

```text

```

<a id="b01284"></a>
## b01284 — word/document\.xml/body/\*\[1284\]

```text

```

<a id="b01285"></a>
## b01285 — word/document\.xml/body/\*\[1285\]

```text

```

<a id="b01286"></a>
## b01286 — word/document\.xml/body/\*\[1286\]

```text

```

<a id="b01287"></a>
## b01287 — word/document\.xml/body/\*\[1287\]

```text

```

<a id="b01288"></a>
## b01288 — word/document\.xml/body/\*\[1288\]

```text

```

<a id="b01289"></a>
## b01289 — word/document\.xml/body/\*\[1289\]

```text

```

<a id="b01290"></a>
## b01290 — word/document\.xml/body/\*\[1290\]

```text

```

<a id="b01291"></a>
## b01291 — word/document\.xml/body/\*\[1291\]

```text

```

<a id="b01292"></a>
## b01292 — word/document\.xml/body/\*\[1292\]

```text

```

<a id="b01293"></a>
## b01293 — word/document\.xml/body/\*\[1293\]

```text

```

<a id="b01294"></a>
## b01294 — word/document\.xml/body/\*\[1294\]

```text

```

<a id="b01295"></a>
## b01295 — word/document\.xml/body/\*\[1295\]

```text

```

<a id="b01296"></a>
## b01296 — word/document\.xml/body/\*\[1296\]

```text

```

<a id="b01297"></a>
## b01297 — word/document\.xml/body/\*\[1297\]

```text
Figure – Example exiting wave flow
```

<a id="b01298"></a>
## b01298 — word/document\.xml/body/\*\[1298\]

```text

```

<a id="b01299"></a>
## b01299 — word/document\.xml/body/\*\[1299\]

```text

```

<a id="b01300"></a>
## b01300 — word/document\.xml/body/\*\[1300\]

```text
Figure – Example exiting wave master
```

<a id="b01301"></a>
## b01301 — word/document\.xml/body/\*\[1301\]

```text

```

<a id="b01302"></a>
## b01302 — word/document\.xml/body/\*\[1302\]

```text

```

<a id="b01303"></a>
## b01303 — word/document\.xml/body/\*\[1303\]

```text
Figure – Example exiting wave master selection criteria
```

<a id="b01304"></a>
## b01304 — word/document\.xml/body/\*\[1304\]

```text

```

<a id="b01305"></a>
## b01305 — word/document\.xml/body/\*\[1305\]

```text

```

<a id="b01306"></a>
## b01306 — word/document\.xml/body/\*\[1306\]

```text

```

<a id="b01307"></a>
## b01307 — word/document\.xml/body/\*\[1307\]

```text
Figure – Example exiting wave master with replenishment master access
```

<a id="b01308"></a>
## b01308 — word/document\.xml/body/\*\[1308\]

```text

```

<a id="b01309"></a>
## b01309 — word/document\.xml/body/\*\[1309\]

```text

```

<a id="b01310"></a>
## b01310 — word/document\.xml/body/\*\[1310\]

```text
Figure – Example wave master with warehouse access
```

<a id="b01311"></a>
## b01311 — word/document\.xml/body/\*\[1311\]

```text

```

<a id="b01312"></a>
## b01312 — word/document\.xml/body/\*\[1312\]

```text
	Config Note: Wave master access is setup by warehouse. 
```

<a id="b01313"></a>
## b01313 — word/document\.xml/body/\*\[1313\]

```text
		
```

<a id="b01314"></a>
## b01314 — word/document\.xml/body/\*\[1314\]

```text
		Wave Selection
```

<a id="b01315"></a>
## b01315 — word/document\.xml/body/\*\[1315\]

```text

```

<a id="b01316"></a>
## b01316 — word/document\.xml/body/\*\[1316\]

```text
The wave selection process describes the use of wave flows and the wave masters. It also describes the process of running these waves. Covetrus leverages the criteria mentioned above to select orders and batch them to be run as a wave. 
```

<a id="b01317"></a>
## b01317 — word/document\.xml/body/\*\[1317\]

```text

```

<a id="b01318"></a>
## b01318 — word/document\.xml/body/\*\[1318\]

```text
The Wave Master defines the Wave Flow, Replenishment Master(s), and Paperwork Master for the wave. The wave flow defines the sequence and specific steps SCALE performs when running the wave. Examples of Wave Flow steps include allocation, work creation, printing documents, etc. The Wave Flows are defined via the Wave Flow windows in the fixed station Configuration option. The Replenishment Master defines what replenishment masters are eligible to evaluate demand within the wave. The paperwork master defines the documentation that is printed with the wave.
```

<a id="b01319"></a>
## b01319 — word/document\.xml/body/\*\[1319\]

```text

```

<a id="b01320"></a>
## b01320 — word/document\.xml/body/\*\[1320\]

```text

```

<a id="b01321"></a>
## b01321 — word/document\.xml/body/\*\[1321\]

```text
Add Shipments to Wave
```

<a id="b01322"></a>
## b01322 — word/document\.xml/body/\*\[1322\]

```text

```

<a id="b01323"></a>
## b01323 — word/document\.xml/body/\*\[1323\]

```text
To initiate the wave process, wave personnel select a shipment (or multi-selects more than one shipment) from the Planned Shipment Insight Screen. The results are Added to Wave. Next, the user is prompted to add the shipment(s) selected to an existing open wave, or they may select Create New Wave to manually assign the shipment(s) to a new wave.  When executing the New Wave action, the system prompts the user to select a Wave Master to act as a template that manages the movement of shipments through the wave cycle. User selects the appropriate wave master.
```

<a id="b01324"></a>
## b01324 — word/document\.xml/body/\*\[1324\]

```text

```

<a id="b01325"></a>
## b01325 — word/document\.xml/body/\*\[1325\]

```text
After confirming the Wave Master for the wave, the system assigns a wave number (via a next-up counter) to group the selected shipments.  The shipments are removed from their previous pool view. The wave is created in the Active Wave folder of the Wave Insight Screen. The wave has a unique wave number and the wave name as specified when creating the wave. 
```

<a id="b01326"></a>
## b01326 — word/document\.xml/body/\*\[1326\]

```text

```

<a id="b01327"></a>
## b01327 — word/document\.xml/body/\*\[1327\]

```text
Figure – Planned Shipment Insight screen
```

<a id="b01328"></a>
## b01328 — word/document\.xml/body/\*\[1328\]

```text

```

<a id="b01329"></a>
## b01329 — word/document\.xml/body/\*\[1329\]

```text

```

<a id="b01330"></a>
## b01330 — word/document\.xml/body/\*\[1330\]

```text
Figure – Add shipments to wave using Planned Shipment Insight
```

<a id="b01331"></a>
## b01331 — word/document\.xml/body/\*\[1331\]

```text

```

<a id="b01332"></a>
## b01332 — word/document\.xml/body/\*\[1332\]

```text
Config Note: Covetrus does not leverage the Build wave and auto release.
```

<a id="b01333"></a>
## b01333 — word/document\.xml/body/\*\[1333\]

```text

```

<a id="b01334"></a>
## b01334 — word/document\.xml/body/\*\[1334\]

```text

```

<a id="b01335"></a>
## b01335 — word/document\.xml/body/\*\[1335\]

```text
Operational Note: Covetrus consolidates shipments manually that are in pool due to a rejection earlier, to the shipment in process. Wave based consolidation is leveraged. 
```

<a id="b01336"></a>
## b01336 — word/document\.xml/body/\*\[1336\]

```text

```

<a id="b01337"></a>
## b01337 — word/document\.xml/body/\*\[1337\]

```text

```

<a id="b01338"></a>
## b01338 — word/document\.xml/body/\*\[1338\]

```text
		Run Wave
```

<a id="b01339"></a>
## b01339 — word/document\.xml/body/\*\[1339\]

```text

```

<a id="b01340"></a>
## b01340 — word/document\.xml/body/\*\[1340\]

```text
After reviewing the appropriate wave and making any necessary changes, personnel uses the Run Wave action on the desired wave in the Wave Insight Screen. Upon confirmation of the run wave request, the system executes the steps detailed in the Wave Flow associated with the wave. Upon completion of running the wave, the system moves the wave into the Completed Wave bucket. This can be seen by selecting the ‘Show Completed Wave’ status on the filter. 
```

<a id="b01341"></a>
## b01341 — word/document\.xml/body/\*\[1341\]

```text

```

<a id="b01342"></a>
## b01342 — word/document\.xml/body/\*\[1342\]

```text

```

<a id="b01343"></a>
## b01343 — word/document\.xml/body/\*\[1343\]

```text
Figure – Run wave using Wave Insight screen
```

<a id="b01344"></a>
## b01344 — word/document\.xml/body/\*\[1344\]

```text

```

<a id="b01345"></a>
## b01345 — word/document\.xml/body/\*\[1345\]

```text
		Wave masters for Covetrus are set to run manually. 
```

<a id="b01346"></a>
## b01346 — word/document\.xml/body/\*\[1346\]

```text

```

<a id="b01347"></a>
## b01347 — word/document\.xml/body/\*\[1347\]

```text

```

<a id="b01348"></a>
## b01348 — word/document\.xml/body/\*\[1348\]

```text
		Wave Steps
```

<a id="b01349"></a>
## b01349 — word/document\.xml/body/\*\[1349\]

```text

```

<a id="b01350"></a>
## b01350 — word/document\.xml/body/\*\[1350\]

```text
The following sections explain the logic the system uses when executing the various key wave steps that are included in standard wave flow. Please note that there may be additional wave steps that may be added during the build phase.
```

<a id="b01351"></a>
## b01351 — word/document\.xml/body/\*\[1351\]

```text

```

<a id="b01352"></a>
## b01352 — word/document\.xml/body/\*\[1352\]

```text
Start Wave
```

<a id="b01353"></a>
## b01353 — word/document\.xml/body/\*\[1353\]

```text

```

<a id="b01354"></a>
## b01354 — word/document\.xml/body/\*\[1354\]

```text
Start Wave is required for all wave flows and marks each shipment with a status of In Wave.
```

<a id="b01355"></a>
## b01355 — word/document\.xml/body/\*\[1355\]

```text

```

<a id="b01356"></a>
## b01356 — word/document\.xml/body/\*\[1356\]

```text

```

<a id="b01357"></a>
## b01357 — word/document\.xml/body/\*\[1357\]

```text
Replenishment
```

<a id="b01358"></a>
## b01358 — word/document\.xml/body/\*\[1358\]

```text

```

<a id="b01359"></a>
## b01359 — word/document\.xml/body/\*\[1359\]

```text
The piece/each demand from the wave is evaluated against the primary picking locations to determine if there is enough available.  If not, SCALE requests the product in case (or configured UM) increments by rounding up.  These replenishments create “In Transit” inventory to the forward picking locations which are then allocated by shipments during the Allocation wave step. This allocation is done leveraging FEFO strategy and is explained in more detail in the later sections of the document.
```

<a id="b01360"></a>
## b01360 — word/document\.xml/body/\*\[1360\]

```text

```

<a id="b01361"></a>
## b01361 — word/document\.xml/body/\*\[1361\]

```text

```

<a id="b01362"></a>
## b01362 — word/document\.xml/body/\*\[1362\]

```text
Override Data: Set Packing Class
```

<a id="b01363"></a>
## b01363 — word/document\.xml/body/\*\[1363\]

```text

```

<a id="b01364"></a>
## b01364 — word/document\.xml/body/\*\[1364\]

```text
Covetrus leverages a packing criterion to pack by categories. 
```

<a id="b01365"></a>
## b01365 — word/document\.xml/body/\*\[1365\]

```text

```

<a id="b01366"></a>
## b01366 — word/document\.xml/body/\*\[1366\]

```text
Allocation Rule Assignment 
```

<a id="b01367"></a>
## b01367 — word/document\.xml/body/\*\[1367\]

```text

```

<a id="b01368"></a>
## b01368 — word/document\.xml/body/\*\[1368\]

```text
During the allocation rule set assignment process, the system does the following:
```

<a id="b01369"></a>
## b01369 — word/document\.xml/body/\*\[1369\]

```text

```

<a id="b01370"></a>
## b01370 — word/document\.xml/body/\*\[1370\]

```text
Selects all shipment lines that do not have an allocation rule assigned.
```

<a id="b01371"></a>
## b01371 — word/document\.xml/body/\*\[1371\]

```text
Reviews each active allocation rule assignment record in priority order.
```

<a id="b01372"></a>
## b01372 — word/document\.xml/body/\*\[1372\]

```text
Using the filter tied to the allocation rule assignment record to determine eligibility, the system updates the allocation rule on the matching details. If the shipment line already had a rule assigned by a previous sequence, then it is only updated if the “Always Override” setting is selected.
```

<a id="b01373"></a>
## b01373 — word/document\.xml/body/\*\[1373\]

```text

```

<a id="b01374"></a>
## b01374 — word/document\.xml/body/\*\[1374\]

```text
This assignment is configurable based on the Shipment Header and Detail fields. Covetrus uses the current allocation rule criteria for existing requirements.
```

<a id="b01375"></a>
## b01375 — word/document\.xml/body/\*\[1375\]

```text

```

<a id="b01376"></a>
## b01376 — word/document\.xml/body/\*\[1376\]

```text
Operational Implication: Covetrus currently has allocation rule assignment evaluation priorities over 500. While these are not incremental, these are enough to have the number of evaluations be significant if the allocation rule assigned is towards the lower priority. This may lead to longer wave execution time frames. Covetrus acknowledges this and will review during the build phase of clean up opportunities. 
```

<a id="b01377"></a>
## b01377 — word/document\.xml/body/\*\[1377\]

```text

```

<a id="b01378"></a>
## b01378 — word/document\.xml/body/\*\[1378\]

```text

```

<a id="b01379"></a>
## b01379 — word/document\.xml/body/\*\[1379\]

```text
Allocation
```

<a id="b01380"></a>
## b01380 — word/document\.xml/body/\*\[1380\]

```text

```

<a id="b01381"></a>
## b01381 — word/document\.xml/body/\*\[1381\]

```text
SCALE allocates inventory towards a shipment by using the allocation rule defined on the shipment detail. Allocation rules define what locations and units of measure are eligible for allocation and how SCALE should allocate that inventory. For example, an allocation rule can be configured to allocate inventory only from Active bins and to allocate the inventory with the FEFO or FIFO. Allocation rules can have multiple sequences. SCALE attempts to allocate inventory using the first sequence and if inventory could not be 100% allocated, SCALE continues to the next allocation rule sequence to attempt to allocate the remaining inventory.
```

<a id="b01382"></a>
## b01382 — word/document\.xml/body/\*\[1382\]

```text

```

<a id="b01383"></a>
## b01383 — word/document\.xml/body/\*\[1383\]

```text
Allocation rules are set on the shipment detail in one of three ways. 
```

<a id="b01384"></a>
## b01384 — word/document\.xml/body/\*\[1384\]

```text
The allocation rule can be set at the item level (in the Item Master configuration) which in turn automatically defaults on the shipment detail.
```

<a id="b01385"></a>
## b01385 — word/document\.xml/body/\*\[1385\]

```text
The interface can also set the allocation rule on the shipment detail.
```

<a id="b01386"></a>
## b01386 — word/document\.xml/body/\*\[1386\]

```text
In addition, the allocation rule can be determined in the wave just prior to allocation occurring. This is done using the Allocation Rule Assignment functionality as defined in the above wave step. Allocation Rule Assignment sets the allocation rule on the shipment detail based on allocation rule assignment criteria. For example, based on the customer and order type, the allocation rule can be set to one, that is allocated in only full cases. If no allocation rule is set on the shipment detail, the *Default allocation rule is used. 
```

<a id="b01387"></a>
## b01387 — word/document\.xml/body/\*\[1387\]

```text

```

<a id="b01388"></a>
## b01388 — word/document\.xml/body/\*\[1388\]

```text
To allow for maximum flexibility and easy addition of new items and allocation rules, the allocation rule is assigned on the Shipment Detail using the Allocation Rule Assignment functionality in the wave. Covetrus can still manually set the allocation rule in the interface or via the Shipment Detail screen as needed. 
```

<a id="b01389"></a>
## b01389 — word/document\.xml/body/\*\[1389\]

```text

```

<a id="b01390"></a>
## b01390 — word/document\.xml/body/\*\[1390\]

```text
Allocation strategy and allocation location selection are two of the key configurations used in determining the allocation location.
```

<a id="b01391"></a>
## b01391 — word/document\.xml/body/\*\[1391\]

```text

```

<a id="b01392"></a>
## b01392 — word/document\.xml/body/\*\[1392\]

```text
An allocation strategy is a method for selecting picking locations based on a storage management goal, such as emptying locations. These strategies are predefined and represent a specific system algorithm that the system uses to allocate product.
```

<a id="b01393"></a>
## b01393 — word/document\.xml/body/\*\[1393\]

```text

```

<a id="b01394"></a>
## b01394 — word/document\.xml/body/\*\[1394\]

```text
Allocation Location Selection configuration allows users to filter by any field within the Location or Location Inventory tables in SCALE. Through the combination of pre-defined strategies and customer-driven location selections, SCALE can meet most allocation requirements. Each Allocation Rule Detail is made up of an Allocation Strategy and Location Selection.
```

<a id="b01395"></a>
## b01395 — word/document\.xml/body/\*\[1395\]

```text

```

<a id="b01396"></a>
## b01396 — word/document\.xml/body/\*\[1396\]

```text
  
```

<a id="b01397"></a>
## b01397 — word/document\.xml/body/\*\[1397\]

```text
Allocate Complete
```

<a id="b01398"></a>
## b01398 — word/document\.xml/body/\*\[1398\]

```text

```

<a id="b01399"></a>
## b01399 — word/document\.xml/body/\*\[1399\]

```text
By setting the ‘Allocate Complete’ flag on the shipment header, SCALE does not perform any allocation for this shipment unless the shipment can be 100% allocated. For Covetrus, allocate complete functionality is used for defined order profiles.
```

<a id="b01400"></a>
## b01400 — word/document\.xml/body/\*\[1400\]

```text

```

<a id="b01401"></a>
## b01401 — word/document\.xml/body/\*\[1401\]

```text
Config and Interface Note: Host interfaces the shipments to SCALE with the allocate complete flag as ‘N’. An override in SCALE wave flow to mark this flag is required based on the order profiles. Direct transfer orders are allocate-complete.
```

<a id="b01402"></a>
## b01402 — word/document\.xml/body/\*\[1402\]

```text

```

<a id="b01403"></a>
## b01403 — word/document\.xml/body/\*\[1403\]

```text
Allocation Rejections
```

<a id="b01404"></a>
## b01404 — word/document\.xml/body/\*\[1404\]

```text

```

<a id="b01405"></a>
## b01405 — word/document\.xml/body/\*\[1405\]

```text
If the shipment line is not completely allocated, then the rejected portion of the line is sent back to the pool on a back order.
```

<a id="b01406"></a>
## b01406 — word/document\.xml/body/\*\[1406\]

```text

```

<a id="b01407"></a>
## b01407 — word/document\.xml/body/\*\[1407\]

```text
Config Note: Default status when a shipment is rejected is set to ‘In Pool’
```

<a id="b01408"></a>
## b01408 — word/document\.xml/body/\*\[1408\]

```text

```

<a id="b01409"></a>
## b01409 — word/document\.xml/body/\*\[1409\]

```text

```

<a id="b01410"></a>
## b01410 — word/document\.xml/body/\*\[1410\]

```text
Container Creation
```

<a id="b01411"></a>
## b01411 — word/document\.xml/body/\*\[1411\]

```text

```

<a id="b01412"></a>
## b01412 — word/document\.xml/body/\*\[1412\]

```text
Container creation is the process in which SCALE determines the number of containers and each container’s contents for every shipment on the wave.  A unique container number, commonly referred to as a UCC 128, is assigned to every container as it is created.  
```

<a id="b01413"></a>
## b01413 — word/document\.xml/body/\*\[1413\]

```text

```

<a id="b01414"></a>
## b01414 — word/document\.xml/body/\*\[1414\]

```text
SCALE first takes all items whose allocated unit of measure is set up as a ‘shippable unit’ and creates full containers.   Shippable units are defined in the item unit of measure configuration.  Full containers are containers that are shippable without repacking into another container (box).  Pallets, gaylords, and certain cases are generally configured as shippable units.
```

<a id="b01415"></a>
## b01415 — word/document\.xml/body/\*\[1415\]

```text

```

<a id="b01416"></a>
## b01416 — word/document\.xml/body/\*\[1416\]

```text
SCALE then takes the remaining ‘loose’ items whose allocated unit of measure is set up as ‘not shippable’ and groups them together by Packing Class. A Packing Class is defined on the Item Master and then defaulted on the Shipment Detail.    Each Packing Class is associated with a container group.   A container group is a listing of container types (box sizes) listed from largest container to smallest container.  SCALE attempts to cube items into the least number of containers possible.  The total weight and volume are calculated for all the items on the shipment with the same packing group.  SCALE first tries to cube into the first container of the container group.  If capacity still exists, the system tries cubing into the next container type and continues until either capacity in the next priority is reached or there are no additional priorities.  
```

<a id="b01417"></a>
## b01417 — word/document\.xml/body/\*\[1417\]

```text

```

<a id="b01418"></a>
## b01418 — word/document\.xml/body/\*\[1418\]

```text
If there is not enough capacity in the largest container, then SCALE cubes as much as possible into the largest container, calculates the remaining weight and volume, and starts over.   SCALE considers the critical dimensions of each item it creates containers.  An item is not cubed into a container if any one of its critical dimensions is greater than the corresponding container dimension.
```

<a id="b01419"></a>
## b01419 — word/document\.xml/body/\*\[1419\]

```text

```

<a id="b01420"></a>
## b01420 — word/document\.xml/body/\*\[1420\]

```text
If an item doesn’t have unit of measure record defined, then SCALE treats the item to have dimension of 0*0*0 and of weight 0 LB. Covetrus leverages reporting and SOPs to identify items with missing dimensions and handle exceptions.
```

<a id="b01421"></a>
## b01421 — word/document\.xml/body/\*\[1421\]

```text

```

<a id="b01422"></a>
## b01422 — word/document\.xml/body/\*\[1422\]

```text

```

<a id="b01423"></a>
## b01423 — word/document\.xml/body/\*\[1423\]

```text
3D Cubing 
```

<a id="b01424"></a>
## b01424 — word/document\.xml/body/\*\[1424\]

```text

```

<a id="b01425"></a>
## b01425 — word/document\.xml/body/\*\[1425\]

```text
Covetrus uses 3D cubing leveraging custom stabilizing codes. [EX26 – 3D Cubing]. This extension is new scope beyond the approved SOW.
```

<a id="b01426"></a>
## b01426 — word/document\.xml/body/\*\[1426\]

```text

```

<a id="b01427"></a>
## b01427 — word/document\.xml/body/\*\[1427\]

```text

```

<a id="b01428"></a>
## b01428 — word/document\.xml/body/\*\[1428\]

```text
Override Data: Assign Accessorial
```

<a id="b01429"></a>
## b01429 — word/document\.xml/body/\*\[1429\]

```text

```

<a id="b01430"></a>
## b01430 — word/document\.xml/body/\*\[1430\]

```text
Covetrus uses third party / customer account for billing some of their parcel shipments while the others are billed to Covetrus. For the third-party billing, Covetrus assigns accessorial to the required cartons for the parcel orders. 
```

<a id="b01431"></a>
## b01431 — word/document\.xml/body/\*\[1431\]

```text

```

<a id="b01432"></a>
## b01432 — word/document\.xml/body/\*\[1432\]

```text
Third party billing information is applied via an override data wave step (ODWS) in wave. Covetrus provides the account number, billing address and other information that has to be billed and interface to shipment header through shipment download interface. This ODWS reads the information and applies to the cartons when SCALE communicates to FedEx. During the build phase, the scope of this ODWS will be evaluated. 
```

<a id="b01433"></a>
## b01433 — word/document\.xml/body/\*\[1433\]

```text

```

<a id="b01434"></a>
## b01434 — word/document\.xml/body/\*\[1434\]

```text

```

<a id="b01435"></a>
## b01435 — word/document\.xml/body/\*\[1435\]

```text
QC Assignment 
```

<a id="b01436"></a>
## b01436 — word/document\.xml/body/\*\[1436\]

```text

```

<a id="b01437"></a>
## b01437 — word/document\.xml/body/\*\[1437\]

```text
Covetrus leverages existing wave based outbound QC assignment criteria for the go live. This is primarily used for TLC (Tender Love and Care) flagged orders. (Shipment Header Customer Category 1 = Yes)
```

<a id="b01438"></a>
## b01438 — word/document\.xml/body/\*\[1438\]

```text

```

<a id="b01439"></a>
## b01439 — word/document\.xml/body/\*\[1439\]

```text

```

<a id="b01440"></a>
## b01440 — word/document\.xml/body/\*\[1440\]

```text
VAS assignment
```

<a id="b01441"></a>
## b01441 — word/document\.xml/body/\*\[1441\]

```text

```

<a id="b01442"></a>
## b01442 — word/document\.xml/body/\*\[1442\]

```text
The VAS Assignment wave step assigns VAS activities to shipping containers for any interfaced VAS activity as well as other matching criteria configured within SCALE’s VAS Assignment Criteria.  This process is used in Covetrus implementation for following Pharmacy VAS.
```

<a id="b01443"></a>
## b01443 — word/document\.xml/body/\*\[1443\]

```text

```

<a id="b01444"></a>
## b01444 — word/document\.xml/body/\*\[1444\]

```text
Config Note: There are several VAS activities configured but are marked inactive other than Pharmacy. 
```

<a id="b01445"></a>
## b01445 — word/document\.xml/body/\*\[1445\]

```text

```

<a id="b01446"></a>
## b01446 — word/document\.xml/body/\*\[1446\]

```text
Pallet Building
```

<a id="b01447"></a>
## b01447 — word/document\.xml/body/\*\[1447\]

```text

```

<a id="b01448"></a>
## b01448 — word/document\.xml/body/\*\[1448\]

```text
Covetrus uses wave-based pallet building for LTL/TL order waves. 
```

<a id="b01449"></a>
## b01449 — word/document\.xml/body/\*\[1449\]

```text

```

<a id="b01450"></a>
## b01450 — word/document\.xml/body/\*\[1450\]

```text

```

<a id="b01451"></a>
## b01451 — word/document\.xml/body/\*\[1451\]

```text
Pallet Building consists of a set of requirements, strategy and the Container Type for the pallet being built.  The Container Type drives the dimensions, weight and height of the pallet so that these constraints are known so the build pallet meets the specifications defined in the configurations.
```

<a id="b01452"></a>
## b01452 — word/document\.xml/body/\*\[1452\]

```text

```

<a id="b01453"></a>
## b01453 — word/document\.xml/body/\*\[1453\]

```text
The Pallet Building Requirements help define the types of containers that should be included, but also sort these containers so that the pallets are built in the most efficient but cleanest way to keep boxes from crushing other boxes if stacked incorrectly.  Finally, the criterion helps define if any attribute should automatically break to a new pallet regardless of if the height or weight is met.  For customers that require that a pallet can contain only a single item, this break field is used to make sure that all items are on their own pallet.
```

<a id="b01454"></a>
## b01454 — word/document\.xml/body/\*\[1454\]

```text

```

<a id="b01455"></a>
## b01455 — word/document\.xml/body/\*\[1455\]

```text
Pallet Building Strategies take the Requirements and Container Type and build out the pallet.  The standard strategy takes the containers and builds out layers until the height or weight of the pallet meets the limits on the Container Type.  This strategy also needs to incorporate the grouping of items, so that SCALE does not attempt to ship two mixed pallets with the same item on both pallets.  This strategy looks out for any items that are not grouped together and consolidates these items onto the same pallet if they can be physically fit based on the quantity being shipped. 
```

<a id="b01456"></a>
## b01456 — word/document\.xml/body/\*\[1456\]

```text

```

<a id="b01457"></a>
## b01457 — word/document\.xml/body/\*\[1457\]

```text
Full cases picked from the selective reserve or case area may be palletized. Covetrus may use the Maximum Height and Weight Strategy for pallet building and uses the pallet building criteria to exclude full allocated pallets. Over time, Covetrus may setup additional criteria and strategies based on the product category. Pallet building criteria can be ordered by descending shipping container weight. 
```

<a id="b01458"></a>
## b01458 — word/document\.xml/body/\*\[1458\]

```text

```

<a id="b01459"></a>
## b01459 — word/document\.xml/body/\*\[1459\]

```text
Covetrus uses ‘Build Pallets using Height-Weight No Split Item’ strategy.
```

<a id="b01460"></a>
## b01460 — word/document\.xml/body/\*\[1460\]

```text

```

<a id="b01461"></a>
## b01461 — word/document\.xml/body/\*\[1461\]

```text
Pallet UM Conversion
```

<a id="b01462"></a>
## b01462 — word/document\.xml/body/\*\[1462\]

```text

```

<a id="b01463"></a>
## b01463 — word/document\.xml/body/\*\[1463\]

```text
Covetrus does not use this wave step
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
Override Data: Set status Flow at container level.
```

<a id="b01467"></a>
## b01467 — word/document\.xml/body/\*\[1467\]

```text

```

<a id="b01468"></a>
## b01468 — word/document\.xml/body/\*\[1468\]

```text
This wave step is used to set the custom status flow for the container.
```

<a id="b01469"></a>
## b01469 — word/document\.xml/body/\*\[1469\]

```text
Covetrus’ default TL/LT status flow is pick, stage, load. For following containers, the status flow includes packing status to execute the following activities:
```

<a id="b01470"></a>
## b01470 — word/document\.xml/body/\*\[1470\]

```text

```

<a id="b01471"></a>
## b01471 — word/document\.xml/body/\*\[1471\]

```text

```

<a id="b01472"></a>
## b01472 — word/document\.xml/body/\*\[1472\]

```text
Load Building
```

<a id="b01473"></a>
## b01473 — word/document\.xml/body/\*\[1473\]

```text

```

<a id="b01474"></a>
## b01474 — word/document\.xml/body/\*\[1474\]

```text
With this wave step, SCALE attempts to assign all shipments on the wave to a shipping load (using shipment criteria) for a carrier. The system executes this process as follows:
```

<a id="b01475"></a>
## b01475 — word/document\.xml/body/\*\[1475\]

```text

```

<a id="b01476"></a>
## b01476 — word/document\.xml/body/\*\[1476\]

```text
The system orders all of wave's shipments by carrier, ignoring shipments that do not have a carrier assigned.
```

<a id="b01477"></a>
## b01477 — word/document\.xml/body/\*\[1477\]

```text
The system takes each shipment and looks for any open loads for the carrier, scheduled ship date, and route. If the system finds one, the shipment is added to that load, unless the load is not flagged to stop additional shipments to it.
```

<a id="b01478"></a>
## b01478 — word/document\.xml/body/\*\[1478\]

```text
If there are no loads in the system for the carrier, scheduled ship date, and route, SCALE creates a new load for these parameters and places the shipment on this new load.
```

<a id="b01479"></a>
## b01479 — word/document\.xml/body/\*\[1479\]

```text

```

<a id="b01480"></a>
## b01480 — word/document\.xml/body/\*\[1480\]

```text

```

<a id="b01481"></a>
## b01481 — word/document\.xml/body/\*\[1481\]

```text
Dock Assignment
```

<a id="b01482"></a>
## b01482 — word/document\.xml/body/\*\[1482\]

```text

```

<a id="b01483"></a>
## b01483 — word/document\.xml/body/\*\[1483\]

```text
Dock Assignment determines where product is moved to, after it is picked. This could be any one of the following: manifest station, staging location, or dock door. Covetrus defines a custom status flow for each of the different process flows in the system (defined above).  Based on the status flows, the Dock Assignment wave step assigns the correct packing, staging or dock door location for an order. This is controlled by three configurations: Dock Area Carrier Assignment, Dock Area Anchor Criteria and Dock Management Flow. 
```

<a id="b01484"></a>
## b01484 — word/document\.xml/body/\*\[1484\]

```text

```

<a id="b01485"></a>
## b01485 — word/document\.xml/body/\*\[1485\]

```text
A dock management flow record includes information that determines how the system will assign a dock location destination to a shipment line/container and if the line/container is eligible for assignment. Each flow record is made up of a series of detail records that identify what selection and assignment strategies that the system should use when a quantity hits a certain status in your status flow. You can indicate what type of dock location you want the system to assign to this entity. Also, both the flow header and detail(s) have a default location that the system will assign as a "fallback" option in case no eligible dock area/positions are found.
```

<a id="b01486"></a>
## b01486 — word/document\.xml/body/\*\[1486\]

```text

```

<a id="b01487"></a>
## b01487 — word/document\.xml/body/\*\[1487\]

```text
For Covetrus, the dock assignment is leveraged for TL/LTL as well as parcel shipments. SCALE assigns single staging locations to a shipment based on customer and carrier. Multiple dock management flow is used based on each of these parameters and dock door assignment happens manually later to create work. 
```

<a id="b01488"></a>
## b01488 — word/document\.xml/body/\*\[1488\]

```text

```

<a id="b01489"></a>
## b01489 — word/document\.xml/body/\*\[1489\]

```text
If a new shipment on a different wave needs to be added to a load that is staged, by base the new shipment (new wave) gets default staging lane that can be different than what is on the original. Covetrus uses manual SOP to assign the status flow for staging lane with the existing load. 
```

<a id="b01490"></a>
## b01490 — word/document\.xml/body/\*\[1490\]

```text

```

<a id="b01491"></a>
## b01491 — word/document\.xml/body/\*\[1491\]

```text
Work Creation 
```

<a id="b01492"></a>
## b01492 — word/document\.xml/body/\*\[1492\]

```text

```

<a id="b01493"></a>
## b01493 — word/document\.xml/body/\*\[1493\]

```text
The work creation process performed during the wave is like the work creation process performed during the locating portion of the receiving process. After performing allocation and container creation, SCALE creates a work unit to pick the inventory from a location (bins or racks) and transport the inventory to the shipping area based on the configuration in the Work Group, Work Type, Work Criteria, and Work Creation Master. Each location can be assigned a numeric value called Picking Sequence that can be used to sort the picks in an order other than alphabetical by location.
```

<a id="b01494"></a>
## b01494 — word/document\.xml/body/\*\[1494\]

```text

```

<a id="b01495"></a>
## b01495 — word/document\.xml/body/\*\[1495\]

```text
Work creation – Shipment Allocation
```

<a id="b01496"></a>
## b01496 — word/document\.xml/body/\*\[1496\]

```text

```

<a id="b01497"></a>
## b01497 — word/document\.xml/body/\*\[1497\]

```text
No shipment allocation work is created for Covetrus.
```

<a id="b01498"></a>
## b01498 — word/document\.xml/body/\*\[1498\]

```text

```

<a id="b01499"></a>
## b01499 — word/document\.xml/body/\*\[1499\]

```text
Work Creation Replenishment
```

<a id="b01500"></a>
## b01500 — word/document\.xml/body/\*\[1500\]

```text

```

<a id="b01501"></a>
## b01501 — word/document\.xml/body/\*\[1501\]

```text
The work creation process for replenishment during the wave is only for any demand-based replenishments that were created. The types of work that are generated from this wave step can be viewed in the Replenishment section of this document. There is no change to existing work creation setup.
```

<a id="b01502"></a>
## b01502 — word/document\.xml/body/\*\[1502\]

```text

```

<a id="b01503"></a>
## b01503 — word/document\.xml/body/\*\[1503\]

```text

```

<a id="b01504"></a>
## b01504 — word/document\.xml/body/\*\[1504\]

```text
Work Creation - Shipping Container
```

<a id="b01505"></a>
## b01505 — word/document\.xml/body/\*\[1505\]

```text

```

<a id="b01506"></a>
## b01506 — word/document\.xml/body/\*\[1506\]

```text
Following key Work Types are created: 
```

<a id="b01507"></a>
## b01507 — word/document\.xml/body/\*\[1507\]

```text

```

<a id="b01508"></a>
## b01508 — word/document\.xml/body/\*\[1508\]

```text
Work Type: Bulk Picking
```

<a id="b01509"></a>
## b01509 — word/document\.xml/body/\*\[1509\]

```text

```

<a id="b01510"></a>
## b01510 — word/document\.xml/body/\*\[1510\]

```text
One Work unit is created per configured max volume value.  Within the work unit the work instruction (picks) is sequenced by picking sequence. This is basically for any UOM where the treat as Loose is set to N.
```

<a id="b01511"></a>
## b01511 — word/document\.xml/body/\*\[1511\]

```text

```

<a id="b01512"></a>
## b01512 — word/document\.xml/body/\*\[1512\]

```text
Work Type: Cooler Picking
```

<a id="b01513"></a>
## b01513 — word/document\.xml/body/\*\[1513\]

```text

```

<a id="b01514"></a>
## b01514 — word/document\.xml/body/\*\[1514\]

```text
One work unit is created per shipping container. User will group a set of containers onto a Cart (this will enable group picking). If a cart has more than one item, the work instruction (picks) is sequenced by pick sequence. This work unit will contain all the items that have category configured to be cooler.
```

<a id="b01515"></a>
## b01515 — word/document\.xml/body/\*\[1515\]

```text

```

<a id="b01516"></a>
## b01516 — word/document\.xml/body/\*\[1516\]

```text
Work Type: Dry Pick – Pick and Pass
```

<a id="b01517"></a>
## b01517 — word/document\.xml/body/\*\[1517\]

```text

```

<a id="b01518"></a>
## b01518 — word/document\.xml/body/\*\[1518\]

```text
One work unit is created per shipping container. Within the work unit the work instruction (picks) is sequenced by picking sequence. These works are executed with Pick and Pass method.
```

<a id="b01519"></a>
## b01519 — word/document\.xml/body/\*\[1519\]

```text

```

<a id="b01520"></a>
## b01520 — word/document\.xml/body/\*\[1520\]

```text
Work Type: Dry Pick – Cart Pick
```

<a id="b01521"></a>
## b01521 — word/document\.xml/body/\*\[1521\]

```text

```

<a id="b01522"></a>
## b01522 — word/document\.xml/body/\*\[1522\]

```text
One work unit is created per shipping container. User will group a set of containers onto a Cart (this will enable group picking). If a cart has more than one item, the work instruction (picks) is sequenced by pick sequence. The items part of this work unit is not located in the loop.
```

<a id="b01523"></a>
## b01523 — word/document\.xml/body/\*\[1523\]

```text

```

<a id="b01524"></a>
## b01524 — word/document\.xml/body/\*\[1524\]

```text
 Work Type: Special Pick
```

<a id="b01525"></a>
## b01525 — word/document\.xml/body/\*\[1525\]

```text

```

<a id="b01526"></a>
## b01526 — word/document\.xml/body/\*\[1526\]

```text
One work unit is created per shipping container. User will group a set of containers onto a Cart (this will enable group picking). If a cart has more than one item, the work instruction (picks) is sequenced by pick sequence. The items part of this work unit needs special processing in the warehouse like limited quantity (formerly ORMD) and Hazmat. 
```

<a id="b01527"></a>
## b01527 — word/document\.xml/body/\*\[1527\]

```text

```

<a id="b01528"></a>
## b01528 — word/document\.xml/body/\*\[1528\]

```text
Limited quantity is not a discrete work type. 
```

<a id="b01529"></a>
## b01529 — word/document\.xml/body/\*\[1529\]

```text

```

<a id="b01530"></a>
## b01530 — word/document\.xml/body/\*\[1530\]

```text
Work Type: Pallet Pick
```

<a id="b01531"></a>
## b01531 — word/document\.xml/body/\*\[1531\]

```text

```

<a id="b01532"></a>
## b01532 — word/document\.xml/body/\*\[1532\]

```text
One work unit is created per pallet created in wave. All full cases from dry, bulk, or cooler locations are palletized. If a pallet has more than one item, the work instruction (picks) is sequenced by pick sequence. Note: Covetrus has existing pallet building criteria to mix items across zones onto a single pallet and also criteria resulting in a single pallet from a zone. 
```

<a id="b01533"></a>
## b01533 — word/document\.xml/body/\*\[1533\]

```text

```

<a id="b01534"></a>
## b01534 — word/document\.xml/body/\*\[1534\]

```text
Reserve – similar to pallet from dry reserve only
```

<a id="b01535"></a>
## b01535 — word/document\.xml/body/\*\[1535\]

```text

```

<a id="b01536"></a>
## b01536 — word/document\.xml/body/\*\[1536\]

```text

```

<a id="b01537"></a>
## b01537 — word/document\.xml/body/\*\[1537\]

```text
Paperwork - Labels
```

<a id="b01538"></a>
## b01538 — word/document\.xml/body/\*\[1538\]

```text

```

<a id="b01539"></a>
## b01539 — word/document\.xml/body/\*\[1539\]

```text
Covetrus uses existing paperwork setup. 
```

<a id="b01540"></a>
## b01540 — word/document\.xml/body/\*\[1540\]

```text

```

<a id="b01541"></a>
## b01541 — word/document\.xml/body/\*\[1541\]

```text
For Bulk Pick – Container Content Label (LBL03), Vendor Label (LBL02) or Shipping Label (LBL04) and Break labels (LBL05) are printed. The choice of Vendor Label or Shipping Label depends on the type of carrier associated with the shipment. 
```

<a id="b01542"></a>
## b01542 — word/document\.xml/body/\*\[1542\]

```text

```

<a id="b01543"></a>
## b01543 — word/document\.xml/body/\*\[1543\]

```text
For Cooler Pick – Container Content Label (LBL03), Vendor Label (LBL02) or Shipping Label (LBL04) are printed. Labels will be printed in order of picking sequence. The choice of Vendor Label or Shipping Label depends on the type of carrier associated with the shipment.
```

<a id="b01544"></a>
## b01544 — word/document\.xml/body/\*\[1544\]

```text

```

<a id="b01545"></a>
## b01545 — word/document\.xml/body/\*\[1545\]

```text

```

<a id="b01546"></a>
## b01546 — word/document\.xml/body/\*\[1546\]

```text
For Dry Pick - Container Content Label (LBL03), Vendor Label (LBL02) or Shipping Label (LBL04) are printed. Labels will be printed in order of picking sequence. The choice of Vendor Label or Shipping Label depends on the type of carrier associated with the shipment.
```

<a id="b01547"></a>
## b01547 — word/document\.xml/body/\*\[1547\]

```text

```

<a id="b01548"></a>
## b01548 — word/document\.xml/body/\*\[1548\]

```text
For Special Pick - Container Content Label (LBL03), Vendor Label (LBL02) or Shipping Label (LBL04) are printed. Labels will be printed in order of picking sequence. The choice of Vendor Label or Shipping Label depends on the type of carrier associated with the shipment.
```

<a id="b01549"></a>
## b01549 — word/document\.xml/body/\*\[1549\]

```text

```

<a id="b01550"></a>
## b01550 — word/document\.xml/body/\*\[1550\]

```text
For Pallet Pick - Container Content Label (LBL03), Vendor Label (LBL02) and Pallet Label (LBL06) are printed. Labels will be printed in order of picking sequence.
```

<a id="b01551"></a>
## b01551 — word/document\.xml/body/\*\[1551\]

```text

```

<a id="b01552"></a>
## b01552 — word/document\.xml/body/\*\[1552\]

```text
		
```

<a id="b01553"></a>
## b01553 — word/document\.xml/body/\*\[1553\]

```text

```

<a id="b01554"></a>
## b01554 — word/document\.xml/body/\*\[1554\]

```text
Paperwork – Documents
```

<a id="b01555"></a>
## b01555 — word/document\.xml/body/\*\[1555\]

```text

```

<a id="b01556"></a>
## b01556 — word/document\.xml/body/\*\[1556\]

```text
Some DCs print a shipment pack list to complement the visual check for DEA 	 which is handled outside of SCALE. No other documents are printed in the wave. 
```

<a id="b01557"></a>
## b01557 — word/document\.xml/body/\*\[1557\]

```text

```

<a id="b01558"></a>
## b01558 — word/document\.xml/body/\*\[1558\]

```text

```

<a id="b01559"></a>
## b01559 — word/document\.xml/body/\*\[1559\]

```text
Override Data: Check for No Work
```

<a id="b01560"></a>
## b01560 — word/document\.xml/body/\*\[1560\]

```text

```

<a id="b01561"></a>
## b01561 — word/document\.xml/body/\*\[1561\]

```text
This Override Data Wave Step ensures that the Work Creation configurations are correct, and every Shipment has work created successfully, otherwise marks the wave for failure.
```

<a id="b01562"></a>
## b01562 — word/document\.xml/body/\*\[1562\]

```text
	
```

<a id="b01563"></a>
## b01563 — word/document\.xml/body/\*\[1563\]

```text

```

<a id="b01564"></a>
## b01564 — word/document\.xml/body/\*\[1564\]

```text
Multiple ODWS placeholder
```

<a id="b01565"></a>
## b01565 — word/document\.xml/body/\*\[1565\]

```text
	
```

<a id="b01566"></a>
## b01566 — word/document\.xml/body/\*\[1566\]

```text
Covetrus may user multiple other override data wave steps. This is a placeholder for it. There are other steps in current system included in other wave flows that mostly have programmatic checks ensuring that ineligible order types are not waved in those wave flows. 
```

<a id="b01567"></a>
## b01567 — word/document\.xml/body/\*\[1567\]

```text

```

<a id="b01568"></a>
## b01568 — word/document\.xml/body/\*\[1568\]

```text
Complete Wave
```

<a id="b01569"></a>
## b01569 — word/document\.xml/body/\*\[1569\]

```text

```

<a id="b01570"></a>
## b01570 — word/document\.xml/body/\*\[1570\]

```text
Complete Wave updates each shipment with a status of Picking Pending.  Shipments with this status are now eligible for release.
```

<a id="b01571"></a>
## b01571 — word/document\.xml/body/\*\[1571\]

```text

```

<a id="b01572"></a>
## b01572 — word/document\.xml/body/\*\[1572\]

```text
There may be additional wave steps to the above that Covetrus can leverage for various wave flows though the ones mentioned above are the key. Examples may include updating user-defined fields for any reporting needs.
```

<a id="b01573"></a>
## b01573 — word/document\.xml/body/\*\[1573\]

```text

```

<a id="b01574"></a>
## b01574 — word/document\.xml/body/\*\[1574\]

```text
WAVE MANAGEMENT
```

<a id="b01575"></a>
## b01575 — word/document\.xml/body/\*\[1575\]

```text

```

<a id="b01576"></a>
## b01576 — word/document\.xml/body/\*\[1576\]

```text
After building and running the wave, the wave supervisor reviews the results of the wave using the full-screen Transaction History Insight and Work Insight options.  Depending on the results, the user may perform one of two options. These options are identified in the following sections.
```

<a id="b01577"></a>
## b01577 — word/document\.xml/body/\*\[1577\]

```text

```

<a id="b01578"></a>
## b01578 — word/document\.xml/body/\*\[1578\]

```text

```

<a id="b01579"></a>
## b01579 — word/document\.xml/body/\*\[1579\]

```text
		Cancel Wave
```

<a id="b01580"></a>
## b01580 — word/document\.xml/body/\*\[1580\]

```text

```

<a id="b01581"></a>
## b01581 — word/document\.xml/body/\*\[1581\]

```text
If the results of the entire wave are not satisfactory users may cancel the wave using the Cancel action in the Completed Wave window of the Wave Insight.
```

<a id="b01582"></a>
## b01582 — word/document\.xml/body/\*\[1582\]

```text

```

<a id="b01583"></a>
## b01583 — word/document\.xml/body/\*\[1583\]

```text

```

<a id="b01584"></a>
## b01584 — word/document\.xml/body/\*\[1584\]

```text
Figure – Cancel a wave
```

<a id="b01585"></a>
## b01585 — word/document\.xml/body/\*\[1585\]

```text
The cancel process backs out allocation and deletes work instructions and shipping containers.  As allocations are backed out, the corresponding inventory is now available for order fulfillment again. At the point of Cancel, Covetrus personnel can move the canceled shipments onto another wave or move them completely back to the Pool.  
```

<a id="b01586"></a>
## b01586 — word/document\.xml/body/\*\[1586\]

```text

```

<a id="b01587"></a>
## b01587 — word/document\.xml/body/\*\[1587\]

```text

```

<a id="b01588"></a>
## b01588 — word/document\.xml/body/\*\[1588\]

```text
Figure – Return canceled shipments to the pool or another wave.
```

<a id="b01589"></a>
## b01589 — word/document\.xml/body/\*\[1589\]

```text
Covetrus uses a custom wave process insight screen to troubleshoot the errors on a wave [EX12 - Process History for Wave].
```

<a id="b01590"></a>
## b01590 — word/document\.xml/body/\*\[1590\]

```text
	
```

<a id="b01591"></a>
## b01591 — word/document\.xml/body/\*\[1591\]

```text

```

<a id="b01592"></a>
## b01592 — word/document\.xml/body/\*\[1592\]

```text
		Release Wave
```

<a id="b01593"></a>
## b01593 — word/document\.xml/body/\*\[1593\]

```text

```

<a id="b01594"></a>
## b01594 — word/document\.xml/body/\*\[1594\]

```text
If the results of the wave are satisfactory, Covetrus personnel release the wave. The Release action performs multiple operations: 
```

<a id="b01595"></a>
## b01595 — word/document\.xml/body/\*\[1595\]

```text
Releases the generated work to the warehouse floor (if applicable) by removing the Hold Code from the work units – this allows the work to now be eligible for picking
```

<a id="b01596"></a>
## b01596 — word/document\.xml/body/\*\[1596\]

```text
Prints Wave Documents and labels as applicable if configured. 
```

<a id="b01597"></a>
## b01597 — word/document\.xml/body/\*\[1597\]

```text

```

<a id="b01598"></a>
## b01598 — word/document\.xml/body/\*\[1598\]

```text

```

<a id="b01599"></a>
## b01599 — word/document\.xml/body/\*\[1599\]

```text
Figure – Release a wave
```

<a id="b01600"></a>
## b01600 — word/document\.xml/body/\*\[1600\]

```text
For the DCs with conveyor systems using a warehouse control system (WCS), SCALE sends the carton information including zone pick details that the WCS uses for divert processing. [EX04 – Conveyor Integration]
```

<a id="b01601"></a>
## b01601 — word/document\.xml/body/\*\[1601\]

```text

```

<a id="b01602"></a>
## b01602 — word/document\.xml/body/\*\[1602\]

```text

```

<a id="b01603"></a>
## b01603 — word/document\.xml/body/\*\[1603\]

```text
		Hold Codes
```

<a id="b01604"></a>
## b01604 — word/document\.xml/body/\*\[1604\]

```text

```

<a id="b01605"></a>
## b01605 — word/document\.xml/body/\*\[1605\]

```text
Hold Codes allow work to be temporarily placed on hold so that no further processing can be done against it. Work created through a wave initially has a Hold Code of Wave Not Released. When a wave is released, the Hold Code is removed.
```

<a id="b01606"></a>
## b01606 — word/document\.xml/body/\*\[1606\]

```text

```

<a id="b01607"></a>
## b01607 — word/document\.xml/body/\*\[1607\]

```text
Note: Hold Codes can also be manually removed or added through the Hold option from the Work Insight [EX29 - Transaction History for Removal of Hold codes].
```

<a id="b01608"></a>
## b01608 — word/document\.xml/body/\*\[1608\]

```text
	 
```

<a id="b01609"></a>
## b01609 — word/document\.xml/body/\*\[1609\]

```text
		Print Wave Documents or Labels
```

<a id="b01610"></a>
## b01610 — word/document\.xml/body/\*\[1610\]

```text

```

<a id="b01611"></a>
## b01611 — word/document\.xml/body/\*\[1611\]

```text
Releasing a wave prints the Wave Documents. This is the normal process Covetrus uses to print these documents. If for some reason the Wave Documents ever need to be reprinted at a later point in time, this is always possible by choosing the Reprint Wave Documents option from the Wave Insight.
```

<a id="b01612"></a>
## b01612 — word/document\.xml/body/\*\[1612\]

```text

```

<a id="b01613"></a>
## b01613 — word/document\.xml/body/\*\[1613\]

```text

```

<a id="b01614"></a>
## b01614 — word/document\.xml/body/\*\[1614\]

```text

```

<a id="b01615"></a>
## b01615 — word/document\.xml/body/\*\[1615\]

```text
Figure – Reprint wave labels
```

<a id="b01616"></a>
## b01616 — word/document\.xml/body/\*\[1616\]

```text

```

<a id="b01617"></a>
## b01617 — word/document\.xml/body/\*\[1617\]

```text
		Post Wave Shipment Changes
```

<a id="b01618"></a>
## b01618 — word/document\.xml/body/\*\[1618\]

```text

```

<a id="b01619"></a>
## b01619 — word/document\.xml/body/\*\[1619\]

```text
If a change is required for an order that has been waved and released (but not picked), the shipment can be canceled by choosing the Cancel option from the Shipment Insight.  Canceling a shipment de-allocates the inventory for the order, deletes the created shipping containers and work, and moves the shipment back into the pool.  Once an order is partially or completely picked, it can be canceled by the same previous process, but any items that were picked would need to be transferred back to an inventory location using the Inventory Management option.
```

<a id="b01620"></a>
## b01620 — word/document\.xml/body/\*\[1620\]

```text

```

<a id="b01621"></a>
## b01621 — word/document\.xml/body/\*\[1621\]

```text

```

<a id="b01622"></a>
## b01622 — word/document\.xml/body/\*\[1622\]

```text
Note: If an order is canceled it cancels all the shipping work tied to the order. Replenishment work will not be canceled (Replenishment work can be manually canceled). Also, while we cancel an order, if any work related to the order is being actively executed by pickers, then order cancellation fails. Canceling of the shipment after the wave is released can only be performed by a warehouse user. After the wave has been released, the Host will not be able to cancel the order (The only time the Host system can make a change is when a shipment is in ‘In Pool’ status.
```

<a id="b01623"></a>
## b01623 — word/document\.xml/body/\*\[1623\]

```text

```

<a id="b01624"></a>
## b01624 — word/document\.xml/body/\*\[1624\]

```text

```

<a id="b01625"></a>
## b01625 — word/document\.xml/body/\*\[1625\]

```text

```

<a id="b01626"></a>
## b01626 — word/document\.xml/body/\*\[1626\]

```text

```

<a id="b01627"></a>
## b01627 — word/document\.xml/body/\*\[1627\]

```text

```

<a id="b01628"></a>
## b01628 — word/document\.xml/body/\*\[1628\]

```text
WORK MANAGEMENT
```

<a id="b01629"></a>
## b01629 — word/document\.xml/body/\*\[1629\]

```text
		
```

<a id="b01630"></a>
## b01630 — word/document\.xml/body/\*\[1630\]

```text
		Work Viewing
```

<a id="b01631"></a>
## b01631 — word/document\.xml/body/\*\[1631\]

```text

```

<a id="b01632"></a>
## b01632 — word/document\.xml/body/\*\[1632\]

```text
Using the fixed station Work Insight or Work Monitoring, personnel can monitor the progress of work.  The Work Insight contains views grouping work by condition: Open, In Progress, and Closed.  Additionally, this option enables personnel to view the types of work that are open and in progress to determine if additional users are needed to help with receipt putaway, replenishment, or picking work.  Personnel can inquire about the specifics of the work unit, such as the ‘from’ and ‘to’ location, item(s) and quantity being moved, receipt/shipment id, the user performing the work, etc.
```

<a id="b01633"></a>
## b01633 — word/document\.xml/body/\*\[1633\]

```text

```

<a id="b01634"></a>
## b01634 — word/document\.xml/body/\*\[1634\]

```text

```

<a id="b01635"></a>
## b01635 — word/document\.xml/body/\*\[1635\]

```text
Figure – Work Insight
```

<a id="b01636"></a>
## b01636 — word/document\.xml/body/\*\[1636\]

```text

```

<a id="b01637"></a>
## b01637 — word/document\.xml/body/\*\[1637\]

```text

```

<a id="b01638"></a>
## b01638 — word/document\.xml/body/\*\[1638\]

```text
Figure – Work Monitoring Group
```

<a id="b01639"></a>
## b01639 — word/document\.xml/body/\*\[1639\]

```text

```

<a id="b01640"></a>
## b01640 — word/document\.xml/body/\*\[1640\]

```text
		Work Priority
```

<a id="b01641"></a>
## b01641 — word/document\.xml/body/\*\[1641\]

```text

```

<a id="b01642"></a>
## b01642 — word/document\.xml/body/\*\[1642\]

```text
SCALE allows system directed tasks to be assigned in one of three ways:
```

<a id="b01643"></a>
## b01643 — word/document\.xml/body/\*\[1643\]

```text

```

<a id="b01644"></a>
## b01644 — word/document\.xml/body/\*\[1644\]

```text
Priority/Location/FIFO
```

<a id="b01645"></a>
## b01645 — word/document\.xml/body/\*\[1645\]

```text
Location/Priority/FIFO
```

<a id="b01646"></a>
## b01646 — word/document\.xml/body/\*\[1646\]

```text
FIFO
```

<a id="b01647"></a>
## b01647 — word/document\.xml/body/\*\[1647\]

```text

```

<a id="b01648"></a>
## b01648 — word/document\.xml/body/\*\[1648\]

```text
The above defines the sort order that system-directed tasks will be assigned to users within the warehouse. Within this structure, the “priority” portion from above can be critical. Most tasks will need to be created with the same priority so that they are truly processed by location proximity in ascending order. However, over time Covetrus may want to bump up the priority of certain tasks. This is possible via the Work Priority Escalation Criteria configuration. From this configuration, Covetrus can define what types of work should be bumped up. This can then be used in conjunction with an interval that is defined by a scheduled job for the work priority. 
```

<a id="b01649"></a>
## b01649 — word/document\.xml/body/\*\[1649\]

```text

```

<a id="b01650"></a>
## b01650 — word/document\.xml/body/\*\[1650\]

```text
PICKING
```

<a id="b01651"></a>
## b01651 — word/document\.xml/body/\*\[1651\]

```text

```

<a id="b01652"></a>
## b01652 — word/document\.xml/body/\*\[1652\]

```text

```

<a id="b01653"></a>
## b01653 — word/document\.xml/body/\*\[1653\]

```text
Pallet Pick - Full (Warehouse Mobile)
```

<a id="b01654"></a>
## b01654 — word/document\.xml/body/\*\[1654\]

```text

```

<a id="b01655"></a>
## b01655 — word/document\.xml/body/\*\[1655\]

```text
Assumptions:
```

<a id="b01656"></a>
## b01656 — word/document\.xml/body/\*\[1656\]

```text

```

<a id="b01657"></a>
## b01657 — word/document\.xml/body/\*\[1657\]

```text
Containers are created in wave.
```

<a id="b01658"></a>
## b01658 — word/document\.xml/body/\*\[1658\]

```text
Full Pallet UOM is requested by shipment and Full Pallet UOM is allocated.
```

<a id="b01659"></a>
## b01659 — word/document\.xml/body/\*\[1659\]

```text
One Work unit is created per Pallet.
```

<a id="b01660"></a>
## b01660 — word/document\.xml/body/\*\[1660\]

```text
At Wave release Full Pallet Pick label (Generic Internal Shipping label (LBL03)) and vendor label (LBL04) are printed in the office and is handed over to the picker.
```

<a id="b01661"></a>
## b01661 — word/document\.xml/body/\*\[1661\]

```text
Mostly used by NDSC
```

<a id="b01662"></a>
## b01662 — word/document\.xml/body/\*\[1662\]

```text

```

<a id="b01663"></a>
## b01663 — word/document\.xml/body/\*\[1663\]

```text
The user starts picking by signing into the Work option in Warehouse Mobile and selecting a Work Profile of Pallet Picking.  This work profile has User Directed options enabled. The user is then prompted to scan a work unit and the user scans the pallet Id from the internal shipping label (LBL03).  
```

<a id="b01664"></a>
## b01664 — word/document\.xml/body/\*\[1664\]

```text

```

<a id="b01665"></a>
## b01665 — word/document\.xml/body/\*\[1665\]

```text
SCALE then presents the user with the pick which displays the LPN, location, item, and quantity to be picked.  The picker confirms the pick by scanning the location and or item for validation. [EX07 - Work Confirmation Item validation] The labels are then applied onto the pallets. 
```

<a id="b01666"></a>
## b01666 — word/document\.xml/body/\*\[1666\]

```text

```

<a id="b01667"></a>
## b01667 — word/document\.xml/body/\*\[1667\]

```text

```

<a id="b01668"></a>
## b01668 — word/document\.xml/body/\*\[1668\]

```text
Figure – Pallet Pick Work profile
```

<a id="b01669"></a>
## b01669 — word/document\.xml/body/\*\[1669\]

```text

```

<a id="b01670"></a>
## b01670 — word/document\.xml/body/\*\[1670\]

```text

```

<a id="b01671"></a>
## b01671 — word/document\.xml/body/\*\[1671\]

```text
Figure – Pallet pick work execution
```

<a id="b01672"></a>
## b01672 — word/document\.xml/body/\*\[1672\]

```text

```

<a id="b01673"></a>
## b01673 — word/document\.xml/body/\*\[1673\]

```text

```

<a id="b01674"></a>
## b01674 — word/document\.xml/body/\*\[1674\]

```text

```

<a id="b01675"></a>
## b01675 — word/document\.xml/body/\*\[1675\]

```text
Figure – Pallet pick work execution
```

<a id="b01676"></a>
## b01676 — word/document\.xml/body/\*\[1676\]

```text

```

<a id="b01677"></a>
## b01677 — word/document\.xml/body/\*\[1677\]

```text

```

<a id="b01678"></a>
## b01678 — word/document\.xml/body/\*\[1678\]

```text
Figure – Pallet pick work execution
```

<a id="b01679"></a>
## b01679 — word/document\.xml/body/\*\[1679\]

```text

```

<a id="b01680"></a>
## b01680 — word/document\.xml/body/\*\[1680\]

```text

```

<a id="b01681"></a>
## b01681 — word/document\.xml/body/\*\[1681\]

```text
Figure – Pallet pick work execution
```

<a id="b01682"></a>
## b01682 — word/document\.xml/body/\*\[1682\]

```text

```

<a id="b01683"></a>
## b01683 — word/document\.xml/body/\*\[1683\]

```text

```

<a id="b01684"></a>
## b01684 — word/document\.xml/body/\*\[1684\]

```text
Figure – Pallet pick work execution – pick complete
```

<a id="b01685"></a>
## b01685 — word/document\.xml/body/\*\[1685\]

```text

```

<a id="b01686"></a>
## b01686 — word/document\.xml/body/\*\[1686\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.). 
```

<a id="b01687"></a>
## b01687 — word/document\.xml/body/\*\[1687\]

```text

```

<a id="b01688"></a>
## b01688 — word/document\.xml/body/\*\[1688\]

```text
Config Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the Warehouse Mobile screen.
```

<a id="b01689"></a>
## b01689 — word/document\.xml/body/\*\[1689\]

```text

```

<a id="b01690"></a>
## b01690 — word/document\.xml/body/\*\[1690\]

```text
After the picks are complete, automatic putaway is done. No user confirmation is needed, and the pallet is dropped to the staging location. 
```

<a id="b01691"></a>
## b01691 — word/document\.xml/body/\*\[1691\]

```text

```

<a id="b01692"></a>
## b01692 — word/document\.xml/body/\*\[1692\]

```text
Pallet Pick – Build or Pallet Pick (Warehouse Mobile)
```

<a id="b01693"></a>
## b01693 — word/document\.xml/body/\*\[1693\]

```text

```

<a id="b01694"></a>
## b01694 — word/document\.xml/body/\*\[1694\]

```text
Assumptions:
```

<a id="b01695"></a>
## b01695 — word/document\.xml/body/\*\[1695\]

```text

```

<a id="b01696"></a>
## b01696 — word/document\.xml/body/\*\[1696\]

```text
Containers are created in Wave.
```

<a id="b01697"></a>
## b01697 — word/document\.xml/body/\*\[1697\]

```text
Pallet Building is run during wave and SCALE Nest Cases onto Pallet.
```

<a id="b01698"></a>
## b01698 — word/document\.xml/body/\*\[1698\]

```text
One Work unit is created per pallet for the Case picks in a Bulk Area. 
```

<a id="b01699"></a>
## b01699 — word/document\.xml/body/\*\[1699\]

```text
Shipping Label / Vendor Label, Container Content label and Pallet Label is printed for Pallet Picks.
```

<a id="b01700"></a>
## b01700 — word/document\.xml/body/\*\[1700\]

```text

```

<a id="b01701"></a>
## b01701 — word/document\.xml/body/\*\[1701\]

```text
The user starts picking by signing into the Warehouse Mobile Work option and selecting a Work Profile of Pallet picking - build. The user is then prompted to scan a Work Unit. User scans the barcode from Pallet Label to initiate work. SCALE presents the user with the pick which displays the location, item and quantity to be picked. The user scans the location and item for validation. [EX07 - Work Confirmation Item validation]  When complete, the user scans the Container ID from the Container Contents Label to verify and press the OK button. User will apply Shipping / Vendor Label on to the container and place the container on the pallet.
```

<a id="b01702"></a>
## b01702 — word/document\.xml/body/\*\[1702\]

```text

```

<a id="b01703"></a>
## b01703 — word/document\.xml/body/\*\[1703\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended), and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.).  
```

<a id="b01704"></a>
## b01704 — word/document\.xml/body/\*\[1704\]

```text

```

<a id="b01705"></a>
## b01705 — word/document\.xml/body/\*\[1705\]

```text
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the warehouse mobile screen
```

<a id="b01706"></a>
## b01706 — word/document\.xml/body/\*\[1706\]

```text

```

<a id="b01707"></a>
## b01707 — word/document\.xml/body/\*\[1707\]

```text
After the picks are complete, automatic putaway is done to the packing location.
```

<a id="b01708"></a>
## b01708 — word/document\.xml/body/\*\[1708\]

```text

```

<a id="b01709"></a>
## b01709 — word/document\.xml/body/\*\[1709\]

```text
		Dry Pick – Pick and Pass (Warehouse Mobile)
```

<a id="b01710"></a>
## b01710 — word/document\.xml/body/\*\[1710\]

```text

```

<a id="b01711"></a>
## b01711 — word/document\.xml/body/\*\[1711\]

```text
Assumptions:
```

<a id="b01712"></a>
## b01712 — word/document\.xml/body/\*\[1712\]

```text

```

<a id="b01713"></a>
## b01713 — word/document\.xml/body/\*\[1713\]

```text
Containers are created in Wave.
```

<a id="b01714"></a>
## b01714 — word/document\.xml/body/\*\[1714\]

```text
One Work unit is created per shipping container. 
```

<a id="b01715"></a>
## b01715 — word/document\.xml/body/\*\[1715\]

```text
Shipping Label / Vendor Label, Container Content label are printed for Dry Picks.
```

<a id="b01716"></a>
## b01716 — word/document\.xml/body/\*\[1716\]

```text
A user at the induction point will pick the container type as displayed on the container content label and apply the Shipping label and put box on the lane.
```

<a id="b01717"></a>
## b01717 — word/document\.xml/body/\*\[1717\]

```text

```

<a id="b01718"></a>
## b01718 — word/document\.xml/body/\*\[1718\]

```text
The user starts picking by signing into the WHM Work option and selecting a Work Profile of Dry Pick – Pick and Pass. The user is then prompted to scan a Work Unit. User will scan the ContainerID from container content label to initiate work. SCALE presents the user with the pick which displays the location, item and quantity to be picked. [EX22 – DSCSA Outbound Processing].The user scans the location and item for validation. [EX07 - Work Confirmation Item validation] When complete, the user scans the Container ID from the Container Contents Label to verify and press the OK button. If all the picks is done in his zone, the user will pass the container on to next zone.
```

<a id="b01719"></a>
## b01719 — word/document\.xml/body/\*\[1719\]

```text

```

<a id="b01720"></a>
## b01720 — word/document\.xml/body/\*\[1720\]

```text

```

<a id="b01721"></a>
## b01721 — word/document\.xml/body/\*\[1721\]

```text
Figure – Pick and Pass work profile selection
```

<a id="b01722"></a>
## b01722 — word/document\.xml/body/\*\[1722\]

```text

```

<a id="b01723"></a>
## b01723 — word/document\.xml/body/\*\[1723\]

```text
Figure – Pick and Pass work unit selection
```

<a id="b01724"></a>
## b01724 — word/document\.xml/body/\*\[1724\]

```text

```

<a id="b01725"></a>
## b01725 — word/document\.xml/body/\*\[1725\]

```text

```

<a id="b01726"></a>
## b01726 — word/document\.xml/body/\*\[1726\]

```text
Figure – Pick and Pass work execution
```

<a id="b01727"></a>
## b01727 — word/document\.xml/body/\*\[1727\]

```text

```

<a id="b01728"></a>
## b01728 — word/document\.xml/body/\*\[1728\]

```text
Figure – Pick and Pass work execution – item scan
```

<a id="b01729"></a>
## b01729 — word/document\.xml/body/\*\[1729\]

```text

```

<a id="b01730"></a>
## b01730 — word/document\.xml/body/\*\[1730\]

```text

```

<a id="b01731"></a>
## b01731 — word/document\.xml/body/\*\[1731\]

```text
Figure – Pick and Pass qty input
```

<a id="b01732"></a>
## b01732 — word/document\.xml/body/\*\[1732\]

```text

```

<a id="b01733"></a>
## b01733 — word/document\.xml/body/\*\[1733\]

```text

```

<a id="b01734"></a>
## b01734 — word/document\.xml/body/\*\[1734\]

```text
Figure – Pick and Pass – pick complete
```

<a id="b01735"></a>
## b01735 — word/document\.xml/body/\*\[1735\]

```text

```

<a id="b01736"></a>
## b01736 — word/document\.xml/body/\*\[1736\]

```text

```

<a id="b01737"></a>
## b01737 — word/document\.xml/body/\*\[1737\]

```text
Figure – Pick and Pass – Select Pass on zone complete
```

<a id="b01738"></a>
## b01738 — word/document\.xml/body/\*\[1738\]

```text

```

<a id="b01739"></a>
## b01739 — word/document\.xml/body/\*\[1739\]

```text
If user scans a container to initiate the pick and no work exist in the zone the user is working, then SCALE will display “No work exist for this work instruction”. User will then pass the container onto next zone. 
```

<a id="b01740"></a>
## b01740 — word/document\.xml/body/\*\[1740\]

```text

```

<a id="b01741"></a>
## b01741 — word/document\.xml/body/\*\[1741\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended), and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.).  
```

<a id="b01742"></a>
## b01742 — word/document\.xml/body/\*\[1742\]

```text

```

<a id="b01743"></a>
## b01743 — word/document\.xml/body/\*\[1743\]

```text
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the WHM screen
```

<a id="b01744"></a>
## b01744 — word/document\.xml/body/\*\[1744\]

```text

```

<a id="b01745"></a>
## b01745 — word/document\.xml/body/\*\[1745\]

```text
Auto Putaway is configured for this work type. So, user need not have to confirm any putaway for these work types.
```

<a id="b01746"></a>
## b01746 — word/document\.xml/body/\*\[1746\]

```text

```

<a id="b01747"></a>
## b01747 — word/document\.xml/body/\*\[1747\]

```text
In case of the container is full during picking, which may happen for various reasons including but not limited to,  inaccurate item or container dimensions or packing setup is not valid, the user hits physically marks the box and takes it to the pack station where it is unpacked and repacked to accommodate the contents and create a new container. This is handled as a SOP. 
```

<a id="b01748"></a>
## b01748 — word/document\.xml/body/\*\[1748\]

```text

```

<a id="b01749"></a>
## b01749 — word/document\.xml/body/\*\[1749\]

```text
		Dry Pick - Cart
```

<a id="b01750"></a>
## b01750 — word/document\.xml/body/\*\[1750\]

```text

```

<a id="b01751"></a>
## b01751 — word/document\.xml/body/\*\[1751\]

```text
Assumptions:
```

<a id="b01752"></a>
## b01752 — word/document\.xml/body/\*\[1752\]

```text

```

<a id="b01753"></a>
## b01753 — word/document\.xml/body/\*\[1753\]

```text
Containers are created in Wave.
```

<a id="b01754"></a>
## b01754 — word/document\.xml/body/\*\[1754\]

```text
One Work unit is created per container.
```

<a id="b01755"></a>
## b01755 — word/document\.xml/body/\*\[1755\]

```text
Shipping Label / Vendor Label and Container Content label is printed per container.
```

<a id="b01756"></a>
## b01756 — word/document\.xml/body/\*\[1756\]

```text

```

<a id="b01757"></a>
## b01757 — word/document\.xml/body/\*\[1757\]

```text
Covetrus will utilize Group picking for Dry Picking – Cart Pick work type. User will manually build carts prior to picking.
```

<a id="b01758"></a>
## b01758 — word/document\.xml/body/\*\[1758\]

```text

```

<a id="b01759"></a>
## b01759 — word/document\.xml/body/\*\[1759\]

```text
User starts picking by signing into the WHM work option and selecting the work profile of Dry Picking – Cart Pick. Based on the containers that can fit on the cart, the user will start scanning the container ID and click on the Assign option. SCALE will assign the containers to slot beginning from Slot 1. Once all the container that are on the cart are scanned and assigned spots, the user will click on Begin Picks to initiate work execution.
```

<a id="b01760"></a>
## b01760 — word/document\.xml/body/\*\[1760\]

```text

```

<a id="b01761"></a>
## b01761 — word/document\.xml/body/\*\[1761\]

```text
SCALE then presents the user with the pick which displays the location, item and quantity to be picked.  The picker confirms the pick by scanning the location and item for validation. [EX07 - Work Confirmation Item validation]
```

<a id="b01762"></a>
## b01762 — word/document\.xml/body/\*\[1762\]

```text

```

<a id="b01763"></a>
## b01763 — word/document\.xml/body/\*\[1763\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended), and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.).
```

<a id="b01764"></a>
## b01764 — word/document\.xml/body/\*\[1764\]

```text

```

<a id="b01765"></a>
## b01765 — word/document\.xml/body/\*\[1765\]

```text
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the WHM screen
```

<a id="b01766"></a>
## b01766 — word/document\.xml/body/\*\[1766\]

```text

```

<a id="b01767"></a>
## b01767 — word/document\.xml/body/\*\[1767\]

```text
After the pick is complete for the item, if the item is only part of one container, then SCALE displays the slot number on the pick screen itself and user needs to scan the ContainerID that they are picking into. If the item that is being picked is present in multiple slots, then once the pick is confirmed SCALE will display the slot and ContainerID in the next screen. User needs to scan the ContainerID that they are picking into for validation.
```

<a id="b01768"></a>
## b01768 — word/document\.xml/body/\*\[1768\]

```text

```

<a id="b01769"></a>
## b01769 — word/document\.xml/body/\*\[1769\]

```text
For Dry pick – Cart pick the Auto Putaway will be configured. So, user doesn’t have to confirm the putaway once all the picks are completed.
```

<a id="b01770"></a>
## b01770 — word/document\.xml/body/\*\[1770\]

```text

```

<a id="b01771"></a>
## b01771 — word/document\.xml/body/\*\[1771\]

```text

```

<a id="b01772"></a>
## b01772 — word/document\.xml/body/\*\[1772\]

```text
Figure – Cart picking work container spot assignment
```

<a id="b01773"></a>
## b01773 — word/document\.xml/body/\*\[1773\]

```text

```

<a id="b01774"></a>
## b01774 — word/document\.xml/body/\*\[1774\]

```text

```

<a id="b01775"></a>
## b01775 — word/document\.xml/body/\*\[1775\]

```text

```

<a id="b01776"></a>
## b01776 — word/document\.xml/body/\*\[1776\]

```text
Figure – Cart picking work container spot assignment confirmation
```

<a id="b01777"></a>
## b01777 — word/document\.xml/body/\*\[1777\]

```text

```

<a id="b01778"></a>
## b01778 — word/document\.xml/body/\*\[1778\]

```text

```

<a id="b01779"></a>
## b01779 — word/document\.xml/body/\*\[1779\]

```text
Figure – Cart picking work container spot assignment
```

<a id="b01780"></a>
## b01780 — word/document\.xml/body/\*\[1780\]

```text

```

<a id="b01781"></a>
## b01781 — word/document\.xml/body/\*\[1781\]

```text

```

<a id="b01782"></a>
## b01782 — word/document\.xml/body/\*\[1782\]

```text
Figure – Cart picking work container spot assignment confirmation
```

<a id="b01783"></a>
## b01783 — word/document\.xml/body/\*\[1783\]

```text

```

<a id="b01784"></a>
## b01784 — word/document\.xml/body/\*\[1784\]

```text

```

<a id="b01785"></a>
## b01785 — word/document\.xml/body/\*\[1785\]

```text
Figure – Cart picking work container – begin picks
```

<a id="b01786"></a>
## b01786 — word/document\.xml/body/\*\[1786\]

```text

```

<a id="b01787"></a>
## b01787 — word/document\.xml/body/\*\[1787\]

```text
Figure – Cart picking work execution
```

<a id="b01788"></a>
## b01788 — word/document\.xml/body/\*\[1788\]

```text

```

<a id="b01789"></a>
## b01789 — word/document\.xml/body/\*\[1789\]

```text

```

<a id="b01790"></a>
## b01790 — word/document\.xml/body/\*\[1790\]

```text
Figure – Cart picking work execution
```

<a id="b01791"></a>
## b01791 — word/document\.xml/body/\*\[1791\]

```text

```

<a id="b01792"></a>
## b01792 — word/document\.xml/body/\*\[1792\]

```text

```

<a id="b01793"></a>
## b01793 — word/document\.xml/body/\*\[1793\]

```text
Figure – Cart picking work execution
```

<a id="b01794"></a>
## b01794 — word/document\.xml/body/\*\[1794\]

```text

```

<a id="b01795"></a>
## b01795 — word/document\.xml/body/\*\[1795\]

```text

```

<a id="b01796"></a>
## b01796 — word/document\.xml/body/\*\[1796\]

```text
Figure – Cart picking – put into container on the cart
```

<a id="b01797"></a>
## b01797 — word/document\.xml/body/\*\[1797\]

```text

```

<a id="b01798"></a>
## b01798 — word/document\.xml/body/\*\[1798\]

```text

```

<a id="b01799"></a>
## b01799 — word/document\.xml/body/\*\[1799\]

```text
Figure – Cart picking – put into container on the cart
```

<a id="b01800"></a>
## b01800 — word/document\.xml/body/\*\[1800\]

```text

```

<a id="b01801"></a>
## b01801 — word/document\.xml/body/\*\[1801\]

```text
Alternate cart pick flow below for visual reference.
```

<a id="b01802"></a>
## b01802 — word/document\.xml/body/\*\[1802\]

```text

```

<a id="b01803"></a>
## b01803 — word/document\.xml/body/\*\[1803\]

```text

```

<a id="b01804"></a>
## b01804 — word/document\.xml/body/\*\[1804\]

```text
Figure – Cart picking additional example
```

<a id="b01805"></a>
## b01805 — word/document\.xml/body/\*\[1805\]

```text

```

<a id="b01806"></a>
## b01806 — word/document\.xml/body/\*\[1806\]

```text
In case of the container is full during picking, which may happen for various reasons including but not limited to,  inaccurate item or container dimensions or packing setup is not valid, the user hits physically marks the box and takes it to the pack station where it is unpacked and repacked to accommodate the contents and create a new container. This is handled as a SOP
```

<a id="b01807"></a>
## b01807 — word/document\.xml/body/\*\[1807\]

```text

```

<a id="b01808"></a>
## b01808 — word/document\.xml/body/\*\[1808\]

```text
		Bulk Picking
```

<a id="b01809"></a>
## b01809 — word/document\.xml/body/\*\[1809\]

```text

```

<a id="b01810"></a>
## b01810 — word/document\.xml/body/\*\[1810\]

```text
Assumptions:
```

<a id="b01811"></a>
## b01811 — word/document\.xml/body/\*\[1811\]

```text

```

<a id="b01812"></a>
## b01812 — word/document\.xml/body/\*\[1812\]

```text
Containers are created in Wave.
```

<a id="b01813"></a>
## b01813 — word/document\.xml/body/\*\[1813\]

```text
One Work unit is created per configured Max volume / Max Weight / Max Instruction for the Case picks in a Bulk Area. 
```

<a id="b01814"></a>
## b01814 — word/document\.xml/body/\*\[1814\]

```text
Shipping Label / Vendor Label, Container Content label and Break Label is printed for Bulk Picks.
```

<a id="b01815"></a>
## b01815 — word/document\.xml/body/\*\[1815\]

```text

```

<a id="b01816"></a>
## b01816 — word/document\.xml/body/\*\[1816\]

```text
The user starts picking by signing into the RF Work option and selecting a Work Profile of Bulk picking. The user is then prompted to scan a Work Unit. User will scan the barcode form Break Label to initiate work. SCALE presents the user with the pick which displays the location, item and quantity to be picked. The user scans the location and item for validation [EX07 - Work Confirmation Item validation]. When complete, the user scans the Container ID from the Container Contents Label to verify and press the OK button. User will apply Shipping / Vendor Label on to the container and place the container on the line.
```

<a id="b01817"></a>
## b01817 — word/document\.xml/body/\*\[1817\]

```text

```

<a id="b01818"></a>
## b01818 — word/document\.xml/body/\*\[1818\]

```text

```

<a id="b01819"></a>
## b01819 — word/document\.xml/body/\*\[1819\]

```text
Figure – Bulk pick work unit selection
```

<a id="b01820"></a>
## b01820 — word/document\.xml/body/\*\[1820\]

```text

```

<a id="b01821"></a>
## b01821 — word/document\.xml/body/\*\[1821\]

```text

```

<a id="b01822"></a>
## b01822 — word/document\.xml/body/\*\[1822\]

```text

```

<a id="b01823"></a>
## b01823 — word/document\.xml/body/\*\[1823\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended), and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.).  
```

<a id="b01824"></a>
## b01824 — word/document\.xml/body/\*\[1824\]

```text

```

<a id="b01825"></a>
## b01825 — word/document\.xml/body/\*\[1825\]

```text
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the RF screen
```

<a id="b01826"></a>
## b01826 — word/document\.xml/body/\*\[1826\]

```text

```

<a id="b01827"></a>
## b01827 — word/document\.xml/body/\*\[1827\]

```text
After the picks are complete, the user confirms the putaway to the Packing location.
```

<a id="b01828"></a>
## b01828 — word/document\.xml/body/\*\[1828\]

```text

```

<a id="b01829"></a>
## b01829 — word/document\.xml/body/\*\[1829\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, if the picker has permission to short, picker will adjust the quantity and then click on the short button. SCALE will ask for a short reason and user must select the reason from the drop down. If picker doesn’t have permission to short, the picker presses the ‘Pass’ button to back out of the work unit (to leave it suspended) and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation.
```

<a id="b01830"></a>
## b01830 — word/document\.xml/body/\*\[1830\]

```text

```

<a id="b01831"></a>
## b01831 — word/document\.xml/body/\*\[1831\]

```text
Note: Short option is controlled using security and Covetrus determines this. If picker doesn’t have short option, then once they click on the pass button, they need to take the cart to a designated hospital area and leave the cart there for the supervisor to research on the issue.
```

<a id="b01832"></a>
## b01832 — word/document\.xml/body/\*\[1832\]

```text

```

<a id="b01833"></a>
## b01833 — word/document\.xml/body/\*\[1833\]

```text
Once all the picks are completed user will confirm putaway to PACK location and will take the cart to packing station and unload the containers.
```

<a id="b01834"></a>
## b01834 — word/document\.xml/body/\*\[1834\]

```text

```

<a id="b01835"></a>
## b01835 — word/document\.xml/body/\*\[1835\]

```text
Testing Note: For bulk/reserve picks, ODWS “WI Concatenate Order + Item for Bulk Picks” is used to append shipment id/item concatenated as assigned as work unit. This may result in work units with special characters and longer work units. This setup has been giving the desired results thus far to Covetrus and hence is continuing to be used. Manhattan recommends reviewing this ODWS. 
```

<a id="b01836"></a>
## b01836 — word/document\.xml/body/\*\[1836\]

```text

```

<a id="b01837"></a>
## b01837 — word/document\.xml/body/\*\[1837\]

```text
		Cooler Pick
```

<a id="b01838"></a>
## b01838 — word/document\.xml/body/\*\[1838\]

```text

```

<a id="b01839"></a>
## b01839 — word/document\.xml/body/\*\[1839\]

```text
Assumptions:
```

<a id="b01840"></a>
## b01840 — word/document\.xml/body/\*\[1840\]

```text

```

<a id="b01841"></a>
## b01841 — word/document\.xml/body/\*\[1841\]

```text
Containers are created in Wave.
```

<a id="b01842"></a>
## b01842 — word/document\.xml/body/\*\[1842\]

```text
One Work unit is created per container.
```

<a id="b01843"></a>
## b01843 — word/document\.xml/body/\*\[1843\]

```text
Shipping Label / Vendor Label and Container Content label is printed per container.
```

<a id="b01844"></a>
## b01844 — word/document\.xml/body/\*\[1844\]

```text
Covetrus will utilize Group picking for Cooler picking. User will manually build carts prior to picking.
```

<a id="b01845"></a>
## b01845 — word/document\.xml/body/\*\[1845\]

```text

```

<a id="b01846"></a>
## b01846 — word/document\.xml/body/\*\[1846\]

```text
User starts picking by signing into the WHM work option and selecting the work profile of Cooler picking. Based on the containers that can fit on the cart, the user will start scanning the container ID and click on the Assign option. SCALE will assign the containers to slot beginning from Slot 1. Once all the container that are on the cart are scanned and assigned spots, the user will click on Begin Picks to initiate work execution.
```

<a id="b01847"></a>
## b01847 — word/document\.xml/body/\*\[1847\]

```text

```

<a id="b01848"></a>
## b01848 — word/document\.xml/body/\*\[1848\]

```text
SCALE then presents the user with the pick which displays the location, item and quantity to be picked.  The picker confirms the pick by scanning the location and item for validation [EX07 - Work Confirmation Item validation].
```

<a id="b01849"></a>
## b01849 — word/document\.xml/body/\*\[1849\]

```text

```

<a id="b01850"></a>
## b01850 — word/document\.xml/body/\*\[1850\]

```text
While the user is picking, if there is not enough inventory in the location that the user is prompted to pick from, the user presses the ‘Skip’ button to continue with the next instruction on that work unit. If after all the picks are complete for the work unit and they are returned to the screen with the short item, the user presses the ‘Pass’ button to back out of the work unit (to leave it suspended), and contacts a supervisor. The supervisor intervenes and determines how to handle the out-of-stock situation (whether to short that line using the ‘Short Pick’ button or to cancel the entire order, etc.).
```

<a id="b01851"></a>
## b01851 — word/document\.xml/body/\*\[1851\]

```text

```

<a id="b01852"></a>
## b01852 — word/document\.xml/body/\*\[1852\]

```text
Note: Security is set up to only allow specific users (supervisors) to have the Short Pick button on the WHM screen
```

<a id="b01853"></a>
## b01853 — word/document\.xml/body/\*\[1853\]

```text

```

<a id="b01854"></a>
## b01854 — word/document\.xml/body/\*\[1854\]

```text
After the pick is complete for the item, if the item is only part of one container, then SCALE displays the slot number on the pick screen itself and user needs to scan the ContainerID that they are picking into.
```

<a id="b01855"></a>
## b01855 — word/document\.xml/body/\*\[1855\]

```text

```

<a id="b01856"></a>
## b01856 — word/document\.xml/body/\*\[1856\]

```text
If the item that is being picked is present in multiple slots, then once the pick is confirmed SCALE will display the slot and ContainerID in the next screen. User needs to scan the ContainerID that they are picking into for validation.
```

<a id="b01857"></a>
## b01857 — word/document\.xml/body/\*\[1857\]

```text

```

<a id="b01858"></a>
## b01858 — word/document\.xml/body/\*\[1858\]

```text
For Cooler pick the Auto Putaway will be configured. So, user doesn’t have to confirm the putaway once all the picks are completed.
```

<a id="b01859"></a>
## b01859 — word/document\.xml/body/\*\[1859\]

```text

```

<a id="b01860"></a>
## b01860 — word/document\.xml/body/\*\[1860\]

```text
Task Interleaving 
```

<a id="b01861"></a>
## b01861 — word/document\.xml/body/\*\[1861\]

```text

```

<a id="b01862"></a>
## b01862 — word/document\.xml/body/\*\[1862\]

```text
Task interleaving is not used at Covetrus and is out of scope of this implementation. Covetrus does not consider this as a future initiative either.
```

<a id="b01863"></a>
## b01863 — word/document\.xml/body/\*\[1863\]

```text
 
```

<a id="b01864"></a>
## b01864 — word/document\.xml/body/\*\[1864\]

```text

```

<a id="b01865"></a>
## b01865 — word/document\.xml/body/\*\[1865\]

```text
Visual QC or VAS during picking 
```

<a id="b01866"></a>
## b01866 — word/document\.xml/body/\*\[1866\]

```text

```

<a id="b01867"></a>
## b01867 — word/document\.xml/body/\*\[1867\]

```text
For Covetrus picking operations, many pickers execute visual QC or VAS during picking and do not execute systemic outbound QC/VAS unless described later in the document. This is done due to labor and space constraints. Covetrus continues to do this using text messages or enhancements to Pick screen for warehouse mobile. [EX28 – Display Item Category 2 for outbound pick work execution]
```

<a id="b01868"></a>
## b01868 — word/document\.xml/body/\*\[1868\]

```text

```

<a id="b01869"></a>
## b01869 — word/document\.xml/body/\*\[1869\]

```text
For controlled substance warehouse that physically exists in the same building as an FDC setup in SCALE, the authorized user toggles the default warehouse from the warehouse mobile device [EX10 - Warehouse Change on Warehouse Mobile]
```

<a id="b01870"></a>
## b01870 — word/document\.xml/body/\*\[1870\]

```text

```

<a id="b01871"></a>
## b01871 — word/document\.xml/body/\*\[1871\]

```text
PACKING
```

<a id="b01872"></a>
## b01872 — word/document\.xml/body/\*\[1872\]

```text
		
```

<a id="b01873"></a>
## b01873 — word/document\.xml/body/\*\[1873\]

```text

```

<a id="b01874"></a>
## b01874 — word/document\.xml/body/\*\[1874\]

```text
		Value Added Service (VAS)
```

<a id="b01875"></a>
## b01875 — word/document\.xml/body/\*\[1875\]

```text

```

<a id="b01876"></a>
## b01876 — word/document\.xml/body/\*\[1876\]

```text
Covetrus uses systemic VAS for pharmacy shipments. 
```

<a id="b01877"></a>
## b01877 — word/document\.xml/body/\*\[1877\]

```text

```

<a id="b01878"></a>
## b01878 — word/document\.xml/body/\*\[1878\]

```text
For any container that is associated with VAS, User will start the VAS process by selecting the VAS insight from the main SCALE Shipping Menu
```

<a id="b01879"></a>
## b01879 — word/document\.xml/body/\*\[1879\]

```text

```

<a id="b01880"></a>
## b01880 — word/document\.xml/body/\*\[1880\]

```text

```

<a id="b01881"></a>
## b01881 — word/document\.xml/body/\*\[1881\]

```text
Figure - VAS insight with VAS instructions populated
```

<a id="b01882"></a>
## b01882 — word/document\.xml/body/\*\[1882\]

```text
Next, the user scans the container ID of the given carton and is presented with the required VAS activity. Physically user performs the required activity and once complete the user checks the confirmed check box and clicks on the Confirm action to indicate VAS is complete and the carton is ready to enter the packing (close carton) process flow. [EX13 - Large Animal Pharmacy VAS]
```

<a id="b01883"></a>
## b01883 — word/document\.xml/body/\*\[1883\]

```text

```

<a id="b01884"></a>
## b01884 — word/document\.xml/body/\*\[1884\]

```text

```

<a id="b01885"></a>
## b01885 — word/document\.xml/body/\*\[1885\]

```text
Figure - VAS insight with VAS instructions populated
```

<a id="b01886"></a>
## b01886 — word/document\.xml/body/\*\[1886\]

```text

```

<a id="b01887"></a>
## b01887 — word/document\.xml/body/\*\[1887\]

```text
Figure - VAS insight confirmation 
```

<a id="b01888"></a>
## b01888 — word/document\.xml/body/\*\[1888\]

```text

```

<a id="b01889"></a>
## b01889 — word/document\.xml/body/\*\[1889\]

```text
		QC Confirmation 
```

<a id="b01890"></a>
## b01890 — word/document\.xml/body/\*\[1890\]

```text

```

<a id="b01891"></a>
## b01891 — word/document\.xml/body/\*\[1891\]

```text
For Covetrus, outbound QC is leveraged for TLC orders. However, Covetrus forces a pass QC on these containers and do not use the full capability of the QC screen. This is due to internal DC standard process adherence. If this needs to be leveraged, custom barcode parsing will be needed for the QC screen. 
```

<a id="b01892"></a>
## b01892 — word/document\.xml/body/\*\[1892\]

```text

```

<a id="b01893"></a>
## b01893 — word/document\.xml/body/\*\[1893\]

```text
If a container requires QC, the user scans the Container ID from the Shipping label or Container Content Label in the QC Workbench.  Next the user scans each item (grocery scanning).  Once all items in the container are scanned, the user clicks the Confirm button.  
```

<a id="b01894"></a>
## b01894 — word/document\.xml/body/\*\[1894\]

```text

```

<a id="b01895"></a>
## b01895 — word/document\.xml/body/\*\[1895\]

```text

```

<a id="b01896"></a>
## b01896 — word/document\.xml/body/\*\[1896\]

```text
Figure: QC Workbench
```

<a id="b01897"></a>
## b01897 — word/document\.xml/body/\*\[1897\]

```text

```

<a id="b01898"></a>
## b01898 — word/document\.xml/body/\*\[1898\]

```text
If the items and quantities scanned match the system, the user receives a message that QC was successful.  If not, the user receives a message that QC failed and need to provide reason codes for any missing quantities. These reason codes are configurable by Covetrus to record things such as damaged, incorrect item, etc.  The user needs to correct any failures and have a successful QC before continuing to Close Container.
```

<a id="b01899"></a>
## b01899 — word/document\.xml/body/\*\[1899\]

```text

```

<a id="b01900"></a>
## b01900 — word/document\.xml/body/\*\[1900\]

```text

```

<a id="b01901"></a>
## b01901 — word/document\.xml/body/\*\[1901\]

```text
Figure: QC failure – reason code selection
```

<a id="b01902"></a>
## b01902 — word/document\.xml/body/\*\[1902\]

```text

```

<a id="b01903"></a>
## b01903 — word/document\.xml/body/\*\[1903\]

```text
Covetrus uses Force QC pass several times in the workflow to use QC workbench as a visual QC platform. 
```

<a id="b01904"></a>
## b01904 — word/document\.xml/body/\*\[1904\]

```text

```

<a id="b01905"></a>
## b01905 — word/document\.xml/body/\*\[1905\]

```text

```

<a id="b01906"></a>
## b01906 — word/document\.xml/body/\*\[1906\]

```text
Figure: Force QC pass
```

<a id="b01907"></a>
## b01907 — word/document\.xml/body/\*\[1907\]

```text

```

<a id="b01908"></a>
## b01908 — word/document\.xml/body/\*\[1908\]

```text

```

<a id="b01909"></a>
## b01909 — word/document\.xml/body/\*\[1909\]

```text

```

<a id="b01910"></a>
## b01910 — word/document\.xml/body/\*\[1910\]

```text

```

<a id="b01911"></a>
## b01911 — word/document\.xml/body/\*\[1911\]

```text

```

<a id="b01912"></a>
## b01912 — word/document\.xml/body/\*\[1912\]

```text

```

<a id="b01913"></a>
## b01913 — word/document\.xml/body/\*\[1913\]

```text
Figure: Force QC pass process history
```

<a id="b01914"></a>
## b01914 — word/document\.xml/body/\*\[1914\]

```text

```

<a id="b01915"></a>
## b01915 — word/document\.xml/body/\*\[1915\]

```text
		Close Container
```

<a id="b01916"></a>
## b01916 — word/document\.xml/body/\*\[1916\]

```text

```

<a id="b01917"></a>
## b01917 — word/document\.xml/body/\*\[1917\]

```text
Close container action/transaction identifies that the container is packed (sealed), and no other item can be put into it. This also advances the status of the container (and shipment) as per the status flow and determines the next action on the staging/dock area. 
```

<a id="b01918"></a>
## b01918 — word/document\.xml/body/\*\[1918\]

```text

```

<a id="b01919"></a>
## b01919 — word/document\.xml/body/\*\[1919\]

```text
For parcel and each picks, those containers need to be closed by the user to advance the status. To perform close container, user accesses close container insight screen or the Close container option on the Warehouse mobile menu and scans the Container ID. SCALE displays the expected weight of the container. User then clicks the Close button to complete the operation. 
```

<a id="b01920"></a>
## b01920 — word/document\.xml/body/\*\[1920\]

```text

```

<a id="b01921"></a>
## b01921 — word/document\.xml/body/\*\[1921\]

```text
Note: Covetrus integrates the weigh scale to the packing workstation. Currently, this is printed outside of SCLAE.
```

<a id="b01922"></a>
## b01922 — word/document\.xml/body/\*\[1922\]

```text

```

<a id="b01923"></a>
## b01923 — word/document\.xml/body/\*\[1923\]

```text
If it is a parcel container, manifesting process occurs prior to closing of the container.
```

<a id="b01924"></a>
## b01924 — word/document\.xml/body/\*\[1924\]

```text

```

<a id="b01925"></a>
## b01925 — word/document\.xml/body/\*\[1925\]

```text
For Covetrus, the following labels and documents are printed as part of the close container operation:
```

<a id="b01926"></a>
## b01926 — word/document\.xml/body/\*\[1926\]

```text

```

<a id="b01927"></a>
## b01927 — word/document\.xml/body/\*\[1927\]

```text
Labels - For shipments with parcel carrier:
```

<a id="b01928"></a>
## b01928 — word/document\.xml/body/\*\[1928\]

```text
Shipping Label (LBL05)
```

<a id="b01929"></a>
## b01929 — word/document\.xml/body/\*\[1929\]

```text

```

<a id="b01930"></a>
## b01930 — word/document\.xml/body/\*\[1930\]

```text
Documents – :
```

<a id="b01931"></a>
## b01931 — word/document\.xml/body/\*\[1931\]

```text
Invoice generated by the host printed to a configured printer [EX11 –   Invoice in the box]
```

<a id="b01932"></a>
## b01932 — word/document\.xml/body/\*\[1932\]

```text

```

<a id="b01933"></a>
## b01933 — word/document\.xml/body/\*\[1933\]

```text
Labels - For shipments with LTL carrier as configured/required
```

<a id="b01934"></a>
## b01934 — word/document\.xml/body/\*\[1934\]

```text
Shipping Label (LBL05) 
```

<a id="b01935"></a>
## b01935 — word/document\.xml/body/\*\[1935\]

```text
Vendor Label (LBL04)
```

<a id="b01936"></a>
## b01936 — word/document\.xml/body/\*\[1936\]

```text

```

<a id="b01937"></a>
## b01937 — word/document\.xml/body/\*\[1937\]

```text
For International parcel shipments, user needs to perform close container for every container individually, and when the last container of the shipment is closed, user can select shipment level manifest and print shipping labels for all the containers for that shipment. [EX09 - Display Message on Close of Last Container of Shipment]. This process applies to closing containers from Insight screens also.
```

<a id="b01938"></a>
## b01938 — word/document\.xml/body/\*\[1938\]

```text

```

<a id="b01939"></a>
## b01939 — word/document\.xml/body/\*\[1939\]

```text

```

<a id="b01940"></a>
## b01940 — word/document\.xml/body/\*\[1940\]

```text
Figure: Close Container Screen – initiation
```

<a id="b01941"></a>
## b01941 — word/document\.xml/body/\*\[1941\]

```text

```

<a id="b01942"></a>
## b01942 — word/document\.xml/body/\*\[1942\]

```text
Figure: Close Container – Container details populated
```

<a id="b01943"></a>
## b01943 — word/document\.xml/body/\*\[1943\]

```text

```

<a id="b01944"></a>
## b01944 — word/document\.xml/body/\*\[1944\]

```text
		Shipping Container Insight
```

<a id="b01945"></a>
## b01945 — word/document\.xml/body/\*\[1945\]

```text

```

<a id="b01946"></a>
## b01946 — word/document\.xml/body/\*\[1946\]

```text
If necessary, the Shipping Container Insight can be used to modify the contents of the Shipping Container. The user can update the quantity to pack to 0 for any items needing to be unpacked from a container.  Once unpacked, the user can repack into new containers using the Packing screen.  
```

<a id="b01947"></a>
## b01947 — word/document\.xml/body/\*\[1947\]

```text

```

<a id="b01948"></a>
## b01948 — word/document\.xml/body/\*\[1948\]

```text
If user doesn’t have Container ID to Scan but still must perform the close container, then they can use Shipping Container Insight and filter based on the Shipment ID. From the Container insight, user can select the Container ID and then use the Close Action to close the container. [EX09 - Display Message on Close of Last Container of Shipment]
```

<a id="b01949"></a>
## b01949 — word/document\.xml/body/\*\[1949\]

```text

```

<a id="b01950"></a>
## b01950 — word/document\.xml/body/\*\[1950\]

```text
Figure: Shipping Container Insight
```

<a id="b01951"></a>
## b01951 — word/document\.xml/body/\*\[1951\]

```text

```

<a id="b01952"></a>
## b01952 — word/document\.xml/body/\*\[1952\]

```text

```

<a id="b01953"></a>
## b01953 — word/document\.xml/body/\*\[1953\]

```text
Figure: Shipping Container Insight with Close Container Option
```

<a id="b01954"></a>
## b01954 — word/document\.xml/body/\*\[1954\]

```text

```

<a id="b01955"></a>
## b01955 — word/document\.xml/body/\*\[1955\]

```text
Note: To edit container contents, a container must be in a location with a subclass of Packing.
```

<a id="b01956"></a>
## b01956 — word/document\.xml/body/\*\[1956\]

```text

```

<a id="b01957"></a>
## b01957 — word/document\.xml/body/\*\[1957\]

```text

```

<a id="b01958"></a>
## b01958 — word/document\.xml/body/\*\[1958\]

```text
		Carrier changes
```

<a id="b01959"></a>
## b01959 — word/document\.xml/body/\*\[1959\]

```text

```

<a id="b01960"></a>
## b01960 — word/document\.xml/body/\*\[1960\]

```text
Carrier is assigned as part of load planning before the wave is run. 
```

<a id="b01961"></a>
## b01961 — word/document\.xml/body/\*\[1961\]

```text

```

<a id="b01962"></a>
## b01962 — word/document\.xml/body/\*\[1962\]

```text
To change an LTL carrier before loading into truck, the user will use the Shipment Insight screen and utilize the Transfer Shipment option to change the carrier. 
```

<a id="b01963"></a>
## b01963 — word/document\.xml/body/\*\[1963\]

```text

```

<a id="b01964"></a>
## b01964 — word/document\.xml/body/\*\[1964\]

```text
When Transfer Shipment option is selected, user will be presented with an option to provide the destination load. If the user knows the load number, then they can enter the shipping load number and SCALE will transfer the shipment to that load.
```

<a id="b01965"></a>
## b01965 — word/document\.xml/body/\*\[1965\]

```text

```

<a id="b01966"></a>
## b01966 — word/document\.xml/body/\*\[1966\]

```text
If the load is not known, then user can select to create a new load and select the carrier for the new load. SCALE will create new load and then transfer the shipment to new load.
```

<a id="b01967"></a>
## b01967 — word/document\.xml/body/\*\[1967\]

```text
Carrier change after waving happens at a minimal and is an exception. Covetrus handles this using a SOP outside of SCALE. 
```

<a id="b01968"></a>
## b01968 — word/document\.xml/body/\*\[1968\]

```text

```

<a id="b01969"></a>
## b01969 — word/document\.xml/body/\*\[1969\]

```text

```

<a id="b01970"></a>
## b01970 — word/document\.xml/body/\*\[1970\]

```text

```

<a id="b01971"></a>
## b01971 — word/document\.xml/body/\*\[1971\]

```text
Figure: Shipment Insight – Transfer Shipment Option
```

<a id="b01972"></a>
## b01972 — word/document\.xml/body/\*\[1972\]

```text

```

<a id="b01973"></a>
## b01973 — word/document\.xml/body/\*\[1973\]

```text
Figure: Shipment Insight – Transfer to new load
```

<a id="b01974"></a>
## b01974 — word/document\.xml/body/\*\[1974\]

```text

```

<a id="b01975"></a>
## b01975 — word/document\.xml/body/\*\[1975\]

```text

```

<a id="b01976"></a>
## b01976 — word/document\.xml/body/\*\[1976\]

```text
Figure: Shipment Insight – Enter Destination Load Number or create New Load
```

<a id="b01977"></a>
## b01977 — word/document\.xml/body/\*\[1977\]

```text

```

<a id="b01978"></a>
## b01978 — word/document\.xml/body/\*\[1978\]

```text

```

<a id="b01979"></a>
## b01979 — word/document\.xml/body/\*\[1979\]

```text
		Packing Exceptions
```

<a id="b01980"></a>
## b01980 — word/document\.xml/body/\*\[1980\]

```text

```

<a id="b01981"></a>
## b01981 — word/document\.xml/body/\*\[1981\]

```text
A hospital pack station is be leveraged for exception handling. Covetrus develops manual SOPs to handle any packing exception in SCALE. 
```

<a id="b01982"></a>
## b01982 — word/document\.xml/body/\*\[1982\]

```text

```

<a id="b01983"></a>
## b01983 — word/document\.xml/body/\*\[1983\]

```text
DOCK MANAGEMENT
```

<a id="b01984"></a>
## b01984 — word/document\.xml/body/\*\[1984\]

```text
	
```

<a id="b01985"></a>
## b01985 — word/document\.xml/body/\*\[1985\]

```text
	Dock management represents the process of tracking shipments after they have arrived in the shipping dock area of the warehouse. These processes include the consolidation of items/containers at the packing area location, the placing of containers on the shipping dock at staging locations, and the loading of containers onto the truck, referred to in the system as dock door locations. 
```

<a id="b01986"></a>
## b01986 — word/document\.xml/body/\*\[1986\]

```text
	
```

<a id="b01987"></a>
## b01987 — word/document\.xml/body/\*\[1987\]

```text
Dock management is used at Covetrus LTL shipments. Covetrus utilizes dock area anchor criteria to define which staging locations are used based on the loading criteria. During waving, SCALE assigns default staging location any existing custom ODWS are run for manual dock selection and adding to existing load.
```

<a id="b01988"></a>
## b01988 — word/document\.xml/body/\*\[1988\]

```text

```

<a id="b01989"></a>
## b01989 — word/document\.xml/body/\*\[1989\]

```text
The following rule will be followed to assign Staging locations:
```

<a id="b01990"></a>
## b01990 — word/document\.xml/body/\*\[1990\]

```text

```

<a id="b01991"></a>
## b01991 — word/document\.xml/body/\*\[1991\]

```text
For All shipments, one staging location is assigned per Load by fault and dock anchor criteria is used
```

<a id="b01992"></a>
## b01992 — word/document\.xml/body/\*\[1992\]

```text

```

<a id="b01993"></a>
## b01993 — word/document\.xml/body/\*\[1993\]

```text
Covetrus stages the product in the middle doors of the warehouse towards the North and South directions. 
```

<a id="b01994"></a>
## b01994 — word/document\.xml/body/\*\[1994\]

```text
	
```

<a id="b01995"></a>
## b01995 — word/document\.xml/body/\*\[1995\]

```text
		Consolidation (After Picking)
```

<a id="b01996"></a>
## b01996 — word/document\.xml/body/\*\[1996\]

```text

```

<a id="b01997"></a>
## b01997 — word/document\.xml/body/\*\[1997\]

```text
Covetrus does not use the warehouse mobile consolidation process. 
```

<a id="b01998"></a>
## b01998 — word/document\.xml/body/\*\[1998\]

```text

```

<a id="b01999"></a>
## b01999 — word/document\.xml/body/\*\[1999\]

```text

```

<a id="b02000"></a>
## b02000 — word/document\.xml/body/\*\[2000\]

```text
		Single Order Nesting
```

<a id="b02001"></a>
## b02001 — word/document\.xml/body/\*\[2001\]

```text

```

<a id="b02002"></a>
## b02002 — word/document\.xml/body/\*\[2002\]

```text
Covetrus does not leverages Single Order Nesting. 
```

<a id="b02003"></a>
## b02003 — word/document\.xml/body/\*\[2003\]

```text

```

<a id="b02004"></a>
## b02004 — word/document\.xml/body/\*\[2004\]

```text

```

<a id="b02005"></a>
## b02005 — word/document\.xml/body/\*\[2005\]

```text
		Hospital Staging Area
```

<a id="b02006"></a>
## b02006 — word/document\.xml/body/\*\[2006\]

```text

```

<a id="b02007"></a>
## b02007 — word/document\.xml/body/\*\[2007\]

```text
If necessary, pallet nesting exceptions are handled at a physically different staging location station than the one used for the standard staging process. This is done to eliminate the bottleneck in the staging and loading process that could be added due to the analysis and resolutions needed for these problematic picks or packing/nesting scenarios. 
```

<a id="b02008"></a>
## b02008 — word/document\.xml/body/\*\[2008\]

```text

```

<a id="b02009"></a>
## b02009 — word/document\.xml/body/\*\[2009\]

```text
Covetrus leverages Immediate Dock Transfer to move the pallets to the hospital area and take corrective actions. If contents of the pallet need to be updated, Covetrus uses a manual SOP to update the status flow of the container to include packing and make the changes after moving the container systemically to the pack location
```

<a id="b02010"></a>
## b02010 — word/document\.xml/body/\*\[2010\]

```text

```

<a id="b02011"></a>
## b02011 — word/document\.xml/body/\*\[2011\]

```text
		Multiple Order Pallet
```

<a id="b02012"></a>
## b02012 — word/document\.xml/body/\*\[2012\]

```text

```

<a id="b02013"></a>
## b02013 — word/document\.xml/body/\*\[2013\]

```text
Covetrus does not Multi Order pallet functionality. A multiple order pallet is a single shipping pallet that has different shipments (can be for different ship to addresses also) placed on it. 
```

<a id="b02014"></a>
## b02014 — word/document\.xml/body/\*\[2014\]

```text
 
```

<a id="b02015"></a>
## b02015 — word/document\.xml/body/\*\[2015\]

```text

```

<a id="b02016"></a>
## b02016 — word/document\.xml/body/\*\[2016\]

```text
		Shipment Consolidation
```

<a id="b02017"></a>
## b02017 — word/document\.xml/body/\*\[2017\]

```text

```

<a id="b02018"></a>
## b02018 — word/document\.xml/body/\*\[2018\]

```text
Covetrus does not manually consolidate shipments at the dock. Shipment consolidation is used in waves. 
```

<a id="b02019"></a>
## b02019 — word/document\.xml/body/\*\[2019\]

```text

```

<a id="b02020"></a>
## b02020 — word/document\.xml/body/\*\[2020\]

```text

```

<a id="b02021"></a>
## b02021 — word/document\.xml/body/\*\[2021\]

```text
		Dock Door Assignment
```

<a id="b02022"></a>
## b02022 — word/document\.xml/body/\*\[2022\]

```text

```

<a id="b02023"></a>
## b02023 — word/document\.xml/body/\*\[2023\]

```text
Dock Door assignment at Covetrus is done manually.
```

<a id="b02024"></a>
## b02024 — word/document\.xml/body/\*\[2024\]

```text

```

<a id="b02025"></a>
## b02025 — word/document\.xml/body/\*\[2025\]

```text
Shipping loads are created for LTL and parcel carrier using the load building wave steps. When the Parcel / LTL carrier shows at the warehouse, the shipping supervisor instructs the driver to go to a specific dock door. In SCALE the user will go to shipping load insight screen and search for the shipping load and will edit the shipping load to assign a dock door. Loading work will get generated and user can perform this work to load the pallet to truck.
```

<a id="b02026"></a>
## b02026 — word/document\.xml/body/\*\[2026\]

```text

```

<a id="b02027"></a>
## b02027 — word/document\.xml/body/\*\[2027\]

```text

```

<a id="b02028"></a>
## b02028 — word/document\.xml/body/\*\[2028\]

```text
Figure– Shipping Load Insight
```

<a id="b02029"></a>
## b02029 — word/document\.xml/body/\*\[2029\]

```text

```

<a id="b02030"></a>
## b02030 — word/document\.xml/body/\*\[2030\]

```text
		Loading
```

<a id="b02031"></a>
## b02031 — word/document\.xml/body/\*\[2031\]

```text

```

<a id="b02032"></a>
## b02032 — word/document\.xml/body/\*\[2032\]

```text
The user starts the process by signing into the Immediate Dock Transfer option on warehouse mobile.  The user is then prompted to scan a Container ID.  The user scans the container ID and SCALE then presents the user with the Shipment ID, Load Number, Customer Name, Ship To, and Carrier.  The Dock Door location for the carton is displayed to the user and the user clicks Transfer to complete the transaction [EX30 - RF Immediate Dock Transfer 0 X of Y Container Count].  This updates the container status to Ship Confirm Pending. 
```

<a id="b02033"></a>
## b02033 — word/document\.xml/body/\*\[2033\]

```text

```

<a id="b02034"></a>
## b02034 — word/document\.xml/body/\*\[2034\]

```text
LOAD CONFIRMATION
```

<a id="b02035"></a>
## b02035 — word/document\.xml/body/\*\[2035\]

```text

```

<a id="b02036"></a>
## b02036 — word/document\.xml/body/\*\[2036\]

```text
		Processing
```

<a id="b02037"></a>
## b02037 — word/document\.xml/body/\*\[2037\]

```text

```

<a id="b02038"></a>
## b02038 — word/document\.xml/body/\*\[2038\]

```text
Covetrus Personnel use the Shipping Load Insight screen to monitor the status of shipments and loads. Once all shipments for a Load are in Ship Confirm Pending status, the Load can be confirmed.  To Confirm the Load, a user selects the Load and uses the Confirm Load action in the Shipping Load Insight options. This relieves the inventory from the Shipping Dock locations in SCALE.  At this point, the shipments are available for upload to the host system the next time the interface job runs.  In addition, the shipment can no longer be modified in SCALE.
```

<a id="b02039"></a>
## b02039 — word/document\.xml/body/\*\[2039\]

```text

```

<a id="b02040"></a>
## b02040 — word/document\.xml/body/\*\[2040\]

```text
Covetrus does not split shipments. The Shipping load leading and trailing status should be ship confirm pending. If the status is not Ship confirm pending, then user moves any shipments that are not in ship confirm pending to another load. This is necessary as Covetrus doesn’t want to Split the shipment. This is based on the restriction on the host system. 
```

<a id="b02041"></a>
## b02041 — word/document\.xml/body/\*\[2041\]

```text

```

<a id="b02042"></a>
## b02042 — word/document\.xml/body/\*\[2042\]

```text

```

<a id="b02043"></a>
## b02043 — word/document\.xml/body/\*\[2043\]

```text

```

<a id="b02044"></a>
## b02044 — word/document\.xml/body/\*\[2044\]

```text
Figure – Load confirm using Shipping Load insight
```

<a id="b02045"></a>
## b02045 — word/document\.xml/body/\*\[2045\]

```text

```

<a id="b02046"></a>
## b02046 — word/document\.xml/body/\*\[2046\]

```text
Additionally, personnel may print documents before, or after the load is confirmed using the Shipping Load Insight options [EX24- RF Document Printer Assignment]. must be done before generating or printing it.
```

<a id="b02047"></a>
## b02047 — word/document\.xml/body/\*\[2047\]

```text
Bill of Lading (DOC03)
```

<a id="b02048"></a>
## b02048 — word/document\.xml/body/\*\[2048\]

```text
Packing List (DOC02)
```

<a id="b02049"></a>
## b02049 — word/document\.xml/body/\*\[2049\]

```text

```

<a id="b02050"></a>
## b02050 — word/document\.xml/body/\*\[2050\]

```text
For international shipments, the commercial invoice is printed outside of SCALE. 
```

<a id="b02051"></a>
## b02051 — word/document\.xml/body/\*\[2051\]

```text

```

<a id="b02052"></a>
## b02052 — word/document\.xml/body/\*\[2052\]

```text
Once a load has been confirmed, all statuses (load, shipments, details, containers) are moved to Closed, and inventory is relieved from the Shipping Dock (is officially out of the building). This generates the shipment upload interface files for the Host system.
```

<a id="b02053"></a>
## b02053 — word/document\.xml/body/\*\[2053\]

```text

```

<a id="b02054"></a>
## b02054 — word/document\.xml/body/\*\[2054\]

```text

```

<a id="b02055"></a>
## b02055 — word/document\.xml/body/\*\[2055\]

```text
PARCEL MANIFESTING PROCESS
```

<a id="b02056"></a>
## b02056 — word/document\.xml/body/\*\[2056\]

```text

```

<a id="b02057"></a>
## b02057 — word/document\.xml/body/\*\[2057\]

```text
All parcel manifest processing is executed from the Manifest Insight screen. Users can view any pertinent manifest information from this option. Any action for FedEx carrier is excluded from this screen. There is no end of day processing necessary for FedEx parcel carrier. Covetrus does not user any other parcel carrier.
```

<a id="b02058"></a>
## b02058 — word/document\.xml/body/\*\[2058\]

```text

```

<a id="b02059"></a>
## b02059 — word/document\.xml/body/\*\[2059\]

```text
		End of Day Processing
```

<a id="b02060"></a>
## b02060 — word/document\.xml/body/\*\[2060\]

```text

```

<a id="b02061"></a>
## b02061 — word/document\.xml/body/\*\[2061\]

```text
Manifests can be closed at the end of the day by clicking on a Manifest from the Manifest Insight and choosing the Close option.  Rating Systems Value “Allow Multiple Manifests per Day” is set to Yes. 
```

<a id="b02062"></a>
## b02062 — word/document\.xml/body/\*\[2062\]

```text

```

<a id="b02063"></a>
## b02063 — word/document\.xml/body/\*\[2063\]

```text

```

<a id="b02064"></a>
## b02064 — word/document\.xml/body/\*\[2064\]

```text
Figure: Manifest Insight Screen
```

<a id="b02065"></a>
## b02065 — word/document\.xml/body/\*\[2065\]

```text

```

<a id="b02066"></a>
## b02066 — word/document\.xml/body/\*\[2066\]

```text

```

<a id="b02067"></a>
## b02067 — word/document\.xml/body/\*\[2067\]

```text

```

<a id="b02068"></a>
## b02068 — word/document\.xml/body/\*\[2068\]

```text

```

<a id="b02069"></a>
## b02069 — word/document\.xml/body/\*\[2069\]

```text

```

<a id="b02070"></a>
## b02070 — word/document\.xml/body/\*\[2070\]

```text

```

<a id="b02071"></a>
## b02071 — word/document\.xml/body/\*\[2071\]

```text

```

<a id="b02072"></a>
## b02072 — word/document\.xml/body/\*\[2072\]

```text

```

<a id="b02073"></a>
## b02073 — word/document\.xml/body/\*\[2073\]

```text

```

<a id="b02074"></a>
## b02074 — word/document\.xml/body/\*\[2074\]

```text

```

<a id="b02075"></a>
## b02075 — word/document\.xml/body/\*\[2075\]

```text

```

<a id="b02076"></a>
## b02076 — word/document\.xml/body/\*\[2076\]

```text

```

<a id="b02077"></a>
## b02077 — word/document\.xml/body/\*\[2077\]

```text

```

<a id="b02078"></a>
## b02078 — word/document\.xml/body/\*\[2078\]

```text

```

<a id="b02079"></a>
## b02079 — word/document\.xml/body/\*\[2079\]

```text

```

<a id="b02080"></a>
## b02080 — word/document\.xml/body/\*\[2080\]

```text

```

<a id="b02081"></a>
## b02081 — word/document\.xml/body/\*\[2081\]

```text

```

<a id="b02082"></a>
## b02082 — word/document\.xml/body/\*\[2082\]

```text

```

<a id="b02083"></a>
## b02083 — word/document\.xml/body/\*\[2083\]

```text

```

<a id="b02084"></a>
## b02084 — word/document\.xml/body/\*\[2084\]

```text

```

<a id="b02085"></a>
## b02085 — word/document\.xml/body/\*\[2085\]

```text

```

<a id="b02086"></a>
## b02086 — word/document\.xml/body/\*\[2086\]

```text

```

<a id="b02087"></a>
## b02087 — word/document\.xml/body/\*\[2087\]

```text

```

<a id="b02088"></a>
## b02088 — word/document\.xml/body/\*\[2088\]

```text
V.	LABOR MANAGEMENT
```

<a id="b02089"></a>
## b02089 — word/document\.xml/body/\*\[2089\]

```text

```

<a id="b02090"></a>
## b02090 — word/document\.xml/body/\*\[2090\]

```text
Covetrus will use SCALE Labor management module for the initial Go-Live. It is not being used in the current version of SCALE.
```

<a id="b02091"></a>
## b02091 — word/document\.xml/body/\*\[2091\]

```text

```

<a id="b02092"></a>
## b02092 — word/document\.xml/body/\*\[2092\]

```text
SCALE generates this labor data when a worker performs one of many warehouse actions, such as work execution (both full-screen and warehouse mobile), packing, and receiving. Labor management can provide with such information as “how efficient is this employee at picking Eaches?” or “how many containers can this employee pick an hour. It also provides how well the labor plan measures up to what was expected. This data can be used to plan the warehouse operations. 
```

<a id="b02093"></a>
## b02093 — word/document\.xml/body/\*\[2093\]

```text

```

<a id="b02094"></a>
## b02094 — word/document\.xml/body/\*\[2094\]

```text
  KEY FEATURES
```

<a id="b02095"></a>
## b02095 — word/document\.xml/body/\*\[2095\]

```text
Following key features of labor management functionality are available: 
```

<a id="b02096"></a>
## b02096 — word/document\.xml/body/\*\[2096\]

```text
		Using Labor Management Data
```

<a id="b02097"></a>
## b02097 — word/document\.xml/body/\*\[2097\]

```text
The system includes few options to view labor data on both individuals and teams: Labor Activity Insight, Labor Monitoring, and an optional Operational SCI component. Manual Labor Entry Screen can be used to manually enter labor data records that are not “tracked” by the application in typical warehouse processing. For example, custodial staff may log their time used in cleaning the warehouse, labeling this time with a custom work type used only for these types of tasks.
```

<a id="b02098"></a>
## b02098 — word/document\.xml/body/\*\[2098\]

```text
		Generating Labor Management Data Records
```

<a id="b02099"></a>
## b02099 — word/document\.xml/body/\*\[2099\]

```text
When an employee executes a warehouse action (such as confirming a work instruction), the system generates a request record. This request is processed by the Labor Management service (which runs continuously, looking for labor requests). A labor management detail record then is generated by this service to represent the action that the user performed. These detailed records can be viewed either in the Labor Activity Insight or on a report
```

<a id="b02100"></a>
## b02100 — word/document\.xml/body/\*\[2100\]

```text
Operational Implication: Covetrus uses automatic putaway on picking work profiles currently. This results in a put confirmation transaction as soon as all picks are completed. If the user executes all the picks and then walks to the pack station or destined putaway location, that time is not included in the transactions, leading to inaccurate data for labor management analysis. As Covetrus ramps up using labor management data analysis, automatic putaway removal from pilot work profiles for a DC will be monitored to review the resulting data before it is deployed to all sites. 
```

<a id="b02101"></a>
## b02101 — word/document\.xml/body/\*\[2101\]

```text

```

<a id="b02102"></a>
## b02102 — word/document\.xml/body/\*\[2102\]

```text
		Labor Groups
```

<a id="b02103"></a>
## b02103 — word/document\.xml/body/\*\[2103\]

```text
A labor group represents a collection of warehouse users that perform related work duties, such as picking products for a certain company’s shipments. The labor group records in SCALE define such employee information as to how many people (full time and temporary) who work at the warehouse, as well as what quantity units of measure they typically process.
```

<a id="b02104"></a>
## b02104 — word/document\.xml/body/\*\[2104\]

```text

```

<a id="b02105"></a>
## b02105 — word/document\.xml/body/\*\[2105\]

```text
	Figure – Labor Group	
```

<a id="b02106"></a>
## b02106 — word/document\.xml/body/\*\[2106\]

```text

```

<a id="b02107"></a>
## b02107 — word/document\.xml/body/\*\[2107\]

```text
		Labor Plans
```

<a id="b02108"></a>
## b02108 — word/document\.xml/body/\*\[2108\]

```text
Labor plans identify how the system will calculate the estimated labor data during the run wave process. An actual plan is a record that determines which labor group(s) to calculate values for in the wave, and in what sequence order to process them. Note that the labor plan execution wave step must be a part of the flow to use this value. Reports can be developed to view this data.
```

<a id="b02109"></a>
## b02109 — word/document\.xml/body/\*\[2109\]

```text
 
```

<a id="b02110"></a>
## b02110 — word/document\.xml/body/\*\[2110\]

```text
Figure – Labor Plan
```

<a id="b02111"></a>
## b02111 — word/document\.xml/body/\*\[2111\]

```text
The system uses the Shipment Labor planning criteria record to determine what shipment(s) the labor plan execution wave step will process when calculating estimated labor data for a certain labor group. It is associated with a labor group record. For example, suppose labor group needs to process only shipments that contain items from a certain work zone, a shipment labor planning criteria record is created that has a rule defined that indicates that any shipment line(s) that contain items that originate from a specific work zone should be processed by this group.
```

<a id="b02112"></a>
## b02112 — word/document\.xml/body/\*\[2112\]

```text

```

<a id="b02113"></a>
## b02113 — word/document\.xml/body/\*\[2113\]

```text
Figure – Shipment Labor planning criteria
```

<a id="b02114"></a>
## b02114 — word/document\.xml/body/\*\[2114\]

```text
		Direct/Indirect Labor
```

<a id="b02115"></a>
## b02115 — word/document\.xml/body/\*\[2115\]

```text
Direct Labor describes an activity performed by a worker that provides direct value to the warehouse. For example, such activities as performing actions in SCALE, or such physical activities as loading shipments onto a truck.
```

<a id="b02116"></a>
## b02116 — word/document\.xml/body/\*\[2116\]

```text
Indirect Labor describes a basic maintenance activity performed by a worker that is required for the business to operate but does not directly impact the customer. For example, activities such as cleaning the warehouse. Indirect labor cannot be tracked from RF. The following are a few suggested work types that Covetrus may track for Indirect Labor using the Manual Labor Entry Screen. 
```

<a id="b02117"></a>
## b02117 — word/document\.xml/body/\*\[2117\]

```text
	Box Building
```

<a id="b02118"></a>
## b02118 — word/document\.xml/body/\*\[2118\]

```text
	Mopping
```

<a id="b02119"></a>
## b02119 — word/document\.xml/body/\*\[2119\]

```text
	Cleaning
```

<a id="b02120"></a>
## b02120 — word/document\.xml/body/\*\[2120\]

```text
	Bathroom Break
```

<a id="b02121"></a>
## b02121 — word/document\.xml/body/\*\[2121\]

```text
	
```

<a id="b02122"></a>
## b02122 — word/document\.xml/body/\*\[2122\]

```text
	
```

<a id="b02123"></a>
## b02123 — word/document\.xml/body/\*\[2123\]

```text
	Figure – Manual Labor Entry
```

<a id="b02124"></a>
## b02124 — word/document\.xml/body/\*\[2124\]

```text
	
```

<a id="b02125"></a>
## b02125 — word/document\.xml/body/\*\[2125\]

```text
		View Labor Activity
```

<a id="b02126"></a>
## b02126 — word/document\.xml/body/\*\[2126\]

```text
	
```

<a id="b02127"></a>
## b02127 — word/document\.xml/body/\*\[2127\]

```text
	Labor Activity can be viewed using Labor Activity Insight Screen
```

<a id="b02128"></a>
## b02128 — word/document\.xml/body/\*\[2128\]

```text
	
```

<a id="b02129"></a>
## b02129 — word/document\.xml/body/\*\[2129\]

```text
	
```

<a id="b02130"></a>
## b02130 — word/document\.xml/body/\*\[2130\]

```text
Figure – Labor Activity Insight
```

<a id="b02131"></a>
## b02131 — word/document\.xml/body/\*\[2131\]

```text
	
```

<a id="b02132"></a>
## b02132 — word/document\.xml/body/\*\[2132\]

```text
	
```

<a id="b02133"></a>
## b02133 — word/document\.xml/body/\*\[2133\]

```text
	
```

<a id="b02134"></a>
## b02134 — word/document\.xml/body/\*\[2134\]

```text
	
```

<a id="b02135"></a>
## b02135 — word/document\.xml/body/\*\[2135\]

```text
	
```

<a id="b02136"></a>
## b02136 — word/document\.xml/body/\*\[2136\]

```text
	
```

<a id="b02137"></a>
## b02137 — word/document\.xml/body/\*\[2137\]

```text
	
```

<a id="b02138"></a>
## b02138 — word/document\.xml/body/\*\[2138\]

```text
	
```

<a id="b02139"></a>
## b02139 — word/document\.xml/body/\*\[2139\]

```text
	
```

<a id="b02140"></a>
## b02140 — word/document\.xml/body/\*\[2140\]

```text

```

<a id="b02141"></a>
## b02141 — word/document\.xml/body/\*\[2141\]

```text

```

<a id="b02142"></a>
## b02142 — word/document\.xml/body/\*\[2142\]

```text

```

<a id="b02143"></a>
## b02143 — word/document\.xml/body/\*\[2143\]

```text

```

<a id="b02144"></a>
## b02144 — word/document\.xml/body/\*\[2144\]

```text

```

<a id="b02145"></a>
## b02145 — word/document\.xml/body/\*\[2145\]

```text

```

<a id="b02146"></a>
## b02146 — word/document\.xml/body/\*\[2146\]

```text

```

<a id="b02147"></a>
## b02147 — word/document\.xml/body/\*\[2147\]

```text

```

<a id="b02148"></a>
## b02148 — word/document\.xml/body/\*\[2148\]

```text

```

<a id="b02149"></a>
## b02149 — word/document\.xml/body/\*\[2149\]

```text

```

<a id="b02150"></a>
## b02150 — word/document\.xml/body/\*\[2150\]

```text

```

<a id="b02151"></a>
## b02151 — word/document\.xml/body/\*\[2151\]

```text

```

<a id="b02152"></a>
## b02152 — word/document\.xml/body/\*\[2152\]

```text

```

<a id="b02153"></a>
## b02153 — word/document\.xml/body/\*\[2153\]

```text

```

<a id="b02154"></a>
## b02154 — word/document\.xml/body/\*\[2154\]

```text

```

<a id="b02155"></a>
## b02155 — word/document\.xml/body/\*\[2155\]

```text

```

<a id="b02156"></a>
## b02156 — word/document\.xml/body/\*\[2156\]

```text

```

<a id="b02157"></a>
## b02157 — word/document\.xml/body/\*\[2157\]

```text

```

<a id="b02158"></a>
## b02158 — word/document\.xml/body/\*\[2158\]

```text

```

<a id="b02159"></a>
## b02159 — word/document\.xml/body/\*\[2159\]

```text

```

<a id="b02160"></a>
## b02160 — word/document\.xml/body/\*\[2160\]

```text
VI. 	CONVERSION NOTE
```

<a id="b02161"></a>
## b02161 — word/document\.xml/body/\*\[2161\]

```text

```

<a id="b02162"></a>
## b02162 — word/document\.xml/body/\*\[2162\]

```text
As part of the physical conversion process, Covetrus uses inventory loading from the backend. The stage environment is first loaded with a restore from Covetrus’ production database. Any configurations made after that in the production database must be documented and executed in stage. Covetrus will provide the inventory records in an Excel file and Manhattan team will be loading the inventory into SCALE. This is one time process and will be executed during the conversion weekend. Manhattan will provide the format and the fields that are needed and Covetrus will provide data in that manner. 
```

<a id="b02163"></a>
## b02163 — word/document\.xml/body/\*\[2163\]

```text

```

<a id="b02164"></a>
## b02164 — word/document\.xml/body/\*\[2164\]

```text
Covetrus acknowledges having documented inventory accuracy at or above 98% for the locations that are not counted.
```

<a id="b02165"></a>
## b02165 — word/document\.xml/body/\*\[2165\]

```text

```

<a id="b02166"></a>
## b02166 — word/document\.xml/body/\*\[2166\]

```text
A detailed conversion plan document will be developed during the build phase. The conversion plan must consider phase based deployment strategy and DSCSA dependency. 
```

<a id="b02167"></a>
## b02167 — word/document\.xml/body/\*\[2167\]

```text

```

<a id="b02168"></a>
## b02168 — word/document\.xml/body/\*\[2168\]

```text

```

<a id="b02169"></a>
## b02169 — word/document\.xml/body/\*\[2169\]

```text

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

```

<a id="b02173"></a>
## b02173 — word/document\.xml/body/\*\[2173\]

```text

```

<a id="b02174"></a>
## b02174 — word/document\.xml/body/\*\[2174\]

```text

```

<a id="b02175"></a>
## b02175 — word/document\.xml/body/\*\[2175\]

```text

```

<a id="b02176"></a>
## b02176 — word/document\.xml/body/\*\[2176\]

```text

```

<a id="b02177"></a>
## b02177 — word/document\.xml/body/\*\[2177\]

```text

```

<a id="b02178"></a>
## b02178 — word/document\.xml/body/\*\[2178\]

```text

```

<a id="b02179"></a>
## b02179 — word/document\.xml/body/\*\[2179\]

```text

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

```

<a id="b02183"></a>
## b02183 — word/document\.xml/body/\*\[2183\]

```text

```

<a id="b02184"></a>
## b02184 — word/document\.xml/body/\*\[2184\]

```text

```

<a id="b02185"></a>
## b02185 — word/document\.xml/body/\*\[2185\]

```text

```

<a id="b02186"></a>
## b02186 — word/document\.xml/body/\*\[2186\]

```text

```

<a id="b02187"></a>
## b02187 — word/document\.xml/body/\*\[2187\]

```text

```

<a id="b02188"></a>
## b02188 — word/document\.xml/body/\*\[2188\]

```text

```

<a id="b02189"></a>
## b02189 — word/document\.xml/body/\*\[2189\]

```text

```

<a id="b02190"></a>
## b02190 — word/document\.xml/body/\*\[2190\]

```text

```

<a id="b02191"></a>
## b02191 — word/document\.xml/body/\*\[2191\]

```text

```

<a id="b02192"></a>
## b02192 — word/document\.xml/body/\*\[2192\]

```text

```

<a id="b02193"></a>
## b02193 — word/document\.xml/body/\*\[2193\]

```text

```

<a id="b02194"></a>
## b02194 — word/document\.xml/body/\*\[2194\]

```text

```

<a id="b02195"></a>
## b02195 — word/document\.xml/body/\*\[2195\]

```text

```

<a id="b02196"></a>
## b02196 — word/document\.xml/body/\*\[2196\]

```text

```

<a id="b02197"></a>
## b02197 — word/document\.xml/body/\*\[2197\]

```text

```

<a id="b02198"></a>
## b02198 — word/document\.xml/body/\*\[2198\]

```text
VII. 	SYSTEM EXTENSIONS
```

<a id="b02199"></a>
## b02199 — word/document\.xml/body/\*\[2199\]

```text

```

<a id="b02200"></a>
## b02200 — word/document\.xml/body/\*\[2200\]

```text
		Interface Integration Extensions
```

<a id="b02201"></a>
## b02201 — word/document\.xml/body/\*\[2201\]

```text
		
```

<a id="b02202"></a>
## b02202 — word/document\.xml/body/\*\[2202\]

```text
		Extension			Description (Defined above in the interface section)
		EX04			Conveyor Integration 
		
		Pick and Pass Zone based divert information sent to WCS at wave release to divert the containers for respective zone picks. 
		
		EX11			Invoice in the Box
		
		Shipment upload interface data is sent at the last container close to the host. Host generates and prints an invoice that is enclosed in the container.
```

<a id="b02203"></a>
## b02203 — word/document\.xml/body/\*\[2203\]

```text
		
```

<a id="b02204"></a>
## b02204 — word/document\.xml/body/\*\[2204\]

```text
		Performance Management Extensions
```

<a id="b02205"></a>
## b02205 — word/document\.xml/body/\*\[2205\]

```text
		
```

<a id="b02206"></a>
## b02206 — word/document\.xml/body/\*\[2206\]

```text
		Extension			Description			Module
		N/A						
```

<a id="b02207"></a>
## b02207 — word/document\.xml/body/\*\[2207\]

```text
		
```

<a id="b02208"></a>
## b02208 — word/document\.xml/body/\*\[2208\]

```text
		Warehouse Management Extensions
```

<a id="b02209"></a>
## b02209 — word/document\.xml/body/\*\[2209\]

```text
		
```

<a id="b02210"></a>
## b02210 — word/document\.xml/body/\*\[2210\]

```text
		Extension			Description
		EX01
		
					Track and Trace
		
		Enhanced validations during receiving per FDA guidelines for tracking and traceability of certain drugs at unit level
		EX03
					GS1 label processing
		
		Parsing of GS1, 2D barcode labels across functional areas. Has dependency on recent DSCSA EX21 
		EX06
		
			Track and Trace Item Adjustment Restriction 

		Restrict T&T item adjustment in  the DC
		 EX07
			Work Confirmation Item validation

Turn off item validation for items not having barcode on the product. (Flagged in SCALE)
		EX09	Display message of last container close

Visual aid to the packer for ensuring the pack list and invoice must go into the last container closed.
		EX10
			Warehouse Change on Warehouse Mobile

Allow the users to change the default warehouse via WHM as cage DC are physically in the other larger buildings.
		EX12	Process History for Wave
		EX13	Large Animal Pharmacy VAS

Enhance Planned Shipment Insight, Shipment Insight, Shipping Container Insight to add columns to aid the pharmacy VAS process.
		EX20 			DSCSA Data Import – SP coming into data. Generic data bind API 
		EX21 			DSCSA Inbound 
		EX22 			DSCSA Outbound 
		EX23 			DSCSA Insight Screen 
		EX24 			RF Document Printer Assignment 
		EX25			Cycle Count Management
		
		Prevent the cycle count plan to close when the cycle count request is in pending review
		
		EX26			3DC Cubing
		EX27	Display UOM info on Replen pick screen
EX28	Display Item Category 2 for outbound pick work execution
EX29
			Transaction History for Removal of Hold codes (AI0024)

EX30	RF Immediate Dock Transfer 0 X of Y Container Count (AI0027)

AI0033
(Deprecated)
			Cycle Count Request Creation order by location 

EX31
			EX11 Document Routing Changes (AI0063)

```

<a id="b02211"></a>
## b02211 — word/document\.xml/body/\*\[2211\]

```text

```

<a id="b02212"></a>
## b02212 — word/document\.xml/body/\*\[2212\]

```text
 
```

<a id="b02213"></a>
## b02213 — word/document\.xml/body/\*\[2213\]

```text
		Stored Procedures for Generic Data Bind API
```

<a id="b02214"></a>
## b02214 — word/document\.xml/body/\*\[2214\]

```text
		SP			Description
		N/A			To be documented if identified during tech design
					
```

<a id="b02215"></a>
## b02215 — word/document\.xml/body/\*\[2215\]

```text
		
```

<a id="b02216"></a>
## b02216 — word/document\.xml/body/\*\[2216\]

```text
		Warehouse Management Gaps for future considerations 
```

<a id="b02217"></a>
## b02217 — word/document\.xml/body/\*\[2217\]

```text
		Extension			Description
		N/A			
```

<a id="b02218"></a>
## b02218 — word/document\.xml/body/\*\[2218\]

```text
	
```

<a id="b02219"></a>
## b02219 — word/document\.xml/body/\*\[2219\]

```text
		Documents
```

<a id="b02220"></a>
## b02220 — word/document\.xml/body/\*\[2220\]

```text
		Document 			Description
		DOC01			Receiving Worksheet
		DOC02			Pack List
		DOC03				Bill of Lading	
```

<a id="b02221"></a>
## b02221 — word/document\.xml/body/\*\[2221\]

```text
		
```

<a id="b02222"></a>
## b02222 — word/document\.xml/body/\*\[2222\]

```text
		
```

<a id="b02223"></a>
## b02223 — word/document\.xml/body/\*\[2223\]

```text
		Labels
```

<a id="b02224"></a>
## b02224 — word/document\.xml/body/\*\[2224\]

```text
		
```

<a id="b02225"></a>
## b02225 — word/document\.xml/body/\*\[2225\]

```text
		Label 			Description
		LBL01			Receipt Container Label 
		LBL02			Vendor Label
		LBL03			Container Contents Label
		LBL04			Shipping Label
		LBL05			Break Label
		LBL06			Pallet Label
```

<a id="b02226"></a>
## b02226 — word/document\.xml/body/\*\[2226\]

```text
		
```

<a id="b02227"></a>
## b02227 — word/document\.xml/body/\*\[2227\]

```text
		*Note: For each of the documents and labels (unless part of the Top 100 Retailers for outbound labels) listed above, Covetrus owns the development and certification process.
```

<a id="b02228"></a>
## b02228 — word/document\.xml/body/\*\[2228\]

```text
		
```

<a id="b02229"></a>
## b02229 — word/document\.xml/body/\*\[2229\]

```text
		
```

<a id="b02230"></a>
## b02230 — word/document\.xml/body/\*\[2230\]

```text
		Exit Points
```

<a id="b02231"></a>
## b02231 — word/document\.xml/body/\*\[2231\]

```text
		
```

<a id="b02232"></a>
## b02232 — word/document\.xml/body/\*\[2232\]

```text
		Exit Point 			Description
		Locating Rule Set Assignment - Before			
						
					
					
```

<a id="b02233"></a>
## b02233 — word/document\.xml/body/\*\[2233\]

```text
		
```

<a id="b02234"></a>
## b02234 — word/document\.xml/body/\*\[2234\]

```text
		Notifications
```

<a id="b02235"></a>
## b02235 — word/document\.xml/body/\*\[2235\]

```text
		Notification 			Description
		Several			TBD as needed
					
					
```

<a id="b02236"></a>
## b02236 — word/document\.xml/body/\*\[2236\]

```text
		
```

<a id="b02237"></a>
## b02237 — word/document\.xml/body/\*\[2237\]

```text
		Labor Management Extensions
```

<a id="b02238"></a>
## b02238 — word/document\.xml/body/\*\[2238\]

```text
		Extension			Description
		N/A			
```

<a id="b02239"></a>
## b02239 — word/document\.xml/body/\*\[2239\]

```text
		
```

<a id="b02240"></a>
## b02240 — word/document\.xml/body/\*\[2240\]

```text
		
```

<a id="b02241"></a>
## b02241 — word/document\.xml/body/\*\[2241\]

```text


```

<a id="b02242"></a>
## b02242 — word/document\.xml/body/\*\[2242\]

```text
VIII.	OPEN ISSUES
```

<a id="b02243"></a>
## b02243 — word/document\.xml/body/\*\[2243\]

```text

```

<a id="b02244"></a>
## b02244 — word/document\.xml/body/\*\[2244\]

```text
Group Container close for dry cart pick.  
```

<a id="b02245"></a>
## b02245 — word/document\.xml/body/\*\[2245\]

```text

```

<a id="b02246"></a>
## b02246 — word/document\.xml/body/\*\[2246\]

```text
3D cubing extension EX26 in CSO development.
```

<a id="b02247"></a>
## b02247 — word/document\.xml/body/\*\[2247\]

```text

```

<a id="b02248"></a>
## b02248 — word/document\.xml/body/\*\[2248\]

```text
DSCSA dependency. 
```

<a id="b02249"></a>
## b02249 — word/document\.xml/body/\*\[2249\]

```text

```

<a id="b02250"></a>
## b02250 — word/document\.xml/body/\*\[2250\]

```text
Work special handling – identify needed and impact analysis for WHM
```

<a id="b02251"></a>
## b02251 — word/document\.xml/body/\*\[2251\]

```text

```

<a id="b02252"></a>
## b02252 — word/document\.xml/body/\*\[2252\]

```text

```

<a id="b02253"></a>
## b02253 — word/document\.xml/body/\*\[2253\]

```text

```

<a id="b02254"></a>
## b02254 — word/document\.xml/body/\*\[2254\]

```text

```

<a id="b02255"></a>
## b02255 — word/document\.xml/body/\*\[2255\]

```text


```

<a id="b02256"></a>
## b02256 — word/document\.xml/body/\*\[2256\]

```text
IX.	RESOLVED ISSUES 
```

<a id="b02257"></a>
## b02257 — word/document\.xml/body/\*\[2257\]

```text

```

<a id="b02258"></a>
## b02258 — word/document\.xml/body/\*\[2258\]

```text
Can an inbound trailer have multiple receipts? 
```

<a id="b02259"></a>
## b02259 — word/document\.xml/body/\*\[2259\]

```text

```

<a id="b02260"></a>
## b02260 — word/document\.xml/body/\*\[2260\]

```text
Yes. One I/B trailer can have multiple receipts.
```

<a id="b02261"></a>
## b02261 — word/document\.xml/body/\*\[2261\]

```text
			
```

<a id="b02262"></a>
## b02262 — word/document\.xml/body/\*\[2262\]

```text
			Is the country of origin tracking needed for allocation?
```

<a id="b02263"></a>
## b02263 — word/document\.xml/body/\*\[2263\]

```text
				No. If the same item is manufactured in different countries, Covetrus uses a unique item code for it. 
```

<a id="b02264"></a>
## b02264 — word/document\.xml/body/\*\[2264\]

```text
Can we use appointment scheduling screen for outbound loads? 
```

<a id="b02265"></a>
## b02265 — word/document\.xml/body/\*\[2265\]

```text
			No, we cannot by base. 
```

<a id="b02266"></a>
## b02266 — word/document\.xml/body/\*\[2266\]

```text
How is QC done for fragile items? 
```

<a id="b02267"></a>
## b02267 — word/document\.xml/body/\*\[2267\]

```text
			QC is done as part of picking using item messages or item category display on warehouse mobile. QC work bench is used for visual QC for configured criteria and mostly force passed. 
```

<a id="b02268"></a>
## b02268 — word/document\.xml/body/\*\[2268\]

```text
Is limited shipping items picked different in its own work 
```

<a id="b02269"></a>
## b02269 — word/document\.xml/body/\*\[2269\]

```text
				No. No changes to existing setup.
```

<a id="b02270"></a>
## b02270 — word/document\.xml/body/\*\[2270\]

```text
			
```

<a id="b02271"></a>
## b02271 — word/document\.xml/body/\*\[2271\]

```text
			
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
			
```

<a id="b02275"></a>
## b02275 — word/document\.xml/body/\*\[2275\]

```text
			
```

<a id="b02276"></a>
## b02276 — word/document\.xml/body/\*\[2276\]

```text
			
```

<a id="b02277"></a>
## b02277 — word/document\.xml/body/\*\[2277\]

```text
			
```

<a id="b02278"></a>
## b02278 — word/document\.xml/body/\*\[2278\]

```text
			
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
			
```

<a id="b02282"></a>
## b02282 — word/document\.xml/body/\*\[2282\]

```text
			
```

<a id="b02283"></a>
## b02283 — word/document\.xml/body/\*\[2283\]

```text
			
```

<a id="b02284"></a>
## b02284 — word/document\.xml/body/\*\[2284\]

```text
			
```

<a id="b02285"></a>
## b02285 — word/document\.xml/body/\*\[2285\]

```text
			
```

<a id="b02286"></a>
## b02286 — word/document\.xml/body/\*\[2286\]

```text
X.   FUTURE FUNCTIONALITY 
```

<a id="b02287"></a>
## b02287 — word/document\.xml/body/\*\[2287\]

```text

```

<a id="b02288"></a>
## b02288 — word/document\.xml/body/\*\[2288\]

```text

```

<a id="b02289"></a>
## b02289 — word/document\.xml/body/\*\[2289\]

```text
Use Country of Origin on item master
```

<a id="b02290"></a>
## b02290 — word/document\.xml/body/\*\[2290\]

```text
Review location unit of measure and overrides 
```

<a id="b02291"></a>
## b02291 — word/document\.xml/body/\*\[2291\]

```text
Single unit packing
```

<a id="b02292"></a>
## b02292 — word/document\.xml/body/\*\[2292\]

```text
LPN receiving using shipment EDI to include container information for DRP orders
```

<a id="b02293"></a>
## b02293 — word/document\.xml/body/\*\[2293\]

```text
International parcel shipping using SCALE integration with iShip or FSMS. 
```

<a id="b02294"></a>
## b02294 — word/document\.xml/body/\*\[2294\]

```text

```

<a id="b02295"></a>
## b02295 — word/document\.xml/body/\*\[2295\]

```text

```

<a id="b02296"></a>
## b02296 — word/document\.xml/body/\*\[2296\]

```text

```

<a id="b02297"></a>
## b02297 — word/document\.xml/body/\*\[2297\]

```text

```

<a id="b02298"></a>
## b02298 — word/document\.xml/body/\*\[2298\]

```text

```

<a id="b02299"></a>
## b02299 — word/document\.xml/body/\*\[2299\]

```text

```

<a id="b02300"></a>
## b02300 — word/document\.xml/body/\*\[2300\]

```text

```

<a id="b02301"></a>
## b02301 — word/document\.xml/body/\*\[2301\]

```text

```

<a id="b02302"></a>
## b02302 — word/document\.xml/body/\*\[2302\]

```text

```

<a id="b02303"></a>
## b02303 — word/document\.xml/body/\*\[2303\]

```text

```

<a id="b02304"></a>
## b02304 — word/document\.xml/body/\*\[2304\]

```text

```

<a id="b02305"></a>
## b02305 — word/document\.xml/body/\*\[2305\]

```text

```

<a id="b02306"></a>
## b02306 — word/document\.xml/body/\*\[2306\]

```text

```

<a id="b02307"></a>
## b02307 — word/document\.xml/body/\*\[2307\]

```text

```

<a id="b02308"></a>
## b02308 — word/document\.xml/body/\*\[2308\]

```text

```

<a id="b02309"></a>
## b02309 — word/document\.xml/body/\*\[2309\]

```text

```

<a id="b02310"></a>
## b02310 — word/document\.xml/body/\*\[2310\]

```text

```

<a id="b02311"></a>
## b02311 — word/document\.xml/body/\*\[2311\]

```text

```

<a id="b02312"></a>
## b02312 — word/document\.xml/body/\*\[2312\]

```text

```

<a id="b02313"></a>
## b02313 — word/document\.xml/body/\*\[2313\]

```text

```

<a id="b02314"></a>
## b02314 — word/document\.xml/body/\*\[2314\]

```text

```

<a id="b02315"></a>
## b02315 — word/document\.xml/body/\*\[2315\]

```text

```

<a id="b02316"></a>
## b02316 — word/document\.xml/body/\*\[2316\]

```text

```

<a id="b02317"></a>
## b02317 — word/document\.xml/body/\*\[2317\]

```text

```

<a id="b02318"></a>
## b02318 — word/document\.xml/body/\*\[2318\]

```text

```

<a id="b02319"></a>
## b02319 — word/document\.xml/body/\*\[2319\]

```text

```

<a id="b02320"></a>
## b02320 — word/document\.xml/body/\*\[2320\]

```text

```

<a id="b02321"></a>
## b02321 — word/document\.xml/body/\*\[2321\]

```text

```

<a id="b02322"></a>
## b02322 — word/document\.xml/body/\*\[2322\]

```text

```

<a id="b02323"></a>
## b02323 — word/document\.xml/body/\*\[2323\]

```text

```

<a id="b02324"></a>
## b02324 — word/document\.xml/body/\*\[2324\]

```text

```

<a id="b02325"></a>
## b02325 — word/document\.xml/body/\*\[2325\]

```text

```

<a id="b02326"></a>
## b02326 — word/document\.xml/body/\*\[2326\]

```text

```

<a id="b02327"></a>
## b02327 — word/document\.xml/body/\*\[2327\]

```text

```

<a id="b02328"></a>
## b02328 — word/document\.xml/body/\*\[2328\]

```text

```

<a id="b02329"></a>
## b02329 — word/document\.xml/body/\*\[2329\]

```text

```

<a id="b02330"></a>
## b02330 — word/document\.xml/body/\*\[2330\]

```text
APPENDIX A – Configuration Notes
```

<a id="b02331"></a>
## b02331 — word/document\.xml/body/\*\[2331\]

```text
			
```

<a id="b02332"></a>
## b02332 — word/document\.xml/body/\*\[2332\]

```text
	No key configuration change identified to existing workflow.
```

<a id="b02333"></a>
## b02333 — word/document\.xml/body/\*\[2333\]

```text
APPENDIX B – Override Data Wave Steps  
```

<a id="b02334"></a>
## b02334 — word/document\.xml/body/\*\[2334\]

```text

```

<a id="b02335"></a>
## b02335 — word/document\.xml/body/\*\[2335\]

```text
Existing override steps will be evaluated in the build phase for use. 
```

<a id="b02336"></a>
## b02336 — word/document\.xml/body/\*\[2336\]

```text

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

```

<a id="b02340"></a>
## b02340 — word/document\.xml/body/\*\[2340\]

```text

```

<a id="b02341"></a>
## b02341 — word/document\.xml/body/\*\[2341\]

```text

```

<a id="b02342"></a>
## b02342 — word/document\.xml/body/\*\[2342\]

```text

```

<a id="b02343"></a>
## b02343 — word/document\.xml/body/\*\[2343\]

```text

```

<a id="b02344"></a>
## b02344 — word/document\.xml/body/\*\[2344\]

```text

```

<a id="b02345"></a>
## b02345 — word/document\.xml/body/\*\[2345\]

```text

```

<a id="b02346"></a>
## b02346 — word/document\.xml/body/\*\[2346\]

```text

```

<a id="b02347"></a>
## b02347 — word/document\.xml/body/\*\[2347\]

```text

```

<a id="b02348"></a>
## b02348 — word/document\.xml/body/\*\[2348\]

```text

```

<a id="b02349"></a>
## b02349 — word/document\.xml/body/\*\[2349\]

```text

```

<a id="b02350"></a>
## b02350 — word/document\.xml/body/\*\[2350\]

```text

```

<a id="b02351"></a>
## b02351 — word/document\.xml/body/\*\[2351\]

```text

```

<a id="b02352"></a>
## b02352 — word/document\.xml/body/\*\[2352\]

```text

```

<a id="b02353"></a>
## b02353 — word/document\.xml/body/\*\[2353\]

```text

```

<a id="b02354"></a>
## b02354 — word/document\.xml/body/\*\[2354\]

```text

```

<a id="b02355"></a>
## b02355 — word/document\.xml/body/\*\[2355\]

```text

```

<a id="b02356"></a>
## b02356 — word/document\.xml/body/\*\[2356\]

```text

```

<a id="b02357"></a>
## b02357 — word/document\.xml/body/\*\[2357\]

```text

```

<a id="b02358"></a>
## b02358 — word/document\.xml/body/\*\[2358\]

```text

```

<a id="b02359"></a>
## b02359 — word/document\.xml/body/\*\[2359\]

```text

```

<a id="b02360"></a>
## b02360 — word/document\.xml/body/\*\[2360\]

```text

```

<a id="b02361"></a>
## b02361 — word/document\.xml/body/\*\[2361\]

```text

```

<a id="b02362"></a>
## b02362 — word/document\.xml/body/\*\[2362\]

```text

```

<a id="b02363"></a>
## b02363 — word/document\.xml/body/\*\[2363\]

```text

```

<a id="b02364"></a>
## b02364 — word/document\.xml/body/\*\[2364\]

```text

```

<a id="b02365"></a>
## b02365 — word/document\.xml/body/\*\[2365\]

```text

```

<a id="b02366"></a>
## b02366 — word/document\.xml/body/\*\[2366\]

```text

```

<a id="b02367"></a>
## b02367 — word/document\.xml/body/\*\[2367\]

```text

```

<a id="b02368"></a>
## b02368 — word/document\.xml/body/\*\[2368\]

```text

```

<a id="b02369"></a>
## b02369 — word/document\.xml/body/\*\[2369\]

```text

```

<a id="b02370"></a>
## b02370 — word/document\.xml/body/\*\[2370\]

```text

```

<a id="b02371"></a>
## b02371 — word/document\.xml/body/\*\[2371\]

```text

```

<a id="b02372"></a>
## b02372 — word/document\.xml/body/\*\[2372\]

```text

```

<a id="b02373"></a>
## b02373 — word/document\.xml/body/\*\[2373\]

```text

```

<a id="b02374"></a>
## b02374 — word/document\.xml/body/\*\[2374\]

```text

```

<a id="b02375"></a>
## b02375 — word/document\.xml/body/\*\[2375\]

```text

```

<a id="b02376"></a>
## b02376 — word/document\.xml/body/\*\[2376\]

```text

```

<a id="b02377"></a>
## b02377 — word/document\.xml/body/\*\[2377\]

```text
APPENDIX C – Security permissions  
```

<a id="b02378"></a>
## b02378 — word/document\.xml/body/\*\[2378\]

```text

```

<a id="b02379"></a>
## b02379 — word/document\.xml/body/\*\[2379\]

```text
Covetrus can review existing user security records on the Security Permissions Window. When a user attempts to access a SCALE window, the system determines if they have any user-level security records. If an employee has a user-level record, the system will apply that record each time the employee attempts to access the window. User-level security limits a single employee's ability to access and/or perform actions on a specific window. Or the Security Permissions Window can be used to define the security rights of a specific security group. Processing and/or configurations are defined for the security group and what security checkpoints can be used for the group. These are all defined using the Security Permissions Window.
```

<a id="b02380"></a>
## b02380 — word/document\.xml/body/\*\[2380\]

```text
 
```

<a id="b02381"></a>
## b02381 — word/document\.xml/body/\*\[2381\]

```text
Mass security changes are also allowed using this window. The system allows you to select the processing or configuration windows and assigning security to them. All the selected forms (windows) will be assigned the selected security levels and actions. 
```

<a id="b02382"></a>
## b02382 — word/document\.xml/body/\*\[2382\]

```text

```

<a id="b02383"></a>
## b02383 — word/document\.xml/body/\*\[2383\]

```text
This window allows you to grant security permissions by a specific processing function or by a specific configuration.
```

<a id="b02384"></a>
## b02384 — word/document\.xml/body/\*\[2384\]

```text

```

<a id="b02385"></a>
## b02385 — word/document\.xml/body/\*\[2385\]

```text

```

<a id="b02386"></a>
## b02386 — word/document\.xml/body/\*\[2386\]

```text
Figure: Security Permission Configuration window
```

<a id="b02387"></a>
## b02387 — word/document\.xml/body/\*\[2387\]

```text

```

<a id="b02388"></a>
## b02388 — word/document\.xml/body/\*\[2388\]

```text

```

<a id="b02389"></a>
## b02389 — word/document\.xml/body/\*\[2389\]

```text

```

<a id="b02390"></a>
## b02390 — word/document\.xml/body/\*\[2390\]

```text
APPENDIX D – Supplemental DC Ops Data  
```

<a id="b02391"></a>
## b02391 — word/document\.xml/body/\*\[2391\]

```text

```

<a id="b02392"></a>
## b02392 — word/document\.xml/body/\*\[2392\]

```text
N/A
```

<a id="b02393"></a>
## b02393 — word/document\.xml/body/\*\[2393\]

```text

```

<a id="b02394"></a>
## b02394 — word/document\.xml/body/\*\[2394\]

```text

```

<a id="b02395"></a>
## b02395 — word/document\.xml/body/\*\[2395\]

```text

```

<a id="b02396"></a>
## b02396 — word/document\.xml/body/\*\[2396\]

```text

```

<a id="b02397"></a>
## b02397 — word/document\.xml/body/\*\[2397\]

```text

```

<a id="b02398"></a>
## b02398 — word/document\.xml/body/\*\[2398\]

```text

```

<a id="b02399"></a>
## b02399 — word/document\.xml/body/\*\[2399\]

```text

```

<a id="b02400"></a>
## b02400 — word/document\.xml/body/\*\[2400\]

```text

```

<a id="b02401"></a>
## b02401 — word/document\.xml/body/\*\[2401\]

```text

```

<a id="b02402"></a>
## b02402 — word/document\.xml/body/\*\[2402\]

```text

```

<a id="b02403"></a>
## b02403 — word/document\.xml/body/\*\[2403\]

```text

```

<a id="b02404"></a>
## b02404 — word/document\.xml/body/\*\[2404\]

```text

```

<a id="b02405"></a>
## b02405 — word/document\.xml/body/\*\[2405\]

```text

```

<a id="b02406"></a>
## b02406 — word/document\.xml/body/\*\[2406\]

```text

```

<a id="b02407"></a>
## b02407 — word/document\.xml/body/\*\[2407\]

```text

```

<a id="b02408"></a>
## b02408 — word/document\.xml/body/\*\[2408\]

```text

```

<a id="b02409"></a>
## b02409 — word/document\.xml/body/\*\[2409\]

```text

```

<a id="b02410"></a>
## b02410 — word/document\.xml/body/\*\[2410\]

```text

```

<a id="b02411"></a>
## b02411 — word/document\.xml/body/\*\[2411\]

```text

```

<a id="b02412"></a>
## b02412 — word/document\.xml/body/\*\[2412\]

```text

```

<a id="b02413"></a>
## b02413 — word/document\.xml/body/\*\[2413\]

```text

```

<a id="b02414"></a>
## b02414 — word/document\.xml/body/\*\[2414\]

```text

```

<a id="b02415"></a>
## b02415 — word/document\.xml/body/\*\[2415\]

```text

```

<a id="b02416"></a>
## b02416 — word/document\.xml/body/\*\[2416\]

```text

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

```

<a id="b02421"></a>
## b02421 — word/document\.xml/body/\*\[2421\]

```text

```

<a id="b02422"></a>
## b02422 — word/document\.xml/body/\*\[2422\]

```text

```

<a id="b02423"></a>
## b02423 — word/document\.xml/body/\*\[2423\]

```text

```

<a id="b02424"></a>
## b02424 — word/document\.xml/body/\*\[2424\]

```text

```

<a id="b02425"></a>
## b02425 — word/document\.xml/body/\*\[2425\]

```text

```

<a id="b02426"></a>
## b02426 — word/document\.xml/body/\*\[2426\]

```text

```

<a id="b02427"></a>
## b02427 — word/document\.xml/body/\*\[2427\]

```text

```

<a id="b02428"></a>
## b02428 — word/document\.xml/body/\*\[2428\]

```text

```

<a id="b02429"></a>
## b02429 — word/document\.xml/body/\*\[2429\]

```text

```

<a id="b02430"></a>
## b02430 — word/document\.xml/body/\*\[2430\]

```text

```

<a id="b02431"></a>
## b02431 — word/document\.xml/body/\*\[2431\]

```text

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
REVISION HISTORY
```

<a id="b02435"></a>
## b02435 — word/document\.xml/body/\*\[2435\]

```text
			
```

<a id="b02436"></a>
## b02436 — word/document\.xml/body/\*\[2436\]

```text
			Date: 				Changed By: 				Doc. Version:				Notes: 
			7/17/23				Divjyot Kakar				Draft				Draft based on existing functional flow. Extension references based on SOW.
			7/18/23				Divjyot Kakar				1.0				For group review – I/B, Inventory, O/B, and LM
			8/16/23				Divjyot Kakar				1.1				Updated based on group review feedback for all functional areas.
			8/25/23				Divjyot Kakar				1.2				Incorporated feedback based on CRP review
			8/30/23				Divjyot Kakar				1.3				Incorporated final review feedback. Added reference to DSCSA inbound and outbound processing extensions. 
			8/31/23				Divjyot Kakar				1.4				Updated extension reference. Submitted for sign off
```

<a id="b02437"></a>
## b02437 — word/document\.xml/body/\*\[2437\]

```text
		
```

<a id="b02438"></a>
## b02438 — word/document\.xml/body/\*\[2438\]

```text
		
```

<a id="b02439"></a>
## b02439 — word/document\.xml/body/\*\[2439\]

```text

```

<a id="b02440"></a>
## b02440 — word/document\.xml/body/\*\[2440\]

```text

```

<a id="part-endnotes"></a>
## part\-endnotes — word/endnotes\.xml

```text



```

<a id="part-footer1"></a>
## part\-footer1 — word/footer1\.xml

```text


Last Modified: 9/1/2023 1:48:00 AM
Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final).docx




Page 2 of 2

```

<a id="part-footer2"></a>
## part\-footer2 — word/footer2\.xml

```text
Last Modified: 9/1/2023 1:48 AMCovetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final).docxLast Modified: 9/1/2023 1:48 AMCovetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final).docx  Page 2 of 2
Last Modified: 9/1/2023 1:48 AM
Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final).docx
Last Modified: 9/1/2023 1:48 AM
Covetrus - Manhattan Active SCALE Implementation Solution Design Document v1.4  2023-08-31 (Final).docx

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
Covetrus SCALE SDD
```

<a id="part-header3"></a>
## part\-header3 — word/header3\.xml

```text

```

<a id="part-header4"></a>
## part\-header4 — word/header4\.xml

```text

```

<a id="part-header5"></a>
## part\-header5 — word/header5\.xml

```text
			Covetrus SCALE SDD	                                                               
```

<a id="part-header6"></a>
## part\-header6 — word/header6\.xml

```text

```

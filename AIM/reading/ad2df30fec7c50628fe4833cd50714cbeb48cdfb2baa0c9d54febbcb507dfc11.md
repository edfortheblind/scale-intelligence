
        
        <h1 data-source-node="n56"><a name="kanchor1958" data-source-node="n57"></a>Bill of Lading (BOL) Number Field</h1>
        <p class="p_1" data-source-node="n58">This field is a system-assigned incremental 
 number that identifies a shipment's bill of lading. The system computes 
 this number using the following formula:</p>
        <p class="p_1" data-source-node="n59"> </p>
        <p class="p_1" data-source-node="n60">A VICS standard Bill of Lading number has 
 been developed in conjunction with the VICS Bill of Lading form.  The 
 VICS standard Bill of Lading number is based on UCC global standard identification 
 system.  It 
 is a fixed length numeric number and is composed of sixteen digits.  The 
 VICS BOL number structure supports its’ use as a unique shipment identification 
 tag within the total supply chain and as a primary key to corresponding 
 shipment EDI data.   </p>
        <p class="p_1" data-source-node="n61"> </p>
        <p data-source-node="n62">The VICS standard Bill 
 of Lading number is an identification number assigned by the shipper and 
 is a mandatory part of the VICS standard Bill of Lading. </p>
        <p class="p_1" data-source-node="n63"> </p>
        <p class="p_1" data-source-node="n64">Warning: 
  The recommended 
 retention of the VICS BOL number uniqueness is 24 months.</p>
        <p class="p_1" data-source-node="n65"> </p>
        <p class="p_1" data-source-node="n66"> </p>
        <h5 data-source-node="n67">Companies 
 with a EAN/UCC Company Prefix</h5>
        <p class="p_1" data-source-node="n68">The EAN/UCC number format is strongly preferred. 
  It provides 
 a globally unique number for each Bill of Lading that supports the whole 
 supply chain.  With 
 a unique number, no Bill of Lading can be confused with another.  The 
 integrity of each Bill of Lading in a receiving file can be maintained 
 regardless of how many shippers are sending in bills.  This 
 format is structured as follows:</p>
        <ul type="disc" class="ul_1" data-source-node="n69">
            <li class="li_1" data-source-node="n70">EAN/UCC Company prefix 
 (for UCC assigned company prefixes, include the leading 0)<br data-source-node="n71"><br data-source-node="n72"></li>
            <li class="li_1" data-source-node="n73">Serial number (assigned 
 by the shipper and unique for each Bill)<br data-source-node="n74"><br data-source-node="n75"></li>
        </ul>
        <p class="p_1" data-source-node="n76"> </p>
        <p class="p_1" data-source-node="n77">The EAN/UCC Company Prefix is the prefix used 
 in U.P.C. numbers and SSCC-18 numbers.  For 
 example, the Bill of Lading number 06141411234567890 is composed of a 
 seven digit company prefix  (0 
 plus the six digit prefix used in the U.P.C.), followed by a nine digit 
 serial number. </p>
        <p class="p_1" data-source-node="n78"> </p>
        <p class="p_1" data-source-node="n79"> </p>
        <h5 data-source-node="n80">Companies 
 without a EAN/UCC Company Prefix</h5>
        <p data-source-node="n81"> Warning: 
 This number is not guaranteed to be unique and could be replicated by 
 another shipper.</p>
        <p data-source-node="n82"> </p>
        <p data-source-node="n83"> Companies 
 without an EAN/UCC Company Prefix shall use the following format for the 
 17-digit Bill of Lading number.</p>
        <ul type="disc" class="ul_1" data-source-node="n84">
            <li data-source-node="n85">04 (the first two digits must read exactly the 
 number “04”)<br data-source-node="n86"><br data-source-node="n87"></li>
            <li data-source-node="n88">Number assigned by the shipper (fourteen digits)<br data-source-node="n89"><br data-source-node="n90"></li>
        </ul>
        <p data-source-node="n91">An example 
 of the non-standard Bill of Lading number:  04123456789123450</p>
        <p class="p_1" data-source-node="n92"> </p>
        <p class="p_1" data-source-node="n93"> </p>
        <p class="p_1" data-source-node="n94"> </p>
        <p class="p_1" data-source-node="n95"> </p>
        <p class="p_1" data-source-node="n96"> </p>
        <p class="p_1" data-source-node="n97"> </p>
        <p class="p_1" data-source-node="n98"> </p>
        <p class="p_1" data-source-node="n99"> </p>
        <p class="p_1" data-source-node="n100"> </p>
        <p class="p_1" data-source-node="n101"> </p>
    
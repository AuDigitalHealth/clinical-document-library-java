<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/07/2013 4:00:07 PM

                  Product            : Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.2
                  IG Guide Title     : Dispense Item
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Dispense_Record_3A_DispenseItem_8_2_custom-errors"
        id="p-Dispense_Record_3A_DispenseItem_8_2_custom-errors"
        see="#p-Dispense_Record_3A_DispenseItem_8_2_custom-errors">
        
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration">
            
            <assert test="@classCode"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / entry" -
                The 'substanceAdministration' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / entry" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SBADM'"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / entry" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain the value 'SBADM'.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        

        </rule>
  

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:statusCode">


            <assert test="not(@code) or normalize-space(@code) != '' or @code = 'active' or @code = 'completed' "
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / entry" -
                The 'statusCode' tag 'code' attribute shall contain a value. Either the value shall be 'active' or 'Completed'
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

        </rule>



        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:quantity">


            <assert test="(@unit  and @unit != 1) or (/cda:ClinicalDocument//cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode)"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Quantity Dispensed / Quantity Dispensing Unit " -
                The  'quantity' tag '@unit' attribute  or  'ext:formCode' tag is missing.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <report test="(@unit and @unit != 1)  and (/cda:ClinicalDocument//cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode)"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Quantity Dispensed / Quantity Dispensing Unit " -
                The  'quantity' tag '@unit' attribute  or  'ext:formCode' tag shall be present but not both.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
         

        </rule>

 
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@moodCode = 'RQO']">
            
            <assert test="@classCode"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Dispense Item Identifier" -
                The 'supply' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Dispense Item Identifier" -
                The 'supply' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SPLY'"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Dispense Item Identifier" -
                The 'supply' tag 'classCode' attribute shall contain the value 'SPLY'.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
            
            <report test="cda:quantity and (cda:entryRelationship[cda:act/cda:code/@code = '246205007'])"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Quantity Dispensed" -
                Either the 'quantity' tag or 'entryRelationship[act/code/@code = 246205007]' tag shall be present but not both.
                "Quantity Description' shall not co-exist with 'Quantity' and 'Dispensing Unit'.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            
            <report test="(cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (cda:entryRelationship[cda:act/cda:code/@code = '246205007'])"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Quantity Dispensed" -
                Either the 'ext:formCode' tag or 'entryRelationship[act/code/@code = 246205007]' tag shall be present but not both.
                "Quantity Description' shall not co-exist with 'Quantity' and 'Dispensing Unit'.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            
            <assert test="cda:quantity  or (cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) or (cda:entryRelationship[cda:act/cda:code/@code = '246205007'])"
                >Error: Dispense Record - 8.2 Dispense Item -
                "Dispense Item / Quantity Dispensed / Quantity Dispensing Unit " -
                The  'quantity' tag  or  'ext:formCode' tag or 'Quantity Description' is missing.
                Refer to section 8.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            
            

        </rule>

    </pattern>

</schema>

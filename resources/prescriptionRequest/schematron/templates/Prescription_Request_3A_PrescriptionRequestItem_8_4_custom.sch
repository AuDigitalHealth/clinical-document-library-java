<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom-errors"
        id="p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom-errors"
        see="#p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM'][cda:doseQuantity]">

            <report
                test="(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (cda:doseQuantity/@unit) and (cda:doseQuantity/@unit != '1')"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit' attribute
                and 'cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode'
                tag shall not coexist. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report
                test="not(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (cda:doseQuantity/@unit) and (cda:doseQuantity/@unit = '1')"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription
                Request Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit'
                attribute shall have a value. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <!-- Added the following to the SMTool -->
            <!--<assert
                test="not(cda:doseQuantity/@unit) or normalize-space(cda:doseQuantity/@unit) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Dose Unit" - The 'doseQuantity' tag 'unit' attribute shall
                contain a value. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>-->

            <assert
                test="(cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) or (cda:doseQuantity/@unit)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit' attribute or
                'cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                is missing. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="cda:code[@code = '246205007']">

            <assert
                test="(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='246205007']) 
                or 
                (/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship/cda:act/cda:code[@code='246205007'])"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Quantity Description" and/or "Prescription Request Item /
                Quantity to Dispense / Quantity Description" - The path
                (/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='246205007'])
                and/or
                (/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship/cda:act/cda:code[@code='246205007'])"
                - 1 or more tags are missing. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[cda:quantity]">

            <report
                test="(cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (cda:quantity/@unit) and (cda:quantity/@unit != '1')"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute and
                'cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                shall not coexist. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>            
            
            <report
                test="not(cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (cda:quantity/@unit) and (cda:quantity/@unit = '1')"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute shall have a value. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>
            
            <!-- Added the following to the SMTool -->
            <!--<assert test="not(cda:quantity/@unit) or normalize-space(cda:quantity/@unit) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Dispensing Unit" - The 'quantity' tag 'unit' attribute
                shall contain a value. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>-->

            <assert
                test="(cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) or (cda:quantity/@unit)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute or
                'cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag is
                missing. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom2-errors"
        id="p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom2-errors"
        see="#p-Prescription_Request_3A_PrescriptionRequestItem_8_4_custom2-errors">
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <report
                test="not(cda:doseQuantity) and (cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Dose Unit" - The
                'cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                shall not exist without 'cda:doseQuantity' tag. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <!--<report
                test="(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) and (cda:doseQuantity)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Structured Dose / Quantity" and "Prescription Request Item / Structured Dose
                / Quantity Description" - The 'cda:doseQuantity' tag and
                'cda:entryRelationship[cda:act/cda:code/@code = '246205007']' section shall not
                coexist. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>-->
            <!-- Page 164 of the IG states that It is expected ..... but as it does not says 'SHALL' so commented -->
            

        </rule>   
                    
            


        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply">

            <report
                test="(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) and (cda:quantity)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Quantity" and "Prescription Request Item / Quantity to
                Dispense / Quantity Description" - The 'cda:quantity' tag and
                'cda:entryRelationship[cda:act/cda:code/@code = '246205007']' section shall not
                coexist. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report
                test="not(cda:quantity) and (cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode)"
                >Error: Prescription Request - 8.4 Prescription Request Item - "Prescription Request
                Item / Quantity to Dispense / Dispensing Unit" - The
                'cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                shall not exist without 'cda:quantity' tag. Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_Global_Code_Checks_custom-errors"
        id="p-PCEHR_Prescription_Record_Global_Code_Checks_custom-errors"
        see="#p-PCEHR_Prescription_Record_Global_Code_Checks_custom-errors">


        <!--ClinicalDocument/code/@code="100.16764"
            ClinicalDocument/code/@displayName="PCEHR Prescription Record"-->


        <rule context="/cda:ClinicalDocument[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PCEHR PRESCRIPTION RECORD') 
            or (@code = '100.16764')]]">

            <assert test="cda:code[@code = '100.16764']">Error: PCEHR Prescription Record - Global Code Checks -
                The 'code' tag 'code' attribute shall be '100.16764'. Refer to section 5.1
                ClincialDocument of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PCEHR PRESCRIPTION RECORD')]"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PCEHR Prescription Record'. Refer to section 5.1 ClincialDocument of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>
</schema>

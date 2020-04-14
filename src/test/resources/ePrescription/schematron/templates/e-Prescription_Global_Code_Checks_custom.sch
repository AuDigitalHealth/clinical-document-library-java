<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


   <!-- Status: Last Reviewed: 
         Status: Last Updated : 09/07/2013 -->

    <pattern name="p-e-Prescription_Global_Code_Checks_custom-errors"
        id="p-e-Prescription_Global_Code_Checks_custom-errors"
        see="#p-e-Prescription_Global_Code_Checks_custom-errors">


       
        <rule context="/cda:ClinicalDocument[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION DOCUMENT') 
            or (@code = '64287-6')]]">

            <assert test="cda:code[@code = '64287-6']">Error: e-Prescription - Global Code Checks -
                The 'code' tag 'code' attribute shall be 64287-6'. Refer to section "6.2 Clinical
                Document" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION DOCUMENT')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescription Document'. Refer to section 6.2 ClincialDocument of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            

        </rule>

    </pattern>
</schema>

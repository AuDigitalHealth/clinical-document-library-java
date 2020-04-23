<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <pattern name="p-e-Referral_Global_Code_Checks_custom-errors" id="p-e-Referral_Global_Code_Checks_custom-errors"
        see="#p-e-Referral_Global_Code_Checks_custom-errors">

        <!-- /cda:ClinicalDocument/cda:code/@code="57133-1"     5.1 ClinicalDocument -->
        <!-- /cda:ClinicalDocument/cda:code/@code="57133-1"     6.1 e-Referral -->

        <rule context="/cda:ClinicalDocument/cda:code[@displayName ='Referral note']">
            
            <assert test="@code='57133-1'">Error: e-Referral - Global Code Checks - The 'code' tag 'code' 
                attribute shall be '57133-1'. Refer to section '5.1 ClinicalDocument' or '6.1 e-Referral' of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>

    </pattern>

</schema>

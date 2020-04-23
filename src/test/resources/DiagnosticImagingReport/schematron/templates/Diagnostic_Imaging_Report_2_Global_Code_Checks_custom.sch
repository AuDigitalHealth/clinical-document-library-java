<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Diagnostic Imaging Report Clinical Document:  Global Code Checks -->

    <!-- Context: ClinicalDocument -->



    <pattern name="p-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom-errors"
        id="p-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom-errors"
        see="#p-Diagnostic_Imaging_Report_2_Global_Code_Checks_custom-errors">

        <!-- CDA:CODE content -->

        <!--  7.1.1 :: DIAGNOSTIC IMAGING -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='DIAGNOSTIC IMAGING']">

            <assert test="@code = '101.16945'"> Error: Diagnostic Imaging Report - 7.1.1. Diagnostic
                Imaging / Section Type - The 'code' tag 'code' attribute shall be '101.16945'. Refer
                to section '7.1.1. Diagnostic Imaging' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!--  7.1.1.1 :: IMAGING EXAMINATION RESULT -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section/cda:code[@displayName ='Imaging Examination Result']">

            <assert test="@code = '102.16145'"> Error: Diagnostic Imaging Report - 7.1.1.1. IMAGING
                EXAMINATION RESULT / Detailed Clinical Model Identifier - The 'code' tag 'code'
                attribute shall be '102.16145'. Refer to section '7.1.1.1. IMAGING EXAMINATION
                RESULT' of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Diagnostic Imaging Report Clinical Document:  Global Code Checks -->

    <!-- Context: ClinicalDocument -->

    <pattern name="p-Diagnostic_Imaging_Report_Global_Code_Checks_custom-errors"
        id="p-Diagnostic_Imaging_Report_Global_Code_Checks_custom-errors"
        see="#p-Diagnostic_Imaging_Report_Global_Code_Checks_custom-errors">

        <!-- CDA:CODE content -->

        <!--  5.1 :: ClinicalDocument -->

        <rule context="/cda:ClinicalDocument/cda:code[@displayName ='Diagnostic Imaging Report']">

            <assert test="@code = '100.16957'"> Error: Diagnostic Imaging Report - 5.1.
                ClinicalDocument / code - The 'code' tag 'code' attribute shall be '100.16957'.
                Refer to section '5.1. ClinicalDocument' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--  4 :: Administrative Observations -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@displayName ='Administrative Observations']">

            <assert test="@code = '102.16080'"> Error: Diagnostic Imaging Report - 4 Administrative
                Observations / code - The 'code' tag 'code' attribute shall be '102.16080'. Refer to
                section '4. Administrative Observations' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!--   4 Administrative Observations and 7.1.1DIAGNOSTIC IMAGING  -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[not(cda:entry/cda:observationMedia/@ID = 'LOGO')]">

            <assert test="cda:code[@code]"> Error: Diagnostic Imaging Report - 4 Administrative Observations
                and/or 7.1.1 DIAGNOSTIC IMAGING / Section Type - The 'code'
                tag with 'code' attribute is missing. Refer to section 4 Administrative
                Observations and section 7.1.1 DIAGNOSTIC IMAGING of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>

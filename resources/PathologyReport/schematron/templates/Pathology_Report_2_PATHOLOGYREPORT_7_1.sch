<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 4/03/2015 9:33:28 AM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1
                  IG Guide Title     : PATHOLOGY REPORT
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_2_PATHOLOGYREPORT_7_1-errors"
        id="p-Pathology_Report_2_PATHOLOGYREPORT_7_1-errors"
        see="#p-Pathology_Report_2_PATHOLOGYREPORT_7_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: Pathology Report - 7.1 PATHOLOGY REPORT -
                "Pathology Result Report (Body)" -
                The 'component' tag is missing.
                Refer to section 7.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:component) > 1"
                >Error: Pathology Report - 7.1 PATHOLOGY REPORT -
                "Pathology Result Report (Body)" -
                The 'component' tag shall appear only once.
                Refer to section 7.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: Pathology Report - 7.1 PATHOLOGY REPORT -
                "Pathology Result Report (Body)" -
                The 'structuredBody' tag is missing.
                Refer to section 7.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: Pathology Report - 7.1 PATHOLOGY REPORT -
                "Pathology Result Report (Body)" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 7.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

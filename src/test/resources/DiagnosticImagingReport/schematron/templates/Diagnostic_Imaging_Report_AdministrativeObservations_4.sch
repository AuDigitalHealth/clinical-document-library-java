<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 14/04/2015 11:53:38 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 4
                  IG Guide Title     : Administrative Observations
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_AdministrativeObservations_4-errors"
        id="p-Diagnostic_Imaging_Report_AdministrativeObservations_4-errors"
        see="#p-Diagnostic_Imaging_Report_AdministrativeObservations_4-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <report test="count(cda:component[cda:section/cda:code/@code = '102.16080']) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'component' tag shall appear only once for 'Administrative Observations'.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '102.16080']">

            <report test="count(cda:section) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'section' tag shall appear only once.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']">

            <report test="count(cda:id) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations / id" -
                The 'id' tag shall appear only once.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'code' tag shall appear only once.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:title) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'title' tag shall appear only once.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="cda:text and not(cda:title)"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'title' tag is missing for the existence of 'text'.
                Refer to section 4 of the 
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="cda:title and normalize-space(cda:title) = ''"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'title' tag shall contain a value.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                cda:title and normalize-space(cda:title) != '' and
                cda:title != 'Administrative Observations'"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'title' tag shall contain the value 'Administrative Observations'.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'text' tag shall appear only once.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="cda:text and normalize-space(cda:text) = ''"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'text' tag shall contain a value.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '102.16080']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16080']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code='102.16080'])"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The '/ClinicalDocument/component/structuredBody/component/section/code[@code = '102.16080']' path -
                1 or more tags are missing.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Administrative Observations'"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'code' tag 'displayName' attribute shall contain the value 'Administrative Observations'.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Diagnostic Imaging Report - 4 Administrative Observations -
                "Administrative Observations" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


    </pattern>

</schema>

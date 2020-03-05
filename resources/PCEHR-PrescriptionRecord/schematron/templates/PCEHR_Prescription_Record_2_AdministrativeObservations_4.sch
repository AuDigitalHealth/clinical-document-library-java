<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:09 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 4
                  IG Guide Title     : Administrative Observations 
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_2_AdministrativeObservations_4-errors"
        id="p-PCEHR_Prescription_Record_2_AdministrativeObservations_4-errors"
        see="#p-PCEHR_Prescription_Record_2_AdministrativeObservations_4-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']">

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'id' tag shall appear only once.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag shall appear only once.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:title) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'title' tag shall appear only once.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:title) or normalize-space(cda:title) != ''"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'title' tag shall contain a value.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(cda:title) or normalize-space(cda:title) = '' or
                translate(cda:title, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS'"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'title' tag shall contain the value 'Administrative Observations'.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="cda:text and not(cda:title)"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'title' tag is missing for the existence of 'text'.
                Refer to section 4 of the 
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'text' tag shall appear only once.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'text' tag shall contain a value.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <report test="count(cda:component[cda:section/cda:code/@code = '102.16080']) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'component' tag shall appear only once for 'Administrative Observations '.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '102.16080']">

            <report test="count(cda:section) > 1"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'section' tag shall appear only once.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:code[@code = '102.16080']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16080']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code = '102.16080'])"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The '/ClinicalDocument/component/structuredBody/component/section/code[@code = '102.16080']' path -
                1 or more tags are missing.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@codeSystemName"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;NCTIS DATA COMPONENTS&quot;"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = &quot;ADMINISTRATIVE OBSERVATIONS&quot;"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'displayName' attribute shall contain the value 'Administrative Observations'.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record - 4 Administrative Observations  -
                "Administrative Observations " -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 4 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

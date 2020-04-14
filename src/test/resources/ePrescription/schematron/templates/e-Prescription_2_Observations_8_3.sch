<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/08/2013 2:04:01 PM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.3
                  IG Guide Title     : Observations
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_2_Observations_8_3-errors"
        id="p-e-Prescription_2_Observations_8_3-errors"
        see="#p-e-Prescription_2_Observations_8_3-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <report test="count(cda:component[cda:section/cda:code/@code = '101.16280']) > 1"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'component' tag shall appear only once for 'Observations'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '101.16280']">

            <report test="count(cda:section) > 1"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'section' tag shall appear only once.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']">

            <report test="count(cda:code) > 1"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag shall appear only once.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:title"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'title' tag is missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:title) > 1"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'title' tag shall appear only once.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="not(cda:title) or normalize-space(cda:title) != ''"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'title' tag shall contain a value.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(cda:title) or normalize-space(cda:title) = '' or
                cda:title = 'Observations'"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'title' tag shall contain the value 'Observations'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:text"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'text' tag is missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'text' tag shall appear only once.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'text' tag shall contain a value.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="cda:code[@code = '101.16280']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '101.16280']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code='101.16280'])"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The '/ClinicalDocument/component/structuredBody/component/section/code[@code = '101.16280']' path -
                1 or more tags are missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystem"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystemName"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@displayName"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Observations'"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'code' tag 'displayName' attribute shall contain the value 'Observations'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Prescription - 8.3 Observations -
                "Observations" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>

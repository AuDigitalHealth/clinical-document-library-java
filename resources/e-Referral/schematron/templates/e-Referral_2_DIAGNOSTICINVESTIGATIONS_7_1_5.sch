<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 1/06/2015 3:22:27 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5
                  IG Guide Title     : DIAGNOSTIC INVESTIGATIONS
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5-errors"
        id="p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5-errors"
        see="#p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <report test="count(cda:component[cda:section/cda:code/@code = '101.20117']) > 1"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'component' tag shall appear only once for 'Diagnostic Investigations'.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '101.20117']">

            <report test="count(cda:section) > 1"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'section' tag shall appear only once.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']">

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:title"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'title' tag is missing.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:title) > 1"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'title' tag shall appear only once.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(cda:title) or normalize-space(cda:title) != ''"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'title' tag shall contain a value.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(cda:title) or normalize-space(cda:title) = '' or
                cda:title = 'Diagnostic Investigations'"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'title' tag shall contain the value 'Diagnostic Investigations'.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="cda:code[@code = '101.20117']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '101.20117']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code = '101.20117'])"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The '/ClinicalDocument/component/structuredBody/component/section/code[@code = '101.20117']' path -
                1 or more tags are missing.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Diagnostic Investigations'"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'code' tag 'displayName' attribute shall contain the value 'Diagnostic Investigations'.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5 DIAGNOSTIC INVESTIGATIONS -
                "Diagnostic Investigations" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


    </pattern>

</schema>

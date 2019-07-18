<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 13/02/2015 3:47:13 PM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1
                  IG Guide Title     : ADVERSE REACTIONS
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1-errors"
        id="p-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1-errors"
        see="#p-Shared_Health_Summary_2_ADVERSEREACTIONS_7_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <assert test="cda:component[cda:section/cda:code/@code = '101.20113']"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'component' tag is missing for 'ADVERSE REACTIONS'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:component[cda:section/cda:code/@code = '101.20113']) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'component' tag shall appear only once for 'ADVERSE REACTIONS'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '101.20113']">

            <report test="count(cda:section[cda:code/@code = '101.20113']) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'section' tag shall appear only once for 'ADVERSE REACTIONS'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']">

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Adverse Reactions Instance Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:title"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'title' tag is missing.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:title) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'title' tag shall appear only once.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:title) or normalize-space(cda:title) != ''"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'title' tag shall contain a value.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(cda:title) or normalize-space(cda:title) = '' or
                cda:title = 'Adverse Reactions'"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'title' tag shall contain the value 'Adverse Reactions'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:text"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'text' tag is missing.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:text) > 1"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:id">

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
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Adverse Reactions Instance Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code = '101.20113']">

            <assert test="@codeSystem"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@displayName"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Adverse Reactions'"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'code' tag 'displayName' attribute shall contain the value 'Adverse Reactions'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(cda:translation)"
                >Error: Shared Health Summary - 7.1.1 ADVERSE REACTIONS -
                "ADVERSE REACTIONS / Section Type" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


    </pattern>

</schema>

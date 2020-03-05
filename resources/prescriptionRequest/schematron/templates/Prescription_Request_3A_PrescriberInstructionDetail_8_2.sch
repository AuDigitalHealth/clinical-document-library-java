<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 03-10-2013 18:40:35

                  Product            : Prescription Request
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.2
                  IG Guide Title     : Prescriber Instruction Detail
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_3A_PrescriberInstructionDetail_8_2-errors"
        id="p-Prescription_Request_3A_PrescriberInstructionDetail_8_2-errors"
        see="#p-Prescription_Request_3A_PrescriberInstructionDetail_8_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']">

            <assert test="cda:entry[cda:substanceAdministration/@classCode = 'SBADM']"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'entry' tag is missing for ' Prescriber Instruction Recipient'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:entry) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'entry' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'entry' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'DRIV'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'entry' tag 'typeCode' attribute shall contain the value 'DRIV'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:substanceAdministration) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:statusCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'statusCode' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:statusCode) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'statusCode' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:effectiveTime"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / DateTime Prescriber Instruction Received" -
                The 'effectiveTime' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / DateTime Prescriber Instruction Received" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'text' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'text' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'text' tag shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:consumable"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'consumable' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'consumable' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '103.16295']"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'entryRelationship' tag is missing for ' Prescriber Instruction Source'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16295']) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'entryRelationship' tag shall appear only once for ' Prescriber Instruction Source'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '103.16297']"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'entryRelationship' tag is missing for ' Prescriber Instruction Communication Medium'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16297']) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'entryRelationship' tag shall appear only once for ' Prescriber Instruction Communication Medium'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:statusCode">

            <assert test="@code"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'statusCode' tag 'code' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'statusCode' tag 'code' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'new'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Recipient" -
                The 'statusCode' tag 'code' attribute shall contain the value 'new'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <assert test="cda:manufacturedProduct"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <assert test="cda:manufacturedMaterial"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16295']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16295']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:id"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'id' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'id' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:value"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'value' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:value) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'value' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16295']/cda:id">

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
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16295']">

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Prescriber Instruction Source'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'code' tag 'displayName' attribute shall contain the value 'Prescriber Instruction Source'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16295']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Source" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16297']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16297']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:id"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'id' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'id' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:value"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'value' tag is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:value) > 1"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'value' tag shall appear only once.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16297']/cda:id">

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
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16297']">

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Prescriber Instruction Communication Medium'"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'code' tag 'displayName' attribute shall contain the value 'Prescriber Instruction Communication Medium'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16297']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.2 Prescriber Instruction Detail -
                "Prescriber Instruction Detail / Prescriber Instruction Communication Medium" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/08/2013 2:03:30 PM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.2
                  IG Guide Title     : ClinicalDocument
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_ClinicalDocument_6_2-errors"
        id="p-e-Prescription_ClinicalDocument_6_2-errors"
        see="#p-e-Prescription_ClinicalDocument_6_2-errors">


        <rule context="/">

            <assert test="cda:ClinicalDocument"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument" -
                The 'ClinicalDocument' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:ClinicalDocument) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument" -
                The 'ClinicalDocument' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:typeId"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:typeId) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:templateId"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/templateId" -
                The 'templateId' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/id" -
                The 'id' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:id"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/id" -
                The 'id' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:code"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:effectiveTime"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/effectiveTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/effectiveTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:confidentialityCode"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/confidentialityCode" -
                The 'confidentialityCode' tag is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:confidentialityCode) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/confidentialityCode" -
                The 'confidentialityCode' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="count(cda:languageCode) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/languageCode" -
                The 'languageCode' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="count(cda:setId) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/setId" -
                The 'setId' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <report test="count(cda:versionNumber) > 1"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/versionNumber" -
                The 'versionNumber' tag shall appear only once.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:typeId">

            <assert test="@root"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'root' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'root' attribute shall contain a value.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@root) or normalize-space(@root) = '' or @root = '2.16.840.1.113883.1.3'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'root' attribute shall contain the value '2.16.840.1.113883.1.3'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@extension"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'extension' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@extension) or normalize-space(@extension) != ''"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'extension' attribute shall contain a value.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@extension) or normalize-space(@extension) = '' or @extension = 'POCD_HD000040'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/typeId" -
                The 'typeId' tag 'extension' attribute shall contain the value 'POCD_HD000040'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:code">

            <assert test="@code"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = '64287-6'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'code' attribute shall contain the value '64287-6'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystem"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.1'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.1'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystemName"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'LOINC'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'LOINC'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@displayName"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Prescription Document'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/code" -
                The 'code' tag 'displayName' attribute shall contain the value 'Prescription Document'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:confidentialityCode">

            <assert test="@nullFlavor"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/confidentialityCode" -
                The 'confidentialityCode' tag 'nullFlavor' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@nullFlavor) or normalize-space(@nullFlavor) != ''"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/confidentialityCode" -
                The 'confidentialityCode' tag 'nullFlavor' attribute shall contain a value.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@nullFlavor) or normalize-space(@nullFlavor) = '' or @nullFlavor = 'NA'"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/confidentialityCode" -
                The 'confidentialityCode' tag 'nullFlavor' attribute shall contain the value 'NA'.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:languageCode">

            <assert test="@code"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/languageCode" -
                The 'languageCode' tag 'code' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/languageCode" -
                The 'languageCode' tag 'code' attribute shall contain a value.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:setId">

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
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/setId" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:versionNumber">

            <assert test="@value"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/versionNumber" -
                The 'versionNumber' tag 'value' attribute is missing.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: e-Prescription - 6.2 ClinicalDocument -
                "ClinicalDocument/versionNumber" -
                The 'versionNumber' tag 'value' attribute shall contain a value.
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>

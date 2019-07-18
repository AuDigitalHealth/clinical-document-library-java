<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:16 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 5.1.4
                  IG Guide Title     : ParentDocument
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_ParentDocument_5_1_4-errors"
        id="p-PCEHR_Dispense_Record_ParentDocument_5_1_4-errors"
        see="#p-PCEHR_Dispense_Record_ParentDocument_5_1_4-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:relatedDocument"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument">

            <assert test="@typeCode"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag 'typeCode' attribute is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag 'typeCode' attribute shall contain a value.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="cda:parentDocument"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'parentDocument' tag is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:parentDocument) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'parentDocument' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument/cda:parentDocument">

            <assert test="cda:id"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/id" -
                The 'id' tag is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/id" -
                The 'id' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:code) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/code" -
                The 'code' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:text) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/text" -
                The 'text' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:setId) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/setId" -
                The 'setId' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:versionNumber) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/versionNumber" -
                The 'versionNumber' tag shall appear only once.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument/cda:parentDocument/cda:id">

            <assert test="@root"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/id" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/id" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument/cda:parentDocument/cda:text">

            <assert test="@nullFlavor"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/text" -
                The 'text' tag 'nullFlavor' attribute is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="
                @nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'NA'"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/text" -
                The 'text' tag 'nullFlavor' attribute shall contain the value 'NA'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument/cda:parentDocument/cda:setId">

            <assert test="@root"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/setId" -
                The 'setId' tag 'root' attribute is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@root and normalize-space(@root) = ''"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/setId" -
                The 'setId' tag 'root' attribute shall contain a value.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/setId" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument/cda:parentDocument/cda:versionNumber">

            <assert test="@value"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument/parentDocument/versionNumber" -
                The 'versionNumber' tag 'value' attribute is missing.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

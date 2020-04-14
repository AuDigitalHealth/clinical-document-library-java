<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 1/06/2015 3:19:52 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.2.3
                  IG Guide Title     : OTHER MEDICAL HISTORY ITEM
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_OTHERMEDICALHISTORYITEM_7_1_2_3-errors"
        id="p-e-Referral_3A_OTHERMEDICALHISTORYITEM_7_1_2_3-errors"
        see="#p-e-Referral_3A_OTHERMEDICALHISTORYITEM_7_1_2_3-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry[cda:act/cda:code/@code = '102.16627']">

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:act[cda:code/@code = '102.16627']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Time Interval" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16630']) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'entryRelationship' tag shall appear only once for ' Medical History Item Comment'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '102.16627']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '102.16627']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:act/cda:code[@code='102.16627'])"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/act/code[@code = '102.16627']' path -
                1 or more tags are missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Other Medical History Item'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'code' tag 'displayName' attribute shall contain the value 'Other Medical History Item'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:act[cda:code/@code = '102.16627']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Description" -
                The 'text' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:act[cda:code/@code = '102.16627']/cda:entryRelationship[cda:act/cda:code/@code = '103.16630']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:act[cda:code/@code = '102.16627']/cda:entryRelationship/cda:act[cda:code/@code = '103.16630']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'text' tag is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'text' tag shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="cda:code[@code = '103.16630']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16630']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:act[cda:code/@code='102.16627']/cda:entryRelationship/cda:act/cda:code[@code='103.16630'])"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16117']/entry/act[code/@code = '102.16627']/entryRelationship/act/code[@code = '103.16630']' path -
                1 or more tags are missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Medical History Item Comment'"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'code' tag 'displayName' attribute shall contain the value 'Medical History Item Comment'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:act[cda:code/@code = '102.16627']/cda:entryRelationship/cda:act[cda:code/@code = '103.16630']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.2.3 OTHER MEDICAL HISTORY ITEM -
                "Other Medical History Item / Medical History Item Comment" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.2.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>

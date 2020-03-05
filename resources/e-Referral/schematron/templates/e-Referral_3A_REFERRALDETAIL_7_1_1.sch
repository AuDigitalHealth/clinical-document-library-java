<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 1/06/2015 3:19:00 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1
                  IG Guide Title     : REFERRAL DETAIL
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_REFERRALDETAIL_7_1_1-errors"
        id="p-e-Referral_3A_REFERRALDETAIL_7_1_1-errors"
        see="#p-e-Referral_3A_REFERRALDETAIL_7_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']">

            <assert test="cda:entry[cda:observation/cda:code/@code = '103.16620']"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'entry' tag is missing for ' Referral DateTime'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16620']) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'entry' tag shall appear only once for ' Referral DateTime'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entry[cda:observation/cda:code/@code = '42349-1']"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'entry' tag is missing for ' Referral Reason'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '42349-1']) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'entry' tag shall appear only once for ' Referral Reason'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entry[cda:observation/cda:code/@code = '103.16622']"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'entry' tag is missing for ' Referral Validity Duration'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:observation/cda:code/@code = '103.16622']) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'entry' tag shall appear only once for ' Referral Validity Duration'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry[cda:observation/cda:code/@code = '103.16620']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '103.16620']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'value' tag is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation/cda:code[@code = '103.16620']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Referral DateTime'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag 'displayName' attribute shall contain the value 'Referral DateTime'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '103.16620']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'TS' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'TS')"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'TS'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral DateTime" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry[cda:observation/cda:code/@code = '42349-1']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '42349-1']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'value' tag is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation/cda:code[@code = '42349-1']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.1'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.1'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Reason for referral'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag 'displayName' attribute shall contain the value 'Reason for referral'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '42349-1']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Reason" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry[cda:observation/cda:code/@code = '103.16622']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '103.16622']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'value' tag is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation/cda:code[@code = '103.16622']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Referral Validity Duration'"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag 'displayName' attribute shall contain the value 'Referral Validity Duration'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16347']/cda:entry/cda:observation[cda:code/@code = '103.16622']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'IVL_TS' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS')"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'IVL_TS'.
                Refer to section 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.1 REFERRAL DETAIL -
                "Referral Detail / Referral Validity Duration" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>

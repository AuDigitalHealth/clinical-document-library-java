<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 9:59:38 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.1.2
                  IG Guide Title     : PATHOLOGY TEST RESULT GROUP
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2-errors"
        id="p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2-errors"
        see="#p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:organizer/@classCode = 'BATTERY']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:organizer) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'id' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:statusCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'statusCode' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:statusCode) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'statusCode' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Pathology Test Result Group Name" -
                The 'code' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Pathology Test Result Group Name" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:component[(cda:observation/@classCode = 'OBS') and (cda:observation/cda:code/@code != '102.16156.2.2.2')]"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'component' tag is missing for ' Individual Pathology Test Result'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:id">

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
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:statusCode">

            <assert test="@code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'statusCode' tag 'code' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'statusCode' tag 'code' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'completed'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'statusCode' tag 'code' attribute shall contain the value 'completed'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component">

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'id' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Name" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:interpretationCode) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '281298000']) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'entryRelationship' tag shall appear only once for ' Individual Pathology Test Reference Range Guidance'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '308552006']"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag is missing for ' Individual Pathology Test Result Status'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '308552006']) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag shall appear only once for ' Individual Pathology Test Result Status'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:id">

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
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Name" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:interpretationCode">

            <assert test="@code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'code' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'code' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'HL7_ObservationInterpretationNormality']/code[(@code = current()/@code)]"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'code' attribute shall be as per 10.19 HL7 V3: ObservationInterpretationNormality.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.5.83'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.5.83'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'HL7_ObservationInterpretationNormality']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'interpretationCode' tag 'code' and 'displayName' attributes shall match as per 10.19 HL7 V3: ObservationInterpretationNormality.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Normal Status" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:referenceRange">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'referenceRange' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'referenceRange' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFV'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'referenceRange' tag 'typeCode' attribute shall contain the value 'REFV'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observationRange) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:observationRange"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:referenceRange/cda:observationRange">

            <report test="@classCode and normalize-space(@classCode) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @classCode and normalize-space(@classCode) != '' and @classCode != 'OBS'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN.CRT'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value Reference Range Details" -
                The 'observationRange' tag 'moodCode' attribute shall contain the value 'EVN.CRT'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range" -
                The 'code' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range Meaning" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range Meaning" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:referenceRange/cda:observationRange/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:referenceRange/cda:observationRange/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range Meaning" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'IVL_PQ' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'IVL_PQ')"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range Meaning" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'IVL_PQ'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Result Value Reference Range Details /Individual Pathology Test Result Value Reference Range Meaning" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship[cda:act/cda:code/@code = '281296001']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:act[cda:code/@code = '281296001']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'text' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:act/cda:code[@code = '281296001']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystemVersion"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'codeSystemVersion' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystemVersion) or normalize-space(@codeSystemVersion) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystemVersion) or normalize-space(@codeSystemVersion) = '' or @codeSystemVersion = '20110531'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'codeSystemVersion' attribute shall contain the value '20110531'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'result comments'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'code' tag 'displayName' attribute shall contain the value 'result comments'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:act[cda:code/@code = '281296001']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship[cda:act/cda:code/@code = '281298000']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:act[cda:code/@code = '281298000']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'text' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '281298000']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '281298000']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code!='102.16156.2.2.2')]/cda:entryRelationship/cda:act/cda:code[@code='281298000'])"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/organizer[@classCode = 'BATTERY']/component/observation[(@classCode = 'OBS') and (code/@code != '102.16156.2.2.2')]/entryRelationship/act/code[@code = '281298000']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystemVersion"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'codeSystemVersion' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystemVersion) or normalize-space(@codeSystemVersion) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystemVersion) or normalize-space(@codeSystemVersion) = '' or @codeSystemVersion = '20110531'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'codeSystemVersion' attribute shall contain the value '20110531'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'reference range comments'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'code' tag 'displayName' attribute shall contain the value 'reference range comments'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:act[cda:code/@code = '281298000']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Reference Range Guidance" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship[cda:observation/cda:code/@code = '308552006']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:observation/cda:code[@code = '308552006']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystemVersion"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'codeSystemVersion' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystemVersion) or normalize-space(@codeSystemVersion) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystemVersion) or normalize-space(@codeSystemVersion) = '' or @codeSystemVersion = '20110531'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'codeSystemVersion' attribute shall contain the value '20110531'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'report status'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'displayName' attribute shall contain the value 'report status'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[(@code = current()/@code)]"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'code' attribute shall be as per 10.18 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16501'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16501'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per 10.18 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>

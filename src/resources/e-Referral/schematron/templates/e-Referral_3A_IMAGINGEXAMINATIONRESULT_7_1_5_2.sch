<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2/06/2015 10:00:12 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.2
                  IG Guide Title     : IMAGING EXAMINATION RESULT
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_5_2-errors"
        id="p-e-Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_5_2-errors"
        see="#p-e-Referral_3A_IMAGINGEXAMINATIONRESULT_7_1_5_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']">

            <assert test="cda:entry[cda:observation/@classCode = 'OBS']"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'entry' tag is missing for ' Imaging Examination Result Name'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entry[cda:observation/@classCode = 'OBS']) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'entry' tag shall appear only once for ' Imaging Examination Result Name'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry[cda:observation/@classCode = 'OBS']">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'entry' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'code' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:methodCode) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Modality" -
                The 'methodCode' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:targetSiteCode) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Specific Location / Anatomical Location Name" -
                The 'targetSiteCode' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '308552006']"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag is missing for ' Imaging Examination Result Status'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '308552006']) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag shall appear only once for ' Imaging Examination Result Status'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '55752-0']) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'entryRelationship' tag shall appear only once for ' Clinical Information Provided'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16503']) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'entryRelationship' tag shall appear only once for ' Findings'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Examination Result Representation" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag is missing for ' Imaging Examination Result DateTime'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag shall appear only once for ' Imaging Examination Result DateTime'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:id">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'id' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Name" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observationMedia/@classCode = 'OBS']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observationMedia) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']">

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'observationMedia' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'value' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observationMedia[@classCode = 'OBS']/cda:id">

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
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Anatomical Site / Anatomical Location Image" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '308552006']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '308552006']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystemVersion"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'codeSystemVersion' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystemVersion) or normalize-space(@codeSystemVersion) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystemVersion) or normalize-space(@codeSystemVersion) = '' or @codeSystemVersion = '20110531'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'codeSystemVersion' attribute shall contain the value '20110531'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'report status'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'displayName' attribute shall contain the value 'report status'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="@code"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'code' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'code' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[(@code = current()/@code)]"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'code' attribute shall be as per 10.18 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101.104.16501'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101.104.16501'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'displayName' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) != '' and
                @displayName and normalize-space(@displayName) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system [@codeSystemName = 'NCTIS_Admin_Codes_Result_Status']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'code' and 'displayName' attributes shall match as per 10.18 NCTIS: Admin Codes - Result Status.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result Status" -
                The 'value' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:act/cda:code/@code = '55752-0']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:act) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '55752-0']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'text' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act/cda:code[@code = '55752-0']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.1'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.1'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Clinical information'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'code' tag 'displayName' attribute shall contain the value 'Clinical information'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '55752-0']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Clinical Information Provided" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16503']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'REFR'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'REFR'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16503']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:text"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'text' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'text' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16503']/cda:id">

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
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:code[@code = '103.16503']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16503']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation/cda:code[@code='103.16503'])"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/observation/code[@code = '103.16503']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Findings'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'code' tag 'displayName' attribute shall contain the value 'Findings'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16503']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Findings" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16589']">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'entryRelationship' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:observation) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16589']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@moodCode"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'observation' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:effectiveTime"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16589']">

            <assert test="@codeSystem"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@displayName"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Imaging Examination Result DateTime'"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag 'displayName' attribute shall contain the value 'Imaging Examination Result DateTime'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16589']/cda:effectiveTime">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 7.1.5.2 IMAGING EXAMINATION RESULT -
                "Imaging Examination Result / Imaging Examination Result DateTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall not be present.
                Refer to 7.1.5.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>

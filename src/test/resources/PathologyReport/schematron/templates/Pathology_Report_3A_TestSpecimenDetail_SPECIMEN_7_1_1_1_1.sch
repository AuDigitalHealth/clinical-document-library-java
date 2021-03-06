<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 2016-07-20 2:02:31 PM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.1.1
                  IG Guide Title     : Test Specimen Detail (SPECIMEN)
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_3A_TestSpecimenDetail_SPECIMEN_7_1_1_1_1-errors"
        id="p-Pathology_Report_3A_TestSpecimenDetail_SPECIMEN_7_1_1_1_1-errors"
        see="#p-Pathology_Report_3A_TestSpecimenDetail_SPECIMEN_7_1_1_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']">

            <assert test="cda:entryRelationship[cda:observation/cda:code/@code = '102.16156']"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'entryRelationship' tag is missing for 'Test Specimen Detail (SPECIMEN)'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '102.16156']) > 1"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'entryRelationship' tag shall appear only once for 'Test Specimen Detail (SPECIMEN)'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship[cda:observation/cda:code/@code = '102.16156']">

            <assert test="@typeCode"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'SUBJ'"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'SUBJ'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16156']">

            <assert test="@classCode"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@moodCode"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:code) > 1"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:effectiveTime"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN) / HANDLING AND PROCESSING / Date and Time of Collection (Collection DateTime)" -
                The 'effectiveTime' tag is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN) / HANDLING AND PROCESSING / Date and Time of Collection (Collection DateTime)" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation/cda:code[@code = '102.16156']">

            <assert test="@codeSystem"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@displayName"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Specimen'"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'code' tag 'displayName' attribute shall contain the value 'Specimen'.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(cda:translation)"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN)" -
                The 'translation' tag shall not be present.
                Refer to section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20018']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16156']/cda:effectiveTime">

            <assert test="not(@nullFlavor)"
                >Error: Pathology Report - 7.1.1.1.1 Test Specimen Detail (SPECIMEN) -
                "Test Specimen Detail (SPECIMEN) / HANDLING AND PROCESSING / Date and Time of Collection (Collection DateTime)" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall not be present.
                Refer to "024692 - Pathology Report information which must be present and not null" of the eHealth_Pathology_Report_My_Health_Record_Conformance_Profile_v1.1 and section 7.1.1.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

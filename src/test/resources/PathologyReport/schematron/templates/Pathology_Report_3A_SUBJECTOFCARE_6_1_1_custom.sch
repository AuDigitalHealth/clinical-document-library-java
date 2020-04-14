<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Pathology Report Clinical Document:  6.1.1 Subject of Care Custom -->

    <!-- Context: ClinicalDocument/Subject of Care -->

    <pattern name="p-Pathology_Report_3A_SUBJECTOFCARE_6_1_1_custom-errors" id="p-Pathology_Report_3A_SUBJECTOFCARE_6_1_1_custom-errors" see="#p-Pathology_Report_3A_SUBJECTOFCARE_6_1_1_custom-errors">


        <!--  Date of Birth is Calculated From Age :  The value shall be either 'true' or 'false'   -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.16233']/cda:value">

            <assert
                test="
			    translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'TRUE' or 
			    translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'FALSE'"
                >Error: Pathology Report - 6.1.1 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth
                is Calculated From Age" - The 'value' tag 'value' attribute shall contain the value 'true' or 'false'. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.16249']/cda:value">

            <assert test="not(@value) or number(@value) > 0">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic
                Data / Birth Plurality" - The 'value' tag 'value' attribute shall be an integer greater than equal to 1. Refer to "section 2.57 Birth Plurality of
                Participation_Data_Specification_v3.2" and section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and normalize-space(@value) != '' and number(@value) != floor(@value)">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or
                Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'value' tag 'value' attribute shall contain an integer value. Refer to "section 2.57 Birth Plurality of
                Participation_Data_Specification_v3.2" and section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- AGE code = 103.20109 -->


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.20109']/cda:value">

            <assert test="not(@value) or number(@value) >= 0">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic
                Data / Age Detail / Age" - The 'value' tag 'value' attribute shall be an integer greater than equal to 0. Refer to "section 2.55 Age of
                Participation_Data_Specification_v3.2" and section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="
                @value and
                normalize-space(@value) != '' and
                number(@value) != floor(@value)
                ">Error: Pathology Report -
                6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag 'value' attribute shall
                contain an integer value. Refer to "section 2.55 Age of Participation_Data_Specification_v3.2" and section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="not(@unit) or (@unit = 'd') or (@unit = 'wk') or (@unit = 'mo') or (@unit = 'a')">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or
                Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'unit' tag 'unit' attribute shall be 'd' or 'wk' or 'mo' or 'a'. Refer to "section 2.55 Age of
                Participation_Data_Specification_v3.2" and section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.16279']/cda:value">

            <assert
                test="
			    translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'TRUE' or 
			    translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'FALSE'"
                >Error: Pathology Report - 6.1.1 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator"
                - The 'value' tag 'value' attribute shall contain the value 'true' or 'false'. Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant[ext:participantRole/@classCode = 'PAT']">

            <assert test="@typeCode">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Entitlement" - The 'ext:participant' tag 'typeCode' attribute is missing. Refer
                to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'BEN'">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant /
                Entitlement" - The 'ext:participant' tag 'typeCode' attribute shall contain the value 'BEN'. Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''">Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Entitlement" - The 'ext:participant'
                tag 'typeCode' attribute shall contain a value. Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.10243']/cda:value">

            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Source of Death Notification" - The
                'value' tag 'xsi:type' attribute shall contain the value 'CD' or 'CE'. Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



    </pattern>

</schema>

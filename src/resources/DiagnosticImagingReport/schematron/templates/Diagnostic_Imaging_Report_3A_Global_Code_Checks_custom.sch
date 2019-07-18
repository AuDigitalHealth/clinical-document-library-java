<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Diagnostic Imaging Report Clinical Document:  Global Code Checks -->

    <!-- Context: ClinicalDocument -->

    <pattern name="p-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom-errors"
        id="p-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom-errors"
        see="#p-Diagnostic_Imaging_Report_3A_Global_Code_Checks_custom-errors">

        <!-- 6.1.1 :: Date of Birth is Calculated From Age -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Birth is Calculated From Age']">


            <assert test="@code = '103.16233'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age - The
                'code' tag 'code' attribute shall contain the value '103.16233'. Refer to section
                '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 6.1.1 :: Date Of Birth Accuracy Indicator -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Birth Accuracy Indicator']">

            <assert test="@code = '102.16234'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator - The
                'code' tag 'code' attribute shall contain the value '102.16234'. Refer to section
                '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 6.1.1 :: Age -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Age']">

            <assert test="@code = '103.20109'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Age Detail / Age - The 'code' tag 'code' attribute shall contain
                the value '103.20109'. Refer to section '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 6.1.1:: Age Accuracy Indicator -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Age Accuracy Indicator']">

            <assert test="@code = '103.16279'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Age Detail / Age Accuracy Indicator - The 'code' tag 'code'
                attribute shall contain the value '103.16279'. Refer to section '6.1.1 Subject of
                Care' of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 6.1.1 :: Birth Plurality -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Birth Plurality']">

            <assert test="@code = '103.16249'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Plurality - The 'code' tag 'code' attribute shall contain
                the value '103.16249'. Refer to section '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 6.1.1 :: Date of Death Accuracy Indicator -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Date of Death Accuracy Indicator']">

            <assert test="@code = '102.16252'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator - The
                'code' tag 'code' attribute shall contain the value '102.16252'. Refer to section
                '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 6.1.1 :: Source of Death Notification -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName ='Source of Death Notification']">

            <assert test="@code = '103.10243'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person /
                Demographic Data / Source of Death Notification - The 'code' tag 'code' attribute
                shall contain the value '103.10243'. Refer to section '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 6.1.1 :: Mother's Original Family Name -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@displayName =&quot;Mother's Original Family Name&quot;]">

            <assert test="@code = '103.10245'">Error: Diagnostic Imaging Report - 6.1.1 SUBJECT OF
                CARE - SUBJECT OF CARE / Participant / Person or Organisation or Device / Person /
                Demographic Data / Mother's Original Family Name - The 'code' tag 'code' attribute
                shall contain the value '103.10245'. Refer to section '6.1.1 Subject of Care' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 7.1.1.1 :: Side (Imaging Examination Result) -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:targetSiteCode/cda:qualifier/cda:name[@displayName = 'with laterality']">

            <assert test="@code = '78615007'">Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING
                EXAMINATION RESULT / Anatomical Site (ANATOMICAL LOCATION) / SPECIFIC LOCATION /
                Side - The 'name' tag 'code' attribute shall contain the value '78615007'. Refer to
                section '7.1.1.1 IMAGING EXAMINATION RESULT' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--7.1.1.1 ::  Anatomical Region-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Anatomical Region']">

            <assert test="@code = '103.17009'">Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING
                EXAMINATION RESULT / ANATOMICAL SITE DETAILS / Anatomical Region - The 'code' tag
                'code' attribute shall contain the value '103.17009'. Refer to section '7.1.1.1
                IMAGING EXAMINATION RESULT' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--7.1.1.1 ::  Overall Result Status (Imaging Examination Result Status)-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@displayName = 'report status']">

            <assert test="@code = '308552006'">Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING
                EXAMINATION RESULT / Overall Result Status (Imaging Examination Result Status) - The
                'code' tag 'code' attribute shall contain the value '308552006'. Refer to section
                '7.1.1.1 IMAGING EXAMINATION RESULT' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 7.1.1.1 :: Examination Procedure -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:code[@displayName = 'Examination Procedure']">

            <assert test="@code = '105.16633'">Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING
                EXAMINATION RESULT - IMAGING EXAMINATION RESULT / Examination Procedure - The 'code'
                tag 'code' attribute shall contain the value '105.16633'. Refer to section '7.1.1.1
                IMAGING EXAMINATION RESULT' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 7.1.1.1 :: Observation DateTime -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Imaging Examination Result DateTime']">

            <assert test="@code = '103.16589'">Error: Diagnostic Imaging Report - 7.1.1.1 IMAGING
                EXAMINATION RESULT / Observation DateTime - The 'code' tag 'code' attribute shall
                contain the value '103.16589'. Refer to section '7.1.1.1 IMAGING EXAMINATION RESULT'
                of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!-- 7.1.1.1.1 :: Examination Details (EXAMINATION REQUEST DETAILS) -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:code[@displayName = 'Examination Request Details']">

            <assert test="@code = '102.16511'">Error: Diagnostic Imaging Report - 7.1.1.1.1
                Examination Details (EXAMINATION REQUEST DETAILS) - The 'code' tag 'code' attribute
                shall contain the value '102.16511'. Refer to section '7.1.1.1.1 Examination Details
                (EXAMINATION REQUEST DETAILS)' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
        <!-- 7.1.1.1.1 :: IMAGE DETAILS -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:act[cda:code/@code='102.16511']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Image Details']">

            <assert test="@code = '102.16515'">Error: Diagnostic Imaging Report - 7.1.1.1.1
                EXAMINATION DETAILS - EXAMINATION REQUEST DETAILS / IMAGE DETAILS / Image DateTime -
                The 'code' tag 'code' attribute shall contain the value '102.16515'. Refer to
                section '7.1.1.1.1 EXAMINATION REQUEST DETAILS' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 7.1.1.1.2 :: Related Images (RELATED INFORMATION) -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:component/cda:section[cda:code/@code='102.16145']/cda:entry/cda:observation/cda:entryRelationship/cda:act/cda:code[@displayName = 'Related Information']">

            <assert test="@code = '102.16692'">Error: Diagnostic Imaging Report - Related Images
                (RELATED INFORMATION) - Related Images (RELATED INFORMATION) - The 'code' tag 'code'
                attribute shall contain the value '102.16692'. Refer to section '7.1.1.1.2 Related
                Images (RELATED INFORMATION)' of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 7.1.1.3 :: RELATED DOCUMENT -->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:entry/cda:act/cda:code[@displayName = 'Related Document']">

            <assert test="@code = '102.16971'">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED
                DOCUMENT - The 'code' tag 'code' attribute shall contain the value '102.16971'.
                Refer to section 7.1.1.3 RELATED DOCUMENT of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
        <!-- 7.1.1.3 :: Document Type -->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:reference/cda:externalDocument/cda:code[@displayName = 'Diagnostic imaging study']">

            <assert test="@code = '18748-4'">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED
                DOCUMENT / DOCUMENT DETAILS / Document Type - The 'code' tag 'code' attribute shall
                contain the value '18748-4'. Refer to section 7.1.1.3 RELATED DOCUMENT of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!--7.1.1.3 :: Report Description (Document Title)-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:entryRelationship/cda:act/cda:code[@displayName = 'Document Title']">

            <assert test="@code = '103.16966'">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED
                DOCUMENT / DOCUMENT DETAILS / Report Description (Document Title) - The 'code' tag
                'code' attribute shall contain the value '103.16966'. Refer to section 7.1.1.3
                RELATED DOCUMENT of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 7.1.1.3 :: Report Status (Document Status) -->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:entry/cda:act[cda:code/@code='102.16971']/cda:entryRelationship/cda:observation/cda:code[@displayName = 'Document Status']">

            <assert test="@code = '103.20104'">Error: Diagnostic Imaging Report - 7.1.1.3 RELATED
                DOCUMENT / DOCUMENT DETAILS / Report Status (Document Status) - The 'code' tag
                'code' attribute shall contain the value '103.20104'. Refer to section 7.1.1.3
                RELATED DOCUMENT of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>

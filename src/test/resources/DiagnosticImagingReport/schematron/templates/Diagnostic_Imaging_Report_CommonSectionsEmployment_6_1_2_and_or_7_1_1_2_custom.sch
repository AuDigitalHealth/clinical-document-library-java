<?xml version="1.0" encoding="UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern
        name="p-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom-errors"
        id="p-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom-errors"
        see="#p-Diagnostic_Imaging_Report_CommonSectionsEmployment_6_1_2_and_or_7_1_1_2_custom-errors">

        <!-- BEGIN :: Common Patterns: 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST -->

        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment |
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment">


            <!-- ext:asEmployment/@classCode -->
            <assert test="@classCode">Error: Diagnostic Imaging Report - 6.1.2 Document Author
                and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'asEmployment' tag 'classCode' attribute
                is missing. Check all 'ext:asEmployment' tags to find the missing attribute. Refer
                to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''">Error: Diagnostic
                Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The
                'asEmployment' tag 'classCode' attribute shall contain a value. Check all
                'ext:asEmployment' tags to find the missing attribute. Refer to section 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@classCode='EMP'">Error: Diagnostic Imaging Report - 6.1.2 Document Author
                and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'asEmployment' tag 'classCode' attribute
                shall contain the value 'EMP'. Check all 'ext:asEmployment' tags to find the
                incorrect attribute. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- ext:employerOrganization -->
            <report test="count(ext:employerOrganization) > 1">Error: Diagnostic Imaging Report -
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The
                'ext:employerOrganization' tag shall appear only once. Check all 'ext:asEmployment'
                tags to find the duplicate tag. Refer to section 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:code -->
            <report test="count(ext:code) > 1">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:code' tag shall appear only
                once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:jobCode -->
            <report test="count(ext:jobCode) > 1">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:jobCode' tag shall appear
                only once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to
                section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:jobClassCode -->
            <report test="count(ext:jobClassCode) > 1">Error: Diagnostic Imaging Report - 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:jobClassCode' tag
                shall appear only once. Check all 'ext:asEmployment' tags to find the duplicate tag.
                Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- <rule context="ext:asEmployment/ext:code">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

        </rule> -->


        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:jobCode |
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:jobCode">


            <!-- To be updated after the Jira issue resolution to write tests related to this tag -->
            <!-- The code attributes must also checked against the Vocabs file in the ANZSCO FE 2006 meteor 350899 code values after we get a resolution -->

            <!-- jobCode/@code - 1..1 -->
            <assert test="@code">Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST - The 'jobCode' tag 'code' attribute is missing. Check
                all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to
                section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''">Error: Diagnostic Imaging
                Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'jobCode'
                tag 'code' attribute shall contain a value. Check all 'ext:asEmployment/ext:jobCode'
                tags to find the missing attribute. Refer to section 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="
                not(@code) or
                normalize-space(@code) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @code = current()/@code]"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'jobCode' tag 'code' attribute shall be as per '1220.0 - ANZSCO -
                Australian and New Zealand Standard Classification of Occupations, First Edition,
                Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect
                attribute. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- jobCode/@codeSystem - 1..1 -->
            <assert test="@codeSystem">Error: Diagnostic Imaging Report - 6.1.2 Document Author
                and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'jobCode' tag 'codeSystem' attribute is
                missing. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing
                attribute. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''">Error: Diagnostic
                Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The
                'jobCode' tag 'codeSystem' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @codeSystem = current()/@codeSystem]"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'jobCode' tag 'codeSystem' attribute shall be as per '1220.0 -
                ANZSCO - Australian and New Zealand Standard Classification of Occupations, First
                Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the
                incorrect attribute. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- jobCode/@codeSystemName -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''">Error:
                Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'jobCode' tag 'codeSystemName' attribute shall contain a value.
                Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer
                to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>    
          
            <!-- jobCode/@codeSystemVersion -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''">Error:
                Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'jobCode' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer
                to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- jobCode/@displayName -->
            <!--
            <assert test="@displayName"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST -
                The 'jobCode' tag 'displayName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            -->

            <report test="@displayName and normalize-space(@displayName) = ''">Error: Diagnostic
                Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The
                'jobCode' tag 'displayName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="
                @displayName and
                normalize-space(@displayName) != '' and
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']
                /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'jobCode' tag 'code' and 'displayName' attributes shall match as
                per '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of
                Occupations, First Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode'
                tags to find the incorrect attribute. Refer to section 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- <rule context="ext:asEmployment/ext:jobClassCode">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

       </rule> -->


        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization |
        /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization">

            <!-- asOrganizationPartOf -->
            <assert test="cda:asOrganizationPartOf">Error: Diagnostic Imaging Report - 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'asOrganizationPartOf'
                tag is missing. Check all 'ext:asEmployment/ext:employerOrganization' tags to find
                the missing tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1">Error: Diagnostic Imaging Report -
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The
                'asOrganizationPartOf' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag. Refer to
                section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- name -->
            <report test="count(cda:name) > 1">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag shall appear only once.
                Check all 'ext:asEmployment/ext:employerOrganization' tags to find the duplicate
                tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of
                the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:name |
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:name">


            <!-- name/@ -->
            <assert test="normalize-space(.) != ''">Error: Diagnostic Imaging Report - 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag shall contain
                a value. Check all 'ext:asEmployment/ext:employerOrganization/cda:name' tags to find
                the missing value. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf |
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf">

            <!-- wholeOrganization -->
            <assert test="cda:wholeOrganization">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'wholeOrganization' tag is
                missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to find
                the missing tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:wholeOrganization) > 1">Error: Diagnostic Imaging Report - 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'wholeOrganization' tag
                shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to find
                the duplicate tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST of the Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization |
                    /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <!-- ext:asEntityIdentifier - 1..* -->

            <assert test="ext:asEntityIdentifier">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'ext:asEntityIdentifier' tag is
                missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'HPI-O asEntityIdentifier' tag is missing. "The value of one
                Entity Identifier SHALL be an Australian HPI-O." although there could be multiple
                Entity Identifiers. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- The tags and attributes of 'ext:asEntityIdentifier' are being tested in 'Diagnostic_Imaging_Report_Global_Checks.sch'. -->


            <!-- name -->
            <assert test="cda:name">Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:name) > 1">Error: Diagnostic Imaging Report - 6.1.2 Document
                Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag shall appear only once.
                Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the duplicate tag. Refer to section 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

       
            <assert test="normalize-space(.) != ''">Error: Diagnostic Imaging Report - 6.1.2
                Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag shall contain
                a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the missing value. Refer to section 6.1.2 Document Author and_or
                7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- name/@use -->

            <report test="@use and normalize-space(@use) = ''">Error: Diagnostic Imaging Report -
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST - The 'name' tag 'use'
                attribute shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006: Health Care
                Provider Organisation Name Usage and_or 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="@use and not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code
                [(@code = (current()/@use))
                or (@alternativeCode = (current()/@use))
                or (@hl7Code = (current()/@use))])"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'name' tag 'use' attribute shall be coded as per AS 4846-2006:
                Health Care Provider Organisation Name Usage. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006: Health Care
                Provider Organisation Name Usage and_or 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier/ext:id |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier/ext:id">
            
            <report
                test="
                @root and
                starts-with(@root, '1.2.36.1.2001.1003.0.') and not(starts-with(@root, '1.2.36.1.2001.1003.0.800362'))"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'id' tag 'root' attribute shall contain an OID for HPI-O
                Organisation Health Identifier, which should be ended with a national 16 digits
                unique identification number, if the 'root' attribute value begins with
                '1.2.36.1.2001.1003.0.'. Refer to The_Standards_Australia_HandBook_234 and
                The_HL7_OID_Registry and sections 8.2 and 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>            
        
            
            <report
                test="
                @root and
                starts-with(@root, '1.2.36.1.2001.1007.') and not(starts-with(@root, '1.2.36.1.2001.1007.1.80036'))"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2 REPORTING
                RADIOLOGIST - The 'id' tag 'root' attribute shall contain an OID for PAI-O Health
                Identifier, which should be ended with a national 16 digits unique identification
                number, if the 'root' attribute value begins with '1.2.36.1.2001.1007.'. Refer to
                The_Standards_Australia_HandBook_234 and The_HL7_OID_Registry and sections 8.2 and
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            
        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier[starts-with(ext:id/@root, '1.2.36.1.2001.1003.0.')] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier[starts-with(ext:id/@root, '1.2.36.1.2001.1003.0.')] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier[starts-with(ext:id/@root, '1.2.36.1.2001.1007.')] |
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier[starts-with(ext:id/@root, '1.2.36.1.2001.1007.')]">
            
            <report test="ext:code">Error: Diagnostic Imaging Report - 6.1.2 Document Author and_or 7.1.1.2
                REPORTING RADIOLOGIST - The 'ext:code' tag shall not be present for the presence of
                the 'ext:asEntityIdentifier/id' tag 'root' attribute value beginning with
                '1.2.36.1.2001.1003.0.' or '1.2.36.1.2001.1007.'. Refer to
                The_Standards_Australia_HandBook_234 and The_HL7_OID_Registry and sections 8.2 and
                6.1.2 Document Author and_or 7.1.1.2 REPORTING RADIOLOGIST of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
        </rule>

    </pattern>

</schema>

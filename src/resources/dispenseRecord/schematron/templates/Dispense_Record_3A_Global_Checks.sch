<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- ================================================================ -->
    <!-- PLEASE DON'T EDIT THIS FILE. ITS CODE IS GENERATED FROM TEMPLATE -->
    <!-- AND IS UNIFORM ACROSS ALL PACKAGES.                              -->
    <!-- ================================================================ -->

    <!-- Dispense Record Clinical Document: 3A Global Checks -->

    <!-- Context: ClinicalDocument -->

    <!-- Status: Last Reviewed:
         Status: Last Updated : 9/07/2013 -->


    <pattern name="p-Dispense_Record_3A_Global_Checks-errors"
        id="p-Dispense_Record_3A_Global_Checks-errors"
        see="#p-Dispense_Record_3A_Global_Checks-errors">


        <!-- BEGIN :: Common Patterns: A8 EMPLOYMENT -->

        <rule context="ext:asEmployment">

            <!-- ext:asEmployment/@classCode -->
            <assert test="@classCode"
                >Error: Dispense Record - A8 Employment -
                The 'asEmployment' tag 'classCode' attribute is missing. Check all
                'ext:asEmployment' tags to find the missing attribute. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Dispense Record - A8 Employment -
                The 'asEmployment' tag 'classCode' attribute shall contain a value. Check all
                'ext:asEmployment' tags to find the missing attribute. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="@classCode='EMP'"
                >Error: Dispense Record - A8 Employment -
                The 'asEmployment' tag 'classCode' attribute shall contain the value 'EMP'.
                Check all 'ext:asEmployment' tags to find the incorrect attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <!-- ext:employerOrganization -->
            <report test="count(ext:employerOrganization) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'ext:employerOrganization' tag shall appear only once. Check all
                'ext:asEmployment' tags to find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- ext:code -->
            <report test="count(ext:code) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'ext:code' tag shall appear only once. Check all 'ext:asEmployment' tags
                to find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- ext:jobCode -->
            <report test="count(ext:jobCode) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'ext:jobCode' tag shall appear only once. Check all 'ext:asEmployment' tags
                to find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- ext:jobClassCode -->
            <report test="count(ext:jobClassCode) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'ext:jobClassCode' tag shall appear only once. Check all 'ext:asEmployment'
                tags to find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>

        <!--
        <rule context="ext:asEmployment/ext:code">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

        </rule>-->

        <rule context="ext:asEmployment/ext:jobCode">

            <!-- To be updated after the Jira issue resolution to write tests related to this tag -->
            <!-- The code attributes must also checked against the Vocabs file in the ANZSCO FE 2006 meteor 350899 code values after we get a resolution -->

            <!-- jobCode/@code - 1..1 -->
            <assert test="@code"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'code' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'code' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert
                test="
                not(@code) or
                normalize-space(@code) = '' or
                document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[
                @code = current()/@code]"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'code' attribute shall be as per '1220.0 - ANZSCO -
                Australian and New Zealand Standard Classification of Occupations, First Edition,
                2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <!-- jobCode/@codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystem' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert
                test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[
                @codeSystem = current()/@codeSystem]"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall be as per '1220.0 - ANZSCO -
                Australian and New Zealand Standard Classification of Occupations, First Edition,
                2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <!-- jobCode/@codeSystemName -->
            <!--
            <assert test="@codeSystemName"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>
            -->

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <report test="
                @codeSystemName and
                normalize-space(@codeSystemName) != '' and
                translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, 2006'"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute shall be '1220.0 - ANZSCO -
                Australian and New Zealand Standard Classification of Occupations, First Edition,
                2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- jobCode/@codeSystemVersion -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'codeSystemVersion' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- jobCode/@displayName -->
            <!--
            <assert test="@displayName"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'displayName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>
            -->

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'displayName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <report test="
                @displayName and
                normalize-space(@displayName) != '' and
                document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']
                /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Dispense Record - A8 Employment -
                The 'jobCode' tag 'code' and 'displayName' attributes shall match as per '1220.0 -
                ANZSCO - Australian and New Zealand Standard Classification of Occupations,
                First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the
                incorrect attribute. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>

        <!--<rule context="ext:asEmployment/ext:jobClassCode">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

            </rule>-->

        <rule context="ext:asEmployment/ext:employerOrganization">

            <!-- asOrganizationPartOf -->
            <assert test="cda:asOrganizationPartOf"
                >Error: Dispense Record - A8 Employment -
                The 'asOrganizationPartOf' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the missing tag.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'asOrganizationPartOf' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <!-- name -->
            <report test="count(cda:name) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag.
                Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:name">

            <!-- name/@ -->
            <assert test="normalize-space(.) != ''"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:name' tags to find the missing
                value. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf">

            <!-- wholeOrganization -->
            <assert test="cda:wholeOrganization"
                >Error: Dispense Record - A8 Employment -
                The 'wholeOrganization' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to
                find the missing tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'wholeOrganization' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to
                find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>

        <rule
            context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <!-- ext:asEntityIdentifier - 1..* -->

            <assert test="ext:asEntityIdentifier"
                >Error: Dispense Record - A8 Employment -
                The 'ext:asEntityIdentifier' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Dispense Record - A8 Employment -
                The 'HPI-O asEntityIdentifier' tag is missing. "The value of one Entity Identifier
                SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <!-- The tags and attributes of 'ext:asEntityIdentifier' are being tested in 'Dispense_Record_Global_Checks.sch'. -->


            <!-- name -->
            <assert test="cda:name"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <report test="count(cda:name) > 1"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the duplicate tag. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>


        <rule
            context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <assert test="not(@nullFlavor)"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag 'nullFlavor' attribute shall not be present.
                Refer to requirements in NullFlavor Usage Clarification FAQ and section A8 of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <assert test="normalize-space(.) != ''"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the missing value. Refer to section A8 Employment of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</assert>

            <!-- name/@use -->

            <report test="@use and normalize-space(@use) = ''"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag 'use' attribute shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006:
                Health Care Provider Organisation Name Usage of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

            <report
                test="@use and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code
                [(@code = (current()/@use))
                or (@alternativeCode = (current()/@use))
                or (@hl7Code = (current()/@use))])"
                >Error: Dispense Record - A8 Employment -
                The 'name' tag 'use' attribute shall be coded as per AS 4846-2006:
                Health Care Provider Organisation Name Usage. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006:
                Health Care Provider Organisation Name Usage of the
                Dispense_Record_CDA_Implementation_Guide_vATS 4888.4-2013.</report>

        </rule>

        <!-- END :: Common Patterns: A8 Employment -->







    </pattern>

</schema>

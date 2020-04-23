<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                                                                
                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.4
                  IG Guide Title     : REQUESTER
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_REQUESTER_6_1_4_custom-errors"
        id="p-Pathology_Report_REQUESTER_6_1_4_custom-errors"
        see="#p-Pathology_Report_REQUESTER_6_1_4_custom-errors">





        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:addr">

            <assert
                test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Address" -
                The 'country' tag shall contain the value 'Australia'. Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report
                test="
                @use and normalize-space(@use) != '' and not(@use = 'WP')"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Address" -
                The 'addr' tag 'use' attribute shall be set to Business see AS 5017-2006: HealthCare
                Client Identifier Address Purpose. Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:telecom">

            <assert test="not(@use) or normalize-space(@use) = '' or  @use='WP' ">Error: Pathology
                Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Electronic Communication
                Detail" - The 'telecom' tag 'use' attribute shall be set to Workplace see HL7 v3:
                TelecommunicationAddressUse. Refer to section 6.1.4 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment">

            <!-- ext:asEmployment/@classCode -->
            <assert test="@classCode">Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER /
                Participant / Person or Organisation or Device / Person / Employment Detail" - The
                'asEmployment' tag 'classCode' attribute is missing. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''">Error: Pathology
                Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or Organisation or
                Device / Person / Employment Detail" - The 'asEmployment' tag 'classCode' attribute
                shall contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="not(@classCode) or (normalize-space(@classCode) = '') or (@classCode='EMP')"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail" - The 'asEmployment' tag
                'classCode' attribute shall contain the value 'EMP'. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>


            <!-- ext:code -->
            <report test="count(ext:code) > 1">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail" - The 'ext:code' tag shall appear only once. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:jobCode -->
            <report test="count(ext:jobCode) > 1">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail" - The 'ext:jobCode' tag shall appear only once. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:jobClassCode -->
            <report test="count(ext:jobClassCode) > 1">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail" - The 'ext:jobClassCode' tag shall appear only once. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- ext:employerOrganization -->
            <report test="count(ext:employerOrganization) > 1">Error: Pathology Report - 6.1.4
                REQUESTER - "REQUESTER / Participant / Person or Organisation or Device / Person /
                Employment Detail" - The 'ext:employerOrganization' tag shall appear only once.
                Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>






        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization">

            <!-- asOrganizationPartOf -->
            <assert test="cda:asOrganizationPartOf">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation" - The 'asOrganizationPartOf' tag is missing. Refer
                to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1">Error: Pathology Report - 6.1.4
                REQUESTER - "REQUESTER / Participant / Person or Organisation or Device / Person /
                Employment Detail / Employer Organisation" - The 'asOrganizationPartOf' tag shall
                appear only once. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- name -->
            <report test="count(cda:name) > 1">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation / Organisation / Department/Unit" - The 'name' tag
                shall appear only once. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>




        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf">

            <!-- wholeOrganization -->
            <assert test="cda:wholeOrganization">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation / Organisation" - The 'wholeOrganization' tag is
                missing. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:wholeOrganization) > 1">Error: Pathology Report - 6.1.4
                REQUESTER - "REQUESTER / Participant / Person or Organisation or Device / Person /
                Employment Detail / Employer Organisation / Organisation" - The 'wholeOrganization'
                tag shall appear only once. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>






        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <!-- ext:asEntityIdentifier - 0..* -->

            <!-- The tags and attributes of 'ext:asEntityIdentifier' are being tested in 'Pathology_Report_Global_Checks.sch'. -->


            <!-- name -->
            <assert test="cda:name">Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER /
                Participant / Person or Organisation or Device / Person / Employment Detail /
                Employer Organisation / Organisation / Organisation Name" - The 'name' tag is
                missing. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:name) > 1">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation / Organisation / Organisation Name" - The 'name' tag
                shall appear only once. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>





        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier/ext:id">

            <report
                test="
                @root and
                starts-with(@root, '1.2.36.1.2001.1003.0.') and not(starts-with(@root, '1.2.36.1.2001.1003.0.800362'))"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Employer Organisation / Entity
                Identifier" - The 'id' tag 'root' attribute shall contain an OID for HPI-O
                Organisation Health Identifier, which should be ended with a national 16 digits
                unique identification number. Refer to section 6.1.4 REQUESTER and section 8.2 of
                the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report
                test="
                @root and
                starts-with(@root, '1.2.36.1.2001.1003.0') and not(starts-with(@root, '1.2.36.1.2001.1003.0.800362'))"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Employer Organisation / Entity
                Identifier" - The 'id' tag 'root' attribute shall contain an OID for HPI-O
                Organisation Health Identifier, which should be ended with a national 16 digits
                unique identification number. Refer to section 6.1.4 REQUESTER and section 8.2 of
                the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="
                @root and
                starts-with(@root, '1.2.36.1.2001.1007.1.') and not(starts-with(@root, '1.2.36.1.2001.1007.1.80036'))"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Employer Organisation / Entity
                Identifier" - The 'id' tag 'root' attribute shall contain an OID for PAI-O Health
                Identifier, which should be ended with a national 16 digits unique identification
                number. Refer to section 6.1.4 REQUESTER and section 8.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>





        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

           
            <assert test="normalize-space(.) != ''">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation / Organisation / Organisation Name" - The 'name' tag
                shall contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- name/@use -->

            <report test="@use and normalize-space(@use) = ''">Error: Pathology Report - 6.1.4
                REQUESTER - "REQUESTER / Participant / Person or Organisation or Device / Person /
                Employment Detail / Employer Organisation / Organisation / Organisation Name" - The
                'name' tag 'use' attribute shall contain a value. Refer to section 10.4 AS
                4846-2006: Health Care Provider Organisation Name Usage of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="@use and not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code
                [(@code = (current()/@use))
                or (@alternativeCode = (current()/@use))
                or (@hl7Code = (current()/@use))])"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Employer Organisation /
                Organisation / Organisation Name" - The 'name' tag 'use' attribute shall be coded as
                per AS 4846-2006: Health Care Provider Organisation Name Usage.Refer to section 10.4
                AS 4846-2006: Health Care Provider Organisation Name Usage of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>







        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:employerOrganization/cda:name">

            <!-- name/@ -->
            <assert test="normalize-space(.) != ''">Error: Pathology Report - 6.1.4 REQUESTER -
                "REQUESTER / Participant / Person or Organisation or Device / Person / Employment
                Detail / Employer Organisation / Organisation / Department/Unit" - The 'name' tag
                shall contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>







        <!--<rule context="ext:asEmployment/ext:jobClassCode">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

       </rule>-->






        <rule
            context="/cda:ClinicalDocument/cda:participant/cda:associatedEntity/cda:associatedPerson/ext:asEmployment/ext:jobCode">

            <!-- To be updated after the Jira issue resolution to write tests related to this tag -->
            <!-- The code attributes must also checked against the Vocabs file in the ANZSCO FE 2006 meteor 350899 code values after we get a resolution -->

            <!-- jobCode/@code - 1..1 -->
            <assert test="@code">Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER /
                Participant / Person or Organisation or Device / Person / Employment Detail /
                Occupation" - The 'jobCode' tag 'code' attribute is missing. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''">Error: Pathology Report -
                6.1.4 REQUESTER - "REQUESTER / Participant / Person or Organisation or Device /
                Person / Employment Detail / Occupation" - The 'jobCode' tag 'code' attribute shall
                contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="
                not(@code) or
                normalize-space(@code) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @code = current()/@code]"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'code' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand
                Standard Classification of Occupations, First Edition, Revision 1'. Refer to section
                6.1.4 REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- jobCode/@codeSystem - 1..1 -->
            <assert test="@codeSystem">Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER /
                Participant / Person or Organisation or Device / Person / Employment Detail /
                Occupation" - The 'jobCode' tag 'codeSystem' attribute is missing. Refer to section
                6.1.4 REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''">Error: Pathology
                Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or Organisation or
                Device / Person / Employment Detail / Occupation" - The 'jobCode' tag 'codeSystem'
                attribute shall contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @codeSystem = current()/@codeSystem]"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'codeSystem' attribute shall be as per '1220.0 - ANZSCO - Australian and New
                Zealand Standard Classification of Occupations, First Edition, Revision 1'. Refer to
                section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <!-- jobCode/@codeSystemName -->
            <!--
            <assert test="@codeSystemName"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                The 'jobCode' tag 'codeSystemName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            -->

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''">Error:
                Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'codeSystemName' attribute shall contain a value. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="
                @codeSystemName and
                normalize-space(@codeSystemName) != '' and
                translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, REVISION 1'"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'codeSystemName' attribute shall be '1220.0 - ANZSCO - Australian and New
                Zealand Standard Classification of Occupations, First Edition, Revision 1'. Refer to
                section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- jobCode/@codeSystemVersion -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''">Error:
                Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'codeSystemVersion' attribute shall contain a value. Refer to section 6.1.4
                REQUESTER of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <!-- jobCode/@displayName -->
            <!--
            <assert test="@displayName"
                >Error: Pathology Report - 6.1.4 REQUESTER -
                The 'jobCode' tag 'displayName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            -->

            <report test="@displayName and normalize-space(@displayName) = ''">Error: Pathology
                Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or Organisation or
                Device / Person / Employment Detail / Occupation" - The 'jobCode' tag 'displayName'
                attribute shall contain a value. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="
                @displayName and
                normalize-space(@displayName) != '' and
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']
                /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Pathology Report - 6.1.4 REQUESTER - "REQUESTER / Participant / Person or
                Organisation or Device / Person / Employment Detail / Occupation" - The 'jobCode'
                tag 'code' and 'displayName' attributes shall match as per '1220.0 - ANZSCO -
                Australian and New Zealand Standard Classification of Occupations, First Edition,
                Revision 1'. Refer to section 6.1.4 REQUESTER of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>






        <!--
        <rule context="ext:asEmployment/ext:code">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

         </rule>-->



    </pattern>

</schema>

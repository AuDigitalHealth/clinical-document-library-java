<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:08 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.1
                  IG Guide Title     : DOCUMENT AUTHOR
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1-errors"
        id="p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1-errors"
        see="#p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR" -
                The 'author' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:author) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR" -
                The 'author' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:assignedAuthor"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'assignedAuthor' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:code"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:code) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:id"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:id) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="cda:assignedPerson"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id">

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
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Role" -
                The 'id' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:name"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="ext:asEmployment"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(ext:asQualifications) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'asQualifications' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization">

            <report test="count(cda:name) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'name' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:name">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'name' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications">

            <assert test="@classCode"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'QUAL'"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'asQualifications' tag 'classCode' attribute shall contain the value 'QUAL'.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="ext:code"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'code' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(ext:code) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

            <assert test="cda:originalText"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'originalText' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:originalText) > 1"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'originalText' tag shall appear only once.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="not(cda:originalText) or normalize-space(cda:originalText) != ''"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Qualifications" -
                The 'originalText' tag shall contain a value.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="cda:addr"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Address" -
                The 'addr' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:telecom"
                >Error: Shared Health Summary - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


    </pattern>

</schema>

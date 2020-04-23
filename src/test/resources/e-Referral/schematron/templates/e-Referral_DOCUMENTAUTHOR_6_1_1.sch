<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 25/06/2015 10:43:50 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.1
                  IG Guide Title     : DOCUMENT AUTHOR
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_DOCUMENTAUTHOR_6_1_1-errors"
        id="p-e-Referral_DOCUMENTAUTHOR_6_1_1-errors"
        see="#p-e-Referral_DOCUMENTAUTHOR_6_1_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:author"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author" -
                The 'author' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:author) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author" -
                The 'author' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author">

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'AUT'"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author" -
                The 'author' tag 'typeCode' attribute shall contain the value 'AUT'.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author" -
                The 'author' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:time) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participation Period" -
                The 'time' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:time"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participation Period" -
                The 'time' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:assignedAuthor"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'assignedAuthor' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:assignedAuthor) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'assignedAuthor' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participation Period" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@value"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participation Period" -
                The 'time' tag 'value' attribute is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participation Period" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'assignedAuthor' tag 'nullFlavor' attribute shall not be present.
                Refer to 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:code"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:id"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / id" -
                The 'id' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / id" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:assignedPerson"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant" -
                The 'assignedPerson' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:addr"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:telecom"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Role" -
                The 'code' tag 'nullFlavor' attribute shall not be present.
                Refer to NEHTA_1273_2013_Common_ContinuityofCare_FAQNullableFieldsGuidance_v1.1 and section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

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
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:name"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="ext:asEmployment"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name">

            <assert test="cda:family"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'family' tag is missing.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:family) > 1"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "Document Author / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'family' tag shall appear only once.
                Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment">

            <assert test="ext:employerOrganization"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation" -
                The 'employerOrganization' tag is missing.
                Refer to section 026503 Document author's employer organisation address and 026504 Document author's employer organisation electronic communication detail and section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="cda:addr"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Address" -
                The 'addr' tag is missing.
                Refer to section 026503 Document author's employer organisation address and section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:telecom"
                >Error: e-Referral - 6.1.1 DOCUMENT AUTHOR -
                "DOCUMENT AUTHOR / Participant / Person or Organisation or Device / Person / Employment Detail / Employer Organisation / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 026506 Document author's individual electronic communication detail and section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>

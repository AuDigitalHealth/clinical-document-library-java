<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 21-02-2014 08:58:25

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.3.2
                  IG Guide Title     : PATIENT NOMINATED CONTACTS ORGANISATION
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2-errors"
        id="p-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2-errors"
        see="#p-e-Referral_PATIENTNOMINATEDCONTACTSORGANISATION_6_1_3_2-errors">


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP'][cda:associatedEntity/cda:scopingOrganization]">

            <report test="count(cda:associatedEntity) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'associatedEntity' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]">

            <assert test="@classCode"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'associatedEntity' tag 'classCode' attribute is missing.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'associatedEntity' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'CON'"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'associatedEntity' tag 'classCode' attribute shall contain the value 'CON'.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'code' tag is missing.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Role" -
                The 'code' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:id"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / id" -
                The 'id' tag is missing.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / id" -
                The 'id' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:scopingOrganization) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant" -
                The 'scopingOrganization' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]/cda:id">

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
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]/cda:scopingOrganization">

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant" -
                The 'asOrganizationPartOf' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:name) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Department/ Unit" -
                The 'name' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]/cda:scopingOrganization/cda:asOrganizationPartOf">

            <report test="count(cda:wholeOrganization) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant" -
                The 'wholeOrganization' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]/cda:scopingOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <assert test="cda:name"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag is missing.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:name) > 1"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag shall appear only once.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'IRCP']/cda:associatedEntity[cda:scopingOrganization]/cda:scopingOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <report test="@use and normalize-space(@use) = ''"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'use' attribute shall contain a value.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @use and normalize-space(@use) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code[
                    (@code = current()/@use) or
                    (@alternativeCode = current()/@use) or
                    (@hl7Code = current()/@use)
                ])"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'use' attribute shall be as per 10.4 AS 4846-2006: Health Care Provider Organisation Name Usage.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="not(@nullFlavor)"
                >Error: e-Referral - 6.1.3.2 PATIENT NOMINATED CONTACTS ORGANISATION -
                "Patient Nominated Contacts - Organisation / Participant / Person or Organisation or Device / Organisation / Organisation Name" -
                The 'name' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1.3.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


    </pattern>

</schema>

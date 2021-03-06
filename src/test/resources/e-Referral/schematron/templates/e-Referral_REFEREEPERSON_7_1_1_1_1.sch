<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 21-02-2014 08:58:25

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.1.1
                  IG Guide Title     : REFEREE PERSON
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_REFEREEPERSON_7_1_1_1_1-errors"
        id="p-e-Referral_REFEREEPERSON_7_1_1_1_1-errors"
        see="#p-e-Referral_REFEREEPERSON_7_1_1_1_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:participant[@typeCode = 'REFT'][cda:associatedEntity/cda:associatedPerson]"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee" -
                The 'participant' tag is missing for 'Referee'.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:participant[@typeCode = 'REFT'][cda:associatedEntity/cda:associatedPerson]) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee" -
                The 'participant' tag shall appear only once for 'Referee'.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'REFT'][cda:associatedEntity/cda:associatedPerson]">

            <report test="count(cda:associatedEntity) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participation Type" -
                The 'associatedEntity' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'REFT']/cda:associatedEntity[cda:associatedPerson]">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participation Type" -
                The 'associatedEntity' tag 'classCode' attribute is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participation Type" -
                The 'associatedEntity' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'RoleClassAssociative']/code[(@code = current()/@classCode)]"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participation Type" -
                The 'associatedEntity' tag 'classCode' attribute shall be as per  HL7 RoleClassAssociative.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Role" -
                The 'code' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / id" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:associatedPerson) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant" -
                The 'associatedPerson' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:addr"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:telecom"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Electronic Communication Detail" -
                The 'telecom' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'REFT']/cda:associatedEntity[cda:associatedPerson]/cda:id">

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
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'REFT']/cda:associatedEntity[cda:associatedPerson]/cda:associatedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:name"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="ext:asEmployment"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag is missing.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: e-Referral - 7.1.1.1.1 REFEREE PERSON -
                "Referee / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 7.1.1.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>

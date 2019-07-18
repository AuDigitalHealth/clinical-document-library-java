<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 21-02-2014 08:58:26

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.3.1.1
                  IG Guide Title     : SERVICE PROVIDER - PERSON
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_SERVICEPROVIDER-PERSON_7_1_5_3_1_1-errors"
        id="p-e-Referral_3A_SERVICEPROVIDER-PERSON_7_1_5_3_1_1-errors"
        see="#p-e-Referral_3A_SERVICEPROVIDER-PERSON_7_1_5_3_1_1-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer/cda:assignedEntity[cda:assignedPerson]">

            <assert test="cda:addr"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Participant / Address" -
                The 'addr' tag is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'code' tag is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:code) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'code' tag shall appear only once.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'id' tag is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']">

            <report test="count(cda:performer[cda:assignedEntity/cda:assignedPerson]) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider (Person)" -
                The 'performer' tag shall appear only once for 'Service Provider (Person)'.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer[cda:assignedEntity/cda:assignedPerson]">

            <assert test="@typeCode"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider (Person)" -
                The 'performer' tag 'typeCode' attribute is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider (Person)" -
                The 'performer' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'PRF'"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider (Person)" -
                The 'performer' tag 'typeCode' attribute shall contain the value 'PRF'.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:assignedEntity[cda:assignedPerson]) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'assignedEntity' tag shall appear only once for ' Role'.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer/cda:assignedEntity[cda:assignedPerson]/cda:id">

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
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Role" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer/cda:assignedEntity/cda:assignedPerson">

            <assert test="ext:asEntityIdentifier"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Participant / Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="cda:name"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Participant / Person or Organisation or Device / Person / Person Name" -
                The 'name' tag is missing.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(ext:asEmployment) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Participant / Person or Organisation or Device / Person / Employment Detail" -
                The 'asEmployment' tag shall appear only once.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>

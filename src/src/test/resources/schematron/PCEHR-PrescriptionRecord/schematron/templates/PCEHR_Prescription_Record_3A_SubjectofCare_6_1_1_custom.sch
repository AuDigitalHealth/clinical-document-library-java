<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_3A_SubjectofCare_6_1_1_custom-errors"
        id="p-PCEHR_Prescription_Record_3A_SubjectofCare_6_1_1_custom-errors"
        see="#p-PCEHR_Prescription_Record_3A_SubjectofCare_6_1_1_custom-errors">

 <!--      The value of the birth plurality should be greater than 0.     -->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.16249']/cda:value">

            <assert test="number(@value) > 0">Error: PCEHR Prescription Record - 6.1.1 Subject of
                Care - "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Plurality" - The 'value' tag 'value' attribute shall
                contain a positive integer value greater than equal to 1. Refer to section 6.1.1 of
                the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

<!--        NodeExistenceTest for ext:entitlement[ext:participant/@typeCode='BEN'] and ext:entitlement[ext:participant/@typeCode='HLD']  -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/ext:coverage2">

            <assert test="ext:entitlement[ext:participant/@typeCode='BEN' or ext:participant/@typeCode='HLD']"
                >Error: PCEHR Prescription Record -
                6.1.1 Subject of Care - "Subject of Care / Participant / Entitlement" or
                6.1.2 Prescriber - "Prescriber > Participant > Person or Organisation or Device > Entitlement"
                - The 'entitlement' tag is missing.
                Refer to section 6.1.1 or 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


<!--        NodeExistenceTest for ext:participant[@typeCode='BEN'] and ext:participant[@typeCode='HLD']  -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/ext:coverage2/ext:entitlement">

            <assert test="ext:participant[@typeCode='BEN' or @typeCode='HLD']"
                >Error: PCEHR Prescription Record -
                6.1.1 Subject of Care - "Subject of Care / Participant / Entitlement" or
                6.1.2 Prescriber - "Prescriber > Participant > Person or Organisation or Device > Entitlement"
                - The 'participant' tag is missing.
                Refer to section 6.1.1 or 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!--     Date of Birth is Calculated From Age :     The value shall be either 'true' or 'false'-->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.16233']/cda:value">

            <assert test="
                translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'TRUE' or
                translate(@value , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'FALSE'"
                >Error: PCEHR Prescription Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" -
                The 'value' tag 'value' attribute shall contain the value 'true' or 'false'.
                Refer to section 6.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            </rule>



        <!-- Age -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation[cda:code/@code='103.20109']/cda:value">

            <report test="@value and not(@value >= number(0))">Error: PCEHR Prescription Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Age Detail / Age" - The 'value' tag 'value' attribute shall be
                greater than or equal to zero. Refer to section 2.55 of the Participation_Data_Specifications_v3.2 and
                section 6.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@unit and not((@unit = 'a') or (@unit = 'mo') or (@unit = 'wk') or (@unit = 'd'))"
                >Error: PCEHR Prescription Record - 6.1.1 Subject of Care - "Subject of Care /
                Participant / Person or Organisation or Device / Person / Demographic Data / Age
                Detail / Age" - The 'value' tag 'unit' attribute shall be one of 'a' or 'mo' or 'wk'
                or 'd'. Refer to section 2.55 of the Participation_Data_Specifications_v3.2 and
                section 6.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/ext:coverage2/ext:entitlement[ext:participant/@typeCode='BEN']/ext:code">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Entitlement / Entitlement Type " -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 6.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Entitlement / Entitlement Type " -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

    </pattern>

</schema>

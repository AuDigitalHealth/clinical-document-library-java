<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_Prescriber_6_1_2_custom-errors"
        id="p-PCEHR_Prescription_Record_Prescriber_6_1_2_custom-errors"
        see="#p-PCEHR_Prescription_Record_Prescriber_6_1_2_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:code">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'code' tag shall have at least the 'originalText' child tag or the 'code' attribute.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Role" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:jobCode">

           <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail / Occupation" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Person or Organisation or Device / Person / Employment Detail / Occupation" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asQualifications/ext:code">

           <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 6.1.2 Prescriber -
                "Prescriber / Participant / Qualifications" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.2 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

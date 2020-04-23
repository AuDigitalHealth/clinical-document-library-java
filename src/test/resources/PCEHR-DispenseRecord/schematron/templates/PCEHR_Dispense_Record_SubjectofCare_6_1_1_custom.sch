<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom-errors"
        id="p-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom-errors"
        see="#p-PCEHR_Dispense_Record_SubjectofCare_6_1_1_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:ethnicGroupCode">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status " -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 6.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Dispense Record - 6.1.1 Subject of Care -
                "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status " -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

    </pattern>

</schema>

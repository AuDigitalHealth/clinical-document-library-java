<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3_custom-errors"
        id="p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3_custom-errors"
        see="#p-PCEHR_Dispense_Record_3A_DispensingOrganisation_6_1_3_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16210']/ext:coverage2/ext:entitlement[ext:participant/@typeCode='HLD']/ext:code">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Dispense Record - 6.1.3 Dispensing Organisation -
                "Dispensing Organisation / Participant / Entitlement / Entitlement Type" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 6.1.3 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

    </pattern>

</schema>

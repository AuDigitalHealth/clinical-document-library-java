<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:09 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 5.1.3
                  IG Guide Title     : EncompassingEncounter
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_EncompassingEncounter_5_1_3-errors"
        id="p-PCEHR_Prescription_Record_EncompassingEncounter_5_1_3-errors"
        see="#p-PCEHR_Prescription_Record_EncompassingEncounter_5_1_3-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:componentOf"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter" -
                The 'componentOf' tag is missing.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:componentOf) > 1"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter" -
                The 'componentOf' tag shall appear only once.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf">

            <assert test="cda:encompassingEncounter"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter" -
                The 'encompassingEncounter' tag is missing.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:encompassingEncounter) > 1"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter" -
                The 'encompassingEncounter' tag shall appear only once.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter">

            <assert test="cda:effectiveTime"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter/effectiveTime" -
                The 'effectiveTime' tag is missing.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:effectiveTime) > 1"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter/effectiveTime" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:effectiveTime">

            <assert test="not(@nullFlavor) or normalize-space(@nullFlavor) != ''"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter/effectiveTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall contain a value.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@nullFlavor) or normalize-space(@nullFlavor) = '' or @nullFlavor = 'NA'"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter/effectiveTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute shall contain the value 'NA'.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="@nullFlavor"
                >Error: PCEHR Prescription Record - 5.1.3 EncompassingEncounter -
                "componentOf/encompassingEncounter/effectiveTime" -
                The 'effectiveTime' tag 'nullFlavor' attribute is missing.
                Refer to section 5.1.3 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

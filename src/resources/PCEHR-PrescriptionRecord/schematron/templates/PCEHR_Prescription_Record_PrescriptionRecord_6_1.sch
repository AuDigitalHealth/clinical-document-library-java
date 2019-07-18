<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:13 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1
                  IG Guide Title     : Prescription Record
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_PrescriptionRecord_6_1-errors"
        id="p-PCEHR_Prescription_Record_PrescriptionRecord_6_1-errors"
        see="#p-PCEHR_Prescription_Record_PrescriptionRecord_6_1-errors">


        <rule context="/cda:ClinicalDocument/cda:author">

            <assert test="cda:time"
                >Error: PCEHR Prescription Record - 6.1 Prescription Record -
                "PCEHR Prescription Record / Date- Time Prescription Written" -
                The 'time' tag is missing.
                Refer to section 6.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:time) > 1"
                >Error: PCEHR Prescription Record - 6.1 Prescription Record -
                "PCEHR Prescription Record / Date- Time Prescription Written" -
                The 'time' tag shall appear only once.
                Refer to section 6.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="@value"
                >Error: PCEHR Prescription Record - 6.1 Prescription Record -
                "PCEHR Prescription Record / Date- Time Prescription Written" -
                The 'time' tag 'value' attribute is missing.
                Refer to section 6.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Prescription Record - 6.1 Prescription Record -
                "PCEHR Prescription Record / Date- Time Prescription Written" -
                The 'time' tag 'value' attribute shall contain a value.
                Refer to section 6.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

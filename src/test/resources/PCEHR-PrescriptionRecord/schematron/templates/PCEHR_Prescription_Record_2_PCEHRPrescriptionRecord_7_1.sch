<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:11 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1
                  IG Guide Title     : PCEHR Prescription Record
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_2_PCEHRPrescriptionRecord_7_1-errors"
        id="p-PCEHR_Prescription_Record_2_PCEHRPrescriptionRecord_7_1-errors"
        see="#p-PCEHR_Prescription_Record_2_PCEHRPrescriptionRecord_7_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: PCEHR Prescription Record - 7.1 PCEHR Prescription Record -
                "e-Prescription (Body)" -
                The 'component' tag is missing.
                Refer to section 7.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:component) > 1"
                >Error: PCEHR Prescription Record - 7.1 PCEHR Prescription Record -
                "e-Prescription (Body)" -
                The 'component' tag shall appear only once.
                Refer to section 7.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: PCEHR Prescription Record - 7.1 PCEHR Prescription Record -
                "e-Prescription (Body)" -
                The 'structuredBody' tag is missing.
                Refer to section 7.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: PCEHR Prescription Record - 7.1 PCEHR Prescription Record -
                "e-Prescription (Body)" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 7.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

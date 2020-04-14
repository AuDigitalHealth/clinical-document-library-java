<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/08/2013 2:03:42 PM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.1
                  IG Guide Title     : e-Prescription
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_2_e-Prescription_8_1-errors"
        id="p-e-Prescription_2_e-Prescription_8_1-errors"
        see="#p-e-Prescription_2_e-Prescription_8_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: e-Prescription - 8.1 e-Prescription -
                "e-prescription" -
                The 'component' tag is missing.
                Refer to section 8.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:component) > 1"
                >Error: e-Prescription - 8.1 e-Prescription -
                "e-prescription" -
                The 'component' tag shall appear only once.
                Refer to section 8.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: e-Prescription - 8.1 e-Prescription -
                "e-prescription" -
                The 'structuredBody' tag is missing.
                Refer to section 8.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: e-Prescription - 8.1 e-Prescription -
                "e-prescription" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 8.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


    </pattern>

</schema>

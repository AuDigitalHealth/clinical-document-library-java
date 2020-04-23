<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 03-10-2013 18:40:34

                  Product            : Prescription Request
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.1
                  IG Guide Title     : Prescription Request
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_2_PrescriptionRequest_8_1-errors"
        id="p-Prescription_Request_2_PrescriptionRequest_8_1-errors"
        see="#p-Prescription_Request_2_PrescriptionRequest_8_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: Prescription Request - 8.1 Prescription Request -
                "Prescription Request (Body)" -
                The 'component' tag is missing.
                Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:component) > 1"
                >Error: Prescription Request - 8.1 Prescription Request -
                "Prescription Request (Body)" -
                The 'component' tag shall appear only once.
                Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: Prescription Request - 8.1 Prescription Request -
                "Prescription Request (Body)" -
                The 'structuredBody' tag is missing.
                Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: Prescription Request - 8.1 Prescription Request -
                "Prescription Request (Body)" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 8.1 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>

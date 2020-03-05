<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 15/07/2013 9:39:44 AM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1
                  IG Guide Title     : e-Prescription
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_e-Prescription_7_1-errors"
        id="p-e-Prescription_e-Prescription_7_1-errors"
        see="#p-e-Prescription_e-Prescription_7_1-errors">


        <rule context="/cda:ClinicalDocument">

            <report test="count(cda:id) > 1"
                >Error: e-Prescription - 7.1 e-Prescription -
                "e-prescription / Prescription Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 7.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:id"
                >Error: e-Prescription - 7.1 e-Prescription -
                "e-prescription / Prescription Identifier" -
                The 'id' tag is missing.
                Refer to section 7.1 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 27/09/2013 2:52:55 PM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.3
                  IG Guide Title     : Prescriber
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_Prescriber_7_3_custom-errors"
        id="p-e-Prescription_Prescriber_7_3_custom-errors"
        see="#p-e-Prescription_Prescriber_7_3_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test = "
                not(@value) or normalize-space(@value) = ''
                or not(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:author/cda:time/@value)
                or normalize-space(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:author/cda:time/@value) = ''
                or (@value) = normalize-space(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:author/cda:time/@value)" 
                >Error: e-Prescription - 7.3 Prescriber -
                "Prescriber / Participant / DateTime" -
                The 'time' tag 'value' attribute shall be as /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:author/cda:time/@value .
                Refer to section 7.3 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>

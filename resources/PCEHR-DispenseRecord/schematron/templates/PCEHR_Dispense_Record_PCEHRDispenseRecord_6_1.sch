<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:16 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1
                  IG Guide Title     : PCEHR Dispense Record
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1-errors"
        id="p-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1-errors"
        see="#p-PCEHR_Dispense_Record_PCEHRDispenseRecord_6_1-errors">


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="@value"
                >Error: PCEHR Dispense Record - 6.1 PCEHR Dispense Record -
                "PCEHR Dispense Record / DateTime Authored" -
                The 'time' tag 'value' attribute is missing.
                Refer to section 6.1 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

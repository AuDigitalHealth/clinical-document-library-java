<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 15/01/2015 4:01:48 PM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  Generator Version  : 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_Xml_Stylesheet_Exclusion-errors"
        id="p-Shared_Health_Summary_Xml_Stylesheet_Exclusion-errors"
        see="#p-Shared_Health_Summary_Xml_Stylesheet_Exclusion-errors">





        <rule context="/">

            <report test="processing-instruction('xml-stylesheet')">Error: Shared Health Summary -
                There shall be no direct reference to a stylesheet in the CDA document. Refer to
                025254 Prohibit specific rendering of CDA content of the
                COMMON-ConformProfileClinDoc-v1.6.</report>

        </rule>



    </pattern>

</schema>

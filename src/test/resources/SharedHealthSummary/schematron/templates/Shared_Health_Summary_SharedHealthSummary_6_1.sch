<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:09 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1
                  IG Guide Title     : Shared Health Summary
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_SharedHealthSummary_6_1-errors"
        id="p-Shared_Health_Summary_SharedHealthSummary_6_1-errors"
        see="#p-Shared_Health_Summary_SharedHealthSummary_6_1-errors">


        <rule context="/cda:ClinicalDocument/cda:author">

            <assert test="cda:time"
                >Error: Shared Health Summary - 6.1 Shared Health Summary -
                "Shared Health Summary / DateTime Authored" -
                The 'time' tag is missing.
                Refer to section 6.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:time) > 1"
                >Error: Shared Health Summary - 6.1 Shared Health Summary -
                "Shared Health Summary / DateTime Authored" -
                The 'time' tag shall appear only once.
                Refer to section 6.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:author/cda:time">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 6.1 Shared Health Summary -
                "Shared Health Summary / DateTime Authored" -
                The 'time' tag 'nullFlavor' attribute shall not be present.
                Refer to section 6.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


    </pattern>

</schema>

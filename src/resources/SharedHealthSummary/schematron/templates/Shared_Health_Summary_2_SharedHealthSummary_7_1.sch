<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 12/02/2015 9:49:09 AM

                  Product            : Shared Health Summary
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1
                  IG Guide Title     : Shared Health Summary
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_2_SharedHealthSummary_7_1-errors"
        id="p-Shared_Health_Summary_2_SharedHealthSummary_7_1-errors"
        see="#p-Shared_Health_Summary_2_SharedHealthSummary_7_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: Shared Health Summary - 7.1 Shared Health Summary -
                "Shared Health Summary (Body)" -
                The 'component' tag is missing.
                Refer to section 7.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:component) > 1"
                >Error: Shared Health Summary - 7.1 Shared Health Summary -
                "Shared Health Summary (Body)" -
                The 'component' tag shall appear only once.
                Refer to section 7.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: Shared Health Summary - 7.1 Shared Health Summary -
                "Shared Health Summary (Body)" -
                The 'structuredBody' tag is missing.
                Refer to section 7.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: Shared Health Summary - 7.1 Shared Health Summary -
                "Shared Health Summary (Body)" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 7.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


    </pattern>

</schema>

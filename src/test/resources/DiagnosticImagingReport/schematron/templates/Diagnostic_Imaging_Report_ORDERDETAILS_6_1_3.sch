<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 14/04/2015 11:53:39 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.1.3
                  IG Guide Title     : ORDER DETAILS
                  Generator Version  : 2.28
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3-errors"
        id="p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3-errors"
        see="#p-Diagnostic_Imaging_Report_ORDERDETAILS_6_1_3-errors">


        <rule context="/cda:ClinicalDocument">

            <report test="count(cda:inFulfillmentOf) > 1"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS" -
                The 'inFulfillmentOf' tag shall appear only once.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:inFulfillmentOf"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS" -
                The 'inFulfillmentOf' tag is missing.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:inFulfillmentOf">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS" -
                The 'inFulfillmentOf' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'FLFS'"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS" -
                The 'inFulfillmentOf' tag 'typeCode' attribute shall contain the value 'FLFS'.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:order"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag is missing.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:order) > 1"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag shall appear only once.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:inFulfillmentOf/cda:order">

            <report test="@classCode and normalize-space(@classCode) = ''"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag 'classCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @classCode and normalize-space(@classCode) != '' and @classCode != 'ACT'"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@moodCode and normalize-space(@moodCode) = ''"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag 'moodCode' attribute shall contain a value.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @moodCode and normalize-space(@moodCode) != '' and @moodCode != 'RQO'"
                >Error: Diagnostic Imaging Report - 6.1.3 ORDER DETAILS -
                "ORDER DETAILS / Requester Order Identifier" -
                The 'order' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 6.1.3 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

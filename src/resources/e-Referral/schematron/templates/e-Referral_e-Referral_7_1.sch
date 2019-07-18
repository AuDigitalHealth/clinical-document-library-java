<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 7/04/2014 1:53:10 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1
                  IG Guide Title     : e-Referral
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_e-Referral_7_1-errors"
        id="p-e-Referral_e-Referral_7_1-errors"
        see="#p-e-Referral_e-Referral_7_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:component"
                >Error: e-Referral - 7.1 e-Referral -
                "e-Referral (Body)" -
                The 'component' tag is missing.
                Refer to section 7.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:component) > 1"
                >Error: e-Referral - 7.1 e-Referral -
                "e-Referral (Body)" -
                The 'component' tag shall appear only once.
                Refer to section 7.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component">

            <assert test="cda:structuredBody"
                >Error: e-Referral - 7.1 e-Referral -
                "e-Referral (Body)" -
                The 'structuredBody' tag is missing.
                Refer to section 7.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:structuredBody) > 1"
                >Error: e-Referral - 7.1 e-Referral -
                "e-Referral (Body)" -
                The 'structuredBody' tag shall appear only once.
                Refer to section 7.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>

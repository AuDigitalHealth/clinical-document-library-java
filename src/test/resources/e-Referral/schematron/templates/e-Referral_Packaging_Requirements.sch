<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 25/06/2015 11:58:36 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  Generator Version  : 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_Packaging_Requirements-errors"
        id="p-e-Referral_Packaging_Requirements-errors"
        see="#p-e-Referral_Packaging_Requirements-errors">

        <rule  context="cda:text[cda:reference[@value][not(starts-with(@value, '#') or contains(@value, ':'))]]">
        
            <report test="@integrityCheckAlgorithm and normalize-space(@integrityCheckAlgorithm) = ''"
                >Error:  e-Referral - Global Clinical Document check for *[child::*:reference] tag - The 'integrityCheckAlgorithm' tag shall
                contain a value. Check all parent tags of reference tag to find the tag with
                'integrityCheckAlgorithm'. Refer to "M 16 of section 3.3.3 Conformance points" of CDA_Package_v1.0 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>   
            
            <report
                test="
                @integrityCheckAlgorithm and normalize-space(@integrityCheckAlgorithm) != '' and   @integrityCheckAlgorithm != 'SHA-1'"
                >Error: e-Referral - Global Clinical Document check for *[child::*:reference] tag - The 'integrityCheckAlgorithm' tag shall
                contain the value 'SHA-1'. Check all parent tags of reference tag to find the tag with
                'integrityCheckAlgorithm'. Refer to "M 16 of section 3.3.3 Conformance points" of CDA_Package_v1.0 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
        
            <assert test="@integrityCheck">Error: e-Referral - Global Clinical Document
                check for *[child::*:reference] tag - The 'integrityCheck' attribute is missing for
                the attachment. Check all parent tags of reference tag to find the tag with
                'integrityCheck' attribute missing. Refer to "M 20 and M 22 of section 3.3.3 Conformance points" of CDA_Package_v1.0 and the e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        
        </rule>

    </pattern>

</schema>

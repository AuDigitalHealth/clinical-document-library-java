<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 16/04/2015 2:59:44 PM

                  Product            : Pathology Report
                  Release            : CDA_Implementation_Guide_v1.0
                  Generator Version  : 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_Packaging_Requirements-errors"
        id="p-Pathology_Report_Packaging_Requirements-errors"
        see="#p-Pathology_Report_Packaging_Requirements-errors">

                
<rule  context="cda:text[cda:reference[@value][not(starts-with(@value, '#') or contains(@value, ':'))]]">



    <report test="@integrityCheckAlgorithm and normalize-space(@integrityCheckAlgorithm) = ''"
        >Error:  Pathology Report - Global Clinical Document check for *[child::*:reference] tag - The 'integrityCheckAlgorithm' tag shall
        contain a value. Check all parent tags of reference tag to find the tag with
        'integrityCheckAlgorithm' Refer to M 16 of 3.3.3 Conformance points of  CDA Package Version 1.0 and the
        Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
   
    
    <report
        test="
        @integrityCheckAlgorithm and normalize-space(@integrityCheckAlgorithm) != '' and   @integrityCheckAlgorithm != 'SHA-1'"
        >Error: Pathology Report - Global Clinical Document check for *[child::*:reference] tag - The 'integrityCheckAlgorithm' tag shall
        contain the value 'SHA-1'. Check all parent tags of reference tag to find the tag with
        'integrityCheckAlgorithm' Refer to M 16 of 3.3.3 Conformance points of  CDA Package Version 1.0 and the
        Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

    <assert test="@integrityCheck">Error: Pathology Report - Global Clinical Document
        check for *[child::*:reference] tag - The 'integrityCheck' attribute is missing for
        the attachment. Check all parent tags of reference tag to find the tag with
        'integrityCheck' attribute missing. Refer to M 20 and M22 of 3.3.3 Conformance points of  CDA Package Version 1.0 and the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

</rule>

    </pattern>

</schema>

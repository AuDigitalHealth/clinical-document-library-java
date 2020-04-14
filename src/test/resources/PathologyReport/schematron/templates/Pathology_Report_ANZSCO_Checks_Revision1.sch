<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 31/03/2015 11:20:18 AM

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

    <pattern name="p-Pathology_Report_ANZSCO_Checks_Revision1-errors"
        id="p-Pathology_Report_ANZSCO_Checks_Revision1-errors"
        see="#p-Pathology_Report_ANZSCO_Checks_Revision1-errors">




        <rule context="*[@codeSystem='2.16.840.1.113883.13.62']">            
            
            <assert test="number(@code) = floor(@code)">Error: Pathology Report - ANZSCO code
                check for "*[@codeSystem='2.16.840.1.113883.13.62']/@code" attribute - The 'code' attribute
                ANZSCO code value shall be a number. Check all such 'code' attributes to find the incorrect 
                attribute(s). Refer to the 1220.0_ANZSCO_First_Edition_Revision_1 and section 'Reference List [ABS2009]' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert test="string-length(@code) = 6">Error: Pathology Report - ANZSCO code check for 
                "*[@codeSystem='2.16.840.1.113883.13.62']/@code" attribute - The 'code' attribute
                ANZSCO code value shall have 6 digits. Check all such 'code' attributes to find the incorrect attribute(s). 
                Refer to the 1220.0_ANZSCO_First_Edition_Revision_1 and section 'Reference List [ABS2009]' of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>


    </pattern>

</schema>

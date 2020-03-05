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

    <pattern name="p-Pathology_Report_Global_Checks_Exceptions_Option_04-errors"
        id="p-Pathology_Report_Global_Checks_Exceptions_Option_04-errors"
        see="#p-Pathology_Report_Global_Checks_Exceptions_Option_04-errors">




                <!-- Option 4 : 
                1) cda:name tag (with exceptions where it has following ancestors) can only be a structured name
                2) ext:addr/cda:addr tag is allowed to have a @nullFlavor attribute with the value 'NA' only, except in the SoC where cda:addr/@nullFlavor has the options to choose between 'NA', 'UNK' and 'MSK' -->



            <rule context="cda:name[not(
                ancestor::cda:manufacturedMaterial or
                ancestor::cda:product or
                ancestor::cda:receivedOrganization or
                ancestor::cda:representedOrganization or
                ancestor::cda:representedCustodianOrganization or
                ancestor::cda:scopingOrganization or
                ancestor::cda:serviceProviderOrganization or
                ancestor::cda:targetSiteCode or
                ancestor::ext:employerOrganization)]">
                


            <!-- ****************** CAUTION BEGINS **************************** -->
            
            <!-- For the following test refer to the Jira tickets ccp-47, ccas-85 and ccas-86 
                For eDischarge Summary, Event Summary, eReferral and Specialist Letter unstructured names are allowed -->            
        
            
            <!-- family 1..1 ... Check to enforce that only structured name is allowed -->
            <!-- This test is for all the packages except  eDischarge Summary, Event Summary, eReferral and Specialist Letter. 
                Please see Global_checks_Exceptions_1 file for family element tests for above four packages -->
             <assert test="cda:family"
                >Error: Pathology Report -
                Global Clinical Document check for "name" tag - The 'family' tag is missing.
                Check all 'cda:name' tags to find the missing 'family' child tag.
                Refer to section 8.5 Person Name of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>    
            
            <!-- ************* CAUTION ENDS ********************** -->
        </rule>








        <rule context="cda:addr[not(ancestor::cda:birthplace or ancestor::cda:recordTarget)] | ext:addr">
    
             <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'NA'"
                   >Error: Pathology Report - Global Clinical Document check for 'addr' tag -
                   "Address / Address Purpose" and "Address / No Fixed Address Indicator" -
                   The 'addr' tag 'nullFlavor' attribute shall contain the value 'NA'.
                   Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'nullFlavor' attribute value.
                   Refer to section 8.6 of the
                   Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
    
        </rule>

        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:addr">    
    
                <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'NA' and @nullFlavor != 'UNK' and @nullFlavor != 'MSK'"
                 >Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                 "Subject of Care" -  The 'addr' tag 'nullFlavor' attribute shall contain the value 'NA' or 'UNK' or 'MSK'.
                  Refer to section 8.6 of the
                 Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
    
        </rule>



   
    </pattern>

</schema>

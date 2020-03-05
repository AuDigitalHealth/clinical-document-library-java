<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 18/06/2015 3:31:37 PM

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

    <pattern name="p-e-Referral_Global_Checks_Exceptions_Option_05-errors"
        id="p-e-Referral_Global_Checks_Exceptions_Option_05-errors"
        see="#p-e-Referral_Global_Checks_Exceptions_Option_05-errors">




                <!-- Option 5 : 
                1) cda:name tag (with exceptions where it has following ancestors) can Either be a structured name, Or unstructured name, But not both
                2) ext:addr/cda:addr tag is allowed to have a @nullFlavor attribute with a value of 'NA' only -->





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
            
            <!-- For the following two tests refer to the Jira tickets ccp-47, ccas-85 and ccas-86 
                For eDischarge Summary, Event Summary, eReferral and Specialist Letter unstructured names are allowed --> 
       
            <!-- Either it is structured name, Or unstructured name, But not both. If it is not structured, it must have some text but no child elements -->
            <!-- The below two tests are written for eDischarge Summary, Event Summary, eReferral and Specialist Letter.
                 Please see Global_checks_Exceptions_2 file for family element tests of other packages -->
            
            <assert test="
                (child::* and normalize-space(concat(text()[1], text()[2], text()[3], text()[4], text()[5])) = '') or
                (not(child::*) and normalize-space(.) != '')"
                >Error: e-Referral -
                Global Clinical Document check for "name" tag - The 'name' tag shall have
                either a 'structured name' or an 'unstructured name' to be present but not both.
                Check all 'cda:name' tags to find the incorrect 'name' tag.
                Refer to section 8.5 Person Name of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
            <!-- Either family or Unstructured name shall be present.--> 
            <assert test="cda:family or normalize-space(concat(text()[1], text()[2], text()[3], text()[4], text()[5])) != ''"
                >Error: e-Referral -
                Global Clinical Document check for "name" tag - The 'name' tag shall have
                either a 'structured name' or an 'unstructured name'. If it is a structured name, 
                it shall have a 'family' tag. Check all 'cda:name' tags to find the incorrect 'name' tag.
                Refer to section 8.5 Person Name of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>            
            
            <!-- ************* CAUTION ENDS ********************** -->
            
        </rule>









        <rule context="cda:addr[not(ancestor::cda:birthplace)] | ext:addr">
    
            <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'NA'"
                >Error: e-Referral - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" and "Address / No Fixed Address Indicator" -
                The 'addr' tag 'nullFlavor' attribute shall contain the value 'NA'.
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'nullFlavor' attribute value.
                Refer to section 8.6 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
         </rule>

   
    </pattern>

</schema>

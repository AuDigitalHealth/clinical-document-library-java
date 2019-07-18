<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/06/2013 11:32:09 AM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.2
                  IG Guide Title     : ClinicalDocument
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_ClinicalDocument_custom_6_2-errors"
        id="p-e-Prescription_ClinicalDocument_6_2_custom-errors"
        see="#p-e-Prescription_ClinicalDocument_6_2_custom-errors">


        <rule context="/cda:ClinicalDocument">
            
            <assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.101.100.1002.74' and @extension='2.1'])>0"
                >Error: e-Prescription - 6.2 ClinicalDocument - "ClinicalDocument / templateId" - The
                'templateId' tag 'root' attribute shall contain the value
                '1.2.36.1.2001.1001.101.100.1002.74'. If the 'root' value is
                '1.2.36.1.2001.1001.101.100.1002.74' then the 'extension' attribute shall contain
                the value '2.1'. 
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])>0"
                >Error: e-Prescription - 6.2 ClinicalDocument - "ClinicalDocument / templateId" - The
                'templateId' tag 'root' attribute shall contain the value
                "1.2.36.1.2001.1001.100.149" . If the 'root' value is '1.2.36.1.2001.1001.100.149'
                then the 'extension' attribute shall contain the value '1.0'. 
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:languageCode">
            
            <assert test="@code = 'en-AU' or @code='en'"
                >Error: e-Prescription - 6.2 ClinicalDocument - "ClinicalDocument / languageCode" - The 'languageCode' tag 'code'
                attribute shall be coded as per 'RFC3066' format 'LanguageCode-COUNTRYCODE' and
                shall have the language code as 'en'. 
                Refer to section 6.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        

    </pattern>

</schema>

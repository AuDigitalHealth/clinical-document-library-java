<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

	<pattern name="p-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom-errors"
		id="p-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom-errors"
		see="#p-PCEHR_Dispense_Record_ClinicalDocument_6_1_custom-errors">

  <!-- PCEHR Dispense Record ClinicalDocument :  6.1 Clinical Document -->

    <!-- Context: ClinicalDocument/Clinical Document -->


    <!-- Status: Last Reviewed: 
         Status: Last Updated : 07/09/2012 -->
		
	
	<!-- Removing this rule but need to check if it is consistent with other packages and contain this rule context or 
	Is it an exception for this package to have the templateid as 1..1-->
	    
<!--	<rule context="/cda:ClinicalDocument">

		<!-\- templateId - 1..* -\->
            
		<assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.1002.160' and @extension='1.0'])>0"
                >Error: Consolidated View - 5.1 Clinical Document - "ClinicalDocument / templateId" - The
                'templateId' tag 'root' attribute shall contain the value
                "1.2.36.1.2001.1001.100.1002.2". If the 'root' value is
                '1.2.36.1.2001.1001.100.1002.2' then the 'extension' attribute shall contain the
                value '1.0'. Refer to section 5.1 of the
			    Consolidated_View_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])>0"
                >Error: Consolidated View - 5.1 Clinical Document - "ClinicalDocument /
                templateId" - The 'templateId' tag 'root' attribute shall contain the value
                "1.2.36.1.2001.1001.100.149" . If the 'root' value is
                '1.2.36.1.2001.1001.100.149' then the 'extension' attribute shall contain
                the value '1.0'. Refer to requirement CDA-RS 64 of the CDA_Rendering_Specification_Clinical_Documentation_v1.0
                and section 1.8 of the Consolidated_View_CDA_Implementation_Guide_v1.0.</assert>

	</rule>-->


	  <rule context="/cda:ClinicalDocument/cda:languageCode">

             <assert
                test="translate(substring(@code, 1, 2), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'EN'"
                >Error: PCEHR Dispense Record - 6.1 Clinical Document - "ClinicalDocument / languageCode" - The
                'languageCode' tag 'code' attribute shall contain a value in the format
                'LanguageCode-COUNTRYCODE' as per 'RFC3066' and shall have the language code as
                'en'. Refer to section 6.1 of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v3.1.</assert>


	  </rule>
	  

	</pattern>

</schema>

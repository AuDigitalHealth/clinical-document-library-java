<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
	<ns prefix = "cda" uri = "urn:hl7-org:v3"/>
	<ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
	<ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
	<ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

	<pattern name="p-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom-errors"
		id="p-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom-errors"
		see="#p-PCEHR_Dispense_Record_ClinicalDocument_5_1_custom-errors">

		<!-- 
			Mapping To Rule Context Id @ TagRule Page: 4501
			Why it appear @ custom file:
			To be consistent to other developed packages
		-->

	    <!--We require the combination of @root = '1.2.36.1.2001.1001.100.1002.171' and @extension='1.0' AND
                       the combination of @root = '1.2.36.1.2001.1001.100.149' and @extension='1.0' for the templateId tag-->
			
		<rule context="/cda:ClinicalDocument">
			
			<!-- templateId - 1..* -->
			
			<assert
				test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.1002.171' and @extension='1.0'])>0"
				>Error: PCEHR Dispense Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The
				'templateId' tag 'root' attribute shall contain the value
				"1.2.36.1.2001.1001.100.1002.170". If the 'root' value is
				'1.2.36.1.2001.1001.100.1002.170' then the 'extension' attribute shall contain the
				value '1.0'. Refer to section 5.1 of the
				PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>
			
			<assert
				test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])>0"
				>Error: PCEHR Dispense Record - 5.1 Clinical Document - "ClinicalDocument /
				templateId" - The 'templateId' tag 'root' attribute shall contain the value
				"1.2.36.1.2001.1001.100.149" . If the 'root' value is
				'1.2.36.1.2001.1001.100.149' then the 'extension' attribute shall contain
				the value '1.0'. Refer to section 5.1 of the
				PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>	
		</rule>
	
		<!-- 
			Mapping To Rule Context Id @ TagRule Page: 4505
			Why it appear @ custom file:
			To be consistent to other developed packages
		-->
   
	  
    <!-- 18/10 - JIRA ID - CCAS-74 :   Need to test for "en-AU" or "en" values-->
	    
	  <rule context="/cda:ClinicalDocument/cda:languageCode">

            <assert test="@code">Error: PCEHR Dispense Record - 5.1 Clinical Document - "ClinicalDocument /
                languageCode" - The 'languageCode' tag 'code' attribute is missing. Refer to section 5.1 of the
			    PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="@code = 'en-AU' or @code='en'"
                >Error: PCEHR Dispense Record - 5.1 Clinical Document - "ClinicalDocument / languageCode" - The
                'languageCode' tag 'code' attribute shall contain a value in the format
                'LanguageCode-COUNTRYCODE' as per 'RFC3066' and shall have the language code as
                'en-AU' or 'en'. Refer to section 5.1 of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

	  </rule>
	
	</pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_ClinicalDocument_6_2_custom-errors"
        id="p-Prescription_Request_ClinicalDocument_6_2_custom-errors"
        see="#p-Prescription_Request_ClinicalDocument_6_2_custom-errors">


        <rule context="/cda:ClinicalDocument">

            <assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.101.100.1002.101' and @extension='1.1'])>0"
                >Error: Prescription Request - 6.2 Clinical Document - "ClinicalDocument /
                templateId" - The 'templateId' tag 'root' attribute shall contain the value
                '1.2.36.1.2001.1001.101.100.1002.101'. If the 'root' value is
                '1.2.36.1.2001.1001.101.100.1002.101' then the 'extension' attribute shall contain
                the value '1.2'. Refer to section 6.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert
                test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])>0"
                >Error: Prescription Request - 6.2 Clinical Document - "ClinicalDocument /
                templateId" - The 'templateId' tag 'root' attribute shall contain the value
                "1.2.36.1.2001.1001.100.149" . If the 'root' value is '1.2.36.1.2001.1001.100.149'
                then the 'extension' attribute shall contain the value '1.0'. Refer to section 6.2
                of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:languageCode">

            <assert test="@code = 'en-AU' or @code='en'">Error: Prescription Request - 6.2 Clinical
                Document - "ClinicalDocument / languageCode" - The 'languageCode' tag 'code'
                attribute shall be coded as per 'RFC3066' format 'LanguageCode-COUNTRYCODE' and
                shall have the language code as 'en'. Refer to section 6.2 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>


    </pattern>

</schema>

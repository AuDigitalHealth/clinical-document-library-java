<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3-errors"
        id="p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3-errors"
        see="#p-Shared_Health_Summary_HPI-I_Common_Conformance_Requirements_Part3-errors">

        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')or (@root = '2.16.840.1.113883.3.879.270091')])] |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0') or (@root = '2.16.840.1.113883.3.879.270091')])]">
            
            <assert test="ext:code">Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2
                Document Author - The 'ext:code' tag is
                missing. Refer to 023876 Local identifier details for a person in
                an Entity Identifier element of COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator and section
                6.1.2 Document Author of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>
        
        
        
        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id |
            /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEntityIdentifier[not(ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.') or (@root = '1.2.36.1.2001.1003.0')])]/ext:id">
            
            <assert test="@extension">Error: Shared Health Summary - 5.1.1 Legal Authenticator and 6.1.2
                Document Author - The 'ext:id' tag
                'extension' attribute is missing. Refer to 023876 Local identifier details for a person in
                an Entity Identifier element of COMMON-ConformProfileClinDoc-v1.6 and section 5.1.1 Legal Authenticator
                and section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <assert test="@assigningAuthorityName">Error: Shared Health Summary - 5.1.1 Legal
                Authenticator and 6.1.2 Document Author -
                The 'ext:id' tag 'assigningAuthorityName' attribute is missing. Refer to 023876 Local identifier details for a person in
                an Entity Identifier element of COMMON-ConformProfileClinDoc-v1.6 and
                section 5.1.1 Legal Authenticator and section 6.1.2 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>
        

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>



     <pattern name="p-Shared_Health_Summary_HPI-I_Enforced-errors"
        id="p-Shared_Health_Summary_HPI-I_Enforced-errors"
        see="#p-Shared_Health_Summary_HPI-I_Enforced-errors">


        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson">
            
            <assert
                test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]"
                >Error: Shared Health Summary - 6.1.1 Document Author - The 'asEntityIdentifier' tag with a HPI-I is
                missing. Refer to 3.4.10 Local identifier for a person of
                COMMON-ConformProfileClinDoc-v1.6 and 6.1.1 Document Author of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>


    </pattern>

</schema>

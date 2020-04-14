<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- e-Referral Clinical Document: HPI-I Enforced -->


    <!-- Status: Last Reviewed: 22/08/2013.
        Status: Last Updated :   -->


    <pattern name="p-e-Referral_HPI-I_Enforced-errors"
        id="p-e-Referral_HPI-I_Enforced-errors"
        see="#p-e-Referral_HPI-I_Enforced-errors">
        
      
        <rule context=" /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson|
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'PART']/cda:associatedEntity/cda:associatedPerson|
            /cda:ClinicalDocument/cda:participant[translate(@typeCode, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REFT']/cda:associatedEntity/cda:associatedPerson|
            /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode='ACT']/cda:performer[@typeCode='PRF']/cda:assignedEntity/cda:assignedPerson">
            
            
            <assert
                test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]"
                >Error: Pe-Referral - 6.1.1 Document Author and 7.1.1.2.1 Usual GP and 7.1.1.1.1 Referee Person and 7.1.5.3.1.1 Service Provider (Person) -
                The 'asEntityIdentifier' tag with a HPI-I is missing. Refer to "023436 Identifier for
                Document Author or 023648 Identifier for Reporting Pathologist and section 6.1.1 Document Author or 7.1.1.2.1 Usual GP or 7.1.1.1.1 Referee Person or 7.1.5.3.1.1 Service Provider (Person)" of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
    </pattern>

</schema>

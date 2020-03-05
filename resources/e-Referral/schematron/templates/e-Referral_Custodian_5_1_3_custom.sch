<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_Custodian_5_1_3_custom-errors"
        id="p-e-Referral_Custodian_5_1_3_custom-errors"
        see="#p-e-Referral_Custodian_5_1_3_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/ext:asEntityIdentifier/ext:id">
            
            <!-- custodian/assignedCustodian/representedCustodianOrganization/Entity Identifier - 1.* CCB-0222-->
            <!-- custodian/assignedCustodian/representedCustodianOrganization/name - 1..1 CCB-0222 -->
            
            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.80036')) and not( (starts-with(@root, '1.2.36.1.2001.1003.0.800362')) or (starts-with(@root, '1.2.36.1.2001.1003.0.800363')) )"
                >Error: e-Referral - 5.1.3 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with either '1.2.36.1.2001.1003.0.800362' or
                '1.2.36.1.2001.1003.0.800363' if it begins with '1.2.36.1.2001.1003.0.80036'. Refer
                to section 3.4.9 Custodian of COMMON-ConformProfileClinDoc-v1.4 and section 5.1.3 of
                the e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.1.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.1.800364'))"
                >Error: e-Referral - 5.1.3 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.1.800364' if it begins with
                '1.2.36.1.2001.1007.1.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.10.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.10.800364'))"
                >Error: e-Referral - 5.1.3 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.10.800364' if it begins with
                '1.2.36.1.2001.1007.10.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.20.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.20.800364'))"
                >Error: e-Referral - 5.1.3 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.20.800364' if it begins with
                '1.2.36.1.2001.1007.20.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.3 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
        </rule>


    </pattern>

</schema>

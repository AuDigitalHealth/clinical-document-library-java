<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_Custodian_5_1_2_custom-errors"
        id="p-PCEHR_Dispense_Record_Custodian_5_1_2_custom-errors"
        see="#p-PCEHR_Dispense_Record_Custodian_5_1_2_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">

            <!-- custodian/assignedCustodian/representedCustodianOrganization/Entity Identifier - 1.* RPSA-1094, CCB-0222-->
            <!-- custodian/assignedCustodian/representedCustodianOrganization/name - 1..1 RPSA-1094, CCB-0222 -->

            <!-- ENTITY IDENTIFIER -->

            <assert test="ext:asEntityIdentifier">Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian / assignedCustodian / representedCustodianOrganization / Entity
                Identifier" - The 'asEntityIdentifier' tag is missing. Refer to section 3.4.9
                Custodian of COMMON-ConformProfileClinDoc-v1.4 and section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- NAME -->

            <assert test="cda:name">Error: PCEHR Dispense Record - 5.1.2 Custodian - "custodian /
                assignedCustodian / representedCustodianOrganization / name" - The 'name' tag is
                missing. Refer to section 3.4.9 Custodian of COMMON-ConformProfileClinDoc-v1.4 and
                section 5.1.2 of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/ext:asEntityIdentifier/ext:id">

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1003.0.80036')) and not( (starts-with(@root, '1.2.36.1.2001.1003.0.800362')) or (starts-with(@root, '1.2.36.1.2001.1003.0.800363')) )"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with either '1.2.36.1.2001.1003.0.800362' or
                '1.2.36.1.2001.1003.0.800363' if it begins with '1.2.36.1.2001.1003.0.80036'. Refer
                to section 3.4.9 Custodian of COMMON-ConformProfileClinDoc-v1.4 and section 5.1.2 of
                the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.1.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.1.800364'))"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.1.800364' if it begins with
                '1.2.36.1.2001.1007.1.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.10.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.10.800364'))"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.10.800364' if it begins with
                '1.2.36.1.2001.1007.10.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report
                test="(starts-with(@root, '1.2.36.1.2001.1007.20.80036')) and not(starts-with(@root, '1.2.36.1.2001.1007.20.800364'))"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian - "custodian / assignedCustodian /
                representedCustodianOrganization / Entity Identifier" - The 'id' tag 'root'
                attribute shall begin with '1.2.36.1.2001.1007.20.800364' if it begins with
                '1.2.36.1.2001.1007.20.80036'. Refer to section 3.4.9 Custodian of
                COMMON-ConformProfileClinDoc-v1.4 and section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

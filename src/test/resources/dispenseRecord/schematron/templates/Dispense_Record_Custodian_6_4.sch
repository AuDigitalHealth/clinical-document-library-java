<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 30/09/2013 2:25:59 PM

                  Product            : Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 6.4
                  IG Guide Title     : Custodian
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Dispense_Record_Custodian_6_4-errors"
        id="p-Dispense_Record_Custodian_6_4-errors"
        see="#p-Dispense_Record_Custodian_6_4-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:custodian"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian" -
                The 'custodian' tag is missing.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:custodian) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian" -
                The 'custodian' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian">

            <assert test="cda:assignedCustodian"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian" -
                The 'assignedCustodian' tag is missing.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:assignedCustodian) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian" -
                The 'assignedCustodian' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian">

            <assert test="cda:representedCustodianOrganization"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization" -
                The 'representedCustodianOrganization' tag is missing.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:representedCustodianOrganization) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization" -
                The 'representedCustodianOrganization' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">

            <assert test="cda:id"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/id" -
                The 'id' tag is missing.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <assert test="ext:asEntityIdentifier"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Entity Identifier" -
                The 'asEntityIdentifier' tag is missing.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(ext:asEntityIdentifier) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Entity Identifier" -
                The 'asEntityIdentifier' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <assert test="not(ext:asEntityIdentifier) or ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Entity Identifier" -
                The 'asEntityIdentifier' tag for 'HPI-O' is missing.
                "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>

            <report test="count(cda:name) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/name" -
                The 'name' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="cda:name and normalize-space(cda:name) = ''"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/name" -
                The 'name' tag shall contain a value.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="count(cda:telecom) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Electronic Communication Detail" -
                The 'telecom' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

            <report test="count(cda:addr) > 1"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Address" -
                The 'addr' tag shall appear only once.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: Dispense Record - 6.4 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 6.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>

        </rule>


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:13 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 5.1.2
                  IG Guide Title     : Custodian
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_Custodian_5_1_2-errors"
        id="p-PCEHR_Dispense_Record_Custodian_5_1_2-errors"
        see="#p-PCEHR_Dispense_Record_Custodian_5_1_2-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:custodian"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "Custodian" -
                The 'custodian' tag is missing.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:custodian) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "Custodian" -
                The 'custodian' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian">

            <assert test="cda:assignedCustodian"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian" -
                The 'assignedCustodian' tag is missing.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedCustodian) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian" -
                The 'assignedCustodian' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian">

            <assert test="cda:representedCustodianOrganization"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization" -
                The 'representedCustodianOrganization' tag is missing.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:representedCustodianOrganization) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization" -
                The 'representedCustodianOrganization' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">

            <assert test="cda:id"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/id" -
                The 'id' tag is missing.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:name) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/name" -
                The 'name' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="cda:name and normalize-space(cda:name) = ''"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/name" -
                The 'name' tag shall contain a value.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:telecom) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Electronic Communication Detail" -
                The 'telecom' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:addr) > 1"
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/Address" -
                The 'addr' tag shall appear only once.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Dispense Record - 5.1.2 Custodian -
                "custodian/assignedCustodian/representedCustodianOrganization/id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 5.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 3:31:09 PM

                  Product            : PCEHR Prescription Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 5.1.1
                  IG Guide Title     : LegalAuthenticator
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_LegalAuthenticator_5_1_1-errors"
        id="p-PCEHR_Prescription_Record_LegalAuthenticator_5_1_1-errors"
        see="#p-PCEHR_Prescription_Record_LegalAuthenticator_5_1_1-errors">


        <rule context="/cda:ClinicalDocument">

            <assert test="cda:legalAuthenticator"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator" -
                The 'legalAuthenticator' tag is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:legalAuthenticator) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator" -
                The 'legalAuthenticator' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator">

            <assert test="cda:time"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/time" -
                The 'time' tag is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:time) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/time" -
                The 'time' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:signatureCode"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/signatureCode" -
                The 'signatureCode' tag is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:signatureCode) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/signatureCode" -
                The 'signatureCode' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:assignedEntity"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity" -
                The 'assignedEntity' tag is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:assignedEntity) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity" -
                The 'assignedEntity' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:signatureCode">

            <assert test="@code"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/signatureCode" -
                The 'signatureCode' tag 'code' attribute is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'S'"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/signatureCode" -
                The 'signatureCode' tag 'code' attribute shall contain the value 'S'.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/signatureCode" -
                The 'signatureCode' tag 'code' attribute shall contain a value.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity">

            <report test="count(cda:code) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/code" -
                The 'code' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <assert test="cda:id"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/id" -
                The 'id' tag is missing.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="count(cda:id) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/id" -
                The 'id' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:assignedPerson) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/assignedPerson" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:representedOrganization) > 1"
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/representedOrganization" -
                The 'representedOrganization' tag shall appear only once.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:id">

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
                >Error: PCEHR Prescription Record - 5.1.1 LegalAuthenticator -
                "LegalAuthenticator/assignedEntity/id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 5.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


    </pattern>

</schema>

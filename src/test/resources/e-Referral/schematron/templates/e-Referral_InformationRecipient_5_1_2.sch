<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 21-02-2014 08:58:12

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 5.1.2
                  IG Guide Title     : InformationRecipient
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_InformationRecipient_5_1_2-errors"
        id="p-e-Referral_InformationRecipient_5_1_2-errors"
        see="#p-e-Referral_InformationRecipient_5_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:informationRecipient">

            <assert test="cda:intendedRecipient"
                >Error: e-Referral - 5.1.2 InformationRecipient -
                "InformationRecipient/intendedRecipient" -
                The 'intendedRecipient' tag is missing.
                Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:intendedRecipient) > 1"
                >Error: e-Referral - 5.1.2 InformationRecipient -
                "InformationRecipient/intendedRecipient" -
                The 'intendedRecipient' tag shall appear only once.
                Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient">

            <report test="count(cda:informationRecipient) > 1"
                >Error: e-Referral - 5.1.2 InformationRecipient -
                "InformationRecipient/intendedRecipient/informationRecipient" -
                The 'informationRecipient' tag shall appear only once.
                Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:receivedOrganization) > 1"
                >Error: e-Referral - 5.1.2 InformationRecipient -
                "InformationRecipient/intendedRecipient/receivedOrganization" -
                The 'receivedOrganization' tag shall appear only once.
                Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:id">

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
                >Error: e-Referral - 5.1.2 InformationRecipient -
                "InformationRecipient/intendedRecipient/id" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


    </pattern>

</schema>

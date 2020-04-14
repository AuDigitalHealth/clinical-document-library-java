<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 5/09/2013 9:54:32 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.3.1.1
                  IG Guide Title     : SERVICE PROVIDER - PERSON
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_SERVICEPROVIDER_7_1_5_3_1_1_and_or_7_1_5_3_1_2_custom-errors"
        id="p-e-Referral_3A_SERVICEPROVIDER_7_1_5_3_1_1_and_or_7_1_5_3_1_2_custom-errors"
        see="#p-e-Referral_3A_SERVICEPROVIDER_7_1_5_3_1_1_and_or_7_1_5_3_1_2_custom-errors">

        <!-- IG page 263 and 269 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer/cda:assignedEntity">

            <assert test="cda:assignedPerson or cda:representedOrganization"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON and/or 7.1.5.3.1.2 SERVICE PROVIDER - ORGANISATION -
                "Service Provider / Participant" -
                The 'assignedPerson' and/or 'representedOrganization' tag is missing.
                Refer to section 7.1.5.3.1.1 and or 7.1.5.3.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:assignedPerson) > 1"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON -
                "Service Provider / Participant" -
                The 'assignedPerson' tag shall appear only once.
                Refer to section 7.1.5.3.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:representedOrganization) > 1"
                >Error: e-Referral - 7.1.5.3.1.2 SERVICE PROVIDER - ORGANISATION -
                "Service Provider / Participant" -
                The 'representedOrganization' tag shall appear only once.
                Refer to section 7.1.5.3.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
        </rule>

        <!-- IG Page 264 and 269 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.20158']/cda:entry/cda:act[@classCode = 'ACT']/cda:performer/cda:assignedEntity[cda:assignedPerson]/cda:addr[@use]">
            
            <!-- AUSTRALIAN OR INTERNATIONAL ADDRESS SHALL be instantiated as an AUSTRALIAN ADDRESS. -->
            
            <assert
                test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: e-Referral - 7.1.5.3.1.1 SERVICE PROVIDER - PERSON and/or 7.1.5.3.1.2 SERVICE PROVIDER - ORGANISATION -
                "Service Provider / Participant / Address" -
                The 'country' tag shall contain the value 'Australia'. Refer to section 7.1.5.3.1.1 and or 7.1.5.3.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
            
        </rule>


    </pattern>

</schema>

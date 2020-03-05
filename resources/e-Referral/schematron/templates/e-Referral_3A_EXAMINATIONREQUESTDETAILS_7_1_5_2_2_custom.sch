<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 4/09/2013 10:48:12 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.2.2
                  IG Guide Title     : EXAMINATION REQUEST DETAILS
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2_custom-errors"
        id="p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2_custom-errors"
        see="#p-e-Referral_3A_EXAMINATIONREQUESTDETAILS_7_1_5_2_2_custom-errors">



        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:entryRelationship/cda:observationMedia">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image" -
                The 'observationMedia' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>


        </rule>

<!-- IG Page 249 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16511']/cda:entryRelationship/cda:act[cda:code/@code = '103.16513']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16515']/cda:value">
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.2.2 EXAMINATION REQUEST DETAILS -
                "Examination Request Details / Image Details / Image View Name" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            </rule>
    </pattern>

</schema>

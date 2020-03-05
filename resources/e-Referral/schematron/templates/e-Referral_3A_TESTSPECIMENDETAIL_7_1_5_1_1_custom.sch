<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 6/09/2013 9:15:51 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.1.1
                  IG Guide Title     : TEST SPECIMEN DETAIL
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_TESTSPECIMENDETAIL_7_1_5_1_1_custom-errors"
        id="p-e-Referral_3A_TESTSPECIMENDETAIL_7_1_5_1_1_custom-errors"
        see="#p-e-Referral_3A_TESTSPECIMENDETAIL_7_1_5_1_1_custom-errors">

        <!-- IG Page 179 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16156.2.2.1']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16171']/cda:value">


            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.1.1 TEST SPECIMEN DETAIL -
                "Test Specimen Detail / Collection and handling / Sampling Preconditions" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            

        </rule>


        <!-- IG Page 197 -->
        <rule context="cda:code[@code = '103.16171' and ancestor::*[cda:code/@code = '102.16156.2.2.1']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:observation[cda:code/@code='102.16156.2.2.1']//cda:code[@code = '103.16171']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:entryRelationship/cda:observation/cda:code[@code = '103.16171'])"
                >Error: e-Referral - 7.1.5.1.1 TEST SPECIMEN DETAIL -
                "Test Specimen Detail / Collection and handling / Sampling Preconditions" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/observation[code/@code = '102.16156.2.2.1']/entryRelationship/observation/code[@code = '103.16171']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>

        <!-- IG Page 198 -->
        <rule context = "cda:code[@code = '103.16529' and ancestor::*[cda:code/@code = '102.16156.2.2.1']]">
            
            
            <assert test="
                count(/cda:ClinicalDocument//cda:observation[cda:code/@code='102.16156.2.2.1']//cda:code[@code = '103.16529']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:entryRelationship/cda:observation/cda:code[@code='103.16529'])"
                >Error: e-Referral - 7.1.5.1.1 TEST SPECIMEN DETAIL -
                "Test Specimen Detail / Handling and Processing / Collection Setting" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/observation[code/@code = '102.16156.2.2.1']/entryRelationship/observation/code[@code = '103.16529']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
        </rule>
        
        <!-- IG Page 198 -->
        <rule context="cda:code[@code = '103.11014' and ancestor::*[cda:code/@code = '102.16156.2.2.1']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:observation[cda:code/@code='102.16156.2.2.1']//cda:code[@code = '103.11014']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:entryRelationship/cda:observation/cda:code[@code='103.11014'])"
                >Error: e-Referral - 7.1.5.1.1 TEST SPECIMEN DETAIL -
                "Test Specimen Detail / Handling and Processing / DateTime Received" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/observation[code/@code = '102.16156.2.2.1']/entryRelationship/observation/code[@code = '103.11014']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>

        <!-- IG Page 199 -->
        <rule context="cda:code[@code = '103.16187' and ancestor::*[cda:code/@code = '102.16156.2.2.1']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:observation[cda:code/@code='102.16156.2.2.1']//cda:code[@code = '103.16187']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:observation[cda:code/@code='102.16156.2.2.1']/cda:entryRelationship/cda:observation/cda:code[@code='103.16187'])"
                >Error: e-Referral - 7.1.5.1.1 TEST SPECIMEN DETAIL -
                "Test Specimen Detail / Identifiers / Parent Specimen Identifier" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/observation[code/@code = '102.16156.2.2.1']/entryRelationship/observation/code[@code = '103.16187']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>
        
    </pattern>

</schema>

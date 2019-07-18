<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 30/08/2013 3:37:31 PM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.2.1
                  IG Guide Title     : IMAGING EXAMINATION RESULT GROUP
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_IMAGINGEXAMINATIONRESULTGROUP_7_1_5_2_1_custom-errors"
        id="p-e-Referral_3A_IMAGINGEXAMINATIONRESULTGROUP_7_1_5_2_1_custom-errors"
        see="#p-e-Referral_3A_IMAGINGEXAMINATIONRESULTGROUP_7_1_5_2_1_custom-errors">


        <!-- IG Page 237 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer">
            
            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group" -
                The 'organizer' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group" -
                The 'organizer' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'BATTERY'"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group" -
                The 'organizer' tag 'classCode' attribute shall contain the value 'BATTERY'.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
       

        <!-- IG Page 238 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@moodCode = 'EVN') and (cda:code/@code != '102.16156.2.2.2')]">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Individual Imaging Examination Result" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Individual Imaging Examination Result" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Individual Imaging Examination Result" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>


            <report test="count(cda:id) > 1"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Individual Imaging Examination Result" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:id"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Individual Imaging Examination Result" -
                The 'id' tag is missing.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>
        

<!-- IG Page 240 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observationMedia">
            
            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Anatomical Location / Anatomical Location Image" -
                The 'observationMedia' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Anatomical Location / Anatomical Location Image" -
                The 'observationMedia' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Anatomical Location / Anatomical Location Image" -
                The 'observationMedia' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>
        
        
           <!--Notes: Further investigation need to be addressed to develop this test.-->
          <!-- <rule context="cda:name[@code = '78615007' and ancestor::*[cda:code/@code = '102.16145']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:section[cda:code/@code='102.16145']//cda:name[@code = '78615007']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16145']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[@classCode = 'OBS']/cda:targetSiteCode/cda:qualifier/cda:name[@code='78615007'])"
                >Error: e-Referral - 7.1.5.2.1 IMAGING EXAMINATION RESULT GROUP -
                "Imaging Examination Result Group / Anatomical Location / Specific Location / Side" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/organizer[@classCode = 'BATTERY']/component/observation[@classCode = 'OBS']/targetSiteCode/qualifier/name[@code = '78615007']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.2.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            </rule>-->
    </pattern>

</schema>

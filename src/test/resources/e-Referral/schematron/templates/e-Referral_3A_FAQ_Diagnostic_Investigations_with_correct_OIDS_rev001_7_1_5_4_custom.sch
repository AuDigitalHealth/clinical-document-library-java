<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4_custom-errors"
        id="p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4_custom-errors"
        see="#p-e-Referral_3A_FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001_7_1_5_4_custom-errors">


       


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" -
                The 'observation' tag 'classCode' attribute shall contain the value 'EVN'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
            <assert test="cda:code or cda:originalText">Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 
                "Undifferentiated Pathology and Radiology Results / Name"
                - The 'code' or 'originalText' tag is missing. Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <report test="count(cda:code) > 1">Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name"
                 The 'code' tag shall appear only once.
                 Refer to section 7.1.5.4 of the
                 e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <report test="count(cda:originalText) > 1">Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Name" The 'originalText' tag shall appear only once.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>


        </rule>


    

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16029']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">
      

            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 -
                "Undifferentiated Pathology and Radiology Results / Report Status" -
                The 'value' tag 'xsi:type' attribute shall contain
                the value 'CD' or 'CE'.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>


        </rule>



        <rule context = "cda:code[@code = '308552006' and ancestor::*[cda:code/@code = '102.16029']]">
            
            
            <assert test="
                count(/cda:ClinicalDocument//cda:section[cda:code/@code = '102.16029']//cda:code[@code = '308552006']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/
                cda:component/cda:section[cda:code/@code = '102.16029']/
                cda:entry/cda:observation[@classCode = 'OBS']/
                cda:entryRelationship/cda:observation/cda:code[@code = '308552006'])"
                >Error: e-Referral - 7.1.5.4 FAQ_Diagnostic_Investigations_with_correct_OIDS_rev001 - The
                "/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16145']/entry/observation[@classCode = 'OBS']/entryRelationship/observation/code[@code = '308552006']"
                path - 1 or more tags are missing.
                Refer to section 7.1.5.4 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        
        </rule>   
            

    </pattern>

</schema>

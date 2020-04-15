<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/08/2013 10:05:11 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.1.2
                  IG Guide Title     : PATHOLOGY TEST RESULT GROUP
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2_custom-errors"
        id="p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2_custom-errors"
        see="#p-e-Referral_3A_PATHOLOGYTESTRESULTGROUP_7_1_5_1_2_custom-errors">



        
        <!-- IG Page 206-->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer">
            
            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'BATTERY'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group" -
                The 'organizer' tag 'classCode' attribute shall contain the value 'BATTERY'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>
        
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[@moodCode = 'EVN']">
            
            <!-- Anatomical Location Image and physical Details > Image has some elements 
                IG Page 206 
                Notes: This test can not be generated by SMT, as it maybe difficult to remove 'cda:code' as a condition out from rule context statement. 
            -->
            
            <assert test="cda:code"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Name" -
                The 'code' tag is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="@classCode"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            </rule>
        
        
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[@moodCode = 'EVN']/cda:value">
            
            <!-- IG Page 206 -->
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or  
                normalize-space(@xsi:type) = 'PQ' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'PQ') or 
                normalize-space(@xsi:type) = 'BL' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'BL') or 
                normalize-space(@xsi:type) = 'ST' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'ST') or 
                normalize-space(@xsi:type) = 'INT' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'INT') or 
                normalize-space(@xsi:type) = 'RTO' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'RTO') or 
                normalize-space(@xsi:type) = 'IVL_PQ' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'IVL_PQ') or 
                normalize-space(@xsi:type) = 'PPD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'PPD')"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Value" -
                The 'value' tag 'xsi:type' attributes shall be 'CD', 'PQ', 'BL', 'ST', 'INT', 'RTO', 'IVL_PQ', 'PPD'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            </rule>
        
        
        
        
            
        
        <!-- IG Page 207 - To avoid duplicated coded text issue -->
        <rule context="cda:code[@code = '281296001' and ancestor::*[cda:code/@code = '102.16144']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:section[cda:code/@code='102.16144']//cda:code[@code = '281296001']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code!='102.16156.2.2.2')]/cda:entryRelationship/cda:act/cda:code[@code='281296001'])"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Comment" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.20117']/component/section[code/@code = '102.16144']/entry/observation[@classCode = 'OBS']/entryRelationship/organizer[@classCode = 'BATTERY']/component/observation[(@classCode = 'OBS') and (code/@code != '102.16156.2.2.2')]/entryRelationship/act/code[@code = '281296001']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            </rule>
        
    
        
        <!-- IG Page 209 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:organizer[@classCode = 'BATTERY']/cda:component/cda:observation[(@classCode = 'OBS') and (cda:code/@code != '102.16156.2.2.2')]/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">
           
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.1.2 PATHOLOGY TEST RESULT GROUP -
                "Pathology Test Result Group / Individual Pathology Test Result / Individual Pathology Test Result Status" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            
        </rule>
        
    </pattern>

</schema>
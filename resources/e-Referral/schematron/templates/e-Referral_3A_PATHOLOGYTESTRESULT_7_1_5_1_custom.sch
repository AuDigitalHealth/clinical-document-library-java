<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 6/09/2013 8:36:58 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5.1
                  IG Guide Title     : PATHOLOGY TEST RESULT
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_PATHOLOGYTESTRESULT_7_1_5_1_custom-errors"
        id="p-e-Referral_3A_PATHOLOGYTESTRESULT_7_1_5_1_custom-errors"
        see="#p-e-Referral_3A_PATHOLOGYTESTRESULT_7_1_5_1_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '310074003']/cda:value">
                
                <assert
                    test="
                    not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                    normalize-space(@xsi:type) = 'CD' or
                    (substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                    normalize-space(@xsi:type) = 'CE' or
                    (substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                    >
                    Error: e-Referral - 7.1.5.1 PATHOLOGY TEST RESULT -
                    "Pathology Test Result / Diagnostic Service" -
                    The 'value' tag 'xsi:type' attribute shall contain the
                    value 'CD' or 'CE'.
                    Refer to section 7.1.5.1 of the
                    e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            </rule>

<!-- IG Page 183  -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '308552006']/cda:value">
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / Overall Pathology Test Result Status" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
        
        <!-- IG Page 183 -->
        <rule context="cda:code[@code = '55752-0'  and ancestor::*[cda:code/@code = '102.16144']]">
            
            <assert test="
                count(/cda:ClinicalDocument//cda:section[cda:code/@code='102.16144']//cda:code[@code = '55752-0']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act/cda:code[@code='55752-0'])"
                >Error: e-Referral - 7.1.5.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / ClinicalInformation Provided" -
                The '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.20117']/cda:component/cda:section[cda:code/@code='102.16144']/cda:entry/cda:observation[@classCode='OBS']/cda:entryRelationship/cda:act/cda:code[@code='55752-0']' path -
                1 or more tags are missing.
                Refer to section 7.1.5.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
        </rule>
        
        <!-- IG Page 184 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:observation[cda:code/@code = '88101002']/cda:value">
            
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / Pathological Diagnosis" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
        
        <!-- IG Page 187 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']/cda:component/cda:section[cda:code/@code = '102.16144']/cda:entry/cda:observation[@classCode = 'OBS']/cda:entryRelationship/cda:act[cda:code/@code = '102.16160']/cda:entryRelationship/cda:observation[cda:code/@code = '103.11017']/cda:value">
           
            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: e-Referral - 7.1.5.1 PATHOLOGY TEST RESULT -
                "Pathology Test Result / Test Request Details / Test Requested Name" -
                The 'value' tag 'xsi:type' attribute shall contain the
                value 'CD' or 'CE'.
                Refer to section 7.1.5.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            </rule>
    </pattern>

</schema>

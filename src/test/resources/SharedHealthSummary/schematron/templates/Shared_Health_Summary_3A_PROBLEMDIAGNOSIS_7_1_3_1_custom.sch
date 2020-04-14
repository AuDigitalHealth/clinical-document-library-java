<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Shared Health Summary Clinical Document:  7.1.3.1 Problem / Diagnosis Custom -->

    <!-- Context: ClinicalDocument/ProblemDiagnosis -->


    <!-- Status: Last Reviewed: 20/02/2015
         Status: Last Updated : 20/02/2015 -->



    <pattern name="p-Shared_Health_Summary_3A_PROBLEMDIAGNOSIS_7_1_3_1_custom-errors"
        id="p-Shared_Health_Summary_3A_PROBLEMDIAGNOSIS_7_1_3_1_custom-errors"
        see="#p-Shared_Health_Summary_3A_PROBLEMDIAGNOSIS_7_1_3_1_custom-errors">




        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code='282291009']/cda:value">

            <assert
                test="
                not(@xsi:type) or normalize-space(@xsi:type) = '' or 
                normalize-space(@xsi:type) = 'CD' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CD') or 
                normalize-space(@xsi:type) = 'CE' or
                (substring-before(normalize-space(@xsi:type), ':') != '' and
                substring-after(normalize-space(@xsi:type), ':') = 'CE')"
                >Error: Shared Health Summary - 7.1.3.1 Problem / Diagnosis - "Problem / Diagnosis
                Identification" - The 'value' tag 'xsi:type' attribute shall contain the value 'CD'
                or 'CE'. Refer to section 7.1.3.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>

        <rule  context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code='282291009']/cda:effectiveTime/cda:low">
            
            <assert test="not(@value) or (string-length(@value) &lt;= 8)">Error: Shared Health
                Summary - 7.1.3.1 Problem / Diagnosis - "Problem / Date of Onset" -
                The 'low' tag 'value' attribute shall not include a time. Refer
                to section 7.1.3.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>
        
        
        <rule  context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16117']/cda:entry/cda:observation[cda:code/@code='282291009']/cda:entryRelationship/cda:observation[cda:code/@code='103.15510']/cda:value">
            
            <assert test="not(@value) or (string-length(@value) &lt;= 8)">Error: Shared Health
                Summary - 7.1.3.1 Problem / Diagnosis - "Problem / Date of Resolution/ Remission" -
                The 'value' tag 'value' attribute value shall not include a time. Refer
                to section 7.1.3.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>
        


    </pattern>

</schema>

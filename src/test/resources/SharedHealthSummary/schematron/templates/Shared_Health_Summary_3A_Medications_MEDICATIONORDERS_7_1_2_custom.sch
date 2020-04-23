<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- Shared Health Summary Clinical Document: Medications (MEDICATION ORDERS) -->

    <!-- Context: ClinicalDocument/component/structuredBody -->

    <!-- Status: Last Reviewed: Not Reviewed
         Status: Last Updated : 11/04/2012 -->

    <pattern name="p-Shared_Health_Summary_3A_Medications_MEDICATIONORDERS_7_1_2_custom-errors"
        id="p-Shared_Health_Summary_3A_Medications_MEDICATIONORDERS_7_1_2_custom-errors"
        see="#p-Shared_Health_Summary_3A_Medications_MEDICATIONORDERS_7_1_2_custom-errors">

        <!-- Medications - 1..1 -->

        <!-- structuredBody -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <!-- The below test is as a result of the SCS version 1.1 -->

            <!--
                <assert test="cda:component/cda:section/cda:entry[cda:substanceAdministration/@classCode='SBADM']/cda:substanceAdministration   |
                              cda:component/cda:section/cda:entry[cda:observation/cda:code/@code='103.16302.120.1.2']/cda:observation/cda:code"
            -->
            
            <assert test="cda:component/cda:section[cda:code/@code='101.16146']/cda:entry">
                Error: Shared Health Summary - Medications (MEDICATION ORDERS) -
                The 'component/section[code/@code='101.16146']/entry' tag is missing. 
                Refer to section 7.1.3 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
        </rule>   
            

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16146']">
            
            <assert test="cda:entry[cda:substanceAdministration/@classCode='SBADM'    or
                                    cda:observation/cda:code/@code='103.16302.120.1.2']"
                >Error: Shared Health Summary - Medications (MEDICATION ORDERS) -
                The 'EXCLUSION STATEMENT - MEDICATIONS' or 'KNOWN MEDICATION' is missing.
                There SHALL be either one instance of 'EXCLUSION STATEMENT - MEDICATIONS' OR
                SHALL have one or more instances of 'KNOWN MEDICATION' but there SHALL NOT be both.
                Refer to section 7.1.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="cda:entry/cda:substanceAdministration[@classCode='SBADM'] and cda:entry/cda:observation/cda:code[@code='103.16302.120.1.2']"
                >Error: Shared Health Summary - Medications (MEDICATION ORDERS) - 
                There SHALL be either one
                instance of 'EXCLUSION STATEMENT - MEDICATIONS' OR SHALL have one or more
                instances of 'KNOWN MEDICATION' but there SHALL NOT be both. Refer to section 7.1.2
                of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

    </pattern>

</schema>

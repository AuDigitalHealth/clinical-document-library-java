<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Shared Health Summary Clinical Document:  7.1.4 Immunisations -->

    <!-- Context: ClinicalDocument/component/structuredBody-->

    <!-- Status: Last Reviewed: 26/04/2013
         Status: Last Updated : 26/04/2013 -->


    <pattern name="p-Shared_Health_Summary_3A_IMMUNISATIONS_7_1_4_custom-errors"
        id="p-Shared_Health_Summary_3A_IMMUNISATIONS_7_1_4_custom-errors"
        see="#p-Shared_Health_Summary_3A_IMMUNISATIONS_7_1_4_custom-errors">


        <!-- Immunisations - 1..1 -->
        <!-- component/section - 1..1 -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16638']">

            <!-- The assert below has been written in order to meet the SCS 1.1 updates -->
            <assert
                test="cda:entry[cda:observation/cda:code/@code='103.16302.120.1.5' or cda:substanceAdministration/@classCode='SBADM']"
                >Error: Shared Health Summary - 7.1.4 Immunisations -
                The 'EXCLUSION STATEMENT - IMMUNISATIONS' or 'ADMINISTERED IMMUNISATION' is missing.
                There SHALL be either one instance of 'Exclusion Statement - Immunisations
                (EXCLUSION STATEMENT - MEDICATIONS)' OR SHALL have one or more instances of
                'Administered Immunisation (MEDICATION ACTION)' but there SHALL NOT be both.
                Refer to section 7.1.4 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report
                test="cda:entry/cda:observation/cda:code[@code='103.16302.120.1.5'] and cda:entry/cda:substanceAdministration[@classCode='SBADM']"
                >Error: Shared Health Summary - 7.1.4 Immunisations. There SHALL be either one instance of
                'Exclusion Statement - Immunisations (EXCLUSION STATEMENT - MEDICATIONS)'
                OR SHALL have one or more instances of 'Administered Immunisation (MEDICATION ACTION)'
                but there SHALL NOT be both. Refer to section 7.1.4 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

    </pattern>

</schema>

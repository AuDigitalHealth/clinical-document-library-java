<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Context: ClinicalDocument -->
    <!-- Context: ClinicalDocument/component/structuredBody -->


    <!-- Shared Health Summary Clinical Document: 7.1.1 Adverse Reactions -->


    <!-- Status: Last Reviewed: 26/04/2013
         Status: Last Updated : 26/04/2013  -->


    <pattern name="p-Shared_Health_Summary_3A_ADVERSEREACTIONS_7_1_1_custom-errors"
        id="p-Shared_Health_Summary_3A_ADVERSEREACTIONS_7_1_1_custom-errors"
        see="#p-Shared_Health_Summary_3A_ADVERSEREACTIONS_7_1_1_custom-errors">

        <!-- Adverse Reactions - 1..1 -->
        <!-- component/section - 1..1 -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']">


            <!-- The below test is as a result of the SCS version 1.1 -->

            <assert test="cda:entry">Error: Shared Health Summary - 7.1.1 Adverse Reactions -
                The 'entry' tag is missing. 
                Refer to section 7.1.3 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="cda:entry[cda:act/cda:code/@code='102.15517' or cda:observation/cda:code/@code='103.16302.120.1.1']"
                >Error: Shared Health Summary - 7.1.1 Adverse Reactions -
				The 'ADVERSE REACTIONS' shall have at least one instance of 'ADVERSE REACTION' or
				'EXCLUSION STATEMENT - ADVERSE REACTIONS'.
                There SHALL be either one instance of 'EXCLUSION STATEMENT - ADVERSE REACTIONS' OR
                SHALL have one or more instances of 'ADVERSE REACTION' but there SHALL NOT be both.
                Refer to section 7.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <report
                test="cda:entry/cda:act/cda:code[@code='102.15517'] and cda:entry/cda:observation/cda:code[@code='103.16302.120.1.1']"
                >Error: Shared Health Summary - 7.1.1 Adverse Reactions - There SHALL be either one
                instance of 'EXCLUSION STATEMENT - ADVERSE REACTIONS' OR SHALL have one or more
                instances of 'ADVERSE REACTION' but there SHALL NOT be both. Refer to section 7.1.1
                of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Shared Health Summary Clinical Document:  7.1.4.1 ADMINISTEREDIMMUNISATION -->

    <!-- Context: ClinicalDocument/component/structuredBody-->

    <!-- Status: Last Reviewed: 26/04/2013
         Status: Last Updated : 26/04/2013 -->


    <pattern name="p-Shared_Health_Summary_3A_AdministeredImmunisation_MEDICATIONACTION_7_1_4_1_custom-errors"
        id="p-Shared_Health_Summary_3A_AdministeredImmunisation_MEDICATIONACTION_7_1_4_1_custom-errors"
        see="#p-Shared_Health_Summary_3A_AdministeredImmunisation_MEDICATIONACTION_7_1_4_1_custom-errors">


        <rule context="cda:section[cda:code/@code = '101.16638']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <!-- checking parent path -->

            <assert
                test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16638']/cda:entry/cda:substanceAdministration[@classCode='SBADM']"
                >Error: Shared Health Summary - 7.1.4.1 Administered Immunisation - The
                '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16638']/entry/substanceAdministration[@classCode='SBADM']' path -
                1 or more tags are missing. Refer to section 7.1.4.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>
        
    </pattern>

</schema>

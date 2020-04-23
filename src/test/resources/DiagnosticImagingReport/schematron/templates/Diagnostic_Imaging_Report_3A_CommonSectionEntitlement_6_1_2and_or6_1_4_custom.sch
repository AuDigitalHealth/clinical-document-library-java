<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom-errors"
        id="p-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom-errors"
        see="#p-Diagnostic_Imaging_Report_3A_CommonSectionEntitlement_6_1_2and_or6_1_4_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant[ext:participantRole/@classCode = 'ASSIGNED']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 6.1.2 and_or 6.1.4 Common Section Entitlement -
                "Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute is missing.
                Refer to section 6.1.2 and_or 6.1.4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 6.1.2 and_or 6.1.4 Common Section Entitlement -
                "Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute shall contain a value.
                Refer to section 6.1.2 and_or 6.1.4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'HLD'"
                >Error: Diagnostic Imaging Report - 6.1.2 and_or 6.1.4 Common Section Entitlement -
                "Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute shall contain the value 'HLD'.
                Refer to section 6.1.2 and_or 6.1.4 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

         

        </rule>


    </pattern>

</schema>

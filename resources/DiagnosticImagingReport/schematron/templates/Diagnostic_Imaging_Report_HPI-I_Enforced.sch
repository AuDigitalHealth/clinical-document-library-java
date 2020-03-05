<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_HPI-I_Enforced-errors"
        id="p-Diagnostic_Imaging_Report_HPI-I_Enforced-errors"
        see="#p-Diagnostic_Imaging_Report_HPI-I_Enforced-errors">

        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:code[not(@nullFlavor='NI')]]/cda:assignedPerson |
                /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson[not(ext:asEntityIdentifier/ext:id/@extension='NI')] |
                /cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson[not(cda:name/cda:family/@nullFlavor='NI')] |
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor[cda:code[not(@nullFlavor='NI')]]/cda:assignedPerson |
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson[not(ext:asEntityIdentifier/ext:id/@extension='NI')] |
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:assignedPerson[not(cda:name/cda:family/@nullFlavor='NI')]">

            <assert
                test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800361')]"
                >Error: Diagnostic Imaging Report - 6.1.2 Document Author and 7.1.1.2 REPORTING
                RADIOLOGIST - The 'asEntityIdentifier' tag with a HPI-I is missing. Refer to "023476
                Identifier for Document Author OR 025065 When the document author is not one person
                OR 023553 Identifier for Reporting Radiologist OR 025076 Multiple reporting
                radiologists" of
                eHealth_Diagnostic_Imaging_Report_My_Health_Record_Conformance_Profile_v1.1 AND
                "section 6.1.2 Document Author OR section 7.1.1.2 REPORTING RADIOLOGIST" of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>

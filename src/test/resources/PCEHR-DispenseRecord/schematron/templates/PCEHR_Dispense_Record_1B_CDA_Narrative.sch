<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns = "http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- PCEHR Dispense Record Clinical Document: CDA Text Narrative -->

    <!-- Context: ClinicalDocument/component/structuredBody -->

    <!-- Status: Last Reviewed:
         Status: Last Updated : 06/11/2012 -->

    <pattern name = "p-PCEHR_Dispense_Record_1B_CDA_Narrative-errors"
        id = "p-PCEHR_Dispense_Record_1B_CDA_Narrative-errors"
        see = "#p-PCEHR_Dispense_Record_1B_CDA_Narrative-errors">


<!--    /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']-->
        <rule context = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section">

            <report test = "cda:title and normalize-space(cda:title) = ''"
                >Error: PCEHR Dispense Record -
                The 'title' tag shall contain a value. Refer to sections of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test = "count(cda:title) > 1"
                >Error: PCEHR Dispense Record -
                The 'title' tag shall appear only once. Refer to sections of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test = "cda:text and (
                (cda:text/child::* and not(
                    (name(cda:text/child::*) = 'content')          or
                    (name(cda:text/child::*) = 'footnote')         or
                    (name(cda:text/child::*) = 'footnoteRef')      or
                    (name(cda:text/child::*) = 'linkHtml')         or
                    (name(cda:text/child::*) = 'list')             or
                    (name(cda:text/child::*) = 'paragraph')        or
                    (name(cda:text/child::*) = 'renderMultiMedia') or
                    (name(cda:text/child::*) = 'sub')              or
                    (name(cda:text/child::*) = 'sup')              or
                    (name(cda:text/child::*) = 'table')
                    )
                ) or (not(cda:text/child::*) and normalize-space(cda:text) = ''))"
                >Error: PCEHR Dispense Record -
                The 'text' tag shall contain a value for narrative content. Refer to sections of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test = "count(cda:text) > 1">Error: PCEHR Dispense Record -
                The 'text' tag shall appear only once. Refer to sections of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

    </pattern>

</schema>

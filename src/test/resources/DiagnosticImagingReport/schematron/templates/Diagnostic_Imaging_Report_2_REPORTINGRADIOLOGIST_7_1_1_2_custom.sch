<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"
        id="p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"
        see="#p-Diagnostic_Imaging_Report_2_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/cda:author/cda:assignedAuthor/cda:addr">
            
            <assert test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Address" -
                The 'country' tag shall contain the value 'Australia'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



    </pattern>

</schema>

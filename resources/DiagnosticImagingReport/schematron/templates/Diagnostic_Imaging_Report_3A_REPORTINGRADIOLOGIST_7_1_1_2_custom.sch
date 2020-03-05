<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 11/03/2014 3:52:06 PM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.1.2
                  IG Guide Title     : REPORTING RADIOLOGIST
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"
        id="p-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors"
        see="#p-Diagnostic_Imaging_Report_3A_REPORTINGRADIOLOGIST_7_1_1_2_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16945']/ext:coverage2/ext:entitlement/ext:participant[ext:participantRole/@classCode = 'ASSIGNED']">

            <assert test="@typeCode"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute is missing.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute shall contain a value.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'HLD'"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST Participant / Entitlement" -
                The 'participant' tag 'typeCode' attribute shall contain the value 'HLD'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

         

        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:id">
            
            <report
                test="@root and
                normalize-space(@root) != '' and
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='ASSIGNED']/ext:id/@root and
                normalize-space(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='ASSIGNED']/ext:id/@root) != '' and
                @root != /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='ASSIGNED']/ext:id/@root"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST - "REPORTING RADIOLOGIST / id OR
                REPORTING RADIOLOGIST / Participant / Entitlement / id" - The 'ext:id' tag 'root'
                attribute shall be as
                '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='ASSIGNED']/ext:id/@root'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:addr">


            <report test="
                @use and normalize-space(@use) != '' and not(@use = 'WP')"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Address" -
                The 'addr' tag 'use' attribute shall be set to Business see AS 5017-2006: HealthCare Client Identifier Address Purpose.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            <assert
                test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST - "REPORTING RADIOLOGIST /
                Participant / Address" - The 'country' tag shall contain the value 'Australia'.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
        
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16945']/cda:author/cda:assignedAuthor/cda:telecom">
            
        
            <assert test = "not(@use) or normalize-space(@use) = '' or  @use='WP' "
                >Error: Diagnostic Imaging Report - 7.1.1.2 REPORTING RADIOLOGIST -
                "REPORTING RADIOLOGIST / Participant / Electronic Communication Detail" -
                The 'telecom' tag 'use' attribute shall be set to Workplace see HL7 v3: TelecommunicationAddressUse.
                Refer to section 7.1.1.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>


        </rule>
        
        
    </pattern>

</schema>

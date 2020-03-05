<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Pathology_Report_DocumentAuthor_6_1_2_custom-errors"
        id="p-Pathology_Report_DocumentAuthor_6_1_2_custom-errors"
        see="#p-Pathology_Report_DocumentAuthor_6_1_2_custom-errors">        
        
        
        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:addr">
            
            <assert
                test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Pathology Report - 6.1.2 Document Author- "Document Author / Participant /
                Address" - The 'country' tag shall contain the value 'Australia'. Refer to section
                6.1.2 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            
            <report test="
                @use and normalize-space(@use) != '' and not(@use = 'WP')"
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Address" -
                The 'addr' tag 'use' attribute shall be set to Business see AS 5017-2006: HealthCare Client Identifier Address Purpose.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
            
        </rule>
        
       
        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:telecom">
            
            <assert test = "not(@use) or normalize-space(@use) = '' or  @use='WP' "
                >Error: Pathology Report - 6.1.2 Document Author -
                "Document Author / Participant / Electronic Communication Detail" -
                The 'telecom' tag 'use' attribute shall be set to Workplace see HL7 v3: TelecommunicationAddressUse.
                Refer to section 6.1.2 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>
            
        </rule>
        
        


    </pattern>

</schema>

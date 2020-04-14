<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- e-Referral Clinical Document:  6.1.1 DOCUMENT AUTHOR Custom -->

    <!-- Context: ClinicalDocument/DOCUMENT AUTHOR -->

    <!-- Status: Last Reviewed: 
        Status: Last Updated : 13/09/2013 -->

    <pattern name="p-e-Referral_DOCUMENTAUTHOR_6_1_1_custom-errors"
        id="p-e-Referral_DOCUMENTAUTHOR_6_1_1_custom-errors"
        see="#p-e-Referral_DOCUMENTAUTHOR_6_1_1_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:addr">

            <!-- Address - country -  0..1 -->

            <assert
                test="not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: e-Referral - 6.1.1 Document Author - "Document Author / Participant /
                Address / Australia or International Address / International Address / Country" -
                The 'country' tag shall contain the value 'Australia'. Refer to section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <report
                test="
                @use and normalize-space(@use) != '' and not(@use = 'WP')"
                >Error: e-Referral - 6.1.1 Document Author - "Document Author / Participant /
                Address" - The 'addr' tag 'use' attribute shall be set to Business see AS 5017-2006:
                HealthCare Client Identifier Address Purpose. Refer to Requirement id 026505 Document author's individual address of the Discharge_Summary_PCEHR_Conformance_Profile_v1.6 and  section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>

       
        
        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:telecom">
            
            <assert test="not(@use) or normalize-space(@use) = '' or  @use='WP' ">Error: e-Referral - 6.1.1 Document Author - "Document Author / Participant / Electronic
                Communication Detail" - The 'telecom' tag 'use' attribute shall be set to Workplace
                see HL7 v3: TelecommunicationAddressUse. Refer to Requirement id 026506 Document author's individual electronic communication detail of the Discharge_Summary_PCEHR_Conformance_Profile_v1.6 and  section 6.1.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>
   
       
    </pattern>

</schema>

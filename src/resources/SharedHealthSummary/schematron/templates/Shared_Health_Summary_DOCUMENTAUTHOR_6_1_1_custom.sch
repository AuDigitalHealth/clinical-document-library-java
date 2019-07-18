<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Shared Health Summary Clinical Document:  6.1.1 DOCUMENT AUTHOR Custom -->

    <!-- Context: ClinicalDocument/DOCUMENT AUTHOR -->

    <!-- Status: Last Reviewed: 
        Status: Last Updated : 12/01/2015 -->



    <pattern name="p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom-errors"
        id="p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom-errors"
        see="#p-Shared_Health_Summary_DOCUMENTAUTHOR_6_1_1_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:addr">

            <!-- Address - country -  0..1 -->

            <assert
                test="not(cda:country) or document ('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Shared Health Summary - 6.1.1 Document Author - "Document Author /
                Participant / Address / Australia or International Address / International Address /
                Country" - The 'country' tag shall contain the value 'Australia'. Refer to section
                6.1.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            <report test="
                @use and normalize-space(@use) != '' and not(@use = 'WP')"
                >Error: Shared Health Summary - 6.1.1 Document Author -
                "Document Author / Participant / Address" -
                The 'addr' tag 'use' attribute shall be set to Business see AS 5017-2006: HealthCare Client Identifier Address Purpose.
                Refer to 024982 Confirm individual address to include of COMMON-ConformProfileClinDoc-v1.6 and section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor[cda:assignedPerson]/cda:telecom">
            
            <assert test = "not(@use) or normalize-space(@use) = '' or  @use='WP' "
                >Error: Shared Health Summary - 6.1.1 Document Author -
                "Document Author / Participant / Electronic Communication Detail" -
                The 'telecom' tag 'use' attribute shall be set to Workplace see HL7 v3: TelecommunicationAddressUse.
                Refer to 024980 Confirm individual electronic communication details to include of COMMON-ConformProfileClinDoc-v1.6 and section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson/ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:addr">

            <!-- Address - country -  0..1 -->

            <assert
                test="not(cda:country) or document ('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: Shared Health Summary - 6.1.1 Document Author - "DOCUMENT AUTHOR /
                Participant / Person or Organisation or Device / Person / Employment Detail /
                Employer Organisation / Address / Australia or International Address / International
                Address / Country" - The 'country' tag shall contain the value 'Australia'. Refer to
                section 6.1.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>
        
      
        
       </pattern>


</schema>

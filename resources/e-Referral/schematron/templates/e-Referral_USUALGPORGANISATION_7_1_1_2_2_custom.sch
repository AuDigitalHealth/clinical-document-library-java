<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom-errors"
        id="p-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom-errors"
        see="#p-e-Referral_USUALGPORGANISATION_7_1_1_2_2_custom-errors">
 
        <rule context="/cda:ClinicalDocument/cda:participant[@typeCode = 'PART']/cda:associatedEntity[cda:scopingOrganization]/cda:addr">
            
            <assert test="document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'"
                >Error: e-Referral - 7.1.1.2.2 USUAL GP ORGANISATION - "Usual GP / Participant / Address /
                Australia or International Address / International Address / Country" - The
                'country' tag shall contain the value 'Australia'. Refer to section 7.1.1.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>    
            
        </rule>

    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_InformationRecipient_5_1_2_custom-errors"
        id="p-e-Referral_InformationRecipient_5_1_2_custom-errors"
        see="#p-e-Referral_InformationRecipient_5_1_2_custom-errors">

        <rule context="/cda:ClinicalDocument/cda:informationRecipient">

            <assert
                test="not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode='PRCP' or @typeCode='TRC'"
                >Error: e-Referral - 5.1.2 InformationRecipient - "InformationRecipient" - The
                'informationRecipient' tag 'typeCode' attribute shall contain the value 'PRCP' or
                'TRC'. Refer to section 5.1.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>


        </rule>

    </pattern>

</schema>

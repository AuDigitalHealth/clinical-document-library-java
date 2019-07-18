<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 10/09/2013 11:30:15 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.4.1
                  IG Guide Title     : ADVERSE REACTION
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_ADVERSEREACTION_7_1_4_1_custom-errors"
        id="p-e-Referral_3A_ADVERSEREACTION_7_1_4_1_custom-errors"
        see="#p-e-Referral_3A_ADVERSEREACTION_7_1_4_1_custom-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20113']/cda:entry/cda:act[cda:code/@code = '102.15517']/cda:entryRelationship/cda:observation[cda:code/@code = '102.16474']/cda:entryRelationship/cda:observation">
            
            <assert test="@classCode"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: e-Referral - 7.1.4.1 ADVERSE REACTION -
                "Adverse Reaction / Reaction Event / Manifestation" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 7.1.4.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>
        


    </pattern>

</schema>

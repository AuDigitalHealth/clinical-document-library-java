<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                                                                                                                                        
                  __________________________________________

                  Created            : 11/09/2013 11:39:40 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v2.3
                  IG Guide Reference : 7.1.3.1
                  IG Guide Title     : MEDICATION INSTRUCTION
                 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1_custom-errors"
        id="p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1_custom-errors"
        see="#p-e-Referral_3A_MEDICATIONINSTRUCTION_7_1_3_1_custom-errors">


      

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']/cda:entry/cda:substanceAdministration[@moodCode = 'EVN']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'classCode' attribute is missing.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SBADM'"
                >Error: e-Referral - 7.1.3.1 MEDICATION INSTRUCTION -
                "Medication Instruction" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain the value 'SBADM'.
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

         

        </rule>
        
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16146']">
            
            <report test="cda:entry[cda:substanceAdministration/@classCode = 'SBADM'] and  cda:entry[cda:observation/cda:code/@code = '103.16302.2.2.1']">
                Error: e-Referral - 7.1.3 MEDICATIONS  -
                "Medications" -
                There SHALL be either one
                instance of 'EXCLUSION STATEMENT - MEDICATIONS' OR SHALL have one or more
                instances of 'MEDICATION INSTRUCTION' but there SHALL NOT be both..
                Refer to section 7.1.3.1 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            
            </rule>

    </pattern>

</schema>

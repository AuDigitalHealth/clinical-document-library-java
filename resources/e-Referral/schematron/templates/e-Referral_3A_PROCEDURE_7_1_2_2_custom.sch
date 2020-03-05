<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                                                                                                                                            
                  __________________________________________

                  Created            : 10/09/2013 9:33:35 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.2.2
                  IG Guide Title     : PROCEDURE
                 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_3A_PROCEDURE_7_1_2_2_custom-errors"
        id="p-e-Referral_3A_PROCEDURE_7_1_2_2_custom-errors"
        see="#p-e-Referral_3A_PROCEDURE_7_1_2_2_custom-errors">
 


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16117']/cda:entry/cda:procedure[@moodCode = 'EVN']">

            <assert test="@classCode"
                >Error: e-Referral - 7.1.2.2 PROCEDURE -
                "Procedure" -
                The 'procedure' tag 'classCode' attribute is missing.
                Refer to section 7.1.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Referral - 7.1.2.2 PROCEDURE -
                "Procedure" -
                The 'procedure' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'PROC'"
                >Error: e-Referral - 7.1.2.2 PROCEDURE -
                "Procedure" -
                The 'procedure' tag 'classCode' attribute shall contain the value 'PROC'.
                Refer to section 7.1.2.2 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

           

        </rule>


    </pattern>

</schema>

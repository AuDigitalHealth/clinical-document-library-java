<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 11-10-2013 14:21:55

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.5
                  IG Guide Title     : DIAGNOSTIC INVESTIGATIONS
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom-errors"
        id="p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom-errors"
        see="#p-e-Referral_2_DIAGNOSTICINVESTIGATIONS_7_1_5_custom-errors">




        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.20117']">


            <!--   
                Each instance of this section SHALL have at least one instance of 'PATHOLOGY
                TEST RESULT' OR 'IMAGING EXAMINATION RESULT' OR 'Requested Service
                (REQUESTED SERVICE)' OR 'Diagnostic Investigation'. (SCS requirement and FAQ Requirement)-->
            
            
            <assert
                test="cda:component/cda:section/cda:code[@code='102.16144'] | cda:component/cda:section/cda:code[@code='102.16145'] | cda:component/cda:section/cda:code[@code='102.20158'] | cda:component/cda:section/cda:code[@code='102.16029']"
                >Error: e-Referral - 7.1.5 Diagnostic Investigations - Each instance of 'Diagnostic
                Investigations' section SHALL have at least one instance of 'Pathology Test Result'
                or 'Imaging Examination Result' or 'Requested Service' or 'Diagnostic Investigation'. Refer to section 7.1.5 of
                the e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            

        </rule>


      

    </pattern>

</schema>

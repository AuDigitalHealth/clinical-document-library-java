<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    <!-- Pathology Report Clinical Document:  6.1.1 Subject of Care Custom -->

    <!-- Context: ClinicalDocument/Subject of Care -->

    <pattern name="p-Pathology_Report_SUBJECTOFCARE_6_1_1_custom-errors"
        id="p-Pathology_Report_SUBJECTOFCARE_6_1_1_custom-errors"
        see="#p-Pathology_Report_SUBJECTOFCARE_6_1_1_custom-errors">
        
      
        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr">


            <!-- Country of Birth - 0..1 -->

            <report
                test="cda:country and not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[(@code = current()/cda:country) or (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])"
                >Error: Pathology Report - 6.1.1 Subject of Care - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / Country of Birth" - The
                'country' tag shall contain a value as per the Australia Bureau of Statistics,
                Standard Australian Classification of Countries SACC) Cat. No. 1269. Refer to
                section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>


            <!-- State/Territory of Birth - 0..1 -->

            <report
                test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:state and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[(@code = current()/cda:state)])"
                >Error: Pathology Report - 6.1.1 Subject of Care - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / State/Territory of Birth" -
                The 'state' tag shall be coded as per AS 5017-2006 Australian State/Territory
                Identifier - Postal. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>



        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient">


            <!-- Birth Order - 0..1 -->

            <report
                test="(ext:multipleBirthInd[@value='true'] and not(ext:multipleBirthOrderNumber))"
                >Error: Pathology Report - 6.1.1 Subject Of Care - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / Birth Order" - The
                'multipleBirthOrderNumber' tag is missing for the existence of 'BirthOrder'. Refer
                to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(ext:multipleBirthInd[@value='false'] and (ext:multipleBirthOrderNumber))"
                >Error: Pathology Report - 6.1.1 Subject Of Care - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / Birth Order" - The
                'multipleBirthOrderNumber' tag shall not be present for the missing of 'BirthOrder'.
                Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>


            <!-- Date of Death - 0..1 -->

            <report test="(ext:deceasedInd[@value='true'] and not(ext:deceasedTime))">Error:
                Pathology Report - 6.1.1 Subject Of Care - "Subject of Care / Participant / Person or
                Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of
                Death" - The 'deceasedTime' tag is missing for the existence of 'deceasedInd=true'.
                Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="(ext:deceasedInd[@value='false'] and (ext:deceasedTime))">Error:
                Pathology Report - 6.1.1 Subject Of Care - "Subject of Care / Participant / Person or
                Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of
                Death" - The 'deceasedTime' tag shall not be present for the missing of
                'deceasedInd=false'. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:multipleBirthInd">


            <assert test="@value or @nullFlavor">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthInd' tag shall have at least the
                'nullFlavor' or 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and @nullFlavor='NA'">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthInd' tag shall not have both the
                'nullFlavor=NA' and 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>



           
            <report
                test="@value and @value != 'true' and @value != 'false'"
                >Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / Birth Order" - The
                'multipleBirthInd' tag 'value' attribute shall contain the value 'true' or 'false'.
                Refer to section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:multipleBirthOrderNumber">


            <assert test="@value or @nullFlavor">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag shall have at
                least the 'nullFlavor' or 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and @nullFlavor='NA'">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag shall not have
                both the 'nullFlavor=NA' and 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and not(number(@value))">Error: Pathology Report - 6.1.1 SUBJECT OF CARE
                - "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag 'value'
                attribute shall be an integer value. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and number(@value) and not(floor(@value) = number(@value))">Error:
                Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person or
                Organisation or Device / Person / Demographic Data / Birth Order" - The
                'multipleBirthOrderNumber' tag 'value' attribute shall be an integer value. Refer to
                section 6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and (@value) &lt; 1">Error: Pathology Report - 6.1.1 SUBJECT OF CARE
                - "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag 'value'
                attribute shall be an integer greater than equal to 1. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:deceasedInd">


            <assert test="@value or @nullFlavor">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedInd' tag
                shall have at least the 'nullFlavor' or 'value' attribute. Refer to section 6.1.1 of
                the Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and @nullFlavor='NA'">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedInd' tag
                shall not have both the 'nullFlavor=NA' and 'value' attribute. Refer to section
                6.1.1 of the Pathology_Report_CDA_Implementation_Guide_v1.0.</report>



           
            <report
                test="@value and  @value != 'true' and  @value != 'false'"
                >Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / Participant / Person
                or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date
                of Death" - The 'deceasedInd' tag 'value' attribute shall contain the value 'true'
                or 'false'. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>



        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:deceasedTime">


            <assert test="@value or @nullFlavor">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'deceasedTime' tag shall have at least the
                'nullFlavor' or 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and @nullFlavor='NA'">Error: Pathology Report - 6.1.1 SUBJECT OF CARE -
                "Subject of Care / Participant / Person or Organisation or Device / Person /
                Demographic Data / Birth Order" - The 'deceasedTime' tag shall not have both the
                'nullFlavor=NA' and 'value' attribute. Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- IG Page 52 -->
        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:id">
            
            <report
                test="@root and
                normalize-space(@root) != '' and
                /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='PAT']/ext:id/@root and
                normalize-space(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='PAT']/ext:id/@root) != '' and
                @root != /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='PAT']/ext:id/@root"
                >Error: Pathology Report - 6.1.1 SUBJECT OF CARE - "Subject of Care / id 
                OR Subject of Care / Participant / Entitlement / id" - The
                'ext:id' tag 'root' attribute shall be as '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole[@classCode='PAT']/ext:id/@root'.
                Refer to section 6.1.1 of the
                Pathology_Report_CDA_Implementation_Guide_v1.0.</report>
            
        </rule>

      


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>



    <pattern name="p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1_custom-errors"
        id="p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1_custom-errors"
        see="#p-PCEHR_Prescription_Record_3A_PrescriptionItem_MEDICATIONINSTRUCTION_7_1_1_custom-errors">



      <!-- 21/09/2012 : RS - This test is added because of the duplication of rule context for substanceAdministration and hence also to
          test the existence of classcode which is part of the rule context in the original file -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration">

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0</assert>

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SBADM'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION)" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain the value 'SBADM'.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>
        </rule>


        <!-- 21/09/2012 : RS - This test is added because of the duplication of rule context for supply and hence
        test the existence of classcode which was part of the rule context in the original file -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode='SBADM']/
                        cda:entryRelationship/cda:supply">

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'classCode' attribute shall contain a value.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0</assert>

            <assert test="@classCode"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'classCode' attribute is missing.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SPLY'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING" -
                The 'supply' tag 'classCode' attribute shall contain the value 'SPLY'.
                Refer to section 7.1.1 of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- 04/10/2012 : RS - This test is added because all code tag code attributes are suppressed within the generator database being part of the rule context
            and ext:code is a one off case for NOT being Global -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode='SBADM']/
                        cda:entryRelationship/cda:supply[@classCode='SPLY']/
                        ext:subjectOf2/ext:substitutionPermission/ext:code">

            <assert test="@code"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / Brand Substitution Permitted" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode='SBADM']/
                        cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / Therapeutic Good Identification" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / Therapeutic Good Identification" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

          
        </rule>

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode='SBADM']/
                        cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / Form" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / Form" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode='SBADM']/
                        cda:routeCode">

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / AdministrationDetail / Route" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION ACTION) -
                "Prescription Item / AdministrationDetail / Route" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>



   

        <!--The below test is added to accomadate the namespace inclusion for PIVL_TS 29/11/2012 -->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/
                        cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/
                        cda:entryRelationship/cda:supply[@classCode = 'SPLY']/
                        cda:effectiveTime">

            <assert test="
                not(@xsi:type) or
                normalize-space(@xsi:type) = '' or
                substring-after(@xsi:type,':') = 'PIVL_TS' or
                @xsi:type = 'PIVL_TS'"
                >Error: PCEHR Prescription Record - 7.1.1 Prescription Item (MEDICATION INSTRUCTION) -
                "Prescription Item (MEDICATION INSTRUCTION) / DISPENSING / Minimum Interval Between Repeats" -
                The 'effectiveTime' tag 'xsi:type' attribute shall contain the value 'PIVL_TS'.
                Refer to section 7.1.1 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>

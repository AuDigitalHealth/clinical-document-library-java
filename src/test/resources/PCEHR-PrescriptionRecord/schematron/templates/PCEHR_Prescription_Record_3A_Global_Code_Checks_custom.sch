<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Prescription_Record_3A_Global_Code_Checks_custom-errors"
        id="p-PCEHR_Prescription_Record_3A_Global_Code_Checks_custom-errors"
        see="#p-PCEHR_Prescription_Record_3A_Global_Code_Checks_custom-errors">


        <!--ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[calc_age]/observation/code/@code="103.16233"
            ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[calc_age]/observation/code/@displayName="Date of Birth is Calculated From Age"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH IS CALCULATED FROM AGE') or (@code = '103.16233')]]">

            <assert test="cda:code[@code = '103.16233']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16233'. Refer to section
                '6.1.1 Date of Birth is Calculated From Age' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH IS CALCULATED FROM AGE']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Date of Birth is Calculated From Age'. Refer to
                section "6.1.1 Date of Birth is Calculated From Age' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!--ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[dob_acc]/observation/code/@code="102.16234"
            ClinicalDocument/component/structuredBody/component[admin_obs]/sectionentry[dob_acc]/observation/code/@displayName="Date of Birth Accuracy Indicator"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH ACCURACY INDICATOR') or (@code = '102.16234')]]">

            <assert test="cda:code[@code = '102.16234']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '102.16234'. Refer to section
                '6.1.1 Date of Birth Accuracy Indicator' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH ACCURACY INDICATOR']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Date of Birth Accuracy Indicator'. Refer to
                section '6.1.1 Date of Birth Accuracy Indicator' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!--ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[age]/observation/code/@code="103.20109"
            ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[age]/observation/code/@displayName="Age"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE') or (@code = '103.20109')]]">

            <assert test="cda:code[@code = '103.20109']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.20109'. Refer to section
                '6.1.1 Age' of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Age'. Refer to section 6.1.1 Age' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!--ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[age_acc]/observation/code/@code="103.16279"
            ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[age_acc]/observation/code/@displayName="Age Accuracy Indicator"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE ACCURACY INDICATOR') or (@code = '103.16279')]]">

            <assert test="cda:code[@code = '103.16279']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16279'. Refer to section
                '6.1.1 Age Accuracy Indicator' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE ACCURACY INDICATOR']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Age Accuracy Indicator'. Refer to section '6.1.1
                Age Accuracy Indicator' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>



        <!--ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[brth_plr]/observation/code/@code="103.16249"
            ClinicalDocument/component/structuredBody/component[admin_obs]/section/entry[brth_plr]/observation/code/@displayName="Birth Plurality"-->

        <rule
            context=" /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'BIRTH PLURALITY') or (@code = '103.16249')]]">

            <assert test="cda:code[@code = '103.16249']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16249'. Refer to section
                '6.1.1 Birth Plurality' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'BIRTH PLURALITY']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Birth Plurality'. Refer to section '6.1.1 Birth
                Plurality' of the PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

         <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[strength]/act/code/@code="103.16769.170.1.1"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[strength]/act/code/@displayName="Therapeutic Good Strength"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC GOOD STRENGTH') 
            or (@code = '103.16769.170.1.1')]]">
            
            <assert test="cda:code[@code = '103.16769.170.1.1']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16769.170.1.1'. Refer to section
                '7.1.1 Therapeutic Good Strength' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'THERAPEUTIC GOOD STRENGTH']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Therapeutic Good Strength'. Refer to section
                '7.1.1 Therapeutic Good Strength' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
        
         <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[form]/act/code/@code="103.16272"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[form]/act/code/@displayName="Formula"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA') 
            or (@code = '103.16272')]]">
            
            <assert test="cda:code[@code = '103.16272']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16272'. Refer to section
                '7.1.1 Formula' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'FORMULA']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Formula'. Refer to section
                '7.1.1 Formula' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
        
        
        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[reason]/act/code/@code="103.10141"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[reason]/act/code/@displayName="Reason for Therapeutic Good"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='REASON FOR THERAPEUTIC GOOD') 
            or (@code = '103.10141')]]">

            <assert test="cda:code[@code = '103.10141']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.10141'. Refer to section
                '7.1.1 Clinical Indication' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'REASON FOR THERAPEUTIC GOOD']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Reason for Therapeutic Good'. Refer to section
                '7.1.1 Clinical Indication' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[cmts]/act/code/@code="103.16044"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[cmts]/act/code/@displayName="Additional Comments"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS') 
            or (@code = '103.16044')]]">

            <assert test="cda:code[@code = '103.16044']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.16044'. Refer to section
                '7.1.1 Comment (Medication Instruction Comment)' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADDITIONAL COMMENTS']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Additional Comments'. Refer to section
                '7.1.1 Comment (Medication Instruction Comment)' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[sply]/supply/entryRelationship[qty_desc]/act/code/@code='246205007'
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[sply]/supply/entryRelationship[qty_desc]/act/code/@displayName='QUANTITY'-->
                                                                                                                      
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY') 
            or (@code = '246205007')]]">

            <assert test="cda:code[@code = '246205007']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '246205007'. Refer to section
                '7.1.1 Quantity Description' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'QUANTITY']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'QUANTITY'. Refer to section
                '7.1.1 Quantity Description' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[sply]/supply/ext:subjectOf2/ext:substitutionPermission/ext:code/@code="TE"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[sbadm]/substanceAdministration/entryRelationship[sply]/supply/ext:subjectOf2/ext:substitutionPermission/ext:code/@displayName="Therapeutic"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:subjectOf2/ext:substitutionPermission
            [ext:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC') 
            or (@code = 'TE')]]">

            <assert test="ext:code[@code = 'TE']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be 'TE'. Refer to section
                '7.1.1 Brand Substitution Permitted' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="ext:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'THERAPEUTIC']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'Therapeutic'. Refer to section
                '7.1.1 Brand Substitution Permitted' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

        <!--ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[expiry]/cda:observation/cda:code/@code="103.10104"
            ClinicalDocument/component/structuredBody/component[pres_item]/section/entry[expiry]/cda:observation/cda:code/@displayName="DateTime Prescription Expires"-->

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATETIME PRESCRIPTION EXPIRES') 
            or (@code = '103.10104')]]">

            <assert test="cda:code[@code = '103.10104']">Error: PCEHR Prescription Record - Global
                Code Checks - The 'code' tag 'code' attribute shall be '103.10104'. Refer to section
                '7.1.1 DateTime Prescription Expires' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert
                test="cda:code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATETIME PRESCRIPTION EXPIRES']"
                >Error: PCEHR Prescription Record - Global Code Checks - The 'code' tag
                'displayName' attribute shall be 'DateTime Prescription Expires'. Refer to section
                '7.1.1 DateTime Prescription Expires' of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>
    </pattern>
</schema>

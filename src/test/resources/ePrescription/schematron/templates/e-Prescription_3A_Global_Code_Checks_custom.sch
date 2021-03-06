<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 09/07/2013 -->

    <pattern name="p-e-Prescription_3A_Global_Code_Checks_custom-errors"
        id="p-e-Prescription_3A_Global_Code_Checks_custom-errors"
        see="#p-e-Prescription_3A_Global_Code_Checks_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')
            or (@code = '103.16233')]]">
            
                        
            
            <assert test="cda:code[(@code = '103.16233')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16233'. Refer to section "7.2
                SUBJECT OF CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth is Calculated From Age'. Refer to section "7.2 SUBJECT OF
                CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')
            or (@code = '102.16234')]]">
            
            
            <assert test="cda:code[(@code = '102.16234')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16234'. Refer to section "7.2
                SUBJECT OF CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth Accuracy Indicator'. Refer to section "7.2 SUBJECT OF
                CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')
            or (@code = '103.20109')]]">
            
            
            <assert test="cda:code[(@code = '103.20109')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.20109'. Refer to section "7.2
                SUBJECT OF CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age'. Refer to section "7.2 SUBJECT OF CARE" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')
            or (@code = '103.16279')]]">
            
            
            <assert test="cda:code[(@code = '103.16279')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16279'. Refer to section "7.2
                SUBJECT OF CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age Accuracy Indicator'. Refer to section "7.2 SUBJECT OF CARE" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')            
            or (@code = '103.16249')]]">
            
            
            <assert test="cda:code[(@code = '103.16249')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16249'. Refer to section "7.2
                SUBJECT OF CARE" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Birth Plurality'. Refer to section "7.2 SUBJECT OF CARE" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')            
            or (@code = '246205007')]]">
            
            
            <assert test="cda:code[(@code = '246205007')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '246205007'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Quantity'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='TIMING')            
            or (@code = '246512002')]]">
            
            
            <assert test="cda:code[(@code = '246512002')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '246512002'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='TIMING')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Timing'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')            
            or (@code = '246205007')]]">
            
            
            <assert test="cda:code[(@code = '246205007')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '246205007'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Quantity'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:subjectOf2/ext:substitutionPermission[ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')            
            or (@code = 'N')]]">
            
            
            <assert test="ext:code[(@code = 'N')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be 'N'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Therapeutic'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')            
            or (@code = '103.16044')]]">
            
            
            <assert test="cda:code[(@code = '103.16044')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16044'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Additional Comments'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATETIME PRESCRIPTION EXPIRES')            
            or (@code = '103.10104')]]">
            
                     
            <assert test="cda:code[(@code = '103.10104')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.10104'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATETIME PRESCRIPTION EXPIRES')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'DateTime Prescription Expires'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration
            /cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY PRESCRIPTION NUMBER')            
            or (@code = '103.16719')]]">
            
          
            <assert test="ext:code[(@code = '103.16719')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16719'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY PRESCRIPTION NUMBER')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS/RPBS Authority Prescription Number'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration
            /cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STREAMLINED AUTHORITY APPROVAL NUMBER')            
            or (@code = '103.16718')]]">
            
            
            <assert test="ext:code[(@code = '103.16718')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16718'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STREAMLINED AUTHORITY APPROVAL NUMBER')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Streamlined Authority Approval Number'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration
            /cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STATE AUTHORITY NUMBER')            
            or (@code = '103.16018')]]">
            
            
            <assert test="ext:code[(@code = '103.16018')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16018'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STATE AUTHORITY NUMBER')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'State Authority Number'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:reference/cda:externalAct
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='MEDICATION INSTRUCTION IDENTIFIER')            
            or (@code = '103.16444')]]">
            
            
            <assert test="cda:code[(@code = '103.16444')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16444'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='MEDICATION INSTRUCTION IDENTIFIER')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Medication Instruction Identifier'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION NOTE DETAIL')            
            or (@code = '102.16212')]]">
           
            
            <assert test="cda:code[(@code = '102.16212')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16212'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION NOTE DETAIL')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescription Note Detail'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/ext:controlAct
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='START CRITERION')            
            or (@code = '103.16436')]]">
            
            
            <assert test="ext:code[(@code = '103.16436')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16436'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='START CRITERION')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Start Criterion'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/ext:controlAct
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STOP CRITERION')            
            or (@code = '103.16434')]]">
            
            
            <assert test="ext:code[(@code = '103.16434')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16434'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STOP CRITERION')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Stop Criterion'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount     
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')            
            or (@code = 'N')]]">
            
            
            <assert test="ext:code[(@code = '103.16434')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16434'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Therapeutic'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount     
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')            
            or (@code = '103.16095.3')]]">
            
            
            <assert test="ext:code[(@code = '103.16095.3')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16095.3'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS Close the Gap Benefit'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount     
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')            
            or (@code = '103.16095.3')]]">
            
            
            <assert test="ext:code[(@code = '103.16095.3')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16095.3'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS Close the Gap Benefit'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount     
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY APPROVAL NUMBER')            
            or (@code = '103.10159')]]">
            
            
            <assert test="ext:code[(@code = '103.10159')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.10159'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY APPROVAL NUMBER')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS/RPBS Authority Approval Number'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
           [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')            
            or (@code = '103.16272')]]">
            
            
            <assert test="cda:code[(@code = '103.16272')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16272'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Formula'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
              
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LONG-TERM')            
            or (@code = '103.16440')]]">
           
            
            <assert test="cda:code[(@code = '103.16440')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16440'. Refer to section "8.2
                Prescription Item" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LONG-TERM')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Long-Term'. Refer to section "8.2
                Prescription Item" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BODY WEIGHT') 
            or (@code = '27113001')]]">
        
            
            <assert test="cda:code[(@code = '27113001')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '27113001'. Refer to section "8.4 Body Weight" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BODY WEIGHT')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Body Weight'. Refer to section "8.4 Body Weight" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>            
            
        </rule>    
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16280']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BODY HEIGHT') 
            or (@code = '50373000')]]">
            
            
            <assert test="cda:code[(@code = '50373000')]">Error: e-Prescription - Global Code Checks
                - The 'code' tag 'code' attribute shall be '50373000'. Refer to section "8.5 Body Height" of the e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BODY HEIGHT')]"
                >Error: e-Prescription - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Body Height'. Refer to section "8.5 Body Height" of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>            
            
        </rule> 
        
        
        
        
        
       
        
    </pattern>
</schema>

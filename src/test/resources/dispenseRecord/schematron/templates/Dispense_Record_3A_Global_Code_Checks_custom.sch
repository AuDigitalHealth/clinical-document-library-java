<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


  
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 15/07/2013 -->

    <pattern name="p-Dispense_Record_3A_Global_Code_Checks_custom-errors"
        id="p-Dispense_Record_3A_Global_Code_Checks_custom-errors"
        see="#p-Dispense_Record_3A_Global_Code_Checks_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')
            or (@code = '103.16233')]]">   
            
            
            <assert test="cda:code[(@code = '103.16233')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16233'. Refer to section "7.2
                SUBJECT OF CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth is Calculated From Age'. Refer to section "7.2 SUBJECT OF
                CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')
            or (@code = '102.16234')]]">
            
            
            <assert test="cda:code[(@code = '102.16234')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16234'. Refer to section "7.2
                SUBJECT OF CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth Accuracy Indicator'. Refer to section "7.2 SUBJECT OF
                CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')
            or (@code = '103.20109')]]">
            
            
            <assert test="cda:code[(@code = '103.20109')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.20109'. Refer to section "7.2
                SUBJECT OF CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age'. Refer to section "7.2 SUBJECT OF CARE" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')
            or (@code = '103.16279')]]">
            
            
            <assert test="cda:code[(@code = '103.16279')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16279'. Refer to section "7.2
                SUBJECT OF CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age Accuracy Indicator'. Refer to section "7.2 SUBJECT OF CARE" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')            
            or (@code = '103.16249')]]">
            
            
            <assert test="cda:code[(@code = '103.16249')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16249'. Refer to section "7.2
                SUBJECT OF CARE" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Birth Plurality'. Refer to section "7.2 SUBJECT OF CARE" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LABEL INSTRUCTION')            
            or (@code = '103.16109')]]">
            
            
            <assert test="cda:code[(@code = '103.16109')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16109'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LABEL INSTRUCTION')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Label Instrcution'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')            
            or (@code = '246205007')]]">
            
            
            <assert test="cda:code[(@code = '246205007')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '246205007'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Quantity'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')            
            or (@code = '103.16044')]]">
            
            
            <assert test="cda:code[(@code = '103.16044')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16044'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Additional Comments'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')            
            or (@code = '103.16272')]]">
            
            
            <assert test="cda:code[(@code = '103.16272')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16272'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Formula'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /cda:entryRelationship/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BRAND SUBSTITUTION OCCURRED')            
            or (@code = '103.16064')]]">
      
            
            <assert test="cda:code[(@code = '103.16064')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16064'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BRAND SUBSTITUTION OCCURRED')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Brand Substitution Occured'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')            
            or (@code = '103.16095.3')]]">
          
            
            <assert test="ext:code[(@code = '103.16095.3')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16095.3'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS Close the Gap Benefit'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:coverage/ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='EARLY SUPPLY WITH PHARMACEUTICAL BENEFIT')            
            or (@code = '103.16348')]]">
            
            
            
            <assert test="ext:code[(@code = '103.16348')]">Error: Dispense Record - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16348'. Refer to section "8.2
                Dispense Item" of the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='EARLY SUPPLY WITH PHARMACEUTICAL BENEFIT')]"
                >Error: Dispense Record - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Early Supply With Pharmaceutical Benefit'. Refer to section "8.2
                Dispense Item" of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
        </rule>
        

        
        
        
        
        
        

       

    </pattern>
</schema>

<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


   
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 15/07/2013 -->

    <pattern name="p-Prescription_Request_3A_Global_Code_Checks_custom-errors"
        id="p-Prescription_Request_3A_Global_Code_Checks_custom-errors"
        see="#p-Prescription_Request_3A_Global_Code_Checks_custom-errors">

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')
            or (@code = '103.16233')]]">
            
                        
            <assert test="cda:code[(@code = '103.16233')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16233'. Refer to section "7.2
                SUBJECT OF CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH IS CALCULATED FROM AGE')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth is Calculated From Age'. Refer to section "7.2 SUBJECT OF
                CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')
            or (@code = '102.16234')]]">
            
            
            <assert test="cda:code[(@code = '102.16234')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16234'. Refer to section "7.2
                SUBJECT OF CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF BIRTH ACCURACY INDICATOR')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Date of Birth Accuracy Indicator'. Refer to section "7.2 SUBJECT OF
                CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')
            or (@code = '103.20109')]]">
            
            
            <assert test="cda:code[(@code = '103.20109')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.20109'. Refer to section "7.2
                SUBJECT OF CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age'. Refer to section "7.2 SUBJECT OF CARE" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')
            or (@code = '103.16279')]]">
            
            
            <assert test="cda:code[(@code = '103.16279')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16279'. Refer to section "7.2
                SUBJECT OF CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Age Accuracy Indicator'. Refer to section "7.2 SUBJECT OF CARE" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')            
            or (@code = '103.16249')]]">
            
            
            <assert test="cda:code[(@code = '103.16249')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16249'. Refer to section "7.2
                SUBJECT OF CARE" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Birth Plurality'. Refer to section "7.2 SUBJECT OF CARE" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')            
            or (@code = '246205007')]]">  
            
            
            <assert test="cda:code[(@code = '246205007')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '246205007'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='QUANTITY')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Quantity'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='TIMING DESCRIPTION')            
            or (@code = '260911001')]]">          
          
          
            
            <assert test="cda:code[(@code = '260911001')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '260911001'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='TIMING DESCRIPTION')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Timing Description'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
      
         <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component
            /cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply
            /ext:subjectOf2/ext:substitutionPermission[ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')            
            or (@code = 'N')]]">       
            
            
                       
            <assert test="ext:code[(@code = 'N')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be 'N'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='THERAPEUTIC')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'THERAPEUTIC'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act[cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')            
            or (@code = '103.16044')]]">
            
                     
            <assert test="cda:code[(@code = '103.16044')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16044'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADDITIONAL COMMENTS')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Additional Comments'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION SOURCE')            
            or (@code = '103.16295')]]">
           
            
            <assert test="cda:code[(@code = '103.16295')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16295'. Refer to section "8.2
                Prescription Instruction Detail" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION SOURCE')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescriber Instruction Source'. Refer to section "8.2
                Prescription Instruction Detail" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16290']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION COMMUNICATION MEDIUM')            
            or (@code = '103.16297')]]">
            
            <assert test="cda:code[(@code = '103.16297')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16297'. Refer to section "8.2
                Prescription Instruction Detail" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION COMMUNICATION MEDIUM')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescriber Instruction Communication Medium'. Refer to section "8.2
                Prescription Instruction Detail" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:act
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')            
            or (@code = '103.16272')]]">
           
            <assert test="cda:code[(@code = '103.16272')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16272'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='FORMULA')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Formula'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
       
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/ext:controlAct
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='START CRITERION')            
            or (@code = '103.16436')]]">
            
           
            
            <assert test="ext:code[(@code = '103.16436')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16436'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='START CRITERION')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Start Criterion'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/ext:controlAct
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STOP CRITERION')            
            or (@code = '103.16434')]]">
            
            <assert test="ext:code[(@code = '103.16434')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16434'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STOP CRITERION')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Stop Criterion'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:observation
            [cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LONG-TERM')            
            or (@code = '103.16440')]]">
           
            <assert test="cda:code[(@code = '103.16440')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16440'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="cda:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='LONG-TERM')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Long-Term'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply/ext:coverage
            /ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')            
            or (@code = '103.16095.3')]]">
           
            <assert test="ext:code[(@code = '103.16095.3')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16095.3'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS CLOSE THE GAP BENEFIT')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS Close the Gap Benefit'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>


        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply/ext:coverage
            /ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY PRESCRIPTION NUMBER')            
            or (@code = '103.16719')]]">
            
            <assert test="ext:code[(@code = '103.16719')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16719'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY PRESCRIPTION NUMBER')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS/RPBS Authority Prescription Number'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply/ext:coverage
            /ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY APPROVAL NUMBER')            
            or (@code = '103.10159')]]">
            
            <assert test="ext:code[(@code = '103.10159')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.10159'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PBS/RPBS AUTHORITY APPROVAL NUMBER')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'PBS/RPBS Authority Approval Number'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply/ext:coverage
            /ext:policyOrAccount
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STREAMLINED AUTHORITY APPROVAL NUMBER')            
            or (@code = '103.16718')]]">
            
            <assert test="ext:code[(@code = '103.16718')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16718'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STREAMLINED AUTHORITY APPROVAL NUMBER')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Streamlined Authority Approval Number'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration/cda:consumable
            /cda:manufacturedProduct/ext:subjectOf1/ext:policy
            [ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STATE AUTHORITY NUMBER')            
            or (@code = '103.16018')]]">
            
            
            <assert test="ext:code[(@code = '103.16018')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '103.16018'. Refer to section "8.4
                Prescription Request Item" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            <assert
                test="ext:code[(translate(@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='STATE AUTHORITY NUMBER')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'State Authority Number'. Refer to section "8.4
                Prescription Request Item" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
        </rule>
        
        
       

    </pattern>
</schema>

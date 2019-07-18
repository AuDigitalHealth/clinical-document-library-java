<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>


    
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 09/07/2013 -->

    <pattern name="p-Prescription_Request_2_Global_Code_Checks_custom-errors"
        id="p-Prescription_Request_2_Global_Code_Checks_custom-errors"
        see="#p-Prescription_Request_2_Global_Code_Checks_custom-errors">

       
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[(translate(cda:code/@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS')
            or (cda:code[@code = '102.16080'])]">
            
            

            <assert test="cda:code[(@code = '102.16080')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16080'. Refer to section "5.
                Administrative Observations" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

           
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Administrative Observations'. Refer to section "5. Administrative
                Observations'" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>           

        </rule>

        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[(translate(cda:code/@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION REQUEST ITEM') 
            or (cda:code[(@code = '102.16211')])]">
            

            <assert test="cda:code[(@code = '102.16211')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16211'. Refer to section "'8.4
                Prescription Request Item'" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIPTION REQUEST ITEM')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescription Request Item'. Refer to section "'8.4
                Prescription Request Item'" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>            

        </rule>
        
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[(translate(cda:code/@displayName , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION DETAIL') 
            or (cda:code[(@code = '102.16290')])]">

            
            <assert test="cda:code[(@code = '102.16290')]">Error: Prescription Request - Global Code Checks
                - The 'code' tag 'code' attribute shall be '102.16290'. Refer to section "'8.2
                Prescription Instruction Detail'" of the Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>
            
            
            <assert
                test="cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='PRESCRIBER INSTRUCTION DETAIL')]"
                >Error: Prescription Request - Global Code Checks - The 'code' tag 'displayName' attribute
                shall be 'Prescription Instruction Detail'. Refer to section "'8.2
                Prescription Instruction Detail'" of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>            
            
        </rule>
        
        

      
        

    </pattern>
</schema>

<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    
    
    <!-- Shared Health Summary Clinical Document:  6.1.2 Subject of Care Custom -->
    
    <!-- Context: ClinicalDocument/Subject of Care -->
    
    <!-- Status: Last Reviewed: 
        Status: Last Updated : 30/04/2013 -->
    
    
    
    <pattern name="p-Dispense_Record_SubjectofCare_7_2_custom-errors"
        id="p-Dispense_Record_SubjectofCare_7_2_custom-errors"
        see="#p-Dispense_Record_SubjectofCare_7_2_custom-errors">
        
      
        
        <rule context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient">
            
            
            <!-- Birth Order - 0..1 -->
            
            <report
                test="(ext:multipleBirthInd[@value='true'] and not(ext:multipleBirthOrderNumber))"
                >Error: Dispense Record - 7.2 Subject of Care - "Subject of Care /
                Participant / Person or Organisation or Device / Person / Demographic Data / Birth
                Order" - The 'multipleBirthOrderNumber' tag is missing for the existence of
                'BirthOrder'. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <report test="(ext:multipleBirthInd[@value='false'] and (ext:multipleBirthOrderNumber))"
                >Error: Dispense Record - 7.2 Subject of Care - "Subject of Care /
                Participant / Person or Organisation or Device / Person / Demographic Data / Birth
                Order" - The 'multipleBirthOrderNumber' tag shall not be present for the missing of
                'BirthOrder'. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
                 
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:multipleBirthInd">
            
            
            <assert test="@value or @nullFlavor">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or Device
                / Person / Demographic Data / Birth Order" - The 'multipleBirthInd' tag shall have
                at least the 'nullFlavor' or 'value' attribute. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <report test="@value and @nullFlavor='NA'">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or Device
                / Person / Demographic Data / Birth Order" - The 'multipleBirthInd' tag shall not
                have both the 'nullFlavor=NA' and 'value' attribute. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            
            
          
            <report
                test="@value and
                @value != 'true' and
                @value != 'false'"
                >Error: Dispense Record - 7.2 Subject of Care - "Subject of Care /
                Participant / Person or Organisation or Device / Person / Demographic Data / Birth
                Order" - The 'multipleBirthInd' tag 'value' attribute shall contain the value 'true'
                or 'false'. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
        </rule>
        
        
        
        <rule
            context="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/ext:multipleBirthOrderNumber">
            
            
            <assert test="@value or @nullFlavor">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or Device
                / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag
                shall have at least the 'nullFlavor' or 'value' attribute. Refer to section 7.2 of
                the Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
            
            <report test="@value and @nullFlavor='NA'">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or Device
                / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag
                shall not have both the 'nullFlavor=NA' and 'value' attribute. Refer to section
                7.2 of the Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <report test="@value and not(number(@value))">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or
                Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber'
                tag 'value' attribute shall be an integer value. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <report test="@value and number(@value) and not(floor(@value) = number(@value))">Error:
                Dispense Record - 7.2 Subject of Care - "Subject of Care /
                Participant / Person or Organisation or Device / Person / Demographic Data / Birth
                Order" - The 'multipleBirthOrderNumber' tag 'value' attribute shall be an integer
                value. Refer to section 7.2 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
            <report test="@value and (@value) &lt; 1">Error: Dispense Record - 7.2 Subject of Care 
                - "Subject of Care / Participant / Person or Organisation or
                Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber'
                tag 'value' attribute shall be an integer greater than equal to 1. Refer to section
                7.2 of the Dispense_Record_CDA_Implementation_Guide_v0.4.</report>
            
        </rule>
      
            
    </pattern>
    
</schema>

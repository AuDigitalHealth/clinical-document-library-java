<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>


    <pattern name="p-e-Prescription_3A_Prescriptionitem_8_2_custom-errors"
        id="p-e-Prescription_3A_Prescriptionitem_8_2_custom-errors"
        see="#p-e-Prescription_3A_Prescriptionitem_8_2_custom-errors">

    

        <!-- Prescription Item > QUANTITY TO DISPENSE > Prescription Written | IG Page 116-->
        <rule context = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:author/cda:assignedAuthor/cda:id">
            
            <assert test = "
                not(@root) or normalize-space(@root) = ''
                or not(/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@root)
                or normalize-space(/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@root) = ''
                or (@root) = normalize-space(/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@root)"                
                >Error: e-Prescription - 8.2 Prescription Item -
                "Prescription Item / QUANTITY TO DISPENSE / Prescription Written" -
                The 'cda:id' tag 'root' attribute shall be as ClinicalDocument/author/assignedAuthor/id/@root .
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>


        <!-- Prescription Item | IG Page 116 -->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration">
            
            <assert test="@classCode"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'substanceAdministration' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SBADM'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'substanceAdministration' tag 'classCode' attribute shall contain the value 'SBADM'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>

        <!-- Prescription Item > DateTime > Prescription Expires | IG Page 117-->
        <rule context = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:observation[cda:code/@code='103.10104']/cda:effectiveTime">
            
            <assert test="
                not(@value)
                or string-length(@value) = 8"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / DateTime / Prescription Expires" -
                The 'effectiveTime' tag 'value' attribute shall contain a complete date (century, year, month and day) and shall not contain time.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>   
        </rule>

        <!-- Prescription Item > Structured Dose > Dose Unit IG Page 120-->

        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:doseQuantity">
          
            <report
                test="(parent::cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (@unit) and (@unit != '1')"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit' attribute
                and 'cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode'
                tag shall not coexist. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
            
            <report
                test="not(parent::cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (@unit) and (@unit = '1')"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit'
                attribute shall have a value. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
            
            <assert
                test="(parent::cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) or (@unit)"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / Structured Dose / Dose Unit" - The 'cda:doseQuantity' tag 'unit' attribute or
                'cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                is missing. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>



        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode">
                       
            <report test="@codeSystem and normalize-space(@codeSystem) != '' and
                not(document('CDAValidate_Vocabs.xml')/systems/system [@codeSystemName = 'OIDs']/code[
                (@codeSystem = current()/@codeSystem) and  (@codeSystemName = current()/@codeSystemName)])"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / Structured Dose / Dose Unit" -
                The 'formCode' tag 'codeSystem' and 'codeSystemName' attribute shall be as per C17-OIDs.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
        </rule>

        <!-- Prescription Item > Structured Dose > Quantity Description | IG Page 121 -->
        <rule context="cda:code[@code='246205007' and not(ancestor::*[cda:supply])]">
            
            <!-- Full Path Test -->    
            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code='246205007' and not(ancestor::*[cda:supply])])=                
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='246205007'])"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item Structured Dose > Quantity Description" - The "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='246205007']" path - 1 or more tags are missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <!-- Prescription Item > QUANTITY TO DISPENSE > Quantity | IG Page 128-->
        <rule
            context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:quantity">
           
            <report
                test="(parent::cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (@unit) and (@unit != '1')"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute and
                'cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag
                shall not coexist. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>            
            
            <report
                test="not(parent::cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) and (@unit) and (@unit = '1')"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute shall have a value. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
            
            <assert
                test="(parent::cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode) or (@unit)"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Dispensing Unit" - The 'cda:quantity' tag 'unit'
                attribute or
                'cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag is
                missing. Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>
        
        <!-- Prescription Item > QUANTITY TO DISPENSE > Dispensing Unit | IG Page 128-->
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode">
               
                <report test="@codeSystem and normalize-space(@codeSystem) != '' and
                    not(document('CDAValidate_Vocabs.xml')/systems/system [@codeSystemName = 'OIDs']/code[
                    (@codeSystem = current()/@codeSystem) and  (@codeSystemName = current()/@codeSystemName)])"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Dispensing Unit" -
                The 'formCode' tag 'codeSystem' and 'codeSystemName' attribute shall be as per C17-OIDs.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
            
        </rule>
        
             
        <!-- Prescription Item > QUANTITY TO DISPENSE > Quantity Description | IG Page 128 -->
        <rule context = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply">
                  
            <report test="(cda:quantity or /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode)
                and cda:entryRelationship[cda:act/cda:code/@code = '246205007']"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE /Quantity Description" -
                The 'supply' tag shall contain 'entryRelationship' tag OR shall contain 'quantity' tag and '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode' tag.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>
            
            <assert test="@classCode"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Quantity" -
                The 'supply' tag 'classCode' attribute is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Quantity" -
                The 'supply' tag 'classCode' attribute shall contain a value.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SPLY'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item / QUANTITY TO DISPENSE / Quantity" -
                The 'supply' tag 'classCode' attribute shall contain the value 'SPLY'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
        </rule>
        
        <!-- Prescription Item > Maximum Number of Repeats | IG Page 130 -->
        <rule context = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:repeatNumber/cda:high">
            
            <assert test="not(@value)
                or normalize-space(@value) = ''
                or number(@value) &gt;= 0
                ">Error: e-Prescription - 8.2 Prescriber Item - "Prescriber Item / Maximum Number of Repeats" -
                The 'high' tag 'value' attribute SHALL be greater or equal to 0.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            
            <!-- 
                Note: A clarification regards to this test raised
            -->
            <!--<report test="@value
                and normalize-space(@value) != ''
                and ((/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy/ext:code[@codeSystem = '1.2.36.1.2001.1001.101.104.16085']/@displayName = 'Pursuant to Regulation 24')
                   or
                   (/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy/ext:code[@codeSystem = '1.2.36.1.2001.1001.101.104.16085']/@displayName = 'Hardship Conditions Apply'))
                and (number(@value) &lt; 0 or number(@value) = 0)
                ">Error: e-Prescription - 7.4 Prescriber Organization - "Prescriber Organization / Maximum Number of Repeats" -
                The 'high' tag 'value' attribute SHALL be greater than 0 if the value of Grounds for Concurrent Supply is 'Pursuant to Regulation 24' or 'Hardship Conditions Apply'.
                Refer to section 7.4 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>-->

        </rule>
        
        <!-- 
            Prescription Item > PBS Close the Gap Benefit | IG Page 133
        --> 
        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply[@classCode = 'SPLY']/ext:coverage/ext:policyOrAccount[ext:code/@code='103.16095.3']/ext:id">
            
            <assert test="
                not(@extension)
                or normalize-space(@extension) = ''
                or string-length(normalize-space(@extension)) = 6
                ">
                Error: e-Prescription - 8.2 Prescriber Item - "Prescriber Item / PBS Close the Gap Benefit" -
                The 'ext:id' tag 'extension' attribute SHALL be a 6 length string value. (E.g. CTG00X)
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="
                not(@extension)
                or normalize-space(@extension) = ''
                or not(string-length(normalize-space(@extension)) = 6)
                or starts-with(normalize-space(@extension), 'CTG')
                ">
                Error: e-Prescription - 8.2 Prescriber Item - "Prescriber Item / PBS Close the Gap Benefit" -
                The 'ext:id' tag 'extension' attribute The first three characters SHALL be 'CTG'. (E.g. CTG00X)
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            <assert test="
                not(@extension)
                or normalize-space(@extension) = ''
                or not(string-length(normalize-space(@extension)) = 6)
                or number(substring(@extension,4,2)) >= 1
                ">
                Error: e-Prescription - 8.2 Prescriber Item - "Prescriber Item / PBS Close the Gap Benefit" -
                The 'ext:id' tag 'extension' attribute The 4th and 5th characters SHALL be a 2 digit number (01 to 99).
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
            
            <assert test="
                not(@extension)
                or normalize-space(@extension) = ''
                or not(string-length(normalize-space(@extension)) = 6)
                or not(starts-with(normalize-space(@extension), 'CTG'))
                or not(number(substring(@extension,4,2)) >= 1)
                or (translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'0123456789','BCDEFGHJKL') = substring(@extension,6,1)
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'10','M') = substring(@extension,6,1)    
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'11','N') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'12','P') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'13','Q') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'14','R') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'15','T') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'16','W') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'17','X') = substring(@extension,6,1) 
                                                          or translate(number(normalize-space(concat(substring(@extension,4,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,7,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,5,2),
                                                           substring(/cda:ClinicalDocument/cda:author/cda:time/@value,3,2)))) mod 19,'18','Y') = substring(@extension,6,1))
                ">
                
                Error: e-Prescription - 8.2 Prescriber Item - "Prescriber Item / PBS Close the Gap Benefit" -
                The 'ext:id' tag 'extension' attribute The 6th character SHALL be a validation character based on the PBS Code validation .
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>
            
        </rule>

    </pattern>

</schema>

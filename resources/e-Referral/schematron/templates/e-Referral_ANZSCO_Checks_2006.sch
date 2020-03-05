<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 10/06/2015 9:47:59 AM

                  Product            : e-Referral
                  Release            : CDA_Implementation_Guide_v1.0
                  Generator Version  : 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Referral_ANZSCO_Checks_2006-errors"
        id="p-e-Referral_ANZSCO_Checks_2006-errors"
        see="#p-e-Referral_ANZSCO_Checks_2006-errors">




        <rule context="*[@codeSystem='2.16.840.1.113883.13.62'][not(self::ext:jobCode)]">
            
            
            <assert test="number(@code) = floor(@code)">Error: e-Referral - ANZSCO code
                check for "*[@codeSystem='2.16.840.1.113883.13.62']/@code" attribute - The 'code' attribute
                ANZSCO code value shall be a number.
                Check all such 'code' attributes to find the incorrect attribute(s). Refer to the 1220.0_ANZSCO_First_Edition_2006 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="string-length(@code) = 6">Error: e-Referral - ANZSCO code check for "*[@codeSystem='2.16.840.1.113883.13.62']/@code" attribute - The 'code' attribute
                ANZSCO code value shall have 6 digits.
                Check all such 'code' attributes to find the incorrect attribute(s). Refer to the 1220.0_ANZSCO_First_Edition_2006 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
        </rule>

        <rule context="ext:asEmployment/ext:jobCode">
            
            <!-- To be updated after the Jira issue resolution to write tests related to this tag -->
            <!-- The code attributes must also checked against the Vocabs file in the ANZSCO FE 2006 meteor 350899 code values after we get a resolution -->
            
            <!-- jobCode/@code - 1..1 -->
            
            <assert test="number(@code) = floor(@code)">Error: e-Referral - 6.1.2 Employment - The 'code' attribute
                ANZSCO code value shall be a number.
                Check all such 'code' attributes to find the incorrect 
                attribute(s). Refer to the 1220.0_ANZSCO_First_Edition_2006 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="string-length(@code) = 6">Error: e-Referral - 6.1.2 Employment - The 'code' attribute
                ANZSCO code value shall have 6 digits.
                Check all such 'code' attributes to find the incorrect 
                attribute(s). Refer to the 1220.0_ANZSCO_First_Edition_2006 and the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="@code"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'code' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'code' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert
                test="
                not(@code) or
                normalize-space(@code) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[
                @code = current()/@code]"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'code' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand 
                Standard Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- jobCode/@codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'codeSystem' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <assert
                test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[
                @codeSystem = current()/@codeSystem]"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand Standard 
                Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <!-- jobCode/@codeSystemName -->
            <!--
                    <assert test="@codeSystemName"
                        >Error: e-Referral - 6.1.2 Employment -
                        The 'jobCode' tag 'codeSystemName' attribute is missing. Check all
                        'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                        Refer to section 6.1.2 Employment of the
                        e-Referral_CDA_Implementation_Guide_v2.2.</assert>
                    -->
            
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'codeSystemName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!-- commented the test below because the changes required for Pathology Report described in the following ticket RPSA-2075 also needs to be applied to all the packages -->
            <!--<report test="
                        @codeSystemName and
                        normalize-space(@codeSystemName) != '' and
                        translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, 2006'"
                        >Error: e-Referral - 6.1.2 Employment -
                        The 'jobCode' tag 'codeSystemName' attribute shall be '1220.0 - ANZSCO - Australian and New Zealand Standard 
                        Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                        Refer to section 6.1.2 Employment of the
                        e-Referral_CDA_Implementation_Guide_v2.2.            
                        <!-\- commented the test as it is the similar test as described in the ticket RPSA-2075 -\->
                    </report>-->
            
            <!-- jobCode/@codeSystemVersion -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'codeSystemVersion' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <!-- jobCode/@displayName -->
            <!--
                    <assert test="@displayName"
                        >Error: e-Referral - 6.1.2 Employment -
                        The 'jobCode' tag 'displayName' attribute is missing. Check all
                        'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                        Refer to section 6.1.2 Employment of the
                        e-Referral_CDA_Implementation_Guide_v2.2.</assert>
                    -->
            
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'displayName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
            <report test="
                @displayName and
                normalize-space(@displayName) != '' and
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']
                /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: e-Referral - 6.1.2 Employment -
                The 'jobCode' tag 'code' and 'displayName' attributes shall match as per '1220.0 - ANZSCO - Australian and New Zealand Standard 
                Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the
                incorrect attribute. Refer to section 6.1.2 Employment of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
        </rule>
            


   

    </pattern>

</schema>

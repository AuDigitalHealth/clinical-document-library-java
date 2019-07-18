<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <!-- ================================================================ -->
    <!-- PLEASE DON'T EDIT THIS FILE. ITS CODE IS GENERATED FROM TEMPLATE -->
    <!-- AND IS UNIFORM ACROSS ALL PACKAGES.                              -->
    <!-- ================================================================ -->

    <!-- Shared Health Summary Clinical Document:  Global Checks -->

    <!-- Context: ClinicalDocument -->

    <!-- Status: Last Reviewed:
         Status: Last Updated : 12/02/2015 -->


    <pattern name="p-Shared_Health_Summary_Global_Checks-errors"
        id="p-Shared_Health_Summary_Global_Checks-errors"
        see="#p-Shared_Health_Summary_Global_Checks-errors">


        <!-- BEGIN :: Common Patterns: 8.1 CODE -->

        <rule
            context="cda:code | ext:code | cda:methodCode | ext:methodCode | ext:jobClassCode | ext:formCode | ext:completionCode | cda:confidentialityCode | cda:administrativeGenderCode">

            <assert test="
                cda:originalText or (@code and @codeSystem) or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@code" attribute -
                The 'code' tag shall have at least the 'originalText' tag or the
                'code and codeSystem' or the 'nullFlavor' attributes.
                Check all 'cda:code' tags to find the missing tag or attribute(s).
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystem" attribute -
                The 'code' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'codeSystem' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ============================================================================================ -->
            <!-- @codeSystem MUST be a UUID or OID
                 Precondition: @codeSystem exists, and @codeSystem not empty
                 Validates   : @codeSystem contains '-' (UUID) or '.' (OID) but not both;
                               further details will be validated by either UUID format test or OID format test -->
            <assert test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                (contains(@codeSystem, '-') and not(contains(@codeSystem, '.'))) or
                (not(contains(@codeSystem, '-')) and contains(@codeSystem, '.'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystem" attribute -
                The 'code' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:code' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ============================================================================================ -->
            <!-- UUID format test
                 Precondition: @codeSystem exists, and @codeSystem not empty, and @codeSystem looks like an UUID (containing '-')
                 Validates   : Length of 36 characters;
                               Character at position of @codeSystem  9 is a '-';
                               Character at position of @codeSystem 14 is a '-';
                               Character at position of @codeSystem 19 is a '-';
                               Character at position of @codeSystem 24 is a '-';
                               Characters at position  1-8  of @codeSystem are hexidecimal digits
                               Characters at position 10-13 of @codeSystem are hexidecimal digits
                               Characters at position 15-18 of @codeSystem are hexidecimal digits
                               Characters at position 20-23 of @codeSystem are hexidecimal digits
                               Characters at position 25-36 of @codeSystem are hexidecimal digits -->
            <report test="
                @codeSystem and
                normalize-space(@codeSystem) != '' and
                contains(@codeSystem, '-') and not(
                string-length(@codeSystem) = 36 and
                substring(@codeSystem,  9, 1) = '-' and substring(@codeSystem, 14, 1) = '-' and
                substring(@codeSystem, 19, 1) = '-' and substring(@codeSystem, 24, 1) = '-' and
                translate(substring(@codeSystem,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@codeSystem, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')
                ">Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystem" attribute -
                The 'code' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:code' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ============================================================================================ -->
            <!-- OID format test
                 Precondition: @codeSystem exists, and @codeSystem not empty, and @codeSystem looks like an OID (containing '.')
                 Validates   : First character of @codeSystem is not '0';
                               First character of @codeSystem is not '.';
                               Last  character of @codeSystem is not '.';
                               All characters of @codeSystem are decimal digits and '.'s -->
            <report
                test="
                @codeSystem and
                normalize-space(@codeSystem) != '' and
                contains(@codeSystem,'.') and not(
                substring(@codeSystem, 1, 1) != '0' and
                substring(@codeSystem, 1, 1) != '.' and
                substring(@codeSystem, string-length(@codeSystem), 1) != '.' and
                number(translate(@codeSystem, '0123456789.', '00000000000')) = 0)
                ">Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystem" attribute -
                The 'code' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:code' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@nullFlavor" attribute -
                The 'code' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:code' tags 'nullFlavor' attributes to find
                the 'nullFlavor' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- The CD data type "nullFlavor" attribute can have one of the following values:: NI, UNK, ASKU, NAV, NASK, NA. -->
            <report test="@nullFlavor and
                normalize-space(@nullFlavor) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Coded_DataType_NullFlavor']/code[(@code = current()/@nullFlavor)])"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@nullFlavor" attribute -
                The 'code' tag 'nullFlavor' attribute shall be as per FAQ Representing
                Coding in CDA Documents CDA CD DataType nullFlavors.
                Check all 'cda:code' tags to find
                the 'nullFlavor' attributes of incorrect value.
                Refer to the HL7 data types specification and section 2.1.1 of the FAQ Representing Coding in CDA Documents,
                and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:originalText) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:originalText" -
                The 'originalText' tag shall appear only once.
                Check all 'cda:code' tags to find
                the duplicated 'originalText' child tag.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- originalText if present can't be empty -->
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:originalText" -
                The 'originalText' tag shall contain a value.
                Check all 'cda:code' tags to find
                the 'originalText' child tag have value missing.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- The check has been removed for the following reason 
                
                The scope of this JIRA ticket should be the conformance requriements for the CD data element, defined in the HL7 data types specification. 
                The following requirement, which is the last one in the attached spreadsheet, is not stated in the HL7 data types specification: 
                "if code system is 1.2.36.1.2001.1005.11.1, originalText SHALL be present".-->
            
            <!-- Special Case for MIMS - if codeSystem is 1.2.36.1.2001.1005.11.1, originalText must be present -->
           <!-- <report test="
                (not(@nullFlavor) or (@nullFlavor = 'OTH')) and
                @codeSystem = '1.2.36.1.2001.1005.11.1' and
                not(cda:originalText)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:originalText" -
                The 'originalText' tag is missing for the existence of attribute
                'codeSystem = 1.2.36.1.2001.1005.11.1'.
                Check all 'cda:code' tags to find the missing 'originalText' tag.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>-->

            <report test="@code and normalize-space(@code) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@code" attribute -
                The 'code' tag 'code' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'code' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="@code != normalize-space(@code)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@code" attribute -
                The 'code' tag 'code' attribute shall not start or end with space.
                Check all 'cda:code' tags to find
                the 'code' attribute with incorrect value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@code" attribute -
                The 'code' tag 'code' attribute shall not be present 
                if the corresponding 'codeSystem' attribute is missing.
                Check all 'cda:code' tags to find
                the incorrectly contained 'code' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystemName" attribute -
                The 'code' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'codeSystemName' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@codeSystemVersion" attribute -
                The 'code' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'codeSystemVersion' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@displayName" attribute -
                The 'code' tag 'displayName' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'displayName' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/@displayName" attribute -
                The 'code' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:code' tags to find
                the incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- qualifiers are not allowed unless CDA IG describes their use -->
            <assert test="not(cda:qualifier)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:qualifier" -
                The 'qualifier' tag shall not be present within 'code'.
                Check all 'cda:code' tags to find the incorrect child 'qualifier' tag.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code/cda:translation |
                       ext:code/cda:translation |
                       cda:methodCode/cda:translation |
                       ext:methodCode/cda:translation |
                       ext:jobClassCode/cda:translation">

            <!-- a codeSystem must be present -->
            <assert test="@codeSystem"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute is missing.
                Check all 'cda:code' tags to find
                the 'translation' child tag with missing 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'codeSystem' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ============================================================================================ -->
            <!-- @codeSystem MUST be a UUID or OID
                 Precondition: @codeSystem exists, and @codeSystem not empty
                 Validates   : @codeSystem contains '-' (UUID) or '.' (OID) but not both;
                               further details will be validated by either UUID format test or OID format test -->
            <assert test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                (contains(@codeSystem, '-') and not(contains(@codeSystem, '.'))) or
                (not(contains(@codeSystem, '-')) and contains(@codeSystem, '.'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:code' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ============================================================================================ -->
            <!-- UUID format test
                 Precondition: @codeSystem exists, and @codeSystem not empty, and @codeSystem looks like an UUID (containing '-')
                 Validates   : Length of 36 characters;
                               Character at position of @codeSystem  9 is a '-';
                               Character at position of @codeSystem 14 is a '-';
                               Character at position of @codeSystem 19 is a '-';
                               Character at position of @codeSystem 24 is a '-';
                               Characters at position  1-8  of @codeSystem are hexidecimal digits
                               Characters at position 10-13 of @codeSystem are hexidecimal digits
                               Characters at position 15-18 of @codeSystem are hexidecimal digits
                               Characters at position 20-23 of @codeSystem are hexidecimal digits
                               Characters at position 25-36 of @codeSystem are hexidecimal digits -->
            <report test="
                @codeSystem and
                normalize-space(@codeSystem) != '' and
                contains(@codeSystem, '-') and not(
                string-length(@codeSystem) = 36 and
                substring(@codeSystem,  9, 1) = '-' and substring(@codeSystem, 14, 1) = '-' and
                substring(@codeSystem, 19, 1) = '-' and substring(@codeSystem, 24, 1) = '-' and
                translate(substring(@codeSystem,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@codeSystem, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@codeSystem, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')
                ">Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:code' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ============================================================================================ -->
            <!-- OID format test
                 Precondition: @codeSystem exists, and @codeSystem not empty, and @codeSystem looks like an OID (containing '.')
                 Validates   : First character of @codeSystem is not '0';
                               First character of @codeSystem is not '.';
                               Last  character of @codeSystem is not '.';
                               All characters of @codeSystem are decimal digits and '.'s -->
            <report
                test="
                @codeSystem and
                normalize-space(@codeSystem) != '' and
                contains(@codeSystem,'.') and not(
                substring(@codeSystem, 1, 1) != '0' and
                substring(@codeSystem, 1, 1) != '.' and
                substring(@codeSystem, string-length(@codeSystem), 1) != '.' and
                number(translate(@codeSystem, '0123456789.', '00000000000')) = 0)
                ">Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:code' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- translation SHALL NOT contain the same code/codeSystem as another in the cluster -->
            <!-- i.e. translation from same codeSystem is not allowed -->
            <assert test="not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                not(parent::*/@codeSystem) or
                normalize-space(parent::*/@codeSystem) = '' or
                @codeSystem != parent::*/@codeSystem"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value different from the
                codeSystem it translates from. Check all 'cda:code' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- either code or nullFlavor attribute is required -->
            <assert test="@code or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation" attributes -
                The 'translation' tag shall have at least the 'code' or the 'nullFlavor' attributes.
                Check all 'cda:code' tags to find
                the 'translation' child tag with the missing attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'nullFlavor' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- only nullFlavor allows in translation is 'OTH' -->
            <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'OTH'"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain the value 'OTH'.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'nullFlavor' attribute of incorrect value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- translation SHALL NOT contain originalText -->
            <assert test="not(cda:originalText)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation" -
                The 'originalText' tag shall not be present within 'translation' tag.
                Check all 'cda:code' tags to find
                the 'translation' child tag containing 'originalText' tag.
                Refer to the HL7 data types specification and section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- translation SHALL NOT contain nested translation(s) -->
            <assert test="not(cda:translation)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation" -
                The 'translation' tag shall not be present within 'translation' tag.
                Check all 'cda:code' tags to find
                the 'translation' child tag with nested 'translation' tag.
                Refer to the HL7 data types specification and section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@code and normalize-space(@code) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'code' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="@code != normalize-space(@code)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not start or end with space.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'code' attribute of incorrect value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not be present 
                if the corresponding 'codeSystem' attribute is missing.
                Check all 'cda:code' tags to find
                the 'translation' child tag with incorrectly contained 'code' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystemName" attribute -
                The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'codeSystemName' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@codeSystemVersion" attribute -
                The 'translation' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'codeSystemVersion' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall contain a value.
                Check all 'cda:code' tags to find
                the 'translation' child tag 'displayName' attribute of missing value.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:code' tags to find
                the 'translation' child tag with incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- qualifiers are not allowed unless CDA IG describes their use -->
            <assert test="not(cda:qualifier)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "cda:code/cda:translation/cda:qualifier" -
                The 'qualifier' tag shall not be present within 'translation'.
                Check all 'cda:code' tags to find
                the 'translation' child tag with the incorrect child 'qualifier' tag.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:code/cda:originalText |
                       ext:code/cda:originalText |
                       cda:methodCode/cda:originalText |
                       ext:methodCode/cda:originalText |
                       ext:jobClassCode/cda:originalText">

            <report test = "count(cda:reference) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText' tag -
                The 'reference' tag shall appear only once.
                Check all 'cda:code/cda:originalText' tags to find
                the duplicated 'reference' tag.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- If originalText contains both reference and text, the text must match the reference -->
            <report test = "
                cda:reference and
                normalize-space(concat(text()[1], text()[2])) != '' and
                normalize-space(concat(text()[1], text()[2])) !=
                normalize-space(concat(ancestor::cda:component/cda:section/cda:text/text()[1],
                                       ancestor::cda:component/cda:section/cda:text/text()[2]))"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText' tag -
                The 'originalText' tag shall contain the value match to its corresponding narrative block text.
                Check all 'cda:code/cda:originalText' tags to find
                the corresponding narrative text mismatch.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:code/cda:originalText/cda:reference |
                       ext:code/cda:originalText/cda:reference |
                       cda:methodCode/cda:originalText/cda:reference |
                       ext:methodCode/cda:originalText/cda:reference |
                       ext:jobClassCode/cda:originalText/cda:reference">

            <assert test = "@value"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute is missing.
                Check all 'cda:code/cda:originalText/cda:reference' tags to find
                the missing 'value' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test = "not(@value) or normalize-space(@value) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain a value.
                Check all 'cda:code/cda:originalText/cda:reference' tags to find
                the empty 'value' attribute.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText/cda:reference' tag -
                The narrative 'text/content/@ID' attribute corresponding to the 'reference' tag 'value' attribute is missing.
                Check all 'cda:code/cda:originalText/cda:reference' tags to find
                the missing corresponding narrative.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                not(ancestor::cda:component/cda:section/cda:text) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content/@ID) or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID = @value">
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:code/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain the value match to
                its corresponding narrative block content 'ID' attribute.
                Check all 'cda:code/cda:originalText/cda:reference' tags to find
                the corresponding narrative content ID mismatch.
                Refer to the HL7 data types specification and section 8.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <!-- RPSA-1739 - The following test has no relation with any of the code elements but added here because it is a global check and applies to all levels -->
        <rule context="/cda:ClinicalDocument/cda:component">    
             <report test="cda:nonXMLBody"
                 >Error: Shared Health Summary -
                 The 'nonXMLBody' tag shall not exist.
                 Refer to section 024482 Conformance levels of the
                 COMMON-ConformProfileClinDoc-v1.6.</report>
        </rule>
        <!-- RPSA-1739 - The above test has no relation with any of the code elements but added here because it is a global check and applies to all levels  -->

       
     




        <!-- BEGIN :: Common Patterns: 8.2 ID -->

        <rule context="cda:id | ext:id | cda:setId">

            <assert test="@root or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag shall have at least
                'root' or 'nullFlavor' attributes. Check all 'cda:id' tags to find the missing
                'root' or 'nullFlavor' attributes. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@root and normalize-space(@root) =  ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                contain a value. Check all 'cda:id' tags 'root' attribute to find the missing
                value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ============================================================================================ -->
            <!-- @root has to be a UUID or OID
                 Precondition: @root exists, and @root not empty
                 Validates   : @root contains '-' (UUID) or '.' (OID) but not both;
                               further details will be validated by either UUID format test or OID format test -->
            <assert test="
                not(@root) or
                normalize-space(@root) = '' or
                (contains(@root, '-') and not(contains(@root, '.'))) or
                (not(contains(@root, '-')) and contains(@root, '.'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                contain an UUID or OID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- ============================================================================================ -->
            <!-- UUID format test
                 Precondition: @root exists, and @root not empty, and @root looks like an UUID (containing '-')
                 Validates   : Length of 36 characters;
                               Character at position of @root  9 is a '-';
                               Character at position of @root 14 is a '-';
                               Character at position of @root 19 is a '-';
                               Character at position of @root 24 is a '-';
                               Characters at position  1-8  of @root are hexidecimal digits
                               Characters at position 10-13 of @root are hexidecimal digits
                               Characters at position 15-18 of @root are hexidecimal digits
                               Characters at position 20-23 of @root are hexidecimal digits
                               Characters at position 25-36 of @root are hexidecimal digits -->
            <report test="
                @root and
                normalize-space(@root) != '' and
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')
                ">Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                be a valid UUID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>



            <!-- UUID format test
                Precondition: @root exists, and @root not empty, and @root looks like an UUID (containing '-')
                Validates   : A UUID cannot contain both upper and lower case characters -->
            
            <report test="
                @root and
                normalize-space(@root) != '' and
                contains(@root, '-') and 
                (
                contains(@root, 'a') or
                contains(@root, 'b') or
                contains(@root, 'c') or
                contains(@root, 'd') or
                contains(@root, 'e') or
                contains(@root, 'f') 
                ) and
                (
                contains(@root, 'A') or
                contains(@root, 'B') or
                contains(@root, 'C') or
                contains(@root, 'D') or
                contains(@root, 'E') or
                contains(@root, 'F') 
                )
                ">Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                be a valid UUID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ============================================================================================ -->
            <!-- OID format tests
                 Precondition: @root exists, and @root not empty, and @root looks like an OID (containing '.')
                 Validates   : First character of @root shall be '0' or '1' or '2' ;
                               First character of @root is not '.';
                               Last  character of @root is not '.';
                               Each arc shall contain no characters other than those in the range from zero to nine and shall not commence with a zero, 
                               unless it has only a single character and the primary integer value of the arc is zero.
                               second arc shall be 0 to 39
                               All characters of @root are decimal digits and '.'s -->
         
            <report
                test="
                @root and
                normalize-space(@root) != '' and
                contains(@root,'.') and
                substring(@root, 1, 1) != '.' and substring(@root, string-length(@root), 1) != '.' and
                number(translate(@root, '0123456789.', '00000000000')) = 0  and
                (contains(@root,'.00') or contains(@root,'.01') or contains(@root,'.02') or contains(@root,'.03') or contains(@root,'.04') or contains(@root,'.05') or contains(@root,'.06') or contains(@root,'.07') or contains(@root,'.08') or contains(@root,'.09'))
                ">Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                be a valid OID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            <report
                test="
                @root and
                normalize-space(@root) != '' and
                contains(@root,'.') and not(
                substring(@root, 1, 1) = '0' or substring(@root, 1, 1) = '1' or substring(@root, 1, 1) = '2') 
                ">Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                be a valid OID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            
            <report
                test="
                @root and
                normalize-space(@root) != '' and
                contains(@root,'.') and (substring(@root, 1, 1) = '0' or substring(@root, 1, 1) = '1') and
                not(
                substring(@root, 2, 1) = '.' and
                substring(@root, string-length(@root), 1) != '.' and
                number(translate(@root, '0123456789.', '00000000000')) = 0 and
                number(translate(substring(@root, 3, 2), '0123456789', '0000000000')) = 0 and
                number(substring(@root, 3, 2)) &lt; 40 and
                (substring(@root, 4, 1) = '.'  or substring(@root, 5, 1) = '.')) 
                ">Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall
                be a valid OID. Check all 'cda:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            

            <!-- ============================================================================================ -->
            <!-- Health Identifier 16 digits tests (if it starts with HI prefix)
                 Precondition: @root exists, and last character of @root is not '.',
                               and @root has prefix of IHI, HPI-I, or HPI-O, '1.2.36.1.2001.1003.0.80036'
                                                    or PAI-O,                '1.2.36.1.2001.1007.1.80036'
                                                    or PAI-R,                '1.2.36.1.2001.1007.10.80036'
                                                    or PAI-D,                '1.2.36.1.2001.1007.20.80036'
                 Validates   : @root either ends with the 16 Health Identifier digits (starts with 80036); or
                               has the 16 Health Identifier digits followed by '.' and 1 or more digits or additional nodes -->
            <assert test="
                not(@root) or
                substring(@root, string-length(@root), 1) = '.' or
                number(translate(@root, '0123456789.', '00000000000')) != 0 or
                not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.1.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.10.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.20.80036')
                ) or (
                    not(contains(substring-after(@root, '80036'), '.')) and
                    string-length('80036') + string-length(substring-after(@root, '80036')) = 16
                ) or (
                    contains(substring-after(@root, '80036'), '.') and
                    string-length('80036') + string-length(substring-before(substring-after(@root, '80036'), '.')) = 16
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall contain an OID for Health Identifier, which
                should be ended with a national 16 digits unique identification number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- ============================================================================================ -->
            <!-- Repository Identifier 16 digits tests (if it starts with repository prefix)
                 Precondition: @root exists, and last character of @root is not '.',
                               and @root has prefix of repositories          '1.2.36.1.2001.1007.11.80036'
                 Validates   : @root has the 16 Health Identifier digits followed by '.' and 1 or more digits or additional nodes -->
            <assert test="
                not(@root) or
                substring(@root, string-length(@root), 1) = '.' or
                number(translate(@root, '0123456789.', '00000000000')) != 0 or
                not(starts-with(@root, '1.2.36.1.2001.1007.11.80036')) or
                (
                    contains(substring-after(@root, '80036'), '.') and
                    string-length('80036') + string-length(substring-before(substring-after(@root, '80036'), '.')) = 16
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall contain an OID for repository, which
                should be ended with a national 16 digits unique identification number,
                followed by a '.' and 1 or more digits or additional nodes. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- ============================================================================================ -->
            <!-- Health Identifier LUHN Check
                 Precondition: @root exists, and last character of @root is not '.',
                               and @root has prefix of IHI, HPI-I, or HPI-O, '1.2.36.1.2001.1003.0.80036'
                                                    or PAI-O,                '1.2.36.1.2001.1007.1.80036'
                                                    or PAI-R,                '1.2.36.1.2001.1007.10.80036'
                                                    or PAI-D,                '1.2.36.1.2001.1007.20.80036'
                               and @root either ends with the 16 Health Identifier digits (starts with 80036)
                 Validates   : The evaluated LUHN shall match the LUHN digit (last digit of the 16 digits Health Identifier)
                                odd  digits : digit
                                even digits : last_digit_of(2 * digit) + ((2 * digit) >= 10) ? 10 : 0 -->
            <assert test = "
                not(@root) or
                number(translate(@root, '0123456789.', '00000000000')) != 0 or
                not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.1.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.10.80036') or
                    starts-with(@root, '1.2.36.1.2001.1007.20.80036')
                ) or (
                    not(contains(substring-after(@root, '80036'), '.')) and
                    not(string-length('80036') + string-length(substring-after(@root, '80036')) = 16)
                ) or (
                    contains(substring-after(@root, '80036'), '.') and (
                    not(string-length(substring-after(substring-after(@root, '80036'), '.')) > 0) or
                    not(string-length('80036') + string-length(substring-before(substring-after(@root, '80036'), '.')) = 16))
                ) or (
                (
                    number(substring(string(2 * 8), 1, 1)) + number(substring(string(2 * 8), 2, 1)) +
                    0 +
                    2 * 0 +
                    3 +
                    number(substring(string(2 * 6), 1, 1)) + number(substring(string(2 * 6), 2, 1)) +
                    number(substring(substring-after(@root, '80036'), 1, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 2, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 2, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 2, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 3, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 4, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 4, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 4, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 5, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 6, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 6, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 6, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 7, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 8, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 8, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 8, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 9, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'),10, 1)), string-length(string(2 * substring(substring-after(@root, '80036'),10, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'),10, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 11, 1))
                ) mod 10 = 0)"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall have a valid Luhn check digit in the OID for Health Identifier. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- ============================================================================================ -->
            <!-- Repository Identifier LUHN Check
                 Precondition: @root exists, and last character of @root is not '.',
                               and @root has prefix of repositories          '1.2.36.1.2001.1007.11.80036'
                               and @root has the 16 Health Identifier digits followed by '.' and 1 or more digits or additional nodes
                 Validates   : The evaluated LUHN shall match the LUHN digit (last digit of the 16 digits Health Identifier)
                                odd  digits : digit
                                even digits : last_digit_of(2 * digit) + ((2 * digit) >= 10) ? 10 : 0 -->
            <assert test = "
                not(@root) or
                number(translate(@root, '0123456789.', '00000000000')) != 0 or
                not(starts-with(@root, '1.2.36.1.2001.1007.11.80036')) or
                not(contains(substring-after(@root, '80036'), '.')
                ) or (
                    contains(substring-after(@root, '80036'), '.') and (
                    not(string-length(substring-after(substring-after(@root, '80036'), '.')) > 0) or
                    not(string-length('80036') + string-length(substring-before(substring-after(@root, '80036'), '.')) = 16))
                ) or (
                (
                    number(substring(string(2 * 8), 1, 1)) + number(substring(string(2 * 8), 2, 1)) +
                    0 +
                    2 * 0 +
                    3 +
                    number(substring(string(2 * 6), 1, 1)) + number(substring(string(2 * 6), 2, 1)) +
                    number(substring(substring-after(@root, '80036'), 1, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 2, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 2, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 2, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 3, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 4, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 4, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 4, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 5, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 6, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 6, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 6, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 7, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'), 8, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 8, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'), 8, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 9, 1)) +
                    number(substring(string(2 * substring(substring-after(@root, '80036'),10, 1)), string-length(string(2 * substring(substring-after(@root, '80036'),10, 1))), 1)) +
                    number(substring(string(number(substring(substring-after(@root, '80036'),10, 1)) div 5), 1, 1)) +
                    number(substring(substring-after(@root, '80036'), 11, 1))
                ) mod 10 = 0)"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall have a valid Luhn check digit in the OID for Health Identifier. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- ============================================================================================ -->
            <!-- HI or Repository Identifier extension attribute prohibition check (Mantis: 4448) -->
            <report test="@root and
                substring(@root, string-length(@root), 1) != '.' and
                (
                    (
                        @root = '1.2.36.1.2001.1003.0' or (
                        starts-with(@root, '1.2.36.1.2001.1003.0') and
                        substring(@root, string-length('1.2.36.1.2001.1003.0') + 1, 1) = '.')
                    ) or (
                        @root = '1.2.36.1.2001.1007.1' or (
                        starts-with(@root, '1.2.36.1.2001.1007.1') and
                        substring(@root, string-length('1.2.36.1.2001.1007.1') + 1, 1) = '.')
                    ) or (
                        @root = '1.2.36.1.2001.1007.10' or (
                        starts-with(@root, '1.2.36.1.2001.1007.10') and
                        substring(@root, string-length('1.2.36.1.2001.1007.10') + 1, 1) = '.')
                    ) or (
                        @root = '1.2.36.1.2001.1007.20' or (
                        starts-with(@root, '1.2.36.1.2001.1007.20') and
                        substring(@root, string-length('1.2.36.1.2001.1007.20') + 1, 1) = '.')
                    ) or (
                        @root = '1.2.36.1.2001.1007.11' or (
                        starts-with(@root, '1.2.36.1.2001.1007.11') and
                        substring(@root, string-length('1.2.36.1.2001.1007.11') + 1, 1) = '.')
                    )
                ) and
                @extension"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag -
                The 'id' tag 'extension' attribute shall not be present for HI or Repository identifiers.
                Check all 'cda:id' tags 'extension' attribute to find the prohibited extension attribute.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'nullFlavor' attribute
                shall contain a value. Check all 'cda:id' tags 'nullFlavor' attribute to find the
                missing value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- Commented the following Test due to contradiction with conformance profile. Confirmed with SR shall take the rule out. Email comment below. Sent: Tuesday, 11 February 2014 1:41 PM. Subject: RE: nullFlavor query
                 In general cda:id should not be allowed to have a nullFlavor at all, although there may well be exceptions.  ext:id could have a number of nullFlavors including “UNK”; “MSK” is another possibility.  In this particular case, you definitely have to allow “UNK”.-->
            <!--<report
                test="@nullFlavor and translate(@nullFlavor, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='NA'"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'nullFlavor' attribute
                shall contain the value 'NA'. Check all 'cda:id' tags to find the incorrect
                'nullFlavor' attribute. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>-->


            
            <!-- Begin RPSA-1735
                <report test="@extension and not(@root)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute
                is missing for the existence of 'extension' attribute. Check all 'cda:id' tags to
                find the 'extension' without 'root' attributes. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>-->
            
            <report test="@extension and not(@root or @nullFlavor)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' OR 'nullFlavor' attribute
                is missing for the existence of 'extension' attribute. Check all 'cda:id' tags to
                find the 'extension' without 'root' OR 'nullFlavor' attributes. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            <!-- End RPSA-1735 -->            


            <report test="@extension and normalize-space(@extension) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'extension' attribute
                shall contain a value. Check all 'cda:id' tags 'extension' attribute to find the
                missing value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@assigningAuthorityName and not(@root)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute
                is missing for the existence of 'assigningAuthorityName' attribute. Check all
                'cda:id' tags to find the 'assigningAuthorityName' without 'root' attributes.
                Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@assigningAuthorityName and normalize-space(@assigningAuthorityName) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'assigningAuthorityName'
                attribute shall contain a value. Check all 'cda:id' tags 'assigningAuthorityName'
                attribute to find the missing value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@displayable and not(@root)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute
                is missing for the existence of 'displayable' attribute. Check all 'cda:id' tags to
                find the 'displayable' without 'root' attributes. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@displayable and normalize-space(@displayable) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'displayable' attribute
                shall contain a value. Check all 'cda:id' tags 'displayable' attribute to find the
                missing value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@displayable and
                normalize-space(@displayable) != '' and
                not(@displayable = 'true' or @displayable = 'false')"
                >Error: Shared Health Summary -
                Global Clinical Document check for "id" tag - The 'id' tag 'displayable' attribute
                shall contain the value 'true' or 'false'. Check all 'cda:id' tags 'displayable'
                attribute to find the incorrect value. Refer to section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>



            <!-- ============================================================================================ -->
            <!-- Medicare Card Number or Individual Medicare Card Number checks.                              -->

            <!-- @extension="<INT(10)>" .................................................................................................. -->
            <!-- Medicare Card Number :: root="1.2.36.1.5001.1.0.7.1" extension="<INT(10)>"
                 :: Appendix C: Medicare card number check algorithm (Healthcare Identifiers Software Conformance Requirements v1.4.1.pdf) -->

            <assert test="
                not(@root) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7.1')) or
                (
                    not( contains(substring-after(@root, '1.2.36.1.5001.1.0.7.1'), '.'))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall be '1.2.36.1.5001.1.0.7.1' OID for Medicare Card Number, with
                'extension' attribute shall be a numeric 10 digits unique Medicare Card Number.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <assert test="
                not(@root) or
                not(@root='1.2.36.1.5001.1.0.7.1') or
                (
                    number(@extension) = floor(@extension) and
                    string-length(@extension) = 10
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a numeric 10 digits unique Medicare Card Number.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- Medicare card number check digit: :: root="1.2.36.1.5001.1.0.7.1" extension="<INT(10)>"
                 = (  (digit 1 * 1) + (digit 2 * 3) + (digit 3 * 7) + (digit 4 * 9)
                    + (digit 5 * 1) + (digit 6 * 3) + (digit 7 * 7) + (digit 8 * 9) ) mod 10 
            
            The following special values are allowed:
            •	‘0000000000’ – for a person that is ineligible for Medicare
            •	‘9999999999’ – for person that is registered but card is unavailable
            •	‘8888888888’ – for a person whose Medicare card number is unknown.
            
            -->

            <assert test = "
                not(@root) or
                not(@root='1.2.36.1.5001.1.0.7.1') or
                (
                    not(number(@extension) = floor(@extension)) or
                    not(string-length(@extension) = 10)
                ) or
                (
                (@extension = '0000000000') or
                (@extension = '9999999999') or
                (@extension = '8888888888')
                ) or
                (
                   ((1 *  number(substring(@extension, 1, 1))) +
                    (3 *  number(substring(@extension, 2, 1))) +
                    (7 *  number(substring(@extension, 3, 1))) +
                    (9 *  number(substring(@extension, 4, 1))) +
                    (1 *  number(substring(@extension, 5, 1))) +
                    (3 *  number(substring(@extension, 6, 1))) +
                    (7 *  number(substring(@extension, 7, 1))) +
                    (9 *  number(substring(@extension, 8, 1)))
                    ) mod 10 =
                    (     number(substring(@extension, 9, 1)))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall have a valid check digit in the Medicare Card Number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- @root="1.2.36.1.5001.1.0.7.1.<INT(10)>"  INVALID.  Must be @root="1.2.36.1.5001.1.0.7.1" @extension="<INT(10)>"
                 Grahame Grieve Sent: Wednesday, 3 October 2012 9:39 AM :: No. in this case, you can't. (Part of the way these OIDs were registered) -->
            <!-- Medicare Card Number :: root="1.2.36.1.5001.1.0.7.1.<INT(10)>" extension=""
                 :: Appendix C: Medicare card number check algorithm (Healthcare Identifiers Software Conformance Requirements v1.4.1.pdf)           -->
<!--
            <assert test="
                not(@root) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7.1.')) or
                (
                    not( contains(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), '.')) and
                    string-length(substring-after(@root, '1.2.36.1.5001.1.0.7.1.')) = 10
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall contain an OID for Medicare Card Number, which
                should be ended with a national 10 digits unique identification number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->

            <!-- Medicare card number check digit: :: 1.2.36.1.5001.1.0.7.1.<INT(10)> extension=""
                 = (  (digit 1 * 1) + (digit 2 * 3) + (digit 3 * 7) + (digit 4 * 9)
                    + (digit 5 * 1) + (digit 6 * 3) + (digit 7 * 7) + (digit 8 * 9) ) mod 10 -->
<!--
            <assert test = "
                not(@root) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7.1.')) or
                   ( contains(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), '.') or
                     not(string-length(substring-after(@root, '1.2.36.1.5001.1.0.7.1.')) = 10)
                    )  or
                (
                   ((1 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 1, 1))) +
                    (3 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 2, 1))) +
                    (7 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 3, 1))) +
                    (9 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 4, 1))) +
                    (1 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 5, 1))) +
                    (3 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 6, 1))) +
                    (7 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 7, 1))) +
                    (9 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 8, 1)))
                    ) mod 10 =
                    (     number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.1.'), 9, 1)))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall have a valid check digit in the OID for Medicare Card Number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->

            <!-- @extension="<INT(11)>" .................................................................................................. -->
            <!-- Individual Medicare Card Number :: root="1.2.36.1.5001.1.0.7" extension="<INT(11)>"
                 :: Appendix C: Medicare card number check algorithm (Healthcare Identifiers Software Conformance Requirements v1.4.1.pdf) -->
            <assert test="
                not(@root) or
                   (starts-with(@root, '1.2.36.1.5001.1.0.7.1')) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7'  )) or
                (
                    not( contains(substring-after(@root, '1.2.36.1.5001.1.0.7'), '.'))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall be either '1.2.36.1.5001.1.0.7' (Individual Medicare Card Number) or
                '1.2.36.1.5001.1.0.7.1' (Medicare Card Number) OID, with
                'extension' attribute shall be either a numeric 11 digits (Individual Medicare Card Number) or
                10 digits (Medicare Card Number).
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@root) or
                not(@root = '1.2.36.1.5001.1.0.7') or
                (
                    number(@extension) = floor(@extension) and
                    string-length(@extension) = 11
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a numeric 11 digits unique Individual Medicare Card Number.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- Individual Medicare card number check digit: :: extension="<INT(11)>"
                = (  (digit 1 * 1) + (digit 2 * 3) + (digit 3 * 7) + (digit 4 * 9)
                   + (digit 5 * 1) + (digit 6 * 3) + (digit 7 * 7) + (digit 8 * 9) ) mod 10 
                   
                   The following special values are allowed:
                   •	‘00000000009’ – for a person that is ineligible for Medicare
                   •	‘00000000000’ – for a person that is eligible but unregistered
                   •	‘99999999999’ – for person that is registered but card is unavailable
                   •	‘88888888888’ – for a person whose Medicare card number is unknown.
            -->

            <assert test = "
                not(@root) or
                not(@root = '1.2.36.1.5001.1.0.7') or
                (
                    not(number(@extension)) or
                    not(string-length(@extension) = 11)
                ) or
                (
                (@extension = '00000000000') or
                (@extension = '00000000009') or
                (@extension = '99999999999') or
                (@extension = '88888888888')
                ) or
                (
                   ((1 *  number(substring(@extension, 1, 1))) +
                    (3 *  number(substring(@extension, 2, 1))) +
                    (7 *  number(substring(@extension, 3, 1))) +
                    (9 *  number(substring(@extension, 4, 1))) +
                    (1 *  number(substring(@extension, 5, 1))) +
                    (3 *  number(substring(@extension, 6, 1))) +
                    (7 *  number(substring(@extension, 7, 1))) +
                    (9 *  number(substring(@extension, 8, 1)))
                    ) mod 10 =
                    (     number(substring(@extension, 9, 1)))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall have a valid check digit in the Individual Medicare Card Number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- @root="1.2.36.1.5001.1.0.7.1.<INT(10)>"  INVALID.  Must be @root="1.2.36.1.5001.1.0.7.1" @extension="<INT(10)>"
                 Grahame Grieve Sent: Wednesday, 3 October 2012 9:39 AM :: No. in this case, you can't. (Part of the way these OIDs were registered) -->
            <!-- @root="1.2.36.1.5001.1.0.7.<INT(11)>" ............................................................................................. -->
            <!-- @root="1.2.36.1.5001.1.0.7.<INT(11)>" ............................................................................................. -->
            <!-- Individual Medicare Card Number :: root="1.2.36.1.5001.1.0.7.<INT(11)>" extension=""
            :: Appendix C: Medicare card number check algorithm (Healthcare Identifiers Software Conformance Requirements v1.4.1.pdf)           -->
<!--
            <assert test="
                not(@root) or
                   (starts-with(@root, '1.2.36.1.5001.1.0.7.1.')) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7.'  )) or
                (
                    not( contains(substring-after(@root, '1.2.36.1.5001.1.0.7.'), '.')) and
                    string-length(substring-after(@root, '1.2.36.1.5001.1.0.7.')) = 11
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall contain an OID for Individual Medicare Card Number, which
                should be ended with a national 11 digits unique identification number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->
            <!-- Individual Medicare card number check digit: :: <INT(11)>
                = (  (digit 1 * 1) + (digit 2 * 3) + (digit 3 * 7) + (digit 4 * 9)
                   + (digit 5 * 1) + (digit 6 * 3) + (digit 7 * 7) + (digit 8 * 9) ) mod 10 -->
<!--
            <assert test = "
                not(@root) or
                   (starts-with(@root, '1.2.36.1.5001.1.0.7.1.')) or
                not(starts-with(@root, '1.2.36.1.5001.1.0.7.'  )) or
                   ( contains(substring-after(@root, '1.2.36.1.5001.1.0.7.'), '.') or
                     not(string-length(substring-after(@root, '1.2.36.1.5001.1.0.7.')) = 11)
                    )  or
                (
                   ((1 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 1, 1))) +
                    (3 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 2, 1))) +
                    (7 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 3, 1))) +
                    (9 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 4, 1))) +
                    (1 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 5, 1))) +
                    (3 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 6, 1))) +
                    (7 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 7, 1))) +
                    (9 *  number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 8, 1)))
                    ) mod 10 =
                    (     number(substring(substring-after(@root, '1.2.36.1.5001.1.0.7.'), 9, 1)))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall have a valid check digit in the OID for Individual Medicare Card Number. Check all
                'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->


            <!-- ============================================================================================ -->
            <!-- Medicare Provider Number checks -
                 6 digits + PLV (Practice Location Value) character + check digit.
                 Range of PLV         : 0123456789ABCDEFGHJKLMNPQRTUVWXY
                 Range of Check Digit : YXWTLKJHFBA
            -->

            <!-- @root shall be '1.2.36.174030967.0.2 -->
            <assert test="
                not(@root) or
                not(starts-with(@root, '1.2.36.174030967.0.2')) or
                substring(substring-after(@root, '1.2.36.174030967.0.2'), 1, 1) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall be an OID for prefix of Medicare
                Provider Number '1.2.36.174030967.0.2'.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- @extension shall be 6 digits, right justified, zero filled number, plus a PLV character, plus a check digit -->
            <assert test="
                not(@root) or
                not(@root = '1.2.36.174030967.0.2') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                    string-length(@extension) = 8 and
                    number(substring(@extension, 1, 6)) = floor(substring(@extension, 1, 6)) and
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Practice_Location']/code[@displayName = substring(current()/@extension, 7, 1)] and
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Check_Digit']/code[@displayName = substring(current()/@extension, 8, 1)]
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Medicare Provider Number,
                which is a numeric 6 digits, right justified, zero filled Number,
                plus a PLV character, and a check digit character, issued by Medicare.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- Medicare Provider Number check digit validation
                 = (  (digit 1 * 3) + (digit 2 * 5) + (digit 3 * 8) + (digit 4 * 4)
                    + (digit 5 * 2) + (digit 6    ) + (PLV     * 6)                 ) mod 11
            -->
            <assert test = "
                not(@root) or
                not(@root='1.2.36.174030967.0.2') or
                not(
                    string-length(@extension) = 8 and
                    number(substring(@extension, 1, 6)) = floor(substring(@extension, 1, 6)) and
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Practice_Location']/code[@displayName = substring(current()/@extension, 7, 1)] and
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Check_Digit']/code[@displayName = substring(current()/@extension, 8, 1)]
                ) or
                (
                   ((number(substring(@extension, 1, 1)) * 3) +
                    (number(substring(@extension, 2, 1)) * 5) +
                    (number(substring(@extension, 3, 1)) * 8) +
                    (number(substring(@extension, 4, 1)) * 4) +
                    (number(substring(@extension, 5, 1)) * 2) +
                    (number(substring(@extension, 6, 1)) * 1) +
                    (number(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Practice_Location']/code[@displayName = substring(current()/@extension, 7, 1)]/@code) * 6)
                    ) mod 11 =
                    (number(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Medicare_Provider_Number_Check_Digit']/code[@displayName = substring(current()/@extension, 8, 1)]/@code))
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall have a valid check digit in the Medicare Provider Number.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ============================================================================================ -->
            <!-- Medicare Prescriber Number checks - 8 characters long - i.e. 6 numerics (the stem), the seventh character (the location) can be alpha or numeric, and the eighth character (the check digit) is only alpha                                        -->

            <!-- @root shall be '1.2.36.174030967.0.3 -->
            <assert test="
                not(@root) or
                not(starts-with(@root, '1.2.36.174030967.0.3')) or
                substring(substring-after(@root, '1.2.36.174030967.0.3'), 1, 1) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'root' attribute shall be an OID for prefix of Medicare
                Prescriber Number '1.2.36.174030967.0.3'.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- @extension shall be 8 characters long  -->
            <assert test="
                not(@root) or
                not(@root = '1.2.36.174030967.0.3') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                    string-length(normalize-space(@extension)) = 8
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Medicare Prescriber Number, a numeric and alpha
                8 characters issued by Medicare.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            
            <!-- @extension shall be started with 6 numberic numbers -->
            <assert test="
                not(@root) or
                not(@root = '1.2.36.174030967.0.3') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                number(translate(substring(@extension, 1, 6),'0123456789', '00000000000')) = 0
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Medicare Prescriber Number, starts with 6 numberic numbers.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            
            
            <!-- The 7th character of @extension shall be either alpha or numeric -->
            <assert test="
                not(@root) or
                not(@root = '1.2.36.174030967.0.3') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                number(translate(substring(@extension, 7, 1),'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '000000000000000000000000000000000000000000000000000000000000000')) = 0
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Medicare Prescriber Number, the 7th character of @extension shall be either alpha or numeric.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>  
            
            
            <!-- The 8th character of @extension shall be alpha -->
            <assert test="
                not(@root) or
                not(@root = '1.2.36.174030967.0.3') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                number(translate(substring(@extension, 8, 1),'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '00000000000000000000000000000000000000000000000000000')) = 0
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Medicare Prescriber Number, the 8th character of @extension shall be alpha.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert> 

            <!-- ============================================================================================ -->
            <!-- Begin RPSA-1735 -->
            <!-- Centrelink customer reference number checks                                                  -->
            
            <!-- @root shall be '2.16.840.1.113883.3.879.270098'                                              -->
            
            <!-- @extension shall be 10 characters, the first nine characters shall be numeric and the tenth character shall be alphaetical.  -->
            <assert test="
                not(@root) or
                not(@root = '2.16.840.1.113883.3.879.270098') or
                not(@extension) or
                normalize-space(@extension) = '' or
                (
                string-length(@extension) = 10 and
                number(substring(@extension, 1, 9)) = floor(substring(@extension, 1, 9)) and
                normalize-space(translate(substring(@extension, 10, 1), 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')) = 'a'
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'id' tag -
                The 'id' tag 'extension' attribute shall be a Centrelink customer reference number, shall be 10 character length, the first nine characters shall be numeric and the tenth character shall be alphaetical.
                Check all 'cda:id' or 'ext:id' tags to find the incorrect value.
                Refer to FAQ Vendor advice regarding OIDs in HL7 CDA documents, and section 8.2 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
           

            <!-- ============================================================================================ -->
            <!-- @assigningAuthorityName checks    JIRA Ref  CCAS-156 -->
            
            <!-- If the 'root' attribute is '1.2.36.1.5001.1.0.7' or '1.2.36.1.5001.1.0.7.1' or '1.2.36.1.5001.1.0.7.2' or '1.2.36.1.5001.1.0.7.3'
                its @assigningAuthorityName attribute shall contain 'Medicare' (non-case senstive value check) -->
            <report
                test="
                (
                (@root = '1.2.36.1.5001.1.0.7') or
                (@root = '1.2.36.1.5001.1.0.7.1') or
                (@root = '1.2.36.1.5001.1.0.7.2') or
                (@root = '1.2.36.1.5001.1.0.7.3')
                ) and 
                (@assigningAuthorityName) and 
                not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'MEDICARE'))                      
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'Medicare' as a part of its value if the 'root' attribute is
                '1.2.36.1.5001.1.0.7' or '1.2.36.1.5001.1.0.7.1' or '1.2.36.1.5001.1.0.7.2' or '1.2.36.1.5001.1.0.7.3'.
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find
                the incorrect attribute value. Refer to section 8.2 id of
                the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            <!-- If the 'root' attribute is '2.16.840.1.113883.3.879.270091' its @assigningAuthorityName attribute shall contain 'DVA' or 'Veteran' (non-case senstive value check) -->
            <report
                test="
                (@root = '2.16.840.1.113883.3.879.270091') and 
                (@assigningAuthorityName) and
                (not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'DVA')) and not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'VETERAN')))
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'DVA' or 'Veteran' as a part of its value if the 'root' attribute is '2.16.840.1.113883.3.879.270091'. 
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find the incorrect attribute value. 
                Refer to section 8.2 id of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            
            <!-- If the 'root' attribute is '2.16.840.1.113883.3.879.270098' its @assigningAuthorityName attribute shall contain 'Centrelink' (non-case senstive value check) -->
            <report
                test="
                (@root = '2.16.840.1.113883.3.879.270098') and 
                (@assigningAuthorityName) and
                not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'CENTRELINK')) 
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'Centrelink' as a part of its value if the 'root' attribute is '2.16.840.1.113883.3.879.270098'. 
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find the incorrect attribute value. 
                Refer to section 8.2 id of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <!-- If the 'root' attribute is '1.2.36.174030967.0.3' its @assigningAuthorityName attribute shall contain 'prescriber' (non-case senstive value check) -->
            <report
                test="
                (@root = '1.2.36.174030967.0.3') and 
                (@assigningAuthorityName) and 
                not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'PRESCRIBER'))                      
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'prescriber' as a part of its value if the 'root' attribute is '1.2.36.174030967.0.3'.
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find the incorrect attribute value. 
                Refer to section 8.2 id of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <!-- If the 'root' attribute is '1.2.36.174030967.1.3.2.1' its @assigningAuthorityName attribute shall contain 'pharmacy' (non-case senstive value check) -->
            <report
                test="
                (@root = '1.2.36.174030967.1.3.2.1') and 
                (@assigningAuthorityName) and 
                not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'PHARMACY'))                      
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'pharmacy' as a part of its value if the 'root' attribute is '1.2.36.174030967.1.3.2.1'.
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find the incorrect attribute value. 
                Refer to section 8.2 id of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <!-- If the 'root' attribute is '1.2.36.174030967.0.2' its @assigningAuthorityName attribute shall contain 'provider' (non-case senstive value check) -->
            <report
                test="
                (@root = '1.2.36.174030967.0.2') and 
                (@assigningAuthorityName) and 
                not(contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'PROVIDER'))                      
                ">Error: Shared Health Summary - Global Clinical Document check for
                'cda:id' or 'ext:id' or 'cda:setId' tag - The 'cda:id' or 'ext:id' or 'cda:setId' tag 'assigningAuthorityName'
                attribute shall contain 'provider' as a part of its value if the 'root' attribute is '1.2.36.174030967.0.2'.
                Check all 'cda:id' or 'ext:id' or 'cda:setId' tag to find the incorrect attribute value. 
                Refer to section 8.2 id of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
              <!-- End CCAS-156 and RPSA-1735 -->
            
        </rule>





        <!-- BEGIN :: Common Patterns: 8.3 TIME -->
        <!--cda:time, ext:time, cda:birthTime, ext:birthTime, cda:deceasedTime, ext:deceasedTime, cda:effectiveTime, ext:effectiveTime -->

        <!--
        ISO 8601 time syntax : 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
         -->
        <!--
             Schema default datatype for time:
             .../author                                         TS
             .../legalAuthenticator                             TS
             .../encounterParticipant                           IVL_TS
             .../participant                                    IVL_TS
             .../performer                                      IVL_TS

             Schema default datatype for effectiveTime:
             ClinicalDocument/effectiveTime                     TS
             .../act/effectiveTime                              IVL_TS
             .../encompassingEncounter/effectiveTime            IVL_TS
             .../encounter/effectiveTime                        IVL_TS
             .../ext:entitlement/ext:effectiveTime              IVL_TS
             .../observation/effectiveTime                      IVL_TS
             .../procedure/effectiveTime                        IVL_TS
             .../substanceAdministration/effectiveTime          SXCM_TS (same as TS but with extra operator attribute)
             .../supply/effectiveTime                           SXCM_TS (same as TS but with extra operator attribute)

             Note that it is kind of lazy to chuck the validation of
             substanceAdministrator/effectiveTime and supply/effectiveTime here. If we
             need to validate full SXCM_TS datatype, we need to move the validation of
             substanceAdministration/effectiveTime and supply/effectiveTime to a new
             rule context dedicated for validating SXCM_TS datatype.
         -->
        <rule context="ext:time                                                                  |
                       cda:birthTime                                                             |
                       ext:birthTime                                                             |
                       cda:deceasedTime                                                          |
                       ext:deceasedTime                                                          |

                       cda:effectiveTime[@xsi:type = 'TS'      or substring-after(normalize-space(@xsi:type), ':') = 'TS']                                         |
                       cda:effectiveTime[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:low                             |
                       cda:effectiveTime[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:high                            |
                       cda:effectiveTime[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:center                          |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:low                  |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:high                 |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:center               |

                       cda:effectiveTime[parent::cda:act]/cda:low                                |
                       cda:effectiveTime[parent::cda:act]/cda:high                               |
                       cda:effectiveTime[parent::cda:act]/cda:center                             |
                       cda:effectiveTime[parent::cda:encompassingEncounter]/cda:low              |
                       cda:effectiveTime[parent::cda:encompassingEncounter]/cda:high             |
                       cda:effectiveTime[parent::cda:encompassingEncounter]/cda:center           |
                       cda:effectiveTime[parent::cda:encounter]/cda:low                          |
                       cda:effectiveTime[parent::cda:encounter]/cda:high                         |
                       cda:effectiveTime[parent::cda:encounter]/cda:center                       |
                       ext:effectiveTime[parent::ext:entitlement]/cda:low                        |
                       ext:effectiveTime[parent::ext:entitlement]/cda:high                       |
                       ext:effectiveTime[parent::ext:entitlement]/cda:center                     |
                       cda:effectiveTime[parent::cda:observation]/cda:low                        |
                       cda:effectiveTime[parent::cda:observation]/cda:high                       |
                       cda:effectiveTime[parent::cda:observation]/cda:center                     |
                       cda:effectiveTime[parent::cda:procedure]/cda:low                          |
                       cda:effectiveTime[parent::cda:procedure]/cda:high                         |
                       cda:effectiveTime[parent::cda:procedure]/cda:center                       |

                       cda:effectiveTime[not(@xsi:type) and parent::cda:substanceAdministration] |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:supply]                  |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:ClinicalDocument]        |

                       cda:time[@xsi:type = 'TS'      or substring-after(normalize-space(@xsi:type), ':') = 'TS']                                                  |
                       cda:time[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:low                                      |
                       cda:time[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:high                                     |
                       cda:time[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:center                                   |
                       cda:time[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:low                           |
                       cda:time[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:high                          |
                       cda:time[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:center                        |

                       cda:time[parent::cda:encounterParticipant]/cda:low                        |
                       cda:time[parent::cda:encounterParticipant]/cda:high                       |
                       cda:time[parent::cda:encounterParticipant]/cda:center                     |
                       cda:time[parent::cda:participant]/cda:low                                 |
                       cda:time[parent::cda:participant]/cda:high                                |
                       cda:time[parent::cda:participant]/cda:center                              |
                       cda:time[parent::cda:performer]/cda:low                                   |
                       cda:time[parent::cda:performer]/cda:high                                  |
                       cda:time[parent::cda:performer]/cda:center                                |

                       cda:time[not(@xsi:type) and parent::cda:author]                           |
                       cda:time[not(@xsi:type) and parent::cda:legalAuthenticator]               |
                       cda:copyTime">

            <!-- validating TS datatype -->

            <report test="
                name() != 'time' and substring-after(name(), ':') != 'time' and
                name() != 'effectiveTime' and substring-after(name(), ':') != 'effectiveTime' and
                @xsi:type and
                normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag 'xsi:type' attribute shall contain a value.
                Check all 'time' tags to find the attribute of empty value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                name() != 'time' and substring-after(name(), ':') != 'time' and
                name() != 'effectiveTime' and substring-after(name(), ':') != 'effectiveTime' and
                @xsi:type and
                normalize-space(@xsi:type) != '' and
                normalize-space(@xsi:type) != 'TS' and
                not(substring-after(normalize-space(@xsi:type), ':') = 'TS')"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag 'xsi:type' attribute shall contain the value 'TS'.
                Check all 'time' tags to find the attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="
                @value or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag shall have at least the 'value' or 'nullFlavor' attribute.
                Check all 'time' tags to find the missing 'nullFlavor' or 'value' attribute.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag 'nullFlavor' attribute shall contain a value.
                Check all 'time' tags to find the 'nullFlavor' attribute of missing value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag 'value' attribute shall contain a value.
                Check all 'time' tags to find the 'value' attribute of missing value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- Any time that is more specific than a day SHALL include a timezone. -->
            <report test="
                @value                      and
                string-length(@value) > 8   and
                not(contains(@value,'+'))   and not(contains(@value,'-'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag 'value' attribute shall contain a timezone value.
                "Any time that is more specific than a day SHALL include a timezone".
                Check all 'time' tags to find the 'value' attribute of missing timezone value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ================================================================== -->
            <!-- ============================ @value:ts =========================== -->

            <!-- check value of time with fraction of seconds, with or without timezone
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^^^^^^^^^^^                                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(@value,'.'))) != string(number(@value))) and
                (string-length(substring-before(@value,'.')) = 14))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect fraction of second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect fraction of second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '+' timezone
                 'YYYYMMDDHH+ZZzz' or 'YYYYMMDDHHMM+ZZzz' or 'YYYYMMDDHHMMSS+ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'+'))    or
                ((string(number(substring-before(@value,'+'))) != string(number(@value))) and
                (string-length(substring-before(@value,'+')) > 11) and
                (string-length(substring-before(@value,'+')) &lt; 15) and
                (string-length(substring-before(@value,'+')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '-' timezone
                 'YYYYMMDDHH-ZZzz' or 'YYYYMMDDHHMM-ZZzz' or 'YYYYMMDDHHMMSS-ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'-'))    or
                ((string(number(substring-before(@value,'-'))) != string(number(@value))) and
                (string-length(substring-before(@value,'-')) > 11) and
                (string-length(substring-before(@value,'-')) &lt; 15) and
                (string-length(substring-before(@value,'-')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect TimeZone -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect TimeZone -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and without timezone (could safely assume YYYYMMDD only)
                 'YYYYMMDD'
                  ^^^^                                                                                             -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                contains(@value,'+')         or
                contains(@value,'-')         or
                ((string(number(@value)) != string(number('a'))) and
                (string-length(@value) >= 4) and
                (string-length(@value) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of year, assume years from 19xx - XXxx
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^                                             -->
<!--
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                ((number(substring(@value,1,2)) >= 19) and
                (number(substring(@value,1,2)) &lt; 21))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Year -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Year -
                The value for year must be more recent than 1900.
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of month, from 1 to 12
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                     ^^                                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(@value) &lt; 5 or
                ((number(substring(@value,5,2)) >= 1) and
                (number(substring(@value,5,2)) &lt; 13))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Month -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 1,3,5,7,8,10,12 shall be from 1 to 31
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                     -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 32))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 4,6,9,11 shall be from 1 to 30
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                              -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 31))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Month -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 29 if leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                    -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) != 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 30))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 28 if not leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                        -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) = 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 29))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of hour, from 0 to 23
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                         ^^                                        -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or
                ((number(substring(@value,9,2)) >= 0) and
                (number(substring(@value,9,2)) &lt; 24))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Hour -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of minute, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                           ^^                                      -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or
                ((number(substring(@value,11,2)) >= 0) and
                (number(substring(@value,11,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Minute -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of second, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                             ^^                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or
                ((number(substring(@value,13,2)) >= 0) and
                (number(substring(@value,13,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <!--
             Schema default datatype for time:
             .../author                                         TS
             .../legalAuthenticator                             TS
             .../encounterParticipant                           IVL_TS
             .../participant                                    IVL_TS
             .../performer                                      IVL_TS

             Schema default datatype for effectiveTime:
             ClinicalDocument/effectiveTime                     TS
             .../act/effectiveTime                              IVL_TS
             .../encompassingEncounter/effectiveTime            IVL_TS
             .../encounter/effectiveTime                        IVL_TS
             .../ext:entitlement/ext:effectiveTime              IVL_TS
             .../observation/effectiveTime                      IVL_TS
             .../procedure/effectiveTime                        IVL_TS
             .../substanceAdministration/effectiveTime          SXCM_TS
             .../supply/effectiveTime                           SXCM_TS
         -->
        <rule context="cda:effectiveTime[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']                                     |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase                          |

                       cda:effectiveTime[not(@xsi:type) and parent::cda:act]                     |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:encompassingEncounter]   |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:encounter]               |
                       ext:effectiveTime[not(@xsi:type) and parent::ext:entitlement]             |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:observation]             |
                       cda:effectiveTime[not(@xsi:type) and parent::cda:procedure]               |

                       cda:time[not(@xsi:type) and parent::cda:encounterParticipant]             |
                       cda:time[not(@xsi:type) and parent::cda:participant]                      |
                       cda:time[not(@xsi:type) and parent::cda:performer]">

            <!-- Validating IVL_TS datatype high level tags and attributes -->

            <assert test="
                @value or cda:center or cda:low or cda:high or cda:width or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have at least the 'value' or 'nullFlavor'
                attribute or 'low' or 'high' or 'center' or 'width' child tag.
                Check all 'effectiveTime' tags to find the missing 'nullFlavor' or 'value' attribute
                or 'low' or 'high' or 'center' or 'width' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="
                name() != 'effectiveTime' and substring-after(name(), ':') != 'effectiveTime' and
                @xsi:type and
                normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'xsi:type' attribute shall contain a value.
                Check all 'effectiveTime' tags to find the attribute of empty value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                name() != 'effectiveTime' and substring-after(name(), ':') != 'effectiveTime' and
                @xsi:type and
                normalize-space(@xsi:type) != '' and
                normalize-space(@xsi:type) != 'IVL_TS' and
                not(substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS')"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'xsi:type' attribute shall contain the value 'IVL_TS'.
                Check all 'effectiveTime' tags to find the attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'value' attribute shall contain a value.
                Check all 'effectiveTime' tags to find the missing attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- Any time that is more specific than a day SHALL include a timezone. -->
            <report
                test="@value                and
                string-length(@value) > 8   and
                not(contains(@value,'+'))   and not(contains(@value,'-'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'value' attribute shall contain a timezone value.
                "Any time that is more specific than a day SHALL include a timezone".
                Check all 'effectiveTime' tags to find the 'value' attribute of missing timezone value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ================================================================== -->
            <!-- ============================ @value:ts =========================== -->

            <!-- check value of time with fraction of seconds, with or without timezone
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^^^^^^^^^^^                                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(@value,'.'))) != string(number(@value))) and
                (string-length(substring-before(@value,'.')) = 14))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect DateTime -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect fraction of second -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect fraction of second -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '+' timezone
                 'YYYYMMDDHH+ZZzz' or 'YYYYMMDDHHMM+ZZzz' or 'YYYYMMDDHHMMSS+ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'+'))    or
                ((string(number(substring-before(@value,'+'))) != string(number(@value))) and
                (string-length(substring-before(@value,'+')) > 11) and
                (string-length(substring-before(@value,'+')) &lt; 15) and
                (string-length(substring-before(@value,'+')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect DateTime -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '-' timezone
                 'YYYYMMDDHH-ZZzz' or 'YYYYMMDDHHMM-ZZzz' or 'YYYYMMDDHHMMSS-ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'-'))    or
                ((string(number(substring-before(@value,'-'))) != string(number(@value))) and
                (string-length(substring-before(@value,'-')) > 11) and
                (string-length(substring-before(@value,'-')) &lt; 15) and
                (string-length(substring-before(@value,'-')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect DateTime -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect TimeZone -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect TimeZone -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and without timezone (could safely assume YYYYMMDD only)
                 'YYYYMMDD'
                  ^^^^                                                                                             -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                contains(@value,'+')         or
                contains(@value,'-')         or
                ((string(number(@value)) != string(number('a'))) and
                (string-length(@value) >= 4) and
                (string-length(@value) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect DateTime -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of year, assume years from 19xx - XXxx
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^                                             -->
<!--
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                ((number(substring(@value,1,2)) >= 19) and
                (number(substring(@value,1,2)) &lt; 21))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Year -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Year -
                The value for year must be more recent than 1900.
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of month, from 1 to 12
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                     ^^                                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(@value) &lt; 5 or
                ((number(substring(@value,5,2)) >= 1) and
                (number(substring(@value,5,2)) &lt; 13))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Month -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 1,3,5,7,8,10,12 shall be from 1 to 31
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                     -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 32))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Date -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 4,6,9,11 shall be from 1 to 30
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                              -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 31))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Month -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 29 if leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                    -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) != 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 30))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Date -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 28 if not leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                        -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) = 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 29))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Date -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of hour, from 0 to 23
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                         ^^                                        -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or
                ((number(substring(@value,9,2)) >= 0) and
                (number(substring(@value,9,2)) &lt; 24))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Hour -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of minute, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                           ^^                                      -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or
                ((number(substring(@value,11,2)) >= 0) and
                (number(substring(@value,11,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Minute -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of second, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                             ^^                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or
                ((number(substring(@value,13,2)) >= 0) and
                (number(substring(@value,13,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag - Incorrect Second -
                The 'effectiveTime' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'effectiveTime' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ============================================================ -->

            <report test="count(cda:low) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag shall appear only once.
                Check all 'effectiveTime' tags to find the duplicate 'low' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:high) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'high' tag shall appear only once.
                Check all 'effectiveTime' tags to find the duplicate 'high' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:center) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'center' tag shall appear only once.
                Check all 'effectiveTime' tags to find the duplicate 'center' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="count(cda:width) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' tag shall appear only once.
                Check all 'effectiveTime' tags to find the duplicate 'width' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- The below 4 tests are superceded by the 'center' tag test immediate followed. -->
            <!--
            <report test="cda:low and cda:width and (cda:high or cda:center)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have 'low' and 'width' without 'high or center' tags.
                Check all 'effectiveTime' tags to find the incorrect use of tags.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:high and cda:width and (cda:low or cda:center)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have 'high' and 'width' without 'low or center' tags.
                Check all 'effectiveTime' tags to find the incorrect use of tags.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:low and cda:high and (cda:center or cda:width)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have 'low' and 'high' without 'center or width' tags.
                Check all 'effectiveTime' tags to find the incorrect use of tags.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:center and cda:width and (cda:low or cda:high)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have 'low' and 'high' without 'center or width' tags.
                Check all 'effectiveTime' tags to find the incorrect use of tags.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            -->

            <!-- The 'center' tag is used with 'width' tag, but should not be coexist with 'low' or 'high' tag -->

            <report test="cda:center and (cda:low or cda:high)"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag shall have 'center' or 'low and/or high' tag but not both.
                Check all 'effectiveTime' tags to find the incorrect use of 'center' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!--The interval of time pattern is defined in terms of both of its lowest and highest values.
                we need to ensure value in low is not greater than value in high -->

            <!-- check value of time with fraction of seconds, with '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                  ^^^^^^^^^^^^^^^^^^^                                        -->
            <report test="
                cda:low  and cda:low/@value            and
                cda:high and cda:high/@value           and
                normalize-space(cda:low/@value)  != '' and
                normalize-space(cda:high/@value) != '' and
                contains(cda:low/@value,'.')           and
                contains(cda:high/@value, '.')         and
                contains(cda:low/@value,'+')           and
                contains(cda:high/@value, '+')         and
                (number(substring-before(cda:low/@value,'.')) +
                number(substring-after(substring-before(cda:low/@value,'+'),'.')) >
                number(substring-before(cda:high/@value,'.')) +
                number(substring-after(substring-before(cda:high/@value,'+'),'.')))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag 'value' attribute shall be a value less than than the
                'high' tag 'value' attribute.
                Check all 'effectiveTime' tags to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- check value of time with fraction of seconds, with '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                  ^^^^^^^^^^^^^^^^^^^                                        -->
            <report test="
                cda:low  and cda:low/@value            and
                cda:high and cda:high/@value           and
                normalize-space(cda:low/@value)  != '' and
                normalize-space(cda:high/@value) != '' and
                contains(cda:low/@value,'.')           and
                contains(cda:high/@value, '.')         and
                contains(cda:low/@value,'-')           and
                contains(cda:high/@value, '-')         and
                (number(substring-before(cda:low/@value,'.')) +
                number(substring-after(substring-before(cda:low/@value,'-'),'.')) >
                number(substring-before(cda:high/@value,'.')) +
                number(substring-after(substring-before(cda:high/@value,'-'),'.')))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'effectiveTime' tags to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- check value of time without fraction of seconds, with '+' timezone
                 'YYYYMMDDHHMM+ZZzz' or 'YYYYMMDDHHMMSS+ZZzz'
                  ^^^^^^^^^^^^           ^^^^^^^^^^^^^^                         -->
            <report test="
                cda:low  and cda:low/@value            and
                cda:high and cda:high/@value           and
                normalize-space(cda:low/@value)  != '' and
                normalize-space(cda:high/@value) != '' and
                contains(cda:low/@value, '+')          and
                contains(cda:high/@value,'+')          and
                (number(substring-before(cda:low/@value,'+')) > number(substring-before(cda:high/@value,'+')))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'effectiveTime' tags to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- check value of time without fraction of seconds, with '-' timezone
                 'YYYYMMDDHHMM-ZZzz' or 'YYYYMMDDHHMMSS-ZZzz'
                  ^^^^^^^^^^^^           ^^^^^^^^^^^^^^                         -->
            <report test="
                cda:low  and cda:low/@value            and
                cda:high and cda:high/@value           and
                normalize-space(cda:low/@value)  != '' and
                normalize-space(cda:high/@value) != '' and
                contains(cda:low/@value, '-')          and
                contains(cda:high/@value,'-')          and
                (number(substring-before(cda:low/@value,'-')) > number(substring-before(cda:high/@value,'-')))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'effectiveTime' tags to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- check value of time without fraction of seconds, and without timezone
                 'YYYYMMDD'
                  ^^^^^^^^                                                         -->
            <report test="
                cda:low  and cda:low/@value            and
                cda:high and cda:high/@value           and
                normalize-space(cda:low/@value)  != '' and
                normalize-space(cda:high/@value) != '' and
                not(contains(cda:low/@value, '+'))     and
                not(contains(cda:high/@value,'+'))     and
                not(contains(cda:low/@value, '-'))     and
                not(contains(cda:high/@value,'-'))     and
                (number(cda:low/@value) > number(cda:high/@value))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'effectiveTime' tags to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']">

            <!-- Validating PIVL_TS datatype high level tags and attributes -->

            <assert test="
                @value or @nullFlavor or cda:frequency or cda:period or cda:phase"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                The 'time' tag shall have at least the 'value' or 'nullFlavor'
                attribute or 'frequency' or 'period' or 'phase' child tag.
                Check all 'time' tags, or frequency' or 'period' or 'phase' child tag.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="@value and normalize-space(@value) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'value' attribute shall contain a value.
                Check all 'effectiveTime' tags to find the missing attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- Any time that is more specific than a day SHALL include a timezone. -->
            <report
                test="@value                and
                string-length(@value) > 8   and
                not(contains(@value,'+'))   and not(contains(@value,'-'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'effectiveTime' tag 'value' attribute shall contain a timezone value.
                "Any time that is more specific than a day SHALL include a timezone".
                Check all 'effectiveTime' tags to find the 'value' attribute of missing timezone value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ================================================================== -->
            <!-- ============================ @value:ts =========================== -->

            <!-- check value of time with fraction of seconds, with or without timezone
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^^^^^^^^^^^                                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(@value,'.'))) != string(number(@value))) and
                (string-length(substring-before(@value,'.')) = 14))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect fraction of second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check fraction of second value, with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                 ^^^^                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                not(contains(@value,'.'))    or
                ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and
                (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect fraction of second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '+' timezone
                 'YYYYMMDDHH+ZZzz' or 'YYYYMMDDHHMM+ZZzz' or 'YYYYMMDDHHMMSS+ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'+'))    or
                ((string(number(substring-before(@value,'+'))) != string(number(@value))) and
                (string-length(substring-before(@value,'+')) > 11) and
                (string-length(substring-before(@value,'+')) &lt; 15) and
                (string-length(substring-before(@value,'+')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and with a '-' timezone
                 'YYYYMMDDHH-ZZzz' or 'YYYYMMDDHHMM-ZZzz' or 'YYYYMMDDHHMMSS-ZZzz'
                  ^^^^^^^^^^           ^^^^^^^^^^^^           ^^^^^^^^^^^^^^          -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                not(contains(@value,'-'))    or
                ((string(number(substring-before(@value,'-'))) != string(number(@value))) and
                (string-length(substring-before(@value,'-')) > 11) and
                (string-length(substring-before(@value,'-')) &lt; 15) and
                (string-length(substring-before(@value,'-')) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect TimeZone -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect TimeZone -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of time without fraction of seconds, and without timezone (could safely assume YYYYMMDD only)
                 'YYYYMMDD'
                  ^^^^                                                                                             -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                contains(@value,'.')         or
                contains(@value,'+')         or
                contains(@value,'-')         or
                ((string(number(@value)) != string(number('a'))) and
                (string-length(@value) >= 4) and
                (string-length(@value) mod 2 = 0))"
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect DateTime -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of year, assume years from 19xx - XXxx
                 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                  ^^^^                                             -->
<!--
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                ((number(substring(@value,1,2)) >= 19) and
                (number(substring(@value,1,2)) &lt; 21))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Year -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag -
                Incorrect Year - The value for year must be more recent than 1900.
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of month, from 1 to 12
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                     ^^                                            -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(@value) &lt; 5 or
                ((number(substring(@value,5,2)) >= 1) and
                (number(substring(@value,5,2)) &lt; 13))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Month -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 1,3,5,7,8,10,12 shall be from 1 to 31
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                     -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 32))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 4,6,9,11 shall be from 1 to 30
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                              -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 2     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 31))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Month -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 29 if leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                    -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) != 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 30))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of date, month 2 shall be from 1 to 28 if not leap year
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                       ^^                                                        -->
            <assert test="
                not(@value)                           or
                normalize-space(@value) = ''          or
                string-length(@value) &lt; 7          or
                number(substring(@value,5,2)) = 1     or
                number(substring(@value,5,2)) = 3     or
                number(substring(@value,5,2)) = 4     or
                number(substring(@value,5,2)) = 5     or
                number(substring(@value,5,2)) = 6     or
                number(substring(@value,5,2)) = 7     or
                number(substring(@value,5,2)) = 8     or
                number(substring(@value,5,2)) = 9     or
                number(substring(@value,5,2)) = 10    or
                number(substring(@value,5,2)) = 11    or
                number(substring(@value,5,2)) = 12    or
                number(substring(@value,5,2)) > 12    or
                (number(substring(@value,1,4)) mod 4) = 0 or
                ((number(substring(@value,7,2)) >= 1) and
                (number(substring(@value,7,2)) &lt; 29))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Date -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of hour, from 0 to 23
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                         ^^                                        -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or
                ((number(substring(@value,9,2)) >= 0) and
                (number(substring(@value,9,2)) &lt; 24))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Hour -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of minute, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                           ^^                                      -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or
                ((number(substring(@value,11,2)) >= 0) and
                (number(substring(@value,11,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Minute -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- check value of second, from 0 to 59
                'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
                             ^^                                    -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or
                ((number(substring(@value,13,2)) >= 0) and
                (number(substring(@value,13,2)) &lt; 60))
                "
                >Error: Shared Health Summary -
                Global Clinical Document check for "time" tag - Incorrect Second -
                The 'time' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'time' tags to find the 'value' attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>


        <rule context="cda:effectiveTime[@xsi:type = 'IVL_TS'  or substring-after(normalize-space(@xsi:type), ':') = 'IVL_TS']/cda:width                          |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:phase/cda:width               |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:period                        |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:frequency/cda:numerator       |
                       cda:effectiveTime[@xsi:type = 'PIVL_TS' or substring-after(normalize-space(@xsi:type), ':') = 'PIVL_TS']/cda:frequency/cda:denominator     |

                       cda:effectiveTime[parent::cda:act]/cda:width                             |
                       cda:effectiveTime[parent::cda:encompassingEncounter]/cda:width           |
                       cda:effectiveTime[parent::cda:encounter]/cda:width                       |
                       ext:effectiveTime[parent::ext:entitlement]/cda:width                     |
                       cda:effectiveTime[parent::cda:observation]/cda:width                     |
                       cda:effectiveTime[parent::cda:procedure]/cda:width                       |

                       cda:time[parent::cda:encounterParticipant]/cda:width                     |
                       cda:time[parent::cda:participant]/cda:width                              |
                       cda:time[parent::cda:performer]/cda:width">

           <!-- Validating PQ datatype of witdth of IVL_TS;
                                          phase/width of PIVL_TS;
                                          period of PIVL_TS
                                          frequency/numerator of PIVL_TS
                                          frequency/denominator of PIVL_TS
           -->

            <report test="
                @xsi:type and
                normalize-space(@xsi:type) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'xsi:type' attribute shall contain a value.
                Check all 'effectiveTime' tags to find child tags having attribute of empty value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @xsi:type and
                normalize-space(@xsi:type) != '' and
                normalize-space(@xsi:type) != 'PQ' and
                not(substring-after(normalize-space(@xsi:type), ':') = 'PQ')"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'xsi:type' attribute shall contain the value 'PQ'.
                Check all 'effectiveTime' tags to find child tags having attribute of incorrect value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'value' attribute shall contain a value.
                Check all 'effectiveTime' tags to find the 'width' or 'period' or
                'numerator' or 'denominator' child tags that have empty attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="@unit and normalize-space(@unit) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'unit' attribute shall contain a value.
                Check all 'effectiveTime' tags to find the 'width' or 'period' or
                'numerator' or 'denominator' child tags that have empty attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <assert
                test="not(@unit) or (normalize-space(@unit) = '') or (@unit = 'd') or (@unit = 'wk') or (@unit = 'mo') or (@unit = 'a')"
                >Error: Shared Health Summary -
                Global Clinical Document check for "effectiveTime" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'unit' attribute shall be 'd' or 'wk' or 'mo' or 'a'.
                Check all 'effectiveTime' tags to find the 'width' or 'period' or
                'numerator' or 'denominator' child tags that have incorrect attribute value.
                Refer to section 8.3 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>





        <!-- BEGIN :: Common Patterns: 8.4 ENTITY IDENTIFIER -->

        <rule context="ext:asEntityIdentifier">

            <!-- asEntityIdentifier/@classCode -->
            <!--the cardinality of the children data elements comes from the R-MIM diagram.-->

            <assert test="@classCode">Error: Shared Health Summary -
                Global Clinical Document check for "ext:asEntityIdentifier" tag -
                The 'ext:asEntityIdentifier' tag 'classCode' attribute is missing.
                Check all 'ext:asEntityIdentifier' tags to find the missing 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''">Error: Shared Health Summary -
                Global Clinical Document check for "ext:asEntityIdentifier" tag -
                The 'ext:asEntityIdentifier' tag 'classCode' attribute shall contain a value.
                Check all 'ext:asEntityIdentifier' tags to find the missing 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or
                normalize-space(@classCode) = '' or
                @classCode='IDENT'"
                >Error: Shared Health Summary -
                Global Clinical Document check for "ext:asEntityIdentifier" tag -
                The 'ext:asEntityIdentifier' tag 'classCode' attribute shall be 'IDENT'.
                Check all 'ext:asEntityIdentifier' tags to find the incorrect 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>


            <!-- id - 1..1 -->
            <!--All R-MIM diagrams show id as 1..1-->

            <assert test="ext:id">Error: Shared Health Summary -
                Global Clinical Document check for "ext:asEntityIdentifier/ext:id" tag -
                The 'ext:id' tag is missing. Check all "ext:asEntityIdentifier' tags to find
                the missing 'id' tag. Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(ext:id) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'ext:asEntityIdentifier/ext:id' tag -
                The 'id' tag shall appear only once.
                Check all 'ext:asEntityIdentifier' tags to find the duplicate 'id' tag.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- Mantis 4358: Attribute ext:asEntityIdentifier/ext:id/@root SHOULD NOT be an UUID (i.e. should be an OID) -->
            <!-- OID format test -->
            <report
                test="
                ext:id and
                ext:id/@root and
                normalize-space(ext:id/@root) != '' and
                not(contains(ext:id/@root,'.'))
                ">Error: Shared Health Summary -
                Global Clinical Document check for "ext:asEntityIdentifier/ext:id" tag - The 'id' tag 'root' attribute shall
                be a valid OID. Check all 'ext:asEntityIdentifier/ext:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.4 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- Mantis 2584: Attribute ext:id/@assigningAuthorityName SHOULD be used, and it is recommended only (optional) -->
            <!--
            <assert test="ext:id/@assigningAuthorityName">Error: Shared Health Summary -
                Global Clinical Document check for "ext:id" tag -
                The 'ext:id' tag 'assigningAuthorityName' attribute is missing. Check all
                "ext:asEntityIdentifier' tags to find the 'id' tag with the missing
                'assigningAuthorityName' attribute. Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            -->

            <!-- Other attributes of "ext:id" are being tested by Shared_Health_Summary_Global_Checks.sch. -->


            <!-- code - 0..1 -->

            <report test="count(ext:code) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'ext:asEntityIdentifier/ext:code' tag -
                The 'ext:code' tag shall appear only once. Check all 'ext:asEntityIdentifier' tag
                to find the duplicate 'code' tag. Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- The attributes of "ext:code" (code, codeSystem, codeSystemName, displayName) are being tested by Shared_Health_Summary_Global_Checks.sch. -->


            <!-- assigningGeographicArea - 0..1 -->

            <report test="count(ext:assigningGeographicArea) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'ext:asEntityIdentifier/ext:assigningGeographicArea' tag -
                The 'assigningGeographicArea' tag shall appear only once. Check all
                'ext:assigningGeographicArea' tags to find the duplicate 'assigningGeographicArea'
                tag. Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>


        <rule context="ext:asEntityIdentifier/ext:assigningGeographicArea">

            <assert test="@classCode"
                >Error: Shared Health Summary - Global Clinical Document check for
                "ext:asEntityIdentifier/ext:assigningGeographicArea" tag -
                The 'assigningGeographicArea' tag 'classCode' attribute is missing.
                Check all 'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the missing 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - Global Clinical Document check for
                "ext:asEntityIdentifier/ext:assigningGeographicArea" tag -
                The 'assigningGeographicArea' tag 'classCode' attribute shall contain a value.
                Check all 'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the missing 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@classCode) or
                normalize-space(@classCode) = '' or
                @classCode='PLC'"
                >Error: Shared Health Summary - Global Clinical Document check for
                "ext:asEntityIdentifier/ext:assigningGeographicArea" tag -
                The 'assigningGeographicArea' tag 'classCode' attribute shall be 'PLC'. Check all
                'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the incorrect 'classCode' attribute.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ext:name - 0..1 -->

            <report test="ext:name and normalize-space(ext:name) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for
                "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'name'
                tag shall contain a value. Check all 'ext:name' tag to find the missing value.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                ext:name and
                normalize-space(ext:name) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Geographic_Area']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/ext:name, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])"
                >Error: Shared Health Summary - Global Clinical Document check for
                "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'name'
                tag shall be as per AS 5017-2006: Health Care Client Identifier
                Geographic Area. It shall be the range and extent that the identifier applies to
                the object with which it is associated that is populated directly from the
                geographic area. This shall NOT be used for machine readability purposes.
                Check all 'ext:name' tag to find the incorrect value.
                Refer to section 8.4 Entity Identifier of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: 8.5 PERSON NAME -->

        <rule context="cda:name[not(
                      ancestor::cda:manufacturedMaterial or
                      ancestor::cda:product or
                      ancestor::cda:receivedOrganization or
                      ancestor::cda:representedOrganization or
                      ancestor::cda:representedCustodianOrganization or
                      ancestor::cda:scopingOrganization or
                      ancestor::cda:serviceProviderOrganization or
                      ancestor::cda:targetSiteCode or
                      ancestor::ext:employerOrganization)]">
           
            

            <report test="count(cda:family) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'family' tag
                shall appear only once. Check all 'cda:name' tags to find the duplicate 'family'
                child tag. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:family and not(cda:family[@nullFlavor]) and normalize-space(cda:family) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for "name" tag - The 'family' tag
                shall contain a value or 'nullFlavor' attribute. Check all 'cda:name/cda:family' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            <report test="cda:family and normalize-space(cda:family) != '' and cda:family[@nullFlavor]"
                >Error: Shared Health Summary - Global Clinical Document check for "name" tag - The 'family' tag
                shall contain a value or 'nullFlavor' attribute but not both. Check all 'cda:name/cda:family' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            <report test="cda:family and normalize-space(cda:family) = '' and cda:family[@nullFlavor] and cda:family[normalize-space(@nullFlavor) = '']"
                >Error: Shared Health Summary - Global Clinical Document check for "name" tag - The 'family' tag
                'nullFlavor' attribute shall contain a value. Check all 'cda:name/cda:family' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            
            <!-- prefix - 0..* -->

            <report test="cda:prefix and normalize-space(cda:prefix ) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'prefix' tag
                shall contain a value. Check all 'cda:name/cda:prefix' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            
            <!-- given - 0..* -->

            <report test="cda:given and normalize-space(cda:given) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'given' tag
                shall contain a value. Check all 'cda:name/cda:given' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- suffix - 0..* -->

            <report test="cda:suffix and normalize-space(cda:suffix) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'suffix' tag
                shall contain a value. Check all 'cda:name/cda:suffix' tags to find the missing
                value. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @use is optional, it also can exist and be blank -->

            <!-- @use exist, and @use not blank, and @use not contains space(single use code), and @use is not in vocab -->
            <report
                test="@use and
                normalize-space(@use) != '' and
                not(contains(@use, ' ')) and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                    (@code = (current()/@use)) or
                    (@alternativeCode = (current()/@use)) or
                    (@hl7Code  = (current()/@use))
                ])"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'name' tag
                'use' attribute shall be coded as per AS 5017-2006: Health Care
                Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use'
                attribute. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @use exist, and @use not blank, and @use contains one space(two use codes), and at least first or second use code is not in vocab -->
            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(@use, ' ') and
                not(contains(substring-after(@use, ' '), ' ')) and (
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                        (@code = substring-before(current()/@use,' ')) or
                        (@alternativeCode = substring-before(current()/@use,' ')) or
                        (@hl7Code = substring-before(current()/@use,' '))
                    ]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                        (@code = substring-after(current()/@use,' ')) or
                        (@alternativeCode = substring-after(current()/@use,' ')) or
                        (@hl7Code = substring-after(current()/@use,' '))
                    ])
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'name' tag
                'use' attribute shall be coded as per AS 5017-2006: Health Care
                Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use'
                attribute. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @use exist, and @use not blank, and @use contains two space(three use codes), and at least one of the three use code is not in vocab -->
            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(@use, ' ') and
                not(contains(substring-after(substring-after(@use, ' '), ' '), ' ')) and (
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                        (@code = substring-before(current()/@use,' ')) or
                        (@alternativeCode = substring-before(current()/@use,' ')) or
                        (@hl7Code = substring-before(current()/@use,' '))
                    ]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                        (@code = substring-before(substring-after(current()/@use,' '),' ')) or
                        (@alternativeCode = substring-before(substring-after(current()/@use,' '),' ')) or
                        (@hl7Code = substring-before(substring-after(current()/@use,' '),' '))
                    ]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[
                        (@code = substring-after(substring-after(current()/@use,' '),' ')) or
                        (@alternativeCode = substring-after(substring-after(current()/@use,' '),' ')) or
                        (@hl7Code = substring-after(substring-after(current()/@use,' '),' '))
                    ])
                )"
                >Error: Shared Health Summary -
                Global Clinical Document check for "name" tag - The 'name' tag
                'use' attribute shall be coded as per AS 5017-2006: Health Care
                Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use'
                attribute. Refer to section 8.5 Person Name of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: 8.6 ADDRESS -->

<!-- ext:telecom is added due to new schema released for pahology Release 5 PCEHR-->

        <rule context="cda:addr[not(ancestor::cda:birthplace)] | ext:addr">

            <!-- 0004359: addr must have nullFlavor, or one or more of some parts (streetAddressLine etc), but not any immediate text value.
                          - immediate text means it can be like <addr>xyz</addr>,
                          and some parts mean it shall have one of the child tags streetAddressLine, unitType or streetNameType etc, -->

            <assert test="
                normalize-space(concat(text()[1], text()[2], text()[3], text()[4], text()[5],
                                       text()[6], text()[7], text()[8], text()[9], text()[10],
                                       text()[11], text()[12], text()[13], text()[14])) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                The 'addr' tag shall not contain an immediate text value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the incorrect tag. Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="child::* and @nullFlavor"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                The 'addr' tag shall not have both child tags or the 'nullFlavor' attribute.
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the incorrect tag.
                Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <assert test="
                @nullFlavor             or
                cda:streetAddressLine   or
                cda:unitType            or
                cda:unitID              or
                cda:additionalLocator   or
                cda:houseNumber         or
                cda:streetName          or
                cda:streetNameType      or
                cda:direction           or
                cda:deliveryAddressLine or
                cda:city                or
                cda:state               or
                cda:postalCode          or
                cda:country"
                >Error: Shared Health Summary -
                Global Clinical Document check for "addr" tag -
                The 'addr' tag shall have 'nullFlavor' attribute or
                'streetAddressLine' or 'unitType' or 'unitID' or 'additionalLocator' or
                'houseNumber' or 'streetName' or 'streetNameType' or 'direction'  or 'deliveryAddressLine' or
                'city' or 'state' or 'postalCode' or 'country' child tags.
                Check all 'cda:addr' and/or 'ext:addr' tag to find the missing tag or attribute.
                Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- streetAddressLine (International or Australian) -  0..* -->

            <report test="cda:streetAddressLine and normalize-space(cda:streetAddressLine) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address /
                Australian Address / Unstructured Australian Address Line" or
                "Address / Australian or International Address /
                International Address / International Address Line" -
                The 'streetAddressLine' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the incorrect 'streetAddressLine' tag. 
                Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- unitType -  0..1 -->

            <report test="count(cda:unitType) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Unit Type" -
                The 'unitType' tag shall appear only once. Check all 'cda:addr' and/or 'ext:addr' tags
                to find the duplicate 'unitType' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:unitType and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Unit_Type']/code[@code = current()/cda:unitType])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Unit Type" -
                The 'unitType' tag shall contain values coded as per 'AS 4846-2006' -
                Healthcare Provider Identification: Australian Unit Type. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the incorrect 'unitType' tag value. 
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- unitID -  0..1 -->

            <report test="count(cda:unitID) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Unit Number" -
                The 'unitID' tag shall appear only once. Check all 
                'cda:addr' and/or 'ext:addr' tags to find
                the duplicate 'unitID' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:unitID and normalize-space(cda:unitID) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Unit Number" -
                The 'unitID' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the
                empty 'unitID' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- additionalLocator -  0..1 -->

            <report test="count(cda:additionalLocator) > 5"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Address Site Name" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Level Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Level Number" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Lot Number" and/or
                "Address / Australian or International Address / Australian Address /
                Australian Delivery Point Identifier".
                The 'additionalLocator' tag shall appear only 5 times. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the
                extra 'additionalLocator' tag(s). Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:additionalLocator and normalize-space(cda:additionalLocator) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Address Site Name" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Level Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Level Number" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Lot Number" and/or
                "Address / Australian or International Address / Australian Address /
                Australian Delivery Point Identifier".
                The 'additionalLocator' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the empty 'additionalLocator' tag(s). Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- houseNumber -  0..1 -->

            <report test="count(cda:houseNumber) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Number" -
                The 'houseNumber' tag shall appear only once. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the duplicate 'houseNumber' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:houseNumber and normalize-space(cda:houseNumber) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Number" -
                The 'houseNumber' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find
                the empty 'houseNumber' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- streetName -  0..1 -->

            <report test="count(cda:streetName) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Name" -
                The 'streetName' tag shall appear only once. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the duplicate 'streetName' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:streetName and normalize-space(cda:streetName) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Name" -
                The 'streetName' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the empty 'streetName' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- streetNameType -  0..1 -->

            <report test="count(cda:streetNameType) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Type" -
                The 'streetNameType' tag shall appear only once. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the duplicate 'streetNameType' tag. 
                Refer to section 8.6 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:streetNameType and normalize-space(cda:streetNameType) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Type" -
                The 'streetNameType' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the empty 'streetNameType' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- comment out as per MANTIS 1753 until there is a complete set of street name type reference in our vocab file -->
            <!--
            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:streetNameType and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Street_type_Code']/code[@code = current()/cda:streetNameType]) and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Street_type_Code']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:streetNameType, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Type" -
                The 'streetNameType' tag shall contain values coded as per 'AS 4846-2006' -
                Healthcare Client Identification: Australian Street Type Code. Check all 'cda:addr' and/or 'ext:addr' tags
                to find the incorrect 'streetNameType' tag value. 
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            -->
            <!-- comment out until there is a complete set of street name type reference in our vocab file -->

            <!-- direction -  0..1 -->

            <report test="count(cda:direction) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Suffix" -
                The 'direction' tag shall appear only once. Check all 'cda:addr' and/or 'ext:addr' tags to
                find the duplicate 'direction' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:direction and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Street_Suffix_Code']/code[@code = current()/cda:direction])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Street Suffix" -
                The 'direction' tag shall contain values coded as per 'AS 4846-2006' -
                Healthcare Client Identification: Australian Street Suffix. 
                Check all 'cda:addr' and/or 'ext:addr' tags to
                find the incorrect 'direction' tag value. 
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- deliveryAddressLine -  0..1 -->

            <report test="count(cda:deliveryAddressLine) > 2"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Number" -
                The 'deliveryAddressLine' tag shall appear only twice. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the excessive 'deliveryAddressLine' tag(s). Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="
                cda:deliveryAddressLine and normalize-space(cda:deliveryAddressLine[1]) = '' or
                count(cda:deliveryAddressLine) > 1 and normalize-space(cda:deliveryAddressLine[2]) = ''
                "
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Number" -
                The 'deliveryAddressLine' tag shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the empty 'deliveryAddressLine' tag(s). 
                Refer to section 8.6 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- One of the deliveryAddressLine must be Australian Postal Delivery Type Code (not both) if present -->
            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:deliveryAddressLine and
                normalize-space(cda:deliveryAddressLine) != '' and
                count(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) != 1
                "
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Number" -
                The 'deliveryAddressLine' tag shall contain values coded as per 'AS 5017-2006' -
                Healthcare Client Identification: Australian Postal Delivery Type Code. 
                Check all 'cda:addr' and/or 'ext:addr' tags
                to find the incorrect 'deliveryAddressLine' tag(s) value.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- Must have Australian Postal Delivery Number if Australian Postal Delivery Type Code is NOT any of 'Care PO', 'CMA', 'CMB' and 'CPA' -->
            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:deliveryAddressLine and
                normalize-space(cda:deliveryAddressLine) != '' and
                count(cda:deliveryAddressLine) = 1 and
                count(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) = 1 and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Number']/code[@code = current()/cda:deliveryAddressLine])
                "
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Type" and/or
                "Address / Australian or International Address / Australian Address /
                Structured Australian Address Line / Australian Postal Delivery Number" -
                The 'deliveryAddressLine(Australian_Postal_Delivery_Number)' tag is missing for
                the given 'deliveryAddressLine(Australian_Postal_Delivery_Type_Code)'.
                The 'deliveryAddressLine' tag(s) shall contain values coded as per 'AS 5017-2006' -
                Healthcare Client Identification: Australian Postal Delivery Type Code.
                Check all 'cda:addr' and/or 'ext:addr' tags to find the non-conforming 'devliveryAddressLine' tag.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- city -  0..1 -->

            <report test="count(cda:city) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address/ Australian or International Address / Australian Address /
                Australian Suburb/Town/Locality" -
                The 'city' tag shall appear only once. Check all 'cda:addr' and/or 'ext:addr' tags to find the
                duplicate 'city' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:city and normalize-space(cda:city) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address/ Australian or International Address / Australian Address /
                Australian Suburb/Town/Locality" -
                The 'city' tag shall contain a value. Check all 'cda:addr' and/or 'ext:addr' tags to find the
                empty 'city' tag. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- state -  0..1 -->

            <report test="count(cda:state) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Australian State/Territory" -
                The 'state' tag shall appear only once. Check all 'cda:addr' and/or 'ext:addr' tags to find
                the duplicate 'state' tag. Refer to section 8.6 and 10.10 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:state and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[@code = current()/cda:state])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / Australian Address /
                Australian State/Territory" - The 'state' tag shall be as per 'AS 5017-2006' -
                Australian State/Territory Identifier - Postal. Check all 'cda:addr' and/or 'ext:addr' tags
                to find the incorrect 'state' tag value. Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                (not(cda:country) or document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and
                cda:state and
                normalize-space(cda:state) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / International Address /
                International State/Province" -
                The 'state' tag shall contain a value. Check all 'cda:addr' and/or 'ext:addr' tags to find the empty
                'state' tag(s). Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- postalCode -  0..1 -->

            <report test="count(cda:postalCode) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address/ Australian or International Address / Australian Address /
                Australian Postcode" - The 'postalCode' tag shall appear only once.
                Check all 'cda:addr' and/or 'ext:addr' tags to find the duplicate 'postalCode' tag.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:postalCode and normalize-space(cda:postalCode) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address/ Australian or International Address / Australian Address /
                Australian Postcode" - The 'postalCode' tag shall contain a value.
                Check all 'cda:addr' and/or 'ext:addr' tags to find the empty 'postalCode' tag.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- country - 0..1 -->

            <report test="count(cda:country) > 1"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / International Address / Country" -
                The 'country' tag shall appear only once. Check all 'cda:addr' and/or 'ext:addr' tags to find
                the duplicate 'country' tag. Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="cda:country and normalize-space(cda:country) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / International Address / Country" -
                The 'country' tag shall contain a value. Check all 'cda:addr' and/or 'ext:addr' tags to find the
                empty 'country' tag. Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="cda:country and not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'ISO3166-1']
                /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Australian or International Address / International Address / Country" -
                The 'country' tag shall contain values coded as per Australia Bureau of Statistics,
                Standard Australian Classification of Countries (SACC) Cat. No. 1269. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'country' tag value. 
                Refer to section 8.6 Address of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use xor @nullFlavor='NA' - 1..1 -->
            <!-- Mandatory in the sense that either of @use or @nullFlavor='NA' shall appear, but not both -->

            <!-- 0004359: CV, PPR, PDR, MIV :: Schematrons should not produce an error where there is no use or nullflavor specified for addr -->
            <!-- 0004359:  ... -->
            <!-- 0004359: @use can be optional and can be empty -->
            <!-- 0004359:  ... -->
            <!-- 0004359: @use attribute can be space separated list of codes.
                          See C:\CCA\CDAValidate\Reference Documents\Address - use - space separated list of codes.xlsx -->
            <!-- 0004359: If @use is used it shall only contain the values from the column "HL7 Address Use Code" (restricted by schema) -->
            <!-- 0004359:  ... -->
            <!-- 0004359: @nullFlavor can be optional and cannot be empty -->
            <!-- 0004359: both @use and @nullFlavor can co-exist -->

            <!-- 0004359: addr must have one or more of: nullFlavor, or some text, or some child tag (streetAddressLine etc).
                          - some text means it can be like <addr>xyz</addr>,
                          and some parts mean it shall have one of the child tags streetAddressLine, unitType or streetNameType etc, -->

            <!-- 0004359: both @use and @nullFlavor can co-exist -->
<!--
            <assert test="(@use and not(@nullFlavor)) or (not(@use) and @nullFlavor)"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" and "Address / No Fixed Address Indicator" -
                The 'addr' tag shall have 'use' or 'nullFlavor' attributes but not both.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
-->
            <!-- @nullFlavor -->

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" and "Address / No Fixed Address Indicator" -
                The 'addr' tag 'nullFlavor' attribute shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the empty 'nullFlavor' attribute value.
                Refer to section 8.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

          

            <!-- @use -->
            <!-- 0004359: @use can be optional and can be empty -->
<!--
            <report test="
                @use and normalize-space(@use) = ''"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall contain a value. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the empty 'use' attribute.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
-->



            <!-- 0004359: @use attribute can be space separated list of codes.
                          See C:\CCA\CDAValidate\Reference Documents\Address - use - space separated list of codes.xlsx -->
            <!-- 0004359: If @use is used it shall only contain the values from the column "HL7 Address Use Code" (restricted by schema) -->

            <!-- @use exist, and @use contains a 'double space'.  i.e '  '. -->

             <report test="
                @use and
                normalize-space(@use) != '' and
                contains(@use, '  ')"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. Single space delimited. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use not contains space(single use code), and @use is not in vocab -->

            <!-- 0 space    not(contains(@use, ' '))
                 1   current()/@use -->

            <report test="
                @use and
                normalize-space(@use) != '' and
                not(contains(@use, ' ')) and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = current()/@use) or
                (@alternativeCode = current()/@use) or
                (@hl7Code         = current()/@use)])"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use contains one space(two use codes), and at least first or second use code is not in vocab -->

            <!-- 1 space    contains(@use, ' ') and
                            not(contains(substring-after(@use, ' '), ' '))
                 1   substring-before(current()/@use,' ')
                 2   substring-after(current()/@use, ' ') -->

            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(@use, ' ') and
                not(contains(substring-after(@use, ' '), ' ')) and (
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(current()/@use,' ')) or
                (@alternativeCode = substring-before(current()/@use,' ')) or
                (@hl7Code         = substring-before(current()/@use,' '))])     or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-after(current()/@use,' ')) or
                (@alternativeCode = substring-after(current()/@use,' ')) or
                (@hl7Code         = substring-after(current()/@use,' '))])
                )"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use contains two spaces(three use codes), and at least first or second or third use code is not in vocab -->

            <!-- 2 spaces    contains(substring-after(@use, ' '), ' ') and
                             not(contains(substring-after(substring-after(@use, ' '), ' '), ' '))
                 1   substring-before(current()/@use,' ')
                 2   substring-before(substring-after(current()/@use, ' '), ' ')
                 3   substring-after (substring-after(current()/@use, ' '), ' ') -->

            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(substring-after(@use, ' '), ' ') and
                not(contains(substring-after(substring-after(@use, ' '), ' '), ' ')) and (
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(current()/@use,' ')) or
                (@alternativeCode = substring-before(current()/@use,' ')) or
                (@hl7Code         = substring-before(current()/@use,' '))])     or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(current()/@use, ' '), ' '))])      or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-after(substring-after(current()/@use, ' '), ' ')) or
                (@alternativeCode = substring-after(substring-after(current()/@use, ' '), ' ')) or
                (@hl7Code         = substring-after(substring-after(current()/@use, ' '), ' '))])
                )"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use contains three spaces(four use codes), and at least first or second or third or fourth use code is not in vocab -->

            <!-- 3 spaces    contains(substring-after(substring-after(@use, ' '), ' '), ' ') and
                             not(contains(substring-after(substring-after(substring-after(@use, ' '), ' '), ' '), ' '))
                 1   substring-before(current()/@use,' ')
                 2   substring-before(substring-after(current()/@use, ' '), ' ')
                 3   substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')
                 4   substring-after (substring-after(substring-after(current()/@use, ' '), ' '), ' ') -->

            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(substring-after(substring-after(@use, ' '), ' '), ' ') and
                not(contains(substring-after(substring-after(substring-after(@use, ' '), ' '), ' '), ' ')) and (
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(current()/@use,' ')) or
                (@alternativeCode = substring-before(current()/@use,' ')) or
                (@hl7Code         = substring-before(current()/@use,' '))])     or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(current()/@use, ' '), ' '))])      or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' '))])       or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@alternativeCode = substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@hl7Code         = substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' '))])
                )"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use contains 4+ spaces(five+ use codes), and at least first or second or third or fourth use code is not in vocab -->
            <!-- Validate first four use codes. -->
            <!-- Ignore fifth+ use code(s). -->

            <!-- 4+ spaces   contains(substring-after(substring-after(substring-after(@use, ' '), ' '), ' '), ' ') and
                             not(contains(substring-after(substring-after(substring-after(@use, ' '), ' '), ' '), ' '))
                 1   substring-before(current()/@use,' ')
                 2   substring-before(substring-after(current()/@use, ' '), ' ')
                 3   substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')
                 4   substring-after (substring-after(substring-after(current()/@use, ' '), ' '), ' ') -->

            <report test="
                @use and
                normalize-space(@use) != '' and
                contains(substring-after(substring-after(substring-after(@use, ' '), ' '), ' '), ' ') and (
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(current()/@use,' ')) or
                (@alternativeCode = substring-before(current()/@use,' ')) or
                (@hl7Code         = substring-before(current()/@use,' '))])     or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(current()/@use, ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(current()/@use, ' '), ' '))])      or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(substring-after(current()/@use, ' '), ' '), ' '))])       or
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[
                (@code            = substring-before(substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' '), ' ')) or
                (@alternativeCode = substring-before(substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' '), ' ')) or
                (@hl7Code         = substring-before(substring-after(substring-after(substring-after(current()/@use, ' '), ' '), ' '), ' '))])
                )"
                >Error: Shared Health Summary - Global Clinical Document check for 'addr' tag -
                "Address / Address Purpose" -
                The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' -
                Health Care Client Identifier Address Purpose. 
                Check all 'cda:addr' and/or 'ext:addr' tags to find the incorrect 'use' attribute value.
                Refer to section 8.6 and 10.6 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: 8.7 ELECTRONIC COMMUNICATION DETAIL -->
    <!-- ext:telecom is added due to new schema released for pahology Release 5 PCEHR-->
        
        <rule context="cda:telecom | ext:telecom">

            <assert test="@value or @nullFlavor"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom'  -
                "Electronic Communication Medium or Electronic Communication Address" -
                The 'telecom' tag shall have 'value' or 'nullFlavor' attribute.
                Check all 'cda:telecom' and/or 'ext:telecom' tags 'value' or 'nullFlavor' attributes to find
                the missing value. Refer to section 8.7 Electronic Communication Detail of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@value) or normalize-space(@value) !=''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Medium or Electronic Communication Address" -
                The 'telecom' tag 'value' attribute shall contain a value.
                Check all 'cda:telecom' and/or 'ext:telecom' tags 'value' attributes to find the missing value.
                Refer to 8.7 Electronic Communication Detail of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@nullFlavor) or normalize-space(@nullFlavor) !=''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Medium or Electronic Communication Address" -
                The 'telecom' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:telecom' and/or 'ext:telecom' tags 'nullFlavor' attributes to find the missing value.
                Refer to 8.7 Electronic Communication Detail of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@value) or contains(@value,':')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Medium or Electronic Communication Address" -
                The 'telecom' tag 'value' attribute shall contain a ":".
                Check all 'cda:telecom' and/or 'ext:telecom' tags 'value' attributes to find the incorrect value.
                Refer to 8.7 Electronic Communication Detail of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="
                not(@value) or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':')) or
                    (@hl7Code         = substring-before(current()/@value,':'))
                ]
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Medium or Electronic Communication Address" -
                The 'telecom' tag 'value' attribute shall be as per AS 5017-2006:
                Health Care Client Electronic Communication Medium.
                Check all 'cda:telecom' and/or 'ext:telecom' tags 'value' attributes to find the incorrect value.
                Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!--
            <report test="
                @use and normalize-space(@use) = ''
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall
                contain a value. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
            -->


            <!-- @use exist, and @use contains a 'double space'.  i.e '  '. -->
            <!-- Don't need this anymore, as below tests use normalize-space to turn consecutive spaces to single space -->
            <!--
            <report test="
                @use and normalize-space(@use) != '' and
                contains(@use, '  ')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall
                be as per HL7 v3: TelecommunicationAddressUse. Single space delimited. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>
                -->

            <!-- @use exist, and @use not contains space(single use code), and @use is not in vocab -->
            <report test="
                @use and normalize-space(@use) != '' and
                not(contains(normalize-space(@use), ' ')) and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = normalize-space(current()/@use))])
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall
                be as per HL7 v3: TelecommunicationAddressUse. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @use exist, and @use contains one space(two use codes), and at least first or second use code is not in vocab -->
            <report test="
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                not(contains(substring-after(normalize-space(@use), ' '), ' ')) and (
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(normalize-space(current()/@use),' '))]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-after(normalize-space(current()/@use),' '))])
                )">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall
                be as per HL7 v3: TelecommunicationAddressUse. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @use exist, and @use contains two+ spaces (three+ use codes), and at least first or second or third use code is not in vocab -->
            <!-- Validate first three use codes. -->
            <!-- Ignore four+ use code(s). -->
            <report test="
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                contains(substring-after(normalize-space(@use), ' '), ' ') and (
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(normalize-space(current()/@use),' '))]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(substring-after(normalize-space(current()/@use),' '),' '))]) or
                    not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(substring-after(substring-after(concat(normalize-space(current()/@use),' ZZ'),' '),' '),' '))])
                )">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall
                be as per HL7 v3: TelecommunicationAddressUse. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>


            <!-- @value is Mobile but @use is not specified -->
            <report test="
                @value and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'M')
                and not (@use)
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'MC' when 'value' attribute is 'Mobile'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Pager but @use is not specified -->
            <report test="
                @value and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'P')
                and not(@use)
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'PG' when 'value' attribute is 'Pager'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value.  Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Mobile, @use exist and not contains space(single use code), and @use is not 'MC'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                not(contains(normalize-space(@use), ' ')) and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'M') and
                (@use != 'MC')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'MC' when 'value' attribute is 'Mobile'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value.  Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Pager, @use exist and not contains space(single use code), and @use is not 'PG'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                not(contains(normalize-space(@use), ' ')) and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'P') and
                (@use != 'PG')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'PG' when 'value' attribute is 'Pager'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value.  Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Mobile, @use exist and contains one space(two use codes), and both use codes of @use are not 'MC'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                not(contains(substring-after(@use, ' '), ' ')) and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'M') and
                (substring-before(normalize-space(@use), ' ') != 'MC') and
                (substring-after (normalize-space(@use), ' ') != 'MC')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'MC' when 'value' attribute is 'Mobile'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Pager, @use exist and contains one space(two use codes), and both use codes of @use are not 'PG'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                not(contains(substring-after(@use, ' '), ' ')) and
                (document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                    (@code            = substring-before(current()/@value,':')) or
                    (@alternativeCode = substring-before(current()/@value,':'))
                ]/@alternativeCode = 'P') and
                (substring-before(normalize-space(@use), ' ') != 'PG') and
                (substring-after (normalize-space(@use), ' ') != 'PG')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'PG' when 'value' attribute is 'Pager'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Mobile, @use exist and contains two+ spaces(three+ use codes), and neither first nor second nor third use codes of @use are 'MC'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                contains(substring-after(normalize-space(@use), ' '), ' ') and
                (
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                        (@code            = substring-before(current()/@value,':')) or
                        (@alternativeCode = substring-before(current()/@value,':'))
                    ]/@alternativeCode = 'M'
                ) and
                (substring-before(normalize-space(@use), ' ') != 'MC') and
                (substring-before(substring-after(normalize-space(@use), ' '), ' ') != 'MC') and
                (substring-before(substring-after(substring-after(concat(normalize-space(@use), ' ZZ'), ' '), ' '), ' ') != 'MC')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'MC' when 'value' attribute is 'Mobile'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- @value is Pager, @use exist and contains two+ spaces(three+ use codes), and neither first nor second nor third use codes of @use are 'PG'-->
            <report test="
                @value and
                @use and normalize-space(@use) != '' and
                contains(normalize-space(@use), ' ') and
                contains(substring-after(normalize-space(@use), ' '), ' ') and
                (
                    document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[
                        (@code            = substring-before(current()/@value,':')) or
                        (@alternativeCode = substring-before(current()/@value,':'))
                    ]/@alternativeCode = 'P'
                ) and
                (substring-before(normalize-space(@use), ' ') != 'PG') and
                (substring-before(substring-after(normalize-space(@use), ' '), ' ') != 'PG') and
                (substring-before(substring-after(substring-after(concat(normalize-space(@use), ' ZZ'), ' '), ' '), ' ') != 'PG')
                ">Error: Shared Health Summary -
                Global Clinical Document check for 'cda:telecom' and/or 'ext:telecom' -
                "Electronic Communication Usage Code" -
                The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute
                as 'PG' when 'value' attribute is 'Pager'. Check all 'cda:telecom' and/or 'ext:telecom' tags 'use and 'value'
                attributes to find the incorrect value. Refer to section 8.7 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: 8.8 EMPLOYMENT -->

        <rule context="ext:asEmployment">

            <!-- ext:asEmployment/@classCode -->
            <assert test="@classCode"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'asEmployment' tag 'classCode' attribute is missing. Check all
                'ext:asEmployment' tags to find the missing attribute. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'asEmployment' tag 'classCode' attribute shall contain a value. Check all
                'ext:asEmployment' tags to find the missing attribute. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="@classCode='EMP'"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'asEmployment' tag 'classCode' attribute shall contain the value 'EMP'.
                Check all 'ext:asEmployment' tags to find the incorrect attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- ext:employerOrganization -->
            <report test="count(ext:employerOrganization) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'ext:employerOrganization' tag shall appear only once. Check all
                'ext:asEmployment' tags to find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ext:code -->
            <report test="count(ext:code) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'ext:code' tag shall appear only once. Check all 'ext:asEmployment' tags
                to find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ext:jobCode -->
            <report test="count(ext:jobCode) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'ext:jobCode' tag shall appear only once. Check all 'ext:asEmployment' tags
                to find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- ext:jobClassCode -->
            <report test="count(ext:jobClassCode) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'ext:jobClassCode' tag shall appear only once. Check all 'ext:asEmployment'
                tags to find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <!-- <rule context="ext:asEmployment/ext:code">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

        </rule>-->

        <rule context="ext:asEmployment/ext:jobCode">

            <!-- To be updated after the Jira issue resolution to write tests related to this tag -->
            <!-- The code attributes must also checked against the Vocabs file in the ANZSCO FE 2006 meteor 350899 code values after we get a resolution -->

            <!-- jobCode/@code - 1..1 -->
            <assert test="@code"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'code' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'code' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert
                test="
                not(@code) or
                normalize-space(@code) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @code = current()/@code]"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'code' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand 
                Standard Classification of Occupations, First Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- jobCode/@codeSystem - 1..1 -->
            <assert test="@codeSystem"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystem' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert
                test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']/code[
                @codeSystem = current()/@codeSystem]"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystem' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand Standard 
                Classification of Occupations, First Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- jobCode/@codeSystemName -->
            <!--
            <assert test="@codeSystemName"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            -->

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- commented the test below because the changes required for Pathology Report described in the following ticket RPSA-2075 also needs to be applied to all the packages -->
            <!--<report test="
                @codeSystemName and
                normalize-space(@codeSystemName) != '' and
                translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, REVISION 1'"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystemName' attribute shall be '1220.0 - ANZSCO - Australian and New Zealand Standard 
                Classification of Occupations, First Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.            
                <!-\- commented the test as it is the similar test as described in the ticket RPSA-2075 -\->
            </report>-->

            <!-- jobCode/@codeSystemVersion -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'codeSystemVersion' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- jobCode/@displayName -->
            <!--
            <assert test="@displayName"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'displayName' attribute is missing. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>
            -->

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'displayName' attribute shall contain a value. Check all
                'ext:asEmployment/ext:jobCode' tags to find the missing attribute.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report test="
                @displayName and
                normalize-space(@displayName) != '' and
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1']
                /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'jobCode' tag 'code' and 'displayName' attributes shall match as per '1220.0 - ANZSCO - Australian and New Zealand Standard 
                Classification of Occupations, First Edition, Revision 1'. Check all 'ext:asEmployment/ext:jobCode' tags to find the
                incorrect attribute. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <!-- <rule context="ext:asEmployment/ext:jobClassCode">

            <!-\- Already covered as a global check in this file above but To be updated there only after the Jira issue resolution to write tests related to this tag -\->

            </rule> -->

        <rule context="ext:asEmployment/ext:employerOrganization">

            <!-- asOrganizationPartOf -->
            <assert test="cda:asOrganizationPartOf"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'asOrganizationPartOf' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the missing tag.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:asOrganizationPartOf) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'asOrganizationPartOf' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!-- name -->
            <report test="count(cda:name) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag.
                Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:name">

            <!-- name/@ -->
            <assert test="normalize-space(.) != ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:name' tags to find the missing
                value. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf">

            <!-- wholeOrganization -->
            <assert test="cda:wholeOrganization"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'wholeOrganization' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to
                find the missing tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:wholeOrganization) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'wholeOrganization' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to
                find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization">

            <!-- ext:asEntityIdentifier - 1..* -->

            <assert test="ext:asEntityIdentifier"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'ext:asEntityIdentifier' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'HPI-O asEntityIdentifier' tag is missing. "The value of one Entity Identifier
                SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers.
                Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- The tags and attributes of 'ext:asEntityIdentifier' are being tested in 'Shared_Health_Summary_Global_Checks.sch'. -->


            <!-- name -->
            <assert test="cda:name"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag is missing. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the missing tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <report test="count(cda:name) > 1"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag shall appear only once. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization'
                tags to find the duplicate tag. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <rule context="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name">

            <assert test="not(@nullFlavor)"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag 'nullFlavor' attribute shall not be present.
                Refer to requirements in NullFlavor Usage Clarification FAQ and section 8.8 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <assert test="normalize-space(.) != ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the missing value. Refer to section 8.8 Employment of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- name/@use -->

            <report test="@use and normalize-space(@use) = ''"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag 'use' attribute shall contain a value. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006:
                Health Care Provider Organisation Name Usage of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <report
                test="@use and not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code
                [(@code = (current()/@use))
                or (@alternativeCode = (current()/@use))
                or (@hl7Code = (current()/@use))])"
                >Error: Shared Health Summary - 8.8 Employment -
                The 'name' tag 'use' attribute shall be coded as per AS 4846-2006:
                Health Care Provider Organisation Name Usage. Check all
                'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name'
                tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006:
                Health Care Provider Organisation Name Usage of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

        <!-- END :: Common Patterns: 8.8 Employment -->




        <!-- BEGIN :: ATTACHMENTS -->
        <!-- BEGIN :: Narratives for attachments -->


        <rule context = "cda:component/cda:section[not(descendant::cda:component/cda:section) and
                                                       descendant::cda:observationMedia and
                                                       descendant::cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='LOGO']]">

            <!-- (2) Title is mandatory -->
            <assert test = "cda:title"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'title' tag is missing for 'narrative' block of 'observationMedia'.
                Check all 'cda:observationMedia' tags to find the missing 'narrative ' block 'title' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025054 Requirements for title element of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(cda:title) or normalize-space(cda:title) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'title' tag for 'narrative' block of 'observationMedia' shall contain a value.
                Check all 'cda:observationMedia' tags to find the empty 'narrative ' block 'title' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025054 Requirements for title element of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "count(cda:title) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'title' tag shall appear only once for 'narrative' block of 'observationMedia'.
                Check all 'cda:observationMedia' tags to find the duplicated 'narrative ' block 'title' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025054 Requirements for title element of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <!-- (3) Text is mandatory -->
            <assert test = "cda:text"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'text' tag is missing for 'narrative' block of 'observationMedia'.
                Check all 'cda:observationMedia' tags to find the missing 'narrative ' block 'text' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025053 Sections with no requirement for narrative of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "count(cda:text) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'text' tag shall appear only once for 'narrative' block of 'observationMedia'.
                Check all 'cda:observationMedia' tags to find the duplicated 'narrative ' block 'text' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025053 Sections with no requirement for narrative of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

        </rule>



        <!-- any cda:renderMultiMedia descendant nested any level under narrative section cda:text -->
        <rule context = "cda:component/cda:section[not(descendant::cda:component/cda:section) and
                                                       descendant::cda:observationMedia and
                                                       descendant::cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='LOGO']]/
                         cda:text//cda:renderMultiMedia">

            <!-- (6) <renderMultiMedia> shall have a referencedObject attribute value -->
            <assert test = "@referencedObject"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'renderMultiMedia' tag -
                The 'renderMultiMedia' tag 'referencedObject' attribute is missing.
                Check all 'cda:renderMultiMedia' tags to find the missing 'referencedObject' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025053 Sections with no requirement for narrative of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(@referencedObject) or normalize-space(@referencedObject) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'renderMultiMedia' tag -
                The 'renderMultiMedia' tag 'referencedObject' attribute shall contain a value.
                Check all 'cda:renderMultiMedia' tags to find the empty 'referencedObject' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 025053 Sections with no requirement for narrative of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- CDA-RS 53 (i) [NEHTA2012b]:
                 If there is a <renderMultiMedia> element then the reference element of the
                 corresponding observationMedia element shall refer to an external attachment
                 (i.e. the reference shall not commence with a hash (#)). -->

            <assert test = "not(starts-with(ancestor::cda:section//cda:observationMedia[@ID = current()/@referencedObject]/cda:value/cda:reference/@value, '#'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'renderMultiMedia' tag -
                The 'reference' tag 'value' attribute shall not contain the value '#' in the begining.
                Check all 'cda:observationMedia' tags to find
                the 'cda:value/cda:reference' child tag with the incorrect 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

        </rule>



        <!-- Without ID LOGO -->
        <rule context = "cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='LOGO']">

            <!-- (1) Section is mandatory -->
            <assert test = "ancestor::cda:component[cda:section]"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'narrative' block of 'observationMedia' tag is missing.
                Check all 'cda:observationMedia' tags to find the missing 'narrative ' block.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- (7) There shall be a <observationMedia> element in the <entryRelationship> -->
            <assert test = "
                parent::cda:entry or
                parent::cda:entryRelationship"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The parent tag of
                'observationMedia' tag shall have a name of 'entry' or 'entryRelationship'.
                Check all 'cda:observationMedia' tags to find the incorrect 'observationMedia' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- (8) <observationMedia> shall have a ID attribute value -->
            <assert test = "@ID">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'observationMedia' tag 'ID' attribute is missing. Check all
                'cda:observationMedia' tags to find the missing 'ID' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(@ID) or normalize-space(@ID) != ''">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'observationMedia' tag 'ID' attribute shall contain a value. Check all
                'cda:observationMedia' tags to find the empty 'ID' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- (9) Value of 6 shall equal value of 8 -->
            <assert test = "
                not(@ID) or
                not(ancestor::cda:component/cda:section/cda:text) or
                not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia) or
                not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject) or
                ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject = @ID">
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The value of 'ID' attribute
                and the value of 'referencedObject' attribute inside 'narrative' block of 'observationMedia'
                shall be matched as per 'Common Conformance Requirements - Conformance Levels - CDA Level 1A'.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- (10) There shall be a <value> element with mediaType attribute -->
            <assert test = "cda:value">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag is missing.
                Check all 'cda:observationMedia' tags to find the missing 'value ' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(cda:value) or cda:value[@mediaType]"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag 'mediaType' attribute is missing.
                Check all 'cda:observationMedia/cda:value' tags to find the missing 'mediaType ' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "count(cda:value) > 1">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag shall appear only once.
                Check all 'cda:observationMedia' tags to find the duplicated 'value ' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 024482 Conformance levels of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

        </rule>



        <!-- With ID = LOGO -->
        <rule context = "cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='LOGO']">

            <!-- "@id = upper case 'LOGO'" test -->
            <assert test = "normalize-space(@ID) = 'LOGO'"
                >Error: Shared Health Summary -
                The 'observationMedia' tag 'id' attribute shall be 'LOGO'.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- "Full Path" test -->
            <assert test = "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry/cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'LOGO']"
                >Error: Shared Health Summary -
                The '/ClinicalDocument/component/structuredBody/component/cda:section/entry/observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'LOGO']' path - 1 or more tags are missing.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>           

            <!-- (10) There shall be a <value> element with mediaType attribute -->
            <assert test = "cda:value">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag is missing.
                Check all 'cda:observationMedia' tags with 'ID=LOGO' attribute to find the missing 'value ' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(cda:value) or cda:value[@mediaType]"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag 'mediaType' attribute is missing.
                Check all 'cda:observationMedia/with 'ID=LOGO' attribute cda:value' tags to find the missing 'mediaType ' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "count(cda:value) > 1">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag - The 'value' tag shall appear only once.
                Check all 'cda:observationMedia' tags with 'ID=LOGO' attribute to find the duplicated 'value ' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <!-- REQUIREMENT    :
                 1) logo is an attachment
                 2) The CDA Packaging specification has the following requirement:
                    M 15 If a "CDA XML document" contains a packaged attachment, it shall represent the packaged attachment using an ED-element.
            -->
          
            <report test = "(cda:value) and (cda:value/@xsi:type) and normalize-space(cda:value/@xsi:type) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Check all 'cda:observationMedia' tags with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the empty 'xsi:type' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <report test = "(cda:value) and (cda:value/@xsi:type) and
                normalize-space(cda:value/@xsi:type) != '' and
                normalize-space(cda:value/@xsi:type) != 'ED' and
                not(substring-before(normalize-space(cda:value/@xsi:type), ':') != '' and
                substring-after(normalize-space(cda:value/@xsi:type), ':') = 'ED')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'value' tag 'xsi:type' attribute shall contain the value 'ED'
                Check all 'cda:observationMedia' tags with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the incorrect 'xsi:type' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>


            <report test = "(cda:value) and (cda:value/@integrityCheckAlgorithm) and normalize-space(cda:value/@integrityCheckAlgorithm) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'value' tag 'integrityCheckAlgorithm' attribute shall contain a value'.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the empty 'integrityCheckAlgorithm' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <report test = "(cda:value) and (cda:value/@integrityCheckAlgorithm) and normalize-space(cda:value/@integrityCheckAlgorithm) != '' and (cda:value/@integrityCheckAlgorithm != 'SHA-1')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'value' tag 'integrityCheckAlgorithm' attribute shall contain the value 'SHA-1'.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the incorrect 'integrityCheckAlgorithm' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>


            <report test = "(cda:value) and (cda:value/@integrityCheck) and normalize-space(cda:value/@integrityCheck) = ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'value' tag 'integrityCheck' attribute shall contain a value.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the empty 'integrityCheck' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>


            <assert test = "not(cda:value) or (cda:value/cda:reference)"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'cda:reference' tag is missing.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the missing 'reference' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "(cda:value) and count(cda:value/cda:reference) > 1"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'cda:reference' tag shall appear only once.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value' child tag with the duplicate 'reference' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <report test = "(cda:value) and (cda:value/@representation) and normalize-space(cda:value/@representation)='B64'"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'value' tag 'representation' attribute shall not contain the value 'B64'.
                Authoring Systems SHALL ensure that all attachments referenced in
                'renderMultimedia' narrative block elements or used for a branding logo,
                are not inlined in their associated observationMedia entries.
                Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'representation' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and section 4.2.1 of the
                CDA_Rendering_Specification_v1.0.</report>

        </rule>




        <rule context = "cda:observationMedia[translate(@ID, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='LOGO']/cda:value/cda:reference">

            <assert test = "@value"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'reference' tag 'value' attribute is missing.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value/cda:reference' child tag with the missing 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "not(@value) or normalize-space(@value) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'reference' tag 'value' attribute shall contain a value.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value/cda:reference' child tag with the empty 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- attachment types.docx
                 "if you see a reference element and the reference value attributes does not start with a hash
                  then it is a reference to a packaged attachment and therefore the rule on allowed attachment types shall apply.

                  Since logo is a "packaged attachment" and the above rule then means the reference value attribute can not start with a hash.
             -->

            <assert test="not(starts-with(@value, '#'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'reference' tag 'value' attribute shall not contain the value '#' in the beginning.
                Check all 'cda:observationMedia' with 'ID=LOGO' attribute to find
                the 'cda:value/cda:reference' child tag with the incorrect 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

        </rule>




        <rule context = "cda:observationMedia/cda:value">

            <!-- cater for e.g. '<value mediaType="image/jpeg">' in the xml -->
            <assert test = "not(@mediaType) or
                normalize-space(@mediaType) = '' or
                contains(@mediaType, ';') or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = (current()/@mediaType)]"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag - The 'text' tag
                'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside
                "Common_Conformance_Profile_for_Clinical_Documents_v1.6".
                NOTE: This restriction shall be applied to PCEHR message only. Ignore this error for non-PCEHR messages.
                Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'mediaType' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- cater for e.g. '<value mediaType="image/jpeg; xxxxx">' in the xml -->
            <assert test = "not(@mediaType) or
                normalize-space(@mediaType) = '' or
                not(contains(@mediaType, ';')) or
                document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = substring-before(current()/@mediaType, ';')]"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag - The 'text' tag
                'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside
                "Common_Conformance_Profile_for_Clinical_Documents_v1.6".
                NOTE: This restriction shall be applied to PCEHR message only. Ignore this error for non-PCEHR messages.
                Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'mediaType' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- integrityCheckAlogrithm - 0..1 -->
            <!-- the integrityCheckAlthrithm shall have the value of SHA-1 -->

            <report test = "(@mediaType) and (@integrityCheckAlgorithm) and (normalize-space(@integrityCheckAlgorithm) = '')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'integrityCheckAlgorithm' attribute shall contain a value.
                Check all 'cda:observationMedia' tags to find the 'cda:value'
                child tags with the empty 'integrityCheckAlgorithm' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <report test = "(@mediaType) and
                (@integrityCheckAlgorithm) and
                normalize-space(@integrityCheckAlgorithm) != '' and
                (@integrityCheckAlgorithm != 'SHA-1')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'integrityCheckAlgorithm' attribute shall contain the value 'SHA-1'.
                Check all 'cda:observationMedia' tags to find the 'cda:value'
                child tags with the incorrect 'integrityCheckAlgorithm' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <!-- integrityCheck - 1..1 -->

            <assert test = "not(@mediaType) or (@integrityCheck)"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'value' tag 'integrityCheck' attribute is missing.
                Check all 'cda:observationMedia' tags to find the 'cda:value'
                child tags with the missing 'integrityCheck' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <assert test = "(not(@mediaType) and not(@integrityCheck)) or normalize-space(@integrityCheck) != ''"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'integrityCheck' attribute shall contain a value.
                Check all 'cda:observationMedia' tags to find the 'cda:value'
                child tags with the empty 'integrityCheck' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <!-- (11) There shall be a <reference> element with value attribute -->
            <assert test = "not(@mediaType) or (cda:reference)">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag - The 'reference'
                tag is missing. Check all
                'cda:observationMedia/cda:value' tags to find the missing 'reference' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>

            <report test = "(@mediaType) and (count(cda:reference) > 1)">Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag - The 'reference'
                tag shall appear only once. Check all
                'cda:observationMedia/cda:value' tags to find the duplicated 'reference' tag.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>

            <report test = "(@mediaType) and (@representation) and normalize-space(@representation)='B64'"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia/value' tag -
                The 'value' tag 'representation' attribute shall not contain the value 'B64'.
                Authoring Systems SHALL ensure that all attachments referenced in
                'renderMultimedia' narrative block elements or used for a branding logo,
                are not inlined in their associated observationMedia entries.
                Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'representation' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and section 4.2.1 of the
                CDA_Rendering_Specification_v1.0.</report>
            
            <assert test="not(cda:reference/@value) or (normalize-space(cda:reference/@value) = '') or not(@mediaType) or (normalize-space(@mediaType) = '') or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 3), 4)='.gif') and (@mediaType = 'image/gif')) or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 4), 5)='.jpeg') and (@mediaType = 'image/jpeg')) or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 3), 4)='.jpg') and (@mediaType = 'image/jpeg')) or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 3), 4)='.pdf') and (@mediaType = 'application/pdf')) or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 3), 4)='.png') and (@mediaType = 'image/png')) or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 3), 4)='.tif') and (@mediaType = 'image/tiff'))or
                ((substring(cda:reference/@value, ((string-length(cda:reference/@value)) - 4), 5)='.tiff') and (@mediaType = 'image/tiff'))
                ">Error: Shared Health Summary - Global Clinical Document check for 'observationMedia/value' tag - 
                The 'value' tag 'mediaType' attribute shall be either 'image/gif' or 'image/jpeg' 
                or 'application/pdf' or 'image/png' or 'image/tiff' and 'reference' tag 'value' attribute 
                shall be having filetype extension of 'GIF' or 'JPEG' or 'JPG' or 'PDF' or 'PNG' or 
                'TIF' or 'TIFF' and also the 'mediaType' attribute and the 'value' attribute shall correspond 
                with each other. Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and section 023741 MIME types allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>            
            
            <assert test="not(cda:reference/@value) or not(starts-with(cda:reference/@value, '#'))"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'reference' tag 'value' attribute shall not contain a value starting with '#'.
                Check all 'cda:observationMedia' tags to find
                the 'cda:value/cda:reference' child tag with the incorrect 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</assert>
            
            <report test="(cda:reference/@value) and (normalize-space(cda:reference/@value) = '')"
                >Error: Shared Health Summary -
                Global Clinical Document check for 'observationMedia' tag -
                The 'reference' tag 'value' attribute shall contain a value.
                Check all 'cda:observationMedia' tags to find
                the 'cda:value/cda:reference' child tag with the incorrect 'value' attribute.
                Refer to Shared_Health_Summary_CDA_Implementation_Guide_v1.4 and section 023741 MIME types
                allowed as attachments of the
                Common_Conformance_Profile_for_Clinical_Documents_v1.6.</report>
           

        </rule>








    </pattern>

</schema>

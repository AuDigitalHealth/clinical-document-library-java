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

    <!-- e-Referral Clinical Document: 3A Global Checks -->

    <!-- Context: ClinicalDocument -->

    <!-- Status: Last Reviewed:
         Status: Last Updated : 14/05/2015 -->


    <pattern name="p-e-Referral_3A_Global_Checks-errors"
        id="p-e-Referral_3A_Global_Checks-errors"
        see="#p-e-Referral_3A_Global_Checks-errors">


        <!-- BEGIN :: CDA: TARGETSITECODE -->

        <!-- The following rule context will find every occurrence of "cda:targetSiteCode" in the XML and execute the corresponding tests. -->

        <rule context="cda:targetSiteCode">

            <!-- This following asserts/reports test for code attributes as given in Section "0.0 targetSiteCode" of the e-Referral_CDA_Implementation_Guide_v2.2. -->

            <assert test="
                cda:originalText or (@code and @codeSystem) or @nullFlavor"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@code" attribute -
                The 'targetSiteCode' tag shall have at least the 'originalText' tag or the
                'code and codeSystem' or the 'nullFlavor' attributes.
                Check all 'cda:targetSiteCode' tags to find the missing tag or attribute(s).
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystem" attribute -
                The 'targetSiteCode' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'codeSystem' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

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
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystem" attribute -
                The 'targetSiteCode' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:targetSiteCode' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

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
                ">Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystem" attribute -
                The 'targetSiteCode' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:targetSiteCode' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

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
                ">Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystem" attribute -
                The 'targetSiteCode' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:targetSiteCode' tags to find the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@nullFlavor" attribute -
                The 'targetSiteCode' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags 'nullFlavor' attributes to find
                the 'nullFlavor' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- The CD data type "nullFlavor" attribute can have one of the following values:: NI, UNK, ASKU, NAV, NASK, NA. -->
            <report test="@nullFlavor and
                normalize-space(@nullFlavor) != '' and
                not(document('TEMPLATE/VALDN/CDAValidate_Vocabs.xml', .)/systems/system[@codeSystemName = 'Coded_DataType_NullFlavor']/code[(@code = current()/@nullFlavor)])"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@nullFlavor" attribute -
                The 'targetSiteCode' tag 'nullFlavor' attribute shall be as per FAQ Representing
                Coding in CDA Documents CDA CD DataType nullFlavors.
                Check all 'cda:targetSiteCode' tags to find
                the 'nullFlavor' attributes of incorrect value.
                Refer to the HL7 data types specification and section 2.1.1 of the FAQ Representing Coding in CDA Documents,
                and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:originalText) > 1"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:originalText" -
                The 'originalText' tag shall appear only once.
                Check all 'cda:targetSiteCode' tags to find
                the duplicated 'originalText' child tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- originalText if present can't be empty -->
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:originalText" -
                The 'originalText' tag shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'originalText' child tag that has the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
            
          
            <report test="@code and normalize-space(@code) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@code" attribute -
                The 'targetSiteCode' tag 'code' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'code' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="substring(@code, 1, 1) = ' ' or substring(@code, string-length(@code), 1) = ' '"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@code" attribute -
                The 'targetSiteCode' tag 'code' attribute shall not start or end with space.
                Check all 'cda:targetSiteCode' tags to find
                the 'code' attribute with incorrect value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@code" attribute -
                The 'targetSiteCode' tag 'code' attribute shall not be present 
                if the corresponding 'codeSystem' attribute is missing.
                Check all 'cda:targetSiteCode' tags to find
                the incorrectly contained 'code' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystemName" attribute -
                The 'targetSiteCode' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'codeSystemName' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@codeSystemVersion" attribute -
                The 'targetSiteCode' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'codeSystemVersion' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@displayName" attribute -
                The 'targetSiteCode' tag 'displayName' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'displayName' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/@displayName" attribute -
                The 'targetSiteCode' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:targetSiteCode' tags to find
                the incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:qualifier) > 1"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:qualifier" tag -
                The 'qualifier' tag shall appear only once.
                Check all 'targetSiteCode' tags to find the duplicated child 'qualifier' tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:targetSiteCode/cda:translation">

            <!-- a codeSystem must be present -->
            <assert test="@codeSystem"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute is missing.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with missing 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'codeSystem' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

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
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

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
                ">Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

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
                ">Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- translation SHALL NOT contain the same targetSiteCode/codeSystem as another in the cluster -->
            <!-- i.e. translation from same codeSystem is not allowed -->
            <assert test="not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                not(parent::*/@codeSystem) or
                normalize-space(parent::*/@codeSystem) = '' or
                @codeSystem != parent::*/@codeSystem"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value different from the
                codeSystem it translates from. Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <!-- either code or nullFlavor attribute is required -->
            <assert test="@code or @nullFlavor"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation" attributes -
                The 'translation' tag shall have at least the 'code' or the 'nullFlavor' attributes.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the missing attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'nullFlavor' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- only nullFlavor allows in translation is 'OTH' -->
            <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'OTH'"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain the value 'OTH'.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'nullFlavor' attribute of incorrect value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- translation SHALL NOT contain originalText -->
            <assert test="not(cda:originalText)"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation" -
                The 'originalText' tag shall not be present within 'translation' tag.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag containing 'originalText' tag.
                Refer to the HL7 data types specification and section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <!-- translation SHALL NOT contain nested translation(s) -->
            <assert test="not(cda:translation)"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation" -
                The 'translation' tag shall not be present within 'translation' tag.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with nested 'translation' tag.
                Refer to the HL7 data types specification and section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@code and normalize-space(@code) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'code' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="substring(@code, 1, 1) = ' ' or substring(@code, string-length(@code), 1) = ' '"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not start or end with space.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'code' attribute of incorrect value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not be present 
                if the corresponding 'codeSystem' attribute is missing.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with incorrectly contained 'code' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystemName" attribute -
                The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'codeSystemName' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@codeSystemVersion" attribute -
                The 'translation' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'codeSystemVersion' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall contain a value.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag 'displayName' attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- qualifiers are not allowed unless CDA IG describes their use -->
            <assert test="not(cda:qualifier)"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:translation/cda:qualifier" -
                The 'qualifier' tag shall not be present within 'translation'.
                Check all 'cda:targetSiteCode' tags to find
                the 'translation' child tag with the incorrect child 'qualifier' tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <rule context="cda:targetSiteCode/cda:originalText">

            <report test = "count(cda:reference) > 1"
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText' tag -
                The 'reference' tag shall appear only once.
                Check all 'cda:targetSiteCode/cda:originalText' tags to find
                the duplicated 'reference' tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- If originalText contains both reference and text, the text must match the reference -->
            <report test = "
                cda:reference and
                normalize-space(concat(text()[1], text()[2])) != '' and
                normalize-space(concat(text()[1], text()[2])) !=
                normalize-space(concat(ancestor::cda:component/cda:section/cda:text/text()[1],
                                       ancestor::cda:component/cda:section/cda:text/text()[2]))"
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText' tag -
                The 'originalText' tag shall contain the value match to its corresponding narrative block text.
                Check all 'cda:targetSiteCode/cda:originalText' tags to find
                the corresponding narrative text mismatch.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:targetSiteCode/cda:originalText/cda:reference">

            <assert test = "@value"
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute is missing.
                Check all 'cda:targetSiteCode/cda:originalText/cda:reference' tags to find
                the missing 'value' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test = "not(@value) or normalize-space(@value) != ''"
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain a value.
                Check all 'cda:targetSiteCode/cda:originalText/cda:reference' tags to find
                the empty 'value' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID"
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText/cda:reference' tag -
                The narrative 'text/content/@ID' attribute corresponding to the 'reference' tag 'value' attribute is missing.
                Check all 'cda:targetSiteCode/cda:originalText/cda:reference' tags to find
                the missing corresponding narrative.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                not(ancestor::cda:component/cda:section/cda:text) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content/@ID) or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID = @value">
                >Error: e-Referral -
                Global Clinical Document check for 'cda:targetSiteCode/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain the value match to
                its corresponding narrative block content 'ID' attribute.
                Check all 'cda:targetSiteCode/cda:originalText/cda:reference' tags to find
                the corresponding narrative content ID mismatch.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

        </rule>


        <!-- CDA:TARGETSITECODE/CDA:QUALIFIER -->
        <!-- The following rule context will find every occurrence of "cda:targetSiteCode/cda:qualifier" in the XML and execute the corresponding tests. -->

        <rule context="cda:targetSiteCode/cda:qualifier">

            <assert test="cda:name"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:qualifier/cda:name" tag -
                The 'name' tag is missing.
                Check all 'targetSiteCode' tags to find the missing tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:name) > 1"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:qualifier/cda:name" tag -
                The 'name' tag shall appear only once.
                Check all 'targetSiteCode' tags to find the duplicated tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="cda:value"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:qualifier/cda:value" tag -
                The 'value' tag is missing.
                Check all 'targetSiteCode' tags to find the missing tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="count(cda:value) > 1"
                >Error: e-Referral -
                Global Clinical Document check for "cda:targetSiteCode/cda:qualifier/cda:value" tag -
                The 'value' tag shall appear only once.
                Check all 'targetSiteCode' tags to find the duplicated tag.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:targetSiteCode/cda:qualifier/cda:name">

            <assert test="@code"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@code" attribute -
                The 'name' tag 'code' attribute is missing.
                Check all 'targetSiteCode' tags to find the missing attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@code" attribute -
                The 'name' tag 'code' attribute shall contain a value.
                Check all 'targetSiteCode' tags to find the attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
   
           
          
             <assert test="
                not(@code) or
                normalize-space(@code) = '' or
                @code = '78615007'"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@code" attribute -
                The 'name' tag 'code' attribute shall contain the value '78615007'.
                Check all 'targetSiteCode' tags to find the incorrect the attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="@codeSystem"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystem" attribute -
                The 'name' tag 'codeSystem' attribute is missing.
                Check all 'targetSiteCode' tags to find the missing attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystem" attribute -
                The 'name' tag 'codeSystem' attribute shall contain a value.
                Check all 'targetSiteCode' tags to find the attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <assert test="
                not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystem" attribute -
                The 'name' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Check all 'targetSiteCode' tags to find the incorrect attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystemName" attribute -
                The 'name' tag 'codeSystemName' attribute shall contain a value.
                Check all 'targetSiteCode' tags to find the attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

           
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystemName" attribute -
                The 'name' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'targetSiteCode' tags to find the attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="
                @codeSystemVersion and
                normalize-space(@codeSystemVersion) != '' and
                @codeSystemVersion != '20110531'"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@codeSystemVersion" attribute -
                The 'name' tag 'codeSystemVersion' attribute shall contain the value '20110531'.
                Check all 'targetSiteCode' tags to find the incorrect attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@displayName" attribute -
                The 'name' tag 'displayName' attribute shall contain a value.
                Check all 'targetSiteCode' tags to find the attribute of missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@displayName" attribute -
                The 'targetSiteCode/qualifier/name' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:targetSiteCode/cda:qualifier/cda:name' tags to find
                the incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

         
            <report test="
                @displayName and
                normalize-space(@displayName) != '' and
                (@displayName != 'with laterality')"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:name/@displayName" attribute -
                The 'name' tag 'displayName' attribute shall contain the value 'with laterality'.
                Check all 'targetSiteCode' tags to find the incorrect attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:targetSiteCode/cda:qualifier/cda:value">

            <!-- Tests the code attributes within cda:targetSiteCode/cda:qualifier/cda:value with the same rules as ext:code -->

            <assert test="(@code and @codeSystem) or (@codeSystem and cda:originalText and @nullFlavor = 'OTH')"
                >Error: e-Referral -
                Global Clinical Document check for 
                "Anatomical Site / Specific Location / Side" - 
                The 'value' tag shall have 'code and codeSystem' or 'originalText' tag, 'codeSystem' attribute  and 
                'nullFlavor' attribute with a value 'OTH'.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>
            
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:originalText" -
                The 'originalText' tag shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:originalText' tags
                to find the missing text.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="count(cda:originalText) > 1"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:originalText" -
                The 'originalText' tag shall appear only once. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:originalText' tags
                to find the duplicated text.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <assert test="
                cda:originalText or (@code and @codeSystem) or @nullFlavor"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@code" attribute -
                The 'value' tag shall have 'originalText' tag or
                'code and codeSystem' or 'nullFlavor' attribute. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags to find the
                missing tag or attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@nullFlavor" attribute -
                The 'value' tag 'nullFlavor' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags 'nullFlavor' attributes
                to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@code" attribute -
                The 'value' tag 'code' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags 'code' attributes
                to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@codeSystem" attribute -
                The 'value' tag 'codeSystem' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags 'codeSystem' attributes
                to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@codeSystemName" attribute -
                The 'value' tag 'codeSystemName' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags 'codeSystemName' attributes
                to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@displayName" attribute -
                The 'value' tag 'displayName' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value' tags 'displayName' attributes
                to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/@displayName" attribute -
                The 'targetSiteCode/qualifier/value' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:targetSiteCode/cda:qualifier/cda:value' tags to find
                the incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>


        <rule context="cda:targetSiteCode/cda:qualifier/cda:value/cda:translation">

            <assert test="@code and @codeSystem or (@nullFlavor='OTH' and @codeSystem)"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation" attributes -
                The 'translation' tag shall have 'code' and 'codeSystem' attributes. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags to find the
                missing tag or attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags 'nullFlavor'
                attributes to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@code and normalize-space(@code) = ''"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags 'code'
                attributes to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags 'codeSystem'
                attributes to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation/@codeSystemName" attribute -
                The 'translation' tag 'codeSystemName' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags 'codeSystemName'
                attributes to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: e-Referral - Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:value/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall contain a value. Check all
                'cda:targetSiteCode/cda:qualifier/cda:value/cda:translation' tags 'displayName'
                attributes to find the missing value.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: e-Referral -
                Global Clinical Document check for
                "cda:targetSiteCode/cda:qualifier/cda:translation/@displayName" attribute -
                The 'targetSiteCode/qualifier/translation' tag 'displayName' attribute shall not be present 
                if the corresponding 'code' attribute is missing.
                Check all 'cda:targetSiteCode/cda:qualifier/cda:translation' tags to find
                the incorrectly contained 'displayName' attribute.
                Refer to the HL7 data types specification and 
                e-Referral_CDA_Implementation_Guide_v2.2.</report>
        </rule>





        <!-- BEGIN :: Common Patterns: cda:linkHtml  DataType -->

        <!-- ====================================================================================================== -->
        <!-- Validate the matching of attributes of
             the section/text//linkHtml tag and
             the section/entry/act/reference/externalDocument/id tag.
             <linkHtml href="pcehr:1.2.36.1.2001.1007.10.8003640002000035/b50b7910-7ffb-4f4c-bbe4-177ed68cbbf^a12323">Document</linkHtml>
             <id root="b50b7910-7ffb-4f4c-bbe4-177ed68cbbf" extension="a12323"/ >

             First part  - pcehr:1.2.36.1.2001.1007.10.8003640002000035
             Second part - b50b7910-7ffb-4f4c-bbe4-177ed68cbbf
             Third part  - a12323

             (Rule1) The @href shall start with 'pcehr'
             The first part of the @href is repositofy_id (ie. 1.2.36.1.2001.1007.10.8003640002000035) but we are not checking this.
             (Rule2) The second part of the @href is document-id-root (ie. b50b7910-7ffb-4f4c-bbe4-177ed68cbbf) and it shall be same as @root of id tag.
             (Rule3) The third part of the @href is document-id-extension (ie. a12323). The value shall be same as @extention of id tag, if @extention of id tag is present.
        -->

        <rule context="cda:section[cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id]">

            <!-- (Rule1) The @href shall start with 'pcehr' -->
            <assert test="
                starts-with(cda:text//cda:linkHtml/@href, 'pcehr:')"
                >Error: e-Referral -
                Global Clinical Document check for "linkHtml" tag -
                The 'cda:content/cda:linkHtml' tag 'href' attribute shall start with 'pcehr:'.
                Refer to section(s) 0.0 of the
                e-Referral_CDA_Implementation_Guide_v2.2.
            </assert>


            <!--
                As defined in [ITU-X.667]:
                an OID that begins with "2.25." is an OID encoded UUID.
                The value after "2.25." is the straight decimal encoding of the UUID as an integer.
                It MUST be a direct decimal encoding of the single integer, all 128 bits.
                It must not be broken up into parts.
                E.g., the UUID "f81d4fae-7dec-11d0-a765-00a0c91e6bf6" becomes the OID "2.25.329800735698586629295641978511506172918".
            -->
            <!-- (Rule2) The second part of the @href is document-id-root -->
            <assert test="
                starts-with(substring-before(substring-after(concat(cda:text//cda:linkHtml/@href, '^'), '/'), '^'), '2.25.') or
                substring-before(substring-after(concat(cda:text//cda:linkHtml/@href, '^'), '/'), '^') = cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root"
                >Error: e-Referral -
                Global Clinical Document check for "linkHtml" tag -
                The 'cda:content/cda:linkHtml' tag 'href' attribute shall
                contain the value from 'cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root'.
                Refer to section(s) 0.0 of the
                e-Referral_CDA_Implementation_Guide_v2.2.
            </assert>


            <!-- This test tries to convert the UUID to a 128-bits long integer and compare the result to the 2nd part of linkHtml. -->
            <!-- The test fails due to the schematron transformation engine fails to correctly perfrom 128-bits long integer calculation.
                 Which means if the linkHtml has an OID encoded UUID, schematron is unable to flag error if it is incorrect.
            -->
            <!--
            <assert test="
                not(
                    starts-with(substring-before(substring-after(concat(cda:text//cda:linkHtml/@href, '^'), '/'), '^'), '2.25.')
                ) and (
                    substring-after(substring-before(substring-after(concat(cda:text//cda:linkHtml/@href, '^'), '/'), '^'), '2.25.')
                    = ((((((((((((((((((((((((((((((
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  1, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  1, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  1, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      ) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  2, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  2, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  2, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  3, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  3, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  3, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  4, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  4, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  4, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  5, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  5, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  5, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  6, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  6, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  6, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  7, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  7, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  7, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  8, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  8, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  8, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  9, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  9, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  9, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  10, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  10, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  10, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  11, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  11, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  11, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  12, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  12, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  12, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  13, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  13, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  13, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  14, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  14, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  14, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  15, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  15, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  15, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  16, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  16, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  16, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  17, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  17, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  17, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  18, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  18, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  18, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  19, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  19, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  19, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  20, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  20, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  20, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  21, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  21, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  21, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  22, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  22, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  22, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  23, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  23, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  23, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  24, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  24, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  24, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  25, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  25, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  25, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  26, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  26, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  26, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  27, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  27, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  27, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  28, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  28, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  28, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  29, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  29, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  29, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  30, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  30, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  30, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  31, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  31, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  31, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )) * 16 +
                      (number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  32, 1), '0123456789abcdefABCDEF', '0123456789000000000000'))     +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  32, 1), '0123456789abcdefABCDEF', '0000000000555555555555')) * 2 +
                       number(translate(substring(translate(cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root, '-', ''),  32, 1), '0123456789abcdefABCDEF', '0000000000012345012345'))
                      )
                )
                "
                >Error: e-Referral -
                Global Clinical Document check for "linkHtml" tag -
                The 'cda:content/cda:linkHtml' tag 'href' attribute shall
                contain the value from 'cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@root'.
                Refer to section(s) 0.0 of the
                e-Referral_CDA_Implementation_Guide_v2.2.
            </assert>
            -->





            <!-- (Rule3) The third part of the @href shall be same as @extention of id tag, if @extention of id tag is present. -->
            <report test="
                starts-with(cda:text//cda:linkHtml/@href, 'pcehr:') and
                cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@extension and
                substring-after(substring-after(cda:text//cda:linkHtml/@href, ':'), '^') != cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@extension"
                >Error: e-Referral -
                Global Clinical Document check for "linkHtml" tag -
                The 'cda:content/cda:linkHtml' tag 'href' attribute shall contain the value from 'cda:entry/cda:act/cda:reference/cda:externalDocument/cda:id/@extension'.
                Refer to section(s) 0.0 of the
                e-Referral_CDA_Implementation_Guide_v2.2.</report>

        </rule>








    </pattern>

</schema>

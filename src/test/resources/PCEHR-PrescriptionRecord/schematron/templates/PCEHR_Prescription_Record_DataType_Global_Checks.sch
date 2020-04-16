<?xml version = "1.0" encoding = "UTF-8"?>

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>



    <pattern name="p-PCEHR_Prescription_Record_DataType_Global_Checks-errors"
        id="p-PCEHR_Prescription_Record_DataType_Global_Checks-errors"
        see="#p-PCEHR_Prescription_Record_DataType_Global_Checks-errors">


        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'BL'] DataType -->

        <rule context="cda:value[@xsi:type='BL']">

            <assert test="@nullFlavor or @value"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'nullFlavor' or
                'value' attribute. Check all 'cda:value' tags with 'xsi:type=BL'
                attribute to find the missing 'nullFlavor' or 'value' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@nullFlavor" -
                The 'value' tag 'nullFlavor' attribute
                shall contain a value. Check all 'cda:value' tags with 'xsi:type=BL'
                attribute to find the 'nullFlavor' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=BL' attribute to find the
                'value' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @value and
                normalize-space(@value) != '' and
                @value != 'true' and
                @value != 'false'
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain the value 'true' or 'false'.
                Check all 'cda:value' tags with 'xsi:type=BL' attribute to find the
                'value' attribute of incorrect value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!--
            <report test="
                @value and
                normalize-space(@value) != '' and
                translate(@value, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != 'TRUE' and
                translate(@value, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != 'FALSE'
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain the value 'true' or 'false'.
                Check all 'cda:value' tags with 'xsi:type=BL' attribute to find the
                'value' attribute of incorrect value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>
            -->

        </rule>




        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'CD'] DataType -->

        <rule context="cda:value[@xsi:type='CD']">

            <!--
            <assert test="normalize-space(@xsi:type) != ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="
                normalize-space(@xsi:type) = '' or
                @xsi:type = 'CD' "
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'xsi:type' attribute shall contain the value 'CD'.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>
            -->

            <assert test="
                cda:originalText or (@code and @codeSystem) or @nullFlavor"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'originalText' tag or the
                'code and codeSystem' or the 'nullFlavor' attributes.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the missing tag or attribute(s).
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@codeSystem and normalize-space(@codeSystem) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystem" attribute -
                The 'value' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'codeSystem' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystem" attribute -
                The 'value' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystem" attribute -
                The 'value' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystem" attribute -
                The 'value' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@nullFlavor" -
                The 'value' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'nullFlavor' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- The CD data type "nullFlavor" attribute can have one of the following values:: NI, UNK, ASKU, NAV, NASK, NA. -->
            

            <report test="count(cda:originalText) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:originalText" -
                The 'originalText' tag shall appear only once.
                Check all 'cda:value' tag with 'xsi:type=CD' attribute to find
                the duplicated 'originalText' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- originalText if present can't be empty -->
            <report test="cda:originalText and normalize-space(cda:originalText) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:originalText" -
                The 'originalText' tag shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText' child tag have value missing.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Special Case for MIMS - if codeSystem is 1.2.36.1.2001.1005.11.1, originalText must be present -->
            <report test="
                (not(@nullFlavor) or (@nullFlavor = 'OTH')) and
                @codeSystem = '1.2.36.1.2001.1005.11.1' and
                not(cda:originalText)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:originalText" -
                The 'originalText' tag is missing for the existence of attribute
                'codeSystem = 1.2.36.1.2001.1005.11.1'.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the missing 'originalText' tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@code and normalize-space(@code) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@code" attribute -
                The 'value' tag 'code' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'code' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="substring(@code, 1, 1) = ' ' or substring(@code, string-length(@code), 1) = ' '"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@code" attribute -
                The 'value' tag 'code' attribute shall not start or end with space.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'code' attribute with incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@code" attribute -
                The 'value' tag 'code' attribute shall not be presented for the missing of 'codeSystem' attribute.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the incorrectly contained 'code' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystemName" attribute -
                The 'value' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'codeSystemName' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@codeSystemVersion" attribute -
                The 'value' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'codeSystemVersion' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@displayName" attribute -
                The 'value' tag 'displayName' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'displayName' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@displayName" attribute -
                The 'value' tag 'displayName' attribute shall not be presented for the missing of 'code' attribute.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the incorrectly contained 'displayName' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- qualifiers are not allowed unless CDA IG describes their use -->
            <assert test="not(cda:qualifier)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:qualifier" -
                The 'qualifier' tag shall not be presented within 'value'.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find the incorrect child 'qualifier' tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:value[@xsi:type='CD']/cda:translation">

            <!-- a codeSystem must be present -->
            <assert test="@codeSystem"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute is missing.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with missing 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'codeSystem' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain an UUID or OID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid UUID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall be a valid OID.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- translation SHALL NOT contain the same value/codeSystem as another in the cluster -->
            <!-- i.e. translation from same codeSystem is not allowed -->
            <assert test="not(@codeSystem) or
                normalize-space(@codeSystem) = '' or
                not(parent::*/@codeSystem) or
                normalize-space(parent::*/@codeSystem) = '' or
                @codeSystem != parent::*/@codeSystem"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute -
                The 'translation' tag 'codeSystem' attribute shall contain a value different from the
                codeSystem it translates from. Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the incorrect 'codeSystem' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- either code or nullFlavor attribute is required -->
            <assert test="@code or @nullFlavor"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation" attributes -
                The 'translation' tag shall have at least the 'code' or the 'nullFlavor' attributes.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the missing attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'nullFlavor' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- only nullFlavor allows in translation is 'OTH' -->
            <report test="@nullFlavor and normalize-space(@nullFlavor) != '' and @nullFlavor != 'OTH'"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@nullFlavor" attribute -
                The 'translation' tag 'nullFlavor' attribute shall contain the value 'OTH'.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'nullFlavor' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- translation SHALL NOT contain originalText -->
            <assert test="not(cda:originalText)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation" -
                The 'originalText' tag shall not be presented within 'translation' tag.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag containing 'originalText' tag.
                Refer to section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- translation SHALL NOT contain nested translation(s) -->
            <assert test="not(cda:translation)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation" -
                The 'translation' tag shall not be presented within 'translation' tag.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with nested 'translation' tag.
                Refer to section 2.1.5 of the
                Implementation Guidance - Representing Coding in CDA Documents - Version 1.0 - 10 October 2011,
                and sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@code and normalize-space(@code) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall contain a value.
                Check all 'cda:value' with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'code' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- code cannot have leading or trailing whitespace -->
            <report test="substring(@code, 1, 1) = ' ' or substring(@code, string-length(@code), 1) = ' '"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not start or end with space.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'code' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- if a code is present, a codeSystem must be present -->
            <report test="not(@codeSystem) and @code"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@code" attribute -
                The 'translation' tag 'code' attribute shall not be presented for the missing of 'codeSystem' attribute.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with incorrectly contained 'code' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- codeSystemName can't be present but empty -->
            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystemName" attribute -
                The 'translation' tag 'codeSystemName' attribute shall contain a value.
                Check all 'cda:value' with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'codeSystemName' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- codeSystemVersion can't be present but empty -->
            <report test="@codeSystemVersion and normalize-space(@codeSystemVersion) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@codeSystemVersion" attribute -
                The 'translation' tag 'codeSystemVersion' attribute shall contain a value.
                Check all 'cda:value' with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'codeSystemVersion' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- displayname can't be empty -->
            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall contain a value.
                Check all 'cda:value' with 'xsi:type=CD' attribute to find
                the 'translation' child tag 'displayName' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- displayName can't be present unless a code is present -->
            <report test="not(@code) and @displayName"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/@displayName" attribute -
                The 'translation' tag 'displayName' attribute shall not be presented for the missing of 'code' attribute.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with incorrectly contained 'displayName' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- qualifiers are not allowed unless CDA IG describes their use -->
            <assert test="not(cda:qualifier)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/cda:translation/cda:qualifier" -
                The 'qualifier' tag shall not be presented within 'translation'.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'translation' child tag with the incorrect child 'qualifier' tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:value[@xsi:type='CD']/cda:originalText">

            <report test = "count(cda:reference) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText' tag -
                The 'reference' tag shall appear only once.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText' child tag with the duplicated 'reference' tag.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- If originalText contains both reference and text, the text must match the reference -->
            <report test = "
                cda:reference and
                normalize-space(concat(text()[1], text()[2])) != '' and
                normalize-space(concat(text()[1], text()[2])) !=
                normalize-space(concat(ancestor::cda:component/cda:section/cda:text/text()[1],
                                       ancestor::cda:component/cda:section/cda:text/text()[2]))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText' tag -
                The 'originalText' tag shall contain the value match to its corresponding narrative block text.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText' child tag with the corresponding narrative text mismatch.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:value[@xsi:type='CD']/cda:originalText/cda:reference">

            <assert test = "@value"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute is missing.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText/reference' child tag with the missing 'value' attribute.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test = "not(@value) or normalize-space(@value) != ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText/reference' child tag with the empty 'value' attribute.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText/cda:reference' tag -
                The narrative 'text/content/@ID' attribute corresponding to the 'reference' tag 'value' attribute is missing.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText/reference' child tag with the missing corresponding narrative.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- originalText reference must be resolve -->
            <assert test = "
                not(@value) or
                normalize-space(@value) = '' or
                not(ancestor::cda:component/cda:section/cda:text) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content) or
                not(ancestor::cda:component/cda:section/cda:text//cda:content/@ID) or
                ancestor::cda:component/cda:section/cda:text//cda:content/@ID = @value">
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for 'cda:value/cda:originalText/cda:reference' tag -
                The 'reference' tag 'value' attribute shall contain the value match to
                its corresponding narrative block content 'ID' attribute.
                Check all 'cda:value' tags with 'xsi:type=CD' attribute to find
                the 'originalText/reference' child tag with the corresponding narrative content ID mismatch.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>




        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'CS'] DataType -->

        <rule context="cda:value[@xsi:type='CS']">

            <assert test="@code">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'code' attribute is missing.
                Check all 'cda:value' tags with 'xsi:type=CS' attribute to find the
                missing 'code' attribute. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'code' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=CS' attribute to find the
                'code' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>




        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'INT'] DataType -->

        <rule context="cda:value[@xsi:type='INT']">

            <assert test="@nullFlavor or @value"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'nullFlavor' or
                the 'value' attribute. Check all 'cda:value' tags with 'xsi:type=INT'
                attribute to find the missing 'nullFlavor' or 'value' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@nullFlavor" -
                The 'value' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=INT' attribute to find the
                'nullFlavor' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and normalize-space(@value) = ''">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=INT' attribute to find the
                'value' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @value and
                normalize-space(@value) != '' and
                number(@value) != floor(@value)
                ">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain an integer value.
                Check all 'cda:value' tags with 'xsi:type=INT' attribute to find the
                'value' attribute of incorrect datatype.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'PQ'] DataType -->

        <rule context="cda:value[@xsi:type='PQ']">

            <assert test="@nullFlavor or @value"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'nullFlavor' or the 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PQ' attribute to find the
                missing 'nullFlavor' or 'value' attribute. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@nullFlavor" -
                The 'value' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PQ' attribute to find the
                'nullFlavor' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and normalize-space(@value) = ''">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PQ' attribute to find the
                'value' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@unit and normalize-space(@unit) = ''">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'unit' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PQ' attribute to find the
                'unit' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@unit and not(@value)">Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute is missing for the existence of 'unit' attribute.
                Check all 'cda:value' tags with 'xsi:type=PQ' attribute to find the
                'unit' attribute of missing value. Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>




        <!-- BEGIN :: Common Patterns: cda:value[@xsi:type = 'PIVL_TS']
                                       cda:value[@xsi:type = 'IVL_TS']
                                       cda:value[@xsi:type = 'TS'] DataType -->

        <!--
        ISO 8601 time syntax : 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'
         -->
        <rule context="cda:value[@xsi:type='TS']                           |
                       cda:value[@xsi:type='IVL_TS']/cda:low               |
                       cda:value[@xsi:type='IVL_TS']/cda:high              |
                       cda:value[@xsi:type='IVL_TS']/cda:center            |
                       cda:value[@xsi:type='PIVL_TS']/cda:phase/cda:low    |
                       cda:value[@xsi:type='PIVL_TS']/cda:phase/cda:high   |
                       cda:value[@xsi:type='PIVL_TS']/cda:phase/cda:center">

            <!-- Validating TS datatype -
                 A simple timestamp (point in time) will only contain a value attribute containing the time value,
                 expressed as a series of digits as long as required or available.-->

            <assert test="
                @value or @nullFlavor"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'value' or 'nullFlavor' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the missing 'nullFlavor' or 'value' attribute.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@nullFlavor and normalize-space(@nullFlavor) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value/@nullFlavor" -
                The 'value' tag 'nullFlavor' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'nullFlavor' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of missing value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>


            <!-- Any time that is more specific than a day SHALL include a timezone. -->
            <report test="
                @value                      and
                string-length(@value) > 8   and
                not(contains(@value,'+'))   and not(contains(@value,'-'))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for value datatype -
                The 'value' tag 'value' attribute shall contain a timezone value.
                "Any time that is more specific than a day SHALL include a timezone".
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of missing timezone value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The value for year must be more recent than 1900.
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Hour -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Minute -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' or
                'xsi:type=TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:value[@xsi:type='IVL_TS'] | cda:value[@xsi:type='PIVL_TS']/cda:phase">

            <!-- Validating IVL_TS datatype high level tags and attributes -->

            <assert test="
                @value or cda:center or cda:low or cda:high or cda:width or @nullFlavor"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'value' or 'nullFlavor'
                attribute or 'low' or 'high' or 'center' or 'width' child tag.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS'
                attribute to find the missing 'nullFlavor' or 'value' attribute
                or 'low' or 'high' or 'center' or 'width' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <report test="@value and normalize-space(@value) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" tag -
                The 'value' or 'value/phase' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the missing attribute value.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Any time that is more specific than a day SHALL include a timezone. -->
            <report
                test="@value                and
                string-length(@value) > 8   and
                not(contains(@value,'+'))   and not(contains(@value,'-'))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" tag -
                The 'value' or 'value/phase' tag 'value' attribute shall contain a timezone value.
                "Any time that is more specific than a day SHALL include a timezone".
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of missing timezone value.
                Refer to section 0.0 of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The value for year must be more recent than 1900.
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Hour -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Minute -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Second -
                The 'value' or 'value/phase' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- ============================================================ -->

            <report test="count(cda:low) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag shall appear only once.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the duplicate 'low' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:high) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'high' tag shall appear only once.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the duplicate 'high' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:center) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'center' tag shall appear only once.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the duplicate 'center' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:width) > 1"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'width' tag shall appear only once.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the duplicate 'width' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>


            <!-- The 'center' tag is used with 'width' tag, but should not be coexist with 'low' or 'high' tag -->

            <report test="cda:center and (cda:low or cda:high)"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'value' tag shall have 'center' or 'low and/or high' tag
                but not both.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the incorrect use of 'center' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>


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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag 'value' attribute shall be a value less than than the
                'high' tag 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'low' tag 'value' attribute shall contain a value less than than the
                'high' tag 'value' attribute.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute and 'phase'
                child tag, or 'cda:value' tags with 'xsi:type=IVL_TS' attribute,
                to find the 'low' and 'high' child tags having incorrect attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="cda:value[@xsi:type='PIVL_TS']">

            <!-- Validating PIVL_TS datatype high level tags and attributes -->

            <assert test="
                @value or @nullFlavor or cda:frequency or cda:period or cda:phase"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "cda:value" -
                The 'value' tag shall have at least the 'value' or 'nullFlavor'
                attribute or 'frequency' or 'period' or 'phase' child tag.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute
                to find the missing 'value' or 'nullFlavor' attribute, or
                frequency' or 'period' or 'phase' child tag.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect fraction of second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '+' timezone
                 'YYYYMMDDHHMMSS.UUUU+ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'+'))    or
                ((string(number(substring-after(@value,'+'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- check value of timezone with a '-' timezone
                 'YYYYMMDDHHMMSS.UUUU-ZZzz'
                                      ^^^^               -->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                not(contains(@value,'-'))    or
                ((string(number(substring-after(@value,'-'))) != string(number(@value))) and
                ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect TimeZone -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect DateTime -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>
-->
            <assert test="
                not(@value)                  or
                normalize-space(@value) = '' or
                number(substring(@value,1,2)) >= 19
                "
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Year -
                The value for year must be more recent than 1900.
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Month -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Date -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Hour -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Minute -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

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
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag - Incorrect Second -
                The 'value' tag 'value' attribute shall be a number
                formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' attribute to find the 'value' attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="cda:value[@xsi:type='IVL_TS']/cda:width                      |
                       cda:value[@xsi:type='PIVL_TS']/cda:phase/cda:width           |
                       cda:value[@xsi:type='PIVL_TS']/cda:period                    |
                       cda:value[@xsi:type='PIVL_TS']/cda:frequency/cda:numerator   |
                       cda:value[@xsi:type='PIVL_TS']/cda:frequency/cda:denominator">

           <!-- Validating PQ datatype of witdth of IVL_TS;
                                          phase/width of PIVL_TS;
                                          period of PIVL_TS
                                          frequency/numerator of PIVL_TS
                                          frequency/denominator of PIVL_TS
           -->

            <report test="
                @xsi:type and
                normalize-space(@xsi:type) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'xsi:type' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' attribute
                to find child tags having attribute of empty value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="
                @xsi:type and
                normalize-space(@xsi:type) != '' and
                @xsi:type != 'PQ'"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'xsi:type' attribute shall contain the value 'PQ'.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' attribute
                to find child tags having attribute of incorrect value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@value and normalize-space(@value) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'width' or 'period' or 'numerator' or 'denominator' tag 'value' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' attribute
                to find the 'width' or 'period' or 'numerator' or 'denominator'
                child tags that have empty attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="@unit and normalize-space(@unit) = ''"
                >Error: PCEHR Prescription Record -
                Global Clinical Document check for "value" tag -
                The 'value/width' tag 'unit' attribute shall contain a value.
                Check all 'cda:value' tags with 'xsi:type=PIVL_TS' or 'xsi:type=IVL_TS' attribute
                to find the 'width' or 'period' or numerator' or 'denominator'
                child tags that have empty attribute value.
                Refer to sections of the
                PCEHR_Prescription_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>







    </pattern>



</schema>

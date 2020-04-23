<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 14/04/2015 11:56:53 AM

                  Product            : Diagnostic Imaging Report
                  Release            : CDA_Implementation_Guide_v1.0
                  Generator Version  : 
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Diagnostic_Imaging_Report_DVA_File_Number_Checks-errors"
        id="p-Diagnostic_Imaging_Report_DVA_File_Number_Checks-errors"
        see="#p-Diagnostic_Imaging_Report_DVA_File_Number_Checks-errors">




        <!--The value of the entitlement id shall have the following attribute values:
            1.	The value of assigningAuthorityName shall be "Department of Veterans' Affairs".
            2.	The value of root shall equal 2.16.840.1.113883.3.879.270091.
            3.	The value of extension shall be the DVA file number.
            The extension attribute of the Entitlement id shall conform to the following requirements
            1.	The 1st character is the State Code (an alpha) and shall be either N (for NSW), V (for Victoria), Q (for Queensland), W (for Western Australia), S (for South Australia) or T (for Tasmania). Veterans in the ACT are given the NSW state code N and veterans in the Northern Territory are given the South Australian state code S.
            2.	The next 7 characters are the file number and consists of a War Code and numeric digits:
            a.	If the War Code is 1 alpha character, the following characters are 6 digits (ANNNNNN).
            b.	If the War Code is 2 alpha characters, the following characters are 5 digits (AANNNNN).
            c.	If the War Code is 3 alpha characters, the following characters are 4 digits (AAANNNN).
            3.	The ninth character is optional and if present is an alpha. If present it represents members related to the veteran. -->
        
        
        <rule context="ext:entitlement[(ext:code/@codeSystem = '1.2.36.1.2001.1001.101.104.16047') and ((ext:code/@code = '5') or (ext:code/@code = '6') or (ext:code/@code = '7'))]/ext:id">
            
            
            <assert test="@root">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'root' attribute is missing. Check all related 'ext:id' tags to find the missing 'root' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <report test="
                @root and
                normalize-space(@root) = '' 
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'root' attribute shall contain a value. Check all related 'ext:id' tags to find the empty 'root' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report test="
                @root and
                normalize-space(@root) != '' and 
                @root != '2.16.840.1.113883.3.879.270091'
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'root' attribute shall contain the value '2.16.840.1.113883.3.879.270091'. Check all related 'ext:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
          
            
            <report test="
                @assigningAuthorityName and
                normalize-space(@assigningAuthorityName) = '' 
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'assigningAuthorityName' attribute shall contain a value. Check all related 'ext:id' tags to find the empty 'assigningAuthorityName' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            <assert test="
                not(@assigningAuthorityName) or normalize-space(@assigningAuthorityName) = '' or (contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'DVA')) or (contains(translate(@assigningAuthorityName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'VETERAN'))"
                >Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'assigningAuthorityName' attribute shall  contain "DVA" or "Veteran" as a part of its value. Check all related 'ext:id' tags to find the incorrect 'assigningAuthorityName' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <assert test="@extension
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute is missing. Check all 'ext:id' tags to find the missing 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</assert>
            
            <report test="@extension and normalize-space(@extension) = '' 
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall contain a value. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report test="@extension and
                normalize-space(@extension) != '' and
                (string-length(@extension) != 8 and string-length(@extension) != 9)
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report test="@extension and
                normalize-space(@extension) != '' and
                not(starts-with(@extension, 'N') or starts-with(@extension, 'V') or starts-with(@extension, 'Q') or starts-with(@extension, 'W') or starts-with(@extension, 'S') or starts-with(@extension, 'T'))
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall
                be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report test="@extension and
                normalize-space(@extension) != '' and 
                not(translate(substring(@extension,  2,  1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwwxyz', '0000000000000000000000000000000000000000000000000000') = '0' and   
                translate(substring(@extension,  3,  2), 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwwxyz0123456789', '00000000000000000000000000000000000000000000000000000000000000') = '00' and  
                translate(substring(@extension, 5, 4), '0123456789', '0000000000') = '0000') 
                ">Error:  Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall
                be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            <report test="@extension and
                normalize-space(@extension) != '' and
                (string-length(@extension) = 9 and   not(translate(substring(@extension,  9,  1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwwxyz', '0000000000000000000000000000000000000000000000000000') = '0'))
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            <report test="@extension and
                normalize-space(@extension) != '' and 
                substring(@extension,  2,  1) = '0'
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall
                be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'extension' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            <report test="@extension and
                normalize-space(@extension) != '' and
                (string-length(@extension) = 9 and  (substring(@extension,  9,  1) = '0'))
                ">Error: Diagnostic Imaging Report -
                Entitlement Number - check for "id" tag - The 'id' tag 'extension' attribute shall be a valid DVA file number. Check all related 'ext:id' tags to find the incorrect 'root' attribute.
                Refer to section 8.2 of the
                Diagnostic_Imaging_Report_CDA_Implementation_Guide_v1.0.</report>
            
            
            
            
        </rule>


    </pattern>

</schema>

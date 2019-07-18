<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 07-01-2014 11:47:44

                  Product            : Prescription Request
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.4
                  IG Guide Title     : Prescription Request Item
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Prescription_Request_3A_PrescriptionRequestItem_8_4-errors"
        id="p-Prescription_Request_3A_PrescriptionRequestItem_8_4-errors"
        see="#p-Prescription_Request_3A_PrescriptionRequestItem_8_4-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']">

            <assert test="cda:entry[cda:substanceAdministration/@classCode = 'SBADM']"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'entry' tag is missing for ' SubstanceAdministration'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:entry[cda:substanceAdministration/@classCode = 'SBADM']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'entry' tag shall appear only once for ' SubstanceAdministration'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry[cda:substanceAdministration/@classCode = 'SBADM']">

            <report test="@typeCode and normalize-space(@typeCode) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'entry' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @typeCode and normalize-space(@typeCode) != '' and @typeCode != 'DRIV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'entry' tag 'typeCode' attribute shall contain the value 'DRIV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:substanceAdministration) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'substanceAdministration' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'substanceAdministration' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'substanceAdministration' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="cda:statusCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'statusCode' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:statusCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'statusCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Prescription Request Item Identifier" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Prescription Request Item Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:consumable"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'consumable' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:consumable) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'consumable' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16272']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'entryRelationship' tag shall appear only once for ' Formula'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Directions" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Directions" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:doseQuantity) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity" -
                The 'doseQuantity' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'entryRelationship' tag shall appear only once for ' Quantity Description'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '260911001']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'entryRelationship' tag shall appear only once for ' Timing Description'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:precondition) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'precondition' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[ext:controlAct/ext:code/@code = '103.16436']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'entryRelationship' tag shall appear only once for ' Start Criterion'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[ext:controlAct/ext:code/@code = '103.16434']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'entryRelationship' tag shall appear only once for ' Stop Criterion'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:maxDoseQuantity) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Number of Administrations" -
                The 'maxDoseQuantity' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:observation/cda:code/@code = '103.16440']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'entryRelationship' tag shall appear only once for ' Long-Term'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:routeCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:approachSiteCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:methodCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:supply]) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'entryRelationship' tag shall appear only once for ' Quantity'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:entryRelationship[cda:supply]"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'entryRelationship' tag is missing for ' Quantity'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '103.16044']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'entryRelationship' tag shall appear only once for ' Additional Comments'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:statusCode">

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'statusCode' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'statusCode' tag 'code' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@code) or normalize-space(@code) = '' or @code = 'suspended'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / SubstanceAdministration" -
                The 'statusCode' tag 'code' attribute shall contain the value 'suspended'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Prescription Request Item Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply">

            <assert test="cda:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Dispense Item Identifier" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Dispense Item Identifier" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:quantity) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'quantity' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:product) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'product' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:entryRelationship[cda:act/cda:code/@code = '246205007']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'entryRelationship' tag shall appear only once for ' Quantity Description'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:subjectOf2) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'subjectOf2' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:coverage[ext:policyOrAccount/ext:code/@codeSystem = '1.2.36.1.5001.1.1.3.2.6']"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'coverage' tag is missing for ' PBS Prescription Type'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@codeSystem = '1.2.36.1.5001.1.1.3.2.6']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'coverage' tag shall appear only once for ' PBS Prescription Type'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@codeSystem = '1.2.36.1.2001.1001.101.104.16095']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'coverage' tag shall appear only once for ' Medical Benefit Category Type'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16095.3']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'coverage' tag shall appear only once for ' PBS Close the Gap Benefit'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16719']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'coverage' tag shall appear only once for ' PBS RPBS Authority Prescription Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@code = '103.10159']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'coverage' tag shall appear only once for ' PBS RPBS Authority Approval Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16718']) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'coverage' tag shall appear only once for ' Streamlined Authority Approval Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Dispense Item Identifier" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable">

            <assert test="cda:manufacturedProduct"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct">

            <assert test="cda:manufacturedMaterial"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'manufacturedMaterial' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:subjectOf1) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'subjectOf1' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">

            <assert test="cda:code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'code' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Therapeutic Good Identification" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:formCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'formCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code">

            <report test="count(cda:translation) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Item Code" -
                The 'translation' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16272']">

            <report test="count(cda:act) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16272']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'RQO'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'act' tag 'moodCode' attribute shall contain the value 'RQO'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="cda:code[@code = '103.16272']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16272']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='103.16272'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16272']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Formula'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'code' tag 'displayName' attribute shall contain the value 'Formula'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16272']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:asIngredient/ext:ingredientManufacturedMaterial">

            <assert test="ext:quantity"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'quantity' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:quantity) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'quantity' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Name" -
                The 'code' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Name" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:asIngredient/ext:ingredientManufacturedMaterial/ext:quantity">

            <assert test="cda:numerator"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'numerator' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:numerator) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Formula" -
                The 'numerator' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:denominator"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Quantity" -
                The 'denominator' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:denominator) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Quantity" -
                The 'denominator' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:asIngredient/ext:ingredientManufacturedMaterial/ext:quantity/cda:denominator">

            <assert test="@value"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Quantity" -
                The 'denominator' tag 'value' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Quantity" -
                The 'denominator' tag 'value' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@value) or normalize-space(@value) = '' or @value = '1'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description / PBS Extemporaneous Ingredient / PBS Extemporaneous Ingredient Quantity" -
                The 'denominator' tag 'value' attribute shall contain the value '1'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Directions" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:doseQuantity">

            <assert test="@value"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity" -
                The 'doseQuantity' tag 'value' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity" -
                The 'doseQuantity' tag 'value' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@unit and normalize-space(@unit) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity" -
                The 'doseQuantity' tag 'unit' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '246205007']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:act) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '246205007']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'text' tag shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act/cda:code[@code = '246205007']">

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'SNOMED CT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Quantity'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Quantity'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Structured Dose / Quantity Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '260911001']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:act) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '260911001']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'INT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'INT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'text' tag shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="cda:code[@code = '260911001']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '260911001']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='260911001'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '260911001']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'SNOMED CT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Timing Description'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Timing Description'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Timing Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:precondition">

            <assert test="cda:criterion"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'criterion' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:criterion) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'criterion' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:precondition/cda:criterion">

            <assert test="cda:value"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'value' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:value) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'value' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:precondition/cda:criterion/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'BL' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'BL')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / PRN" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'BL'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[ext:controlAct/ext:code/@code = '103.16436']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:controlAct) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/ext:controlAct[ext:code/@code = '103.16436']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'CACT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'classCode' attribute shall contain the value 'CACT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'controlAct' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:effectiveTime) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Date" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16436']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16436']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/ext:controlAct/ext:code[@code='103.16436'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/controlAct/code[@code = '103.16436']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Start Criterion'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'code' tag 'displayName' attribute shall contain the value 'Start Criterion'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Start Criterion" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[ext:controlAct/ext:code/@code = '103.16434']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:controlAct) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/ext:controlAct[ext:code/@code = '103.16434']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'CACT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'classCode' attribute shall contain the value 'CACT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'controlAct' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(ext:effectiveTime) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Date" -
                The 'effectiveTime' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16434']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16434']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/ext:controlAct/ext:code[@code='103.16434'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/controlAct/code[@code = '103.16434']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Stop Criterion'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'code' tag 'displayName' attribute shall contain the value 'Stop Criterion'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Stop Criterion" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:observation/cda:code/@code = '103.16440']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:observation) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16440']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'OBS'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'classCode' attribute shall contain the value 'OBS'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:value"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'value' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:value) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'value' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="cda:code[@code = '103.16440']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16440']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:observation/cda:code[@code='103.16440'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/observation/code[@code = '103.16440']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Long-Term'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'code' tag 'displayName' attribute shall contain the value 'Long-Term'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:observation[cda:code/@code = '103.16440']/cda:value">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'value' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'BL' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'BL')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Timing / Long-Term" -
                The 'value' tag 'xsi:type' attribute shall contain the value 'BL'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:routeCode">

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'code' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'codeSystem' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @codeSystemName and normalize-space(@codeSystemName) != '' and @codeSystemName != 'SNOMED CT-AU'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Route" -
                The 'routeCode' tag 'displayName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:approachSiteCode">

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'code' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'codeSystem' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @codeSystemName and normalize-space(@codeSystemName) != '' and @codeSystemName != 'SNOMED CT-AU'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Anatomical Site" -
                The 'approachSiteCode' tag 'displayName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/ext:methodCode">

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'code' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@codeSystem) or normalize-space(@codeSystem) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'codeSystem' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@codeSystemName and normalize-space(@codeSystemName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="@displayName and normalize-space(@displayName) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Administration Details / Medication Delivery / Method" -
                The 'methodCode' tag 'displayName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:quantity">

            <assert test="@value"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'quantity' tag 'value' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@value) or normalize-space(@value) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'quantity' tag 'value' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="@unit and normalize-space(@unit) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'quantity' tag 'unit' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode">

            <report test="
                @codeSystem and normalize-space(@codeSystem) != '' and @codeSystem != '2.16.840.1.113883.6.96'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'formCode' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @codeSystemName and normalize-space(@codeSystemName) != '' and @codeSystemName != 'SNOMED CT-AU'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity" -
                The 'formCode' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:product">

            <assert test="cda:manufacturedProduct"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'manufacturedProduct' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:manufacturedProduct) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'manufacturedProduct' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:product/cda:manufacturedProduct">

            <report test="count(cda:manufacturedMaterial) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'manufacturedMaterial' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="count(cda:manufacturerOrganization) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS ManufacturerCode" -
                The 'manufacturerOrganization' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial">

            <report test="count(ext:formCode) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'formCode' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/ext:formCode">

            <report test="
                @codeSystem and normalize-space(@codeSystem) != '' and @codeSystem != '2.16.840.1.113883.6.96'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'formCode' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @codeSystemName and normalize-space(@codeSystemName) != '' and @codeSystemName != 'SNOMED CT-AU'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Dispensing Unit" -
                The 'formCode' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT-AU'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship[cda:act/cda:code/@code = '246205007']">

            <report test="count(cda:act) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship/cda:act[cda:code/@code = '246205007']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'ACT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'classCode' attribute shall contain the value 'ACT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'text' tag shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:entryRelationship/cda:act/cda:code[@code = '246205007']">

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.6.96'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.6.96'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'SNOMED CT'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'SNOMED CT'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Quantity'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'code' tag 'displayName' attribute shall contain the value 'Quantity'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Quantity to Dispense / Quantity Description" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:subjectOf2">

            <assert test="ext:substitutionPermission"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:substitutionPermission) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:subjectOf2/ext:substitutionPermission">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'SUBST'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'classCode' attribute shall contain the value 'SUBST'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'substitutionPermission' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="ext:code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:subjectOf2/ext:substitutionPermission/ext:code">

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '2.16.840.1.113883.5.1070'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'codeSystem' attribute shall contain the value '2.16.840.1.113883.5.1070'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'HL7:SubstanceAdminSubstitution'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'HL7:SubstanceAdminSubstitution'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Therapeutic'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Brand Substitute Not Allowed" -
                The 'code' tag 'displayName' attribute shall contain the value 'Therapeutic'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@codeSystem = '1.2.36.1.5001.1.1.3.2.6']">

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@codeSystem = '1.2.36.1.5001.1.1.3.2.6']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@codeSystem = '1.2.36.1.5001.1.1.3.2.6']">

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Medicare_PBS_Prescription_Type_Values']/code[(@code = current()/@code)]"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'code' attribute shall be as per Medicare PBS Prescription Type Values.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'Prescription Type Values'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'Prescription Type Values'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) = '' or
                not(@displayName) or normalize-space(@displayName) = '' or
                document('CDAValidate_Vocabs.xml')/systems/system [@codeSystemName = 'Medicare_PBS_Prescription_Type_Values']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'code' tag 'code' and 'displayName' attributes shall match as per Medicare PBS Prescription Type Values.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Prescription Type" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@codeSystem = '1.2.36.1.2001.1001.101.104.16095']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'coverage' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'coverage' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COVBY'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'coverage' tag 'typeCode' attribute shall contain the value 'COVBY'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@codeSystem = '1.2.36.1.2001.1001.101.104.16095']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@codeSystem = '1.2.36.1.2001.1001.101.104.16095']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@codeSystem = '1.2.36.1.2001.1001.101.104.16095']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@codeSystem='1.2.36.1.2001.1001.101.104.16095'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply/coverage/policyOrAccount/code[@codeSystem = '1.2.36.1.2001.1001.101.104.16095']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@code"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'code' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test = "not(@code) or normalize-space(@code) = '' or 
                document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Medical_Benefit_Category_Type']/code[(@code = current()/@code)]"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'code' attribute shall be as per C14 NCTIS ADMIN CODES Medical Benefit Category Type.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@codeSystemName) or normalize-space(@codeSystemName) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'codeSystemName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Medical Benefit Category Type Values'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Medical Benefit Category Type Values'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@displayName) or normalize-space(@displayName) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'displayName' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@code) or normalize-space(@code) = '' or
                not(@displayName) or normalize-space(@displayName) = '' or
                document('CDAValidate_Vocabs.xml')/systems/system [@codeSystemName = 'Medical_Benefit_Category_Type']/code[
                    (@code = current()/@code) and (
                    translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =
                    translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'code' tag 'code' and 'displayName' attributes shall match as per C14 NCTIS ADMIN CODES Medical Benefit Category Type.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Medical Benefit Category Type" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16095.3']">

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.16095.3']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16095.3']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16095.3']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@code='103.16095.3'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply/coverage/policyOrAccount/code[@code = '103.16095.3']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'PBS Close the Gap Benefit'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'code' tag 'displayName' attribute shall contain the value 'PBS Close the Gap Benefit'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Close the Gap Benefit" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/cda:product/cda:manufacturedProduct/cda:manufacturerOrganization">

            <assert test="cda:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS ManufacturerCode" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS ManufacturerCode" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/ext:asIngredient">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description /  PBS Extemporaneous Ingredient" -
                The 'asIngredient' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description /  PBS Extemporaneous Ingredient" -
                The 'asIngredient' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INGR'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description /  PBS Extemporaneous Ingredient" -
                The 'asIngredient' tag 'classCode' attribute shall contain the value 'INGR'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="ext:ingredientManufacturedMaterial"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description /  PBS Extemporaneous Ingredient" -
                The 'ingredientManufacturedMaterial' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:ingredientManufacturedMaterial) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS Extemporaneous Preparation Description /  PBS Extemporaneous Ingredient" -
                The 'ingredientManufacturedMaterial' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16719']">

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.16719']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16719']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16719']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@code='103.16719'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply/coverage/policyOrAccount/code[@code = '103.16719']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'PBS/RPBS Authority Prescription Number'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'code' tag 'displayName' attribute shall contain the value 'PBS/RPBS Authority Prescription Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.16719']/ext:id">

            <assert test="@root"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@root) or normalize-space(@root) = '' or @root = '1.2.36.1.5001.1.1.3.2.2'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag 'root' attribute shall contain the value '1.2.36.1.5001.1.1.3.2.2'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@extension"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag 'extension' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@extension) or normalize-space(@extension) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Prescription Number" -
                The 'id' tag 'extension' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@code = '103.10159']">

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.10159']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.10159']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.10159']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@code='103.10159'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply/coverage/policyOrAccount/code[@code = '103.10159']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'PBS/RPBS Authority Approval Number'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'code' tag 'displayName' attribute shall contain the value 'PBS/RPBS Authority Approval Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.10159']/ext:id">

            <assert test="@root"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@root) or normalize-space(@root) = '' or @root = '1.2.36.1.5001.1.1.3.2.3'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag 'root' attribute shall contain the value '1.2.36.1.5001.1.1.3.2.3'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@extension"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag 'extension' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@extension) or normalize-space(@extension) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / PBS RPBS Authority Approval Number" -
                The 'id' tag 'extension' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage[ext:policyOrAccount/ext:code/@code = '103.16718']">

            <report test="count(ext:policyOrAccount) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.16718']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'COV'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'classCode' attribute shall contain the value 'COV'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'policyOrAccount' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16718']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16718']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount/ext:code[@code='103.16718'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/supply/coverage/policyOrAccount/code[@code = '103.16718']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Streamlined Authority Approval Number'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'code' tag 'displayName' attribute shall contain the value 'Streamlined Authority Approval Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:supply/ext:coverage/ext:policyOrAccount[ext:code/@code = '103.16718']/ext:id">

            <assert test="@root"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@root) or normalize-space(@root) = '' or @root = '1.2.36.1.2001.1005.24'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag 'root' attribute shall contain the value '1.2.36.1.2001.1005.24'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@extension"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag 'extension' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@extension) or normalize-space(@extension) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Streamlined Authority Approval Number" -
                The 'id' tag 'extension' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1[ext:policy/ext:code/@code = '103.16018']">

            <report test="count(ext:policy) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy[ext:code/@code = '103.16018']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'JURISPOL'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'classCode' attribute shall contain the value 'JURISPOL'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'PERM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'policy' tag 'moodCode' attribute shall contain the value 'PERM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="ext:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(ext:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="ext:code[@code = '103.16018']">

            <assert test="
                count(/cda:ClinicalDocument//ext:code[@code = '103.16018']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy/ext:code[@code='103.16018'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/consumable/manufacturedProduct/subjectOf1/policy/code[@code = '103.16018']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'State Authority Number'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'code' tag 'displayName' attribute shall contain the value 'State Authority Number'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:consumable/cda:manufacturedProduct/ext:subjectOf1/ext:policy[ext:code/@code = '103.16018']/ext:id">

            <assert test="@extension"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'id' tag 'extension' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@extension) or normalize-space(@extension) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / State Authority Number" -
                The 'id' tag 'extension' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship[cda:act/cda:code/@code = '103.16044']">

            <assert test="@typeCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'entryRelationship' tag 'typeCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@typeCode) or normalize-space(@typeCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@typeCode) or normalize-space(@typeCode) = '' or @typeCode = 'COMP'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'entryRelationship' tag 'typeCode' attribute shall contain the value 'COMP'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:act) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']">

            <assert test="@classCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'classCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@classCode) or normalize-space(@classCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'classCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@classCode) or normalize-space(@classCode) = '' or @classCode = 'INFRM'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'classCode' attribute shall contain the value 'INFRM'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@moodCode"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'moodCode' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(@moodCode) or normalize-space(@moodCode) != ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'moodCode' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@moodCode) or normalize-space(@moodCode) = '' or @moodCode = 'EVN'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'act' tag 'moodCode' attribute shall contain the value 'EVN'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:code) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:id"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'id' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:id) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'id' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <assert test="cda:text"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'text' tag is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <report test="count(cda:text) > 1"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'text' tag shall appear only once.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="cda:code[@code = '103.16044']">

            <assert test="
                count(/cda:ClinicalDocument//cda:code[@code = '103.16044']) =
                count(/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16211']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship/cda:act/cda:code[@code='103.16044'])"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16211']/entry/substanceAdministration[@classCode = 'SBADM']/entryRelationship/act/code[@code = '103.16044']' path -
                1 or more tags are missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystem"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@codeSystemName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="@displayName"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Additional Comments'"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'code' tag 'displayName' attribute shall contain the value 'Additional Comments'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

            <assert test="not(cda:translation)"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']/cda:id">

            <report test="
                contains(@root, '-') and not(
                string-length(@root) = 36 and
                substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and
                substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and
                translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and
                translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and
                translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'id' tag 'root' attribute shall be a valid UUID.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:entryRelationship/cda:act[cda:code/@code = '103.16044']/cda:text">

            <report test="@xsi:type and normalize-space(@xsi:type) = ''"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'text' tag 'xsi:type' attribute shall contain a value.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

            <report test="
                @xsi:type and normalize-space(@xsi:type) != '' and 
                normalize-space(@xsi:type) != 'ST' and
                not(substring-before(normalize-space(@xsi:type), ':') != '' and
                    substring-after(normalize-space(@xsi:type), ':') = 'ST')"
                >Error: Prescription Request - 8.4 Prescription Request Item -
                "Prescription Request Item / Additional Comments" -
                The 'text' tag 'xsi:type' attribute shall contain the value 'ST'.
                Refer to section 8.4 of the
                Prescription_Request_CDA_Implementation_Guide_v0.5.</report>

        </rule>


    </pattern>

</schema>

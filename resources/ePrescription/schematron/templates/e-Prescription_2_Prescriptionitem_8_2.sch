<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 24/10/2013 10:43:39 AM

                  Product            : e-Prescription
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 8.2
                  IG Guide Title     : Prescription item
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-e-Prescription_2_Prescriptionitem_8_2-errors"
        id="p-e-Prescription_2_Prescriptionitem_8_2-errors"
        see="#p-e-Prescription_2_Prescriptionitem_8_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody">

            <assert test="cda:component[cda:section/cda:code/@code = '102.16211']"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'component' tag is missing for 'Prescription Item'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:component[cda:section/cda:code/@code = '102.16211']) > 1"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'component' tag shall appear only once for 'Prescription Item'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '102.16211']">

            <report test="count(cda:section) > 1"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'section' tag shall appear only once.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16211']">

            <report test="count(cda:code) > 1"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag shall appear only once.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="cda:title"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'title' tag is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:title) > 1"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'title' tag shall appear only once.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="not(cda:title) or normalize-space(cda:title) != ''"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'title' tag shall contain a value.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(cda:title) or normalize-space(cda:title) = '' or
                cda:title = 'Prescription Item'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'title' tag shall contain the value 'Prescription Item'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="cda:text"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'text' tag is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <report test="count(cda:text) > 1"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'text' tag shall appear only once.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</report>

            <assert test="not(cda:text) or normalize-space(cda:text) != ''"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'text' tag shall contain a value.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:code[@code = '102.16211']">

            <assert test="@codeSystem"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'codeSystem' attribute is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystem) or normalize-space(@codeSystem) = '' or @codeSystem = '1.2.36.1.2001.1001.101'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@codeSystemName"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'codeSystemName' attribute is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@codeSystemName) or normalize-space(@codeSystemName) = '' or @codeSystemName = 'NCTIS Data Components'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="@displayName"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'displayName' attribute is missing.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="
                not(@displayName) or normalize-space(@displayName) = '' or @displayName = 'Prescription Item'"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'code' tag 'displayName' attribute shall contain the value 'Prescription Item'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

            <assert test="not(cda:translation)"
                >Error: e-Prescription - 8.2 Prescription item -
                "Prescription Item" -
                The 'translation' tag shall not be present within 'code'.
                Refer to section 8.2 of the
                e-Prescription_CDA_Implementation_Guide_v0.3.</assert>

        </rule>


    </pattern>

</schema>

<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 28/01/2015 2:42:16 PM

                  Product            : PCEHR Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.1.2
                  IG Guide Title     : 7.1.2 Prescription Item Link (LINK)
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_3A_7_1_2PrescriptionItemLink_LINK_7_1_2-errors"
        id="p-PCEHR_Dispense_Record_3A_7_1_2PrescriptionItemLink_LINK_7_1_2-errors"
        see="#p-PCEHR_Dispense_Record_3A_7_1_2PrescriptionItemLink_LINK_7_1_2-errors">


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']">

            <report test="count(cda:id) > 1"
                >Error: PCEHR Dispense Record - 7.1.2 7.1.2 Prescription Item Link (LINK) -
                "Prescription Item Link (LINK) / Prescription Item Identifier (Link Target)" -
                The 'id' tag shall appear only once.
                Refer to section 7.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16210']/cda:entry/cda:substanceAdministration[@classCode = 'SBADM']/cda:id">

            <assert test="@root"
                >Error: PCEHR Dispense Record - 7.1.2 7.1.2 Prescription Item Link (LINK) -
                "Prescription Item Link (LINK) / Prescription Item Identifier (Link Target)" -
                The 'id' tag 'root' attribute is missing.
                Refer to section 7.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <assert test="not(@root) or normalize-space(@root) != ''"
                >Error: PCEHR Dispense Record - 7.1.2 7.1.2 Prescription Item Link (LINK) -
                "Prescription Item Link (LINK) / Prescription Item Identifier (Link Target)" -
                The 'id' tag 'root' attribute shall contain a value.
                Refer to section 7.1.2 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


    </pattern>

</schema>

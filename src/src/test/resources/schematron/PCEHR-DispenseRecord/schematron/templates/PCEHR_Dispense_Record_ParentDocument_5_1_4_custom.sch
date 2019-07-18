<?xml version = "1.0" encoding = "UTF-8"?>


<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom-errors"
        id="p-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom-errors"
        see="#p-PCEHR_Dispense_Record_ParentDocument_5_1_4_custom-errors">

        <!--A conformant CDA document MAY have
        relatedDocument with typeCode "APND" should be Never allowed;
        a single relatedDocument with typeCode "RPLC";
        a single relatedDocument with typeCode "XFRM";
        a combination of two relatedDocuments with typeCodes "XFRM" and "RPLC";
        No other combinations SHALL be allowed. -->

         <!-- 12/10/2012 RS - Mantis id - 4171 : APND should never be aloowed either as a combination or NOT -->

        <!-- 12/10/2012 RS - these tests were added as there is no test template for it in the SGT database -->

        <rule context="/cda:ClinicalDocument">

            <report test="count(cda:relatedDocument) > 2"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag shall appear no more than twice.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:relatedDocument[@typeCode='RPLC']) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag shall appear only once for 'RPLC'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <report test="count(cda:relatedDocument[@typeCode='XFRM']) > 1"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag shall appear only once for 'XFRM'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>

        <!-- 12/10/2012 RS - these tests were added as there is no test template for it in the SGT database -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument">

            <!-- A conformant CDA document MAY have
                 a single relatedDocument with typeCode "RPLC";
                 a single relatedDocument with typeCode "XFRM";
                 a combination of two relatedDocuments with typeCodes "XFRM" and "RPLC"; or
                 No other combinations SHALL be allowed. -->

            <assert test="
                not(@typeCode) or
                normalize-space(@typeCode) = '' or
                @typeCode = 'RPLC' or
                @typeCode = 'XFRM'"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'relatedDocument' tag 'typeCode' attribute shall contain the value 'RPLC' or 'XFRM'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- The NodeExistenceTest for 'cda:parentDocument' shall be generated by Schematron Generator Tool -->

        </rule>


        <!-- parentDocument/id/@root -->
        <!-- Clarification raised :: Mantis task - 4182 -->

        <!-- The NodeExistenceTest for 'cda:parentDocument', 'cda:parentDocument/cda:id', and
             the AttributeExistenceTest and Mandatory_AttributeEmptyTest for 'cda:parentDocument/cda:id/@root' attribute
             shall be generated by Schematron Generator Tool -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'XFRM']/cda:parentDocument/cda:id">

            <!-- If @typeCode="XFRM"; the id/@root SHALL contain an implementation specific OID -->

            <assert test="
                not(@root) or
                normalize-space(@root) = '' or
                (
                    contains(@root,'.') and
                    substring(@root, 1, 1) != '0' and
                    substring(@root, 1, 1) != '.' and
                    substring(@root, string-length(@root), 1) != '.' and
                    number(translate(@root, '0123456789.', '00000000000')) = 0
                )"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'id' tag 'root' attribute shall be a valid OID for 'XFRM' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>


            <!-- 21/11/2012 - THIS IS NOW REMOVED AS PER RPSA-215 -->
            <!-- If @typeCode="XFRM"; the id/@extension SHALL contain the Dispense item identifier of the original/parent document. -->
            <!--<assert test="
                not(@extension) or
                normalize-space(@extension) = '' or
                @extension = /cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16210']/cda:entry/cda:substanceAdministration[@classCode='SBADM']/cda:entryRelationship
                /cda:supply[@classCode='SPLY']/cda:id/@extension"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'id' tag 'extension' attribute and the value of the
                original/parent document 'DispenseId' tag 'extension' attribute shall be matched for 'XFRM' relatedDocument.
                Refer to section 5.1.4 of the PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0. </assert>
-->
        </rule>


        <!-- parentDocument/code/@code -->
       
        <!-- For all @typeCode="RPLC" or "XFRM"; This code SHALL match the value of ClinicalDocument/code. -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'XFRM']/cda:parentDocument/cda:code">

            <assert test="
                not(@code) or
                normalize-space(@code) = '' or
                @code = /cda:ClinicalDocument/cda:code/@code"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'code' tag 'code' attribute and the value of
                'ClinicalDocument/code' tag 'code' attribute shall be matched for 'XFRM' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- For all @typeCode="RPLC" or "XFRM"; This code SHALL match the value of ClinicalDocument/code. -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'RPLC']/cda:parentDocument/cda:code">

            <!-- 08/11/2012 RS :: Updated the assert below as per new IG Release -->
            <assert test="
                not(@code) or
                normalize-space(@code) = '' or
                @code = /cda:ClinicalDocument/cda:code/@code"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'code' tag 'code' attribute and the value of
                'ClinicalDocument/code' tag 'code' attribute shall be matched for 'RPLC' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

            <!-- originalText required if no @code present -->
            <report test="
                not(@code) and
                not(cda:originalText)"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'originalText' tag is missing for without code attribute present.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

            <!-- Don't use OTH at all -->
            <report test="
                @nullFlavor and
                @nullFlavor = 'OTH'"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The 'code' tag 'nullFlavor' attribute shall not contain the value 'OTH'.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</report>

        </rule>


        <!-- parentDocument/setId/@root -->

        <!--If @typeCode="RPLC"; the setId SHALL match the setId of the current document.
            If @typeCode="XFRM"; the setId SHALL contain a new value for setId.
        -->

        <!-- The NodeExistenceTest for 'cda:parentDocument'
             the AttributeExistenceTest and AttributeEmptyTest and UdidFormatTest for 'cda:parentDocument/cda:setId/@root' attribute
             shall be generated by Schematron Generator Tool -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'RPLC']/cda:parentDocument/cda:setId">

            <!--If @typeCode="RPLC"; the setId SHALL match the setId of the current document. -->

            <assert test="
                not(@root) or
                normalize-space(@root) = '' or
                @root = /cda:ClinicalDocument/cda:setId/@root"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'setId' tag 'code' attribute and the value of
                'ClinicalDocument/setId' tag 'code' attribute shall be matched for 'RPLC' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'XFRM']/cda:parentDocument/cda:setId">

            <!-- If @typeCode="XFRM"; the setId SHALL contain a new value for setId. -->

            <assert test="
                not(@root) or
                normalize-space(@root) = '' or
                @root != /cda:ClinicalDocument/cda:setId/@root"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'setId' tag 'root' attribute and the value of
                'ClinicalDocument/setId' tag 'root' attribute shall be different for 'XFRM' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>


        <!-- relatedDocument/parentDocument/versionNumber-->
        <!-- Clarification raised :: Mantis task - 4180 -->

        <!-- If @typeCode="RPLC"; the ClinicalDocument/versionNumber SHALL contain an incremented value of this
        versionNumber. -->

        <rule context="/cda:ClinicalDocument/cda:relatedDocument[@typeCode = 'RPLC']/cda:parentDocument/cda:versionNumber">

            <!-- If @typeCode="RPLC"; the ClinicalDocument/versionNumber SHALL contain an incremented value of this versionNumber. -->

            <assert test="
                not(@value) or
                normalize-space(@value) = '' or
                @value+1 = /cda:ClinicalDocument/cda:versionNumber/@value"
                >Error: PCEHR Dispense Record - 5.1.4 ParentDocument -
                "relatedDocument" -
                The value of 'versionNumber' tag 'value' attribute shall be
                an incremented value of 'parentDocument/versionNumber' tag 'value' attribute for 'RPLC' relatedDocument.
                Refer to section 5.1.4 of the
                PCEHR_Dispense_Record_CDA_Implementation_Guide_v1.0.</assert>

        </rule>

    </pattern>

</schema>
